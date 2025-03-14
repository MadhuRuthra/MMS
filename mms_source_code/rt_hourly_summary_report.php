<?php
session_start();
error_reporting(0);
include_once('api/configuration.php');
extract($_REQUEST);

/* if($_SESSION['yjtmms_user_id'] == ""){ ?>
<script>
window.location = "index";
</script>
<?php exit();
} */

$site_page_name = pathinfo($_SERVER['PHP_SELF'], PATHINFO_FILENAME);
site_log_generate("Real Time Hourly Summary Report Page : User : ".$_SESSION['yjtmms_user_name']." access the page on ".date("Y-m-d H:i:s"));
?>
<!DOCTYPE html>
<html lang="en" class="light-style layout-menu-fixed" dir="ltr" data-theme="theme-default" data-assets-path="assets/"
	data-template="vertical-menu-template-free">

<head>
	<meta http-equiv="refresh" content="120">
	<meta charset="utf-8" />
	<meta name="viewport"
		content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

	<title>Today Summary Report : <?=$site_title?></title>
	<meta name="description" content="" />

	<!-- Favicon -->
	<link rel="icon" type="image/x-icon" href="assets/img/favicon/favicon.ico" />

	<!-- Fonts -->
	<link rel="preconnect" href="https://fonts.googleapis.com" />
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
	<link
		href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
		rel="stylesheet" />

	<!-- Icons. Uncomment required icon fonts -->
	<link rel="stylesheet" href="assets/vendor/fonts/boxicons.css" />

	<!-- Core CSS -->
	<link rel="stylesheet" href="assets/vendor/css/core.css" class="template-customizer-core-css" />
	<link rel="stylesheet" href="assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
	<link rel="stylesheet" href="assets/css/demo.css" />

	<!-- Vendors CSS -->
	<link rel="stylesheet" href="assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

	<!-- Page CSS -->
	<link href="assets/css/bootstrap.min.css" rel="stylesheet" />
	<link href="assets/css/dataTables.bootstrap.min.css" rel="stylesheet" />

	<link rel="stylesheet" type="text/css"
		href="https://cdn.datatables.net/r/dt/jq-2.1.4,jszip-2.5.0,pdfmake-0.1.18,dt-1.10.9,af-2.0.0,b-1.0.3,b-colvis-1.0.3,b-html5-1.0.3,b-print-1.0.3,se-1.0.1/datatables.min.css" />


	<!-- Helpers -->
	<script src="assets/vendor/js/helpers.js"></script>

	<script src="assets/js/config.js"></script>
	<style>
	.container {
		width: 100 % !important;
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
						<h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Home /</span> Today Summary Report </h4>

						<div class="row">
							<div class="col-md-12">
								<div class="card mb-4">
									<!-- Account -->

									<div class="card-body">
										<form action="#" method="post" class="j-pro" id="j-pro" novalidate=""
											style="border:0px !important;">
											<!-- Responsive Table -->
											<div class="table-responsive dt-responsive">

												<div class="container">
													<table id="rthrs-grid" class="table table-striped table-bordered" style="width:100%; text-align: center;">
														<thead>
															<tr>
																<th>#</th>
																<th>Date</th>
																<th>Time</th>
																<th>Total Footfall Count</th>
																<th>Total Male Count</th>
																<th>Total Female Count</th>
<th>Total Others Count</th>
																<th>Total Registered Count</th>
															</tr>
														</thead>
													</table>
												</div>

											</div>
											<!--/ Responsive Table -->

										</form>
									</div>



									<!-- /Account -->
								</div>

							</div>
						</div>
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

	<!-- build:js assets/vendor/js/core.js -->
	<script src="assets/vendor/libs/jquery/jquery.js"></script>
	<script src="assets/vendor/libs/popper/popper.js"></script>
	<script src="assets/vendor/js/bootstrap.js"></script>
	<script src="assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

	<script src="assets/vendor/js/menu.js"></script>
	<!-- endbuild -->

	<!-- Main JS -->
	<script src="assets/js/main.js"></script>


	<script src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="https://cdn.datatables.net/r/dt/dt-1.10.9/datatables.min.js"></script>
	<script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap.min.js"></script>

	<script type="text/javascript"
		src="https://cdn.datatables.net/r/dt/jq-2.1.4,jszip-2.5.0,pdfmake-0.1.18,dt-1.10.9,af-2.0.0,b-1.0.3,b-colvis-1.0.3,b-html5-1.0.3,b-print-1.0.3,se-1.0.1/datatables.min.js">
	</script>

	<!-- Custom js -->
	<script type="text/javascript">
	$(document).ready(function() {
		var dataTable = $('#rthrs-grid').DataTable({
			"responsive": true,
			"searching": true,
			"processing": true,
			"serverSide": true,
			"ajax": {
				url: "ajax/data_response.php", // json datasource
				data: {
					action: 'getRTHRS'
				}, // Set the POST variable  array and adds action: getRTHRS - Real Time Hourly Summary Report
				type: 'post', // method  , by default get
			},
			error: function() { // error handling
				$(".rthrs-grid-error").html("");
				$("#rthrs-grid").append(
					'<tbody class="rthrs-grid-error"><tr><th colspan="5">No data found in the server</th></tr></tbody>');
				$("#rthrs-grid_processing").css("display", "none");
			},
			dom: 'lBfrtip',
			buttons: [{
					"extend": 'copy',
					"text": 'COPY',
					"titleAttr": 'Copy',
					"action": newexportaction
				},
				{
					"extend": 'csv',
					"text": 'CSV',
					"titleAttr": 'CSV',
					"action": newexportaction
				},
				{
					"extend": 'pdf',
					"text": 'PDF',
					"titleAttr": 'PDF',
					"action": newexportaction
				},
				{
					"extend": 'print',
					"text": 'PRINT',
					"titleAttr": 'Print',
					"action": newexportaction
				}
			],
			"lengthMenu": [
				[10, 25, 50, -1],
				[10, 25, 50, "All"]
			]
		});
	});

	function newexportaction(e, dt, button, config) {
		var self = this;
		var oldStart = dt.settings()[0]._iDisplayStart;
		dt.one('preXhr', function(e, s, data) {
			// Just this once, load all data from the server...
			data.start = 0;
			data.length = 2147483647;
			dt.one('preDraw', function(e, settings) {
				// Call the original action function
				if (button[0].className.indexOf('buttons-copy') >= 0) {
					$.fn.dataTable.ext.buttons.copyHtml5.action.call(self, e, dt, button, config);
				} else if (button[0].className.indexOf('buttons-excel') >= 0) {
					$.fn.dataTable.ext.buttons.excelHtml5.available(dt, config) ?
						$.fn.dataTable.ext.buttons.excelHtml5.action.call(self, e, dt, button, config) :
						$.fn.dataTable.ext.buttons.excelFlash.action.call(self, e, dt, button, config);
				} else if (button[0].className.indexOf('buttons-csv') >= 0) {
					$.fn.dataTable.ext.buttons.csvHtml5.available(dt, config) ?
						$.fn.dataTable.ext.buttons.csvHtml5.action.call(self, e, dt, button, config) :
						$.fn.dataTable.ext.buttons.csvFlash.action.call(self, e, dt, button, config);
				} else if (button[0].className.indexOf('buttons-pdf') >= 0) {
					$.fn.dataTable.ext.buttons.pdfHtml5.available(dt, config) ?
						$.fn.dataTable.ext.buttons.pdfHtml5.action.call(self, e, dt, button, config) :
						$.fn.dataTable.ext.buttons.pdfFlash.action.call(self, e, dt, button, config);
				} else if (button[0].className.indexOf('buttons-print') >= 0) {
					$.fn.dataTable.ext.buttons.print.action(e, dt, button, config);
				}
				dt.one('preXhr', function(e, s, data) {
					// DataTables thinks the first item displayed is index 0, but we're not drawing that.
					// Set the property to what it was before exporting.
					settings._iDisplayStart = oldStart;
					data.start = oldStart;
				});
				// Reload the grid with the original page. Otherwise, API functions like table.cell(this) don't work properly.
				setTimeout(dt.ajax.reload, 0);
				// Prevent rendering of the full data to the DOM
				return false;
			});
		});
		// Requery the server with the new one-time export settings
		dt.ajax.reload();
	};
	//For Export Buttons available inside jquery-datatable "server side processing" - End
	</script>
</body>

</html>
