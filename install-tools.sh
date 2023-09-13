# Install Terraform
wget -q terraform.zip https://releases.hashicorp.com/terraform/1.5.0/terraform_1.5.0_linux_amd64.zip
unzip terraform_1.5.0_linux_amd64.zip
sudo mv terraform /usr/local/bin/

# Install TfLint
wget -q tflint.zip https://github.com/terraform-linters/tflint/releases/download/v0.47.0/tflint_linux_amd64.zip
unzip tflint_linux_amd64.zip
sudo mv tflint /usr/local/bin/

# Install Tfsec
curl -s https://raw.githubusercontent.com/aquasecurity/tfsec/master/scripts/install_linux.sh | bash
