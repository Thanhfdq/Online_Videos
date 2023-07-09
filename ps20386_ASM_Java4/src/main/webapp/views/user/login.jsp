<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<%@ include file="/common/head.jsp"%>
</head>
<body>
	<%@ include file="/common/header.jsp"%>
	<main class="form-signin w-50" style="margin: 100px auto;">
		<form action="login" method="post">
			<!-- <img class="mb-4" src="${pageContext.request.contextPath}/imgs/MainLogoLite.png" alt="" width="57"
				height="57"> -->
			<h1 class="h3 mb-3 fw-normal">Please sign in</h1>
			<b><i>${message}</i></b>

			<div class="form-floating">
				<input name="username" class="form-control" id="floatingInput"
					placeholder="name@example.com"> <label for="floatingInput">User
					name</label>
			</div>
			<div class="form-floating">
				<input type="password" name="password" class="form-control"
					id="floatingPassword" placeholder="Password"> <label
					for="floatingPassword">Password</label>
			</div>

			<div class="checkbox mb-3">
				<label> <input type="checkbox" value="remember-me">
					Remember me
				</label>
			</div>
			<button type="submit"
				class="w-100 btn btn-lg btn-dark rounded-pill signin">Sign
				in</button>
			<a href="forgotPass">Forgot password?</a>
			<p>
				Don't have an acount? <a href="/Lab5Java4/views/account/sign-up.jsp">Sign
					up</a> or sign in with
			</p>
			<p>
				<button class="btn btn-success">
					<i class="bi bi-google"></i>
				</button>
				<button class="btn btn-success">
					<i class="bi bi-facebook"></i>
				</button>
				<button class="btn btn-success">
					<i class="bi bi-twitter"></i>
				</button>
				<button class="btn btn-success">
					<i class="bi bi-github"></i>
				</button>
				<button class="btn btn-success">
					<i class="bi bi-microsoft"></i>
				</button>
			</p>
			<p class="mt-5 mb-3 text-muted">&copy; 2023-2025</p>
		</form>
	</main>
	<%@ include file="/common/footer.jsp"%>
</body>
</html>