<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<style type="text/css">
body,td,th {
	color: #FFF;
}
body {
	background-color: #09F;
}
</style>
</head>

<body>
<p>Test Form</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<form id="form1" name="form1" action="" method="post">
  <p>
    <label for="ssn">ESSN</label>
    <input type="text" name="ssn" id="ssn" />
  </p>
  <p>
    <label for="department">DepartmentNumber</label>
    <input type="text" name="department" id="department" />
  </p>
  <p>
  <input type="submit" />
  </p>
  
  <?php
//  phpinfo(); // Details about the PHP
if(isset($_POST)){ 
$host='localhost';  // This is how to declare variables
$username='root';
$database='demodatabase';
$password='';
$ssn=$_POST['ssn'];		// very similar to JSON objects and using these as keys
$dept=$_POST['department'];

$con=mysqli_connect($host, $username, $password) or die ("Couldn't Connect");
mysqli_select_db($con, $database);
$result=mysqli_query($con, "SELECT * FROM department WHERE Dnumber>$dept");
while($rows=$result->fetch_array()){
	echo $rows['Dnumber'] . " " . $rows['Dname'];
	echo "<br />";
}
$_POST=array();
mysqli_close($con);

}
?>
</form>


</body>
</html>
