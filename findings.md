# lensup-mcp Findings

## Product Findings

- GitHub owner: `ppop123`.
- Public repository name: `lensup-mcp`.
- The repository is metadata and documentation only; hosted service source code
  remains private.

## Architecture Findings

- Live endpoint: `https://mcp.lensup.ai/mcp`.
- Transport: MCP Streamable HTTP.
- Protocol initialization negotiated `2025-06-18`.
- Server name/version returned by initialization:
  `lensup-browser-tools` / `1.0.0`.
- Exposed tools: `search_lensup_tools` and `get_lensup_tool`.
- Tool schemas accept text discovery parameters only and do not accept files or
  file URLs.
- Live metadata name: `ai.lensup/browser-tools`.
- Live catalog reports `browser_local: true` and
  `mcp_processes_files: false`.

## Environment Findings

- GitHub CLI `2.86.0` is installed.
- GitHub CLI is authenticated as `ppop123` with repository scope.
- LensUp privacy, terms, about, and contact pages returned HTTP 200.
- `https://lensup.ai/mcp/` returned HTTP 404, so it is not used as a public
  documentation link.
