package xyz.slearing.springboot.phone_shop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xyz.slearing.springboot.phone_shop.mapper.ShopMapper;
import xyz.slearing.springboot.phone_shop.pojo.ShopOwner;

@Service
public class ShopService {

    @Autowired
    private ShopMapper shopMapper;

    public ShopOwner getShopOwnerById(int id){
        return shopMapper.getShopOwnerById(id);
    }//根据id查询

}
