package com.seoullo.event.mapper;

import java.util.List;

import com.seoullo.event.vo.ApplyEventVO;
import com.seoullo.event.vo.EventVO;
import com.seoullo.event.vo.ImgfileVO;
import com.webjjang.util.PageObject;

public interface EventMapper {
	
	public List<EventVO>list(PageObject pageObject);
	public List<EventVO>list2(PageObject pageObject);
	public long getTotalRow(PageObject pageObject);
	
	public EventVO view(long no);
	public int increase(long no);
	public List<ImgfileVO>viewFile(long no);
	public int apply2(ApplyEventVO vo);
	
	public int write(EventVO vo);
	public int writeFile(ImgfileVO vo);
	
	public int update(EventVO vo);
	public int updateFile(ImgfileVO vo);
	public int mainDel(long no);
	public int main(long mno);
	
	
	public int delete(long no);
	public int deleteFile(long mno);

}
