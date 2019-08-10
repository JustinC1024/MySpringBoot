package xyz.slearing.springboot.phone_shop.mapper.Admin;

import com.github.pagehelper.Page;
import org.apache.ibatis.annotations.Mapper;
import xyz.slearing.springboot.phone_shop.pojo.Goods;

/**
 * @Author slearing
 */
@Mapper
public interface AdminGoodsMapper {
    /**
     * 分页查询
     * @param goods
     * @return
     */
    Page<Goods> findByPage(Goods goods);

    /**
     * 删除商品
     */
    int delGoods(int id);

    /**
     * 更新商品
     * @param goods
     * @return
     */
    int update(Goods goods);

    /**
     * 增加商品
     * @return
     */
    int insert(Goods goods);

    /**
    * 根据id查询商品*/
    Goods findGoodsById(int goodsId);
    
}
