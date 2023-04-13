package com.seoullo.event.service;

import java.util.List;

import com.seoullo.event.vo.ApplyEventVO;
import com.seoullo.event.vo.EventVO;
import com.seoullo.event.vo.ImgfileVO;
import com.webjjang.util.PageObject;

public interface EventService {
	
	public List<EventVO>list(PageObject pageObject);
	public List<EventVO>list2(PageObject pageObject);
	
	public EventVO view(long no,int inc);
	public List<ImgfileVO>viewFile(long no);
	public int apply2(ApplyEventVO vo);

	public int write(EventVO vo,List<ImgfileVO> list);
	
	public int update(EventVO vo);
	public int updateFile(ImgfileVO vo);
	public int main(long no,long mno);
	
	
	public int delete(long no);
	public int deleteFile(long mno);

}
