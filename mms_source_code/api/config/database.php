<?php
class Database{
 
    // specify your own database credentials
    // private $host = "localhost";
    // private $db_name = "smsapi";
    // private $username = "root";
    // private $password = "SmS@aPI.*";
    private $host = "192.168.1.27";
    private $db_name = "mms_service";
    private $username = "admin";
    private $password = "Password@123";
/*    private $host = "localhost";
    private $db_name = "mms_service";
    private $username = "root";
    private $password = "";*/
   
    public $conn;
 
    // get the database connection
    public function getConnection(){
 
        $this->conn = null;
 
        try{
            $this->conn = new PDO("mysql:host=" . $this->host . ";dbname=" . $this->db_name, $this->username, $this->password);
            $this->conn->exec("set names utf8");
        }catch(PDOException $exception){
            echo "Connection error: " . $exception->getMessage();
        }
 
        return $this->conn;
    }
}
?>
