<%@ page pageEncoding="utf-8"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-success">
	<div class="container-fluid">
		<a class="navbar-brand" href="#">Online Entertainment</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link" href="#">My
						Favorites</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-bs-toggle="dropdown" aria-expanded="false">
						Quocthanh <img class="rounded-circle"
						src="${pageContext.request.contextPath}/screenshot_1667315376.png"
						alt="" style="width: 26px;">
				</a>
					<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
						<li><a class="dropdown-item" href="#">Login</a></li>
						<li><a class="dropdown-item" href="#">Forgot Password</a></li>
						<li><a class="dropdown-item" href="#">Registration</a></li>
						<li><a class="dropdown-item" href="#">Registration</a></li>
						<li><a class="dropdown-item" href="#">Logoff</a></li>
						<li><a class="dropdown-item" href="#">Change Password</a></li>
						<li><a class="dropdown-item" href="#">Edit Profile</a></li>
					</ul></li>
			</ul>
		</div>
	</div>
</nav>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript">
	$('#changePassBtn').click(function() {
		$('#messageChangePass').text('');
		var curPass = $('#currentpass').val();
		var newPass = $('#newpass').val();
		var formData = {
			'curPass' : curPass,
			'newPass' : newPass
		};
		$.ajax({
			url : 'forgotPass',
			type : 'POST',
			data : formData
		}).then(function(data) {
			$('#messageChangePass').text('Password changed successfully!');
		}).fail(function(error) {
			$('#messageChangePass').text('Error');
		});
	});
</script>