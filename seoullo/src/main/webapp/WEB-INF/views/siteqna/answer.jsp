<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Site QNA</title>

<style type="text/css">
hr{
  	  border: 0;
   	  height: 2px;
   	  background: #ccc;
  	}
  	
 .contentDiv{
 	text-align: center;
 	height: 7em;
 }
 </style>
 
</head>
<body>
<div class="container">
	 <div class="col-md-12">
		<h1>Site QnA ANSWER</h1>
	</div>
	<div class="col-md-12">
		<hr>
	</div>
	
	<table class="table">
		<thead>
			<tr>
				<th>|	질문번호 : ${vo.siteNo}</th>
				<th>|	제목 : ${vo.title} </th>
				<th>|	작성자 : ${vo.id}</th>
				<th class="danger">|	응답상태  :		${vo.status }</th>
				<th>|	작성일 : <fmt:formatDate value="${vo.writeDate}"  pattern="yyyy-MM-dd"/></th>
				<th>|	조회수 : ${vo.hit}</th>
			</tr>
		</thead>
	</table>
		<div class = "col-md-12">
			<div class="contentDiv" style="white-space:pre;" >${vo.content }</div>
		</div>
		<div class="col-md-12">
			<hr class= "hr">
		</div>
	
	<div class="card-body">
		<form action="answer.do" method="post" id="answer">
			<input type="hidden" name="siteNo" value="${vo.siteNo }">
			<input type="hidden" name="id" value="${vo.id }">
			<input type="hidden" name="refNo" value="${vo.refNo }">
			<input type="hidden" name="ordNo" value="${vo.ordNo }">
			<input type="hidden" name="title" value="${vo.title}">
			<input type="hidden" name="status" value="${vo.status}">
			 <input type="hidden" name="status" value="응답">
			
				<div  class="form-group">
					<label>내용</label>
					<textarea rows="7" name="content" class="form-control" id="content" required="required" style="white-space:pre;"></textarea>
				</div>
				
				<button class="btn btn-default">등록</button>
				<button class="btn btn-default" type="reset">새로작성</button>
				<button class="btn btn-default" type="button"  onclick="history.back()">취소</button>
		</form>
	</div>
</div>

</body>
</html>