from enum import Enum
{{- range .Module.Enums }}

class {{Camel .Name}}(Enum):
{{- range .Members }}
    {{Camel .Name}} = '{{.Name}}'
{{- end }}
{{- end }}

{{- range .Module.Structs }}

class {{Camel .Name}}:
  def __init__({{pyParams "" .Fields}}):
{{- range .Fields }}
    self.{{camel .Name}} = {{camel .Name}}
{{- end }}
{{- end }}

{{- range .Module.Interfaces }}

class I{{Camel .Name }}:
{{- range .Properties }}
  # {{.Name}}
  def set_{{camel .Name}}(self, {{pyParam "" .}}):
    raise NotImplementedError()
  def get_{{camel .Name}}(self) -> {{pyType "" .}}:
    raise NotImplementedError()
  def on_{{camel .Name}}(self, cb):
    raise NotImplementedError()
{{- end }}
{{- range .Operations }}
  # {{.Name}}
  def {{camel .Name}}({{pyParams "" .Params}}) -> {{pyReturn "" .Return}}:
    raise NotImplementedError()
{{- end }}
{{- end }}
