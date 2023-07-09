<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<div class="container-fluid">
		<a class="navbar-brand" href="<c:url value='index'/>">Online
			Entertainment</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
				<c:choose>
					<c:when test="${empty sessionScope.currentUser}">
						<li class="nav-item"><a class="nav-link" href="login">Login</a></li>
						<li class="nav-item"><a class="nav-link" href="signup">Sign
								up</a></li>
					</c:when>
					<c:otherwise>
						<li class="nav-item"><a class="nav-link" href="admin">Administrator Tool</a></li>
						<li class="nav-item"><a class="nav-link" href="favorite">My
								Favorites</a></li>
						<li class="nav-item"><a class="nav-link" href="history">My
								History</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">
								${sessionScope.currentUser.username} <img class="rounded-circle"
								src="${pageContext.request.contextPath}/screenshot_1667315376.png"
								alt="" style="width: 26px;">
						</a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item" href="logout">Logout</a></li>
								<li><a class="dropdown-item" href="changepass"
									data-bs-toggle="modal" data-bs-target="#exampleModal"
									data-bs-whatever="@mdo">Change Password</a></li>
								<li><a class="dropdown-item" href="editprofile">Edit
										Profile</a></li>
							</ul></li>
					</c:otherwise>
				</c:choose>
			</ul>
			<!-- Modal -->
			<div class="modal fade" id="exampleModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">Change
								password</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<form>
								<div class="mb-3">
									<label for="recipient-name" class="col-form-label">Current
										Password:</label> <input type="text"
										class="form-control" id="currentpass">
								</div>
								<div class="mb-3">
									<label for="recipient-name" class="col-form-label">New
										Password:</label> <input type="text"
										class="form-control" id="newpass">
								</div>
								<h5 style="color: red" id="messageChangePass"></h5>
							</form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">Close</button>
							<button id="changePassBtn" type="button" class="btn btn-primary">Confirm</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</nav>
