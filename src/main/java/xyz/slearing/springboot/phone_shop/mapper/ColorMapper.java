package xyz.slearing.springboot.phone_shop.mapper;


import org.apache.ibatis.annotations.Mapper;
import xyz.slearing.springboot.phone_shop.pojo.Color;

import java.util.List;

/*
*颜色mapper
* */
@Mapper
public interface ColorMapper {

    public int insert(Color color);//增加
    public int delete(int goodsId);//根据goodsId删除
    public List<Color> getColorByGoods(int goodsId);//根据goodsId查询

    /*批量插入*/
    int bulkInsert(List<Color> colors);

    public Color getFristColorByGoods(int goodsId);//根据goodsIdn查询第一条
}
