package com.seoullo.notice.mapper;

import java.util.List;

import com.seoullo.notice.vo.NoticeVO;
import com.webjjang.util.PageObject;


public interface NoticeMapper {
	
	public List<NoticeVO>list(PageObject pageObject);
	public long getTotalRow(PageObject pageObject);
	public NoticeVO view(long no);
	public int increase(long no);
	public int write(NoticeVO vo);
	public int update(NoticeVO vo);
	public int delete(long no);

}
