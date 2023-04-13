<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>익명게시판</title>
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

 
 </style>

<script type="text/javascript">
	$(function () {
// 		alert("jQuert 동작중");
		$(".dataRow").click(function() {
			let anonyNo = $(this).find(".anonyNo").text();
// 			alert("클릭한  번호 anonyNo = " +anonyNo);
			if(${login.id == null}){
					alert("로그인 후 이용 가능합니다.");
				return false;
			}else{
			location = "view.do?anonyNo="+anonyNo+"&inc=1"
			+ "&page=${pageObject.page}"
			+ "&perPageNum=${pageObject.perPageNum}"
			+ "&key=${pageObject.key}"
			+ "&word=${pageObject.word}";
			}
		});
		
// // 		$("#submitBtn").click(function(){
// // 			alert("검색조회클릭");
// // 			});
		
// 		//검색 데이터 유지
// 	<c:if test="${!empty pageObject.word}">
// 		$("#key").val("${(!empty pageObject.key)?pageObject.key:'t'}");
// 		$("#word").val("${pageObject.word}");
// 	</c:if>
		$("#writeBtn").click(function() {
			//alert("클릭함");
			if(${login ==null}){
				 	alert("로그인 후 이용 가능합니다.");
			return false;
			};
		});
		
	});
</script>
 
</head>
<body>
<div class="container">
	<div class="col-md-12">
		<h1>익명 게시판</h1>
	</div>
	<div class="col-md-12">
		<hr>
	</div>
		<table class="table">
		<thead>
			<tr>
				<th>|글번호</th>
				<th>|제목</th>
				<th></th>
				<th>|작성자</th>
				<th>|작성일</th>
				<th>|조회수</th>
				<th>|좋아요</th>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach items="${list }" var="vo">
				<tr class="dataRow">
					<td class="anonyNo">${vo.anonyNo}</td>
					<td class="title">${vo.title }</td>
					<td><span class="badge badge-pill badge-secondary" style="background:#4B8A08;">${vo.replyCnt }</span></td>
					<td>익명</td>
					<td><fmt:formatDate value="${vo.writeDate }" pattern="yyyy-MM-dd"/></td>
					<td>${vo.hit }</td>
					<td>${vo.likeCnt }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
		<a href="write.do"><button type="button" class="btn btn-default" id="writeBtn">글쓰기</button></a>
		<a href="/"><button type="button" class="btn btn-default">홈으로</button></a>
	<div><pageNav:pageNav listURI="list.do" pageObject="${pageObject }" /></div>
		
</div>
</body>
</html>