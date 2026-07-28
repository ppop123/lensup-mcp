#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$repo_root"

tmp_dir="$(mktemp -d)"
trap 'rm -rf "$tmp_dir"' EXIT

curl --fail --silent --show-error \
  https://mcp.lensup.ai/server.json \
  --output "$tmp_dir/server.json"

curl --fail --silent --show-error \
  https://mcp.lensup.ai/catalog.json \
  --output "$tmp_dir/catalog.json"

curl --fail --silent --show-error \
  --request POST \
  --header 'Content-Type: application/json' \
  --header 'Accept: application/json, text/event-stream' \
  --data '{"jsonrpc":"2.0","id":1,"method":"initialize","params":{"protocolVersion":"2025-06-18","capabilities":{},"clientInfo":{"name":"lensup-mcp-smoke","version":"1.0.0"}}}' \
  https://mcp.lensup.ai/mcp \
  --output "$tmp_dir/initialize.json"

curl --fail --silent --show-error \
  --request POST \
  --header 'Content-Type: application/json' \
  --header 'Accept: application/json, text/event-stream' \
  --data '{"jsonrpc":"2.0","id":2,"method":"tools/list","params":{}}' \
  https://mcp.lensup.ai/mcp \
  --output "$tmp_dir/tools.json"

python3 - "$tmp_dir" <<'PY'
import json
import sys
from pathlib import Path

root = Path(sys.argv[1])
server = json.loads((root / "server.json").read_text())
catalog = json.loads((root / "catalog.json").read_text())
initialize = json.loads((root / "initialize.json").read_text())
tools_response = json.loads((root / "tools.json").read_text())

assert server["name"] == "ai.lensup/browser-tools"
assert server["remotes"] == [
    {"type": "streamable-http", "url": "https://mcp.lensup.ai/mcp"}
]
assert catalog["browser_local"] is True
assert catalog["mcp_processes_files"] is False
assert initialize["result"]["protocolVersion"] == "2025-06-18"

tools = {tool["name"]: tool for tool in tools_response["result"]["tools"]}
assert set(tools) == {"search_lensup_tools", "get_lensup_tool"}
for tool in tools.values():
    properties = tool["inputSchema"].get("properties", {})
    assert "file" not in properties
    assert "url" not in properties

print("Live LensUp MCP smoke check passed.")
PY
