#Clone the repository to your environment.
git clone https://github.com/ibm-developer-skills-network/ooxwv-docker_hadoop.git

#Navigate to the docker-hadoop directory to build it
cd ooxwv-docker_hadoop

#Compose the docker application(Compose is a tool for defining and running multi-container Docker applications, use YAML file)
docker-compose up -d

#Run the namenode as a mounted drive on bash.
docker exec -it namenode /bin/bash

: << "END" 
Hadoop environment is configured by editing a set of configuration files:

hadoop-env.sh : Serves as a master file to configure YARN, HDFS, MapReduce, and Hadoop-related project settings.
core-site.xml : Defines HDFS and Hadoop core properties
hdfs-site.xml : Governs the location for storing node metadata, fsimage file and log file.
mapred-site-xml  : Lists the parameters for MapReduce configuration.
yarn-site.xml : Defines settings relevant to YARN. It contains configurations for the Node Manager, Resource Manager, Containers, and Application Master.
END

#For the docker image, xml configured already
ls /opt/hadoop-3.2.1/etc/hadoop/*.xml

#In the HDFS, create a directory structure named user/root/input.
hdfs dfs -mkdir -p /user/root/input

#Copy all the hadoop configuration xml files into the input directory.
hdfs dfs -put $HADOOP_HOME/etc/hadoop/*.xml /user/root/input

#Create a data.txt file in the current directory.
curl https://raw.githubusercontent.com/ibm-developer-skills-network/ooxwv-docker_hadoop/master/SampleMapReduce.txt --output data.txt 

#Copy the data.txt file into /user/root.
hdfs dfs -put data.txt /user/root/

#Check if the file has been copied into the HDFS by viewing its content.
hdfs dfs -cat /user/root/data.txt

: << "END" 
enter the port number as 9870(Or your port) and launch.
This will open up the Graphical User Interface (GUI) of the Hadoop node. Click on Utilities -> Broswe the file system to browse the files.
View the files in the directories that you have just created by clicking on user then root.
Notice that the block size is 128 MB though the file size is actually much smaller. This is because the default block size used by HDFS is 128 MB.
You can click on the file to check the file into. It gives you information about the file in terms of number of bytes, block id etc.,
END

