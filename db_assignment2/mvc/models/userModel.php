<?php 

class UserModel extends DB {

    public function countUser() {
        $qr = "SELECT COUNT(*) as count FROM `users`";
        $rows =  mysqli_query($this->con, $qr);
        $row = mysqli_fetch_assoc($rows);
        return json_encode($row);       
    }
}

?>