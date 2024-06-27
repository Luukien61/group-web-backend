gradle clean
gradle bootJar
scp -i /home/luukien/Downloads/first-instance.pem -r IdeaProjects/groupweb2/build/libs/groupweb2-0.0.1-SNAPSHOT.jar ec2-user@ec2-13-212-170-169.ap-southeast-1.compute.amazonaws.com:/home/ec2-user
