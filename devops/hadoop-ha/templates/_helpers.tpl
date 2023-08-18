{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "hadoop.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "hadoop.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "hadoop.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "dfs.ha.namenodes.cluster" -}}
{{- $nameNodeReplicaCount := int .Values.hdfs.nameNode.replicas -}}
{{- $max := $nameNodeReplicaCount-1 -}}
{{- range $i := until $nameNodeReplicaCount -}}
{{- if $i eq max -}}
{{- printf "nn%d" $i  -}}
{{- else -}}
{{- printf "nn%d," $i  -}}
{{- end -}}
{{- end -}}
{{- end -}}
