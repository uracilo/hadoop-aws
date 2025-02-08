
hdfs dfs -ls 
hdfs dfs -kdir input
hdfs dfs -cp salida s3a://xideraltestbenjamin/titanic.csv input
hdfs dfs -ls input
hadoop jar /usr/lib/hadoop-mapreduce/hadoop-mapreduce-examples.jar grep input/titanic.csv salida 'Jack'
hdfs dfs -ls salida
hdfs dfs -cp salida/result result.txt
hdfs dfs -cp result.txt s3a://xideraltextbenjamin/
hdfs dfs -ls s3a://xideraltestbenjamin/

