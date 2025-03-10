<?php
session_start();
error_reporting(0);
include_once('../api/configuration.php');
extract($_REQUEST);

if (isset($_POST['action']) && !empty($_POST['action'])) {
	$action = $_POST['action'];
	switch ($action) {
			case 'getEMP' :
					getEMP($conn);
					break;
			case 'getRTHR' :
          getRTHR($conn);
					break;
			case 'getRTHRS' :
          getRTHRS($conn);
					break;
			case 'getMIS' :
          getMIS($conn);
					break;
			case 'getCamera' :
          getCamera($conn);
					break;

			default :
					getEMP($conn);
					break;
			// ...etc...
	}
}

function getEMP($conn)
{
		// storing  request (ie, get/post) global array to a variable
    $requestData = $_REQUEST;
    $columns = array(
		// datatable column index  => database column name
        0 => 'visitor_id',
        1 => 'aws_faceid',
        2 => 'customer_name',
        3 => 'customer_mobile',
        4 => 'customer_gender',
        5 => 'min_age',
        6 => 'max_age',
        7 => 'age_category',
        8 => 'interest_list_master'
    );
		
		// getting total number records without any search
    $sql = "SELECT customer_name, visitor_id, aws_faceid, customer_mobile, customer_gender, min_age, max_age, age_category, (select GROUP_CONCAT(visitor_interest_title) from interest_list where FIND_IN_SET (visitor_interest_id, cm.customer_interest)) interest_list_master ";
    $sql .= " FROM customer_management cm";
    $query = mysqli_query($conn, $sql);
		// or die("Mysql Error");
    $totalData = mysqli_num_rows($query);
    $totalFiltered = $totalData; // when there is no search parameter then total number rows = total number filtered rows.

    $sql = "SELECT customer_name, visitor_id, aws_faceid, customer_mobile, customer_gender, min_age, max_age, age_category, (select GROUP_CONCAT(visitor_interest_title) from interest_list where FIND_IN_SET (visitor_interest_id, cm.customer_interest)) interest_list_master ";
    $sql .= " FROM customer_management cm WHERE 1=1 ";
    if (!empty($requestData['search']['value'])) { // if there is a search parameter, $requestData['search']['value'] contains search parameter
        $sql .= " AND ( visitor_id LIKE '%" . $requestData['search']['value'] . "%' ";
        $sql .= " OR aws_faceid LIKE '%" . $requestData['search']['value'] . "%' ";
        $sql .= " OR customer_name LIKE '%" . $requestData['search']['value'] . "%' ";
        $sql .= " OR customer_mobile LIKE '%" . $requestData['search']['value'] . "%' ";
        $sql .= " OR customer_gender LIKE '%" . $requestData['search']['value'] . "%' ";
        $sql .= " OR min_age LIKE '%" . $requestData['search']['value'] . "%' ";
        $sql .= " OR max_age LIKE '%" . $requestData['search']['value'] . "%' ";
        $sql .= " OR age_category LIKE '%" . $requestData['search']['value'] . "%' ";
        $sql .= " OR interest_list_master LIKE '%" . $requestData['search']['value'] . "%' )";
    }
		// echo $sql;
    $query = mysqli_query($conn, $sql);
		// or die("Mysql Mysql Error in getting : get products");

    $totalFiltered = mysqli_num_rows($query); // when there is a search parameter then we have to modify total number filtered rows as per search result.
		if($requestData['length'] == -1) {
			$sql .= " ORDER BY " . $columns[$requestData['order'][0]['column']] . "   " . $requestData['order'][0]['dir'] . " ";
		} else {
    	$sql .= " ORDER BY " . $columns[$requestData['order'][0]['column']] . "   " . $requestData['order'][0]['dir'] . "   LIMIT " . $requestData['start'] . " ," . $requestData['length'] . " ";
		}

		// echo $sql;
    /* $requestData['order'][0]['column'] contains colmun index, $requestData['order'][0]['dir'] contains order such as asc/desc , $requestData['start'] contains start row number ,$requestData['length'] contains limit length. */
    $query = mysqli_query($conn, $sql);
		// or die("Mysql Mysql Error in getting : get products");
    $data = array();

    $ii = $requestData['start'];
    // print_r($query);
    while ($row = mysqli_fetch_array($query)) {  // preparing an array
      // print_r($row);
      $ii++;
        $nestedData = array();
        $nestedData[] = $ii;
        $nestedData[] = $row["visitor_id"];
        $nestedData[] = $row["aws_faceid"];
        // $nestedData[] = $row["customer_name"];
	/* if($row["customer_name"] == '') {
          if (file_exists('../uploads/register/'.$row["aws_faceid"].'.jpg')) {
            $nestedData[] = "<a href='uploads/register/".$row["aws_faceid"].".jpg' data-toggle='lightbox' data-gallery='mixedgallery'><img src='uploads/register/".$row["aws_faceid"].".jpg' class='img-fluid' style='width: 100px; height: auto; max-height: 100px;'></a><br>".'-- NO --';
          } else {
            $nestedData[] = "<a href='https://yjtec.in/sms_portal/libraries/assets/images/people.png' data-toggle='lightbox' data-gallery='mixedgallery'><img src='https://yjtec.in/sms_portal/libraries/assets/images/people.png' class='img-fluid' style='width: 100px; height: auto; max-height: 100px;'></a><br>"."-- NO --";
          }
        } else {
          if (file_exists('../uploads/register/'.$row["aws_faceid"].'.jpg')) {
            $nestedData[] = "<a href='uploads/register/".$row["aws_faceid"].".jpg' data-toggle='lightbox' data-gallery='mixedgallery'><img src='uploads/register/".$row["aws_faceid"].".jpg' class='img-fluid' style='width: 100px; height: auto; max-height: 100px;'></a><br>".$row["customer_name"];
          } else {
            $nestedData[] = "<a href='https://yjtec.in/sms_portal/libraries/assets/images/people.png' data-toggle='lightbox' data-gallery='mixedgallery'><img src='https://yjtec.in/sms_portal/libraries/assets/images/people.png' class='img-fluid' style='width: 100px; height: auto; max-height: 100px;'></a><br>".$row["customer_name"];
          }
        } */

	if($row["customer_name"] == '') {
          if (file_exists('../uploads/register/'.$row["aws_faceid"].'.jpg')) {
            $nestedData[] = "<a href='uploads/register/".$row["aws_faceid"].".jpg' data-lightbox='mygallery_<?=$ii?>'><img src='uploads/register/".$row["aws_faceid"].".jpg' style='width: 100px; height: auto; max-height: 100px;'></a><br>".'-- NO --';
          } else {
            $nestedData[] = "<a href='https://yjtec.in/sms_portal/libraries/assets/images/people.png' data-lightbox='mygallery_<?=$ii?>'><img src='https://yjtec.in/sms_portal/libraries/assets/images/people.png' style='width: 100px; height: auto; max-height: 100px;'></a><br>"."-- NO --";
          }
        } else {
          if (file_exists('../uploads/register/'.$row["aws_faceid"].'.jpg')) {
            $nestedData[] = "<a href='uploads/register/".$row["aws_faceid"].".jpg' data-lightbox='mygallery_<?=$ii?>'><img src='uploads/register/".$row["aws_faceid"].".jpg' style='width: 100px; height: auto; max-height: 100px;'></a><br>".$row["customer_name"];
          } else {
            $nestedData[] = "<a href='https://yjtec.in/sms_portal/libraries/assets/images/people.png' data-lightbox='mygallery_<?=$ii?>'><img src='https://yjtec.in/sms_portal/libraries/assets/images/people.png' style='width: 100px; height: auto; max-height: 100px;'></a><br>".$row["customer_name"];
          }
        }

        $nestedData[] = $row["customer_mobile"];
        switch ($row["customer_gender"]) {
          case 'M':
            $nestedData[] = 'MALE';
            break;
          
          case 'F':
            $nestedData[] = 'FEMALE';
            break;
          
          default:
            $nestedData[] = 'OTHERS';
            break;
        }
        
        $nestedData[] = $row["min_age"]." - ".$row["max_age"];
        $nestedData[] = $row["age_category"];
        $nestedData[] = $row["interest_list_master"];
        $data[] = $nestedData;
    }

    $json_data = array(
        "draw" => intval($requestData['draw']),   // for every request/draw by clientside , they send a number as a parameter, when they recieve a response/data they first check the draw number, so we are sending same number in draw.
        "recordsTotal" => intval($totalData),  // total number of records
        "recordsFiltered" => intval($totalFiltered), // total number of records after searching, if there is no searching then totalFiltered = totalData
        "data" => $data   // total data array
    );

    echo json_encode($json_data);  // send data as json format
}

