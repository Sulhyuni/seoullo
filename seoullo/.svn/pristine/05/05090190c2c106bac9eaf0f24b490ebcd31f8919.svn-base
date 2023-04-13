package com.seoullo.siteqna.mapper;

import java.util.List;

import com.seoullo.qna.vo.QnaVO;
import com.seoullo.siteqna.vo.SiteQnaVO;
import com.webjjang.util.PageObject;

public interface SiteQnaMapper {
	
	//DB 구체적으로 작성
	
	//질문리스트
	public List<SiteQnaVO>list(PageObject pageObject);
	
	//검색
	public long getTotalRow(PageObject pageObject);
	
	//질문보기
	public SiteQnaVO view(long siteNo);
	
	//조회수
	public long increase(long no);

	//질문작성
	public Integer write(SiteQnaVO vo);
	
	//질문 수정
	public Integer update(SiteQnaVO vo);
	
	//질문 삭제
	public Long delete(long refNo); //글번호만 받음
	
//----------------------------------------------------------------
	
	
	
	//답변작성
	public Integer answer(SiteQnaVO vo);
	
	//순서번호 증가 ordNo
	public  Integer increaseOrdNo(SiteQnaVO vo);
	
	//응답상태 변경
	public  Integer statusRefNo(SiteQnaVO vo);
	
//	//답변수정
//	public Integer answerUpdate(SiteQnaVO aVo);
	
	//답변삭제
	public Long answerDelete(long siteNo);//글번호만 받음
	

}
