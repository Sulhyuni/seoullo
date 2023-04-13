<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기 게시판</title>

<script type="text/javascript">
	$(function() {
		// 작은 이미지 클릭 시 큰 이미지로 표시
		$(".imgData").click(function() {
			// 변경할 이미지의 imgNo 세팅
			// data는 소문자로,,,
			var imgNo = $(this).data("imgno");
			$("#updateImgNo").val(imgNo);
			var thumbnail = $(this).data("thumbnail");
			var alt = $(this).find("img").attr("alt");
			var src = $(this).find("img").attr("src");
			// 큰 이미지에 alt, src 정보 전달 
			$("#bigImg").attr("alt", alt);
			$("#bigImg").attr("src", src);
			// imgNo 세팅
			$("#bigImg").data("imgno", imgNo);
			// 대표 이미지가 아닌 경우
			if (thumbnail == 1) {
				$("#imgDeleteBtn, #thumbnailBtn").hide();
			} else {
				$("#imgDeleteBtn, #thumbnailBtn").show();
			}
		});

		$("#updateImgBtn").click(function() {
			// 큰 이미지의 data-imgNo 값을 가져와 변경할 imgNo에 세팅
			$("#updateImgNo").val($("#bigImg").data("imgNo"));
			$("#deleteImgName").val($("#bigImg").attr("src"));
			$("#updateImgDiv").show();
		});

		$("#cancelBtn").click(function() {
			$("#updateImgDiv").hide();
		});

		// 대표 이미지로 지정
		$("#thumbnailBtn")
				.click(
						function() {
							var imgNo = $("#bigImg").data("imgno");
							location = "updateImageThm.do?revNo=${vo.revNo}&imgNo="
									+ imgNo
									+ "&page=${param.page}&perPageNum=${param.perPageNum}&key=${param.key}&word=${param.word}";
						});

		// 이미지 1개 삭제하기
		$("#imgDeleteBtn")
				.click(
						function() {
							var imgNo = $("#bigImg").data("imgno");
							location = "deleteImage.do?revNo=${vo.revNo}&imgNo="
									+ imgNo
									+ "&deleteImage="
									+ $("#bigImg").attr("src")
									+ "&page=${param.page}&perPageNum=${param.perPageNum}&key=${param.key}&word=${param.word}";
						});
		$("#deleteBtn").click(function() {
			if (!confirm("정말 삭제하시겠습니까?"))
				return false;
		});

	});
</script>

<style type="text/css">
.well {
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 80px;
}

.tourThumbnail {
	display: block;
	margin: 0 auto;
	max-width: 100%;
	height: auto;
	border-radius: 50%;
	width: 300px;
	height: 300px;
}

.content-box {
	border: 3px solid lightgray;
	border-left: none;
	border-right: none;
	padding: 50px;
	text-align: center;
	font-size: 13px;
}

.custom-well {
	margin-top: 40px;
	background-color: #696969;
}

button {
	display: inline-flex;
	align-items: center;
	justify-content: center;
	width: 120px;
	height: 50px;
	border-radius: 25px;
	border: none;
	color: white;
	font-size: 16px;
	font-weight: bold;
	cursor: pointer;
	background-color: #FF5252;
}

button.gray {
	background-color: #E0E0E0;
}

button i {
	margin-right: 10px;
}

button.like-button.red {
	background-color: #FF5252;
}

button.like-button.red:hover {
	background-color: #FF8A80;
}

button.like-button.grey {
	background-color: #a9a9a9;
	color: #E0E0E0;
}

button.like-button.grey:hover {
	background-color: #BDBDBD;
}

.like-count {
	font-size: 1.2em;
	margin-bottom: 4px;
}

#updateImgDiv {
	display: none;
	text-align: center;
}

.small-btn {
	width: 80px;
	height: 30px;
	font-size: 11px;
}
</style>


</head>

