#pragma once

#include <functional>

{{- range .Module.Externs }}
{{ $x := cppExtern . }}
{{- if $x.Include }}
#include "{{$x.Include}}"
{{- end }}
{{- end }}


{{- range .Module.Enums }}

enum {{Camel .Name}}Enum {
{{- range .Members }}
    {{Camel .Name}},
{{- end }}
};
{{- end }}

{{- range .Module.Structs }}

struct {{Camel .Name}} {
{{- range .Fields }}
  {{cppType "" .}} {{camel .Name}};
{{- end }}
};
{{- end }}
{{- range .Module.Interfaces }}


class I{{Camel .Name }} {
public:
{{- range .Properties }}
  // {{.Name}}
  virtual void set{{Camel .Name}}({{cppParam "" .}}) = 0;
  virtual {{cppReturn "" . }} get{{Camel .Name}}() const = 0;
  virtual void on{{Camel .Name}}(std::function<void({{cppType "" .}})> cb) = 0;
{{- end }}
{{- range .Operations }}
  // {{.Name}}
  virtual {{cppReturn "" .Return}} {{camel .Name}}({{cppParams "" .Params}}) = 0;
{{- end }}
};
{{- end }}