function getRTHR($conn)
{
		// storing  request (ie, get/post) global array to a variable
    $requestData = $_REQUEST;
    $columns = array(
		// datatable column index  => database column name
        0 => 'vl.visitor_list_entdate',
        1 => 'st.store_name',
        2 => 'ct.camera_position',
        3 => 'cm.customer_name',
        4 => 'cm.customer_mobile',
        5 => 'vl.visitor_id',
        6 => 'vl.aws_faceid',
        7 => 'vl.visitor_gender',
        8 => 'vl.min_age',
        9 => 'vl.age_category',
        10 => 'vl.visitor_list_entdate'
    );
    
		// getting total number records without any search
    $sql = "SELECT vl.store_id, st.store_name, vl.camera_id, ct.camera_position, ct.ip_address, ct.camera_details, cm.customer_id, cm.customer_name, cm.customer_mobile, vl.visitor_gender, vl.min_age, vl.max_age, vl.age_category, vl.aws_faceid, vl.visitor_id, vl.visitor_list_entdate ";
    $sql .= "FROM visitor_list vl
    left join store_details st on vl.store_id = st.store_id
    left join camera_details ct on vl.camera_id = ct.camera_id
    left join customer_management cm on cm.customer_id = vl.customer_id ";
    $sql .= "where vl.visitor_list_status = 'Y' and DATE(vl.visitor_list_entdate) = '".date("Y-m-d")."'";
    $query = mysqli_query($conn, $sql);
    $totalData = mysqli_num_rows($query);
    $totalFiltered = $totalData; // when there is no search parameter then total number rows = total number filtered rows.

    $sql = "SELECT vl.store_id, st.store_name, vl.camera_id, ct.camera_position, ct.ip_address, ct.camera_details, cm.customer_id, cm.customer_name, cm.customer_mobile, vl.visitor_gender, vl.min_age, vl.max_age, vl.age_category, vl.aws_faceid, vl.visitor_id, vl.visitor_list_entdate 
    FROM visitor_list vl
    left join store_details st on vl.store_id = st.store_id
    left join camera_details ct on vl.camera_id = ct.camera_id
    left join customer_management cm on cm.customer_id = vl.customer_id
    where vl.visitor_list_status = 'Y' and DATE(vl.visitor_list_entdate) = '".date("Y-m-d")."' and 1=1 ";
    if (!empty($requestData['search']['value'])) { // if there is a search parameter, $requestData['search']['value'] contains search parameter
        $sql .= " AND ( st.store_name LIKE '%" . $requestData['search']['value'] . "%' ";
        $sql .= " OR ct.camera_position LIKE '%" . $requestData['search']['value'] . "%' ";
        $sql .= " OR cm.customer_name LIKE '%" . $requestData['search']['value'] . "%' ";
        $sql .= " OR cm.customer_mobile LIKE '%" . $requestData['search']['value'] . "%' ";
        $sql .= " OR vl.visitor_id LIKE '%" . $requestData['search']['value'] . "%' ";
        $sql .= " OR vl.aws_faceid LIKE '%" . $requestData['search']['value'] . "%' ";
        $sql .= " OR vl.visitor_gender LIKE '%" . $requestData['search']['value'] . "%' ";
        $sql .= " OR vl.min_age LIKE '%" . $requestData['search']['value'] . "%' ";
        // $sql .= " OR vl.max_age LIKE '%" . $requestData['search']['value'] . "%' ";
        $sql .= " OR vl.age_category LIKE '%" . $requestData['search']['value'] . "%' ";
        $sql .= " OR vl.visitor_list_entdate LIKE '%" . $requestData['search']['value'] . "%' )";
    }
    $query = mysqli_query($conn, $sql);

    $totalFiltered = mysqli_num_rows($query); // when there is a search parameter then we have to modify total number filtered rows as per search result.
		if($requestData['length'] == -1) {
      if($requestData['order'][0]['column'] == 0 and $requestData['order'][0]['dir'] == 'asc') {
			  $sql .= " ORDER BY " . $columns[10] . " desc ";
      } else {
        $sql .= " ORDER BY " . $columns[$requestData['order'][0]['column']] . "   " . $requestData['order'][0]['dir'] . " ";
      }
		} else {
      if($requestData['order'][0]['column'] == 0 and $requestData['order'][0]['dir'] == 'asc') {
			  $sql .= " ORDER BY " . $columns[10] . " desc LIMIT " . $requestData['start'] . " ," . $requestData['length'] . " ";
      } else {
    	  $sql .= " ORDER BY " . $columns[$requestData['order'][0]['column']] . "   " . $requestData['order'][0]['dir'] . "   LIMIT " . $requestData['start'] . " ," . $requestData['length'] . " ";
      }
		}
// echo $sql;
    // echo "==".$requestData['order'][0]['column']."==".$requestData['order'][0]['dir']."==".$requestData['start']."==".$requestData['length']."==";
    /* $requestData['order'][0]['column'] contains colmun index, $requestData['order'][0]['dir'] contains order such as asc/desc , $requestData['start'] contains start row number ,$requestData['length'] contains limit length. */
    $query = mysqli_query($conn, $sql) or die("Mysql Mysql Error in getting : get products");
    $data = array();
    $ii = $requestData['start'];
    while ($row = mysqli_fetch_array($query)) {  // preparing an array
        $ii++;
// echo "<br>==".'../uploads/visitor_list/'.$row["aws_faceid"].'.jpg'."==".file_exists('../uploads/visitor_list/'.$row["aws_faceid"].'.jpg')."==";
        $nestedData = array();
        $nestedData[] = $ii;
        $nestedData[] = $row["store_name"];
        $nestedData[] = $row["camera_position"]." - ".$row["ip_address"]."<br>".$row["camera_details"];
        /* if($row["customer_name"] == '') {
	  if (file_exists('../uploads/visitor_list/'.$row["aws_faceid"].'.jpg')) {
          	$nestedData[] = "<a target='_blank' href='uploads/visitor_list/".$row["aws_faceid"].".jpg'><img src='uploads/visitor_list/".$row["aws_faceid"].".jpg' style='width: 100px; height: auto; max-height: 100px;'></a><br>".'-- NO --';
	  } else {
		$nestedData[] = "<a target='_blank' href='https://yjtec.in/sms_portal/libraries/assets/images/people.png'><img src='https://yjtec.in/sms_portal/libraries/assets/images/people.png' style='width: 100px; height: auto; max-height: 100px;'></a><br>"."-- NO --";
	  }
        } else {
          if (file_exists('../uploads/visitor_list/'.$row["aws_faceid"].'.jpg')) {
	          $nestedData[] = "<a target='_blank' href='uploads/visitor_list/".$row["aws_faceid"].".jpg'><img src='uploads/visitor_list/".$row["aws_faceid"].".jpg' style='width: 100px; height: auto; max-height: 100px;'></a><br>".$row["customer_name"];
	  } else {
		$nestedData[] = "<a target='_blank' href='https://yjtec.in/sms_portal/libraries/assets/images/people.png'><img src='https://yjtec.in/sms_portal/libraries/assets/images/people.png' style='width: 100px; height: auto; max-height: 100px;'></a><br>".$row["customer_name"];
	  }
        } */

	if($row["customer_name"] == '') {
          if (file_exists('../uploads/visitor_list/'.$row["aws_faceid"].'.jpg')) {
            $nestedData[] = "<a href='uploads/visitor_list/".$row["aws_faceid"].".jpg' data-lightbox='mygallery'><img src='uploads/visitor_list/".$row["aws_faceid"].".jpg' style='width: 100px; height: auto; max-height: 100px;'></a><br>".'-- NO --';
          } else {
            $nestedData[] = "<a href='https://yjtec.in/sms_portal/libraries/assets/images/people.png' data-lightbox='mygallery'><img src='https://yjtec.in/sms_portal/libraries/assets/images/people.png' style='width: 100px; height: auto; max-height: 100px;'></a><br>"."-- NO --";
          }
        } else {
          if (file_exists('../uploads/visitor_list/'.$row["aws_faceid"].'.jpg')) {
            $nestedData[] = "<a href='uploads/visitor_list/".$row["aws_faceid"].".jpg' data-lightbox='mygallery'><img src='uploads/visitor_list/".$row["aws_faceid"].".jpg' style='width: 100px; height: auto; max-height: 100px;'></a><br>".$row["customer_name"];
          } else {
            $nestedData[] = "<a href='https://yjtec.in/sms_portal/libraries/assets/images/people.png' data-lightbox='mygallery'><img src='https://yjtec.in/sms_portal/libraries/assets/images/people.png' style='width: 100px; height: auto; max-height: 100px;'></a><br>".$row["customer_name"];
          }
        }

        if($row["customer_name"] == '') {
          $nestedData[] = '-';
        } else {
          $nestedData[] = $row["customer_mobile"];
        }
        
        $nestedData[] = $row["visitor_id"];
        $nestedData[] = $row["aws_faceid"];
        switch ($row["visitor_gender"]) {
          case 'M':
            $nestedData[] = 'MALE';
            break;
          
          case 'F':
            $nestedData[] = 'FEMALE';
            break;
          
          default:
            $nestedData[] = 'OTHERS';
            break;
        }
        
        $nestedData[] = $row["min_age"]." - ".$row["max_age"];
        $nestedData[] = $row["age_category"];
        $nestedData[] = $row["visitor_list_entdate"];
        $data[] = $nestedData;
    }

    $json_data = array(
        "draw" => intval($requestData['draw']),   // for every request/draw by clientside , they send a number as a parameter, when they recieve a response/data they first check the draw number, so we are sending same number in draw.
        "recordsTotal" => intval($totalData),  // total number of records
        "recordsFiltered" => intval($totalFiltered), // total number of records after searching, if there is no searching then totalFiltered = totalData
        "data" => $data   // total data array
    );

    echo json_encode($json_data); // send data as json format
}

