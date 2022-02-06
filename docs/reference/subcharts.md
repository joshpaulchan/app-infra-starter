# Reference: SubCharts


We package bitnami Redis + Postgres in the chart to make it easier to start a new project.

You can find the versions used in `Chart.yaml`.

You can look up the particular config:
- https://github.com/bitnami/charts/tree/master/bitnami/redis/
- https://github.com/bitnami/charts/tree/master/bitnami/postgresql/

Credential injection is done here by injecting the values into the config being passed to the application.

## Persistence

Also might have some PVs/ PVCs sticking around. Find and delete them:

```
kubectl delete pvc -l app.kubernetes.io/instance=feature-extracted-helm-chart
```