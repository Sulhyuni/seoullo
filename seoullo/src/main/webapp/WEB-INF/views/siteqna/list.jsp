<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Site QNA</title>

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
  	
  	  	#div-head{
	display: none;
}
 </style>
 
 
<script type="text/javascript">
	$(function () {
		//alert("jQuert 동작중");
		$(".dataRow").click(function() {
			let siteNo = $(this).find(".siteNo").text();
//             alert("클릭한 질문번호 siteNo = " +siteNo);
			location = "view.do?siteNo="+siteNo+"&inc=1"
			+ "&page=${pageObject.page}"
			+ "&perPageNum=${pageObject.perPageNum}"
			+ "&key=${pageObject.key}"
			+ "&word=${pageObject.word}";
		});
		
		

		//검색 데이터 유지
		<c:if test="${!empty pageObject.word}">
			$("#key").val("${(!empty pageObject.key)?pageObject.key:'t'}");
			$("#word").val("${pageObject.word}");
		</c:if>
		
		
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
		<h1>Site QnA LIST</h1>
	</div>
	<div class="col-md-12">
		<hr>
	</div>
		<div class="row">
			<div class="col-md-9">
				<form action="list.do" method="post" class="form-inline">
					<input type="hidden" name="perPageNum" value="${pageObject.perPageNum }">
					<div>
						  <div class="form-group">
							  <select class="form-control" id="key" name="key">
							    <option value="t">제목</option>
							    <option value="c">내용</option>
							     <option value="s">응답상태</option>
							  </select>
						  </div>
						  <div class = "form-group">
						  <input type="text" class="form-control" placeholder="Search" id="word" name="word">
						  </div>
						    <button id="submitBtn" class="btn btn-success" type="submit"><i class="fas fa-search fa-sm"></i></button>
					</div>
				</form>
			</div>
	<form class="form-inline">
		<input value="${param.perPageNum }" type="hidden">
			<div class="form-group" id="div-head" >
						<select class="form-control" id="key" name="key" >
							<option value="status" selected="selected" >응답상태</option>
						</select>
			</div>
			<div class="form-group" id="search"  >
				<button type="submit" value="응답" name="word" class="btn btn-info" >응답</button>
				<button type="submit" value="미응답" name="word" class="btn btn-danger" >미응답</button>
			</div>
	</form>
	
		</div>
	<table class="table">
		<thead>
			<tr>
				<th>질문번호</th>
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
					<td class="siteNo">${vo.siteNo}</td>
					<c:choose>
						<c:when test="${vo.levNo >=1 }">
							<td><i class="material-icons" >subdirectory_arrow_right</i>
								[관리자] ${vo.title }</td>
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
<%-- 	${vo.tourNo } // ?tourNo=2&region=종로구--%>
		<a href="write.do"><button type="button" class="btn btn-default" id="writeBtn">글쓰기</button></a>
		<a href="/"><button type="button" class="btn btn-default">홈으로</button></a>
	<div><pageNav:pageNav listURI="list.do" pageObject="${pageObject }" /></div>
	
</div>
	




</body>
</html>