pipleline{

	agent any
	stages{
		stage{
			steps{
			
			withCredentials([usernamePassword(
				credentialsId: 'nexus-cred',
				usernameVariable:'NEXUS_USER',
				passwordVariable:'NEXUS_PASS'
			
			)]){
			
				sh '''
					docker build -t service-image .
					docker run --name=service-container --network ci-network -e NEXUS_USER=${NEXUS_USER} -e NEXUS_PASS=${NEXUS_PASS} -p 9000:9000 -d service-image
					
					'''
				
				}
			}
		}
	
	}

}