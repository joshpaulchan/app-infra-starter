{{/*
Expand the name of the application.
*/}}
{{- define "app-infra-starter.name" -}}
{{- default .Release.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "app-infra-starter.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-"  -}}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "app-infra-starter.selectorLabels" -}}
app.kubernetes.io/name: {{ include "app-infra-starter.name" . }}
app.kubernetes.io/component: {{ default "app" .Values.component | quote }}
app.kubernetes.io/instance: {{ .Release.Name | quote }}
app.kubernetes.io/part-of: {{ .Release.Name | quote }}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "app-infra-starter.labels" -}}
helm.sh/chart: {{ include "app-infra-starter.chart" . }}
{{ include "app-infra-starter.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
generator: "helm"
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "app-infra-starter.fullName" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create the name of the service account to use
provides a unique serviceAccount name for the namespace, release and given servicea account name.
*/}}
{{- define "app-infra-starter.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "app-infra-starter.fullName" .) (print .Release.Namespace "-" .Release.Name "-" .Values.serviceAccount.name) }}
{{- else }}
{{- default "default" (print .Release.Namespace "-" .Release.Name "-" .Values.serviceAccount.name) }}
{{- end }}
{{- end }}


{{- define "app-infra-starter.ingressHost" -}}
{{- if .Values.ingress.nameOverride }}
{{ .Values.ingress.nameOverride }}
{{- else}}
{{ print .Values.ingress.subDomain .Release.Name "." .Values.ingress.topLevelDomain }}
{{- end }}
{{- end }}