function getRTHRS($conn)
{
		// storing  request (ie, get/post) global array to a variable
    $requestData = $_REQUEST;
    $columns = array(
		// datatable column index  => database column name
        0 => 'serial_number',
        1 => 'visitor_list_entdate',
        2 => 'hour_time',
        3 => 'visitor_count',
        4 => 'male_cnt',
        5 => 'female_cnt',
        6 => 'others_cnt',
        7 => 'cnt_registration'
    );
    
		// getting total number records without any search
    $sql = "select @s:=@s+1 serial_number, date(visitor_list_entdate) visitor_list_entdate, hour(visitor_list_entdate) hour_time, count(visitor_list_id) visitor_count, sum(visitor_gender = 'M') as male_cnt, sum(visitor_gender = 'F') as female_cnt,sum(visitor_gender = 'O') as others_cnt, (select count(customer_id) from customer_management, (SELECT @s:= 0) AS s where (date(cus_mgt_entry_date) BETWEEN '".date("Y-m-d")."' AND '".date("Y-m-d")."') and (hour(cus_mgt_entry_date) = hour(visitor_list_entdate))) cnt_registration from visitor_list where (date(visitor_list_entdate) BETWEEN '".date("Y-m-d")."' AND '".date("Y-m-d")."') group by hour(visitor_list_entdate) ";
    $query = mysqli_query($conn, $sql);
    $totalData = mysqli_num_rows($query);
    $totalFiltered = $totalData; // when there is no search parameter then total number rows = total number filtered rows.

    $sql = "select @s:=@s+1 serial_number, date(visitor_list_entdate) visitor_list_entdate, hour(visitor_list_entdate) hour_time, count(visitor_list_id) visitor_count, sum(visitor_gender = 'M') as male_cnt, sum(visitor_gender = 'F') as female_cnt,sum(visitor_gender = 'O') as others_cnt, (select count(customer_id) from customer_management where (date(cus_mgt_entry_date) BETWEEN '".date("Y-m-d")."' AND '".date("Y-m-d")."') and (hour(cus_mgt_entry_date) = hour(visitor_list_entdate))) cnt_registration from visitor_list, (SELECT @s:= 0) AS s where (date(visitor_list_entdate) BETWEEN '".date("Y-m-d")."' AND '".date("Y-m-d")."') and 1=1 ";
    if (!empty($requestData['search']['value'])) { // if there is a search parameter, $requestData['search']['value'] contains search parameter
        $sql .= " AND ( visitor_list_entdate LIKE '%" . $requestData['search']['value'] . "%' ";
        $sql .= " OR hour(visitor_list_entdate) LIKE '%" . $requestData['search']['value'] . "%' )";
    }
    $sql .= " group by hour(visitor_list_entdate) ";
    $query = mysqli_query($conn, $sql);

    $totalFiltered = mysqli_num_rows($query); // when there is a search parameter then we have to modify total number filtered rows as per search result.
		if($requestData['length'] == -1) {
			$sql .= " ORDER BY " . $columns[$requestData['order'][0]['column']] . "   " . $requestData['order'][0]['dir'] . " ";
		} else {
    	$sql .= " ORDER BY " . $columns[$requestData['order'][0]['column']] . "   " . $requestData['order'][0]['dir'] . "   LIMIT " . $requestData['start'] . " ," . $requestData['length'] . " ";
		}
    // echo $sql;
    /* $requestData['order'][0]['column'] contains colmun index, $requestData['order'][0]['dir'] contains order such as asc/desc , $requestData['start'] contains start row number ,$requestData['length'] contains limit length. */
    $query = mysqli_query($conn, $sql) or die("Mysql Mysql Error in getting : get products");
    $data = array();
    $ii = $requestData['start'];
    while ($row = mysqli_fetch_array($query)) {  // preparing an array
        $ii++;
        $nestedData = array();
        $nestedData[] = $ii;
        $nestedData[] = date("Y-m-d");
        $nestedData[] = $row["hour_time"]." - ".($row["hour_time"] + 1);
        $nestedData[] = $row["visitor_count"];
        $nestedData[] = $row["male_cnt"];
        $nestedData[] = $row["female_cnt"];
        $nestedData[] = $row["others_cnt"];
        $nestedData[] = $row["cnt_registration"];
        $data[] = $nestedData;
    }

    $json_data = array(
        "draw" => intval($requestData['draw']),   // for every request/draw by clientside , they send a number as a parameter, when they recieve a response/data they first check the draw number, so we are sending same number in draw.
        "recordsTotal" => intval($totalData),  // total number of records
        "recordsFiltered" => intval($totalFiltered), // total number of records after searching, if there is no searching then totalFiltered = totalData
        "data" => $data   // total data array
    );

    echo json_encode($json_data); // send data as json format
}


