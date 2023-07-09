<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>${video.title}</title>
<%@ include file="/common/head.jsp"%>
<style>
/* width */
::-webkit-scrollbar {
	width: 10px;
}
/* Track */
::-webkit-scrollbar-track {
	background: black;
}

/* Handle */
::-webkit-scrollbar-thumb {
	background: grey;
}

/* Handle on hover */
::-webkit-scrollbar-thumb:hover {
	background: #555;
}
</style>
</head>
<body class="bg-dark">
	<%@ include file="/common/header.jsp"%>
	<div class="container">
		<div class="row" style="height: 620px">
			<div class="col-lg-8 h-100">
				<div class="card text-light bg-dark my-3 me-3">
					<iframe width="100%" height="450px"
						src="https://www.youtube.com/embed/${video.href}"
						title="YouTube video player" frameborder="0"
						allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
						allowfullscreen></iframe>
					<div class="card-body">
						<h4 class="card-title">${video.title}</h4>
						<div class="d-flex justify-content-between align-items-center">
							<small class="text-white">${video.views} views</small> <small
								class="text-white">${video.shares} shares</small>
							<c:if test="${not empty sessionScope.currentUser}">
								<div class="btn-group">
									<button id="like" class="btn btn-sm btn-outline-light"
										onclick="likeVideo()">
										<c:choose>
											<c:when test="${flagLike==true}">
												<i class="bi bi-hand-thumbs-down"></i> UnLike
												</c:when>
											<c:otherwise>
												<i class="bi bi-hand-thumbs-up"></i> Like
												</c:otherwise>
										</c:choose>

									</button>
									<button type="button" class="btn btn-sm btn-outline-light">
										<i class="bi bi-share"></i> Share
									</button>
								</div>
							</c:if>
						</div>
						<p class="card-text mt-2">${video.description}</p>
					</div>
				</div>
			</div>
			<div class="list col-lg-4 h-100 overflow-auto mt-3">
				<c:forEach items="${videos}" var="video">
					<a href="<c:url value='/video?action=watch&id=${video.href}'/>" class="btn btn-outline-success w-100 p-0 mb-3">
						<div class="row text-light">
							<div class="col-5">
								<img class="rounded-3"
									style="height: 140px; width: 100%; object-fit: cover;" alt=""
									src="https://img.youtube.com/vi/${video.href}/maxresdefault.jpg">
							</div>
							<div class="col-7 py-3 text-start">
								<h4>${video.title}</h4>
								<small>${video.views} views</small>
							</div>
						</div>
					</a>
				</c:forEach>
				<input type="hidden" id="videoIdHdd" value="${video.href}">
			</div>
		</div>
	</div>
	<%@ include file="/common/footer.jsp"%>
	<script
		src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript">
		function likeVideo() {
			//var videoId = $('#videoIdHdd').val();
			var videoId = document.getElementById("videoIdHdd").value;
			$
					.ajax({
						url : 'video?action=like&id=' + videoId
					})
					.then(
							function(data) {
								var text = $('#like').text();
								if (text.indexOf('Like') != -1) {
									$('#like').text('');
									$('#like')
											.append(
													$('<i class="bi bi-hand-thumbs-down"></i>'));
									$('#like').append(' Unlike');
								} else {
									$('#like').text('');
									$('#like')
											.append(
													$('<i class="bi bi-hand-thumbs-up"></i>'));
									$('#like').append(' Like');
								}
							}).fail(function(error) {
						alert('ko like dc');
					});
		};
	</script>
</body>
</html>