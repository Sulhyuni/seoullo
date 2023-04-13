<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%-- <%@taglib prefix="pageNav" tagdir="/WEB-INF/tags"%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>익명게시판</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<!-- 댓글 스크립트-->
<script type="text/javascript" src="/resources/js/reply/reply.js"></script>
<script type="text/javascript">
	 
			$(function() {
				
				$("#deleteBtn").click(function () {
					//alert("삭제버튼 클릭");
					if(!confirm("정말 삭제 하시겠습니까?"))
						return false;
					alert("삭제되었습니다.");
				});		
				
				
	//console.log(replyService);
 	//로딩 확인 함.
 	
	//변수선언
	let anonyNo = ${vo.anonyNo};
	let replyUL = $(".chat");
	let replyPageFooter = $("#replyPageDiv");
	let page =1;
	//댓글 가져와서 출력해주는 함수 호출
	showList(page);// 바로실행
	
	//사용시점. 글보기 들어가면 댓글 리스트가 바로 보여야 함.
	function showList(page){
		//replyService.list 테스트
		replyService.list(
				{page:page,anonyNo:anonyNo},
				//성공했을떄 함수
				function(data){
					let list = data.list;
					let pageObject = data.pageObject;

					//추가해야할 li 태그들
					let str ="";
					//데이터가 없는경우, 길이가 없는경우
					if(list ==null || list.length==0){
						replyUL.html("<li>*첫 댓글의 주인공이 되어보세요*</li>");
						return;
						}
					//댓글 데이터 있는경우
					for(let i=0, len=list.length; i<len; i++){
						str +="<li data-rno='"+list[i].rno+"''>";
						str +="<div>"
						str +="<input type='hidden' name='id' id='id' value='"+list[i].id+"'>"
						str +="<div><i class='fa fa-angle-double-down' style='font-size:25px; float: right;'></i></div>";
						str +="<div class='header'>";
						str +="<strong>"+list[i].replyer+(i+1)+"</strong>"
						let writeDate = new Date(list[i].writeDate);
						str +="<small class='float-right text-muted' style='padding-right:20px;'>"+writeDate.toLocaleString()+"</small>"
						str +="</div>";
						str +="<p style='white-space:pre;'>"+list[i].reply+"</p>";
						str +="</div>";
						str +="</li>";
					}
					replyUL.html(str);

					
					// 페이지네이션 코드 작성하기 - pageObject를 사용해서
					str = "";
					str += "<ul class='pagination'>";
					str += "<li class='page-item ";
					if(pageObject.startPage == 1) str += "disabled";
					str += "'><a class='page-link' href='#'>◀</a></li>";
					for(var i = pageObject.startPage ; i <= pageObject.endPage; i++){
					  str += "<li class='page-item ";
					  if(page == i) str += "active";
					  str += "'><a class='page-link' href='#'>"+i+"</a></li>";
					}
					str += "<li class='page-item ";
					if(pageObject.endPage == pageObject.totalPage) str += "disabled";
					str += "'><a class='page-link' href='#'>▶</a></li>";
					str += "</ul>";
					// 댓글 페이지 네이션 출력
					replyPageFooter.html(str);
			});

		
	};
	

//댓글 등록 처리 버튼
	$("#replyWriteBtn").click(function(){
		//alert("댓글등록 버튼 클릭");
		//댓글 데이터 수집 -> replyService.write()에 보낸다.
		//댓글데이터 수집
		let reply ={anonyNo : anonyNo, reply:$("#reply").val()};
		
		//replyService.write() 으로  보낸다. 
		replyService.write(
			reply,
			function(result){
				//1.사용자에게 메시지 전달.
				if(result) 
					alert(result);
				else 
					alert("댓글이 등록 되었습니다.");
				$("#reply").val("");	
				//2.댓글리스트를 가져와서 표시한다.
				showList(1);
				}
			);//replyService.write(reply) 끝
		}); //$("#replyWriteBtn").click 의 끝

		 
		

//수정 textarea slidedown하기 --rno,reply 정보 가져오기!!!!!
	$("ul.chat").on("click","li",function(){
		let rno=$(this).data("rno");
		let id=$(this).find("#id").val();
		let reply = $(this).find("p").text();	
		//alert("버튼클릭 rno = "+rno+", reply = "+reply+", id = " +id);
		if("${login.id }" == id ){
		$("#tableUpdate").slideDown();
		//수정탭에 데이터세팅
		$("#rno2").val(rno);
	 	$("#reply2").val(reply);
	 	$("#id2").val(id);
		}
			return false;
		});

//댓글 수정 처리 버튼
	$("#replyUpdateSubmitBtn").click(function(){
// 		alert("댓글수정처리 버튼 클릭");
		//댓글 데이터 수집 -> replyService.update()에 보낸다.
		//댓글데이터 수집
		let reply ={rno : $("#rno2").val(), reply:$("#reply2").val()};
		//replyService.update() 으로  보낸다. 
		replyService.update(
				reply,
				function(result){
					showList(page);
					//1.사용자에게 메시지 전달.
					if(result) 
						alert(result);
					else 
						alert("댓글이 수정 되었습니다.");
					$("#tableUpdate").slideUp();
					//2.댓글리스트를 가져와서 표시한다.
					}
				);//replyService.update(reply) 끝
			}); //$("#replyUpdateSubmitBtn").click 의 끝	



			
//댓글 삭제-rno 가져오기!!
$("#replyDeleteBtn").click(function(){
	let rno = $("#rno2").val();
	//필요데이터 수집
// 	alert("삭제버튼클릭 rno = " +rno);
	replyService.delete(
			rno,
			function(result){
			page = 1;
			showList(page);
			if(result) 
				alert(result);
			else 
				alert("댓글이 삭제 되었습니다.");
			$("#tableUpdate").slideUp();
			})
	});

	$("#replyCancelBtn").click(function(){
		$("#tableUpdate").slideUp();
		});
 	
	
// 댓글 페이지네이션 이벤트
	$("#replyPageDiv").on("click", "ul>li", function(){
		// alert("댓글 페이지 클릭");
		page = $(this).text();
		// alert(page);
		if(!$(this).hasClass("active"))
			showList(page);
		return false; // 페이지 이동 취소
	});		 

	
});

