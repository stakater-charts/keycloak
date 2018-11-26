{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "keycloak.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "keycloak.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "keycloak.labels.selector" -}}
app: {{ template "keycloak.name" . }}
group: {{ .Values.keycloak.labels.group }}
provider: {{ .Values.keycloak.labels.provider }}
{{- end -}}

{{- define "keycloak.labels.stakater" -}}
{{ template "keycloak.labels.selector" . }}
version: "{{ .Values.keycloak.labels.version }}"
{{- end -}}

{{- define "keycloak.labels.chart" -}}
chart: "{{ .Chart.Name }}-{{ .Chart.Version }}"
release: {{ .Release.Name | quote }}
heritage: {{ .Release.Service | quote }}
{{- end -}}
