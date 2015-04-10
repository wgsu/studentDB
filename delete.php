<?php 
echo 'delete from the database';
$username='root';
$password='sumysql';
$database='student';
mysql_connect('localhost',$username,$password);
mysql_select_db($database);

$table = $_POST['table'];
$condition = $_POST['condition'];

$query = "DELETE FROM $table WHERE $condition";


mysql_query($query);
 
 ?>