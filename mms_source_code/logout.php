<?php 
include_once('api/configuration.php');
header('Cache-Control: no cache'); //no cache // This is for avoid failure in submit form  pagination form details page
session_cache_limiter('private_no_expire, must-revalidate'); // works // This is for avoid failure in submit form  pagination form details page

session_start();
site_log_generate("Logout Page : User : '".$_SESSION['yjtmms_user_name']."' logged out successfully on ".date("Y-m-d H:i:s"));

$_SESSION['yjtmms_user_id']         = '';
$_SESSION['yjtmms_user_master_id']  = '';
$_SESSION['yjtmms_user_name']       = ''; 
$_SESSION['yjtmms_api_key']         = '';
$_SESSION['yjtmms_login_id']        = '';
$_SESSION['yjtmms_user_email']      = '';
$_SESSION['yjtmms_user_mobile']     = '';
$_SESSION['yjtmms_price_per_sms']   = '';
$_SESSION['yjtmms_netoptid']        = '';
$_SESSION['yjtmms_usraprstat']      = '';

$_SESSION = array();
// If it's desired to kill the session, also delete the session cookie.
// Note: This will destroy the session, and not just the session data!
if (ini_get("session.use_cookies")) {
    $params = session_get_cookie_params();
    setcookie(session_name(), '', time() - 42000,
        $params["path"], $params["domain"],
        $params["secure"], $params["httponly"]
    );
}

// Use this too
ini_set('session.gc_max_lifetime', 0);
ini_set('session.gc_probability', 1);
ini_set('session.gc_divisor', 1);


session_write_close();
session_unset(); 
session_destroy();
site_log_generate("Logout Page : All sessions destroyed successfully on ".date("Y-m-d H:i:s"));
?>
<script>window.location="index";</script>