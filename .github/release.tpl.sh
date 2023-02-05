#!/bin/bash
echo "Running {{ .Tag }}"
tag={{.Tag}}
name={{.ProjectName}}
{{ range .Artifacts }}
{{- if eq .Goos "linux" }}
{{- if eq .Type.String "Archive" }}
{{- if eq .Goarch "amd64" }}
if [[ "Linux" = $(uname -s) ]]; then
	if [[ "x86_64" = $(uname -m) ]]; then
		wget "https://github.com/caarlos0/goreleaser-pro-templatefiles-example/releases/download/$tag/{{.Name}}" -O "{{.Name}}"
		tar xvzf "{{.Name}}"
		{{- range .Extra.Binaries }}
		./{{ . }}
		{{- end }}
	fi
fi
{{- end }}
{{- end }}
{{- end }}
{{- end }}
