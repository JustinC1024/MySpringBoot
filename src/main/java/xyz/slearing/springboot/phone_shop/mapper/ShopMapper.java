package xyz.slearing.springboot.phone_shop.mapper;

import org.apache.ibatis.annotations.Mapper;
import xyz.slearing.springboot.phone_shop.pojo.ShopOwner;
/*
* 产家mapper
* */
@Mapper
public interface ShopMapper {

    public ShopOwner getShopOwnerById(int id);//根据id查询数据

}
