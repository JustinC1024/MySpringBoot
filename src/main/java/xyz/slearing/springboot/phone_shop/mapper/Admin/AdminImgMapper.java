package xyz.slearing.springboot.phone_shop.mapper.Admin;

import org.apache.ibatis.annotations.Mapper;
import xyz.slearing.springboot.phone_shop.pojo.Img;

import java.util.List;

/**
 * @Author slearing
 */
@Mapper
public interface AdminImgMapper {
    /*批量插入*/
    int bulkInsert(List<Img> imgs);
    /*根据name删除*/
    int deleteById(String imgName);

    /*根据goodsId删除*/
    int deleteByGoodsId(int goodsId);

    /**根据goodsId查询*/
    List<Img> findByGoodsId(int goodsId);
}
