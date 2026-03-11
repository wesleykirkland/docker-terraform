# Debian bookworm-slim [Open/Terra]form image with mise

This repo builds the base Fortellar container image used for Terraform and OpenTofu workflows.

The image now uses `debian:bookworm-slim` and installs its managed CLI tooling through `mise-en-place` from the repo's `mise.toml`.

## Release

All tagged releases will create a docker image, and stable releases according to [symver](https://semver.org/) will co-release to `latest`

### Schedule

This image auto-releases on a monthly basis to pick up the latest stable tool releases defined through `mise`, so please version-pin accordingly.

Container Image: `ghcr.io/wesleykirkland/docker-terraform`
