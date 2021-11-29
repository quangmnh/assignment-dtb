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
        $data = [
        ];
        
        $view_data = $info + $data;
        // default action is login
        $this->view("master3", $view_data);
    }

}

?>