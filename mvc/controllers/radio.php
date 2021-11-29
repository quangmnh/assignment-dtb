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
        
        $data = [];

        // fetch all radio channel info
        $radio_res = json_decode($this->radioModel->getRadioList(), true);
        $genre_res = json_decode($this->radioModel->getRadioGenre(), true);
        $schedule_res = json_decode($this->radioModel->getRadioSchedule(), true);
        $producer_res =json_decode($this->radioModel->getProducerList(), true);
        $R_radio_res = json_decode($this->radioModel->getRadioID(), true);

        if (isset($_POST['filter_sched_Radio_ID'])) {
            $data = [
                "radio_res"=>$radio_res,
                "genre_res"=>$genre_res,
                "schedule_res"=>json_decode($this->radioModel->getRadioScheduleByID($_POST['filter_sched_Radio_ID']), true),
                "producer_res"=>$producer_res,
                "R_radio_res"=>$R_radio_res
            ];
        } else {
            $data = [
                "radio_res"=>$radio_res,
                "genre_res"=>$genre_res,
                "schedule_res"=>$schedule_res,
                "producer_res"=>$producer_res,
                "R_radio_res"=>$R_radio_res
            ];
        }

        if (isset($_POST['filter'])) {

        }
        
        $view_data = $info + $data;
        // default action is login
        $this->view("master3", $view_data);
    }

    public function getAll() {
        $radio_res = json_decode($this->radioModel->getRadioList(), true);
        $genre_res = json_decode($this->radioModel->getRadioGenre(), true);
        $schedule_res = json_decode($this->radioModel->getRadioSchedule(), true);
        $producer_res =json_decode($this->radioModel->getProducerList(), true);

        $data = [
            "radio_res"=>$radio_res,
            "genre_res"=>$genre_res,
            "schedule_res"=>$schedule_res,
            "producer_res"=>$producer_res
        ];

        return $data;
    }

    public function ad_add_radio(){
        if($_SERVER['REQUEST_METHOD'] == 'POST'){
            $_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);
            $name =  $_POST['radioName'];
            $frequency = $_POST['radioFrequency'];
            $producer_id =  $_POST['radioProducer'];

            $res = $this->radioModel->ad_createRadio($name, $frequency, $producer_id);
            if ($res) {
                header('Location: .');
            } else {
                echo '<script>alert("Add radio channel failed")</script>';
                echo "<script>window.location.href='.'</script>";
            }
            // $info = [
            //     "title"=>"Radio and Producer Management page",
            //     "page"=>"radio"
            // ];

            // $data = $this->getAll();
            // $view_data = $info + $data;

            // $this->view("master3",$view_data);
        }
    }

    public function ad_edit_radio(){
        if($_SERVER['REQUEST_METHOD'] == 'POST'){
            $_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);
            $radioId = $_POST['radioID-edit'];
            $radioName =  $_POST['radioName1'];
            $radioFrequency = $_POST['radioFrequency1'];
            // echo $radioId;
            // echo $radioName;
            // echo $radioFrequency;
            $res = $this->radioModel->ad_editRadio($radioId, $radioName, $radioFrequency);
            if ($res) {
                header('Location: .');
            } else {
                echo '<script>alert("Edit radio channel failed")</script>';
                echo "<script>window.location.href='.'</script>";
            }

            // $info = [
            //     "title"=>"Radio and Producer Management page",
            //     "page"=>"radio"
            // ];

            // $data = $this->getAll();
            // $view_data = $info + $data;

            // $this->view("master3",$view_data);
        }
    }

    public function ad_delete_radio(){
        if($_SERVER['REQUEST_METHOD'] == 'POST'){
            $_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);
            $id = $_POST['radioID-delete'];
            $res = $this->radioModel->ad_deleteRadio($id);
            if ($res) {
                header('Location: .');
            } else {
                echo '<script>alert("Delete radio channel failed")</script>';
                echo "<script>window.location.href='.'</script>";
            }
        }
    }



    public function ad_add_producer(){
        if($_SERVER['REQUEST_METHOD'] == 'POST'){
            $_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);
            $name =  $_POST['producerName'];
            $address = $_POST['producerAddress'];
            $phoneNumber =  $_POST['producerPhoneNumber'];
            $timeStart = $_POST['producerTimeStart'];
            $timeEnd = $_POST['producerTimeEnd'];
            $cost = $_POST['producerCost'];

            $res = $this->radioModel->ad_createProducer($name, $address, $phoneNumber, $timeStart, $timeEnd, $cost);
            if ($res) {
                header('Location: .');
            } else {
                echo '<script>alert("Add producer failed")</script>';
                echo "<script>window.location.href='.'</script>";
            }
        }
    }

    public function ad_edit_producer(){
        if($_SERVER['REQUEST_METHOD'] == 'POST'){
            $_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);
            $producerId = $_POST['producerID-edit'];
            $name =  $_POST['producerName1'];
            $address = $_POST['producerAddress1'];
            $phoneNumber =  $_POST['producerPhoneNumber1'];
            $timeStart = $_POST['producerTimeStart1'];
            $timeEnd = $_POST['producerTimeEnd1'];
            $cost = $_POST['producerCost1'];
            // echo $radioId;
            // echo $radioName;
            // echo $radioFrequency;
            $res = $this->radioModel->ad_editProducer($producerId, $name, $address, $phoneNumber, $timeStart, $timeEnd, $cost);
            if ($res) {
                header('Location: .');
            } else {
                echo '<script>alert("Edit producer failed")</script>';
                echo "<script>window.location.href='.'</script>";
            }
        }
    }

    public function ad_delete_producer(){
        if($_SERVER['REQUEST_METHOD'] == 'POST'){
            $_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);
            $id = $_POST['producerID-delete'];
            $res = $this->radioModel->ad_deleteProducer($id);
            if ($res) {
                echo '<script>alert("Success")</script>';
                header('Location: .');
            } else {
                echo '<script>alert("Delete producer failed")</script>';
                echo "<script>window.location.href='.'</script>";
            }
        }
    }


    public function ad_add_genre(){
        if($_SERVER['REQUEST_METHOD'] == 'POST'){
            $_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);
            $rg_radio_id =  $_POST['RG_Radio_ID'];
            $genre = $_POST['radioGenre'];
            $res = $this->radioModel->ad_createGenre($rg_radio_id, $genre);
            if ($res) {
                echo '<script>alert("Success")</script>';
                header('Location: .');
            } else {
                echo '<script>alert("Add genre failed")</script>';
                echo "<script>window.location.href='.'</script>";
                // header('Location: .');
            }
        }
    }

    public function ad_delete_genre() {
        if($_SERVER['REQUEST_METHOD'] == 'POST'){
            $_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);
            $id = $_POST['RGradioID-delete'];
            $genre = $_POST['genre-delete'];

            $res = $this->radioModel->ad_deleteGenre($id, $genre);
            if ($res) {
                echo '<script>alert("Success")</script>';
                header('Location: .');
            } else {
                echo '<script>alert("Delete producer failed")</script>';
                echo "<script>window.location.href='.'</script>";
            }
        }
    }

    public function ad_add_schedule() {
        if($_SERVER['REQUEST_METHOD'] == 'POST'){
            $_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);
            $id = $_POST['RS_Radio_ID'];
            $scheduleDate = $_POST['scheduleDate'];
            $scheduleTimeStart = $_POST['scheduleTimeStart'];
            $scheduleTimeEnd = $_POST['scheduleTimeEnd'];
            $scheduleLanguages = $_POST['scheduleLanguages'];
            
            $dateTimestamp = strtotime($scheduleDate);
            $timeStartTimestamp = $dateTimestamp+3600*$scheduleTimeStart;
            $timeEndTimestamp = $dateTimestamp+3600*$scheduleTimeEnd;

            $dateString = date("Y-m-d H:i:s", $dateTimestamp);
            $timeStartString = date("Y-m-d H:i:s", $timeStartTimestamp);
            $timeEndString = date("Y-m-d H:i:s", $timeEndTimestamp);
            
            $res = $this->radioModel->ad_createSchedule($id, $dateString, $timeStartString, $timeEndString, $scheduleLanguages);
            if ($res) {
                echo '<script>alert("Success")</script>';
                header('Location: .');
            } else {
                echo '<script>alert("Add schedule failed")</script>';
                echo "<script>window.location.href='.'</script>";
            }
        }
    }

    public function ad_delete_schedule() {
        if($_SERVER['REQUEST_METHOD'] == 'POST'){
            $_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);
            $id = $_POST['RSradioID-delete'];
            $scheduleDate = $_POST['date-delete'];
            $scheduleTimeStart = $_POST['timeStart-delete'];
            $scheduleTimeEnd = $_POST['timeEnd-delete'];
            $scheduleLanguages = $_POST['languages-delete'];

            $res = $this->radioModel->ad_deleteSchedule($id, $scheduleDate, $scheduleTimeStart, $scheduleTimeEnd, $scheduleLanguages);
            if ($res) {
                echo '<script>alert("Success")</script>';
                header('Location: .');
            } else {
                echo '<script>alert("Delete schedule failed")</script>';
                echo "<script>window.location.href='.'</script>";
            }
        }
    }    
}

?>