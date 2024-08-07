package tplcpp

import _ "embed"

//go:embed rules.yaml
var RulesYaml []byte

//go:embed templates/api.h.tpl
var ApiTpl []byte
