package com.seoullo.cart.service;

import java.util.List;

import com.seoullo.cart.vo.CartVO;

public interface CartService {
	
	public List<CartVO> list(String id);
	
	public List<CartVO> orderList(List<Long> nos);
	
	public int add(CartVO vo);
	
	public int update(CartVO vo);
	
	public int delete(List<Long> nos);

}
