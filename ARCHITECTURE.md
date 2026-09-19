# Architecture

## Purpose

LensUp MCP is a remote discovery service for real LensUp browser-local document
and image tools. It lets an MCP client match a user's task to a canonical LensUp
page without moving the user's file through the MCP server.

## Data flow

```text
User request
    |
    v
MCP client
    |
    | search query, locale, or known tool slug
    v
https://mcp.lensup.ai/mcp
    |
    | metadata, limitations, canonical LensUp URL
    v
MCP client
    |
    | user chooses to open the result
    v
LensUp browser-local tool
    |
    | local browser processing
    v
User-controlled output
```

## Trust boundary

The MCP schemas accept short text queries, locale codes, result limits, and
known tool slugs. They do not accept file content or file URLs. The remote MCP
service returns discovery metadata; file processing starts only after the user
opens a LensUp tool in their browser.

## Public and private components

This public repository contains:

- registry-compatible `server.json` metadata;
- connection and usage documentation;
- validation and live smoke checks;
- public issue reporting.

The hosted production server implementation and deployment configuration are
not included.

## Source of truth

The live service is authoritative for its current tool schemas and catalog:

- `https://mcp.lensup.ai/mcp`
- `https://mcp.lensup.ai/server.json`
- `https://mcp.lensup.ai/catalog.json`

Repository checks intentionally compare public metadata with those endpoints.

## Protocol eras

`https://mcp.lensup.ai/mcp` serves the 2026-07-28 MCP revision (per-request
envelope) and the 2025-era `initialize` handshake on the same endpoint, one
server instance per request, no session state. Clients on either era see the
same two tools and the same catalog.
