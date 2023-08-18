# charts

helm devops charts

## Chart Details

## Packing the Chart

```bash
helm package ./devops/hadoop/ ./devops/hadoop-ha/ -d ./docs
helm repo index ./docs --url https://lancelotzhu.github.io/charts/
```
