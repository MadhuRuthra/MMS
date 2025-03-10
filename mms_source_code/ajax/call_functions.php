<?php
session_start();
error_reporting(E_ALL);
// Include configuration.php
include_once('../api/configuration.php');
// echo "hello";
// echo $call_function.'madhu';

extract($_REQUEST);

// $_SESSION.$uname = $_POST["txt_username"];
// $_SESSION.$password = $_POST['txt_password'];
// echo $uname;
// print_r($_FILES); exit;

$current_date = date("Y-m-d H:i:s");



// echo $call_function.'madhu';
// Index Page Signin - Start
if($_SERVER['REQUEST_METHOD'] == "POST" and $call_function == "signin") {
    // echo "welcome";
   // Get data
	$uname = htmlspecialchars(strip_tags(isset($_REQUEST['txt_username']) ? $conn->real_escape_string($_REQUEST['txt_username']) : ""));
    // echo $uname;
	$password = htmlspecialchars(strip_tags(isset($_REQUEST['txt_password']) ? $conn->real_escape_string($_REQUEST['txt_password']) : ""));
	$upass = md5($password);
	site_log_generate("Index Page : Username => ".$uname." trying to login on ".date("Y-m-d H:i:s"), '../');

	$data_status = 0;
$curl = curl_init();
curl_setopt_array($curl, array(
  CURLOPT_URL =>  $api_url.'/select_query',
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => '',
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 0,
  CURLOPT_FOLLOWLOCATION => true,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => 'POST',
  CURLOPT_POSTFIELDS =>'{
"query":"SELECT * FROM user_management where login_id = \''.$uname.'\' and usr_mgt_status = \'N\' ORDER BY user_id ASC"
}',
  CURLOPT_HTTPHEADER => array(
    'Content-Type: application/json'
  ),
));
$response = curl_exec($curl);
curl_close($curl);
// echo $response;
$qur = json_decode( $response);
	// $sql_stat = $conn->query("SELECT * FROM user_management where login_id = '$uname' and usr_mgt_status = 'N' ORDER BY user_id ASC");
	if ($qur->num_of_rows > 0) { 
		site_log_generate("Index Page : ".$uname." logged in failed [Inactive User] on ".date("Y-m-d H:i:s"), '../');
		$json = array("status" => 0, "msg" => "Inactive User. Kindly contact your admin!");
	} else { 
		$curl = curl_init();
curl_setopt_array($curl, array(
  CURLOPT_URL =>  $api_url.'/select_query',
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => '',
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 0,
  CURLOPT_FOLLOWLOCATION => true,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => 'POST',
  CURLOPT_POSTFIELDS =>'{
"query":"SELECT * FROM user_management where login_id = \''.$uname.'\' and usr_mgt_status = \'Y\' ORDER BY user_id ASC"
}',
  CURLOPT_HTTPHEADER => array(
    'Content-Type: application/json'
  ),
));
$response = curl_exec($curl);
curl_close($curl);
// echo $response;
$qur = json_decode( $response);

		// $sql_login = $conn->query("SELECT * FROM user_management where login_id = '$uname' and usr_mgt_status = 'Y' ORDER BY user_id ASC");
		if ($qur->num_of_rows <= 0) { 
			site_log_generate("Index Page : ".$uname." logged in failed [Invalid User] on ".date("Y-m-d H:i:s"), '../'); 
			$json = array("status" => 0, "msg" => "Invalid User. Kindly try again with the valid User!");
		} else { 
			// $sql = "SELECT * FROM user_management 
			// 					where login_id = '$uname' and login_password = '$upass' and usr_mgt_status = 'Y' 
			// 					ORDER BY user_id ASC";
			// $qur = $conn->query($sql);			
			$curl = curl_init();			
			curl_setopt_array($curl, array(
				CURLOPT_URL =>  $api_url.'/call_index_signin',
				CURLOPT_RETURNTRANSFER => true,
				CURLOPT_ENCODING => '',
				CURLOPT_MAXREDIRS => 10,
				CURLOPT_TIMEOUT => 0,
				CURLOPT_FOLLOWLOCATION => true,
				CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
				CURLOPT_CUSTOMREQUEST => 'POST',
				CURLOPT_POSTFIELDS =>'{
			"txt_username": "'.$uname.'",
			"txt_password": "'.$password.'"
			}',
				CURLOPT_HTTPHEADER => array(
					'Content-Type: application/json'
				),
			));			
			$response = curl_exec($curl);			
			curl_close($curl);
			// echo $response;	
		
			$qur = json_decode( $response);
			// echo "===";	
			// print_r($qur);
			// echo $pass;
			// echo $password;
			// echo "===";
			site_log_generate("Index Page : ".$uname." executed the query ($response) on ".date("Y-m-d H:i:s"), '../'); 
			$result =array();
			if ($qur->num_of_rows > 0) {
				
				for($qur_indicator = 0; $qur_indicator < $qur->num_of_rows; $qur_indicator++){
					$_SESSION['yjtsms_store_id'] 		= $qur->response_result[$qur_indicator]->store_id;
					$_SESSION['yjtsms_user_id'] 			= $qur->response_result[$qur_indicator]->user_id;
					$_SESSION['yjtsms_user_master_id']= $qur->response_result[$qur_indicator]->user_master_id;
					$_SESSION['yjtsms_user_name'] 		= $qur->response_result[$qur_indicator]->user_name;
					$_SESSION['yjtsms_login_password'] 			= $qur->response_result[$qur_indicator]->login_password;

					$_SESSION['yjtsms_login_id'] 			= $qur->response_result[$qur_indicator]->login_id;
					$_SESSION['yjtsms_user_email'] 		= $qur->response_result[$qur_indicator]->user_email;
					$_SESSION['yjtsms_user_mobile'] 	= $qur->response_result[$qur_indicator]->user_mobile;
					$_SESSION['yjtsms_user_otp'] = $qur->response_result[$qur_indicator]->user_otp;
					$_SESSION['yjtsms_user_gender'] 			= $qur->response_result[$qur_indicator]->user_gender;
					$_SESSION['yjtsms_min_age'] 			= $qur->response_result[$qur_indicator]->min_age;
					$_SESSION['yjtsms_max_age'] 			= $qur->response_result[$qur_indicator]->max_age;
					$_SESSION['yjtsms_age_category'] 			= $qur->response_result[$qur_indicator]->age_category;
					$_SESSION['yjtsms_user_image'] 			= $qur->response_result[$qur_indicator]->user_image;
					$_SESSION['yjtsms_aws_uniqueid'] 			= $qur->response_result[$qur_indicator]->aws_uniqueid;
					$_SESSION['yjtsms_usr_mgt_status'] 			= $qur->response_result[$qur_indicator]->usr_mgt_status;
					$_SESSION['yjtsms_usr_mgt_entry_date'] 			= $qur->response_result[$qur_indicator]->usr_mgt_entry_date;
					// $_SESSION['yjtsms_netoptid'] 			= $qur->response_result[$qur_indicator]->user_image;

					// $_SESSION['yjtsms_usraprstat'] 		= $qur->response_result[$qur_indicator]->user_approval_status;

					$result[] = array("usr_id" => $qur->response_result[$qur_indicator]->user_id, "usr_name" => $qur->response_result[$qur_indicator]->user_name, "usr_loginid" => $qur->response_result[$qur_indicator]->login_id, "usr_name" => $qur->response_result[$qur_indicator]->user_name, "usr_email" => $qur->response_result[$qur_indicator]->user_email, "usr_mobile" => $qur->response_result[$qur_indicator]->user_mobile, "usr_mgt_status" => $qur->response_result[$qur_indicator]->usr_mgt_status); 					
				$json = array("status" => 1, "info" => $result);
				site_log_generate("Index Page : ".$uname." logged in successfully on ".date("Y-m-d H:i:s"), '../');
				}
				
			}
             else {
				site_log_generate("Index Page : ".$uname." logged in failed [Invalid Password] on ".date("Y-m-d H:i:s"), '../');
				$json = array("status" => 0, "msg" => "Invalid Password. Kindly try again with the valid details!");
			}
		}
	}	
} 

