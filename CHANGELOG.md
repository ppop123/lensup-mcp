# Changelog

All notable public metadata and documentation changes are recorded here.

## 1.2.0 - 2026-09-19

- The server now runs on the v2 TypeScript SDK and serves the 2026-07-28
  protocol revision next to the 2025-era `initialize` handshake on the same
  `https://mcp.lensup.ai/mcp` endpoint. Tool names, the endpoint and the
  discovery-only boundary are unchanged.
- `server.json` version 1.2.0.

## 1.1.0 - 2026-09-19

- The live catalog is now generated from the LensUp site repository instead of
  being hand-written: 28 entries (six localized scanner tools, four English
  landing pages, passport photo, PDF to scanned PDF, Image/PDF/DOCX/EPUB to
  Markdown, two English image tools, ten size guides) with per-locale routes.
- Corrected the capability boundary: OCR exists on `image-to-markdown` and
  `pdf-to-markdown`; the scanner tools remain "no OCR"; edge detection is a
  hand-corrected proposal.
- Search understands localized copy (`locale` steers ranking), compound
  spellings such as `camscanner`, and plurals. Results carry `family`,
  `localized_title`, `available_locales` and, for size guides, `preset`.
- Legacy slugs (`even-out-lighting`, `fade-coloured-pen`,
  `compress-to-file-size`, `increase-image-file-size`) resolve through
  `get_lensup_tool` with `alias_of`.
- Server version 1.1.0; tool names and the Streamable HTTP endpoint are
  unchanged.

## 1.0.1 - 2026-08-29

- Added a LensUp product facts section for agent and answer-engine consumers.
- Linked the machine-readable site summary at <https://lensup.ai/llms.txt>.
- Listed example canonical tool pages resolved by the live catalog.
- No endpoint, tool, or metadata contract changes.

## 1.0.0 - 2026-07-29

- Published registry-compatible metadata for `ai.lensup/browser-tools`.
- Documented the public Streamable HTTP endpoint.
- Documented `search_lensup_tools` and `get_lensup_tool`.
- Documented the discovery-only privacy boundary.
- Added local validation and live MCP smoke checks.
