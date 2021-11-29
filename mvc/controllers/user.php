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
        $userl = json_decode($this->userModel->userList(5,1), true);
        $data = [
            'user'=>0,
            'userl'=>$userl,
            'radio_channel'=>0,
            'track'=>0,
            'ticket'=>0
        ];
        $view_data = $info + $data;
        // default action is login
        $this->view("master3", $view_data);
    }
    public function add_user(){
        if($_SERVER['REQUEST_METHOD'] == 'POST'){
            $photo = $_POST['user_photo'];
            $email = $_POST['user_email']; 
            $name = $_POST['user_name']; 
            $email = $_POST['user_email']; 
            $country = $_POST['user_country']; 
            $username = $_POST['user_username']; 
            $password = $_POST['user_password'];

            $res = $this->userModel->userAdd($photo, $email, $name, $country, $username, $password);
            if ($res==0) {
                echo '<script>alert("Added user successfully")</script>';
                echo "<script>window.location.href='.'</script>";
            } 
            else if ($res==1) {
                echo '<script>alert("User name duplicated")</script>';
                echo "<script>window.location.href='.'</script>";
            } 
            else if ($res==2) {
                echo '<script>alert("Email duplicated")</script>';
                echo "<script>window.location.href='.'</script>";
            } 
            else {
                echo '<script>alert("Added user failed")</script>';
                echo "<script>window.location.href='.'</script>";
            }
        }
    }

    public function edit_user(){
        if($_SERVER['REQUEST_METHOD'] == 'POST'){
            $photo = $_POST['user_photo1'];
            $email = $_POST['user_email1']; 
            $name = $_POST['user_name1']; 
            $country = $_POST['user_country2']; 
            $username = $_POST['user_username1']; 
            $user_id = $_POST['user_userid'];

            $res = $this->userModel->userEdit($photo, $email, $name, $country, $username, $user_id);
            if ($res==0) {
                echo '<script>alert("Edited user successfully")</script>';
                echo "<script>window.location.href='.'</script>";
            } 
            else if ($res==1) {
                echo '<script>alert("Editted user failed, duplicate username")</script>';
                echo "<script>window.location.href='.'</script>";
            }
            else if ($res==2) {
                echo '<script>alert("Editted user failed, duplicated email")</script>';
                echo "<script>window.location.href='.'</script>";
            }
            else {
                echo '<script>alert("Editted user failed")</script>';
                echo "<script>window.location.href='.'</script>";
            }
        }
    }
    public function delete_user(){
        if($_SERVER['REQUEST_METHOD'] == 'POST'){
            $user_id = $_POST['user_id_delete'];
            $res = $this->userModel->userDelete($user_id);
            if ($res) {
                echo '<script>alert("Edited user successfully")</script>';
                echo "<script>window.location.href='.'</script>";
            } 
            else {
                echo '<script>alert("Deleted user failed")</script>';
                echo "<script>window.location.href='.'</script>";
            }
        }
    }
    public function playback_list(){
        if($_SERVER['REQUEST_METHOD'] == 'POST'){
            $user_id = $_POST['user_id_pb'];
            $res = $this->userModel->playBack($user_id);
            if (isset($res)) {
                $data = [
                    'user_pb'=>$res,
                ];
                echo ($res);
            } 
        }
    }
    public function user_reset_password(){
        if($_SERVER['REQUEST_METHOD'] == 'POST'){
            $password = $_POST['user_password1'];
            $user_id = $_POST['user_userid1'];

            $res = $this->userModel->userReset($password, $user_id);
            if ($res) {
                echo '<script>alert("Reset password successfully")</script>';
                echo "<script>window.location.href='.'</script>";
            } 
            else {
                echo '<script>alert("Reset password failed")</script>';
                echo "<script>window.location.href='.'</script>";
            }
        }
    }
    public function userSearch() {
        if($_SERVER['REQUEST_METHOD'] == 'POST'){
            $info = [
                "title"=>"User Management page",
                "page"=>"user"
            ];
            $userl = json_decode($this->userModel->userSearch($_POST['keyword']), true);
            $data = [
                'user_keyword'=>$_POST['keyword'],
                'user'=>0,
                'userl'=>$userl,
                'radio_channel'=>0,
                'track'=>0,
                'ticket'=>0
            ];
            $view_data = $info + $data;
            // default action is login
            $this->view("master3", $view_data);
        }
    }
}

?>