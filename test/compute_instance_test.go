package test

import (
	"os"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestTerraformGoogleComputeInstance(t *testing.T) {
	credsPath := os.Getenv("GOOGLE_APPLICATION_CREDENTIALS") // Use the environment variable

	terraformOptions := &terraform.Options{
		TerraformDir: "../terraform",

		Vars: map[string]interface{}{
			"google_application_credentials": credsPath,
		},

		NoColor: true,
	}

	defer terraform.Destroy(t, terraformOptions)
	terraform.InitAndApply(t, terraformOptions)

	instanceName := terraform.Output(t, terraformOptions, "instance_name")
	assert.Equal(t, "web-server-idata2502-sbs", instanceName)
}
