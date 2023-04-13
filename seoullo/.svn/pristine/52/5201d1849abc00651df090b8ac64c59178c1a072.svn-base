<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기 게시판</title>

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
<link href="/resources/css/style.css" rel="stylesheet">


<!-- CDN 방식의 Google Icon 라이브러리 등록 -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<!-- 임시 라이브러리  -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript">
	$(function() {
		// 작은 이미지 클릭 시 큰 이미지로 표시
		$(".imgData").click(function() {
			// 변경할 이미지의 imgNo 세팅
			// data는 소문자로,,,
			var imgNo = $(this).data("imgno");
			$("#updateImgNo").val(imgNo);
			var thumbnail = $(this).data("thumbnail");
			var alt = $(this).find("img").attr("alt");
			var src = $(this).find("img").attr("src");
			// 큰 이미지에 alt, src 정보 전달 
			$("#bigImg").attr("alt", alt);
			$("#bigImg").attr("src", src);
			// imgNo 세팅
			$("#bigImg").data("imgno", imgNo);
			// 대표 이미지가 아닌 경우
			if (thumbnail == 1) {
				$("#imgDeleteBtn, #thumbnailBtn").hide();
			} else {
				$("#imgDeleteBtn, #thumbnailBtn").show();
			}
		});

		$("#updateImgBtn").click(function() {
			// 큰 이미지의 data-imgNo 값을 가져와 변경할 imgNo에 세팅
			$("#updateImgNo").val($("#bigImg").data("imgNo"));
			$("#deleteImgName").val($("#bigImg").attr("src"));
			$("#updateImgDiv").show();
		});

		$("#cancelBtn").click(function() {
			$("#updateImgDiv").hide();
		});

		// 대표 이미지로 지정
		$("#thumbnailBtn")
				.click(
						function() {
							var imgNo = $("#bigImg").data("imgno");
							location = "updateImageThm.do?revNo=${vo.revNo}&imgNo="
									+ imgNo
									+ "&page=${param.page}&perPageNum=${param.perPageNum}&key=${param.key}&word=${param.word}";
						});

		// 이미지 1개 삭제하기
		$("#imgDeleteBtn")
				.click(
						function() {
							var imgNo = $("#bigImg").data("imgno");
							location = "deleteImage.do?revNo=${vo.revNo}&imgNo="
									+ imgNo
									+ "&deleteImage="
									+ $("#bigImg").attr("src")
									+ "&page=${param.page}&perPageNum=${param.perPageNum}&key=${param.key}&word=${param.word}";
						});
		$("#deleteBtn").click(function() {
			if (!confirm("정말 삭제하시겠습니까?"))
				return false;
		});

	});
</script>

<style type="text/css">
.well {
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 40px;
}

.tourThumbnail {
	display: block;
	margin: 0 auto;
	max-width: 100%;
	height: auto;
	border-radius: 50%;
	width: 100px;
	height: 100px;
}

.content-box {
	border: 3px solid lightgray;
	border-left: none;
	border-right: none;
	padding: 30px;
	text-align: center;
	font-size: 13px;
}

.custom-well {
	margin-top: 40px;
	background-color: #696969;
}

button {
	display: inline-flex;
	align-items: center;
	justify-content: center;
	width: 120px;
	height: 50px;
	border-radius: 25px;
	border: none;
	color: white;
	font-size: 16px;
	font-weight: bold;
	cursor: pointer;
	background-color: #FF5252;
}

button.gray {
	background-color: #E0E0E0;
}

button i {
	margin-right: 10px;
}

button.like-button.red {
	background-color: #FF5252;
}

button.like-button.red:hover {
	background-color: #FF8A80;
}

button.like-button.grey {
	background-color: #a9a9a9;
	color: #E0E0E0;
}

button.like-button.grey:hover {
	background-color: #BDBDBD;
}

.like-count {
	font-size: 1.2em;
	margin-bottom: 4px;
}

#updateImgDiv {
	display: none;
	text-align: center;
}

.small-btn {
	width: 80px;
	height: 30px;
	font-size: 11px;
}
</style>


</head>

<body>
	<div>
		<p style="float: left; font-size: 13px;">No. ${vo.revNo }</p>
		<p style="float: right; font-size: 13px;">
			<fmt:formatNumber value="${vo.hit }" pattern="#,###" />
			Views
		</p>
	</div>
	<br>
	<p style="margin-top: 35px; font-size: 35px;">${vo.title }</p>
	<div style="float: left">
		<p style="margin-top: 27px; font-size: 13px;">${vo.nickname }
			(${vo.gradeName })</p>
		<p style="font-size: 13px">
			<fmt:formatDate value="${vo.writeDate }"
				pattern="yyyy-MM-dd HH:mm:ss" />
		</p>
	</div>
	<div style="margin-top: 38px; float: right;">
		<a
			href="view.do?revNo=${vo.revNo }&inc=0&page=${pageObject.page}&perPageNum=${pageObject.perPageNum}&key=${pageObject.key}&word=${pageObject.word}"
			target="_blank" class="btn btn-default">자세히 보기</a>
		<button class="btn btn-default" onclick="history.back();"
			style="height: 35px; width: 60px;">목록</button>
	</div>
	<div style="margin-top: 110px;">
		<hr>
	</div>
	<div class="well">
		<div>
			<img class="tourThumbnail" src=${vo.tourThumbnail }>
			<div style="margin-top: 50px; font-size: 20px; text-align: center;">${vo.guideId } 가이드의 ${vo.tourTitle }</div>
			<p style="text-align: center; margin-top: 40px; margin-bottom: 40px;">
				<c:if test="${vo.ordNo < 2}">
					<c:forEach begin="1" end="${vo.rating }">
						<i class="material-icons" style="color: #fad103; font-size: 30px;">star</i>
					</c:forEach>
					<c:forEach begin="${vo.rating + 1}" end="5">
						<i class="material-icons" style="color: #a9a9a9; font-size: 30px;">star</i>
					</c:forEach>
				</c:if>
			</p>
			<p class="content-box">${vo.content }</p>
		</div>
	</div>
</body>
</html>