<?php 
session_start();
$dbh=mysqli_connect('localhost','root','','hbmsdb');
if (isset($_REQUEST['FoodID'])) 
{$FoodID=$_REQUEST['FoodID'];

     $delete="Delete From tblfood
          Where foodid='$FoodID'";

          $ret=mysqli_query($dbh,$delete);

          if ($ret){
               echo"<script>window.alert('Successfully deleted!')</script>";
               echo"<script>window.location='add-food.php'</script>";
          }
          else
          {
             echo "<p>Error in FoodMenu Delete : " . mysqli_error($dbh) . "</p>";

          }

}


 ?>