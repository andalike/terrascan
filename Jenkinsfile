pipeline {
    agent any

    environment {
        // Define the path to the tools directory
        TOOLS_DIR = "${WORKSPACE}/tools"
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout your Terraform code from your Git repository
                checkout([$class: 'GitSCM',
                    branches: [[name: '*/feature']],
                    doGenerateSubmoduleConfigurations: false,
                    extensions: [],
                    submoduleCfg: [],
                    userRemoteConfigs: [[url: 'https://github.com/andalike/terrascan']]
                ])
            }
        }

        stage('Install TfLint and TfSec') {
            steps {
                script {
                    // Download and install TFLint if not already installed
                    def tflintInstalled = fileExists("${TOOLS_DIR}/tflint")
                    if (!tflintInstalled) {
                        sh "mkdir -p ${TOOLS_DIR}"
                        sh "curl -L https://github.com/terraform-linters/tflint/releases/latest/download/tflint_linux_amd64.zip -o ${TOOLS_DIR}/tflint_linux_amd64.zip"
                        sh "unzip ${TOOLS_DIR}/tflint_linux_amd64.zip -d ${TOOLS_DIR}"
                        sh "chmod +x ${TOOLS_DIR}/tflint"
                    }

                    // Download and install TfSec if not already installed
                    def tfsecInstalled = fileExists("${TOOLS_DIR}/tfsec")
                    if (!tfsecInstalled) {
                        sh "mkdir -p ${TOOLS_DIR}"
                        sh "curl -L https://github.com/aquasecurity/tfsec/releases/latest/download/tfsec-linux-amd64 -o ${TOOLS_DIR}/tfsec"
                        sh "chmod +x ${TOOLS_DIR}/tfsec"
                    }
                }
            }
        }

        stage('Run TfLint') {
            steps {
                script {
                    // Run TFLint on your Terraform code
                    def tflintExitCode = sh(
                        script: "${TOOLS_DIR}/tflint --config ${WORKSPACE}/path/to/tflint.hcl",
                        returnStatus: true
                    )

                    if (tflintExitCode != 0) {
                        error "TFLint scan failed with exit code: ${tflintExitCode}"
                    }
                }
            }
        }

        stage('Run TfSec Scan') {
            steps {
                script {
                    // Run TfSec scan on your Terraform code
                    def tfsecExitCode = sh(
                        script: "${TOOLS_DIR}/tfsec -f junit,default --out tfsec --config-file tfsec.yaml --no-color --include-passed",
                        returnStatus: true
                    )

                    if (tfsecExitCode != 0) {
                        error "TfSec scan failed with exit code: ${tfsecExitCode}"
                    }
                }
            }
        }
    }
}
