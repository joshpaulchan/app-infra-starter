echo "setting vars"
export DRONE_DEPLOY_TO="staging"
export RELEASE_NAME=feature-extracted-helm-chart
export CLUSTER="universe-616"
export ZONE="us-east1-b"
export NAMESPACE="default"

echo "testing"
helm secrets upgrade $RELEASE_NAME \
    oci://us-central1-docker.pkg.dev/joshpaulchan/helm-repo/app-infra-starter \
    --version 0.1.0 \
    --atomic \
    --cleanup-on-fail \
    --install \
    -n $NAMESPACE \
    -f ../pantheon-api/infra/helm/values.yaml \
    -f ../pantheon-api/infra/helm/values/$DRONE_DEPLOY_TO.yaml \
    -f ../pantheon-api/infra/helm/secrets/$DRONE_DEPLOY_TO.yaml \
    --debug \
    --dry-run \
    --set image.tag=$(cat ../pantheon-api/.ci/.tags)