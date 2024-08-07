package tplgo

import _ "embed"

//go:embed rules.yaml
var RulesYaml []byte

//go:embed templates/api.go.tpl
var ApiTpl []byte