function getMIS($conn)
{
		// storing  request (ie, get/post) global array to a variable
    $requestData = $_REQUEST;
    $columns = array(
		// datatable column index  => database column name
        0 => 'st.store_name',
        1 => 'ct.camera_position',
        2 => 'cm.customer_name',
        3 => 'vl.aws_faceid',
        4 => 'vl.visitor_gender',
        5 => 'vl.min_age',
        6 => 'vl.max_age',
        7 => 'vl.age_category',
        8 => 'vl.visitor_list_entdate'
    );
    
		// getting total number records without any search
    $sql = "SELECT vl.store_id, st.store_name, vl.camera_id, ct.camera_position, ct.ip_address, ct.camera_details, cm.customer_id, cm.customer_name, vl.visitor_gender, vl.min_age, vl.max_age, vl.age_category, vl.aws_faceid, vl.visitor_id, vl.visitor_list_entdate ";
    $sql .= "FROM visitor_list vl
    left join store_details st on vl.store_id = st.store_id
    left join camera_details ct on vl.camera_id = ct.camera_id
    left join customer_management cm on cm.customer_id = vl.customer_id ";
    $sql .= "where vl.visitor_list_status = 'Y' and DATE(vl.visitor_list_entdate) = '".date("Y-m-d")."'";
    $query = mysqli_query($conn, $sql);
    $totalData = mysqli_num_rows($query);
    $totalFiltered = $totalData; // when there is no search parameter then total number rows = total number filtered rows.

    $sql = "SELECT vl.store_id, st.store_name, vl.camera_id, ct.camera_position, ct.ip_address, ct.camera_details, cm.customer_id, cm.customer_name, vl.visitor_gender, vl.min_age, vl.max_age, vl.age_category, vl.aws_faceid, vl.visitor_id, vl.visitor_list_entdate 
    FROM visitor_list vl
    left join store_details st on vl.store_id = st.store_id
    left join camera_details ct on vl.camera_id = ct.camera_id
    left join customer_management cm on cm.customer_id = vl.customer_id
    where vl.visitor_list_status = 'Y' and DATE(vl.visitor_list_entdate) = '".date("Y-m-d")."' and 1=1 ";
    if (!empty($requestData['search']['value'])) { // if there is a search parameter, $requestData['search']['value'] contains search parameter
        $sql .= " AND ( st.store_name LIKE '%" . $requestData['search']['value'] . "%' ";
        $sql .= " OR ct.camera_position LIKE '%" . $requestData['search']['value'] . "%' ";
        $sql .= " OR cm.customer_name LIKE '%" . $requestData['search']['value'] . "%' ";
        $sql .= " OR vl.aws_faceid LIKE '%" . $requestData['search']['value'] . "%' ";
        $sql .= " OR vl.visitor_gender LIKE '%" . $requestData['search']['value'] . "%' ";
        $sql .= " OR vl.min_age LIKE '%" . $requestData['search']['value'] . "%' ";
        $sql .= " OR vl.max_age LIKE '%" . $requestData['search']['value'] . "%' ";
        $sql .= " OR vl.age_category LIKE '%" . $requestData['search']['value'] . "%' ";
        $sql .= " OR vl.visitor_list_entdate LIKE '%" . $requestData['search']['value'] . "%' )";
    }
    $query = mysqli_query($conn, $sql);

    $totalFiltered = mysqli_num_rows($query); // when there is a search parameter then we have to modify total number filtered rows as per search result.
		if($requestData['length'] == -1) {
			$sql .= " ORDER BY " . $columns[$requestData['order'][0]['column']] . "   " . $requestData['order'][0]['dir'] . " ";
		} else {
    	$sql .= " ORDER BY " . $columns[$requestData['order'][0]['column']] . "   " . $requestData['order'][0]['dir'] . "   LIMIT " . $requestData['start'] . " ," . $requestData['length'] . " ";
		}

    /* $requestData['order'][0]['column'] contains colmun index, $requestData['order'][0]['dir'] contains order such as asc/desc , $requestData['start'] contains start row number ,$requestData['length'] contains limit length. */
    $query = mysqli_query($conn, $sql) or die("Mysql Mysql Error in getting : get products");
    $data = array();
    while ($row = mysqli_fetch_array($query)) {  // preparing an array
        $nestedData = array();
        $nestedData[] = $row["store_name"];
        $nestedData[] = $row["camera_position"]." - ".$row["ip_address"]."<br>".$row["camera_details"];
        $nestedData[] = $row["customer_name"];
        $nestedData[] = $row["aws_faceid"];
        switch ($row["visitor_gender"]) {
          case 'M':
            $nestedData[] = 'MALE';
            break;
          
          case 'F':
            $nestedData[] = 'FEMALE';
            break;
          
          default:
            $nestedData[] = 'OTHERS';
            break;
        }
        
        $nestedData[] = $row["min_age"]." - ".$row["max_age"];
        $nestedData[] = $row["age_category"];
        $nestedData[] = $row["visitor_list_entdate"];
        $data[] = $nestedData;
    }

    $json_data = array(
        "draw" => intval($requestData['draw']),   // for every request/draw by clientside , they send a number as a parameter, when they recieve a response/data they first check the draw number, so we are sending same number in draw.
        "recordsTotal" => intval($totalData),  // total number of records
        "recordsFiltered" => intval($totalFiltered), // total number of records after searching, if there is no searching then totalFiltered = totalData
        "data" => $data   // total data array
    );

    echo json_encode($json_data); // send data as json format
}

