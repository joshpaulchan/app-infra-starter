# How-To: Release a New Version of the Chart

## Automatically

Presumes you have repository setup + gcloud is authenticated.

```
./releash.sh
```

## Manually

1. create repo (if it doesn't exist)

```sh
gcloud artifacts repositories list
gcloud artifacts repositories create helm-repo --repository-format=docker --location=us-central1 --description="Helm repository"
```

2. auth

```sh
gcloud auth print-access-token | helm registry login -u oauth2accesstoken --password-stdin https://us-central1-docker.pkg.dev
```

3. package & push

```sh
helm package helm/ # drops into dir chartname-chartversion.tgz
# push
helm push app-infra-starter-0.1.0.tgz oci://us-central1-docker.pkg.dev/joshpaulchan/helm-repo
```


