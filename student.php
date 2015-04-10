<?php


$username='root';
$password='sumysql';
$database='student';
 mysql_connect('localhost',$username,$password);
mysql_select_db($database) or die( "Unable to select database");

//$query="SELECT * FROM advice";
//$user_input = $_POST['query1'];
//$query = "select *from $insert";
$student_ID=$_POST['student_ID'];
$name=$_POST['name'];
$address=$_POST['address'];
$email=$_POST['email'];
$major=$_POST['major'];
$phone=$_POST['phone'];
$query_i = "INSERT INTO `student` (`SID`, `name`, `address`, `email`, `major`, `phone`) VALUES ('$student_ID','$name','$address','$email','$major','$phone')";
$query="SELECT * FROM student";
mysql_query($query_i);
$result= mysql_query($query);




 $num=mysql_numrows($result);
echo "<b><center>Updated Data</center></b><br><br>";
 $i=0;
while ($i < $num) {
 
        $sid=mysql_result($result,$i,"SID");
        $sname=mysql_result($result,$i,"name");
        $addr=mysql_result($result,$i,"address");
        $mail=mysql_result($result,$i,"email");
        $maj=mysql_result($result,$i,"major");
        $pho=mysql_result($result,$i,"phone");
        
      
        
 
        echo "<b>$sid $sname $addr $mail $maj $pho</b><br>";
 
        $i++; 
}


 ?>