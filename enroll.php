<?php


$username='root';
$password='sumysql';
$database='student';
 mysql_connect('localhost',$username,$password);
mysql_select_db($database) or die( "Unable to select database");

//$query="SELECT * FROM advice";
//$user_input = $_POST['query1'];
//$query = "select *from $insert";
$student_ID=$_POST['sid'];
$depart=$_POST['did'];
$course_number=$_POST['course_number'];
$section_number=$_POST['section_number'];

$query_i = "INSERT INTO `enroll` VALUES ('$student_ID','$depart','$course_number','$section_number')";
$query="SELECT * FROM enroll";
mysql_query($query_i);
$result= mysql_query($query);




 $num=mysql_numrows($result);
 echo "<b><center>Updated Data</center></b><br><br>";
 $i=0;
while ($i < $num) {
 
        $sid=mysql_result($result,$i,"SID");
        $dname=mysql_result($result,$i,"D_ID");
        $course_num=mysql_result($result,$i,"course_number");
        $section_num=mysql_result($result,$i,"section_number");
        
        
      
        
 
        echo "<b>$sid $dname $course_num $section_num </b><br>";
 
        $i++; 
}


 ?>