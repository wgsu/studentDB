<?php 
echo 'check you result in the database';
$username='root';
$password='sumysql';
$database='student';
mysql_connect('localhost',$username,$password);
mysql_select_db($database);

$query_i = $_POST['q'];

//$query = "DELETE FROM student WHERE SID= $query_i";
$query= $query_i;

mysql_query($query);
 
 ?>