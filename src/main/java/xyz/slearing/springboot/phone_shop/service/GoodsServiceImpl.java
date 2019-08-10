package xyz.slearing.springboot.phone_shop.service;

import java.util.List;

import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xyz.slearing.springboot.phone_shop.mapper.GoodsMapper;
import xyz.slearing.springboot.phone_shop.pojo.Goods;


@Service
public class GoodsServiceImpl {
	
	@Autowired
	private GoodsMapper goodsMapper;
	
	public List<Goods> getGoodById(Goods goods) {
		return goodsMapper.getGoodById(goods);
	}

	public List<Goods> getAll(int nowPage) {
		PageHelper.startPage(nowPage,9);
		return goodsMapper.getAll();
	}

	public List<Goods> getGoodByName(String goods,int nowPage) {
		PageHelper.startPage(nowPage,9);
		return goodsMapper.getGoodByName(goods);
	}

	public int delete(Goods goods) {
		return goodsMapper.delete(goods);
	}

	public int update(Goods goods) {
		return goodsMapper.update(goods);
	}

	public int insert(Goods goods) {
		return goodsMapper.insert(goods);
	}

	public List<Goods> getFiveAll() {
		return goodsMapper.getFiveAll();
	}//查询最后五条数据

	public List<Goods> getSixByOwner(int ownerId) {
		return goodsMapper.getSixByOwner(ownerId);
	}//根据产家查询六条数据

	public int getGoodsCountByName(String goods){
		return goodsMapper.getGoodsCountByName(goods);
	};//根据name查询出符合数据的数量

	public int getGoodsCount(){
		return goodsMapper.getGoodsCount();
	};//查询表中数据总数

}
