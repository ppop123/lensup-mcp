# LensUp MCP

[LensUp](https://lensup.ai/) provides browser-local document and image tools.
This repository contains the public metadata, documentation, and connection
examples for the LensUp remote Model Context Protocol (MCP) server.

> The production server source code is not published here. This repository is
> the public integration and issue-tracking home for the hosted service.

## Connect

The public server uses MCP Streamable HTTP:

```text
https://mcp.lensup.ai/mcp
```

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

## Supported locales

The server currently accepts these locale codes:

```text
en ar id hi bn zh es pt fr ru tr vi ur fa ja it de th pl ko
```

Localization can fall back to English. Inspect the response fields instead of
assuming every tool has a dedicated localized page.

## Important limitations

- The MCP server does not process files.
- LensUp does not provide OCR through this MCP service.
- Do not claim automatic document-edge detection or automatic passport framing.
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
