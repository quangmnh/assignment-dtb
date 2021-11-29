<?php 

function random_str(
    int $length = 22,
    string $keyspace = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
): string {
    if ($length < 1) {
        throw new \RangeException("Length must be a positive integer");
    }
    $pieces = [];
    $max = mb_strlen($keyspace, '8bit') - 1;
    for ($i = 0; $i < $length; ++$i) {
        $pieces []= $keyspace[random_int(0, $max)];
    }
    return implode('', $pieces);
}

class RadioModel extends DB {

    public function countRadio() {
        $qr = "SELECT COUNT(*) as count FROM `radio`";
        $rows = mysqli_query($this->con, $qr);
        $row = mysqli_fetch_assoc($rows);
        return json_encode($row);
    }

    public function getRadioList() {
        $qr = "SELECT `radio`.Radio_ID, `radio`.R_Producer_ID, `radio`.Name, `radio`.Frequency, producer.Name as `Producer` FROM radio JOIN producer ON `radio`.R_Producer_ID = `producer`.Producer_ID;";
        $rows =  mysqli_query($this->con, $qr);
        $data_arr = array();
        while ( $row = mysqli_fetch_assoc($rows) ) {
            $data_arr[] = $row;
        }
        return json_encode($data_arr);
    }

    public function getProducerList() {
        $qr = "SELECT * FROM `producer`";
        $rows = mysqli_query($this->con, $qr);
        $data_arr = array();
        while ( $row = mysqli_fetch_assoc($rows) ) {
            $data_arr[] = $row;
        }
        return json_encode($data_arr);
    }
    
    public function getRadioGenre() {
        $qr = "SELECT `radio_genre`.RG_Radio_ID ,`radio`.Name, `radio_genre`.Genre FROM `radio_genre` JOIN `radio` ON `radio_genre`.RG_Radio_ID = `radio`.Radio_ID";
        $rows = mysqli_query($this->con, $qr);
        $data_arr = array();
        while ( $row = mysqli_fetch_assoc($rows) ) {
            $data_arr[] = $row;
        }
        return json_encode($data_arr);
    }

    public function getRadioGenreByID($id) {
        $qr = "SELECT `radio_genre`.RG_Radio_ID ,`radio`.Name, `radio_genre`.Genre FROM `radio_genre` JOIN `radio` ON `radio_genre`.RG_Radio_ID = `radio`.Radio_ID WHERE `radio_genre`.RG_Radio_ID = $id;";
        $rows = mysqli_query($this->con, $qr);
        $data_arr = array();
        while ( $row = mysqli_fetch_assoc($rows) ) {
            $data_arr[] = $row;
        }
        return json_encode($data_arr);
    }

    public function getRadioSchedule() {
        $qr = "SELECT `radio_schedule`.RS_Radio_ID, `radio`.Name, `radio_schedule`.`Date`, `radio_schedule`.`TimeStart`, `radio_schedule`.`TimeEnd`, `radio_schedule`.`Languages` FROM `radio_schedule` JOIN `radio` ON `radio_schedule`.`RS_Radio_ID` = `radio`.`Radio_ID`;";
        $rows = mysqli_query($this->con, $qr);
        $data_arr = array();
        while ( $row = mysqli_fetch_assoc($rows) ) {
            $data_arr[] = $row;
        }
        return json_encode($data_arr);
    }

    public function getRadioScheduleByID($id) {
        $qr = "SELECT `radio_schedule`.RS_Radio_ID, `radio`.Name, `radio_schedule`.`Date`, `radio_schedule`.`TimeStart`, `radio_schedule`.`TimeEnd`, `radio_schedule`.`Languages` FROM `radio_schedule` JOIN `radio` ON `radio_schedule`.`RS_Radio_ID` = `radio`.`Radio_ID` WHERE `radio_schedule`.RS_Radio_ID = '".$id."';";
        $rows = mysqli_query($this->con, $qr);
        if (!mysqli_query($this->con, $qr)) {
            echo mysqli_error($this->con);
        }
        $data_arr = array();
        while ( $row = mysqli_fetch_assoc($rows) ) {
            $data_arr[] = $row;
        }
        return json_encode($data_arr);
    }

    public function ad_createRadio($name, $frequency, $producer_id) {
        $radio_id = random_str();
        $cc_id = random_str();

        $check_name_qr = "SELECT * FROM `radio` WHERE `Name` = ?";
        $stmt = $this->con->prepare($check_name_qr);
        $stmt->bind_param('s', $name);

        $stmt->execute();
        $stmt->store_result();
        $num_rows = $stmt->num_rows();
    
        if ( $num_rows > 0 )  {
            return false;
        }

        $qr = "INSERT INTO `radio` (`Name`, `Frequency`, `R_Producer_ID`, `Radio_ID`, `R_CC_ID`)
                    VALUES (?, ?, ?, ?, ?);";
        $stmt = $this->con->prepare($qr);
        $stmt->bind_param('sdsss', $name, $frequency, $producer_id, $radio_id, $cc_id);

        if ( $stmt->execute() ) {
            return true;
        } else {
            return false;
        }
    }

    public function ad_editRadio($id, $radioName, $radioFrequency) {
        $query = "UPDATE `radio` SET `Name`= ?, `Frequency`= ? WHERE Radio_ID = ?";
        $stmt = $this->con->prepare($query);
        $stmt->bind_param('sds', $radioName, $radioFrequency, $id);
        if ( $stmt->execute() ) {
            return true;
        } else {
            return false;
        }
    }

