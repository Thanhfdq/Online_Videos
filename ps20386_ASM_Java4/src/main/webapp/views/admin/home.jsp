<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>CoreUI Free Bootstrap Admin Template</title>
<link rel="apple-touch-icon" sizes="57x57"
	href="<c:url value='/template/admin/assets/favicon/apple-icon-57x57.png'/>">
<link rel="apple-touch-icon" sizes="60x60"
	href="<c:url value='/template/admin/assets/favicon/apple-icon-60x60.png'/>">
<link rel="apple-touch-icon" sizes="72x72"
	href="<c:url value='/template/admin/assets/favicon/apple-icon-72x72.png'/>">
<link rel="apple-touch-icon" sizes="76x76"
	href="<c:url value='/template/admin/assets/favicon/apple-icon-76x76.png'/>">
<link rel="apple-touch-icon" sizes="114x114"
	href="<c:url value='/template/admin/assets/favicon/apple-icon-114x114.png'/>">
<link rel="apple-touch-icon" sizes="120x120"
	href="<c:url value='/template/admin/assets/favicon/apple-icon-120x120.png'/>">
<link rel="apple-touch-icon" sizes="144x144"
	href="<c:url value='/template/admin/assets/favicon/apple-icon-144x144.png'/>">
<link rel="apple-touch-icon" sizes="152x152"
	href="<c:url value='/template/admin/assets/favicon/apple-icon-152x152.png'/>">
<link rel="apple-touch-icon" sizes="180x180"
	href="<c:url value='/template/admin/assets/favicon/apple-icon-180x180.png'/>">
<link rel="icon" type="image/png" sizes="192x192"
	href="<c:url value='/template/admin/assets/favicon/android-icon-192x192.png'/>">
<link rel="icon" type="image/png" sizes="32x32"
	href="<c:url value='/template/admin/assets/favicon/favicon-32x32.png'/>">
<link rel="icon" type="image/png" sizes="96x96"
	href="<c:url value='/template/admin/assets/favicon/favicon-96x96.png'/>">
<link rel="icon" type="image/png" sizes="16x16"
	href="<c:url value='/template/admin/assets/favicon/favicon-16x16.png'/>">
<link rel="manifest"
	href="<c:url value='/template/admin/assets/favicon/manifest.json'/>">
<meta name="msapplication-TileColor" content="#ffffff">
<meta name="msapplication-TileImage"
	content="<c:url value='/template/admin/assets/favicon/ms-icon-144x144.png'/>">
<meta name="theme-color" content="#ffffff">
<!-- Vendors styles-->
<link rel="stylesheet"
	href="<c:url value='/template/admin/vendors/simplebar/css/simplebar.css'/>">
<link rel="stylesheet"
	href="<c:url value='/template/admin/css/vendors/simplebar.css'/>">
<!-- Main styles for this application-->
<link
	href="<c:url value='/template/admin/css/style.css" rel="stylesheet'/>">
<!-- We use those styles to show code examples, you should remove them in your application.-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/prismjs@1.23.0/themes/prism.css">
<link
	href="<c:url value='/template/admin/css/examples.css" rel="stylesheet'/>">
<!-- Global site tag (gtag.js) - Google Analytics-->
<script async=""
	src="https://www.googletagmanager.com/gtag/js?id=UA-118965717-3"></script>
<script>
	window.dataLayer = window.dataLayer || [];
	function gtag() {
		dataLayer.push(arguments);
	}
	gtag('js', new Date());
	// Shared ID
	gtag('config', 'UA-118965717-3');
	// Bootstrap ID
	gtag('config', 'UA-118965717-5');
</script>
<link href="node_modules/@coreui/chartjs/dist/css/coreui-chartjs.css"
	rel="stylesheet">
