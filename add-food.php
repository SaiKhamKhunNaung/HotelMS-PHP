<?php  
$dbh=mysqli_connect('localhost','root','','hbmsdb');



if(isset($_POST['btnSave'])) 
{
	$FoodID=$_POST['txtFoodID'];
	$FoodName=$_POST['txtfname'];
	$FoodPrice=$_POST['txtprice'];
	$FoodDesc=$_POST['txtfdesc'];
	
	$CategoryName=$_POST['txtcategoryname'];

	$Image=$_FILES['txtfoodimage']['name'];
	$Folder="../images";

	$FileName=$Folder.'_'.$Image;
	$copied=copy($_FILES['txtfoodimage']['tmp_name'],$FileName);

	if(!$copied)
	{
		echo"<p>Cannot Upload Menu Image.<p>";
		exit();
	}


	$query="INSERT INTO `tblfood`
			(`foodid`, `foodname`, `foodprice`, `image`,`fooddescription`,`foodtypeid`) 
			VALUES
			('$FoodID','$FoodName','$FoodPrice','$FileName','$FoodDesc','$CategoryName')
			";
	$result=mysqli_query($dbh,$query) or die(mysqli_error($dbh));

if ($result) 
{
	echo"<script>window.alert('Register Complete')</script>";
	
}
	
}

?>
<html>
<head>
<title>Menu Entry</title>


</head>
<body>


	
<h3 class="cursive-font">Enter FoodMenu Info</h3>

<form action="add-food.php" method="post" enctype="multipart/form-data">
	<div class="panel-body">
                            <div class="row">
                                <div class="col-md-6">
                                    
												<label for="activities">FoodID</label>
														<input type="text" name="txtFoodID"  class="form-control" >
									
														<label for="activities">FoodName</label>
														<input type="text" name="txtfname" placeholder="Eg.Burger" class="form-control" required>
													
												
														<label for="activities">FoodPrice</label>
														<input type="number" name="txtprice" placeholder="Number Only" class="form-control" required>
												
														<label for="activities">FoodDescription</label>
														<input type="text" name="txtfdesc" placeholder="XXXXXXXXXXXX" class="form-control" required>
												
														<label for="activities">FoodImage</label>
														<input type="file" name="txtfoodimage"  class="form-control" required>
									
													
									
                                            <label for="activities">FoodType </label>
                                            <select name="txtcategoryname" class="form-control">
                                                <option>-Select FoodType-</option>
                                                <?php 
              
              $c="SELECT * FROM tblfoodtype";
              $ret=mysqli_query($dbh,$c);
              echo $count=mysqli_num_rows($ret);

              for ($i=0;$i<$count;$i++)
              {
                $row=mysqli_fetch_array($ret);
                $RID=$row['foodtypeid'];
                $RName=$row['foodtypename'];
                //$Status=$row['Status'];
                echo "<option value='$RID'> $RID $RName</option>";
    
              }
             ?>
													
														
												
														<input type="submit" class="btn btn-primary btn-block" name="btnSave" value="Save">
										     			<input type="reset" class="btn btn-primary btn-block" name="btnclear" value="Clear">
										     			</div>
									
									
</div>
								<br><br>
								<fieldset>
<legend>FoodMenu Listing </legend>

   	 <table align="center" cellspacing="3" cellpadding="5" id="table" class="table table-striped table-dark">
   	 	 <thead >
       <tr>
		 <th>FoodID</th>
       	<th>FoodName</th>
		   <th>FoodPhoto</th>
		 <th>Option</th>
       
       </tr>
        <thead>
     
       <?php 

		   $select="select * from tblfood";
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
         	
         	$FoodID=$row['foodid'];
         	$FoodName=$row['foodname'];
         	$FoodPhoto=$row['image'];
			 $CategoryID=$row['foodtypeid'];
         	echo"<tr>";
         	echo "<td>$FoodID</td>";
         	
         	echo "<td>$FoodName</td>";
         	
         	echo "<td>$FoodPhoto</td>";
			
         	echo"<td>
                  <a href='update-food.php?FoodID=$FoodID'>Edit</a>
                  <a href='delete-food.php?FoodID=$FoodID'>Delete</a>

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

