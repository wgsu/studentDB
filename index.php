<form action ="student.php" method="post">
student_ID:<input type = "text" name="student_ID">
name:<input type = "text" name="name">
address:<input type = "text" name="address">
 email:<input type = "text" name="email">
major: <input type = "text" name="major">
phone:<input type = "text" name="phone">
 <input type = "submit" value = "submit_student">


 </form>
 <form action ="instructor.php" method="post">
ID:<input type = "text" name="instr_id">
name:<input type = "text" name="name">
department:<input type = "text" name="wdepartment">

 <input type = "submit" value = "submit_instructor">

 </form>
 
 <form action ="enroll.php" method="post">
student:<input type = "text" name="sid">
department:<input type = "text" name="did">
course_num:<input type = "text" name="course_number">
section_num:<input type = "text" name="section_number">


 <input type = "submit" value = "enroll_student">

</form> 
<form action ="course.php" method="post">
course_num:<input type = "text" name="cnum">
depart_id:<input type = "text" name="did">
section_num:<input type = "text" name="snum">
title:<input type = "text" name="title">
credit: <input type = "text" name="credit">
 <input type = "submit" value = "submit_course">
 </form>
 
 <form action ="user.php" method="post">
input query: <input type = "text" name="q">
<input type = "submit" value = "submit_query"> 
</form>

<form action ="delete.php" method="post">
Delete_from: <input type = "text" name="table">
condition: <input type="text" name="condition">

<input type = "submit" value = "submit"> 
</form>
 