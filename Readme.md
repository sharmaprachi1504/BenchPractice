              bat '''
                scp -v -r -o StrictHostKeyChecking=no -i Bench_Training/mynewkey.pem target/TestCalculatorAppJuly21Batch.war ubuntu@54.89.235.55:/tmp              
                ssh -i  Bench_Training/mynewkey.pem ubuntu@54.89.235.55  
                
              
                
                icacls mynewkey.pem /inheritance:r /remove "BUILTIN\\Users" /grant "admin:R"          
                scp -v -r -o StrictHostKeyChecking=no -i mynewkey.pem target/TestCalculatorAppJuly21Batch.war ubuntu@%IP_Address%:/tmp
                sftp -i mynewkey.pem ubuntu@3.89.150.52               
                sudo apt-get update
                sudo apt-cache search tomcat
                sudo apt install tomcat9 tomcat9-admin -y
                ss -ltn
                sudo systemctl enable tomcat9
                sudo mv /tmp/TestCalculatorAppJuly21Batch.war  /var/lib/tomcat9/webapps/
                sudo systemctl restart tomcat9    
                
                '''
