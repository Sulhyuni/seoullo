package com.seoullo.anonymous.mapper;

import java.util.List;
import java.util.Map;

import com.seoullo.anonymous.vo.AnonyReplyVO;

public interface AnonyReplyMapper {
	
	//DB 구체적으로 작성
	
	//댓 리스트 no, pageObject - Map을 사용하는게 좋다.
	public List<AnonyReplyVO> list(Map<String, Object> map);
	public Long getTotalRow(Map<String, Object> map);

	public int write(AnonyReplyVO vo);
	
	public int update(AnonyReplyVO vo);
	
	public int delete(Long rno);

}
