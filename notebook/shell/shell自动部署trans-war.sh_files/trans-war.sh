set -x
set -e
mvn clean install -DskipTests
chmod 766 "./target/tobacco.war"
scp -p ./target/tobacco.war root@120.26.94.208:/home/gztf/deploy/ROOT.war
chmod 766 ./deploy.sh
scp -p ./deploy.sh root@120.26.94.208:/home/gztf/deploy/
ssh root@120.26.94.208 "chmod +x /home/gztf/deploy/deploy.sh"
ssh root@120.26.94.208 "/home/gztf/deploy/deploy.sh"
