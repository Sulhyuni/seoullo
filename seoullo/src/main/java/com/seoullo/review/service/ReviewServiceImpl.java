package com.seoullo.review.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.seoullo.book.mapper.BookMapper;
import com.seoullo.review.mapper.ReviewMapper;
import com.seoullo.review.vo.ReviewVO;
import com.webjjang.util.PageObject;

import lombok.Setter;

@Service
@Qualifier("reviewServiceImpl")
public class ReviewServiceImpl implements ReviewService {

	@Setter(onMethod_ = @Autowired)
	private ReviewMapper mapper;

	@Setter(onMethod_ = @Autowired)
	private BookMapper bookMapper;

	// 후기 --------------------------------------------------------------------------------------------------------
	
	@Override
	public List<ReviewVO> list(PageObject pageObject) {
		// TODO Auto-generated method stub
		pageObject.setTotalRow(mapper.getTotalRow(pageObject));
		return mapper.list(pageObject);
	}
	
	@Override
	public List<ReviewVO> myList(String id, PageObject pageObject) {
		// TODO Auto-generated method stub
		pageObject.setTotalRow(mapper.getTotalRow(pageObject));
		return mapper.myList(id, pageObject);
	}
	
	@Override
	public ReviewVO view(long revNo, int inc) {
		// TODO Auto-generated method stub
		if (inc == 1)
			mapper.increase(revNo);
		return mapper.view(revNo);
	}
	
	@Override
	public int writeReview(ReviewVO vo, List<ReviewVO> list) {
		// TODO Auto-generated method stub
		Integer result = mapper.writeReview(vo);
		if (result == 1) {
			bookMapper.updateReview(vo.getBookNo());
			for (ReviewVO vo2 : list) {
				vo2.setRevNo(vo.getRevNo());
				mapper.writeImage(vo2);
			}
		}
		return result;
	}

	@Override
	public int writeAnswer(ReviewVO vo) {
		// TODO Auto-generated method stub
		vo.setOrdNo(vo.getOrdNo() + 1);
		mapper.increaseOrdNo(vo);
		return mapper.writeAnswer(vo);
	}

	@Override
	public int update(ReviewVO vo) {
		// TODO Auto-generated method stub
		return mapper.update(vo);
	}

	@Override
	public int deleteReview(long refNo, long bookNo) {
		Integer result = mapper.deleteReview(refNo);
		if (result == 1) {
			bookMapper.deleteReview(bookNo);
		}
		return result;
	}

	@Override
	public int deleteAnswer(long revNo) {
		// TODO Auto-generated method stub
		return mapper.deleteAnswer(revNo);
	}

	// 후기 이미지 --------------------------------------------------------------------------------------------------------

	@Override
	public List<ReviewVO> viewImage(long revNo) {
		// TODO Auto-generated method stub
		return mapper.viewImage(revNo);
	}
	
	@Override
	public int updateImage(ReviewVO vo) {
		// TODO Auto-generated method stub
		return mapper.updateImage(vo);
	}

	@Override
	public int updateImageThm(long revNo, long imgNo) {
		// TODO Auto-generated method stub
		mapper.updateImageThm(revNo);
		return mapper.updateImageThm(imgNo);
	}

	@Override
	public int deleteImage(long imgNo) {
		// TODO Auto-generated method stub
		return mapper.deleteImage(imgNo);
	}
	
	// 후기 추천 --------------------------------------------------------------------------------------------------------

	@Override
	public Boolean likeCheck(ReviewVO vo) {
		// TODO Auto-generated method stub
		return mapper.likeCheck(vo);
	}
	
	@Override
	public int writeLike(ReviewVO vo) {
		// TODO Auto-generated method stub
		return mapper.writeLike(vo);
	}

	@Override
	public int deleteLike(ReviewVO vo) {
		// TODO Auto-generated method stub
		return mapper.deleteLike(vo);
	}
	
	// 탭 내 후기 --------------------------------------------------------------------------------------------------------

	@Override
	public List<ReviewVO> listTab(PageObject pageObject, long tourNo) {
		// TODO Auto-generated method stub
		pageObject.setTotalRow(mapper.getTotalRow(pageObject));
		return mapper.listTab(pageObject, tourNo);
	}

	
	
}
