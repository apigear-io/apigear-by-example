package tplpy

import _ "embed"

//go:embed rules.yaml
var RulesYaml []byte

//go:embed templates/api.py.tpl
var ApiTpl []byte
