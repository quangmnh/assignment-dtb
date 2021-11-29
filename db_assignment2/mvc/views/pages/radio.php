<?php 
  if ( isset($data["qr_res"]) ) {
  echo '<table class="table table-hover table-striped">';
  echo '<thead>';
  echo '<tr>';
  echo '<th scope="col">Radio channel</th>';
  echo '<th scope="col">Frequency</th>';
  echo '<th scope="col">Producer</th>';
  echo '<th scope="col">Action</th>';
  echo '</tr>';
  echo '</thead>';
  foreach ($data["qr_res"] as $row) {
      echo '<tr>';
      echo '<td>'.$row['Name'].'</td>';
      echo '<td>'.$row['Frequency'].'</td>';
      echo '<td>'.$row['Producer'].'</td>';
      echo '<td class="col-3">';
      echo '<a href="#"> <input type="button" class="btn btn-success" value="Edit"></a>';
      echo '<a href="#"> <input type="button" class="btn btn-danger" value="Delete"></a>';
      echo '</td>';
      echo '</tr>';          
  }
  echo '</table>';
  }
?>