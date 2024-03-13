{{- range .Module.Enums }}

enum {{Camel .Name}} {
{{- range .Members }}
    {{Camel .Name}} = '{{.Name}}',
{{- end }}
}
{{- end }}

{{- range .Module.Structs }}

type {{Camel .Name}} = {
{{- range .Fields }}
    {{camel .Name}}: {{tsType "" .}}
{{- end }}
}
{{- end }}

{{- range .Module.Interfaces }}

interface I{{Camel .Name }} {
{{- range .Properties }}
    get{{Camel .Name}}(): {{tsType "" .}};
    set{{Camel .Name}}({{tsParam "" .}}) : void;
    on{{Camel .Name}}(cb: ({{tsType "" .}}) => void): void;
{{- end }}
{{- range .Operations }}
    {{camel .Name}}: ({{tsParams "" .Params}}) => {{tsType "" .Return}}
{{- end }}
}
{{- end }}

