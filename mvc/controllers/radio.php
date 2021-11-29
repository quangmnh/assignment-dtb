<?php 

class Radio extends Controller {
    public $radioModel;

    public function __construct() {
        $this->radioModel = $this->model('radioModel');
    }

    public function sayHi() {
        $info = [
            "title"=>"Radio and Producer Management page",
            "page"=>"radio"
        ];
        $data = [
            "qr_res"=>""
        ];
        
        // fetch all radio channel info
        $qr_res = json_decode($this->radioModel->getRadioList(), true);

        $data = [
            "qr_res"=>$qr_res
        ];

        $view_data = $info + $data;
        // default action is login
        $this->view("master3", $view_data);
    }

}

?>