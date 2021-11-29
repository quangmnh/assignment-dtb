<?php 

class User extends Controller {
    public $userModel;

    public function __construct() {
        $this->userModel = $this->model('userModel');
    }

    public function sayHi() {
        $info = [
            "title"=>"User Management page",
            "page"=>"user"
        ];
        $data = [
            'user'=>0,
            'radio_channel'=>0,
            'track'=>0,
            'ticket'=>0
        ];
        
        $view_data = $info + $data;
        // default action is login
        $this->view("master3", $view_data);
    }

}

?>