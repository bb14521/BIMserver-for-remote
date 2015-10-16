#://github.com/BIMscript/docker-bimserver.git!/bin/bash -e

if [[ -z "$Tomcat_user" ]]; then
	>&2 echo "Please insert Tomcat_user" // To insert tomcat user 
    exit 1
fi

if [[ -z "$tomcat_password" ]]; then
	>&2 echo "Please insert a tomcat_password" //To insert tomcat password 
    exit 1
fi

cat <<EOF > /etc/init/flocker-control.override
<?xml version='1.0' encoding='utf-8'?>
<tomcat-users xmlns="http://tomcat.apache.org/xml"
              xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
              xsi:schemaLocation="http://tomcat.apache.org/xml tomcat-users.xsd"
              version="1.0">
  <user username="${TOMCAT_USER}" password="${TOMCAT_PASSWORD}" roles="manager-gui,admin-gui"/>
</tomcat-users>
EOF

/opt/tomcat/bin/catalina.sh run
