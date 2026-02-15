pipleline{

	agent any
	stages{
		stage{
			steps{
			sh '''
				docker build -t service-image .
				docker run --name=service-container -p 9000:9000 -d service-image
				
				'''
			
			}
		}
	
	}

}