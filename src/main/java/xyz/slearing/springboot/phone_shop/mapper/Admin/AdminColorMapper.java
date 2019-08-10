package xyz.slearing.springboot.phone_shop.mapper.Admin;

import org.apache.ibatis.annotations.Mapper;
import xyz.slearing.springboot.phone_shop.pojo.Color;
import xyz.slearing.springboot.phone_shop.pojo.Img;

import java.util.List;

/**
 * @Author slearing
 */

@Mapper
public interface AdminColorMapper {
    /*批量插入*/
    int bulkInsert(List<Color> colors);
    /*根据id删除*/
    int deleteById(int id);

    /*根据goodsId删除*/
    int deleteByGoodsId(int goodsId);

    /**根据goodsId查询*/
    List<Color> findByGoodsId(int goodsId);
}
