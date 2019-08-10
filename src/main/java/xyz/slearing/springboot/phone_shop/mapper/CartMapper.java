package xyz.slearing.springboot.phone_shop.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import xyz.slearing.springboot.phone_shop.pojo.Cart;
@Mapper
public interface CartMapper {
	
	public int insert(Cart cart);

	public int delete(Cart cart);

	public int update(Cart cart);

	public List<Cart> getAll(Cart cart);

	public List<Cart> getCartByGid(Cart cart);

	public int deleteByUser(String username);//根据user删除

}
