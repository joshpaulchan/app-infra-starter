# App Infra Starter

This repo contains IaC packaging and bootstrapping manifests to provide:

1. a simple, drop-in starter for applications into k8s + helm environments
2. an easy way to make changes to those shells in the future.
3. pre-packaged CI steps that work with different languages.

## Helm

This repo contains the helm manifests that you can

It's recommended to use this helm chart with different values per environment, under a `values` file.

See [docs](./docs) for more info.