FROM ghcr.io/astral-sh/uv:python3.14-alpine AS docbuilder

WORKDIR /appdocs

COPY mkdocs.yml .
COPY docs ./docs
COPY src ./src

RUN uv pip install --no-cache-dir -r ./docs/requirements.txt --system && \
    zensical build

FROM ghcr.io/astral-sh/uv:python3.14-alpine

COPY src /app
COPY --from=docbuilder /appdocs/site /app/docs

WORKDIR /app

RUN addgroup -g 2000 jumpgroup && adduser -S -u 1001 -G jumpgroup jumpstart && \
    uv pip install --no-cache-dir -r requirements.txt --system && rm requirements.txt

USER jumpstart

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000", "--log-config", "/app/logging_config.yaml", "--proxy-headers", "--forwarded-allow-ips", "*"]
