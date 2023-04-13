<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/js/tourlist.js"></script>
<script type="text/javascript">
	$(function() {
		//조회수순 정렬
		$("#arrayByHit").click(function() {
			tourlistService.arrayByHit("${list}", function(data) {
				showList(data);
			});
		});

		//등록일순 정렬
		$("#arrayByRegdate").click(function() {
			tourlistService.arrayByRegdate("${list}", function(data) {
				showList(data);
			});
		});

		//리스트를 다시 불러오는 쿼리~~~~~~~~~~
		function showList(list) {
			let listDiv = $("#listDiv");
			let str = "";

			if (list == null || list.length == 0) {
				listDiv.html("<h2>등록한 투어가 없습니다.</h2>");
				return;
			}
			let tagList;
			for (let i = 0; i < list.length; i++) {
				tagList = list[i].tagList;
				str += "<div class='eachTour col-lg-3' data-no='"+list[i].no+"'>";
				str += "<img class='thumbnailImg' src='" + list[i].thumbnail + "' width='247.5px' height='200px' data-no='"+list[i].no+"'>";
				str += "<div class='underImg' data-no='"+list[i].no+"'>";
				str += "<div class='tourType'><span style='color: #DC143C; font-weight:bold;'>[" + list[i].status + "]  </span>"
						+ list[i].type + "</div>";
				str += "<div class='tourTitle'>" + list[i].title + "</div>";
				str += "<div class='tourDescription'>" + list[i].description
						+ "</div></div>";
				str += "<div class='tags'>";
				for (let j = 0; j < tagList.length; j++) {
					str += "<span class='eachTag' data-tag='" + tagList[j] + "'> #"
							+ tagList[j] + " </span>";
				}
				str += "</div><div id='eachBtns' style='padding-left: 42px;'><a href='/book/list.do?tourNo=" + list[i].no;
				str += "' class='btn btn-xs btn-default'>예약현황</a> <a href='update.do?no=" + list[i].no + "' class='btn btn-xs btn-default'>수정</a> ";
				str += " <button data-no='" + list[i].no + "' class='closeBtn btn btn-xs btn-default'>모집종료</button>	</div></div>";
			}
			listDiv.html(str);

			$(".thumbnailImg").on("click", function() {
				let no = $(this).data("no");
				location = "view.do?no=" + no;
			});

			$(".underImg").on("click", function() {
				let no = $(this).data("no");
				location = "view.do?no=" + no;
			});

		}

		$(".thumbnailImg").on("click", function() {
			let no = $(this).data("no");
			location = "view.do?no=" + no;
		});

		$(".underImg").on("click", function() {
			let no = $(this).data("no");
			location = "view.do?no=" + no;
		});

		$(".closeBtn").click(function() {
			if (confirm("모집종료 처리 시 비회원 및 일반회원에게 투어가 조회되지 않습니다. 정말 종료하시겠습니까?")){
				location = "close.do?no="+$(this).data("no");
			}
			return false;
		});
	});

</script>
<style type="text/css">
#writeBtnDiv {
	float: left;
	margin: 15px 0px;
}

#listDiv {
	clear: both;
	margin-top: 100px;
}

.eachTour {
	padding: 0px 15px;
	margin-bottom: 10px;
	height: 450px;
}

.thumbnailImg, .underImg {
	border: solid 1px #eee;
	border-collapse: collapse;
}

.thumbnailImg:hover, .underImg:hover, #arrayByHit:hover, #arrayByRegdate:hover {
	cursor: pointer;
}

.underImg {
	padding: 5px;
	height: 150px;
}

.tourType, .tourTitle, .tourDescription {
	text-align: center;
}

.tourTitle {
	font-size: large;
	font-weight: bold;
}

.tourDescription {
	margin: 5px;
	padding-top: 15px;
	border-top: dotted 1px #ddd;
	font-size: small;
}

.tags {
	margin-top: 5px;
	color: #4B8A08;
	font-weight: 600;
}
</style>
</head>
<body>
	<div class="container">

		<h1>${login.nickName }님이 등록한 투어</h1>
		<div id="writeBtnDiv">
			<a href="write.do" class="btn btn-primary">신규 투어 등록하기</a>
		</div>
		<div id="searchArray">
			<span class="pull-right"> <span id="arrayByHit">조회수순</span> |
				<span id="arrayByRegdate">등록일순</span></span>
		</div>

		<div id="listDiv">
			<c:if test="${list == null || list.size() == 0}">
				<h2>등록한 투어가 없습니다.</h2>
			</c:if>
			<c:forEach items="${list }" var="vo">
				<div class="eachTour col-lg-3">
					<img class="thumbnailImg" src="${vo.thumbnail }" width="247.5px"
						height="200px" data-no="${vo.no }">
					<div class="underImg" data-no="${vo.no }">
						<div class="tourType"><span style="color: #DC143C; font-weight:bold;">[${vo.status }] </span>${vo.type }</div>
						<div class="tourTitle">${vo.title }</div>
						<div class="tourDescription">${vo.description }</div>
					</div>
					<div class="tags">
						<c:forEach items="${vo.tagList }" var="tag">
							<span class="eachTag" data-tag="${tag }">#${tag }</span>
						</c:forEach>
					</div>
					<div id="eachBtns" style="padding-left: 42px;">
						<a href="/book/list.do?tourNo=${vo.no }" class="btn btn-xs btn-default">예약현황</a> <a
							href="update.do?no=${vo.no }" class="btn btn-xs btn-default">수정</a>
						<button data-no="${vo.no }"
							class="closeBtn btn btn-xs btn-default">모집종료</button>
					</div>
				</div>
			</c:forEach>
		</div>

	</div>

</body>
</html>