package xyz.slearing.springboot.phone_shop.mapper;

import org.apache.ibatis.annotations.Mapper;
import xyz.slearing.springboot.phone_shop.pojo.Appraise;

import java.util.List;

/*
*
* */
@Mapper
public interface AppraiseMapper {

    public int insert(Appraise appraise);
    public int delete(int goodsId);
    public List<Appraise> getAppraiseByGoods(int goodsId);

}
