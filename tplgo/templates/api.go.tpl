package {{snake .Module.ShortName}}


{{- range .Module.Enums }}
{{- $enum := . }}

const (
{{- range .Members }}
    {{Camel $enum.Name}}{{Camel .Name}} = iota
{{- end }}
)
{{- end }}



{{- range .Module.Structs }}

type {{Camel .Name}} struct {
{{- range .Fields }}
  {{Camel .Name}} {{goType "" .}} `json:"{{snake .Name}}" yaml:"{{snake .Name}}"`
{{- end }}
};
{{- end }}

{{- range .Module.Interfaces }}

type I{{Camel .Name }} interface {
{{- range .Properties }}
  // {{.Name}} property
  Set{{Camel .Name}}({{goParam "" .}})
  Get{{Camel .Name}}() {{goReturn "" . }}
  On{{Camel .Name}}(cb func({{goType "" .}}))
{{- end }}
{{- range .Operations }}
  // {{.Name}} function
  {{Camel .Name}}({{goParams "" .Params}}) {{goReturn "" .Return}}
{{- end }}
{{- range .Signals }}
  // {{.Name}} signal
  On{{Camel .Name}}(cb func({{goParams "" .Params}}))
{{- end }}
};
{{- end }}
