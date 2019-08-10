package xyz.slearing.springboot.phone_shop.mapper.Admin;

import org.apache.ibatis.annotations.Mapper;
import xyz.slearing.springboot.phone_shop.pojo.ShopOwner;

/**
 * @Author slearing
 */
@Mapper
public interface ShopOwnerMapper {

    /**
     * 店家登录
     * @param shopOwner
     * @return
     */
    ShopOwner selectByNameAndPass(ShopOwner shopOwner);

    /**
     * 根据id查询店家信息
     * @param id
     * @return
     */
    ShopOwner findOwnerById(int id);

    /***
     * 更新店家信息
     * @param shopOwner
     * @return
     */
    int updateOwnerInfo(ShopOwner shopOwner);
}
