FROM alpine:latest

# Install dependencies
RUN apk add --no-cache \
    curl \
    unzip \
    git \
    bash \
    python3 \
    pipx \
    py3-pip \
    npm \
    jq \
    aws-cli

# Install Terraform (latest)
RUN LATEST_TF=$(curl -s https://releases.hashicorp.com/terraform/ | grep -Eo 'terraform/[0-9.]+/' | head -1 | cut -d'/' -f2) && \
    curl -Lo terraform.zip https://releases.hashicorp.com/terraform/${LATEST_TF}/terraform_${LATEST_TF}_linux_amd64.zip && \
    unzip terraform.zip && \
    mv terraform /usr/local/bin/ && \
    rm terraform.zip

# Install OpenTofu (latest)
RUN LATEST_TOFU=$(curl -s https://api.github.com/repos/opentofu/opentofu/releases/latest | grep tag_name | cut -d '"' -f4 | sed 's/v//') && \
    curl -Lo tofu.zip https://github.com/opentofu/opentofu/releases/download/v${LATEST_TOFU}/tofu_${LATEST_TOFU}_linux_amd64.zip && \
    unzip tofu.zip && \
    mv tofu /usr/local/bin/ && \
    rm tofu.zip

# Install tflint (latest)
RUN LATEST_TFLINT=$(curl -s https://api.github.com/repos/terraform-linters/tflint/releases/latest | grep tag_name | cut -d '"' -f4 | sed 's/v//') && \
    curl -Lo tflint.zip https://github.com/terraform-linters/tflint/releases/download/v${LATEST_TFLINT}/tflint_linux_amd64.zip && \
    unzip tflint.zip && \
    mv tflint /usr/local/bin/ && \
    rm tflint.zip

# Install pre-commit - PEP 668 compliant
RUN pipx install pre-commit

# Ensure pipx-installed binaries are in PATH
ENV PATH="/root/.local/bin:${PATH}"

ENTRYPOINT ["/bin/sh"]
