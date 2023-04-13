<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약리스트</title>
<style type="text/css">
.tourInfoDiv{
	text-align: center;
	border-top: solid 1px #aaa;
	border-bottom: solid 1px #aaa;
	padding : 10px 0;
	margin-bottom: 5px;
}
textarea:focus {
  outline: none;
}
button:focus {
  outline: none;
}
input:focus {
  outline: none;
}
a:focus {
  outline: none;
}
#imgDiv{
	width: 80px;
	height : 80px;
	border-radius: 10%;
	overflow: hidden;
	margin-left: 60px;
}
.img{
	width: 100%;
	height: 100%;
}
.bBtn{
	float: right;
}
</style>
<script type="text/javascript">
$(function(){
	
	// 검색 데이터 유지
// 	<c:if test="${!empty pageObject.word}">
// 		$("#key").val("${(!empty pageObject.key)?pageObject.key:'t'}");
// 		$("#word").val("${pageObject.word}");
// 	</c:if>
	
});
</script>
</head>
<body>
	<div class="container">
	
		<!-- 검색 div 시작-->
		<div style="margin-bottom: 30px;">
			<form action="list.do" method="post">
			<input type="hidden" name="perPageNum" value="${pageObject.perPageNum }">
				<div class="input-group-prepend" style="float: left; width: 15%;">
					<select class="form-control border-radius" id="key" name="key">
						<option value="n">예약번호</option>
						<option value="t">투어명</option>
						<option value="r">투어지역</option>
					</select>
				</div>
				
				<div class="input-group-prepend" style="width: 25%;">
					<input type="text" class="form-control" placeholder="Search" id="word" name="word">
					<div class="input-group-btn">
						<button class="btn btn-default" type="submit">
							<i class="glyphicon glyphicon-search"></i>
						</button>
					</div>
				</div>				
			</form>
			
			<c:if test="${login.gradeNo == 9 }">
				<form action="list.do" method="post">
					<div style="float: right;">
						<input type="hidden" name="perPageNum" value="${pageObject.perPageNum }">
						<input type="hidden" name="key" value="b">
						<button type="submit" value="예약대기" name="word" class="btn btn-default btn-xs bBtn" >예약대기</button>			
						<button type="submit" value="예약완료" name="word" class="btn btn-default btn-xs bBtn" >예약완료</button>			
						<button type="submit" value="예약취소" name="word" class="btn btn-default btn-xs bBtn" >예약취소</button>			
					</div>			
				</form>
			</c:if>
		</div>
		<!-- 검색 div 끝 -->
		
		
		<!-- 내용 div-->
		<div>
			
			<!-- 예약내역 없는 div -->
			<c:if test="${empty list }">
				<div align="center" style="margin: 100px 0;">
					<h1 style="color: #4B8A08">예약 내역이 없습니다.</h1>
					<span style="color: #gray; font-size:15px;">예약을 원하시면 아래 <span style="font-size:15px; font-weight: bold;">투어예약하기</span> 버튼을 눌러주세요.</span>
					<br/><br/><br/>
					<a href="/tour/list.do"><button class="btn btn-default btn-lg">투어 예약하기</button></a>
				</div>
			</c:if>
			<!-- 예약내역 없는 div 끝 -->
			
			
			<c:forEach items="${list }" var="vo">
				<div style="margin: 10px 0">
					<span style="font-size: 15px; font-weight: bold; color: black">예약번호 : </span>
					<span style="font-size: 15px; font-weight: bold; color: #d8421c">${vo.no } </span>
					<a href="/book/view.do?no=${vo.no }">
						<button class="btn-default btn-xs" style="float: right;">상세보기</button>
					</a>
				</div>			
				<div class="tourInfoDiv">투어상품정보</div>
					<c:forEach items="${vo.bookDetailList }" var="view">
						<div class="row" style="padding:10px 0;">
							<div class="col-md-4">
								<div id="imgDiv">								
									<img src="${view.thumbnail }" class="img" alt="${view.thumbnail }">
								</div>
							</div>
							<div class="col-md-5">
								<span>[ ${view.type } ] </span> <br/>
								<span>[ ${view.title } ]</span> <br/>
								<span>[ ${view.region } ]</span> <br/>
								<span>[ 대인  ${view.peopleA } | 소인  ${view.peopleB } ]</span>
							</div>
							<div class="col-md-3" align="right">
								<br/>
								<span style="color:#d8421c; font-weight: bold; margin-right: 40px"><fmt:formatDate pattern="yyyy-MM-dd" value="${view.day }"/></span><br>
								<span style="margin-right: 40px">[ ${view.bookStatus } ]</span><br/>
								<c:if test="${view.review eq '작성가능' && login.gradeNo == 1}">
									<a href="/review/writeReview.do?tourNo=${view.tourNo }&bookNo=${view.no }">
										<button id="reviewWriteBtn" class="btn-default btn-xs" style="margin-right: 40px">후기남기기</button>
									</a>
								</c:if>
								<c:if test="${view.review eq '작성완료' }">
									<a href="/review/myList.do">
										<button id="reviewWriteBtn" class="btn-default btn-xs" style="margin-right: 40px">후기보러가기</button>
									</a>
								</c:if>
							</div>
						</div>
						<hr style="margin: 5px 0">
					</c:forEach>
					<div style="border-bottom: solid 1px #aaa; padding : 10px 0; margin-bottom: 20px;" align="center" >
						<span><fmt:formatNumber pattern="#,###" value="${vo.payPrice }"/>원</span> - 
						<span>[ ${vo.payMethod } / ${vo.payStatus } ]</span>
					</div>
			</c:forEach>
		</div>
	
		<!-- 페이징처리 -->
		<c:if test="${!empty list }">
			<div style="display: flex; justify-content: center;">
				<pageNav:pageNav listURI="list.do" pageObject="${pageObject }"></pageNav:pageNav>
			</div>
		</c:if>
		
	</div>
</body>
</html>