</script>

			
			

 
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
	.likeBtn{
		border: none;
		background: none;
	}
	#reply{
	border: none;
	background: #ececec;
	}
	
	.table{
	margin-bottom: 0px;
	}

/* 	수정버튼 누르면 슬라이드 쇼  하기*/
 	.tableUpdate{ 
 	display: none;    
 	border: none; 
 	background: #ececec; 
	}
	
	ul.chat >li :hover{
		cursor: pointer;
		background: #ececec;
	}

</style>

</head>
<body>
<div  class="container">
	<div class="col-md-12">
		<h1>커뮤니티</h1>
	</div>
	<div class="col-md-12">
		<hr class= "hr">
	</div>
	<table class="table">
		<thead>
			<tr>
				<th>|	글번호 : ${vo.anonyNo}</th>
				<th>|	제목 : ${vo.title} </th>
				<th>|	작성자 :${vo.writer }</th>
				<th>|	작성일 : <fmt:formatDate value="${vo.writeDate}"  pattern="yyyy-MM-dd"/></th>
				<th>|	조회수 : ${vo.hit}</th>
			</tr>
		</thead>
	</table>
		<div class = "col-md-12">
			<div class="contentDiv" style="white-space:pre;">${vo.content }</div>
		</div>
		
		
		
<!-- ======================================================  -->
<!-- 좋아요 -->
<!-- 로그인을 하지 않은 경우 - 글 볼 수 없음-->
	<div class="likeCon" style = "float: right;" >
<%-- 			<c:if test ="${login.id == vo.id || login.id != vo.id }"> --%>
<!-- 로그인 한 아이디가  좋아요를 누른 경우 ( 꽉찬 하트 )  -> 좋아요 취소 -->
					<c:if test="${check ne null && check eq true}">
						<form action="unlike.do" method="post">
							<input type="hidden" name="id" value="${login.id }">
							<input type="hidden" name="anonyNo" value="${vo.anonyNo }">
							<button class="likeBtn"><i class='fa fa-heart' style='font-size:20px;color:red'></i>${vo.likeCnt}</button>명이 좋아합니다.
						</form>
					</c:if>
					
