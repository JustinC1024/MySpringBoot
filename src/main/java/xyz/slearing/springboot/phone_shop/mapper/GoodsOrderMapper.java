package xyz.slearing.springboot.phone_shop.mapper;

import org.apache.ibatis.annotations.Mapper;
import xyz.slearing.springboot.phone_shop.pojo.GoodsOrder;

import java.util.List;

@Mapper
public interface GoodsOrderMapper {

    public int addOrder(GoodsOrder order);//增加order数据

    public int deleteOrder(int id);//根据id删除order数据

    public int updateOrder(GoodsOrder order);//根据id更新order数据

    public List<GoodsOrder> getOrderByUser(int user);//根据用户查询order数据

}