<body>
	<div class="container">
		<div>
			<p style="float: left; font-size: 13px;">No. ${vo.revNo }</p>
			<p style="float: right; font-size: 13px;">
				<fmt:formatNumber value="${vo.hit }" pattern="#,###" />
				Views
			</p>
		</div>
		<p style="margin-top: 50px; font-size: 35px;">${vo.title }</p>
		<div style="float: left">
			<p style="margin-top: 27px; font-size: 13px;">${vo.nickname }
				(${vo.gradeName })</p>
			<p style="font-size: 13px">
				<fmt:formatDate value="${vo.writeDate }"
					pattern="yyyy-MM-dd HH:mm:ss" />
			</p>
		</div>
		<div style="margin-top: 38px; float: right;">
			<!-- 로그인 아이디 = 작성자 아이디 -->
			<c:if test="${login.id == vo.id }">
				<a href="update.do?revNo=${vo.revNo }" class="btn btn-default">수정</a>
				<!-- 후기 삭제 시 답글까지 삭제 -->
				<c:if test="${vo.ordNo == 1}">
					<a href="deleteReview.do?refNo=${vo.refNo }&bookNo=${vo.bookNo}"
						class="btn btn-default" id="deleteBtn">삭제</a>
				</c:if>
				<!-- 답글 삭제 -->
				<c:if test="${vo.ordNo >= 2}">
					<a href="deleteAnswer.do?revNo=${vo.revNo }" id="deleteBtn"
						class="btn btn-default">삭제</a>
				</c:if>
			</c:if>
			<!-- 해당 투어의 가이드와 관리자만 답글 작성 가능 -->
			<c:if test="${login.id == vo.guideId || login.gradeNo == 9}">
				<a href="writeAnswer.do?revNo=${vo.revNo }&tourNo=${vo.tourNo }"
					class="btn btn-default">답글</a>
			</c:if>
		</div>
		<div style="margin-top: 110px;">
			<hr>
		</div>
		<div class="well">
			<div>
				<img class="tourThumbnail" src=${vo.tourThumbnail }>
				<div style="margin-top: 50px; font-size: 20px; text-align: center;">${vo.guideId } 가이드의 ${vo.tourTitle }</div>
				<p
					style="text-align: center; margin-top: 40px; margin-bottom: 40px;">
					<c:if test="${vo.ordNo < 2}">
						<c:forEach begin="1" end="${vo.rating }">
							<i class="material-icons"
								style="color: #fad103; font-size: 50px;">star</i>
						</c:forEach>
						<c:forEach begin="${vo.rating + 1}" end="5">
							<i class="material-icons"
								style="color: #a9a9a9; font-size: 50px;">star</i>
						</c:forEach>
					</c:if>
				</p>
				<p class="content-box">${vo.content }</p>

				<c:if test="${not empty list}">
					<div class="well custom-well">
						<div class="row">
							<div class="col-md-12">
								<div class="row">
									<div class="col-md-12 text-center">
										<c:forEach items="${list }" var="vo2">
											<c:if test="${vo2.thumbnail == 1}">
												<img alt="${vo2.imgName }" src="${vo2.imgName }"
													style="width: 70%" class="img-thumbnail" id="bigImg"
													data-imgNo="${vo2.imgNo }">
											</c:if>
										</c:forEach>
									</div>
								</div>
								<!-- 작은 이미지 리스트 만들기 -->
								<div class="row"
									style="margin-top: 20px; margin-left: 100px; text-align: center;">
									<c:forEach items="${list}" var="vo2">
										<div class="col-md-2 imgData" data-imgno="${vo2.imgNo}"
											data-thumbnail="${vo2.thumbnail}" style="text-align: center">
											<img alt="${vo2.imgName}" src="${vo2.imgName}"
												style="width: 100%; text-align: center;"
												class="img-thumbnail">
										</div>
									</c:forEach>
								</div>
								<c:if test="${login.id == vo.id }">
								<div class="col-md-12"
									style="text-align: center; margin-top: 20px;">

									<button class="btn btn-default small-btn" id="thumbnailBtn">대표
										이미지</button>
									<button class="btn btn-default small-btn" id="updateImgBtn">파일
										변경</button>
									<button class="btn btn-default small-btn" id="imgDeleteBtn">삭제</button>
								</div>
								<div class="row" id="updateImgDiv">
									<div class="col-md-12">
										<form action="updateImage.do" method="post"
											enctype="multipart/form-data">
											<input type="hidden" name="revNo" value="${vo.revNo }">
											<!-- 작은 이미지 클릭 시 큰 이미지 imgNo 세팅 -->
											<input type="hidden" name="imgNo" id="updateImgNo"> <input
												type="hidden" name="page" value="${param.page }"> <input
												type="hidden" name="perPageNum" value="${param.perPageNum }">
											<input type="hidden" name="key" value="${param.key }">
											<input type="hidden" name="word" value="${param.word }">
											<!-- 변경 버튼 클릭 시 큰 이미지의 src를 가져와 세팅 -->
											<input type="hidden" name="deleteImgName" id="deleteImgName">
											<div class="form-group" style="margin-top: 40px">
												<input class="form-control" name="updateImage" type="file">
											</div>
											<button class="btn btn-default small-btn" id="changeBtn">확인</button>
											<button class="btn btn-default small-btn" type="button"
												id="cancelBtn">취소</button>
										</form>
									</div>
								</div>
								</c:if>
							</div>
						</div>
					</div>
				</c:if>
				<div style="text-align: center; margin-top: 40px;">
					<c:if test="${vo.ordNo == 1 }">
						<c:if test="${login.id != vo.id}">
							<c:choose>
								<c:when test="${empty login.id}">
									<button onclick="alert('로그인 후 이용 가능합니다.')"
										class="like-button red">
										<i class="material-icons">thumb_up</i>&nbsp;추천&nbsp;&nbsp;<span
											class="like-count">${vo.likeCnt }</span>
									</button>
								</c:when>
								<c:otherwise>
									<c:if test="${check ne null && check eq true}">
										<form action="deleteLike.do" method="post">
											<input type="hidden" name="id" value="${login.id }">
											<input type="hidden" name="revNo" value="${vo.revNo }">
											<button class="like-button liked grey" type="submit">
												<i class="material-icons">thumb_down</i>&nbsp;취소&nbsp;&nbsp;
											</button>
										</form>
									</c:if>
									<c:if test="${check eq null || check eq false}">
										<form action="writeLike.do" method="post">
											<input type="hidden" name="id" value="${login.id }">
											<input type="hidden" name="revNo" value="${vo.revNo }">
											<button class="like-button red" type="submit">
												<i class="material-icons">thumb_up</i>&nbsp;추천&nbsp;&nbsp;<span
													class="like-count">${vo.likeCnt }</span>
											</button>
										</form>
									</c:if>
								</c:otherwise>
							</c:choose>
						</c:if>
						<c:if test="${login.id eq vo.id}">
							<button onclick="alert('본인이 작성한 글은 추천할 수 없습니다.')"
								class="like-button grey">
								<i class="material-icons">thumb_up</i>&nbsp;추천&nbsp;&nbsp;<span
									class="like-count">${vo.likeCnt }</span>
							</button>
						</c:if>
					</c:if>
				</div>
				<!-- 연산자 쓰니까 버튼 스타일 안 먹힘... 왜일까 -->
				<!-- 
				<c:if test="${vo.ordNo == 1 }">
					<c:if test="${login.id ne vo.id}">
						<c:choose>
							<c:when test="${empty login}">
								<button onclick="alert('로그인 후 이용 가능합니다.')">추천</button>${vo.likeCnt}
				</c:when>
							<c:otherwise>
								<form
									action="${check ne null && check eq true ? 'deleteLike.do' : 'writeLike.do'}"
									method="post">
									<input type="hidden" name="id" value="${login.id}"> <input
										type="hidden" name="revNo" value="${vo.revNo}">
									<button>${check ne null && check eq true ? '추천 취소' : '추천'}</button>${vo.likeCnt}
								</form>
							</c:otherwise>
						</c:choose>
					</c:if>
					<c:if test="${login.id eq vo.id}">
						<button onclick="alert('본인이 작성한 글은 추천할 수 없습니다.')">추천</button>${vo.likeCnt}
		</c:if>
				</c:if>
				-->
			</div>
		</div>
	</div>
</body>
</html>