<?php 

class TicketModel extends DB {

    public function countTicket() {
        $qr = "SELECT COUNT(*) as count FROM `ticket`";
        $rows =  mysqli_query($this->con, $qr);
        $row = mysqli_fetch_assoc($rows);
        return json_encode($row);
    }
}

?>