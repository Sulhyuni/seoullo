/**
 * 좋아요 처리, 좋아요 취소
 */

var likeService = (
   function() {

      function likeView(param, callback, error) {

         var anonyNo = $("#anonyNo").text();
         var id = $("#login").text();
         var inc = $("#inc").text();
         
         $.getJSON(

            "/anonyMous/view.do?anonyNo=" + anonyNo +"&inc"+inc,
            function(data) {

               if (callback) {
                  callback(data);
               }
            }
         ) // end of Json
            // error (실패) 상태일 때의 처리함수
            .fail(
               function(xhr, status, err) {
                  if (error) {
                     error();
                  } else {

                     // 데이터가 없어서 나오는 오류
                     if (xhr.status == 200) {
//                        alert("데이터 없음");
                        $("#like").removeClass();
                        $("#like").addClass("fa fa-heart");
                     }
                     else
                        // 오류 출력
                        alert("error : " + err);
                  }
               }
            ); // $.getJSON().fail()의 끝

      }//end of likeView func()


      //좋아요 처리 함수
      function liked(like, callback, error) {

         $.ajax({
            //전송방법의 타입
            type: "POST",
            // 요청 URL
            url: "/anonymous/like.do",
            // 전송되는 데이터
            data: JSON.stringify(like),
            //전송되는 데이터 타입과 엔코딩 방식
            contentType: "application/json; charset=utf-8",
            // 정상적으로 좋아요 등록 성공 했을때의 처리 함수
            success: function(result, status, xhr) {
               if (callback) callback(result, status);
               else alert("좋아요 등록 성공");
            },
            // 처리 도중 오류(실패)가 난 경우 처리하는 함수 속성
            error: function(xhr, status, err) {
               if (error) error(err);
               else alert("로그인 후 이용이 가능한 서비스 입니다.");
            }
         });//$.ajax의 끝 
      }


      // 좋아요 취소 처리 함수
      function deleteBookmark(unlike, callback, error) {
         //ajax 이용해서 데이터를 서버에 보낸다.
         $.ajax({
            //전송방법의 타입
            type: "post",
            // 요청 URL
            url: "/anonymous/unlike.do",
            // 전송되는 데이터
            data: JSON.stringify(unlike),
            //전송되는 데이터 타입과 엔코딩 방식
            contentType: "application/json; charset=utf-8",
            // 정상적으로 좋아요 등록 성공 했을때의 처리 함수
            success: function(result, status, xhr) {
               if (callback) callback(result, status);
               else alert("좋아요 취소 성공");
            },
            // 처리 도중 오류(실패)가 난 경우 처리하는 함수 속성
            error: function(xhr, status, err) {
               if (error) error(err);
               else alert("좋아요 취소 오류");
            }
         });//$.ajax의 끝 
      }
      return {
         liked: liked,
         likeView: likeView,
         deleteBookmark: deleteBookmark
      }
   }
)();

$(function() {

   var id = $("#login").text();
   var anonyNo = $("#anonyNo").text();

   //   alert(id);

   $(".like").click(function() {

      // 북마크 모달창 수정 버튼 이벤트 - 수정 처리 -----------------------------------------
      var login = $("#login").text();

   });

   function checkLike() {

      likeService.likeView({ anonyNo: anonyNo }, function(data) {

         if (data != null) {
            $(".like").attr("class", "liked");		//  수정 완료
         } else {
            alert("좋아요를 취소했습니다. ");
         }
      })
   }

   // 시작과 함께 불러오기
   checkLike();


   // 좋아요 취소 이벤트 ================================================
   $(document).on("click", ".liked", function() {
      var unlike = {};

      unlike.anonyNo = anonyNo;
      unlike.id = id;
		
		likeService.deleteBookmark(unlike, function(result, status) {
         console.log("result=" + result + ",status =" + status);
//         alert("result=" + result + ",status =" + status);

         if (status == "notmodified") {
            alert("좋아요 취소 실패. 다시 시도해주세요.");
         } else {
            alert("취소했습니다.");
            // 버튼의 정보 바꾸기
            $("#like").removeClass();
            $("#like").addClass("fa fa-heart-o"); 		// 수정완료
            $("#likeBtn").removeClass();
            $("#likeBtn").addClass("like");
            
         }
      });
   });

   // 좋아요 이벤트 ================================================
   $(document).on("click", ".like", function() {
      // alert("liked alert");
      var like = {};

      like.anonyNo = anonyNo;
      like.id = id;

      likeService.liked(like, function(result, status) {

         if (status == "notmodified") {

            alert("좋아요 실패");

         } else {

            alert("좋아요!");
            // 버튼의 정보 바꾸기
            $("#like").removeClass();
            $("#like").addClass("fa fa-heart");
            $("#likeBtn").removeClass();
            $("#likeBtn").addClass("liked");
         }

      });



   });   // end of click
});