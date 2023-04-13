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

	.top{
		text-align: center;
		background: #ececec;
	}
   
 </style>

<script type="text/javascript">
	$(function () {
		//alert("jQuert 동작중");
		$(".dataRow").click(function() {
			let qnaNo = $(this).find(".qnaNo").text();
// 			alert("클릭한 질문번호 qnaNo = " +qnaNo);
			location = "view.do?qnaNo="+qnaNo+"&inc=1"
			+ "&page=${pageObject.page}"
			+ "&perPageNum=${pageObject.perPageNum}"
			+ "&key=${pageObject.key}"
			+ "&word=${pageObject.word}";
		});
		
		$("#writeBtn").click(function() {
			alert("클릭함");
			if(${login ==null}){
				 	alert("로그인 후 이용 가능합니다.");
			return false;
			};
		});
		
		// 		$("#submitBtn").click(function(){
// 			alert("검색조회클릭");
// 			});
		
		//검색 데이터 유지
	<c:if test="${!empty pageObject.word}">
		$("#key").val("${(!empty pageObject.key)?pageObject.key:'t'}");
		$("#word").val("${pageObject.word}");
	</c:if>
	
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
		<div class="row">
			<div class="col-md-9">
				<form action="list.do" method="post" class="form-inline">
					<input type="hidden" name="perPageNum" value="${pageObject.perPageNum }">
					<div>
					  <div class="form-group">
						  <select class="form-control" id="key" name="key">
<!-- 						    <option value="tcr" selected="selected">전체</option> -->
						    <option value="t">제목</option>
						    <option value="c">내용</option>
						    <option value="r">장소</option>
						    <option value="s">응답상태</option>
						    <option value="i">작성자</option>
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
			<div class="form-group" id="search" >
				<button type="submit" value="응답" name="word" class="btn btn-info" >응답</button>
				<button type="submit" value="미응답" name="word" class="btn btn-danger" >미응답</button>
			</div>
	</form>
	<form class="form-inline">
		<input value="${param.perPageNum }" type="hidden">
			<div class="form-group" id="div-head" style="float: right;" >
						<select class="form-control" id="key" name="key" >
							<option value="id" selected="selected" >작성자</option>
						</select>
			</div>
			<div class="form-group" id="search" style="float: right;">
			<c:if test="${login.id !=null }">
				<button type="submit" value="${login.id }" name="word" class="btn btn-default" style="float: right;">내 문의 글 보기</button>
			</c:if>
			</div>
	</form>
	

	</div>
		 
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
	<strong>*투어 문의는 해당 투어 상세보기에서 문의 할 수 있습니다.</strong>

	
		<a href="/tour/list.do"><button type="button" class="btn btn-default" style="float: right;">투어리스트</button></a>
	<div><pageNav:pageNav listURI="list.do" pageObject="${pageObject }" /></div>
		
</div>
	
</body>
</html>