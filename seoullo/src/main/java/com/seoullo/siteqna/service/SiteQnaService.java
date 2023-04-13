package com.seoullo.siteqna.service;

import java.util.List;

import com.seoullo.siteqna.vo.SiteQnaVO;
import com.webjjang.util.PageObject;

public interface SiteQnaService {

	
			//리스트
			public List<SiteQnaVO>list(PageObject pageObject);
			
			//보기
			public SiteQnaVO view(long siteNo, long inc);
			
			
			//질문-작성
			public Integer write(SiteQnaVO vo);
			
			
			//수정
			public Integer update(SiteQnaVO vo);
			
			//삭제
			public Long delete(long refNo);
			
			
//답변----------------------------------------------------------------------
			
			//답변-작성
			public Integer answer(SiteQnaVO vo);
			
//			//수정
//			public Integer answerUpdate(SiteQnaVO aVo);
			
			//삭제
			public Long answerDelete(long siteNo);
}
