#!/bin/bash

#excluir ROOT e ROOT.war
#renomear fincontrol.war para ROOT.war

cd /opt/tomcat/apache-tomcat-9.0.35/webapps/ &&
rm ROOT.war &&
rm -R ROOT &&
mv fincontrol.war ROOT.war