# Contributing

## Issues

Public GitHub issues are welcome for:

- incorrect or outdated tool metadata;
- broken canonical LensUp links;
- MCP client compatibility reports;
- documentation improvements;
- feature requests about discovery behavior.

Never attach identity documents, personal photographs, private files, access
tokens, or API keys.

## Documentation changes

Keep capability claims aligned with the live MCP tool schemas and catalog. Run:

```bash
bash scripts/verify.sh
bash scripts/smoke.sh
```

before proposing a documentation or metadata change.

Security vulnerabilities must follow [`SECURITY.md`](SECURITY.md).
