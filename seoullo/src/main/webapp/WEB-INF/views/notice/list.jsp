<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 리스트</title>

<script type="text/javascript">
$(function(){
    <c:if test="${m != null}">
        alert("${m}");
    </c:if>

    //검색 데이터 유지 
    <c:if test="${!empty pageObject.word}">
    $("#key").val("${(!empty pageObject.key)?pageObject.key:'t'}");
    $("#word").val("${pageObject.word}");
    </c:if>
});
</script>
<script type="text/javascript">
$(function(){
	
	$(".dataRow").click(function(){
		let no =$(this).find(".no").text();
		alert("글번호:"+no)
		location="view.do?no="+no+"&inc=1&page=${pageObject.page}&perPageNum=${pageObject.perPageNum}"
		+"&key=${pageObject.key}&word=${pageObject.word}";
		
		
	});
});
</script>
</head>
<body>
<div class="container">
	<div class="col-md-6">
		<a href="list.do?page=${pageObject.page }&perPageNum=${pageObject.perPageNum }&key=${pageObject.key }&word=${pageObject.word }&period=pre" class='btn btn-${(pageObject.period == "pre")?"success":"default" }'>현재공지</a>
		<c:if test="${login!=null&&login.gradeNo==9 }">
		<a href="list.do?page=${pageObject.page }&perPageNum=${pageObject.perPageNum }&key=${pageObject.key }&word=${pageObject.word }&period=old" class='btn btn-${(pageObject.period == "old")?"success":"default" }'>지난공지</a>
		<a href="list.do?page=${pageObject.page }&perPageNum=${pageObject.perPageNum }&key=${pageObject.key }&word=${pageObject.word }&period=res" class='btn btn-${(pageObject.period == "res")?"success":"default" }'>예약공지</a>
		<a href="list.do?page=${pageObject.page }&perPageNum=${pageObject.perPageNum }&key=${pageObject.key }&word=${pageObject.word }&period=all" class='btn btn-${(pageObject.period == "all")?"success":"default" }'>모든공지</a>
	    </c:if>
	</div>
  <!-- 검색 -->
  	<div class="col-md-6">
		<form class="form-inline">
		<input name="perPageNum" value="${pageObject.perPageNum }" type="hidden">
		    <div class="form-group" >
		    	<select class="form-control" id="key" name="key">
				    <option value="t">제목</option>
				    <option value="c">내용</option>
		 		 </select>
		    </div>
		    <div class="form-group">
		    <input type="text" class="form-control" placeholder="Search" id="word" name="word">
		    </div>
		      <button class="btn btn-default" type="submit">
		        <i class="glyphicon glyphicon-search"></i>
		      </button>
	</form>
	</div>

<!-- 공지사항 테이블 -->
	<table class="table">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>공지기간</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list }" var="vo">
					<tr class="dataRow">
						<td class="no">${vo.no }</td>
						<td>${vo.title }</td>
						<td><fmt:formatDate value="${vo.startDate}" pattern="yyyy/MM/dd"/>~
						<fmt:formatDate value="${vo.endDate}" pattern="yyyy/MM/dd"/></td>
						<td><fmt:formatDate value="${vo.writeDate}" pattern="yyyy/MM/dd"/></td>
						<td><fmt:formatNumber value="${vo.hit}" pattern="#,###"/></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<!-- 관리자만 보이는 버튼 -->
		<c:if test="${login!=null&&login.gradeNo==9 }"><a href="write.do?perPageNum=${pageObject.perPageNum }" class="btn btn-default">공지사항등록</a></c:if>
			
	<div><pageNav:pageNav listURI="list.do" pageObject="${pageObject }"></pageNav:pageNav></div>

	</div>
</body>
</html>