package com.seoullo.review.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.seoullo.review.vo.ReviewVO;
import com.webjjang.util.PageObject;

public interface ReviewMapper {

	// 후기
	// --------------------------------------------------------------------------------------------------------

	public List<ReviewVO> list(PageObject pageObject);

	public List<ReviewVO> myList(@Param("id") String id, @Param("pageObject") PageObject pageObject);

	public long getTotalRow(PageObject pageObject);

	public ReviewVO view(long revNo);

	public int increase(long revNo);

	public int writeReview(ReviewVO vo);

	public int writeAnswer(ReviewVO vo);

	public int increaseOrdNo(ReviewVO vo);

	public int update(ReviewVO vo);

	public int deleteReview(long refNo);

	public int deleteAnswer(long revNo);

	// 후기 이미지
	// --------------------------------------------------------------------------------------------------------

	public List<ReviewVO> viewImage(long revNo);

	public int writeImage(ReviewVO vo);

	public int updateImage(ReviewVO vo);

	public int updateImageUnthm(long revNo);

	public int updateImageThm(long imgNo);

	public int deleteImage(long imgNo);

	// 후기 추천
	// --------------------------------------------------------------------------------------------------------

	public Boolean likeCheck(ReviewVO vo);

	public int writeLike(ReviewVO vo);

	public int deleteLike(ReviewVO vo);

	// 탭 내 후기
	// --------------------------------------------------------------------------------------------------------

	public List<ReviewVO> listTab(@Param("pageObject") PageObject pageObject, @Param("tourNo") long tourNo);

}
