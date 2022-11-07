<?php 
$dbh=mysqli_connect('localhost','root','','hbmsdb');




if (isset($_POST['btnsave'])) 
{
    $CategoryID=$_POST['txtcategoryid'];
	$CategoryName=$_POST['txtcategoryname'];

    $insert="Insert into tblfoodtype(foodtypeid,foodtypename)
         VALUE('$CategoryID','$CategoryName')";
$ret=mysqli_query($dbh,$insert) or die(mysqli_error($dbh));

if ($ret)
{
  echo "<script>
          window.alert('Register Successful!');
          window.location='add-foodtype.php';
        </script>";
}



}


 ?>
<html>
<head>
	

  <title>Food Type Registration</title>
</head>
<body>
	<script>
  $(document).ready( function () {
    $('#tableid').DataTable();
  } );
</script>
		
<h3 class="cursive-font">Enter FoodType Info</h3>

<form action="add-foodtype.php" method="post" enctype="multipart/form-data">
	<div class="panel-body">
                            <div class="row">
                                <div class="col-md-6">
                                    
												<label for="activities">FoodTypeID</label>
														<input type="text" name="txtcategoryid"   class="form-control" >
									
														<label for="activities">FoodType</label>
														<input type="text" name="txtcategoryname" placeholder="Eg.Burger" class="form-control" required>


      												
														<input type="submit" class="btn btn-primary btn-block" name="btnsave" value="Save">
										     			<input type="reset" class="btn btn-primary btn-block" name="btnclear" value="Clear">
										     			</div>
</div>
		<br><br>
		<fieldset>
<legend>FoodType List </legend>

   	 <table align="center" cellspacing="3" cellpadding="5" id="table" class="table">
   	 	 <thead>
       <tr>
		 <th>FoodtypeID</th>
       	<th>FoodType</th>
       <th>Option</th>
       
       </tr>
        <thead>
     
       <?php 

		   $select="select * from tblfoodtype";
		   $ret=mysqli_query($dbh,$select);
		   $count=mysqli_num_rows($ret);

		   // if($count==0)
		   // 	{
		   // 		echo"<p>No Record Found!</p>";
		   // 		exit();
		   // 	}
         for ($i=0; $i <$count ; $i++) 
         { 
         	$row=mysqli_fetch_array($ret);
         	
         	$CategoryID=$row['foodtypeid'];
         	$CategoryName=$row['foodtypename'];
         	
         	
         	echo"<tr>";
         	echo "<td>$CategoryID</td>";
         	
         	echo "<td>$CategoryName</td>";
         	
         	echo"<td>
                  <a href='update-foodtype.php?CategoryID=$CategoryID'>Edit</a>
                  <a href='delete-foodtype.php?CategoryID=$CategoryID'>Delete</a>

         	   </td>";
         	   echo"</tr>";

         }
        ?>
    
   	 </table>
</fieldset>

</div>
</div>
	</form>
	
	
	

</body>
</html>
	