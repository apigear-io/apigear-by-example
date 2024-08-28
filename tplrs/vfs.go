package tplrs

import _ "embed"

var (
	//go:embed rules.yaml
	RulesYaml []byte
	//go:embed templates/api.rs.tpl
	ApiTpl     []byte
	ApiTplName = "api.rs.tpl"
)
