<?php 
session_start();
$dbh=mysqli_connect('localhost','root','','hbmsdb');

if (isset($_GET['FoodID']))
 {
 $FoodID=$_GET['FoodID'];

  $select="select *from tblfood
         where foodid='$FoodID'";

         $ret=mysqli_query($dbh,$select);
         $row=mysqli_fetch_array($ret);

         $FoodName=$row['foodname'];
		 $FoodPrice=$row['foodprice'];
		 $FoodDesc=$row['fooddescription'];
	     $FoodPhoto=$row['image'];
	    
		 $CategoryID=$row['foodtypeid'];
}


         if(isset($_POST['btnUpdate']))
         {
             $U_FoodID=$_POST['txtFoodID'];
             $U_FoodName=$_POST['txtFoodName'];
			 $U_FoodPrice=$_POST['txtFoodPrice'];
			 $U_FoodDesc=$_POST['txtFoodDesc'];
			
		     $U_CategoryID=$_POST['txtCategoryID'];
          $update="Update tblfood
                     Set foodname='$U_FoodName',
					 	 foodprice='$U_FoodPrice',
						 fooddescription='$U_FoodDesc',
						
						 foodtypeid='$U_CategoryID'
                      Where foodid='$U_FoodID'";
			 	
                     $U_ret=mysqli_query($dbh,$update);

                     if ($U_ret) 
                     {
                      echo"<script>window.alert('Succcessfully Update!')</script>";
                     echo"<script>window.location='add-food.php'</script>";
                        }
                        else
                        {
                          echo"<p>".mysqli_error($dbh)."</p>";
                        }
         }
 ?>

<html>
<head>
<title>Update FoodMenu<</title>
<script type="text/javascript" src="js/jquery-3.1.1.slim.min.js"></script>
<link rel="stylesheet" type="text/css" href="DataTables/datatables.min.css"/>
<script type="text/javascript" src="DataTables/datatables.min.js"></script> 

</head>
<body>

<script>
  $(document).ready( function () {
    $('#tableid').DataTable();
  } );
</script>
	
<h3 class="cursive-font">Update Food Info</h3>

<form action="update-food.php" method="post" enctype="multipart/form-data">
	<div class="panel-body">
                            <div class="row">
                                <div class="col-md-6">
                                    
												<label for="activities">FoodID</label>
														<input type="text" name="txtFoodID" readonly value="<?php echo  $FoodID;?>" class="form-control" >
									
														<label for="activities">FoodName</label>
														<input type="text" name="txtFoodName"  value="<?php echo  $FoodName;?>" class="form-control" required>
													
												
														<label for="activities">FoodPrice</label>
														<input type="text" name="txtFoodPrice" value="<?php echo  $FoodPrice;?>" class="form-control" required>
												
														<label for="activities">FoodDescription</label>
														<input type="text" name="txtFoodDesc" value="<?php echo  $FoodDesc;?>" class="form-control" required>
												
														

														 <label for="activities">Foodtype</label>
																									<select name="txtCategoryID" class="form-control">
																										<option>-Select Foodtype-</option>
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

			<input type="submit" class="btn btn-primary btn-block" name="btnUpdate" value="Update">
										     			<input type="reset" class="btn btn-primary btn-block" name="btnclear" value="Clear">
	



</table>
</fieldset>
</form>
</body>
</html>
