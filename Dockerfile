FROM ghcr.io/astral-sh/uv:alpine

ENV PATH=$PATH:/root/.local/bin
ENV UV_INDEX_URL=https://mirrors.tuna.tsinghua.edu.cn/pypi/web/simple
ENV UV_NO_CACHE=0

RUN uv tool install mcp-proxy -i https://mirrors.tuna.tsinghua.edu.cn/pypi/web/simple

CMD ["mcp-proxy", "--sse-port", "8080", "--sse-host", "0.0.0.0", "--allow-origin", "*", "--pass-environment", "--", "uvx", "mcp-server-time", "--local-timezone=Asia/Shanghai"]
