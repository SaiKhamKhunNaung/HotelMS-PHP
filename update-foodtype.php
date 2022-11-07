<?php 
session_start();
$dbh=mysqli_connect('localhost','root','','hbmsdb');

if (isset($_GET['CategoryID']))
 {
 $CategoryID=$_GET['CategoryID'];

  $select="select *from tblfoodtype
         where foodtypeid='$CategoryID'";

         $ret=mysqli_query($dbh,$select);
         $row=mysqli_fetch_array($ret);

         $CategoryName=$row['foodtypename'];
//         $Email=$row['Email'];
//         $Phone=$row['Phone'];
//         $Role=$row['Role'];
//         $Password=$row['Password'];
//         $Address=$row['Address'];

}


         if(isset($_POST['btnUpdate']))
         {
          $U_CategoryID=$_POST['txtCategoryID'];
          $U_CategoryName=$_POST['txtCategoryName'];

          $update="Update tblfoodtype
                     Set foodtypename='$U_CategoryName'
                      Where foodtypeid='$U_CategoryID'";

                     $U_ret=mysqli_query($dbh,$update);

                     if ($U_ret) 
                     {
                      echo"<script>window.alert('Succcessfully Update!')</script>";
                     echo"<script>window.location='add-foodtype.php'</script>";
                        }
                        else
                        {
                          echo"<p>".mysqli_error($connection)."</p>";
                        }
         }
 ?>

<html>
<head>
	<script type="text/javascript" src="js/jquery-3.1.1.slim.min.js"></script>
<link rel="stylesheet" type="text/css" href="DataTables/datatables.min.css"/>
<script type="text/javascript" src="DataTables/datatables.min.js"></script> 

  <title>Update Category</title>
</head>
<body>
	<script>
  $(document).ready( function () {
    $('#tableid').DataTable();
  } );
</script>
		
<h3 class="cursive-font">Enter FoodType Info</h3>

<form action="update-foodtype.php" method="post" enctype="multipart/form-data">
	<div class="panel-body">
                            <div class="row">
                                <div class="col-md-6">
                                    	
												<label for="activities">FoodTypeID</label>
														<input type="text" name="txtCategoryID" readonly value="<?php echo  $CategoryID;?>" class="form-control" >
									
														<label for="activities">FoodType</label>
														<input type="text" name="txtCategoryName" value="<?php echo  $CategoryName;?>" class="form-control" required>


      												
														<input type="submit" class="btn btn-primary btn-block" name="btnUpdate" value="Update">
										     			<input type="reset" class="btn btn-primary btn-block" name="btnclear" value="Clear">
										     			</div>
</div>
		<br><br>
		

</div>
</div>
	</form>
	
	
	

</body>
</html>




