<?php 
class App {
    // http://localhost/periphera/home/sayHi/1/23
    protected $controller = "home";
    protected $action = "sayHi";
    protected $params = [];

    function __construct() {
        // Array ( [0] => home [1] => sayHi [2] => 1 [3] => 23 )
        $arr = $this->urlProcess();
        // print_r($arr);


        //--------------------------------------------------------------//
        // controller process (Xử lí controller)
        if ( isset($arr) ) {
            // Kiểm tra có tồn tại file controller theo đường dẫn hay không 
            if ( file_exists("./mvc/controllers/".$arr[0].".php") ) {
                // Nếu có tồn tại -> thay đổi giá trị mặc định của controller là trang Home
                $this->controller = $arr[0];
                // Unset dùng để drop giá trị arr[0] là page controller
                unset($arr[0]);
            }
        }
        require_once "./mvc/controllers/".$this->controller.".php";


        //--------------------------------------------------------------//
        // action process - Xử lí phần Action
        if ( isset($arr[1]) ) {
            if ( method_exists($this->controller, $arr[1]) ) {
                $this->action = $arr[1];
            }
            // Dùng để drop Action, chừa parameter lại để gán cho biến $param
            unset($arr[1]);
        }


        //--------------------------------------------------------------//
        // param process - Xử lí phần parameter
        $this->params = $arr ? array_values($arr) : [];

        
        //--------------------------------------------------------------//
        // Tạo ra biến, có kiểu là controller, chạy hàm Action (SayHi), tham số truyền vào là Parameter
        call_user_func_array([new $this->controller, $this->action], $this->params);
    }

    function urlProcess() {
        if ( isset($_GET["url"]) ) {
            return explode("/", filter_var(trim($_GET["url"], "/")));
        }
    }
}
?>