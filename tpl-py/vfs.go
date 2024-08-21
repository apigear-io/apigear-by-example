package tplpy

import _ "embed"

var (
	//go:embed rules.yaml
	RulesYaml []byte
	//go:embed templates/api.py.tpl
	ApiTpl     []byte
	ApiTplName = "api.py.tpl"
)
