package com.seoullo.anonymous.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.seoullo.anonymous.mapper.AnonyReplyMapper;
import com.seoullo.anonymous.vo.AnonyReplyVO;
import com.webjjang.util.PageObject;

import lombok.Setter;


@Service
@Qualifier("anonyReplyServiceImpl")
public class AnonyReplyServiceImpl implements AnonyReplyService{
	
	@Setter(onMethod_= @Autowired)
	private AnonyReplyMapper mapper;

	@Override
	public List<AnonyReplyVO> list(PageObject pageObject, long anonyNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("anonyNo", anonyNo);
		map.put("pageObject", pageObject);
		pageObject.setTotalRow(mapper.getTotalRow(map));
		return mapper.list(map);
	}

	@Override
	public int write(AnonyReplyVO vo) {
		// TODO Auto-generated method stub
		return mapper.write(vo);
	}

	@Override
	public int update(AnonyReplyVO vo) {
		// TODO Auto-generated method stub
		return mapper.update(vo);
	}

	@Override
	public int delete(Long rno) {
		// TODO Auto-generated method stub
		return mapper.delete(rno);
	}
	
	
 

}
