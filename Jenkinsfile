
pipeline {
	agent any
	stages {
	    stage('Checkout') {
	        steps {
			checkout scm			       
		      }}
		stage('Build') {
	           steps {
			  sh '/home/nidhi/Documents/Devops_Software/apache-maven-3.9.3/bin/mvn install'
	                 }}
		stage('Deployment'){
		    steps {
			sh 'cp target/sparkjava-hello-world-1.0.war /home/nidhi/Documents/Devops_Software/apache-tomcat-9.0.76/webapps'
			}}
			stage('Docker build'){
		    steps {
			sh 'docker build -t nidhikashyap18/nginx-image-2 .'
			}}
			stage('Container creation'){
		    steps {
			sh 'docker run -it -d --name=con-pipeline-3 nidhikashyap18/nginx-image-2 /bin/bash'
			}}
			stage('Push Docker Image') {
            steps {
                script {
                    // Log in to Docker Hub
                    withCredentials([usernamePassword(credentialsId: 'dockerhub_id', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        sh "echo $DOCKER_PASSWORD | docker login --username $DOCKER_USERNAME --password-stdin"
                    }
                    
                    // Tag the Docker image
                    sh 'docker tag nidhikashyap18/nginx-image-2 nidhikashyap18/nginx-image-2'
                    
                    // Push the Docker image to Docker Hub
                    sh 'docker push nidhikashyap18/nginx-image-1'
                }
            }
        }		


}}