// Index Page Signin - End

// User Profile Page change_pwd - Start

if($_SERVER['REQUEST_METHOD'] == "POST" and $pwd_call_function == "change_pwd" ) {
	// echo "madhu";
	site_log_generate("Edit Profile - Change Password Page : User : ".$_SESSION['yjtsms_user_name']." access the page on ".date("Y-m-d H:i:s"), '../');
	// Get data
	$ex_password = htmlspecialchars(strip_tags(isset($_REQUEST['txt_ex_password']) ? $_REQUEST['txt_ex_password'] : ""));
	$new_password = htmlspecialchars(strip_tags(isset($_REQUEST['txt_new_password']) ? $_REQUEST['txt_new_password'] : ""));
	$ex_pass = md5($ex_password);
	$upass = md5($new_password);

	// $sql = "SELECT * FROM user_management where user_id = '".$_SESSION['yjtsms_user_id']."' and login_password = '$ex_pass'";
	$curl = curl_init();
curl_setopt_array($curl, array(
  CURLOPT_URL => $api_url.'/select_query',
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => '',
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 0,
  CURLOPT_FOLLOWLOCATION => true,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => 'POST',
  CURLOPT_POSTFIELDS =>'{
"query":"SELECT * FROM user_management where user_id = \''.$_SESSION['yjtsms_user_id'].'\' and login_password = \''.$ex_pass.'\'"
}',
  CURLOPT_HTTPHEADER => array(
    'Content-Type: application/json'
  ),
));
$response = curl_exec($curl);
curl_close($curl);
// echo $response;
$obj = json_decode( $response);
	site_log_generate("Edit Profile - Change Password Page : User : ".$_SESSION['yjtsms_user_name']." executed the query ($response) on ".date("Y-m-d H:i:s"), '../');
	// $qur = $conn->query($sql);
	if ($obj->num_of_rows <= 0) {
		site_log_generate("Edit Profile - Change Password Page : User : ".$_SESSION['yjtsms_user_name']." Password Update failed [Invalid Existing Password] on ".date("Y-m-d H:i:s"), '../');
		$json = array("status" => 0, "msg" => "Invalid Existing Password. Kindly try again!!");
	} else {
			// Change Password into DB
			$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => $api_url.'/update_query',
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => '',
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 0,
  CURLOPT_FOLLOWLOCATION => true,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => 'PUT',
  CURLOPT_POSTFIELDS =>'{
	"table_name" : "user_management",
	"values" : "login_password = \''.$upass.'\'",
	"where_condition" : "user_id = \''.$_SESSION['yjtsms_user_id'].'\'"
}',
  CURLOPT_HTTPHEADER => array(
    'Content-Type: application/json'
  ),
));

