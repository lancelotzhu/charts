# Hadoop Chart

This chart is modified from [pfisterer/apache-hadoop-helm](https://github.com/pfisterer/apache-hadoop-helm) and has been updated to:

- supprot hadoop high availability cluster.
- upgrade hadoop version from 3.3.2 to 3.3.6.

## Chart Details

## Installing the Chart

To install the chart with the release name `hadoop-ha`:

```bash
helm repo add lancelotzhu https://lancelotzhu.github.io/charts/
helm install hadoop-ha lancelotzhu/hadoop-ha
```

## Configuration

The following table lists the configurable parameters of the Hadoop chart and their default values.

| Parameter                              | Description                                                    | Default                                                           |
| -------------------------------------- | -------------------------------------------------------------- | ----------------------------------------------------------------- |
| `image.repository`                     | Hadoop image                                                   | `lancelotzhu/hadoop`                                           |
| `image.tag`                            | Hadoop image tag                                               | `3.3.6`                                                           |
| `imagee.pullPolicy`                    | Pull policy for the images                                     | `Always`                                                    |
| `hadoopVersion`                        | Version of hadoop libraries being used                         | `3.3.6`                                                           |
| `antiAffinity`                         | Pod antiaffinity, `hard` or `soft`                             | `hard`                                                            |
| `hdfs.nameNode.replicas`               | Number of HDFS NameNode replicas                               | `3`                                                               |
| `hdfs.nameNode.pdbMinAvailable`        | PDB for HDFS NameNode                                          | `1`                                                               |
| `hdfs.nameNode.resources`              | resources for the HDFS NameNode                                | `requests:memory=256Mi,cpu=10m,limits:memory=2048Mi,cpu=1000m`    |
| `hdfs.dataNode.replicas`               | Number of HDFS DataNode replicas                               | `3`                                                               |
| `hdfs.dataNode.pdbMinAvailable`        | PDB for HDFS DataNode                                          | `1`                                                               |
| `hdfs.dataNode.resources`              | resources for the HDFS DataNode                                | `requests:memory=256Mi,cpu=10m,limits:memory=2048Mi,cpu=1000m`    |
| `hdfs.webhdfs.enabled`                 | Enable WebHDFS REST API                                        | `true`                                                            |
| `yarn.resourceManager.pdbMinAvailable` | PDB for the YARN ResourceManager                               | `1`                                                               |
| `yarn.resourceManager.replicas`        | Number of YARN ResourceManager replicas                        | `3`                                                               |
| `yarn.resourceManager.resources`       | resources for the YARN ResourceManager                         | `requests:memory=256Mi,cpu=10m,limits:memory=2048Mi,cpu=1000m`    |
| `yarn.nodeManager.pdbMinAvailable`     | PDB for the YARN NodeManager                                   | `1`                                                               |
| `yarn.nodeManager.replicas`            | Number of YARN NodeManager replicas                            | `3`                                                               |
| `yarn.nodeManager.parallelCreate`      | Create all nodeManager statefulset pods in parallel (K8S 1.7+) | `false`                                                           |
| `yarn.nodeManager.resources`           | Resource limits and requests for YARN NodeManager pods         | `requests:memory=2048Mi,cpu=1000m,limits:memory=2048Mi,cpu=1000m` |
| `persistence.nameNode.enabled`         | Enable/disable persistent volume                               | `false`                                                           |
| `persistence.nameNode.storageClass`    | Name of the StorageClass to use per your volume provider       | `-`                                                               |
| `persistence.nameNode.accessMode`      | Access mode for the volume                                     | `ReadWriteOnce`                                                   |
| `persistence.nameNode.size`            | Size of the volume                                             | `50Gi`                                                            |
| `persistence.dataNode.enabled`         | Enable/disable persistent volume                               | `false`                                                           |
| `persistence.dataNode.storageClass`    | Name of the StorageClass to use per your volume provider       | `-`                                                               |
| `persistence.dataNode.accessMode`      | Access mode for the volume                                     | `ReadWriteOnce`                                                   |
| `persistence.dataNode.size`            | Size of the volume                                             | `200Gi`                                                           |


---

## Customized Hadoop Base Docker Image

This image is modified from [pfisterer/apache-hadoop-helm](https://github.com/pfisterer/apache-hadoop-helm). Currently, native libraries are not been included.

### Build and Push the Docker Image

```bash
# Set version
HADOOP_VERSION=3.3.6

# Build
docker buildx build --push --platform "linux/arm64,linux/amd64" -t lancelotzhu/hadoop-ha:latest -t lancelotzhu/hadoop-ha:$HADOOP_VERSION .
```

---

## Changes

Version 1.0.0

- Initial release of this chart
- Use multi-architecture base image
- Apache Hadoop 3.3.6
