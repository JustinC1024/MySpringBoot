package xyz.slearing.springboot.phone_shop.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import xyz.slearing.springboot.phone_shop.pojo.User;
@Mapper
public interface UserMapper {
	
	public int insert(User user);

	public int update(User user);

	public int delete(User user);

	public List<User> getAll(); // 查询全部

	public User findUser(User user);// 用于登陆判断

	public List<User> getUserByName(String user);

}
