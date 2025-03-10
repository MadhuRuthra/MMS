<?php
session_start();
error_reporting(0);
include_once('api/configuration.php');
extract($_REQUEST);

 if($_SESSION['yjtsms_user_id'] == ""){ ?>
		<script>window.location="index";</script>
<?php exit();
}

$site_page_name = pathinfo($_SERVER['PHP_SELF'], PATHINFO_FILENAME);
site_log_generate("Dashboard Page : User : ".$_SESSION['yjtmms_user_name']." access the page on ".date("Y-m-d H:i:s"));
$today_date = date("Y-m-d");
$yesterday_date = date('Y-m-d', strtotime("-1 days"));
$yesterday_date_db = date('dmY', strtotime("-1 days"));

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
 		"query" : "SELECT count(DISTINCT visitor_id) cnt_visitor_id, count(visitor_list_id) cnt_visitor, (select count(visitor_list_id) from visitor_list where (date(visitor_list_entdate) BETWEEN \''.$today_date.'\' AND \''.$today_date.'\') and visitor_gender = \"M\" ) cnt_male, (select count(DISTINCT visitor_id) from visitor_list where (date(visitor_list_entdate) BETWEEN \''.$today_date.'\' AND \''.$today_date.'\') and visitor_gender = \"M\" ) cnt_unique_male, (select count(visitor_list_id) from visitor_list where (date(visitor_list_entdate) BETWEEN \''.$today_date.'\' AND \''.$today_date.'\') and visitor_gender = \"F\") cnt_female, (select count(DISTINCT visitor_id) from visitor_list where (date(visitor_list_entdate) BETWEEN \''.$today_date.'\' AND \''.$today_date.'\') and visitor_gender = \"F\") cnt_unique_female, (select count(visitor_list_id) from visitor_list where (date(visitor_list_entdate) BETWEEN \''.$today_date.'\' AND \''.$today_date.'\') and visitor_gender = \"O\") cnt_others, (select count(DISTINCT visitor_id) from visitor_list where (date(visitor_list_entdate) BETWEEN \''.$today_date.'\' AND \''.$today_date.'\') and visitor_gender = \"O\") cnt_unique_others, (select distinct (SELECT count(vl.visitor_list_id) FROM visitor_list vl where (date(vl.visitor_list_entdate) BETWEEN \''.$today_date.'\' AND \''.$today_date.'\') and ( SELECT round(((sum(min_age) + sum(max_age)) / 2)) FROM visitor_list svl WHERE svl.visitor_list_id = vl.visitor_list_id ) < 13) below_13 from visitor_list vis group by vis.visitor_list_id) cnt_kids, (select distinct (SELECT count(vl.visitor_list_id) FROM visitor_list vl where (date(vl.visitor_list_entdate) BETWEEN \''.$today_date.'\' AND \''.$today_date.'\') and ( SELECT round(((sum(min_age) + sum(max_age)) / 2)) FROM visitor_list svl WHERE svl.visitor_list_id = vl.visitor_list_id ) > 13) above_13 from visitor_list vis group by vis.visitor_list_id) cnt_adult, (select count(customer_id) from customer_management where (date(cus_mgt_entry_date) BETWEEN \''.$today_date.'\' AND \''.$today_date.'\')) cnt_registration FROM visitor_list where (date(visitor_list_entdate) BETWEEN \''.$today_date.'\' AND \''.$today_date.'\')"
	}',
	CURLOPT_HTTPHEADER => array(
		'Content-Type: application/json'
	),
));
$response = curl_exec($curl);
curl_close($curl);
// print_r($response);
site_log_generate("Dashboard Page : User : ".$_SESSION['yjtmms_user_name']." executed the Query ($response) on ".date("Y-m-d H:i:s"));
$res_dashboard = json_decode($response);
$cnt_visitor = 0; $cnt_male = 0; $cnt_female = 0; $cnt_unique_male = 0; $cnt_unique_female = 0; $cnt_others = 0; $cnt_unique_others = 0; $cnt_registration = 0;

if ($res_dashboard->num_of_rows > 0) {
	for($dash_indicator = 0; $dash_indicator < $res_dashboard->num_of_rows; $dash_indicator++){
 $cnt_visitor_id = $res_dashboard->result[$dash_indicator]->cnt_visitor_id; 
		$cnt_visitor        = $res_dashboard->result[$dash_indicator]->cnt_visitor;
		$cnt_male           = $res_dashboard->result[$dash_indicator]->cnt_male;
		$cnt_unique_male    = $res_dashboard->result[$dash_indicator]->cnt_unique_male;
		$cnt_female         = $res_dashboard->result[$dash_indicator]->cnt_female;
		$cnt_unique_female  = $res_dashboard->result[$dash_indicator]->cnt_unique_female;
    $cnt_others         = $res_dashboard->result[$dash_indicator]->cnt_others;
    $cnt_unique_others  = $res_dashboard->result[$dash_indicator]->cnt_unique_others;
    $cnt_adult          = $res_dashboard->result[$dash_indicator]->cnt_adult;
    $cnt_kids           = $res_dashboard->result[$dash_indicator]->cnt_kids;
		$cnt_registration   = $res_dashboard->result[$dash_indicator]->cnt_registration;
  }
}

