package tpljava

import _ "embed"

var (
	//go:embed rules.yaml
	RulesYaml []byte
	//go:embed templates/api.java.tpl
	ApiTpl     []byte
	ApiTplName = "api.java.tpl"
)
