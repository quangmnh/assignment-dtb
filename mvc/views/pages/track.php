<?php 
  if ( isset($data["qr_systemPlaylist"]) ) { 

    if (isset($data['deletePlaylist_res'])) {
      if ($data['deletePlaylist_res'] == true) {
        echo '<h2> Delete successfully!</h2>';
      }
      else {
        echo '<h2> Delete Failed! </h2>';
      }
    }

    ?>

    <h2>SYSTEM PLAYLISTS</h2>

    <?php

    echo '<a href="../db_assignment2/track/openAddSystemPlaylistForm"> 
    <input type="button" class="btn btn-primary" value="+ ADD NEW SYSTEM PLAYLIST" style="margin-bottom: 50px; height: 50px"></a>';

    foreach ($data["qr_systemPlaylist"] as $row) {

      echo '<table class="table table-hover table-striped">';
      echo '<tr>';
        echo '<td class="col-3" rowspan="2"> <img src="'.$row['Photo'].'" id="playlist_photo"> </td>';
        echo '<td><h2>'.$row['Name'].'</h2></td>';
        echo '<td class="col-3" rowspan="2">';
        echo '<a href="../db_assignment2/track/editPlaylist/'.$row['ID'].'"> <input type="button" class="btn btn-success" value="Edit Playlist"></a>';
        echo '<a href="../db_assignment2/track/editTrackInPlaylist/'.$row['ID'].'"> <input type="button" class="btn btn-primary" value="Edit Track List"></a>';
        echo '<a href="../db_assignment2/track/deleteSystemPlaylist/'.$row['ID'].'"> <input type="button" class="btn btn-danger" value="Delete"></a>';
        echo '</td>';
      echo '</tr>';

      echo '<tr>';
        echo '<td><h3> Spotify </h3></td>';
      echo '</tr>';
    
      echo '</table>';

    }

    
  }

  if ( isset($data["qr_userPlaylist"]) ) {

    ?>

    <h2>USER PLAYLISTS</h2>

    <?php

    foreach ($data["qr_userPlaylist"] as $row) {
      echo '<table class="table table-hover table-striped">';

      echo '<tr>';
        echo '<td class="col-3" rowspan="2"> <img src="'.$row['Photo'].'" id="playlist_photo"> </td>';
        echo '<td><h2>'.$row['P_Name'].'</h2></td>';
        echo '<td class="col-3" rowspan="2">';
        echo '<a href="#"> <input type="button" class="btn btn-success" value="Edit"></a>';
        echo '<a href="#"> <input type="button" class="btn btn-danger" value="Delete"></a>';
        echo '</td>';
      echo '</tr>';

      echo '<tr>';
        echo '<td><h4>'.$row['U_Name'].'</h4></td>';
      echo '</tr>';

      echo '</table>';

    }

  }

  if ( isset($data['openFormAddSystemPlaylist']) ) {

    ?>
    <h2 style="margin-bottom: 50px"> Insert new System Playlist </h2>

    <form action="../db_assignment2/track/addSystemPlaylist" method="POST">

            <div class="form-group">
            <h2><label>System Playlist Name</label></h2>
            <input type="text" class="form-control" name="playlistName" placeholder="Enter system playlist name">
            </div>
        
            <div class="form-group" style="margin-top: 30px">
            <h2><label>Photo Directory</label></h2>
            <input type="text" class="form-control" id="dir" name="playlistPhotoDir" placeholder="Enter directory of photo">
            </div>

            <button type="submit" class="btn btn-primary" name="btnSubmitAddSystemPlaylist" style="margin-top: 30px; margin-bottom: 30px">Submit</button>

        </form>
    <?php
  }

?>