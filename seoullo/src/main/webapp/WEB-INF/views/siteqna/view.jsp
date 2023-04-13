<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Site QnA</title>

<style type="text/css">

 .hr {
    border: 0;
    height: 2px;
    background: #ccc;
  }
  
.contentDiv{
	text-align: center;
	height: 10em;
	padding-top: 15px;
}

</style>

<script type="text/javascript">
$(function() {
	
// 	게시글 삭제
	$("#deleteBtn").click(function () {
		//alert("삭제버튼 클릭");
		if(!confirm("질문을 삭제하면 답변도 삭제됩니다. 정말 삭제 하시겠습니까?"))
			return false;
	});		
	
	


	
});
</script>

</head>
<body>
<div class="container">
<div class="col-md-12">
		<h1>Site QnA VIEW</h1>
	</div>
	<div class="col-md-12">
		<hr class= "hr">
	</div>
	<table class="table">
		<thead>
			<tr class="active">
				<th>|	문의번호 :	 ${vo.siteNo}</th>
				<th>|	문의제목 :	 ${vo.title}</th>
				<th>|	작성자 : 	${vo.id}</th>
				<th class="danger">|	응답상태  :		${vo.status }</th>
				<th>|	작성일 :	<fmt:formatDate value="${vo.writeDate}" pattern="yyyy-MM-dd"/></th>
				<th>|	조회수 : 	${vo.hit}</th>
			</tr>
		</thead>
	</table>
			<div class="col-md-12">
				<div class="contentDiv" style="white-space:pre;">${vo.content }</div>
			</div>
			<div class="col-md-12">
				<hr class= "hr">
			</div>
			
<!-- 	관리자 답글 div		-->
<!-- 		status 가  '미응답' 이면 안보이기 -->
<%-- 		<c:if test="${vo.status =='응답'}"> --%>
<!-- 			<div class="answerDiv"> -->
<!-- 				<table class="table"> -->
<!-- 				<thead> -->
<!-- 					<tr class="info"> -->
<%-- 						<th>|	문의번호 :	 ${vo.siteNo}</th> --%>
<%-- 						<th>|	문의제목 :	 ${vo.title}</th> --%>
<!-- 						<th>|	작성자 : 	관리자</th> -->
<%-- 						<th>|	작성일 :	<fmt:formatDate value="${vo.writeDate}" pattern="yyyy-MM-dd"/></th> --%>
<!-- 					</tr> -->
<!-- 				</thead> -->
<!-- 				</table> -->
<!-- 						<div class="col-md-12" > -->
<%-- 						<input type="hidden" name="aNo" value="${vo.aNo}"> --%>
<%-- 		 					<div rows = "5em" class="contentDiv" style="white-space:pre;">${vo.reply }</div> --%>
<!-- 						</div> -->
<!-- 						<div class="col-md-12"> -->
<!-- 							<hr class= "hr"> -->
<!-- 						</div> -->
<!-- 			</div> -->
<%-- 		</c:if> --%>
	<c:if test="${login.id == vo.id }">
		<a href="update.do?siteNo=${vo.siteNo }" class="btn btn-default" id="updateBtn">수정</a>			
		<c:if test="${vo.levNo == 0}">
				<a href="delete.do?refNo=${vo.refNo }" class="btn btn-default" id="deleteBtn">삭제</a>
		</c:if>
		
	</c:if>
	<a href="list.do" class="btn btn-default" style="float: right;">리스트</a>			
	<c:if test="${login !=null && login.gradeNo ==9 }">
		<a href="answer.do?siteNo=${vo.siteNo }&page=${param.page }&perPageNum=${param.perPageNum}" class="btn btn-default" id="answerBtn">답글</a>			
	</c:if>
</div>


</body>
</html>













