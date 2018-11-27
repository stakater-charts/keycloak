{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "keycloak-db-storage.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "keycloak-db-storage.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "keycloak-db-storage.labels.selector" -}}
app: {{ template "keycloak-db-storage.name" . }}
group: {{ .Values.keycloakdbstorage.labels.group }}
provider: {{ .Values.keycloakdbstorage.labels.provider }}
{{- end -}}

{{- define "keycloak-db-storage.labels.stakater" -}}
{{ template "keycloak-db-storage.labels.selector" . }}
version: {{ .Values.keycloakdbstorage.labels.version }}
{{- end -}}

{{- define "keycloak-db-storage.labels.chart" -}}
chart: "{{ .Chart.Name }}-{{ .Chart.Version }}"
release: {{ .Release.Name | quote }}
heritage: {{ .Release.Service | quote }}
{{- end -}}
