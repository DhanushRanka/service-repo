pipeline{

	agent any
	stages{
		stage('Buila dna run service'){
			steps{
			
			withCredentials([usernamePassword(
				credentialsId: 'nexus-cred',
				usernameVariable:'NEXUS_USER',
				passwordVariable:'NEXUS_PASS'
			
			)]){
			
				sh '''
					export DOCKER_BUILDKIT=0
					docker build --network ci-network --build-arg NEXUS_USER=${NEXUS_USER} --build-arg NEXUS_PASS=${NEXUS_PASS} -t service-image .
					docker run --name=service-container --network ci-network  -p 9000:9000 -d service-image
					
					'''
				
				}
			}
		}
	
	}

}