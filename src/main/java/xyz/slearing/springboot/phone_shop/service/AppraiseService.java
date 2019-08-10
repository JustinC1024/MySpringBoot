package xyz.slearing.springboot.phone_shop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xyz.slearing.springboot.phone_shop.mapper.AppraiseMapper;
import xyz.slearing.springboot.phone_shop.pojo.Appraise;

import java.util.List;

@Service
public class AppraiseService {

    @Autowired
    private AppraiseMapper appraiseMapper;

    public List<Appraise> getAppraiseByGoods(int goodsId){return appraiseMapper.getAppraiseByGoods(goodsId);}

}
