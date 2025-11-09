# mcp-proxy.Dockerfile
FROM ghcr.io/sparfenyuk/mcp-proxy:latest

# install uvx for Python based MCP servers
RUN python3 -m ensurepip && pip install --no-cache-dir uv

# install npx for Javascript based MCP servers
RUN apk add --no-cache nodejs npm

ENV PATH="/usr/local/bin:$PATH" \
    UV_PYTHON_PREFERENCE=only-system

ENTRYPOINT ["catatonit", "--", "mcp-proxy"]
