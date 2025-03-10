<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST');
header("Access-Control-Allow-Headers: X-Requested-With");
header('Content-type: application/json; charset=utf-8');
session_start();
error_reporting(E_ALL);

// Include configuration.php
include_once('configuration.php');
extract($_REQUEST);

$current_date = date("Y-m-d H:i:s");
site_log_generate("Data Backup API Page : User : '".$_REQUEST['username']."' access this page on ".date("Y-m-d H:i:s"), '../');

// Current hour based get data and display in dashboard chart - get_dashboard_linechart_data - Start
if($_SERVER['REQUEST_METHOD'] == "GET" and $process == "get_dashboard_linechart_data") {
	$today_date = date("Y-m-d");
	$yesterday_date = date('Y-m-d', strtotime("-1 days"));
	$yesterday_date_db = date('dmY', strtotime("-1 days"));

	$create_query = 'select hour(visitor_list_entdate) hour_time, count(visitor_list_id) visitor_count from visitor_list where (date(visitor_list_entdate) BETWEEN \''.$today_date.'\' AND \''.$today_date.'\') and hour(now()) = hour(visitor_list_entdate) group by hour(visitor_list_entdate) order by visitor_list_entdate asc';

	$visitor_count_graph = ''; $hour_time = 0; $visitor_count = 0;
	$result = $conn->query($create_query);
	if ($result->num_rows>0){
		while ($response = $result->fetch_object()) {
			$hour_time    	= $response->hour_time;
			$visitor_count  = $response->visitor_count;
		}
	}
	// $visitor_count_graph = rtrim($visitor_count_graph, ", ");

	/* $create_query = 'select hour(visitor_list_entdate) hour_time, count(visitor_list_id) visitor_count from `visitor_list_'.$yesterday_date_db.'` where (date(visitor_list_entdate) BETWEEN \''.$yesterday_date.'\' AND \''.$yesterday_date.'\') group by hour(visitor_list_entdate) order by visitor_list_entdate asc';

	$yesterday_visitor_count_graph = '';
	$result = $conn1->query($create_query);
	if ($result->num_rows>0){
		while ($response = $result->fetch_object()) {
			$yesterday_visitor_count_graph    .= "{ x: ".$response->hour_time.", y: ".$response->visitor_count." },";
		}
	}
	$yesterday_visitor_count_graph = rtrim($yesterday_visitor_count_graph, ", "); */

	if($visitor_count > 0) {
		$json = array("status_code" => 200, "hour_time" => $hour_time, "visitor_count" => $visitor_count);
	}
	else {
		$json = array("status_code" => 400, "status_msg" => "Failure");
	}
}
// Current hour based get data and display in dashboard chart - get_dashboard_linechart_data - End

// Finally Close all Opened Mysql DB Connection
$conn->close();

// Output header with JSON Response
header('Content-type: application/json; charset=utf-8');
echo json_encode($json);