$response = curl_exec($curl);

curl_close($curl);
// echo $response;
	$obj = json_decode( $response);
			// $sqls = "UPDATE user_management SET login_password = '$upass' WHERE user_id = ".$_SESSION['yjtsms_user_id'];

	    if ($response) {
				site_log_generate("Edit Profile - Change Password Page : User : ".$_SESSION['yjtsms_user_name']." Password Updated ($response) successfully on ".date("Y-m-d H:i:s"), '../');
	      $json = array("status" => 1, "msg" => "Success");
	    }
	    if ($response->errno) {
				site_log_generate("Edit Profile - Change Password Page : User : ".$_SESSION['yjtsms_user_name']." Password Update failed [Invalid Inputs] on ".date("Y-m-d H:i:s"), '../');
	      $json = array("status" => 0, "msg" => "Invalid Inputs. Kindly try again with the correct Inputs!");
	    }
	}
} 
// User Profile Page change_pwd - End

 // send otp - start
 if($_SERVER['REQUEST_METHOD'] == "POST" and $otp_call_function == "mobile_otp" ) {
	
	site_log_generate("Mobile OTP - Mobile number OTP Page : User : ".$_SESSION['yjtsms_user_name']." access the page on ".date("Y-m-d H:i:s"), '../');      
   $user_number = $_POST['txt_user_mobile'];
//    exit;
// echo $user_number ;
$otp = rand(100000,999999);
// echo $_SESSION['otp'];
$_SESSION['otp'] = $otp ;
$message = "Your OTP is ".$otp."";
$campaign_name = "testcmp";
$api_adminpswd = 'SMS_api!@3';
$api_adminuser = 'user_1';


// echo 'http://115.243.200.60/sms_api/api/smsapi?process=compose_send_sms&username='.$api_adminuser.'&password='.$api_adminpswd.'&campaign_name='.$campaign_name.'&number='.$user_number.'&message=Your%20OTP%20is%20'.$otp;
   $curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => $message_url.'process=compose_send_sms&username='.$api_adminuser.'&password='.$api_adminpswd.'&campaign_name='.$campaign_name.'&number='.$user_number.'&message=Your%20OTP%20is%20'.$otp,
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => '',
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 0,
  CURLOPT_FOLLOWLOCATION => true,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => 'POST',
  CURLOPT_HTTPHEADER => array(
    'Cookie: PHPSESSID=hp9jr2b7q5re7tt3qba2oipn6h'
  ),
));

$response = curl_exec($curl);

