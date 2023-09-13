INSTALL_DIR="$1"
# Install Terraform
wget -qO terraform.zip https://releases.hashicorp.com/terraform/1.5.0/terraform_1.5.0_linux_amd64.zip
unzip terraform.zip -d "${INSTALL_DIR}"

# Install TfLint
wget -qO tflint.zip https://github.com/terraform-linters/tflint/releases/download/v0.47.0/tflint_linux_amd64.zip
unzip tflint.zip -d "${INSTALL_DIR}"


# Install Tfsec
wget -qO tfsec https://github.com/aquasecurity/tfsec/releases/download/v1.28.1/tfsec-checkgen-linux-amd64
unzip tfsec -d "${INSTALL_DIR}"
