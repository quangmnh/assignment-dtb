<?php 

class RadioModel extends DB {

    public function countRadio() {
        $qr = "SELECT COUNT(*) as count FROM `radio`";
        $rows = mysqli_query($this->con, $qr);
        $row = mysqli_fetch_assoc($rows);
        return json_encode($row);
    }

    public function getRadioList() {
        $qr = "SELECT radio.Name, Frequency, producer.Name as `Producer` FROM radio JOIN producer ON radio.R_Producer_ID = producer.Producer_ID;";
        $rows =  mysqli_query($this->con, $qr);
        $data_arr = array();
        while ( $row = mysqli_fetch_assoc($rows) ) {
            $data_arr[] = $row;
        }
        return json_encode($data_arr);
    }
    
}

?>