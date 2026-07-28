#!/usr/bin/env python3
from __future__ import annotations

import json
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent

required_files = [
    "README.md",
    "ARCHITECTURE.md",
    "PRIVACY.md",
    "SECURITY.md",
    "CONTRIBUTING.md",
    "CHANGELOG.md",
    "LICENSE",
    "server.json",
]

missing = [name for name in required_files if not (ROOT / name).is_file()]
if missing:
    raise SystemExit(f"Missing public repository files: {', '.join(missing)}")

metadata = json.loads((ROOT / "server.json").read_text(encoding="utf-8"))

expected_remote = {
    "type": "streamable-http",
    "url": "https://mcp.lensup.ai/mcp",
}

assert metadata["name"] == "ai.lensup/browser-tools"
assert metadata["websiteUrl"] == "https://lensup.ai"
assert metadata["remotes"] == [expected_remote]

readme = (ROOT / "README.md").read_text(encoding="utf-8")
for required_text in [
    "https://lensup.ai/",
    "https://mcp.lensup.ai/mcp",
    "search_lensup_tools",
    "get_lensup_tool",
    "does not process files",
]:
    assert required_text in readme, f"README is missing: {required_text}"

print("Local LensUp MCP metadata validation passed.")
