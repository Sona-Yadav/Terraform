pipeline {
    agent any
	
    environment {
        GOOGLE_APPLICATION_CREDENTIALS = credentials('gcp-service-account')
	
    }
	
    stages {
        stage('Git Checkout') {
            steps {
               git branch: 'main', url: 'https://github.com/Sona-Yadav/Terraform.git'
            }
        }
        
        stage('Terraform Init') {
            steps {
                script {
                    sh 'terraform init'
                }
            }
        }
	    
        stage('Import Existing GCS Bucket') {
            steps {
                script {
                        sh 'terraform import google_storage_bucket.my_bucket my-existing-bucket'
                    }
                }
            }
	    
        stage('Terraform Plan') {
            steps {
                script {
                    sh 'terraform plan -out=tfplan'
                }
            }
        }

	    stage('Manual Approval') {
            steps {
                input "Approve?"
            }
        }
	    
	    
        stage('Terraform Apply') {
            steps {
                script {
                    sh 'terraform apply tfplan'
                }
            }
        }
    }
}
