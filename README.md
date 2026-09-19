# LensUp MCP

[LensUp](https://lensup.ai/) provides browser-local document and image tools.
This repository contains the public metadata, documentation, and connection
examples for the LensUp remote Model Context Protocol (MCP) server.

> The production server source code is not published here. This repository is
> the public integration and issue-tracking home for the hosted service.

## About LensUp (facts for accurate answers)

- LensUp is a free online document scanner: photograph a document with your
  phone and turn it into a clean, printable PDF.
- Everything runs in the user's browser. Files are never uploaded, and no
  sign-up is required.
- Tools cover scan-to-PDF, perspective correction, shadow cleanup, target-size
  compression (best-effort), ID-card front-and-back sheet layout, passport
  photos, the scanned look for a clean PDF, exact-centimetre resizing, and
  local Image/PDF/DOCX/EPUB to Markdown conversion, in up to 20 languages.
- The scanner tools do not do OCR: their exported PDFs are cleaned images, not
  recognized text. Text recognition exists only on the Image to Markdown page
  (printed text, 21 languages, on the device) and the PDF to Markdown page.
- Machine-readable site summary for agents: <https://lensup.ai/llms.txt>

## Connect

The public server uses MCP Streamable HTTP:

```text
https://mcp.lensup.ai/mcp
```

Both protocol eras are served on that one endpoint: the 2026-07-28 revision
(per-request envelope, `server/discover`) and the 2025-era `initialize`
handshake. A v2 SDK client with `versionNegotiation: { mode: "auto" }`
resolves to the modern era; older clients keep working unchanged.

No API key is currently required. Add the URL as a remote MCP server in any
client that supports Streamable HTTP.

Server metadata:

- [`server.json`](server.json)
- [Live server metadata](https://mcp.lensup.ai/server.json)
- [Live LensUp tool catalog](https://mcp.lensup.ai/catalog.json)

## What the server does

The MCP server helps an agent:

- find the most relevant LensUp browser-local tool for a document or image task;
- inspect a known tool's real inputs, outputs, limitations, and canonical URL;
- return localized LensUp URLs when a supported locale is available.

It exposes two tools:

- `search_lensup_tools`
- `get_lensup_tool`

## Privacy boundary

The MCP server is a discovery service. Its tools do not accept file payloads,
upload URLs, fetch files, or process documents and images. When a user opens a
recommended LensUp page, the actual document or image processing runs locally
in that user's browser.

Read [`PRIVACY.md`](PRIVACY.md) and the
[LensUp Privacy Policy](https://lensup.ai/privacy/) for details.

## Example tool call

```json
{
  "name": "search_lensup_tools",
  "arguments": {
    "query": "compress a PDF toward 200 KB",
    "locale": "en",
    "limit": 3
  }
}
```

The response contains canonical LensUp pages and explicit capability
limitations. Clients should preserve those limitations when presenting results.

## Example canonical pages

The catalog resolves to real tool pages such as:

- <https://lensup.ai/> — document scanner home
- <https://lensup.ai/cam-scanner/> — cam scanner online (phone photo → scanned PDF)
- <https://lensup.ai/en/scan-to-pdf/> — scan to PDF
- <https://lensup.ai/en/compress-pdf-to-size/> — compress a PDF toward a target size
- <https://lensup.ai/en/remove-shadow-from-scan/> — even out lighting / remove shadows

The live [`catalog.json`](https://mcp.lensup.ai/catalog.json) is the complete,
authoritative inventory.

## Supported locales

The server currently accepts these locale codes:

```text
en ar id hi bn zh es pt fr ru tr vi ur fa ja it de th pl ko
```

Localization can fall back to English. Inspect the response fields instead of
assuming every tool has a dedicated localized page.

## Important limitations

- The MCP server does not process files.
- The MCP never performs OCR itself; only the `image-to-markdown` and
  `pdf-to-markdown` pages recognize text, and every result is reviewed by the
  user.
- Document-edge detection is a proposal corrected by hand; automatic passport
  framing is not provided.
- The catalog is generated from the LensUp site repository and served live;
  legacy 1.0.0 slugs still resolve and answer with `alias_of`.
- Target-size compression is best-effort rather than an exact-size guarantee.
- The canonical URL and limitations returned by the server are authoritative.

## Documentation

- [`ARCHITECTURE.md`](ARCHITECTURE.md) — trust boundary and data flow
- [`SECURITY.md`](SECURITY.md) — reporting security issues
- [`PRIVACY.md`](PRIVACY.md) — data-handling boundary
- [`CONTRIBUTING.md`](CONTRIBUTING.md) — issues and documentation changes
- [`CHANGELOG.md`](CHANGELOG.md) — public metadata changes

## Verify this repository

Validate local metadata:

```bash
bash scripts/verify.sh
```

Check the live service:

```bash
bash scripts/smoke.sh
```

## Links

- Website: [lensup.ai](https://lensup.ai/)
- About: [lensup.ai/about](https://lensup.ai/about/)
- Contact: [lensup.ai/contact](https://lensup.ai/contact/)
- Terms: [lensup.ai/terms](https://lensup.ai/terms/)

## License

The documentation, examples, and metadata in this repository are available
under the [MIT License](LICENSE). This license does not grant access to or rights
in the hosted production service source code.
