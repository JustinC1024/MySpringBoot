package xyz.slearing.springboot.phone_shop.mapper;


import org.apache.ibatis.annotations.Mapper;
import xyz.slearing.springboot.phone_shop.pojo.Goods;

import java.util.List;
@Mapper
public interface GoodsMapper {

	public List<Goods> getGoodById(Goods goods);

	public List<Goods> getAll();

	public List<Goods> getGoodByName(String goods);

	public int delete(Goods goods);

	public int update(Goods goods);

	public int insert(Goods goods);

	public List<Goods> getFiveAll();//查询最新五条数据

	public List<Goods> getSixByOwner(int ownerId);//根据产家查询六条数据

	public int getGoodsCountByName(String goods);//根据name查询出符合数据的数量

	 public int getGoodsCount();//查询表中数据总数
}
