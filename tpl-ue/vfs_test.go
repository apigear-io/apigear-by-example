package tplue

import (
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestRulesYaml(t *testing.T) {
	assert.NotEmpty(t, RulesYaml)
}

func TestApiTpl(t *testing.T) {
	assert.NotEmpty(t, ApiTpl)
}
