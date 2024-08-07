package tplrs

import _ "embed"

//go:embed rules.yaml
var RulesYaml []byte

//go:embed templates/api.rs.tpl
var ApiTpl []byte
