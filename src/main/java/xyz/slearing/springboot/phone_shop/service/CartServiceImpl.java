package xyz.slearing.springboot.phone_shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import xyz.slearing.springboot.phone_shop.mapper.CartMapper;
import xyz.slearing.springboot.phone_shop.pojo.Cart;
@Service
public class CartServiceImpl{
	
	@Autowired
	private CartMapper cartMapper;

	public int insert(Cart cart) {
		return cartMapper.insert(cart);
	}

	public int delete(Cart cart) {
		return cartMapper.delete(cart);
	}

	public int update(Cart cart) { 
		return cartMapper.update(cart);
	}

	public List<Cart> getAll(Cart cart) {
		return cartMapper.getAll(cart);
	}

	public List<Cart> getCartByGid(Cart cart) {
		return cartMapper.getCartByGid(cart);
	}

	public int deleteByUser(String username){
		return cartMapper.deleteByUser(username);
	}//根据gid删除


}
