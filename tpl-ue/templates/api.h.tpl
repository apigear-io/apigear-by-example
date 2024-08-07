#pragma once

#include "CoreMinimal.h"
#include "GameFramework/Actor.h"
{{- range .Module.Enums }}
#include "E{{Camel $.Module.ShortName}}{{Camel .Name}}.generated.h"
{{- end }}
{{- range .Module.Structs }}
#include "{{Camel .Name}}.generated.h"
{{- end }}
{{- range .Module.Interfaces }}
#include "I{{Camel .Name}}.generated.h"
{{- end }}
{{- range .Module.Enums }}


UENUM(BlueprintType)
enum class E{{Camel .Module.ShortName}}{{Camel .Name}} : uint8
{
{{- range .Members }}
    {{Camel .Name}} UEMETA(DisplayName = "{{.Name}}"),
{{- end }}
};
{{- end }}

{{- range .Module.Structs }}

USTRUCT(BlueprintType)
struct {{Camel .Name}} {
  GENERATED_BODY()
public:
{{- range .Fields }}
  UPROPERTY(BlueprintReadWrite, EditAnywhere)
  {{ueType "" .}} {{Camel .Name}};
{{- end }}
};
{{- end }}
{{- range .Module.Interfaces }}

UINTERFACE(MinimalAPI)
class U{{Camel .Name }} : public UInterface
{
  GENERATED_BODY()
};

class I{{Camel .Name }}
{
  GENERATED_BODY()
public:
{{- range .Properties }}
  // {{.Name}}
  virtual void set{{Camel .Name}}({{ueParam "" .}}) = 0;
  virtual {{ueReturn "" . }} get{{Camel .Name}}() const = 0;
  virtual void on{{Camel .Name}}(std::function<void({{ueType "" .}})> cb) = 0;
{{- end }}
{{- range .Operations }}
  // {{.Name}}
  virtual {{ueReturn "" .Return}} {{camel .Name}}({{ueParams "" .Params}}) = 0;
{{- end }}
};
{{- end }}
