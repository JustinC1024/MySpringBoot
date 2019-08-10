package xyz.slearing.springboot.phone_shop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xyz.slearing.springboot.phone_shop.mapper.ColorMapper;
import xyz.slearing.springboot.phone_shop.pojo.Color;

import java.util.List;

@Service
public class ColorService {

    @Autowired
    private ColorMapper colorMapper;

    public List<Color> getColorByGoods(int goodsId){return colorMapper.getColorByGoods(goodsId);}//根据goodsId查询

    public Color getFirstColor(int goodsId){
        return colorMapper.getFristColorByGoods(goodsId);
    }//根据goodsId查询第一条

}
