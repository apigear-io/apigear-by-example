{{- range .Module.Enums }}

enum {{Camel .Name}} {
{{- range .Members }}
    {{CAMEL .Name}},
{{- end }}
)
{{- end }}

{{- range .Module.Structs }}

struct {{Camel .Name}} {
{{- range .Fields }}
  {{camel .Name}}: {{rsType "" .}},
{{- end }}
}
{{- end }}

{{- range .Module.Interfaces }}

trait I{{Camel .Name }} {
{{- range .Properties }}
  // {{.Name}}
  fn set{{Camel .Name}}(&self, {{rsParam "" "" .}});
  fn get{{Camel .Name}}(&self) {{rsReturn "" . }};
  fn on{{Camel .Name}}(&self, cb fn({{rsParam "" "" .}}));
{{- end }}
{{- range .Operations }}
  // {{.Name}}
  fn {{camel .Name}}(&self, {{rsParams "" "" "," .Params}}) {{rsReturn "" .Return}};
{{- end }}
};
{{- end }}