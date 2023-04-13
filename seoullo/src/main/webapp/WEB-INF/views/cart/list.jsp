<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<style type="text/css">
.peopleA, .peopleB{
	border: solid 1px #ccc;
	text-align: center;
	width: 20px;
	font-weight: bold;
	margin-left: -5px
}
input:focus,
button:active{
	outline: none;
}
button:focus,
button:active{
	outline: none;
}
a:focus{
	outline: none;
}
.tourInfoDiv{
	border-top: solid 1px #aaa;
	border-bottom: solid 1px #aaa;
	padding : 10px 0;
	margin-bottom: 5px;
}
#addBtn{
	color: #4B8A08;
	font-weight: bold;
	margin: 0 5px;
}
.bookBtn{
	background: #4B8A08;
	color: white;
	font-weight: bold;
}
.peopleBtn {
	outline: none;
	height: 22px;
}
.plus_btnA, .plus_btnB{
	margin-left:-4px;
}
#imgDiv{
	width: 80px;
	height : 80px;
	border-radius: 70%;
	overflow: hidden;
	margin-left: 60px;
}
.img{
	width: 100%;
	height: 100%;
}
#payPrice{
	outline: none;
	border: none;
	font-size: 20px;
	font-weight: bold;
	color: #d8421c;
	width: 150px;
}
#tourPrice{
	border: none;
	text-align: center;
}
</style>
<script type="text/javascript">
$(function(){
	
    // 장바구니에서 여러개 예약하기
	$("#bookBtn_check").click(function(){
		let cartNos = [];
		let tourPriceZero = false;
		$(".checkbox:checked").each(function(){
			let tourPrice = $(this).parents("#allDiv").find("#tourPrice").val();
			if(tourPrice == 0) {
	            alert("선택하신 투어 중 예약 인원이 0명인 투어가 있습니다.");
	            tourPriceZero = true;
	            return false; // each loop를 빠져나옴
	        }
			cartNos.push($(this).val());
		});
	    if(tourPriceZero) {
	        return; // 선택한 상품 중 tourPrice가 0인 상품이 있으므로 예약 진행을 중단함
	    }
		if(cartNos.length === 0) {
			alert("예약하실 투어 상품을 선택 해 주세요.");
		} else {
			location.href = "/book/book.do?cartNos=" + cartNos.join(",");
		}
	});
	
	// 전체 체크박스를 클릭했을 때
	$("#all_check").click(function() {
	  // 모든 체크박스 상태를 현재 체크박스 상태로 변경
	  $(".checkbox").prop("checked", $(this).prop("checked"));
	  // payPrice 업데이트
	  updatePayPrice();
	});

	// 각 체크박스를 클릭했을 때
	$(".checkbox").click(function() {
	  // payPrice 업데이트
	  updatePayPrice();
	});

	// 총가격 업데이트 함수
	function updatePayPrice() {
	  let sum = 0;
	  // 체크된 체크박스에 대응하는 tourPrice 값을 더해줌
	  $("input[class='checkbox']:checked").each(function() {
	    sum += parseInt($(this).closest(".row").find("#tourPrice").val());
	  });
	  // payPrice 업데이트
	  $("#payPrice").val(sum);
	}
	
	// 장바구니 수정 처리
	$(".peopleBtn").click(function(){
		const operation = $(this).data('operation');
		let peopleA = parseInt($(this).parents(".cartInfo").find(".peopleA").val()); // 대인
		let peopleB = parseInt($(this).parents(".cartInfo").find(".peopleB").val()); // 소인
		let cartNo = $(this).parents("#allDiv").find(".cartNo").val(); // 장바구니 번호
		let cartNos = [cartNo]; // 삭제를 위한 배열 변환
		let tourPrice = $(this).parents(".cartInfo").find("#tourPrice").val(); // 투어가격
		let reserveNum = $(this).parents(".cartInfo").find("#reserveNum").val(); // 예약인원
		let maxNum = $(this).parents(".cartInfo").find("#maxNum").val(); // 마감인원
		
		if (operation === 'minus_btnA' || operation === 'plus_btnA') { // 대인 버튼 눌렀을 때
			if (operation === 'minus_btnA' && peopleA >= 0) { // 대인 - 버튼 눌렀을 때 (0 이하로 내려가지 않게)
				if (peopleA < 1 && peopleB < 1) {
			        const result = confirm('해당 투어를 장바구니에서 삭제하시겠습니까?');
			        if (result) deleteCart(cartNos);			        
			    } else {
			    	if(peopleA > 0) $(this).parents(".cartInfo").find(".peopleA").val(--peopleA); // 수량 1 감소
			    }
			} else if (operation === 'plus_btnA') { // 대인 + 버튼 눌렀을 때
			    if (peopleA + peopleB < maxNum - reserveNum) {
					$(this).parents(".cartInfo").find(".peopleA").val(++peopleA); // 수량 1 증가		
			    } else {
			        alert("예약 인원이 초과되었습니다.");
			    }
			}
		} else if (operation === 'minus_btnB' || operation === 'plus_btnB') { // 소인 버튼 눌렀을 때
			if (operation === 'minus_btnB' && peopleB >= 0) { // 소인 - 버튼 눌렀을 때 (0 이하로 내려가지 않게)
				if (peopleA < 1 && peopleB < 1) {
			        const result = confirm('해당 투어를 장바구니에서 삭제하시겠습니까?');
			        if (result) deleteCart(cartNos);
			    } else {
			    	if(peopleB > 0) $(this).parents(".cartInfo").find(".peopleB").val(--peopleB); // 수량 1 감소
			    }
			} else if (operation === 'plus_btnB') { // 소인 + 버튼 눌렀을 때
			    if (peopleA + peopleB < maxNum - reserveNum) {
					$(this).parents(".cartInfo").find(".peopleB").val(++peopleB); // 수량 1 증가				
			    } else {
			        alert("예약 인원이 초과되었습니다.");
			    }
			}
		};
		// tourPrice값 변경해주는 함수 실행 후에 tourPrice 변수에 저장하기.
		tourPrice = calculateTourPrice($(this));
		
		// 바뀐 값으로 update 실행하는 ajax 코드.
		$.ajax({
			url: "/cart/update.do", // 실행하면 가는 url
			dataType : "json", // 키:값의 형태인 json으로 보낼거임.
			type: "POST", // POST 방식으로 보낼거임.
			data : { // 키:값으로 데이터 세팅
				// cartVO에 있는 변수명 : 위에서 세팅된 변수명
				no: cartNo, // cartVO.no : 위에서 세팅한 cartNo의 값
				peopleA: peopleA, // cartVO.peopleA : 위에서 변경된 peopleA의 값
				peopleB: peopleB, // cartVO.peopleB : 위에서 변경된 peopleB의 값
				tourPrice: tourPrice // cartVO.tourPrice : 위에서 변경된 tourPrice의 값
			},
			success: function(result){ // ajax성공시 실행되는 함수
				if (result === 1) { // 1행이 수정되었습니다
 					console.log("수량이 수정되었습니다.");
// 					location.reload(); // 현재페이지 새로고침
				} else { // 수정실패하면 뜨는 알람
					alert("장바구니 수정에 실패 하였습니다.");
				}
			}
		});
		updatePayPrice();
	});
	
	// 총 결제금액 업데이트 함수
	function calculateTourPrice(btn) {
 		let priceA = parseInt(btn.parents(".cartInfo").find("input.priceA").val());
		let priceB = parseInt(btn.parents(".cartInfo").find("input.priceB").val());
		let peopleA = parseInt(btn.parents(".cartInfo").find("input.peopleA").val());
		let peopleB = parseInt(btn.parents(".cartInfo").find("input.peopleB").val());
		let tourPrice = (priceA * peopleA) + (priceB * peopleB);
		$(btn.parent("div")).find("input#tourPrice").val(tourPrice);
		return tourPrice;
	}
	
	// 장바구니 1개 삭제 처리
	$(".deleteBtn").click(function(){
		let cartNo = $(this).data("no");
		let cartNos = [cartNo];		
		deleteCart(cartNos);
	});
	
	// 장바구니 선택삭제 처리
	$("#deleteBtn_check").click(function(){
		let cartNos = [];
		$(".checkbox:checked").each(function(){
			cartNos.push($(this).val());
		});
		deleteCart(cartNos);
	});
	
	// 장바구니 삭제하는 ajax 함수
	function deleteCart(cartNos) {
    $.ajax({
        url: "/cart/delete.do",
        dataType: "json",
        type: "POST",
        data: {
            'nos[]': cartNos,
        },
        success: function (result) {
            if (result === 1) {
                location.reload();
            } else {
                alert("장바구니가 삭제되지 않았습니다.");
            }
        }
    });
}
	
});
</script>
</head>
<body>
	<div class="container">
		<div>
			<c:if test="${!empty list }">
				<div class="row tourInfoDiv">
					<div class="col-md-1 all_check_input_div">
						<!-- 체크박스 전체선택/해제하는 부분 -->
						<span><input type="checkbox" id="all_check"></span>
					</div>
					<div class="col-md-11" align="center" style="padding: 3px 0;">
						<span>투어상품정보</span>
					</div>
				</div>
			</c:if>
			
			<!-- 장바구니가 비어있을 때 -->
			<c:if test="${empty list }">
				<div align="center" style="margin: 100px 0;">
					<h1 style="color: #4B8A08">장바구니에 담긴 상품이 없습니다.</h1>
					<span style="color: #gray; font-size:15px;">
						담기를 원하시면 아래
						<span style="font-size:15px; font-weight: bold;">투어예약하기</span>
						버튼을 눌러주세요.
					</span>
					<br/><br/><br/>
					<a href="/tour/list.do"><button class="btn btn-default btn-lg">투어 담으러 가기</button></a>
				</div>
			</c:if>			
		
			<!-- 장바구니 한칸 -->	
			<c:forEach items="${list }" var="vo">
				<div id="allDiv" class="row" style="padding:10px 0; border-bottom: solid 1px #aaa;">
					<input type="hidden" name="cartNo" id="cartNo" value="${vo.no }">
					<div id="checkDiv" class="col-md-1">
						<input type="checkbox" class="checkbox" name="cartNos[]" value="${vo.no}">
					</div>
					
					<div class="col-md-3">
						<div id="imgDiv">
							<img src="${vo.thumbnail }" class="img" alt="${vo.thumbnail }">
						</div>
					</div>
					
					<div class="col-md-4 cartInfo">
						<span>[ ${vo.type } ] </span> <br/>
						<span>[ ${vo.title } ]</span> <br/>
						<span>[ ${vo.region } ]</span> <br/>
						
						<input type="hidden" name="cartNo" class="cartNo" value="${vo.no }">
						<input type="hidden" name="reserveNum" id="reserveNum" value="${vo.reserveNum }">
						<input type="hidden" name="maxNum " id="maxNum" value="${vo.maxNum }">

						<input class="priceA" type="hidden" value="${vo.priceA }">
						[ 대인 / <fmt:formatNumber pattern="#,###" value="${vo.priceA }" /> ]
						<button class="peopleBtn btn btn-default btn-xs" type="button" data-operation="minus_btnA">－</button>	
						<input type="text" class="peopleA" name="peopleA" readonly="readonly" value="${vo.peopleA }">
						<button class="peopleBtn btn btn-default btn-xs" type="button" data-operation="plus_btnA">＋</button><br/>
						
						<input class="priceB" type="hidden" value="${vo.priceB }">
						[ 소인 / <fmt:formatNumber pattern="#,###" value="${vo.priceB }" /> ]
						<button class="peopleBtn btn btn-default btn-xs" type="button" data-operation="minus_btnB">－</button>
						<input type="text" class="peopleB" name="peopleB" readonly="readonly" value="${vo.peopleB }">				
						<button class="peopleBtn btn btn-default btn-xs" type="button" data-operation="plus_btnB">＋</button><br/>				
														
						[ 투어가격 : <input style="width: 50px; font-weight: bold;" id="tourPrice" value="${vo.tourPrice }"> ]

					</div>
					
					<div id="priceDiv" class="col-md-2" align="center">
						<br/><br/>
						<span style="color:#d8421c; font-weight: bold;">
							<fmt:formatDate pattern="yyyy-MM-dd" value="${vo.day }"/>
						</span>
					</div>
					
					<div class="col-md-2" align="right">
						<br/><br/>
						<button class="btn btn-default btn-sm deleteBtn" data-no="${vo.no}">X</button>
					</div>				
				</div>				
			</c:forEach>
		</div>
		
		<!-- 장바구니가 비어있지 않을때만 표시 -->
		<c:if test="${!empty list }">
			<div class="row">
				<div class="col-md-6">
					<button id="deleteBtn_check" class="btn btn-default btn-sm" style="margin: 5px 0;">선택삭제</button>
				</div>
				<div class="col-md-6" align="right" style="margin-top: 10px">
					<span style="font-size: 14px; font-weight: bold;">총 결제금액  <input id="payPrice" value="0"> 원</span>
				</div>
			</div>
			<div style="text-align: center; margin: 30px 0 0 0">
				<a href="/tour/list.do"><button id="addBtn" class="btn btn-default btn-lg">투어 더 담기</button></a>
				<input type="hidden" name="cartNos" id="cartNos" value="">
				<button type="button" id="bookBtn_check" class="btn btn-default btn-lg">예약하기</button>
			</div>
		</c:if>
		
	</div>
</body>
</html>