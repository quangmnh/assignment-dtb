<?php 

class Home extends Controller {

    public $userModel; 
    public $radioModel; 
    public $ticketModel; 
    public $trackModel; 

    public function __construct() {
        $this->userModel = $this->model('userModel');
        $this->radioModel = $this->model('radioModel');
        $this->ticketModel = $this->model('ticketModel');
        $this->trackModel = $this->model('trackModel');
    }

    public function sayHi() {
        $info = [
            "title"=>"Dashboard",
            "page"=>"home"
        ];
        $data = [
            'user'=>'',
            'radio_channel'=>'',
            'track'=>'',
            'ticket'=>''
        ];
        
        # fetch the data then pass to the $data
        $user = json_decode($this->userModel->countUser(), true);
        $radio = json_decode($this->radioModel->countRadio(), true);
        $ticket = json_decode($this->ticketModel->countTicket(), true);
        $track = json_decode($this->trackModel->countTrack(), true);

        $data = [
            'user'=>$user['count'],
            'radio_channel'=>$radio['count'],
            'track'=>$track['count'],
            'ticket'=>$ticket['count']
        ];

        $view_data = $info + $data;
        // default action is login
        $this->view("master3", $view_data);
    }
}
?>