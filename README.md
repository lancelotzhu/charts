# charts

helm devops charts

## Chart Details

## Packing the Chart

```bash
cd docs
helm package ../devops/*/
helm repo index . --url https://lancelotzhu.github.io/charts/
```