<!-- 좋아요를 누르지 않은경우  ( 빈하트 ) -> 좋아요하기  -->
					<c:if test="${check eq null || check eq false}">
						<form action="like.do" method="post">
							<input type="hidden" name="id" value="${login.id }">
							<input type="hidden" name="anonyNo" value="${vo.anonyNo }">
							<button class="likeBtn"><i class='far fa-heart' style='font-size:20px;color:red'></i>${vo.likeCnt}</button>명이 좋아합니다.
						</form>
					</c:if>
<%-- 			</c:if> --%>
	</div>
		<div class="col-md-12">
			<hr class= "hr">
		</div>
		
		  
		
<!-- ======================================================  -->
<!-- 댓글 -->
<div class = "row">
	<div class="col-lg-12">
		<div class="card">
<!-- 댓글 작성 헤더 -->
<!-- 등록 - 댓글내용 / 수정 - 댓글 번호,댓글내용 -->
<!-- form 태그는 url이 바뀜. ajax사용시엔  사용하지 않는다. -->
<!-- 데이터 수집용 - input,textarea,select 등을 사용한다. -->
			<div class="card-header">
				<input type="hidden" name="rno" id="rno">
				<input type="hidden" name="id" id="id">
				<i class="fa fa-comments fa-fw"></i><strong>Comments</strong><span class="badge badge-pill badge-secondary" style="background:#4B8A08;">${vo.replyCnt }</span>
			</div>
			<table class="table">
				<tr>
					<td>
						<textarea rows="4" cols="30" id="reply" name="reply" style="width: 100%; white-space:pre;"
						 placeholder="댓글을 입력하세요." ></textarea>
					</td>
				</tr>
			</table>
			<div>
				 <button  id="replyWriteBtn" class="btn btn-success btn-sm"  style="float: right;">등록</button> 
			</div>
			<hr>
			

			
<!-- 댓글리스트 -->
<!-- 댓리스트 테스트용 하드코딩 -->
<!-- 	댓글 출력하는 UL - 데이터 한개당 li 태그 한개  -->
			<div class="card-body">
				<ul class="chat">
					<li data-rno="5">
						<div>
							<div class="header">
								<strong>작성자</strong>
								<small class="float-right text-muted">2023-03-24 10:35</small>
							</div>
							<p>Grwwwwwwwwwwwwwwww</p>
						</div>
					</li>
<!-- Reply LI 태그 끝--> 
				</ul>
<!-- ------------------------댓글수정------------------------- -->
	<div class="tableUpdate" id="tableUpdate">
		<table class="table">
			<tr>
				<td >
	     			<input name="rno" id="rno2" class="form-control" readonly="readonly" type="hidden" >
					<input type="hidden" name="id2" id="id2">
				</td>
			</tr>
			<tr>
				<th>
					<label>댓글 내용</label>
				</th>
			</tr>
			<tr>
				<td>
	    			<textarea rows="5"  name="reply" id="reply2" style="width: 100%; white-space:pre;"></textarea>
				</td>
			</tr>
		</table>
			<button  id="replyUpdateSubmitBtn" class="btn btn-success btn-sm"  style="float: right;">댓글수정 </button>
			<button  id="replyDeleteBtn" class="btn btn-danger btn-sm"  style="float: right;">댓글삭제</button>
			<button  id="replyCancelBtn" class="btn btn-success btn-sm"  style="float: right;">취소</button>
	</div>
		
		
<!-- 		댓글 출력하는 UL 태그 끝-->
			</div>
				<div class="card-footer" id="replyPageDiv"></div>
		</div>
	</div>
</div>

		<div class="col-md-12">
			<hr class= "hr">
		</div>
	<c:if test="${login.id == vo.id }">
		<a href="update.do?anonyNo=${vo.anonyNo }" class="btn btn-default" id="updateBtn">수정</a>
		<a href="delete.do?anonyNo=${vo.anonyNo }" class="btn btn-default" id="deleteBtn">삭제</a>
	</c:if>
	<a href="list.do"  class="btn btn-default" style="float: right;">리스트</a>
	
<div>
	 
</div>	
</div>

</body>
</html>