# lensup-mcp Task Plan

## Goal

Publish a trustworthy public metadata, documentation, and issue-tracking
repository for the LensUp remote MCP server without exposing production source.

## Phases

- [x] Phase 1: Confirm the public metadata repository boundary
- [x] Phase 2: Verify the live MCP endpoint, metadata, catalog, and legal links
- [x] Phase 3: Add public documentation, metadata, contribution paths, and checks
- [x] Phase 4: Run local and live verification
- [x] Phase 5: Create the public GitHub repository and push `main`

## Decisions

- Keep the production server implementation private.
- Use this repository as the public integration, directory-submission, and issue
  tracking home.
- State that the MCP is discovery-only and never imply that it processes files.
- Treat the live MCP schemas and catalog as authoritative.

## Errors Encountered

- `https://lensup.ai/mcp/` returned HTTP 404 during initial verification. The
  repository therefore links to the live MCP subdomain and existing LensUp
  legal/about/contact pages instead of claiming that a website MCP page exists.
- The first documentation patch expected a different generated
  `ARCHITECTURE.md` template and was rejected atomically. The patch was split
  against the actual scaffold; no partial changes were retained.
- The installed Codex CLI rejected the documented
  `codex review --uncommitted "prompt"` argument order. Retried with the prompt
  before `--uncommitted`, as accepted by this CLI version.
- The CLI also rejected combining a positional review prompt with
  `--uncommitted` in the reverse order. Continued with its supported
  `codex review --uncommitted` form and the default review rubric.
- Two supported-form Codex review invocations initialized the reviewer but did
  not return findings because the nested CLI encountered stale plugin
  authorization and model-cache errors. Publication therefore relies on the
  repository's deterministic checks plus direct diff inspection; no clean
  automated-review claim is made.
