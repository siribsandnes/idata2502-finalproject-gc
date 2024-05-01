package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestTerraformGoogleComputeInstance(t *testing.T) {
	terraformOptions := &terraform.Options{

		TerraformDir: "../terraform",

		Vars: map[string]interface{}{},

		NoColor: true,
	}

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	instanceName := terraform.Output(t, terraformOptions, "ip")
	assert.Equal(t, "expected-ip-address", instanceName)
}
