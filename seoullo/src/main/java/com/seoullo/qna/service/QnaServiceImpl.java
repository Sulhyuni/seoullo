package com.seoullo.qna.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.seoullo.qna.mapper.QnaMapper;
import com.seoullo.qna.vo.QnaVO;
import com.webjjang.util.PageObject;

import lombok.Setter;

@Service
@Qualifier("qnaServiceImpl")
public class QnaServiceImpl implements QnaService{
	
	//service 안에 mapper 있음
	@Setter(onMethod_= @Autowired)
	private QnaMapper mapper;
	
	
	
	
	//list
	@Override
	public List<QnaVO> list(PageObject pageObject) {
		pageObject.setTotalRow(mapper.getTotalRow(pageObject));
		return mapper.list(pageObject);
	}
	
	public List<QnaVO> listTab( PageObject pageObject,long tourNo){
		pageObject.setTotalRow(mapper.getTotalRow(pageObject));
		return mapper.listTab(pageObject, tourNo);
	}
	
	//view
	@Override
	public QnaVO view(long qnaNo, long inc) {
		if(inc==1)
			mapper.increase(qnaNo);
		return mapper.view(qnaNo);
	}
	
	//write 질문작성
	@Override
	public  Integer write(QnaVO vo) {
		
		return mapper.write(vo);
	}

	@Override
	public  Integer update(QnaVO vo) {

		return mapper.update(vo);
	}

	@Override
	public Long delete(long refNo) {

		return mapper.delete(refNo);
	}
	
	//answer 답변작성
	@Override
	public  Integer answer(QnaVO vo) {
		
		vo.setOrdNo(vo.getOrdNo()+1);
		vo.setStatus(vo.getStatus());
		//순서번호 1증가
		mapper.increaseOrdNo(vo);
		mapper.statusRefNo(vo);
		
		return mapper.answer(vo);
	}

	@Override
	public Integer answerUpdate(QnaVO vo) {
		// TODO Auto-generated method stub
		return mapper.answerUpdate(vo);
	}

	@Override
	public Long answerDelete(long qnaNo) {
		// TODO Auto-generated method stub
		return mapper.answerDelete(qnaNo);
	}
//답변삭제
	
}
