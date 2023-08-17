# charts

helm devops charts

## Chart Details

## Packing the Chart

```bash
cd docs
helm pakcage ../devops/hadoop/
helm package ../devops/hadoop-ha/
helm repo index . --url https://lancelotzhu.github.io/charts/
```
