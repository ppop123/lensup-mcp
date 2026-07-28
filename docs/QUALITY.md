# Quality

## Required checks

`bash scripts/verify.sh` validates:

- required repository files;
- JSON syntax and registry metadata fields;
- the canonical server name and Streamable HTTP endpoint;
- the documented LensUp links.

`bash scripts/smoke.sh` validates:

- the live metadata and catalog endpoints;
- an MCP `initialize` request;
- the live `tools/list` response;
- the discovery-only privacy boundary.

## Documentation standard

Every capability statement must be traceable to the live server metadata,
catalog, tool schema, or a successful smoke response. Do not add aspirational
features to public documentation.
