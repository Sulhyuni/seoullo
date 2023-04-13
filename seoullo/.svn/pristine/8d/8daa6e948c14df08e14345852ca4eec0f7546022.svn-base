<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>EZENSEOULLO -Travel SEOUL</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="Free HTML Templates" name="keywords">
<meta content="Free HTML Templates" name="description">

<!-- Favicon -->
<link href="/resources/img/favicon.png" rel="icon">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap"
	rel="stylesheet">

<!-- Font Awesome -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="/resources/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link
	href="/resources/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css"
	rel="stylesheet" />

<!-- Customized Bootstrap Stylesheet -->
<link href="/resources/css/style.css" rel="stylesheet">

</head>

<body>

	<!-- Topbar Start -->
	<div class="container-fluid bg-light pt-3 d-none d-lg-block">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 text-center text-lg-left mb-2 mb-lg-0">
					<div class="d-inline-flex align-items-center">
						<p>
							<i class="fa fa-envelope mr-2"></i>ezenseoullo@gmail.com
						</p>
						<p class="text-body px-3">|</p>
						<p>
							<i class="fa fa-phone-alt mr-2"></i>+012 345 6789
						</p>
						
					</div>
				</div>


			</div>
		</div>
	</div>
	<!-- Topbar End -->


	<!-- Navbar Start -->
	<div class="container-fluid position-relative nav-bar p-0">
		<div class="container-lg position-relative p-0 px-lg-3"
			style="z-index: 9;">
			<nav
				class="navbar navbar-expand-lg bg-light navbar-light shadow-lg py-3 py-lg-0 pl-3 pl-lg-5">
				<a href="" class="navbar-brand">
					<h1 class="m-0 text-primary">
						<span class="text-dark">EZEN</span>SEOUL<span class="text-dark">LO</span>
					</h1>
				</a>
				<button type="button" class="navbar-toggler" data-toggle="collapse"
					data-target="#navbarCollapse">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse justify-content-between px-3"
					id="navbarCollapse">
					<ul class="navbar-nav ml-auto py-0">
						<li><a href="/" class="nav-item nav-link active">Home</a></li>
						<li><a href="/tour/list.do" class="nav-item nav-link">투어</a></li>
						<c:if test="${!empty login && login.gradeNo == 9}">
						<li><a href="/book/list.do" class="nav-item nav-link">예약현황</a></li>
						</c:if>
						<li><a href="/qna/list.do" class="nav-item nav-link">투어 Q&A</a></li>
						<li><a href="/siteqna/list.do" class="nav-item nav-link">사이트 Q&A</a></li>
						<li><a href="/anonymous/list.do" class="nav-item nav-link">익명게시판</a></li>
						<li><a href="/review/list.do" class="nav-item nav-link">후기게시판</a></li>
						<c:if test="${empty login }">
							<li><a href="/member/login.do" class="nav-item nav-link">로그인</a></li>
						</c:if>					
						<c:if test="${!empty login && login.gradeNo == 9}">
						<li><a href="/member/list.do" class="nav-item nav-link">회원 리스트</a></li>
						<li><a href="/member/logout.do" class="nav-item nav-link">로그아웃</a></li>
						</c:if>
						<c:if test="${!empty login && login.gradeNo == 1 || login.gradeNo == 2 ||login.gradeNo == 3}">
							<li><a href="/member/myPage.do" class="nav-item nav-link">마이페이지</a></li>
							<li><a href="/member/logout.do" class="nav-item nav-link">로그아웃</a></li>
						<c:if test="${!empty login && login.gradeNo == 1}">
							<li><a href="/cart/list.do" class="nav-item nav-link"><i class="fas fa-shopping-cart"></i></a></li>
						</c:if>
						</c:if>
					</ul>
				</div>
			</nav>
		</div>
	</div>
	<!-- Navbar End -->


	<!-- Carousel Start -->
	<div class="container-fluid p-0">
		<div id="header-carousel" class="carousel slide" data-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img class="w-100" src="resources/img/main.jpg" alt="Image">
					<div
						class="carousel-caption d-flex flex-column align-items-center justify-content-center">
						<div class="p-3" style="max-width: 500px;"></div>
					</div>
				</div>
				<div class="carousel-item">
					<img class="w-100" src="resources/img/main1.jpg" alt="Image">
					<div
						class="carousel-caption d-flex flex-column align-items-center justify-content-center">
						<div class="p-3" style="max-width: 500px;"></div>
					</div>
				</div>
				<div class="carousel-item">
					<img class="w-100" src="resources/img/main2.jpg" alt="Image">
					<div
						class="carousel-caption d-flex flex-column align-items-center justify-content-center">
						<div class="p-3" style="max-width: 500px;"></div>
					</div>
				</div>
				<div class="carousel-item">
					<img class="w-100" src="resources/img/main3.jpg" alt="Image">
					<div
						class="carousel-caption d-flex flex-column align-items-center justify-content-center">
						<div class="p-3" style="max-width: 500px;"></div>
					</div>
				</div>
			</div>
			<a class="carousel-control-prev" href="#header-carousel"
				data-slide="prev">
				<div class="btn btn-dark" style="width: 45px; height: 45px;">
					<span class="carousel-control-prev-icon mb-n2"></span>
				</div>
			</a> <a class="carousel-control-next" href="#header-carousel"
				data-slide="next">
				<div class="btn btn-dark" style="width: 45px; height: 45px;">
					<span class="carousel-control-next-icon mb-n2"></span>
				</div>
			</a>
		</div>
	</div>
	<!-- Carousel End -->

	<div class="container" style="text-align: center; padding: 300px">
		<h2>어디로 떠날 예정이신가요?</h2>
		<form action="/tour/list.do?&searchKey=title">
			<div class="input-group-prepend">
				<input type="hidden" name="searchKey" value="title">
				<input type="text" class="form-control"
					placeholder="여행지 또는 상품을 검색해보세요!" id="word" name="searchWord">
				<div class="input-group-btn">
					<button class="btn btn-default" type="submit">
						<i class="fas fa-search fa-sm"></i>
					</button>
				</div>
			</div>
		</form>
	</div>

	<!-- Packages End -->

	<div
		class="container-fluid bg-dark text-white border-top py-4 px-sm-3 px-md-5"
		style="border-color: rgba(256, 256, 256, .1) !important;">
		<div class="row">
			<div class="col-lg-4 text-center text-md-left mb-3 mb-md-0">
				<h1 class="text-primary halla">
					<span class="halla">EZEN</span>SEOUL<span class="halla">LO</span>
				</h1>
			</div>
			<div class="col-lg-4 text-center  mb-3 mb-md-0">
				<p class="m-0 text-white-50" style="padding-top: 10px">
					Copyright &copy; ezenseoullo. All Rights Reserved.</a>
				</p>
			</div>
			<div class="col-lg-4 text-center text-md-right">
				<p class="m-0 text-white-50" style="padding-top: 10px">Designed
					by EZEN team1</p>
			</div>
		</div>
	</div>
	<!-- Footer End -->


	<!-- Back to Top -->
	<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i
		class="fa fa-angle-double-up"></i></a>


	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
	<script src="/resources/lib/easing/easing.min.js"></script>
	<script src="/resources/lib/owlcarousel/owl.carousel.min.js"></script>
	<script src="/resources/lib/tempusdominus/js/moment.min.js"></script>
	<script src="/resources/lib/tempusdominus/js/moment-timezone.min.js"></script>
	<script
		src="/resources/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

	<!-- Contact Javascript File -->
	<script src="/resources/mail/jqBootstrapValidation.min.js"></script>
	<script src="/resources/mail/contact.js"></script>

	<!-- Template Javascript -->
	<!--     <script src="/resources/js/main.js"></script> -->
	<script src="/resources/js/main2.js"></script>
</body>

</html>