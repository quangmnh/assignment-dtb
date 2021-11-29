<?php 

class TicketModel extends DB {

    function generateRandomString($length = 22) {
        $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $charactersLength = strlen($characters);
        $randomString = '';
        for ($i = 0; $i < $length; $i++) {
            $randomString .= $characters[rand(0, $charactersLength - 1)];
        }
        return $randomString;
    }

    public function countTicket() {
        $qr = "SELECT COUNT(*) as count FROM `ticket`";
        $rows =  mysqli_query($this->con, $qr);
        $row = mysqli_fetch_assoc($rows);
        return json_encode($row);
    }

    public function getTicketList() {
        $qr = "SELECT users.Name, ticket.* from ticket, users where User_id = T_User_ID ORDER BY TicketTimestamp DESC;";
        $rows =  mysqli_query($this->con, $qr);
        $data_arr = array();
        while ( $row = mysqli_fetch_assoc($rows) ) {
            $data_arr[] = $row;
        }
        return json_encode($data_arr);
    }
    public function insertTicket($issue) {
        $ticket_id = $this->generateRandomString();
        $user_id = "doT6m44UpIAP7uUBzBOUFQ";
        $qr = "INSERT INTO ticket(Ticket_ID, T_User_ID, Issue, Status) VALUES ('$ticket_id', '$user_id', '$issue', False)";
        mysqli_query($this->con, $qr);
    }

    public function deleteTicket($id) {
        $qr ="DELETE FROM ticket WHERE Ticket_ID='$id'";
        mysqli_query($this->con, $qr);
    }

    public function updateTicket($id, $reissue, $timestamp, $status) {
        $qr ="UPDATE TICKET SET Issue='$reissue', TicketTimestamp='$timestamp', Status='$status' WHERE Ticket_ID='$id' ";
        mysqli_query($this->con, $qr);
    }

    public function searchTicket($searchname) {
        $qr ="SELECT users.Name, ticket.* from ticket, users where User_id = T_User_ID AND (Name LIKE '%$searchname%' OR Issue LIKE '%$searchname%') ORDER BY TicketTimestamp DESC;";
        $rows = mysqli_query($this->con, $qr);
        $data_arr = array();
        while ( $row = mysqli_fetch_assoc($rows) ) {
            $data_arr[] = $row;
        }
        return json_encode($data_arr);
    }
}

?>