function getCamera($conn)
{
  // storing  request (ie, get/post) global array to a variable
  $requestData = $_REQUEST;
  $columns = array(
  // datatable column index  => database column name
      0 => 'sd.store_name',
      1 => 'cd.camera_position',
      2 => 'cd.ip_address',
      3 => 'cd.camera_details',
      4 => 'cd.video_url',
      5 => 'cd.start_stop_action',
      6 => 'cd.camera_status',
      7 => 'cd.camera_entry_date'
  );
  
  // getting total number records without any search
  $sql = "SELECT sd.store_name, cd.camera_position, cd.ip_address, cd.camera_details, cd.video_url, cd.start_stop_action, cd.camera_status, cd.camera_entry_date FROM camera_details cd left join store_details sd on cd.store_id = sd.store_id";

  $query = mysqli_query($conn, $sql);
  $totalData = mysqli_num_rows($query);
  $totalFiltered = $totalData; // when there is no search parameter then total number rows = total number filtered rows.

  $sql = "SELECT sd.store_name, cd.camera_position, cd.ip_address, cd.camera_details, cd.video_url, cd.start_stop_action, cd.camera_status, cd.camera_entry_date FROM camera_details cd left join store_details sd on cd.store_id = sd.store_id where 1=1 ";
  if (!empty($requestData['search']['value'])) { // if there is a search parameter, $requestData['search']['value'] contains search parameter
      $sql .= " AND ( sd.store_name LIKE '%" . $requestData['search']['value'] . "%' ";
      $sql .= " OR cd.camera_position LIKE '%" . $requestData['search']['value'] . "%' ";
      $sql .= " OR cd.ip_address LIKE '%" . $requestData['search']['value'] . "%' ";
      $sql .= " OR cd.camera_details LIKE '%" . $requestData['search']['value'] . "%' ";
      $sql .= " OR cd.video_url LIKE '%" . $requestData['search']['value'] . "%' ";
      $sql .= " OR cd.start_stop_action LIKE '%" . $requestData['search']['value'] . "%' ";
      $sql .= " OR cd.camera_status LIKE '%" . $requestData['search']['value'] . "%' ";
      $sql .= " OR cd.camera_entry_date LIKE '%" . $requestData['search']['value'] . "%' )";
  }
  $query = mysqli_query($conn, $sql);

  $totalFiltered = mysqli_num_rows($query); // when there is a search parameter then we have to modify total number filtered rows as per search result.
  if($requestData['length'] == -1) {
    $sql .= " ORDER BY " . $columns[$requestData['order'][0]['column']] . "   " . $requestData['order'][0]['dir'] . " ";
  } else {
    $sql .= " ORDER BY " . $columns[$requestData['order'][0]['column']] . "   " . $requestData['order'][0]['dir'] . "   LIMIT " . $requestData['start'] . " ," . $requestData['length'] . " ";
  }

  /* $requestData['order'][0]['column'] contains colmun index, $requestData['order'][0]['dir'] contains order such as asc/desc , $requestData['start'] contains start row number ,$requestData['length'] contains limit length. */
  $query = mysqli_query($conn, $sql) or die("Mysql Mysql Error in getting : get products");
  $data = array();
  $i = 0;
  while ($row = mysqli_fetch_array($query)) {  // preparing an array
      $i++;
      $nestedData = array();
      $nestedData[] = $row["store_name"];
      $nestedData[] = $row["camera_position"];
      $nestedData[] = $row["ip_address"];
      $nestedData[] = $row["camera_details"];
      $nestedData[] = $row["video_url"];
      switch ($row["start_stop_action"]) {
        case 'Y':
          $nestedData[] = 'STARTED <br> <input type="radio" name="contact_status_'.$i.'[]" id="contact_status_'.$i.'" tabindex="1" value="Y" checked="checked"> Started <input type="radio" name="contact_status_'.$i.'[]" id="contact_status_'.$i.'" tabindex="1" value="N"> Stop';
          break;
        
        default:
          $nestedData[] = 'STOPPED <br> <input type="radio" name="contact_status_'.$i.'[]" id="contact_status_'.$i.'" tabindex="1" value="Y"> Start <input type="radio" name="contact_status_'.$i.'[]" id="contact_status_'.$i.'" tabindex="1" value="N" checked="checked"> Stopped';
          break;
      }
      switch ($row["camera_status"]) {
        case 'Y':
          $nestedData[] = 'ACTIVE';
          break;
        
        default:
          $nestedData[] = 'INACTIVE';
          break;
      }
      $nestedData[] = $row["camera_entry_date"];
      $data[] = $nestedData;
  }

  $json_data = array(
      "draw" => intval($requestData['draw']),   // for every request/draw by clientside , they send a number as a parameter, when they recieve a response/data they first check the draw number, so we are sending same number in draw.
      "recordsTotal" => intval($totalData),  // total number of records
      "recordsFiltered" => intval($totalFiltered), // total number of records after searching, if there is no searching then totalFiltered = totalData
      "data" => $data   // total data array
  );

  echo json_encode($json_data); // send data as json format
}
?>