// echo 'select hour(visitor_list_entdate) hour_time, count(visitor_list_id) visitor_count from visitor_list where (date(visitor_list_entdate) BETWEEN \''.$today_date.'\' AND \''.$today_date.'\') group by hour(visitor_list_entdate) order by visitor_list_entdate asc';
$curl1 = curl_init();
curl_setopt_array($curl1, array(
	CURLOPT_URL => $api_url.'/select_query',
	CURLOPT_RETURNTRANSFER => true,
	CURLOPT_ENCODING => '',
	CURLOPT_MAXREDIRS => 10,
	CURLOPT_TIMEOUT => 0,
	CURLOPT_FOLLOWLOCATION => true,
	CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
	CURLOPT_CUSTOMREQUEST => 'POST',
	CURLOPT_POSTFIELDS =>'{
 		"query" : "select hour(visitor_list_entdate) hour_time, count(visitor_list_id) visitor_count from visitor_list where (date(visitor_list_entdate) BETWEEN \''.$today_date.'\' AND \''.$today_date.'\') group by hour(visitor_list_entdate) order by visitor_list_entdate asc"
	}',
	CURLOPT_HTTPHEADER => array(
		'Content-Type: application/json'
	),
));
$response1 = curl_exec($curl1);
curl_close($curl1);

site_log_generate("Dashboard Page : User : ".$_SESSION['yjtmms_user_name']." executed the Query ($response1) on ".date("Y-m-d H:i:s"));
$res_dashboard1 = json_decode($response1);
$visitor_count_graph = '';

if ($res_dashboard1->num_of_rows > 0) {
	for($dash_indicator1 = 0; $dash_indicator1 < $res_dashboard1->num_of_rows; $dash_indicator1++){ 
		$visitor_count_graph    .= "{ x: ".$res_dashboard1->result[$dash_indicator1]->hour_time.", y: ".$res_dashboard1->result[$dash_indicator1]->visitor_count." },";
  }
}
$visitor_count_graph = rtrim($visitor_count_graph, ", ");

/* $curl2 = curl_init();
curl_setopt_array($curl2, array(
	CURLOPT_URL => $api_url.'/select_query_backup',
	CURLOPT_RETURNTRANSFER => true,
	CURLOPT_ENCODING => '',
	CURLOPT_MAXREDIRS => 10,
	CURLOPT_TIMEOUT => 0,
	CURLOPT_FOLLOWLOCATION => true,
	CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
	CURLOPT_CUSTOMREQUEST => 'POST',
	CURLOPT_POSTFIELDS =>'{
 		"query" : "select hour(visitor_list_entdate) hour_time, count(visitor_list_id) visitor_count from `visitor_list_\''.$yesterday_date_db.'\'` where (date(visitor_list_entdate) BETWEEN \''.$yesterday_date.'\' AND \''.$yesterday_date.'\') group by hour(visitor_list_entdate) order by visitor_list_entdate asc"
	}',
	CURLOPT_HTTPHEADER => array(
		'Content-Type: application/json'
	),
));
$response2 = curl_exec($curl2);
curl_close($curl2);

site_log_generate("Dashboard Page : User : ".$_SESSION['yjtmms_user_name']." executed the Query ($response2) on ".date("Y-m-d H:i:s"));
$res_dashboard2 = json_decode($response2);
$yesterday_visitor_count_graph = '';

if ($res_dashboard2->num_of_rows > 0) {
	for($dash_indicator2 = 0; $dash_indicator2 < $res_dashboard2->num_of_rows; $dash_indicator2++){ 
		$yesterday_visitor_count_graph    .= "{ x: ".$res_dashboard2->result[$dash_indicator2]->hour_time.", y: ".$res_dashboard2->result[$dash_indicator2]->visitor_count." },";
  }
}
$yesterday_visitor_count_graph = rtrim($yesterday_visitor_count_graph, ", "); */

$create_query = 'select hour(visitor_list_entdate) hour_time, count(visitor_list_id) visitor_count from `visitor_list_'.$yesterday_date_db.'` where (date(visitor_list_entdate) BETWEEN \''.$yesterday_date.'\' AND \''.$yesterday_date.'\') group by hour(visitor_list_entdate) order by visitor_list_entdate asc';

$yesterday_visitor_count_graph = '';
$result = $conn1->query($create_query);
if ($result->num_rows>0){
	while ($response = $result->fetch_object()) {
    $yesterday_visitor_count_graph    .= "{ x: ".$response->hour_time.", y: ".$response->visitor_count." },";
  }
}
$yesterday_visitor_count_graph = rtrim($yesterday_visitor_count_graph, ", ");


