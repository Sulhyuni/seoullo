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

		// 검색 데이터 유지
		<c:if test="${!empty pageObject.word}">
			$("#key").val("${(!empty pageObject.key)?pageObject.key:'t'}");
			$("#word").val("${pageObject.word}");
		</c:if>
		
		$(".dataRow")
				.click(
						function() {
							var revNo = $(this).find(".revNo").text();
							location = "viewTab.sub?revNo="
									+ revNo
									+ "&inc=1"
									+ "&page=${pageObject.page}&perPageNum=${pageObject.perPageNum}"
									+ "&key=${pageObject.key}&word=${pageObject.word}";
						});
	});
</script>

<style type="text/css">
.dataRow:hover {
	background: #eee;
	cursor: pointer;
}

th, td {
	text-align: center;
}

.tourThumbnail {
	width: 70px;
	height: 70px;
	border-radius: 10%;
	overflow: hidden;
	margin-bottom: 5px;
}

td.rating i {
	font-size: 16px;
	color: #fad103;
}
</style>
</head>

<body>
	<table class="table">
		<thead>
			<tr>
				<th>번호</th>
				<th>평점</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>추천</th>
				<th>조회</th>
			</tr>
		</thead>
		<!-- td 세로축 중앙 정렬이 안 먹힘... -->
		<tbody>
			<c:forEach items="${list }" var="vo">
				<tr class="dataRow">
					<td class="revNo">${vo.revNo }</td>
					<c:choose>
						<c:when test="${vo.ordNo >= 2 }">
							<td></td>
							<td style="text-align: left;">&nbsp;&nbsp;&nbsp;&nbsp; <i
								class="material-icons md"
								style="font-size: 15px; color: #4b8a08;">subdirectory_arrow_right</i>
								${vo.title }
							</td>
							<td>${vo.nickname }(${vo.gradeName})</td>
							<td><fmt:formatDate value="${vo.writeDate }"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>
							<td></td>
						</c:when>
						<c:otherwise>
							<td class="rating"><c:forEach begin="1" end="${vo.rating}">
									<i class="material-icons">star</i>
								</c:forEach> <c:forEach begin="${vo.rating + 1}" end="5">
									<i class="material-icons" style="color: #a9a9a9">star</i>
								</c:forEach></td>
							<td style="text-align: left;">${vo.title }<c:if
									test="${vo.replyCnt > 0}"> [${vo.replyCnt }]</c:if></td>
							<td>${vo.nickname }(${vo.gradeName})</td>
							<td><fmt:formatDate value="${vo.writeDate }"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>
							<td><i class="material-icons md" style="font-size: 14px">thumb_up&nbsp;</i>
								<fmt:formatNumber value="${vo.likeCnt }" pattern="#,###" /></td>
						</c:otherwise>
					</c:choose>
					<td><fmt:formatNumber value="${vo.hit }" pattern="#,###" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div style="display: flex; justify-content: center;">
		<pageNav:pageNav listURI="list.do" pageObject="${pageObject }" />
	</div>
</body>
</html>