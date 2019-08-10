package xyz.slearing.springboot.phone_shop.service;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;
import xyz.slearing.springboot.phone_shop.mapper.GoodsOrderMapper;
import xyz.slearing.springboot.phone_shop.pojo.GoodsOrder;

import java.util.List;

@Service
public class GoodsOrderService {

    @Autowired
    private GoodsOrderMapper goodsOrderMapper;

    public int addOrder(GoodsOrder goodsOrder){
        return goodsOrderMapper.addOrder(goodsOrder);
    }//增加order数据

    public int deleteOrder(int id){
        return goodsOrderMapper.deleteOrder(id);
    };//根据id删除order数据

    public int updateOrder(GoodsOrder goodsOrder){
        return goodsOrderMapper.updateOrder(goodsOrder);
    };//根据id更新order数据

    public List<GoodsOrder> getOrderByUser(int user){
        return goodsOrderMapper.getOrderByUser(user);
    };//根据用户查询order数据
}
