#!/bin/bash
#filename deploy.sh
set -x
export TOMCAT_HOME=/home/gztf/apache-tomcat-7.0.42
weixin_pid=$(ps -ef|grep tomcat|awk '{print $2}')
for temp_pid in ${weixin_pid}
do 
    kill -9 ${temp_pid}
done

war_file="/home/gztf/deploy/ROOT.war"
if [ -f "$war_file" ];
then
    echo "War file exists, deploy and start the server."
	#restart tomcat
    rm -rf ${TOMCAT_HOME}/webapps/ROOT/
    rm -f ${TOMCAT_HOME}/webapps/ROOT.war
	cp  ${war_file} ${TOMCAT_HOME}/webapps/ROOT.war
	/bin/bash ${TOMCAT_HOME}/bin/startup.sh
	#remove war file.
	rm ${war_file}
else
    echo "War file not exists, restart the server."
	/bin/bash ${TOMCAT_HOME}/bin/startup.sh
fi
set +x
tailf -300 /home/logs/tobacco_default_log.log