</head>
<body>
	<div class="sidebar sidebar-dark sidebar-fixed" id="sidebar">
		<div class="sidebar-brand d-none d-md-flex">
			<svg class="sidebar-brand-full" width="118" height="46"
				alt="CoreUI Logo">
          <use
					xlink:href="<c:url value='/template/admin/assets/brand/coreui.svg#full'/>"></use>
        </svg>
			<svg class="sidebar-brand-narrow" width="46" height="46"
				alt="CoreUI Logo">
          <use
					xlink:href="<c:url value='/template/admin/assets/brand/coreui.svg#signet'/>"></use>
        </svg>
		</div>
		<ul class="sidebar-nav" data-coreui="navigation" data-simplebar>
			<li class="nav-item"><a class="nav-link" href="index.html">
					<svg class="nav-icon">
              <use
							xlink:href="<c:url value='/template/admin/vendors/@coreui/icons/svg/free.svg#cil-speedometer'/>"></use>
            </svg> Home<span class="badge badge-sm bg-info ms-auto">NEW</span>
			</a></li>
			<li class="nav-group"><a class="nav-link nav-group-toggle"
				href="#"> <svg class="nav-icon">
              <use
							xlink:href="<c:url value='/template/admin/vendors/@coreui/icons/svg/free.svg#cil-puzzle'/>"></use>
            </svg> Video
			</a>
				<ul class="nav-group-items">
					<li class="nav-item"><a class="nav-link"
						href="<c:url value='/template/admin/base/accordion.html'/>"><span
							class="nav-icon"></span> Overview</a></li>
					<li class="nav-item"><a class="nav-link"
						href="<c:url value='/template/admin/base/breadcrumb.html'/>"><span
							class="nav-icon"></span> View or Edit</a></li>
				</ul></li>
		</ul>
		<button class="sidebar-toggler" type="button"
			data-coreui-toggle="unfoldable"></button>
	</div>
	<div class="wrapper d-flex flex-column min-vh-100 bg-light">
		<header class="header header-sticky mb-4">
			<div class="container-fluid">
				<button class="header-toggler px-md-0 me-md-3" type="button"
					onclick="coreui.Sidebar.getInstance(document.querySelector('#sidebar')).toggle()">
					<svg class="icon icon-lg">
              <use
							xlink:href="<c:url value='/template/admin/vendors/@coreui/icons/svg/free.svg#cil-menu'/>"></use>
            </svg>
				</button>
				<a class="header-brand d-md-none" href="#"> <svg width="118"
						height="46" alt="CoreUI Logo">
              <use
							xlink:href="<c:url value='/template/admin/assets/brand/coreui.svg#full'/>"></use>
            </svg></a>
				<ul class="header-nav d-none d-md-flex">
					<li class="nav-item"><a class="nav-link" href="#">Dashboard</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Users</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Settings</a></li>
				</ul>
				<ul class="header-nav ms-auto">
					<li class="nav-item"><a class="nav-link" href="#"> <svg
								class="icon icon-lg">
                  <use
									xlink:href="<c:url value='/template/admin/vendors/@coreui/icons/svg/free.svg#cil-bell'/>"></use>
                </svg></a></li>
					<li class="nav-item"><a class="nav-link" href="#"> <svg
								class="icon icon-lg">
                  <use
									xlink:href="<c:url value='/template/admin/vendors/@coreui/icons/svg/free.svg#cil-list-rich'/>"></use>
                </svg></a></li>
					<li class="nav-item"><a class="nav-link" href="#"> <svg
								class="icon icon-lg">
                  <use
									xlink:href="<c:url value='/template/admin/vendors/@coreui/icons/svg/free.svg#cil-envelope-open'/>"></use>
                </svg></a></li>
				</ul>
				<ul class="header-nav ms-3">
					<li class="nav-item dropdown"><a class="nav-link py-0"
						data-coreui-toggle="dropdown" href="#" role="button"
						aria-haspopup="true" aria-expanded="false">
							<div class="avatar avatar-md">
								<img class="avatar-img"
									src="<c:url value='/template/admin/assets/img/avatars/8.jpg'/>"
									alt="user@email.com">
							</div>
					</a>
						<div class="dropdown-menu dropdown-menu-end pt-0">
							<div class="dropdown-header bg-light py-2">
								<div class="fw-semibold">Account</div>
							</div>
							<a class="dropdown-item" href="#"> <svg class="icon me-2">
                    <use
										xlink:href="node_modules/@coreui/icons/sprites/free.svg#cil-bell"></use>
                  </svg> Updates<span class="badge badge-sm bg-info ms-2">42</span></a><a
								class="dropdown-item" href="#"> <svg class="icon me-2">
                    <use
										xlink:href="node_modules/@coreui/icons/sprites/free.svg#cil-envelope-open"></use>
                  </svg> Messages<span class="badge badge-sm bg-success ms-2">42</span></a><a
								class="dropdown-item" href="#"> <svg class="icon me-2">
                    <use
										xlink:href="node_modules/@coreui/icons/sprites/free.svg#cil-task"></use>
                  </svg> Tasks<span class="badge badge-sm bg-danger ms-2">42</span></a><a
								class="dropdown-item" href="#"> <svg class="icon me-2">
                    <use
										xlink:href="node_modules/@coreui/icons/sprites/free.svg#cil-comment-square"></use>
                  </svg> Comments<span class="badge badge-sm bg-warning ms-2">42</span></a>
							<div class="dropdown-header bg-light py-2">
								<div class="fw-semibold">Settings</div>
							</div>
							<a class="dropdown-item" href="#"> <svg class="icon me-2">
                    <use
										xlink:href="node_modules/@coreui/icons/sprites/free.svg#cil-user"></use>
                  </svg> Profile
							</a><a class="dropdown-item" href="#"> <svg class="icon me-2">
                    <use
										xlink:href="node_modules/@coreui/icons/sprites/free.svg#cil-settings"></use>
                  </svg> Settings
							</a><a class="dropdown-item" href="#"> <svg class="icon me-2">
                    <use
										xlink:href="node_modules/@coreui/icons/sprites/free.svg#cil-credit-card"></use>
                  </svg> Payments<span
								class="badge badge-sm bg-secondary ms-2">42</span></a><a
								class="dropdown-item" href="#"> <svg class="icon me-2">
                    <use
										xlink:href="node_modules/@coreui/icons/sprites/free.svg#cil-file"></use>
                  </svg> Projects<span class="badge badge-sm bg-primary ms-2">42</span></a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="#"> <svg class="icon me-2">
                    <use
										xlink:href="node_modules/@coreui/icons/sprites/free.svg#cil-lock-locked"></use>
                  </svg> Lock Account
							</a><a class="dropdown-item" href="#"> <svg class="icon me-2">
                    <use
										xlink:href="node_modules/@coreui/icons/sprites/free.svg#cil-account-logout"></use>
                  </svg> Logout
							</a>
						</div></li>
				</ul>
			</div>
			<div class="header-divider"></div>
			<div class="container-fluid">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb my-0 ms-2">
						<li class="breadcrumb-item">
							<!-- if breadcrumb is single-->
							<span>Home</span>
						</li>
						<li class="breadcrumb-item active"><span>Dashboard</span></li>
					</ol>
				</nav>
			</div>
		</header>


		<div class="body flex-grow-1 px-3">
			<div class="container-lg">

				<div class="card mb-4">
					<div class="card-header">
						<strong>Favorite Statistic</strong><span class="small ms-1"></span>
					</div>
					<div class="tab-content rounded-bottom">
						<div class="tab-pane p-3 active preview" role="tabpanel"
							id="preview-24">
							<table class="table">
								<thead class="table-light">
									<tr>
										<th scope="col">#</th>
										<th scope="col">Title</th>
										<th scope="col">Link</th>
										<th scope="col">Total Like</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${videos}" var="item">
										<tr>
											<th scope="row">1</th>
											<td>${item.title}</td>
											<td><a href="video?action=watch&id='${item.href}'">${item.href}</a></td>
											<td>${item.totalLike}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="card mb-4">
					<div class="card-header">
						<strong>Favorite Info</strong><span class="small ms-1"></span> 
						<select id="selectVideo" class="form-select" aria-label="Default select example">
							<option selected disabled>Select a video to show list user liked</option>
							<c:forEach items="${videos}" var="item">
								<option value="${item.href}">${item.title}</option>
							</c:forEach>
						</select>
					</div>
					<div class="tab-content rounded-bottom">
						<div class="tab-pane p-3 active preview" role="tabpanel"
							id="preview-24">
							<table class="table" id="tblInfo">
								<thead class="table-light">
									<tr>
										<th scope="col">User name</th>
										<th scope="col">Email</th>
									</tr>
								</thead>
								<tbody>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>

		<footer class="footer">
			<div>
				<a href="https://coreui.io">CoreUI </a><a href="https://coreui.io">Bootstrap
					Admin Template</a> &copy; 2022 creativeLabs.
			</div>
			<div class="ms-auto">
				Powered by&nbsp;<a href="https://coreui.io/docs/">CoreUI UI
					Components</a>
			</div>
		</footer>
	</div>
	<!-- CoreUI and necessary plugins-->
	<script
		src="<c:url value='/template/admin/vendors/@coreui/coreui/js/coreui.bundle.min.js'/>"></script>
	<script
		src="<c:url value='/template/admin/vendors/simplebar/js/simplebar.min.js'/>"></script>
	<!-- Plugins and scripts required by this view-->
	<script
		src="<c:url value='/template/admin/vendors/chart.js/js/chart.min.js'/>"></script>
	<script
		src="<c:url value='/template/admin/vendors/@coreui/chartjs/js/coreui-chartjs.js'/>"></script>
	<script
		src="<c:url value='/template/admin/vendors/@coreui/utils/js/coreui-utils.js'/>"></script>
	<script src="<c:url value='/template/admin/js/main.js'/>"></script>
	<script
		src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<script>
		$('#selectVideo').change(function(){
			var videoHref = $(this).val();
			$.ajax({
				url:'admin/favorites?href='+videoHref,
				type: 'GET',
				contentType: 'application/json'
			}).done(function(data){
				$('#tblInfo').DataTable({
					destroy: true,
					"paging": true,
					"lenghtChange": false,
					"searching": true,
					"ordering": true,
					"info": true,
					"autoWidth": false,
					"responsive": true,
					"aaData": data,
					"columns": [
						{"data": "username"},
						{"data": "email"},
					]
				});
			}).fail(function(error){
				$('#tblInfo').dataTable().fnClearTable();
			});
		});
	</script>
</body>
</html>
