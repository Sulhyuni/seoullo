<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>QnA</title>
   <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">

    <!-- Favicon -->
    <link href="/resources/img/favicon.png" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet"> 

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="/resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
	<link href="/resources/css/style.css" rel="stylesheet">
   

	<!-- CDN 방식의 Google Icon 라이브러리 등록 -->
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

	<!-- 임시 라이브러리  -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>	
<style type="text/css">
  	.dataRow:hover{
  		background: #eee;
  		cursor: pointer;
  	}
  	
  	hr{
  	  border: 0;
   	  height: 2px;
   	  background: #ccc;
  	}
  	.container{
  		margin-left: 0px;
		margin-right: 0px;
		padding-right: 0px;
  	}
 </style>

<script type="text/javascript">
	$(function () {
		//alert("jQuert 동작중");
		$(".dataRow").click(function() {
			let qnaNo = $(this).find(".qnaNo").text();
// 			alert("클릭한 질문번호 qnaNo = " +qnaNo);
			location = "/qna/viewTab.sub?qnaNo="+qnaNo+"&inc=1"
			+ "&page=${pageObject.page}"
			+ "&perPageNum=${pageObject.perPageNum}"
			+ "&key=${pageObject.key}"
			+ "&word=${pageObject.word}";
		});
	
	});
</script>
 
</head>
<body>
<div class="container">
	<div class="col-md-12">
		<h1>QnA LIST</h1>
	</div>
	<div class="col-md-12">
		
		<hr>
	</div>
<!-- 	<div> -->
<%-- 		<input type="hidden" value="${vo.tourNo }"> --%>
<!-- 	</div> -->
	<table class="table">
		<thead>
			<tr>
				<th>질문번호</th>
				<th>투어장소</th>
				<th>제목</th>
				<th>작성자</th>
				<th>응답상태</th>
				<th>조회수</th>
				<th>작성일</th>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach items="${list }" var="vo">
				<tr class="dataRow">
					<td class="qnaNo">${vo.qnaNo}</td>
					<td>${vo.region }</td>
					<c:choose>
						<c:when test="${vo.levNo >=1 }">
							<td><i class="material-icons" >subdirectory_arrow_right</i>
								${vo.title }</td>
							<td>${vo.id }</td>
							<td>${vo.status }</td>
						</c:when>
						<c:otherwise> 
							<td>${vo.title }</td>
							<td>${vo.id }</td>
							<td>${vo.status }</td>
						</c:otherwise>
					</c:choose>
					<td>${vo.hit }</td>
					<td><fmt:formatDate value="${vo.writeDate }" pattern="yyyy-MM-dd"/></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
		
</div>
	
</body>
</html>