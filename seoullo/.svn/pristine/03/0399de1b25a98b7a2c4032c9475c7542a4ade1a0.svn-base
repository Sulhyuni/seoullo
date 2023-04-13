package com.seoullo.siteqna.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import com.seoullo.siteqna.mapper.SiteQnaMapper;
import com.seoullo.siteqna.vo.SiteQnaVO;
import com.webjjang.util.PageObject;

import lombok.Setter;

@Service
@Qualifier("siteQnaServiceImpl")
public class SiteQnaServiceImpl implements SiteQnaService{
	
	//service 안에 mapper 있음
		@Setter(onMethod_= @Autowired)
		private SiteQnaMapper mapper;
		
		
		

	@Override
	public List<SiteQnaVO> list(PageObject pageObject) {
		pageObject.setTotalRow(mapper.getTotalRow(pageObject));
		return mapper.list(pageObject);
	}

	//글본기 + 조회수
	@Override
	public SiteQnaVO view(long siteNo, long inc) {
		if(inc==1)
			mapper.increase(siteNo);
		return mapper.view(siteNo);
	}

	@Override
	public Integer write(SiteQnaVO vo) {
		return mapper.write(vo);
	}

	@Override
	public Integer update(SiteQnaVO vo) {
		return mapper.update(vo);
	}

	@Override
	public Long delete(long refNo) {
		return mapper.delete(refNo);
	}
	
	
//답변 작성시 orderNo +1, status='응답'
	@Override
	public Integer answer(SiteQnaVO vo) {
		vo.setOrdNo(vo.getOrdNo()+1);
		vo.setStatus(vo.getStatus());
		//순서번호 1증가
		mapper.increaseOrdNo(vo);
		mapper.statusRefNo(vo);
		
		return mapper.answer(vo);
	}

//	@Override
//	public Integer answerUpdate(SiteQnaVO aVo) {
//		// TODO Auto-generated method stub
//		return mapper.answerUpdate(aVo);
//	}

	@Override
	public Long answerDelete(long siteNo) {
		return mapper.answerDelete(siteNo);
	}

	
 

}
