<?php 

function randotron(
    int $length = 22,
    string $keyspace = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'): string {
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

class UserModel extends DB {
    public function countUser() {
        $qr = "SELECT COUNT(*) as count FROM `users`";
        $rows =  mysqli_query($this->con, $qr);
        $row = mysqli_fetch_assoc($rows);
        return json_encode($row);       
    }
    public function userList($num_perpage, $page){
        $qr = "SELECT user_id,photo, name, email, country, username,u_cc_id, passwordHash FROM users";
        $rows =  mysqli_query($this->con, $qr);
        $data_arr = array();
        while ( $row = mysqli_fetch_assoc($rows) ) {
            $data_arr[] = $row;
        }
        return json_encode($data_arr);
    }
    public function userAdd($photo, $email, $name, $country, $username, $password){
        // 0 is succ, 1 is not dup username, 2 is dup email, 3 is dup 
        $user_id = randotron();
        $cc_id = randotron();

        $check_name_qr = "SELECT * FROM `users` WHERE `username` = ?";
        $stmt = $this->con->prepare($check_name_qr);
        $stmt->bind_param('s', $username);

        $stmt->execute();
        $stmt->store_result();
        $num_rows = $stmt->num_rows();
    
        if ( $num_rows > 0 )  {
            return 1;
        }

        $check_name_qr = "SELECT * FROM `users` WHERE `email` = ?";
        $stmt = $this->con->prepare($check_name_qr);
        $stmt->bind_param('s', $email);

        $stmt->execute();
        $stmt->store_result();
        $num_rows = $stmt->num_rows();
    
        if ( $num_rows > 0 )  {
            return 2;
        }


        $qr = "INSERT INTO `content_creator` (`cc_id`) VALUES (?);";
        $stmt = $this->con->prepare($qr);
        $stmt->bind_param('s', $cc_id);
        $stmt->execute();

        $qr = "INSERT INTO `users` (`user_id`, `email`, `name`, `country`, `photo`, `username`, `passwordHash`, `u_cc_id`)
                VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
        $stmt = $this->con->prepare($qr);
        $stmt->bind_param('ssssssss', $user_id, $email, $name, $country, $photo, $username, $password, $cc_id);

        if ( $stmt->execute() ) {
            return 0;
        } else {
            return 4;
        }
    }

    public function userEdit($photo, $email, $name, $country, $username, $user_id) {

        $check_name_qr = "SELECT * FROM `users` WHERE `username` = ? AND `User_ID`!= ?;";
        $stmt = $this->con->prepare($check_name_qr);
        $stmt->bind_param('ss', $username, $user_id);

        $stmt->execute();
        $stmt->store_result();
        $num_rows = $stmt->num_rows();
    
        if ( $num_rows > 0 )  {
            return 1;
        }

        $check_name_qr = "SELECT * FROM `users` WHERE `email` = ? AND `User_ID`!= ?;";
        $stmt = $this->con->prepare($check_name_qr);
        $stmt->bind_param('ss', $email, $user_id);

        $stmt->execute();
        $stmt->store_result();
        $num_rows = $stmt->num_rows();
    
        if ( $num_rows > 0 )  {
            return 2;
        }

        $qr = "UPDATE `users` SET `email`= ?, `name`= ?, `country`= ?, `username`= ?, `photo` = ? WHERE User_ID = ?;";
        $stmt = $this->con->prepare($qr);
        $stmt->bind_param('ssssss', $email, $name, $country, $username, $photo, $user_id);
        if ( $stmt->execute() ) {
            return 0;
        } else {
            return 4;
        }
    }

    public function userDelete($user_id){
        $qr = "DELETE FROM `users` WHERE User_ID = ?;";
        $stmt = $this->con->prepare($qr);
        $stmt->bind_param('s', $user_id);
        if ( $stmt->execute() ) {
            return true;
        } else {
            return false;
        }
    }
    public function playBack($user_id){
        
        $qr = "SELECT DISTINCT artist.Name AS artist, Track.Name as track, playback_have_track.Orders as orders FROM `users` JOIN `playback` JOIN `playback_have_track` JOIN `track` JOIN `releases_have_track` JOIN  `releases` JOIN `publish` JOIN `artist`
        ON User_ID = PB_USer_ID AND User_ID = '" . $user_id . "' AND PHT_Playback_ID = Playback_ID AND PHT_Track_ID = Track_ID AND Track_ID = RHT_Track_ID AND Release_ID = RHT_Release_ID AND P_Release_ID = Release_ID AND P_Artist_ID = Artist_ID 
        ORDER BY `playback_have_track`.`Orders`;";

        $rows =  mysqli_query($this->con, $qr);
        $data_arr = array();
        while ( $row = mysqli_fetch_assoc($rows) ) {
            $data_arr[] = $row;
        }
        // echo json_encode($data_arr);
        return json_encode($data_arr);
    }
    public function userReset($password, $user_id) {
        $qr = "UPDATE `users` SET `passwordHash`= ? WHERE User_ID = ?;";
        $stmt = $this->con->prepare($qr);
        $stmt->bind_param('ss', $password, $user_id);
        if ( $stmt->execute() ) {
            return TRUE;
        } else {
            return FALSE;
        }
    }

    public function userSearch($keyword) {
        $qr = "SELECT user_id,photo, name, email, country, username,u_cc_id, passwordHash FROM users
        WHERE name LIKE '%{$keyword}%' OR email LIKE '%{$keyword}%' OR country LIKE '%{$keyword}%' 
        OR username LIKE '%{$keyword}%' OR user_id LIKE '%{$keyword}%'";
        $rows =  mysqli_query($this->con, $qr);
        $data_arr = array();
        while ( $row = mysqli_fetch_assoc($rows) ) {
            $data_arr[] = $row;
        }
        return json_encode($data_arr);
    }
}

?>