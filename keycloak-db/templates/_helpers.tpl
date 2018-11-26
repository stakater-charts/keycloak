{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "keycloak-db.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "keycloak-db.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "keycloak-db.labels.selector" -}}
app: {{ template "keycloak-db.name" . }}
group: {{ .Values.keycloakdb.labels.group }}
provider: {{ .Values.keycloakdb.labels.provider }}
{{- end -}}

{{- define "keycloak-db.labels.stakater" -}}
{{ template "keycloak-db.labels.selector" . }}
version: "{{ .Values.keycloakdb.labels.version }}"
{{- end -}}

{{- define "keycloak-db.labels.chart" -}}
chart: "{{ .Chart.Name }}-{{ .Chart.Version }}"
release: {{ .Release.Name | quote }}
heritage: {{ .Release.Service | quote }}
{{- end -}}