/*
select distinct date(visitor_list_entdate) visitor_list_entdate, 
	(select count(visitor_list_id) from visitor_list_29012023 where (date(visitor_list_entdate) BETWEEN '2023-01-29' AND '2023-01-29') and hour(visitor_list_entdate) = 0) cnt_visitor_0, 
	(select count(visitor_list_id) from visitor_list_29012023 where (date(visitor_list_entdate) BETWEEN '2023-01-29' AND '2023-01-29') and hour(visitor_list_entdate) = 1) cnt_visitor_1, 
	(select count(visitor_list_id) from visitor_list_29012023 where (date(visitor_list_entdate) BETWEEN '2023-01-29' AND '2023-01-29') and hour(visitor_list_entdate) = 2) cnt_visitor_2, 
	(select count(visitor_list_id) from visitor_list_29012023 where (date(visitor_list_entdate) BETWEEN '2023-01-29' AND '2023-01-29') and hour(visitor_list_entdate) = 3) cnt_visitor_3, 
	(select count(visitor_list_id) from visitor_list_29012023 where (date(visitor_list_entdate) BETWEEN '2023-01-29' AND '2023-01-29') and hour(visitor_list_entdate) = 4) cnt_visitor_4, 
	(select count(visitor_list_id) from visitor_list_29012023 where (date(visitor_list_entdate) BETWEEN '2023-01-29' AND '2023-01-29') and hour(visitor_list_entdate) = 5) cnt_visitor_5, 
	(select count(visitor_list_id) from visitor_list_29012023 where (date(visitor_list_entdate) BETWEEN '2023-01-29' AND '2023-01-29') and hour(visitor_list_entdate) = 6) cnt_visitor_6, 
	(select count(visitor_list_id) from visitor_list_29012023 where (date(visitor_list_entdate) BETWEEN '2023-01-29' AND '2023-01-29') and hour(visitor_list_entdate) = 7) cnt_visitor_7, 
	(select count(visitor_list_id) from visitor_list_29012023 where (date(visitor_list_entdate) BETWEEN '2023-01-29' AND '2023-01-29') and hour(visitor_list_entdate) = 8) cnt_visitor_8, 
	(select count(visitor_list_id) from visitor_list_29012023 where (date(visitor_list_entdate) BETWEEN '2023-01-29' AND '2023-01-29') and hour(visitor_list_entdate) = 9) cnt_visitor_9, 
	(select count(visitor_list_id) from visitor_list_29012023 where (date(visitor_list_entdate) BETWEEN '2023-01-29' AND '2023-01-29') and hour(visitor_list_entdate) = 10) cnt_visitor_10, 
	(select count(visitor_list_id) from visitor_list_29012023 where (date(visitor_list_entdate) BETWEEN '2023-01-29' AND '2023-01-29') and hour(visitor_list_entdate) = 11) cnt_visitor_11, 
	(select count(visitor_list_id) from visitor_list_29012023 where (date(visitor_list_entdate) BETWEEN '2023-01-29' AND '2023-01-29') and hour(visitor_list_entdate) = 12) cnt_visitor_12, 
	(select count(visitor_list_id) from visitor_list_29012023 where (date(visitor_list_entdate) BETWEEN '2023-01-29' AND '2023-01-29') and hour(visitor_list_entdate) = 13) cnt_visitor_13, 
	(select count(visitor_list_id) from visitor_list_29012023 where (date(visitor_list_entdate) BETWEEN '2023-01-29' AND '2023-01-29') and hour(visitor_list_entdate) = 14) cnt_visitor_14, 
	(select count(visitor_list_id) from visitor_list_29012023 where (date(visitor_list_entdate) BETWEEN '2023-01-29' AND '2023-01-29') and hour(visitor_list_entdate) = 15) cnt_visitor_15, 
	(select count(visitor_list_id) from visitor_list_29012023 where (date(visitor_list_entdate) BETWEEN '2023-01-29' AND '2023-01-29') and hour(visitor_list_entdate) = 16) cnt_visitor_16, 
	(select count(visitor_list_id) from visitor_list_29012023 where (date(visitor_list_entdate) BETWEEN '2023-01-29' AND '2023-01-29') and hour(visitor_list_entdate) = 17) cnt_visitor_17, 
	(select count(visitor_list_id) from visitor_list_29012023 where (date(visitor_list_entdate) BETWEEN '2023-01-29' AND '2023-01-29') and hour(visitor_list_entdate) = 18) cnt_visitor_18, 
	(select count(visitor_list_id) from visitor_list_29012023 where (date(visitor_list_entdate) BETWEEN '2023-01-29' AND '2023-01-29') and hour(visitor_list_entdate) = 19) cnt_visitor_19, 
	(select count(visitor_list_id) from visitor_list_29012023 where (date(visitor_list_entdate) BETWEEN '2023-01-29' AND '2023-01-29') and hour(visitor_list_entdate) = 20) cnt_visitor_20, 
	(select count(visitor_list_id) from visitor_list_29012023 where (date(visitor_list_entdate) BETWEEN '2023-01-29' AND '2023-01-29') and hour(visitor_list_entdate) = 21) cnt_visitor_21, 
	(select count(visitor_list_id) from visitor_list_29012023 where (date(visitor_list_entdate) BETWEEN '2023-01-29' AND '2023-01-29') and hour(visitor_list_entdate) = 22) cnt_visitor_22, 
	(select count(visitor_list_id) from visitor_list_29012023 where (date(visitor_list_entdate) BETWEEN '2023-01-29' AND '2023-01-29') and hour(visitor_list_entdate) = 23) cnt_visitor_23
from visitor_list_29012023 
*/

// $thismonth_startdate 	= date("Y-m-01", strtotime("-1 month"));
// $thismonth_yesterday	= date('Y-m-d', strtotime("-1 days"));
$thismonth_startdate 	= "2023-01-01";
$thismonth_yesterday	= "2023-01-31";
function date_range($first, $last, $step = '+1 day', $output_format = 'Y-m-d' ) {
	$dates = array();
	$current = strtotime($first);
	$last = strtotime($last);
	while( $current <= $last ) {
			$dates[] = date($output_format, $current);
			$current = strtotime($step, $current);
	}
	return $dates;
}
$date = date_range($thismonth_startdate, $thismonth_yesterday);
// print_r($date);

