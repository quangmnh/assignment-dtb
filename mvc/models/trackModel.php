<?php

class TrackModel extends DB {

    public function countTrack() {
        $qr = "SELECT COUNT(*) as count FROM `track`";
        $rows =  mysqli_query($this->con, $qr);
        $row = mysqli_fetch_assoc($rows);
        return json_encode($row);    
    }

    public function getSystemPlaylist() {

        $qr = " SELECT P.Playlist_ID as ID, P.Name, P.Photo
                FROM PLAYLIST AS P JOIN SYSTEM_PLAYLIST AS SP ON P.PLAYLIST_ID = SP.SP_PLAYLIST_ID";
        $rows = mysqli_query($this->con, $qr);
        $data_arr = array();
        while ( $row = mysqli_fetch_assoc($rows) ) {
            $data_arr[] = $row;
        }
        return json_encode($data_arr);

    }

    public function getUserPlaylist() {

        $qr = " SELECT P.Playlist_ID as ID, P.Name as P_Name, P.Photo, U.Name as U_Name
                FROM PLAYLIST AS P JOIN (
                    USER_PLAYLIST AS UP JOIN USERS AS U
                    ON UP.UP_USER_ID = U.User_ID
                ) 
                ON P.Playlist_ID = UP.UP_Playlist_ID ";

        $rows = mysqli_query($this->con, $qr);
        $data_arr = array();
        while ( $row = mysqli_fetch_assoc($rows) ) {
            $data_arr[] = $row;
        }
        return json_encode($data_arr);

    }

    public function getTrackList($playlistID) {
        // echo $playlistID.'</br>';

        $qr = " SELECT T.Track_ID as ID, T.Name, T.Duration, TIP.Orders
                FROM  TRACK_IN_PLAYLIST as TIP JOIN TRACK as T
                ON TIP.I_Track_ID = T.Track_ID
                WHERE TIP.I_Playlist_ID = '$playlistID'
                ORDER BY TIP.Orders ";

        $rows = mysqli_query($this->con, $qr);
        $data_arr = array();
        while ( $row = mysqli_fetch_assoc($rows) ) {
            // print_r($row);
            // echo '</br>';
            $data_arr[] = $row;
        }
        return json_encode($data_arr);

    }

    public function getMaxOrders($playlistID) {

        $qr = " SELECT MAX(TIP.Orders) AS MaxOrders
                FROM  TRACK_IN_PLAYLIST as TIP JOIN TRACK as T
                ON TIP.I_Track_ID = T.Track_ID
                WHERE TIP.I_Playlist_ID = '$playlistID'
                ORDER BY TIP.Orders ";

        $rows =  mysqli_query($this->con, $qr);
        $row = mysqli_fetch_assoc($rows);
        return json_encode($row); 

    }

    public function getPlaylist($playlistID) {

        $qr = " SELECT P.Name, P.Photo, P.Playlist_ID as ID
                FROM PLAYLIST as P
                WHERE P.Playlist_ID = '$playlistID'";

        $rows =  mysqli_query($this->con, $qr);
        $row = mysqli_fetch_assoc($rows);
        return json_encode($row); 

    }

    public function updatePlaylistInfo($name, $photoDir, $playlistID) {

        $qr = " UPDATE PLAYLIST as P
                SET P.Name = '$name', P.Photo = '$photoDir'
                WHERE P.Playlist_ID = '$playlistID'";
        
        $result = false;
        if (mysqli_query($this->con, $qr)) {
            $result = true;
        }

        return json_encode($result);
    }

    public function getAllTrack() {

        $qr = " SELECT Track_ID as ID, Name, Duration
                FROM TRACK";

        $rows = mysqli_query($this->con, $qr);
        $data_arr = array();
        while ( $row = mysqli_fetch_assoc($rows) ) {
            $data_arr[] = $row;
        }
        return json_encode($data_arr);

    }

    public function insertTrackToPlaylist($trackID, $playlistID, $orders) {

        // echo $orders;

        $qr = " INSERT INTO TRACK_IN_PLAYLIST VALUES('$trackID', '$playlistID', '$orders', current_timestamp())";

        $res = false;
        if ( mysqli_query($this->con, $qr) ) {
            $res = true;
        }

        return json_encode($res);

    }

    public function deleteTrackInPlaylist($trackID, $playlistID) {

        // echo $trackID.','.$playlistID;

        $qr = " DELETE 
                FROM `track_in_playlist` 
                WHERE       `track_in_playlist`.`I_Track_ID` = '$trackID' 
                        AND `track_in_playlist`.`I_Playlist_ID` = '$playlistID'";

        $res = false;
        if ( mysqli_query($this->con, $qr) ) {
            $res = true;
        }

        return json_encode($res);

    }

    public function getReleaseAndArtistInfoFromTrack($trackID) {

        $qr = " SELECT T.Name as TName, R.Title as RTitle, A.Name as AName , R.Photo
                FROM artist as A JOIN 
                    (publish as P JOIN 
                    (releases as R JOIN 
                    (track as T JOIN releases_have_track as RHT 
                        ON T.Track_ID = RHT.RHT_Track_ID) 
                        ON R.Release_ID = RHT.RHT_Release_ID) 
                        ON P.P_Release_ID = R.Release_ID) 
                        ON A.Artist_ID = P.P_Artist_ID 
                WHERE T.Track_ID = '$trackID'";

        $rows = mysqli_query($this->con, $qr);
        $data_arr = array();
        while ( $row = mysqli_fetch_assoc($rows) ) {
            $data_arr[] = $row;
        }
        return json_encode($data_arr);
    }

    public function getLiveSearchResult($searchText) {

        $qr = " SELECT T.Track_ID as ID, T.Name, T.Duration
                FROM track as T
                WHERE T.Name LIKE '%$searchText%'";

        $rows = mysqli_query($this->con, $qr);
        $data_arr = array();
        while ( $row = mysqli_fetch_assoc($rows) ) {
            $data_arr[] = $row;
        }
        return json_encode($data_arr);

    }

    public function deleteSystemPlaylist($playlistID) {
        
        echo $playlistID;

        $qr = " DELETE 
                FROM playlist
                WHERE playlist.playlist_ID = '$playlistID'";
        
        $res = false;
        if (mysqli_query($this->con, $qr)) {
            $res = true;
        }

        return json_encode($res);

    }

    public function insertNewSystemPlaylist($name, $photo) {

        $cc_id = $this->rand_string(22);

        $playlistID = $this->rand_string(22);
        $qr = " INSERT INTO PLAYLIST VALUES 
                ('$playlistID', 
                 '$name',
                 '$photo',
                 0,
                 0,
                 '$cc_id')";

        $res = false;
        if (mysqli_query($this->con, $qr)) {
            $res = true;
        }

        return json_encode($res);

    }
    
}

?>