curl_close($curl);
// echo $response;

  
   if ($response) {
	site_log_generate("Mobile OTP - Mobile number OTP Page : User : ".$_SESSION['yjtsms_user_name']." OTP Updated ($response) successfully on ".date("Y-m-d H:i:s"), '../');
$json = array("status" => 1, "msg" => "Success");
}
if ($response->errno) {
	site_log_generate("Mobile OTP - Mobile number OTP Page : User : ".$_SESSION['yjtsms_user_name']." OTP Update failed [Invalid Inputs] on ".date("Y-m-d H:i:s"), '../');
$json = array("status" => 0, "msg" => "Invalid otp. Kindly try again with the correct Inputs!");
}
}
 // send otp - END

// Mobile OTP Check Page - Start
if($_SERVER['REQUEST_METHOD'] == "POST" and $otp_check_call_function == "mobile_check_otp" ) {
	// echo "*******************";
	site_log_generate("Mobile OTP - OTP Check Page : User : ".$_SESSION['yjtsms_user_name']." access the page on ".date("Y-m-d H:i:s"), '../');  
// exit;
	$user_otp = $_POST['txt_user_otp'];
	
	if ($_SESSION['otp'] == $user_otp) {
		$_SESSION['otp_status'] ='Y';
		// echo "*******************";
		echo "Otp is valid";
		$json = array("status" => 1, "msg" => "Success");
		// exit;
	}

	else{
		$_SESSION['otp_status']='N';
		$json = array("status" => 0, "msg" => "Invalid otp. Enter a correct OTP!");
		echo "Otp is not valid";
		// exit;
	}	
	
}

// Mobile OTP Check Page - End


// File Upload Check Page - start
// if (isset($_POST['imageUpload']) == "imageUpload") {
// $img = $_POST['image'];
// $folderPath = "upload/";

// $image_parts = explode(";base64,", $img);
// $image_type_aux = explode("image/", $image_parts[0]);
// $image_type = $image_type_aux[1];

// $image_base64 = base64_decode($image_parts[1]);
// $fileName = uniqid() . '.png';

// $file = $folderPath . $fileName;
// file_put_contents($file, $image_base64);

// print_r($fileName);
// $json = array("status" => 1, "msg" =>'imageupload');
// }

// File Upload Check Page - End

// echo $_SESSION['otp_status'];

// Register Page - Start
if($_SERVER['REQUEST_METHOD'] == "POST" and $call_function == "register") {
	
	// Get data
	$user_name 			= htmlspecialchars(strip_tags(isset($_REQUEST['txt_user_name']) ? $_REQUEST['txt_user_name'] : ""));
	
	$user_mobile 			= htmlspecialchars(strip_tags(isset($_REQUEST['txt_user_mobile']) ? $_REQUEST['txt_user_mobile'] : ""));
	$user_email			= htmlspecialchars(strip_tags(isset($_REQUEST['txt_user_email']) ? $_REQUEST['txt_user_email'] : ""));
	// $otp 		= htmlspecialchars(strip_tags(isset($_REQUEST['txt_user_otp']) ? $_REQUEST['txt_user_otp'] : ""));
	// $interest_list		= htmlspecialchars(strip_tags(isset($_REQUEST['list_items']) ? $_REQUEST['list_items'] : ""));
    $imageid  = htmlspecialchars(strip_tags(isset($_REQUEST['imageid']) ? $_REQUEST['imageid'] : ""));
	site_log_generate("Index Page : ".$user_name." trying to create a new account in our site on ".date("Y-m-d H:i:s"), '../');
	// print_r($list_items);
	// echo $imageid;
	foreach ($list_items as $list){ 
		// echo $list."<br/>";
		$interest_list .= $list.",";
	}
	// echo $interest_list	;
// exit;
$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => 'http://yjtec.in:10004/user_registration',
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => '',
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 0,
  CURLOPT_FOLLOWLOCATION => true,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => 'POST',
  CURLOPT_POSTFIELDS =>'{
    "customer_mobile":"'.$user_mobile.'",
    "customer_name":"'.$user_name.'",
    "customer_interest":"'.$interest_list.'",
    "camera_id":"1",
    "image":"'.$imageid.'",
	"otp_verify":"'.$_SESSION['otp_status'].'",
	"customer_email":"'.$user_email.'"
}',
  CURLOPT_HTTPHEADER => array(
    'Content-Type: application/json'
  ),
));

$response = curl_exec($curl);

curl_close($curl);


