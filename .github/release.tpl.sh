#!/bin/bash
echo "Running {{ .Tag }}"
{{ range .Artifacts }}
{{- if eq .Goos "linux" }}
{{- if eq .Type.String "Binary" }}
{{- if eq .Goarch "amd64" }}
if [[ "x86_64" = $(uname -m) ]]; then
	echo "Executing {{ .Name }} ({{ .Path }})..."
  {{ .Path }}
fi
{{- end }}
{{- end }}
{{- end }}
{{- end }}
