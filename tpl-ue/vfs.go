package tplue

import _ "embed"

var (
	//go:embed rules.yaml
	RulesYaml []byte
	//go:embed templates/api.h.tpl
	ApiTpl     []byte
	ApiTplName = "api.h.tpl"
)
