<!DOCTYPE html>
<html lang="en">
<head>
	<title>JSPMyAdmin</title>
	
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.no-icons.min.css" rel="stylesheet">
	<link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet">
	<!-- fix for datatables -->
	<link href="css/datatables.bootstrap.css" rel="stylesheet">
	
	<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
	<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
	<script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
	<script src="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/jquery.dataTables.min.js"></script>
	<!-- fix for datatables -->
	<script src="js/datatables.bootstrap.js"></script>
	
	<script type="text/javascript">
		var errors,
		Alert = function(selector){
			var	self = this,
				$el = $(selector),
				$messages = $($el.find(selector+'-messages').get(0)),
				$close = $($el.find(selector+'-close').get(0));

			console.log(this);
			console.log($el);
			console.log($messages);
			console.log($close);

			function initialize(){
				console.log('initialize');
				$el.hide();
				$close.bind('click',function(e){
					e.preventDefault();
					console.log('hide');
					$el.hide();
				});
			}

			initialize();

			return {

				show : function(message){
					console.log('show');
					$messages.html(message);
					$el.show();
				}

			};

		};
	</script>

</head>
<body>
	<div class="container-fluid">

		<div id="error" class="alert alert-error">
			<button id="error-close" type="button" class="close" data-dismiss="alert">&times;</button>
			<div id="error-messages"></div>
		</div>

		<div id="success" class="alert alert-success">
			<button id="success-close" type="button" class="close" data-dismiss="alert">&times;</button>
			<div id="success-messages"></div>
		</div>

		<script type="text/javascript">
			error = new Alert('#error');
			success = new Alert('#success');
		</script>