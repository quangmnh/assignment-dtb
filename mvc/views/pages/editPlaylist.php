<?php
    if ( isset ($data['playlistInfo']) ) { 
        $pl = $data['playlistInfo'];
        // print_r($pl);
        // echo $pl->Name;
        ?>

        <form action="../db_assignment2/track/changePlaylistInfoInDatabase/<?php echo $pl->ID ?>" method="POST">

            <div class="form-group">
            <h2><label>Playlist Name</label></h2>
            <input type="text" class="form-control" name="playlistName" value="<?php echo $pl->Name ?>">
            </div>
        
            <div class="form-group" style="margin-top: 30px">
            <h2><label>Photo Directory</label></h2>
            <input type="text" class="form-control" id="dir" name="playlistPhotoDir" value="<?php echo $pl->Photo ?>">
            <!-- <button class="btn btn-primary" id="btnLoadImg" onclick=loadImg()>Load</button> -->
            </div>

            <img src="<?php echo $pl->Photo ?>" id="photoDir" style="margin-top: 30px; width: 300px; height: 100%;"> </br>
            <div id="test"></div>

            <button type="submit" class="btn btn-primary" name="btnSubmitEdit" style="margin-top: 30px; margin-bottom: 30px">Submit</button>

        </form>

    <?php
    }

    if ( isset($data['res']) ) {

        echo '<h2>';

        if ($data['res'] == true) {
            echo "Update successfully";
        }
        else {
            echo "Update Fail";
        }

        echo '</h2>';

    }

    if ( isset($data['trackListEdit']) ) {

        if (isset($data['delete_res'])) {

            if ($data['delete_res'] == true) {
                echo '<h3>Delete successfully!</h3>';
            }
            else {
                echo '<h3>Delete Failed!</h3>';
            }

        }
        

        echo '<a href="../db_assignment2/track/addTrack/'.$data['playlist_ID'].'"> <input type="button" class="btn btn-primary" value="+ ADD TRACK"></a>';

        // Print Tracklist

        echo '<table class="table table-hover table-striped" style="margin-bottom: 150px">';
        echo '<thead>';
        echo '<tr>';
        echo '<th scope="col">Orders</th>';
        echo '<th scope="col">Name</th>';
        echo '<th scope="col">Aritst(s)</th>';
        echo '<th scope="col">Release(s)</th>';
        echo '<th scope="col">Duration</th>';
        echo '<th scope="col">Action</th>';
        echo '</tr>';
        echo '</thead>';

        $count = 1;

        foreach ($data['trackListEdit'] as $track) {
            echo '<tr>';

            echo '<td>'.$count.'</td>';
            $count = $count + 1;
            
            echo '<td>'.$track['Name'].'</td>';

            echo '<td>';
            foreach ($data[$track['ID'].'Artists'] as $artist) {
                echo $artist.', ';
            }
            echo '</td>';

            echo '<td>';
            foreach ($data[$track['ID'].'Titles'] as $release) {
                echo $release.', ';
            }
            echo '</td>';

            $minute = floor($track['Duration']/60);
            $second = $track['Duration'] - $minute*60;

            if ($second < 10) {
            echo '<td>'.$minute.':0'.$second.'</td>';
            }
            else {
            echo '<td>'.$minute.':'.$second.'</td>';
            }

            echo '<td class="col-3">';
            // echo '<a href="#"> <input type="button" class="btn btn-success" value="Edit"></a>';
            echo '<a href="../db_assignment2/track/deleteTrack/'.$track['ID'].'/'.$data['playlist_ID'].'"> <input type="button" class="btn btn-danger" value="Delete"></a>';
            echo '</td>';
            echo '</tr>';          
        }
        echo '</table>';

    }

    //--------------------------------------------------------------------------//
    // View for pressing + ADD TRACK BUTTON
    if ( isset($data['allTrack']) ) {

        // print_r($data['MaxOrders']);

        if (isset($data['res_insert'])) {

            if ($data['res_insert'] == true) {
                echo '<h3> Insert successfully!</h3>';
            }
            else {
                echo '<h3> Insert Failed!</h3>';
            }

        }

        // Live search bar
        ?>

        <form action="../db_assignment2/track/liveSearch/<?php echo $data['playlist_ID']; ?>" method="POST">
            <div class="input-group">
                <div class="form-outline">
                    <input id="search-focus" type="search" name="liveSearchEditText" class="form-control" style="width: 300px; height: 100%; font-size: 18px"/>
                    <label class="form-label" for="form1">Search</label>
                </div>
                <button type="submit" class="btn btn-primary" name="btnSubmitLiveSearch">
                    <i class="fas fa-search"></i>
                </button>
            </div>
        </form>
        

        <?php

        // Print Tracklist

        echo '<table class="table table-hover table-striped" style="margin-bottom: 150px">';
        echo '<thead>';
        echo '<tr>';
        echo '<th scope="col">#</th>';
        echo '<th scope="col">Name</th>';
        echo '<th scope="col">Artist(s)</th>';
        echo '<th scope="col">Release(s)</th>';
        echo '<th scope="col">Duration</th>';
        echo '<th scope="col">Action</th>';
        echo '</tr>';
        echo '</thead>';

        $count = 1;
        foreach ($data['allTrack'] as $track) {

            $check = false;

            if ( isset($data['trackInPlaylist']) ) {
                foreach ($data['trackInPlaylist'] as $TIP) {
                    if ($TIP['ID'] == $track['ID']) {
                        $check = true;
                        break;
                    }
                }
            }

            echo '<tr>';
 
            echo '<td>'.$count.'</td>';
            $count = $count + 1;

            echo '<td class="col-4"><h5>'.$track['Name'].'</h5></td>';

            echo '<td>';
            foreach ($data[$track['ID'].'Artists'] as $artist) {
                echo '<p style="font-weight: bold">'.$artist.', </p>';
            }
            echo '</td>';

            echo '<td>';
            foreach ($data[$track['ID'].'Titles'] as $release) {
                echo $release.', ';
            }
            echo '</td>';

            $minute = floor($track['Duration']/60);
            $second = $track['Duration'] - $minute*60;

            if ($second < 10) {
            echo '<td>'.$minute.':0'.$second.'</td>';
            }
            else {
            echo '<td>'.$minute.':'.$second.'</td>';
            }

            echo '<td class="col-2">';

            if ($check == false) {
                echo '<a href="../db_assignment2/track/addTrackToPlaylistInDatabase/'.$data['playlist_ID'].'/'.$track['ID'].'/'.$data['MaxOrders']['MaxOrders'].'"> <input type="button" class="btn btn-primary" value="+ ADD"></a>';    
            }
            else {
                echo '<input type="button" class="btn btn-secondary" value="+ ADD" disabled>';
            }
            
            echo '</td>';
            echo '</tr>';          
        }
        echo '</table>';        

    }

?>



