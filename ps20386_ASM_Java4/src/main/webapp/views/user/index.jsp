<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<%@ include file="/common/head.jsp"%>
</head>
<body class="bg-success">
	<%@ include file="/common/header.jsp"%>

	<div class="container">
		<h3>Explore</h3>
		<div class="row row-cols-3 g-3 mt-5">

			<c:forEach items="${videos}" var="video">
				<div class="col">
					<div class="card text-dark bg-light shadow-sm p-2">
						<a href="<c:url value='/video?action=watch&id=${video.href}'/>"><img
							class="rounded-3" style="height: 230px; object-fit: cover;"
							alt=""
							src="https://img.youtube.com/vi/${video.href}/maxresdefault.jpg"></a>
						<div class="card-body"
							style="white-space: nowrap; overflow: hidden">
							<h4 class="card-title">${video.title}</h4>
							<div class="d-flex justify-content-between align-items-center">
								<div class="btn-group">
									<button type="button" class="btn btn-sm btn-outline-secondary">
										<i class="bi bi-hand-thumbs-up"></i> Like
									</button>
									<button type="button" class="btn btn-sm btn-outline-secondary">
										<i class="bi bi-share"></i> Share
									</button>
								</div>
								<small class="text-muted">${video.views} views</small> <small
									class="text-muted">${video.shares} shares</small>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>

		</div>
		<div class="text-center m-3">
			<div class="btn-group">
				<a class="btn btn-light ${currentPage==1?'disabled':''}" href="index?page=1">
					<i class="bi bi-chevron-bar-left"></i>
				</a>
				<a class="btn btn-light ${currentPage==1?'disabled':''}" href="index?page=${currentPage-1}">
					<i class="bi bi-chevron-left"></i>
				</a>
				<c:forEach varStatus="i" begin="1" end="${maxPage}">
					<a href="index?page=${i.index}" type="button"
						class="btn btn-outline-light ${currentPage==i.index?'active':''}">${i.index}</a>
				</c:forEach>
				<a class="btn btn-light ${currentPage==maxPage?'disabled':''}" href="index?page=${currentPage+1}">
					<i class="bi bi-chevron-right"></i>
				</a>
				<a class="btn btn-light ${currentPage==maxPage?'disabled':''}" href="index?page=${maxPage}">
					<i class="bi bi-chevron-bar-right"></i>
				</a>
			</div>
		</div>

	</div>
	<%@ include file="/common/footer.jsp"%>
</body>
</html>