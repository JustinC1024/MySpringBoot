package xyz.slearing.springboot.phone_shop.mapper;

import org.apache.ibatis.annotations.Mapper;
import xyz.slearing.springboot.phone_shop.pojo.Img;

import java.util.List;

/*
* 图片mapper
* */
@Mapper
public interface ImgMapper {

    public int insert(Img img);//增加
    public int delete(int goodsId);//根据goodsId删除
    public List<Img> getImgByGoods(int goodsId);//根据goodsId查询
    public Img getFirstImgByGoods(int goodsId);//根据goodsId查询第一条数据

    public List<Img> getAll();


}