$visitor_cnt = ''; $date_cnt = ''; $visit_date = ''; $ii = -1;
for($ij = 0; $ij < count($date); $ij++) {
	$table_name = "visitor_list_".date("dmY", strtotime($date[$ij]));
	$sql_query = "SELECT * FROM information_schema.tables WHERE table_schema = '".$backup_dbname."' AND table_name = '".$table_name."' LIMIT 1";

  $create_query = '';
	$result = $conn->query($sql_query);
	$this_date 	= date("Y-m-d", strtotime($date[$ij]));
	if ($result->num_rows>0){
		$tblnames[] = $table_name;

		$create_query = "select distinct date(visitor_list_entdate) visitor_list_entdate, 
      (select count(visitor_list_id) from ".$table_name." where (date(visitor_list_entdate) BETWEEN '".$this_date."' AND '".$this_date."') and hour(visitor_list_entdate) = 0) cnt_visitor_0, 
      (select count(visitor_list_id) from ".$table_name." where (date(visitor_list_entdate) BETWEEN '".$this_date."' AND '".$this_date."') and hour(visitor_list_entdate) = 1) cnt_visitor_1, 
      (select count(visitor_list_id) from ".$table_name." where (date(visitor_list_entdate) BETWEEN '".$this_date."' AND '".$this_date."') and hour(visitor_list_entdate) = 2) cnt_visitor_2, 
      (select count(visitor_list_id) from ".$table_name." where (date(visitor_list_entdate) BETWEEN '".$this_date."' AND '".$this_date."') and hour(visitor_list_entdate) = 3) cnt_visitor_3, 
      (select count(visitor_list_id) from ".$table_name." where (date(visitor_list_entdate) BETWEEN '".$this_date."' AND '".$this_date."') and hour(visitor_list_entdate) = 4) cnt_visitor_4, 
      (select count(visitor_list_id) from ".$table_name." where (date(visitor_list_entdate) BETWEEN '".$this_date."' AND '".$this_date."') and hour(visitor_list_entdate) = 5) cnt_visitor_5, 
      (select count(visitor_list_id) from ".$table_name." where (date(visitor_list_entdate) BETWEEN '".$this_date."' AND '".$this_date."') and hour(visitor_list_entdate) = 6) cnt_visitor_6, 
      (select count(visitor_list_id) from ".$table_name." where (date(visitor_list_entdate) BETWEEN '".$this_date."' AND '".$this_date."') and hour(visitor_list_entdate) = 7) cnt_visitor_7, 
      (select count(visitor_list_id) from ".$table_name." where (date(visitor_list_entdate) BETWEEN '".$this_date."' AND '".$this_date."') and hour(visitor_list_entdate) = 8) cnt_visitor_8, 
      (select count(visitor_list_id) from ".$table_name." where (date(visitor_list_entdate) BETWEEN '".$this_date."' AND '".$this_date."') and hour(visitor_list_entdate) = 9) cnt_visitor_9, 
      (select count(visitor_list_id) from ".$table_name." where (date(visitor_list_entdate) BETWEEN '".$this_date."' AND '".$this_date."') and hour(visitor_list_entdate) = 10) cnt_visitor_10, 
      (select count(visitor_list_id) from ".$table_name." where (date(visitor_list_entdate) BETWEEN '".$this_date."' AND '".$this_date."') and hour(visitor_list_entdate) = 11) cnt_visitor_11, 
      (select count(visitor_list_id) from ".$table_name." where (date(visitor_list_entdate) BETWEEN '".$this_date."' AND '".$this_date."') and hour(visitor_list_entdate) = 12) cnt_visitor_12, 
      (select count(visitor_list_id) from ".$table_name." where (date(visitor_list_entdate) BETWEEN '".$this_date."' AND '".$this_date."') and hour(visitor_list_entdate) = 13) cnt_visitor_13, 
      (select count(visitor_list_id) from ".$table_name." where (date(visitor_list_entdate) BETWEEN '".$this_date."' AND '".$this_date."') and hour(visitor_list_entdate) = 14) cnt_visitor_14, 
      (select count(visitor_list_id) from ".$table_name." where (date(visitor_list_entdate) BETWEEN '".$this_date."' AND '".$this_date."') and hour(visitor_list_entdate) = 15) cnt_visitor_15, 
      (select count(visitor_list_id) from ".$table_name." where (date(visitor_list_entdate) BETWEEN '".$this_date."' AND '".$this_date."') and hour(visitor_list_entdate) = 16) cnt_visitor_16, 
      (select count(visitor_list_id) from ".$table_name." where (date(visitor_list_entdate) BETWEEN '".$this_date."' AND '".$this_date."') and hour(visitor_list_entdate) = 17) cnt_visitor_17, 
      (select count(visitor_list_id) from ".$table_name." where (date(visitor_list_entdate) BETWEEN '".$this_date."' AND '".$this_date."') and hour(visitor_list_entdate) = 18) cnt_visitor_18, 
      (select count(visitor_list_id) from ".$table_name." where (date(visitor_list_entdate) BETWEEN '".$this_date."' AND '".$this_date."') and hour(visitor_list_entdate) = 19) cnt_visitor_19, 
      (select count(visitor_list_id) from ".$table_name." where (date(visitor_list_entdate) BETWEEN '".$this_date."' AND '".$this_date."') and hour(visitor_list_entdate) = 20) cnt_visitor_20, 
      (select count(visitor_list_id) from ".$table_name." where (date(visitor_list_entdate) BETWEEN '".$this_date."' AND '".$this_date."') and hour(visitor_list_entdate) = 21) cnt_visitor_21, 
      (select count(visitor_list_id) from ".$table_name." where (date(visitor_list_entdate) BETWEEN '".$this_date."' AND '".$this_date."') and hour(visitor_list_entdate) = 22) cnt_visitor_22, 
      (select count(visitor_list_id) from ".$table_name." where (date(visitor_list_entdate) BETWEEN '".$this_date."' AND '".$this_date."') and hour(visitor_list_entdate) = 23) cnt_visitor_23
    from ".$table_name." order by visitor_list_entdate ";
    $lable_value .= '"'.$this_date.'", ';
  }
  $table_name = '';

  $vlu_dt[$ij][0]  = $this_date;  $vlu_dt[$ij][1]  = $this_date;
  $vlu_dt[$ij][2]  = $this_date;  $vlu_dt[$ij][3]  = $this_date;
  $vlu_dt[$ij][4]  = $this_date;  $vlu_dt[$ij][5]  = $this_date;
  $vlu_dt[$ij][6]  = $this_date;  $vlu_dt[$ij][7]  = $this_date;
  $vlu_dt[$ij][8]  = $this_date;  $vlu_dt[$ij][9]  = $this_date;
  $vlu_dt[$ij][10] = $this_date;  $vlu_dt[$ij][11] = $this_date;
  $vlu_dt[$ij][12] = $this_date;  $vlu_dt[$ij][13] = $this_date;
  $vlu_dt[$ij][14] = $this_date;  $vlu_dt[$ij][15] = $this_date;
  $vlu_dt[$ij][16] = $this_date;  $vlu_dt[$ij][17] = $this_date;
  $vlu_dt[$ij][18] = $this_date;  $vlu_dt[$ij][19] = $this_date;
  $vlu_dt[$ij][20] = $this_date;  $vlu_dt[$ij][21] = $this_date;
  $vlu_dt[$ij][22] = $this_date;  $vlu_dt[$ij][23] = $this_date;

	$date_cnt				.= "'".$this_date."', ";
	if($create_query != '') {
		$result1 = $conn1->query($create_query);
		if ($result1->num_rows>0){
			while ($response1 = $result1->fetch_object()) {
				if($response1->visitor_list_entdate != $visit_date) {
					$ii++; 
				}
        
        $vlu[$ij][0]  = $response1->cnt_visitor_0;  $vlu[$ij][1]  = $response1->cnt_visitor_1;
        $vlu[$ij][2]  = $response1->cnt_visitor_2;  $vlu[$ij][3]  = $response1->cnt_visitor_3;
        $vlu[$ij][4]  = $response1->cnt_visitor_4;  $vlu[$ij][5]  = $response1->cnt_visitor_5;
        $vlu[$ij][6]  = $response1->cnt_visitor_6;  $vlu[$ij][7]  = $response1->cnt_visitor_7;
        $vlu[$ij][8]  = $response1->cnt_visitor_8;  $vlu[$ij][9]  = $response1->cnt_visitor_9;
        $vlu[$ij][10] = $response1->cnt_visitor_10; $vlu[$ij][11] = $response1->cnt_visitor_11;
        $vlu[$ij][12] = $response1->cnt_visitor_12; $vlu[$ij][13] = $response1->cnt_visitor_13;
        $vlu[$ij][14] = $response1->cnt_visitor_14; $vlu[$ij][15] = $response1->cnt_visitor_15;
        $vlu[$ij][16] = $response1->cnt_visitor_16; $vlu[$ij][17] = $response1->cnt_visitor_17;
        $vlu[$ij][18] = $response1->cnt_visitor_18; $vlu[$ij][19] = $response1->cnt_visitor_19;
        $vlu[$ij][20] = $response1->cnt_visitor_20; $vlu[$ij][21] = $response1->cnt_visitor_21;
        $vlu[$ij][22] = $response1->cnt_visitor_22; $vlu[$ij][23] = $response1->cnt_visitor_23;

				$visitor_cnt		.= "[".$ii.", 0, ".$response1->cnt_visitor_0."], [".$ii.", 1, ".$response1->cnt_visitor_1."], [".$ii.", 2, ".$response1->cnt_visitor_2."], [".$ii.", 3, ".$response1->cnt_visitor_3."], [".$ii.", 4, ".$response1->cnt_visitor_4."], [".$ii.", 5, ".$response1->cnt_visitor_5."], [".$ii.", 6, ".$response1->cnt_visitor_6."], [".$ii.", 7, ".$response1->cnt_visitor_7."], [".$ii.", 8, ".$response1->cnt_visitor_8."], [".$ii.", 9, ".$response1->cnt_visitor_9."], [".$ii.", 10, ".$response1->cnt_visitor_10."], [".$ii.", 11, ".$response1->cnt_visitor_11."], [".$ii.", 12, ".$response1->cnt_visitor_12."], [".$ii.", 13, ".$response1->cnt_visitor_13."], [".$ii.", 14, ".$response1->cnt_visitor_14."], [".$ii.", 15, ".$response1->cnt_visitor_15."], [".$ii.", 16, ".$response1->cnt_visitor_16."], [".$ii.", 17, ".$response1->cnt_visitor_17."], [".$ii.", 18, ".$response1->cnt_visitor_18."], [".$ii.", 19, ".$response1->cnt_visitor_19."], [".$ii.", 20, ".$response1->cnt_visitor_20."], [".$ii.", 21, ".$response1->cnt_visitor_21."], [".$ii.", 22, ".$response1->cnt_visitor_22."], [".$ii.", 23, ".$response1->cnt_visitor_23."], ";

				$visit_date = $response1->visitor_list_entdate;
			}
		}
	} else { 
		$ii++;

    $vlu[$ij][0]  = 0; $vlu[$ij][1]  = 0;
    $vlu[$ij][2]  = 0; $vlu[$ij][3]  = 0;
    $vlu[$ij][4]  = 0; $vlu[$ij][5]  = 0;
    $vlu[$ij][6]  = 0; $vlu[$ij][7]  = 0;
    $vlu[$ij][8]  = 0; $vlu[$ij][9]  = 0;
    $vlu[$ij][10] = 0; $vlu[$ij][11] = 0;
    $vlu[$ij][12] = 0; $vlu[$ij][13] = 0;
    $vlu[$ij][14] = 0; $vlu[$ij][15] = 0;
    $vlu[$ij][16] = 0; $vlu[$ij][17] = 0;
    $vlu[$ij][18] = 0; $vlu[$ij][19] = 0;
    $vlu[$ij][20] = 0; $vlu[$ij][21] = 0;
    $vlu[$ij][22] = 0; $vlu[$ij][23] = 0;

		$visitor_cnt		.= "[".$ii.", 0, 0], [".$ii.", 1, 0], [".$ii.", 2, 0], [".$ii.", 3, 0], [".$ii.", 4, 0], [".$ii.", 5, 0], [".$ii.", 6, 0], [".$ii.", 7, 0], [".$ii.", 8, 0], [".$ii.", 9, 0], [".$ii.", 10, 0], [".$ii.", 11, 0], [".$ii.", 12, 0], [".$ii.", 13, 0], [".$ii.", 14, 0], [".$ii.", 15, 0], [".$ii.", 16, 0], [".$ii.", 17, 0], [".$ii.", 18, 0], [".$ii.", 19, 0], [".$ii.", 20, 0], [".$ii.", 21, 0], [".$ii.", 22, 0], [".$ii.", 23, 0], ";
	}
	$create_query = '';
}

