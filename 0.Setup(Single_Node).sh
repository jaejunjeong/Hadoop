--Download hadoop-3.2.3.tar.gz 
curl https://dlcdn.apache.org/hadoop/common/hadoop-3.2.3/hadoop-3.2.3.tar.gz --output hadoop-3.2.3.tar.gz

--Unzip hadoop-3.2.3.tar.gz 
tar -xvf hadoop-3.2.3.tar.gz

--Navigate to the hadoop-3.2.3 directory
cd hadoop-3.2.3

--Check the hadoop command to see if it is setup
bin/hadoop

--Download data.txt
curl https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-BD0225EN-SkillsNetwork/labs/data/data.txt --output data.txt

--Run the Map reduce application for wordcount on data.txt ('wordcount' will count the word in data.txt)
bin/hadoop jar share/hadoop/mapreduce/hadoop-mapreduce-examples-3.2.3.jar wordcount data.txt output

--Check the output
ls output

--Run the following command to see the word count output
cat  output/part-r-00000
