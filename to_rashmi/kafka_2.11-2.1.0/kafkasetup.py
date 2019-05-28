import os,xml
import time
from xml.dom import minidom
os.system(" gnome-terminal -e \"bash -c 'bin/zookeeper-server-start.sh config/zookeeper.properties;exec $SHELL'\"")
os.system("gnome-terminal -e \"bash -c 'bin/kafka-server-start.sh config/server.properties;exec $SHELL'\"")
mydoc =minidom.parse('config.xml')
topics = mydoc.getElementsByTagName('topic')
ip_address = mydoc.getElementsByTagName('ip_addr')
print(ip_address[0].attributes['ip'].value)
i=0
for i in topics:
	print(i.attributes['name'].value)
	
	string= "bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic" + " " +i.attributes['name'].value
	#os.system( "gnome-terminal -e \"bash -c 'os.system($string);exec $SHELL'\"")
	time.sleep(5)
	os.system(string)