// echo "****".$response;
$obj = json_decode($response);
// print_r($obj);
if ($obj->response_code == 0) {
	$json = array("status" => 0, "msg" => "$obj->response_msg");
	$json = array("status" => 0, "msg" => "$obj->response_msg");
// 		site_log_generate("Index Page : ".$user_name." Register Creation Failed [mobile Number already used] on ".date("Y-m-d H:i:s"), '../');
	} 
	if($obj->response_code == 1){

		$json = array("status" => 1, "msg" => "$obj->response_msg");
	}
}
	



// echo "*******";
// camera Page - Start
if($_SERVER['REQUEST_METHOD'] == "POST" and $call_function == "camera") {
// echo "*******";
	
	// Get data
	$camera_name 			= htmlspecialchars(strip_tags(isset($_REQUEST['camera_position']) ? $_REQUEST['camera_position'] : ""));
	$ip_address 			= htmlspecialchars(strip_tags(isset($_REQUEST['ip_address']) ? $_REQUEST['ip_address'] : ""));
	$camera_details 		= htmlspecialchars(strip_tags(isset($_REQUEST['txt_camera_details']) ? $_REQUEST['txt_camera_details'] : ""));
	$cameraradio		= htmlspecialchars(strip_tags(isset($_REQUEST['cameraradio']) ? $_REQUEST['cameraradio'] : ""));
	// $interest_list		= htmlspecialchars(strip_tags(isset($_REQUEST['list_items']) ? $_REQUEST['list_items'] : ""));
// echo $cameraradio;
	site_log_generate("Index Page : ".$user_name." trying to create a new account in our site on ".date("Y-m-d H:i:s"), '../');
	// print_r($list_items);
	// foreach ($list_items as $list){ 
	// 	// echo $list."<br/>";
	// 	$interest_list .= $list.",";
	// }
	// echo $list	;

	if($cameraradio == 'start'){
		$cameraradio1 = 'Y';
	}
	if($cameraradio == 'stop'){
		$cameraradio1 = 'N';
	}
		$curl = curl_init();
curl_setopt_array($curl, array(
  CURLOPT_URL => $api_url.'/select_query',
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => '',
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 0,
  CURLOPT_FOLLOWLOCATION => true,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => 'POST',
  CURLOPT_POSTFIELDS =>'{
"query":"SELECT * FROM camera_details where camera_position = \''.$camera_name.'\'"
}',
  CURLOPT_HTTPHEADER => array(
    'Content-Type: application/json'
  ),
));
$response = curl_exec($curl);
curl_close($curl);
// echo $response;
$obj = json_decode( $response);
// print_r($obj);
if ($obj->num_of_rows > 0) {
		site_log_generate("Index Page : ".$camera_name." Register Creation Failed [mobile Number already used] on ".date("Y-m-d H:i:s"), '../');
	} 
	$json = array("status" => 0, "msg" => "User Registeration Updated!!");
	
	// Insert data into data base
	
				$curl = curl_init();
curl_setopt_array($curl, array(
	CURLOPT_URL => $api_url.'/insert_query',
	CURLOPT_RETURNTRANSFER => true,
	CURLOPT_ENCODING => '',
	CURLOPT_MAXREDIRS => 10,
	CURLOPT_TIMEOUT => 0,
	CURLOPT_FOLLOWLOCATION => true,
	CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
	CURLOPT_CUSTOMREQUEST => 'POST',
	CURLOPT_POSTFIELDS =>'{
	 "table_name": "camera_details",
	"variables":"camera_id,store_id, camera_position, ip_address,camera_details,camera_status,camera_entry_date",
	"values": ",Null\''.$list.'\', \''.$camera_name.'\', \''.$ip_address.'\',\''.$camera_details.'\',\''.$cameraradio1.'\',Now()"
		}',
	CURLOPT_HTTPHEADER => array(
		'Content-Type: application/json'
	),
));
$response = curl_exec($curl);
curl_close($curl);
// echo $response;
$sql = json_decode($response);
						 
	site_log_generate("Index Page : ".$user_name." executed the query ($response) on ".date("Y-m-d H:i:s"), '../');
	if ($response) {
					// Get last insert id 
					$lastid = $sql->insert_id;
					// echo $sql->insert_id;
					site_log_generate("Register Page : ".$user_name." User Inserted on ".date("Y-m-d H:i:s"), '../');
	}
	

}
// $json = array("status" => 0, "msg" => " Kindly try again with the Valid mobile Number!");


// Finally Close all Opened Mysql DB Connection
$conn->close();

// Output header with JSON Response
header('Content-type: application/json');
echo json_encode($json);
