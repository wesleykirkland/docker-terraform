FROM debian:bookworm-slim

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        bash \
        ca-certificates \
        curl \
        git \
        jq \
        libatomic1 \
        unzip \
    && rm -rf /var/lib/apt/lists/*

ENV MISE_DATA_DIR="/mise" \
    MISE_CONFIG_DIR="/mise" \
    MISE_CACHE_DIR="/mise/cache" \
    MISE_INSTALL_PATH="/usr/local/bin/mise" \
    PATH="/mise/shims:${PATH}"

RUN mkdir -p "${MISE_CONFIG_DIR}" "${MISE_CACHE_DIR}"

COPY mise.toml /mise/config.toml

RUN curl https://mise.run | sh \
    && mise install \
    && mise cache prune --yes

ENTRYPOINT ["/bin/sh"]
