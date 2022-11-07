<?php 
session_start();
$dbh=mysqli_connect('localhost','root','','hbmsdb');
if (isset($_REQUEST['CategoryID'])) 
{$CategoryID=$_REQUEST['CategoryID'];

     $delete="Delete From tblfoodtype
          Where foodtypeid='$CategoryID'";

          $ret=mysqli_query($dbh,$delete);

          if ($ret){
               echo"<script>window.alert('Successfully deleted!')</script>";
               echo"<script>window.location='add-foodtype.php'</script>";
          }
          else
          {
             echo "<p>Error in Category Delete : " . mysqli_error($dbh) . "</p>";

          }

}


 ?>