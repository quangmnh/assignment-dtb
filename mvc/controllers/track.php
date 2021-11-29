<?php 

class Track extends Controller {
    public $trackModel;

    public function __construct() {
        $this->trackModel = $this->model('trackModel');
    }

    public function sayHi() {
        $info = [
            "title"=>"Track and Playlist Management page",
            "page"=>"track"
        ];
        $data = [
        ];
        
        $view_data = $info + $data;
        // default action is login
        $this->view("master3", $view_data);
    }

}

?>