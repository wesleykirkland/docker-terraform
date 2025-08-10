# Golden [Open/Terra]form docker image along with Precommit

This repo contains the elements for the base Fortellar base Docker container used for deploying Terraform and validating it.

Currently it supports the following

1. OpenTofu
1. Terraform
1. TFLint
1. PreCommit
1. AWS CLI v2

## Release
All tagged releases will create a docker image, and stable releases according to [symver](https://semver.org/) will co-release to `latest`

### Schedule
This image will auto release on a monthly basis to include patch releases from the latest stable releases of dependencies, please version pin accordingly

Container Image: ghcr.io/wesleykirkland/docker-terraform
