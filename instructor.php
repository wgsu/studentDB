<?php


$username='root';
$password='sumysql';
$database='student';
 mysql_connect('localhost',$username,$password);
mysql_select_db($database) or die( "Unable to select database");
//$user_input = $_POST['query1'];
//$query = "select *from $insert";
$instructor_ID=$_POST['instr_id'];
$name=$_POST['name'];
$department=$_POST['wdepartment'];
$query_i = "INSERT INTO `instructor`  VALUES ('$instructor_ID','$name','$department')";
$query="SELECT * FROM instructor";
mysql_query($query_i);
$result=mysql_query($query);




 $num=mysql_numrows($result);
 echo "<b><center>Updated Data</center></b><br><br>";
 $i=0;
while ($i < $num) {
 
        $instructor_ID=mysql_result($result,$i,"I_ID");
        $name=mysql_result($result,$i,"instr_name");
        $department=mysql_result($result,$i,"D_ID");
       
        
      
        
 
        echo "<b>$instructor_ID $name $department</b><br>";
 
        $i++; 
}


 ?>