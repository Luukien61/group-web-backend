gradle clean
gradle bootJar
ssh -i /home/luukien/Downloads/first-instance.pem ec2-user@ec2-13-212-170-169.ap-southeast-1.compute.amazonaws.com << 'EOF'
sudo kill -9 $(lsof -ti :8088)
rm -f groupweb2-0.0.1-SNAPSHOT.jar
EOF
scp -i /home/luukien/Downloads/first-instance.pem build/libs/groupweb2-0.0.1-SNAPSHOT.jar ec2-user@ec2-13-212-170-169.ap-southeast-1.compute.amazonaws.com:/home/ec2-user

ssh -i /home/luukien/Downloads/first-instance.pem ec2-user@ec2-13-212-170-169.ap-southeast-1.compute.amazonaws.com << 'EOF'
. init-backend.sh
EOF