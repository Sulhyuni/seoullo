package com.seoullo.anonymous.mapper;

import java.util.List;

import com.seoullo.anonymous.vo.AnonymousVO;
import com.webjjang.util.PageObject;

public interface AnonymousMapper {
	
	//DB 구체적으로 작성
	
	//질문리스트
	public List<AnonymousVO>list(PageObject pageObject);
	
	//검색
	public long getTotalRow(PageObject pageObject);
	
	//질문보기
	public AnonymousVO view(long anonyNo);
	
	//조회수
	public long increase(long no);

	//작성 
	public Integer write(AnonymousVO vo);	
	
	//수정
	public Integer update(AnonymousVO vo);
	
	//삭제
	public Long delete(long anonyNo); //글번호만 받음
	
	public Long deleteReply(long anonyNo); // rno,like
	public Long deleteLike(long anonyNo); // rno,like
	
//============================================================
	//좋아요 등록
	public int like(AnonymousVO vo);
	
	//좋아요 취소
	public int unlike(AnonymousVO vo); //번호, 아이디
	
	public Boolean likeCheck(AnonymousVO vo);
	
	public int getLikeCount(long anonyNo) ;
	
	

}
