# Privacy

## MCP data boundary

The LensUp MCP service is used to discover LensUp tools. Its public tool schemas
accept:

- a short text query;
- a locale code;
- a result limit;
- or a known LensUp tool slug.

They do not accept document or image payloads, file URLs, or upload references.
The MCP service does not fetch or process user files.

## Browser-local processing

If a user follows a canonical LensUp URL returned by the service, document and
image processing is performed by that LensUp page in the user's browser.

## Service metadata

As with other web services, hosting and security infrastructure may process
ordinary request metadata needed to deliver and protect the endpoint. The
[LensUp Privacy Policy](https://lensup.ai/privacy/) governs the hosted service.

Do not send sensitive personal information in discovery queries.
