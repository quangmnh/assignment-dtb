<?php 

class Ticket extends Controller {
    public $ticketModel;

    public function __construct() {
        $this->ticketModel = $this->model('ticketModel');
    }

    public function sayHi() {
        $info = [
            "title"=>"Ticket Management page",
            "page"=>"ticket"
        ];

        $qr_res = [];
        
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            if(!empty($_POST['searchname'])) {
                global $qr_res;
                $qr_res = json_decode($this->ticketModel->searchTicket($_POST['searchname']), true);
            } else {
                if(!empty($_POST['issue'])) $this->ticketModel->insertTicket($_POST['issue']);
                if(!empty($_POST['delete'])) $this->ticketModel->deleteTicket($_POST['delete']);
                if(!empty($_POST['reissue'])) $this->ticketModel->updateTicket($_POST['Ticket_ID'], $_POST['reissue'], $_POST['TicketTimestamp'], $_POST['status']);
                global $qr_res;
                $qr_res = json_decode($this->ticketModel->getTicketList(), true);
            }
        } else {
            global $qr_res;
            $qr_res = json_decode($this->ticketModel->getTicketList(), true);
        }

        $data = [
            "qr_res"=>$qr_res
        ];

        $view_data = $info + $data;
        // default action is login
        $this->view("master3", $view_data);
    }

}

?>