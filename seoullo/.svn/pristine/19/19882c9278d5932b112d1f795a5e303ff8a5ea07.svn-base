package com.seoullo.review.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.seoullo.review.vo.ReviewVO;
import com.webjjang.util.PageObject;

public interface ReviewService {

	// 후기 --------------------------------------------------------------------------------------------------------
	
	// 후기 리스트
	public List<ReviewVO> list(PageObject pageObject);
	
	// 내 후기 리스트
	public List<ReviewVO> myList(String id, PageObject pageObject);

	// 후기 보기
	public ReviewVO view(long revNo, int inc);
	
	// 후기 등록, 후기 이미지 등록
	public int writeReview(ReviewVO vo, List<ReviewVO> list);
	
	// 후기 답글 등록
	public int writeAnswer(ReviewVO vo);
	
	// 후기 수정
	public int update(ReviewVO vo);
	
	// 후기 삭제
	public int deleteReview(long refNo, long bookNo);

	// 후기 답글 삭제
	public int deleteAnswer(long revNo);
	
	// 후기 이미지 --------------------------------------------------------------------------------------------------------
	
	// 후기 이미지 보기
	public List<ReviewVO> viewImage(long revNo);
	
	// 후기 이미지 수정
	public int updateImage(ReviewVO vo);

	// 후기 이미지 썸네일 수정
	public int updateImageThm(long revNo, long imgNo);

	// 후기 이미지 삭제
	public int deleteImage(long imgNo);
	
	// 후기 추천 --------------------------------------------------------------------------------------------------------
	
	// 후기 추천 여부 확인
	public Boolean likeCheck(ReviewVO vo);
	
	// 후기 추천 추가
	public int writeLike(ReviewVO vo);
	
	// 후기 추천 취소
	public int deleteLike(ReviewVO vo);
	
	// 탭 내 후기 --------------------------------------------------------------------------------------------------------
	
	// 탭 내 후기 리스트
	public List<ReviewVO> listTab(@Param("pageObject") PageObject pageObject, @Param("tourNo") long tourNo);
	
}
