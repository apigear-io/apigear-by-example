package tplts

import _ "embed"

var (
	//go:embed rules.yaml
	RulesYaml []byte
	//go:embed templates/api.ts.tpl
	ApiTpl     []byte
	ApiTplName = "api.ts.tpl"
)
