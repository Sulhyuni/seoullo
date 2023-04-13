package com.seoullo.qna.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.seoullo.qna.vo.QnaVO;
import com.webjjang.util.PageObject;

public interface QnaService {
	
	//리스트
		public List<QnaVO>list(PageObject pageObject);
		public List<QnaVO> listTab( PageObject pageObject, long tourNo);
		//보기
		public QnaVO view(long qnaNo, long inc);
		
		//질문-작성
		public Integer write(QnaVO vo);
		
		
		//수정
		public Integer update(QnaVO vo);
		
		//질문삭제
		public Long delete(long refNo);

		//답변작성
		public Integer answer(QnaVO vo);
		
		//답변수정
		public Integer answerUpdate(QnaVO vo);
		//답변삭제
		public Long answerDelete(long qnaNo);

}
