package com.seoullo.book.service;

import java.util.List;

import com.seoullo.book.vo.BookDetailVO;
import com.seoullo.book.vo.BookVO;
import com.seoullo.book.vo.GuideVO;
import com.webjjang.util.PageObject;

public interface BookService {

	public List<BookVO> list(PageObject pageObject);
	
	public List<BookVO> perList(PageObject pageObject, String id);
	
	public List<GuideVO> guideList(long tourNo);	
	
	public BookVO view(long no);
	
	public int book(BookVO vo);
	
	public int cancel(BookDetailVO vo);
	
	public int tourComplete(long nos);
	
	public int bookInfoUpdate(BookVO vo);
}