    public function ad_deleteRadio($id) {
        $qr = "DELETE FROM `radio` WHERE Radio_ID = ?;";
        $stmt = $this->con->prepare($qr);
        $stmt->bind_param('s', $id);
        if ( $stmt->execute() ) {
            return true;
        } else {
            return false;
        }
    }


    public function ad_createProducer($name, $address, $phoneNumber, $timeStart, $timeEnd, $cost) {
        $producer_id = random_str();

        $check_name_qr = "SELECT * FROM `producer` WHERE `Name` = ?";
        $stmt = $this->con->prepare($check_name_qr);
        $stmt->bind_param('s', $name);

        $stmt->execute();
        $stmt->store_result();
        $num_rows = $stmt->num_rows();
    
        if ( $num_rows > 0 )  {
            return false;
        }

        $qr = "INSERT INTO `producer` (`Producer_ID`, `Name`, `Address`, `PhoneNumber`, `TimeStart`, `TimeEnd`, `Cost`)
                    VALUES (?, ?, ?, ?, STR_TO_DATE(?, '%m/%d/%Y'), STR_TO_DATE(?, '%m/%d/%Y'), ?);";
        $stmt = $this->con->prepare($qr);
        $stmt->bind_param('ssssssi', $producer_id, $name, $address, $phoneNumber, $timeStart, $timeEnd, $cost);

        if ( $stmt->execute() ) {
            return true;
        } else {
            return false;
        }
    }

    public function ad_editProducer($id, $name, $address, $phoneNumber, $timeStart, $timeEnd, $cost) {
        $query = "UPDATE `producer` SET `Name`= ?, `Address`= ?, `PhoneNumber`=?, `TimeStart`=STR_TO_DATE(?, '%m/%d/%Y'), `TimeEnd`=STR_TO_DATE(?, '%m/%d/%Y'), `Cost`=?  WHERE Producer_ID = ?";
        $stmt = $this->con->prepare($query);
        $stmt->bind_param('sssssis', $name, $address, $phoneNumber, $timeStart, $timeEnd, $cost, $id);
        if ( $stmt->execute() ) {
            return true;
        } else {
            return false;
        }
    }

    public function ad_deleteProducer($id) {
        $qr = "DELETE FROM `producer` WHERE Producer_ID = ?;";
        $stmt = $this->con->prepare($qr);
        $stmt->bind_param('s', $id);
        if ( $stmt->execute() ) {
            return true;
        } else {
            return false;
        }
    }


    public function ad_createGenre($rg_radio_id, $genre) {

        $check_qr = "SELECT * FROM `radio_genre` WHERE `RG_Radio_ID` = ? AND `Genre` = ?";
        $stmt = $this->con->prepare($check_qr);
        $stmt->bind_param('ss', $rg_radio_id, $genre);

        $stmt->execute();
        $stmt->store_result();
        $num_rows = $stmt->num_rows();
    
        if ( $num_rows > 0 )  {
            return false;
        }

        $qr = "INSERT INTO `radio_genre` (`RG_Radio_ID`, `Genre`)
                    VALUES (?, ?);";
        $stmt = $this->con->prepare($qr);
        $stmt->bind_param('ss', $rg_radio_id, $genre);

        if ( $stmt->execute() ) {
            return true;
        } else {
            return false;
        }
    }

    public function ad_deleteGenre($id, $genre) {
        $qr = "DELETE FROM `radio_genre` WHERE RG_Radio_ID = ? AND Genre = ?;";
        $stmt = $this->con->prepare($qr);
        $stmt->bind_param('ss', $id, $genre);
        if ( $stmt->execute() ) {
            return true;
        } else {
            return false;
        }
    }

    public function getRadioID() {
        $qr = "SELECT `radio`.Radio_ID, `radio`.Name FROM `radio`";
        $rows = mysqli_query($this->con, $qr);
        $data_arr = array();
        while ( $row = mysqli_fetch_assoc($rows) ) {
            $data_arr[] = $row;
        }
        return json_encode($data_arr);
    }

    public function ad_createSchedule($id, $date, $timeStart, $timeEnd, $languages) {
        $check_qr = "SELECT * FROM `radio_schedule` WHERE `RS_Radio_ID` = ? AND `Date` = ? AND `TimeStart` = ? AND `TimeEnd` = ? AND `Languages` = ?;";
        $stmt = $this->con->prepare($check_qr);
        $stmt->bind_param('sssss', $id, $date, $timeStart, $timeEnd, $languages);

        $stmt->execute();
        $stmt->store_result();
        $num_rows = $stmt->num_rows();
    
        if ( $num_rows > 0 )  {
            return false;
        }

        $qr = "INSERT INTO `radio_schedule` VALUES (?, ?, ?, ?, ?);";
        $stmt = $this->con->prepare($qr);
        $stmt->bind_param('sssss', $id, $date, $timeStart, $timeEnd, $languages);

        if ( $stmt->execute() ) {
            return true;
        } else {
            return false;
        }
    }

    public function ad_deleteSchedule($id, $date, $timeStart, $timeEnd, $languages) {
        $qr = "DELETE FROM `radio_schedule` WHERE RS_Radio_ID = ? AND `Date` = ? AND `TimeStart` = ? AND `TimeEnd` = ? AND `Languages` = ?;";
        $stmt = $this->con->prepare($qr);
        $stmt->bind_param('sssss', $id, $date, $timeStart, $timeEnd, $languages);
        // $stmt->bind_param('isssi', $languages, $languages, $languages, $languages, $languages);
        if ( $stmt->execute() ) {
            return true;
        } else {
            return false;
        }
    }
}

?>