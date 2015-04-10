<?php
$username='root';
$password='sumysql';
$database='student';
 mysql_connect('localhost',$username,$password);
mysql_select_db($database) or die( "Unable to select database");

//$query="SELECT * FROM advice";
//$user_input = $_POST['query1'];
//$query = "select *from $insert";
$course1=$_POST['cnum'];
$department1=$_POST['did'];
$section1=$_POST['snum'];
$title1=$_POST['title'];
$credit1=$_POST['credit'];

$query_i = "INSERT INTO `course` VALUES (`$course1`, `$department1`, `$section1`, `$title1`, `$credit1`)";
$query="SELECT * FROM course";
mysql_query($query_i);
$result= mysql_query($query);

 $num=mysql_numrows($result);
echo "<b><center>Updated Data</center></b><br><br>";
 $i=0;
while ($i < $num) {
 
        $course_numberi=mysql_result($result,$i,"course_number");
        $departi=mysql_result($result,$i,"D_ID");
        $sectioni=mysql_result($result,$i,"section_number");
        $titlei=mysql_result($result,$i,"title");
        $crediti=mysql_result($result,$i,"credit");
        
        
      
        
 
        echo "<b>$course_numberi $departi $sectioni $titlei $crediti </b><br>";
 
        $i++; 
}
 ?>