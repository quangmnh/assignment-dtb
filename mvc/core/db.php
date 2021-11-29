<?php 

class DB {

    public $con;
    private $servername = "localhost";
    private $username = "root";
    private $password = "";
    private $dbname = "assignment2";

    function __construct() {
        $this->con = mysqli_connect($this->servername, $this->username, $this->password);
        mysqli_select_db($this->con, $this->dbname);
        // mysqli_query($this->con, "SET NAMES 'utf8'"); // this only use to display vietnamese
    }

    public function rand_string($length) {
        $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $charactersLength = strlen($characters);
        $randomString = '';
        for ($i = 0; $i < $length; $i++) {
            $randomString .= $characters[rand(0, $charactersLength - 1)];
        }
        return $randomString;
    }
}

?>