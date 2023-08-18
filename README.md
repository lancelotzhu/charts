# charts

helm devops charts

## Chart Details

## Packing the Chart

```bash
helm package ./devops/*/ -d ./docs
helm repo index ./docs --url https://lancelotzhu.github.io/charts/
```