$final_display = ''; $final_display1 = ''; $hr_rec = ''; $dt_rec = '';
for($inner_vlui = 0; $inner_vlui < 24; $inner_vlui++) {
  $hr_rec .= "'".$inner_vlui."', ";

  for($vlui = 0; $vlui < count($vlu); $vlui++) {
    $final_display .= "[".$inner_vlui.", ".$vlui.", ".$vlu[$vlui][$inner_vlui]."], ";
    $dt_rec .= "'".$vlu_dt[$vlui][$inner_vlui]."', ";
    // $final_display1 .= "{ x: '".$inner_vlui."', y: '".$vlu_dt[$vlui][$inner_vlui]."', heat: ".$vlu[$vlui][$inner_vlui]." }, ";
  }
}

$hr_rec = rtrim($hr_rec, ", ");
$dt_rec = rtrim($dt_rec, ", ");
$final_display = rtrim($final_display, ", ");
// echo $final_display;
?>
<!DOCTYPE html>
<html
  lang="en"
  class="light-style layout-menu-fixed"
  dir="ltr"
  data-theme="theme-default"
  data-assets-path="assets/"
  data-template="vertical-menu-template-free"
>
  <head>
<meta http-equiv="refresh" content="120">
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
    />

    <title>Dashboard : <?=$site_title?></title>
    <meta name="description" content="" />

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="assets/img/favicon/favicon.ico" />

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
      rel="stylesheet"
    />
    <!-- Icons. Uncomment required icon fonts -->
    <link rel="stylesheet" href="assets/vendor/fonts/boxicons.css" />

    <!-- Core CSS -->
    <link rel="stylesheet" href="assets/vendor/css/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="assets/css/demo.css" />

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />
    <link rel="stylesheet" href="assets/vendor/libs/apex-charts/apex-charts.css" />

    <!-- Page CSS -->
    <!-- Helpers -->
    <script src="assets/vendor/js/helpers.js"></script>
    <script src="assets/js/config.js"></script>
    <style>
    .text-right {
      text-align: right !important;
    }
    
    .highcharts-figure,
    .highcharts-data-table table {
      min-width: 360px;
      max-width: 800px;
      margin: 1em auto;
    }

    .highcharts-data-table table {
      font-family: Verdana, sans-serif;
      border-collapse: collapse;
      border: 1px solid #ebebeb;
      margin: 10px auto;
      text-align: center;
      width: 100%;
      max-width: 500px;
    }

    .highcharts-data-table caption {
      padding: 1em 0;
      font-size: 1.2em;
      color: #555;
    }

    .highcharts-data-table th {
      font-weight: 600;
      padding: 0.5em;
    }

    .highcharts-data-table td,
    .highcharts-data-table th,
    .highcharts-data-table caption {
      padding: 0.5em;
    }

    .highcharts-data-table thead tr,
    .highcharts-data-table tr:nth-child(even) {
      background: #f8f8f8;
    }

    .highcharts-data-table tr:hover {
      background: #f1f7ff;
    }
    </style>
  </head>

  <body>
    <!-- Layout wrapper -->
    <div class="layout-wrapper layout-content-navbar">
      <div class="layout-container">
        <!-- Menu -->
        <? include("libraries/site_menu.php"); ?>
        <!-- / Menu -->

        <!-- Layout container -->
        <div class="layout-page">
          <!-- Navbar -->
          <? include("libraries/site_header.php"); ?>
          <!-- / Navbar -->

          <!-- Content wrapper -->
          <div class="content-wrapper">
            <!-- Content -->

            <div class="container-xxl flex-grow-1 container-p-y">
              <div class="row">
                <div class="col-lg-12 mb-4 order-0">
                  <div class="card">
                    <div class="d-flex align-items-end row">
                      <div class="col-sm-7">
                        <div class="card-body">
                          <h5 class="card-title text-primary">Congratulations Super Admin! 🎉</h5>
                          <p class="mb-4">
                            Welcome to Mall Monitoring System 
                          </p>
                        </div>
                      </div>
                      <div class="col-sm-5 text-center text-sm-left">
                        <div class="card-body pb-0 px-0 px-md-4">
                          <img
                            src="assets/img/illustrations/man-with-laptop-light.png"
                            height="140"
                            alt="View Badge User"
                            data-app-dark-img="illustrations/man-with-laptop-dark.png"
                            data-app-light-img="illustrations/man-with-laptop-light.png"
                          />
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <div class="row">
                <!-- Order Statistics -->
                <div class="col-md-6 col-lg-6 col-xl-6 order-0 mb-4">
                  <div class="card h-100">
                    <div class="card-body">

                    <div class="row" style="width: 100%; margin:0;">
                        <div class="col-6">
                          <div class="card-title mb-0">
                            <h5 class="m-0 me-2">Total Footfalls</h5>
                            <small class="text-muted"></small>
                          </div>
                        </div>
                        <div class="col-6" style="padding: 0;">
                          <h2 class="mb-2 text-right"><?=indian_money_format($cnt_visitor)?></h2>
                        </div>
                      </div>

                      <div style="clear: both;"></div>
                      <div class="row" style="width: 100%; margin:0;">
                        <div class="col-6">
                        <div class="card-title mb-0">
                          <h5 class="m-0 me-2">Total Visitors</h5>
                          <small class="text-muted"></small>
                        </div>
                        </div>
                        <div class="col-6" style="padding: 0;">
                          <h2 class="mb-2 text-right"><?=indian_money_format($cnt_visitor_id)?></h2>
                        </div>
                      </div>

                      <ul class="p-0 m-0">
                        <li class="d-flex mb-4 pb-1">
                          <div class="avatar flex-shrink-0 me-5">
                            <span class="avatar-initial rounded btn-xl bg-label-primary"
                              ><i class="bx bx-male"></i
                            ></span>
                          </div>
                          <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                            <div class="me-2">
                              <h6 class="mb-0">Male</h6>
                              <small class="text-muted"></small>
                            </div>
                            <div class="user-progress">
				<small class="fw-semibold"><span title="Footfalls count"><?=indian_money_format($cnt_male)?></span> / <span title="Visitors count"><?=indian_money_format($cnt_unique_male)?></span></small>
                            </div>
                          </div>
                        </li>
                        <li class="d-flex mb-4 pb-1">
                          <div class="avatar flex-shrink-0 me-5">
                            <span class="avatar-initial rounded btn-xl bg-label-success"><i class="bx bx-female"></i></span>
                          </div>
                          <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                            <div class="me-2">
                              <h6 class="mb-0">Female</h6>
                              <small class="text-muted"></small>
                            </div>
                            <div class="user-progress">
				<small class="fw-semibold"><span title="Footfalls count"><?=indian_money_format($cnt_female)?></span> / <span title="Visitors count"><?=indian_money_format($cnt_unique_female)?></span></small>
                            </div>
                          </div>
                        </li>
 <li class="d-flex mb-4 pb-1">
                          <div class="avatar flex-shrink-0 me-5">
                            <span class="avatar-initial rounded btn-xl bg-label-danger"><i class="bx bx-body"></i></span>
                          </div>
                          <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                            <div class="me-2">
                              <h6 class="mb-0">Others</h6>
                              <small class="text-muted"></small>
                            </div>
                            <div class="user-progress">
				<small class="fw-semibold"><span title="Footfalls count"><?=indian_money_format($cnt_others)?></span> / <span title="Visitors count"><?=indian_money_format($cnt_unique_others)?></span></small>
                            </div>
                          </div>
                        </li>
                        <li class="d-flex mb-4 pb-1">
                          <div class="avatar flex-shrink-0 me-5">
                            <span class="avatar-initial rounded btn-xl bg-label-info"><i class="bx bx-group"></i></span>
                          </div>
                          <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                            <div class="me-2">
                              <h6 class="mb-0">Footfalls</h6>
                              <small class="text-muted"></small>
                            </div>
                            <div class="user-progress">
                              <small class="fw-semibold"><?=indian_money_format($cnt_visitor)?></small>
                            </div>
                          </div>
                        </li>
                        <li class="d-flex">
                          <div class="avatar flex-shrink-0 me-5">
                            <span class="avatar-initial rounded btn-xl bg-label-secondary"
                              ><i class="bx bx-user-check"></i
                            ></span>
                          </div>
                          <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                            <div class="me-2">
                              <h6 class="mb-0">Registration</h6>
                              <small class="text-muted"></small>
                            </div>
                            <div class="user-progress">
                              <small class="fw-semibold"><?=indian_money_format($cnt_registration)?></small>
                            </div>
                          </div>
                        </li>
                      </ul>
                    </div>
                  </div>
                </div>
                <!--/ Order Statistics -->

                <!-- Expense Overview -->
                <div class="col-md-6 col-lg-6 order-1 mb-4">
                  <div class="card h-100">
                    <div class="card-header d-flex align-items-center justify-content-between pb-0">
                      <div class="card-title mb-0">
                        <h5 class="m-0 me-2">Current Visitors</h5>
                        <small class="text-muted"></small>
                      </div>
                    </div>
                    <div class="card-body px-0">
                      <div class="tab-content p-0">
                        <div class="tab-pane fade show active" id="navs-tabs-line-card-income" role="tabpanel">
                          <div id="incomeChart"></div>
                          <div class="d-flex justify-content-center pt-4 gap-2">
                              <div id="chartContainer" style="height: 370px; width: 100%;"></div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--/ Expense Overview -->
              </div>

              <div class="row">
                <!-- Order Statistics -->
                <div class="col-md-6 col-lg-6 col-xl-6 order-0 mb-4">
                  <div class="card h-100">
                    <div class="card-header d-flex align-items-center justify-content-between pb-0">
                      <div class="card-title mb-0">
                        <h5 class="m-0 me-2">Age Category</h5>
                        <small class="text-muted"></small>
                      </div>
                    </div>
                    <div class="card-body">

                    <div class="d-flex align-items-end mb-3" style="float: right;">
                      <div class="d-flex flex-column align-items-end gap-1">
                        <h2 class="mb-2"><?=indian_money_format($cnt_visitor)?></h2>
                      </div>
                    </div>

                    <div style="clear: both;"></div>
                      <ul class="p-0 m-0">
                        <li class="d-flex mb-4 pb-1">
                          <div class="avatar flex-shrink-0 me-5">
                            <span class="avatar-initial rounded btn-xl bg-label-primary"
                              ><i class="bx bx-male"></i
                            ></span>
                          </div>
                          <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                            <div class="me-2">
                              <h6 class="mb-0">Kids</h6>
                              <small class="text-muted"></small>
                            </div>
                            <div class="user-progress">
                              <small class="fw-semibold"><?=indian_money_format($cnt_kids)?></small>
                            </div>
                          </div>
                        </li>
                        <li class="d-flex mb-4 pb-1">
                          <div class="avatar flex-shrink-0 me-5">
                            <span class="avatar-initial rounded btn-xl bg-label-success"><i class="bx bxs-group"></i></span>
                          </div>
                          <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                            <div class="me-2">
                              <h6 class="mb-0">Adult</h6>
                              <small class="text-muted"></small>
                            </div>
                            <div class="user-progress">
                              <small class="fw-semibold"><?=indian_money_format($cnt_adult)?></small>
                            </div>
                          </div>
                        </li>
                      </ul>
                    </div>
                  </div>
                </div>
                <!--/ Order Statistics -->
              </div>

              <div class="row">
                <!-- Order Statistics -->
                <div class="col-md-12 col-lg-12 col-xl-12 order-0 mb-4">
                  <div class="card h-100">
                    <div class="card-header d-flex align-items-center justify-content-between pb-0">
                      <div class="card-title mb-0">
                        <h5 class="m-0 me-2">Footfall Daily Report - 01-01-2023 to 31-01-2023</h5>
                        <small class="text-muted"></small>
                      </div>
                    </div>
                    <div class="card-body">
                    
                      <div id="container" style="height: 700px !important;"></div>

                    </div>
                  </div>
                </div>
                <!--/ Order Statistics -->
              </div>
            <!-- / Content -->

            <!-- Footer -->
            <? include("libraries/site_footer.php"); ?>
            <!-- / Footer -->

            <div class="content-backdrop fade"></div>
          </div>
          <!-- Content wrapper -->
        </div>
        <!-- / Layout page -->
      </div>

      <!-- Overlay -->
      <div class="layout-overlay layout-menu-toggle"></div>
    </div>
    <!-- / Layout wrapper -->

    <!-- Core JS -->
    <!-- build:js assets/vendor/js/core.js -->
    <script src="assets/vendor/libs/jquery/jquery.js"></script>
    <script src="assets/vendor/libs/popper/popper.js"></script>
    <script src="assets/vendor/js/bootstrap.js"></script>
    <script src="assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

    <script src="assets/vendor/js/menu.js"></script>
    <!-- endbuild -->

    <!-- Vendors JS -->
    <script src="assets/vendor/libs/apex-charts/apexcharts.js"></script>

    <!-- Main JS -->
    <script src="assets/js/main.js"></script>

    <!-- Page JS -->

    <!-- Place this tag in your head or just before your close body tag. -->
    <script async defer src="https://buttons.github.io/buttons.js"></script>
    
    <script src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"></script>

    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://code.highcharts.com/modules/heatmap.js"></script>
    <script src="https://code.highcharts.com/modules/exporting.js"></script>
    <script src="https://code.highcharts.com/modules/export-data.js"></script>
    <script src="https://code.highcharts.com/modules/accessibility.js"></script>


    <script>
      window.onload = function () {
        //Better to construct options first and then pass it as a parameter
        var options = {
          title: {
            text: ""
          },
          animationEnabled: true,
          exportEnabled: false,
          data: [
          {
            type: "spline", //change it to line, area, column, pie, etc
            showInLegend: true,
            yValueFormatString: "##.00mn",
            name: "Today",
            dataPoints: [
              <?=$visitor_count_graph?>
            ]
          },
          {
            type: "spline", //change it to line, area, column, pie, etc
            showInLegend: true,
            yValueFormatString: "##.00mn",
            name: "Yesterday",
            dataPoints: [
              <?=$yesterday_visitor_count_graph?>
            ]
          }
          ]
        };
        $("#chartContainer").CanvasJSChart(options);
      }
    </script>

    <? /* <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Year', 'Sales', 'Expenses'],
          ['2004',  1000,      400],
          ['2005',  1170,      460],
          ['2006',  660,       1120],
          ['2007',  1030,      540]
        ]);

        var options = {
          title: 'Company Performance',
          curveType: 'function',
          legend: { position: 'bottom' }
        };

        var chart = new google.visualization.LineChart(document.getElementById('chartContainer'));

        chart.draw(data, options);
      }
    </script> */ ?>

    <script>
      function getPointCategoryName(point, dimension) {
        var series = point.series,
          isY = dimension === 'y',
          axis = series[isY ? 'yAxis' : 'xAxis'];
        return axis.categories[point[isY ? 'y' : 'x']];
      }

      Highcharts.chart('container', {

        chart: {
          type: 'heatmap',
          marginTop: 40,
          marginBottom: 80,
          plotBorderWidth: 1
        },

        title: {
          text: ''
        },

        xAxis: {
          categories: [<?=$hr_rec?>]
        },

        yAxis: {
          categories: [<?=$dt_rec?>],
          title: null,
          reversed: true,
          tickInterval: 1,
          labels: {
              step: 1
          }
        },

        accessibility: {
          point: {
            descriptionFormatter: function(point) {
              var ix = point.index + 1,
                xName = getPointCategoryName(point, 'x'),
                yName = getPointCategoryName(point, 'y'),
                val = point.value;
              return ix + '. ' + xName + ' sales ' + yName + ', ' + val + '.';
            }
          }
        },

        // colorAxis: {
        //   min: 0,
        //   minColor: '#FFFFFF',
        //   maxColor: Highcharts.getOptions().colors[0]
        // },

        colorAxis: {
          stops: [
            [0, '#FF0000'],
            [0.25, '#FFC0CB'],
            [0.50, '#FFA500'],
            [0.75, '#0000FF'],
            [1, '#00FF00']
          ]
        },

        legend: {
          align: 'right',
          layout: 'vertical',
          margin: 0,
          verticalAlign: 'top',
          y: 25,
          symbolHeight: 300
        },

        tooltip: {
          formatter: function() {
            return '<b>' + getPointCategoryName(this.point, 'y') + '</b><br><b>Hour : ' + getPointCategoryName(this.point, 'x') + '</b><br><b>' + this.point.value + '</b> Visitors';
          }
        },

        series: [{
          name: 'Footfall Daily Report - 01-01-2023 to 31-01-2023',
          borderWidth: 1,
          data: [
            <?=$final_display?>
          ],
          dataLabels: {
            enabled: true,
            color: '#000000'
          }
        }],

        responsive: {
          rules: [{
            condition: {
              maxWidth: 500
            },
            chartOptions: {
              yAxis: {
                labels: {
                  formatter: function() {
                    return this.value.charAt(0);
                  }
                }
              }
            }
          }]
        }

      });
    </script>
  </body>
</html>


