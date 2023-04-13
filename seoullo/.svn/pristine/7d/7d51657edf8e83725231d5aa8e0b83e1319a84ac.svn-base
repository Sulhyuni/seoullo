package com.seoullo.book.mapper;

import java.util.List;
import java.util.Date;
import org.apache.ibatis.annotations.Param;

import com.seoullo.book.vo.BookDetailVO;
import com.seoullo.book.vo.BookVO;
import com.seoullo.book.vo.GuideDetailVO;
import com.seoullo.book.vo.GuideVO;
import com.webjjang.util.PageObject;

public interface BookMapper {
	
	// 리스트
	public List<BookVO> list(PageObject pageObject);
	
	public long getTotalRow(PageObject pageObject);
	
	// 회원 리스트
	public List<BookVO> perList(@Param("pageObject") PageObject pageObject,  @Param("id")String id);
	
	// 가이드 리스트
	public List<GuideVO> guideList(long tourNo);
	public List<GuideDetailVO> guideDetailList(@Param("day")Date day, @Param("tourNo")long tourNo);
	
	// 상세보기
	public BookVO view(long no);
	
	public List<BookDetailVO> viewDetail(long bookNo);	

	// 예약하기
	public int book(BookVO vo);
	
	public int bookDetail(BookDetailVO vo);
	
	// 예약 취소
	public int cancel(Long bookNo);
	
	// 예약번호 찾기
	public long findBookNo(String id);
	
	// 리뷰상태 바꾸기
	public int updateReview(long no); // 후기 등록 : 작성가능 -> 작성완료
	
	public int deleteReview(long no); // 후기 삭제 : 작성완료 -> 작성가능
	
	// 예약 가능 인원 수정하기
	public int incReserveNum(BookDetailVO vo); // 증가
	
	public int decReserveNum(BookDetailVO vo); // 감소
	
	// 예약 인원 가져오기
	public BookDetailVO checkReserveNum(BookDetailVO vo);
	
	// 예약 상태 변경 - 날짜별
	public int reserveStatusUpdate(BookDetailVO vo);
	
	// 프로시저 호출	
	public void tourStatusUpdateWhenBooking(long tourNo);
	
	public void tourStatusUpdateWhenCancel(long tourNo);
	
	// 회원 정보 수정
	public int bookInfoUpdate(BookVO vo);
	
	public int bookStatusUpdate(long bookNo);
	
	
}
