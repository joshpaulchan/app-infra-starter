echo "building chart"
gcloud auth print-access-token | helm registry login -u oauth2accesstoken --password-stdin https://us-central1-docker.pkg.dev
helm package helm/

echo "pushing"
helm push app-infra-starter-*.tgz oci://us-central1-docker.pkg.dev/joshpaulchan/helm-repo
helm registry logout https://us-central1-docker.pkg.dev

echo "cleaning up dir"
rm app-infra-starter-*.tgz