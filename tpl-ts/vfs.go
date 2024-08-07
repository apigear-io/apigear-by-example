package tplts

import _ "embed"

//go:embed rules.yaml
var RulesYaml []byte

//go:embed templates/api.ts.tpl
var ApiTpl []byte
