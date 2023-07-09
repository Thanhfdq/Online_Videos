<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Forgot Password</title>
<%@ include file="/common/head.jsp"%>
</head>
<body>
	<%@ include file="/common/header.jsp"%>
	<main class="form-signin w-50" style="margin: 100px auto;">
		<form>
			<!-- <img class="mb-4" src="${pageContext.request.contextPath}/imgs/MainLogoLite.png" alt="" width="57"
				height="57"> -->
			<h1 class="h3 mb-3 fw-normal">Restore password</h1>
			<b><i id="messagePass"></i></b>

			<div class="form-floating">
				<input class="form-control" id="email"
					placeholder="mail"> <label for="email">Email</label>
			</div>
			<button id="sendBtn" type="submit"
				class="w-100 btn btn-lg btn-dark rounded-pill signin">Send
				new password</button>
			<p>
			<p class="mt-5 mb-3 text-muted">&copy; 2023-2025</p>
		</form>
	</main>
	<%@ include file="/common/footer.jsp"%>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript">
		$('#sendBtn').click(function(){
			$('#messagePass').text('');
			var email = $('#email').val();
			var formData = {'email': email};
			$.ajax({
				url: 'forgotPass',
				type: 'POST',
				data: formData
			}).then(function(data){
				$('#messagePass').text('We have already send new password to email you typed below.');
				setTimeout(function(){
					window.location.href = 'http://localhost:8080/ps20386_ASM_Java4/index';
				}, 5*1000);
			}).fail(function(error){
				$('#messagePass').text('Error');
			});
		});
	</script>
</body>
</html>