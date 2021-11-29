<?php

class TrackModel extends DB {

    public function countTrack() {
        $qr = "SELECT COUNT(*) as count FROM `track`";
        $rows =  mysqli_query($this->con, $qr);
        $row = mysqli_fetch_assoc($rows);
        return json_encode($row);    
    }

}

?>