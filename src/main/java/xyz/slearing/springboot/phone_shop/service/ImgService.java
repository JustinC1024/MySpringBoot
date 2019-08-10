package xyz.slearing.springboot.phone_shop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xyz.slearing.springboot.phone_shop.mapper.ImgMapper;
import xyz.slearing.springboot.phone_shop.pojo.Img;

import java.util.List;

@Service
public class ImgService {

    @Autowired
    private ImgMapper imgMapper;

    public Img getFirstImgByGoods(int goodsId){return imgMapper.getFirstImgByGoods(goodsId);}//根据goodsId查询第一条数据

    public List<Img> getImgByGoods(int goodsId){return imgMapper.getImgByGoods(goodsId);}//根据goodsId查询所有数据
}
