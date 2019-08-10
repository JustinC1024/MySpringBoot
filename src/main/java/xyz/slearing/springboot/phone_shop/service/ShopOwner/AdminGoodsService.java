package xyz.slearing.springboot.phone_shop.service.ShopOwner;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import xyz.slearing.springboot.phone_shop.mapper.Admin.AdminGoodsMapper;
import xyz.slearing.springboot.phone_shop.pojo.Color;
import xyz.slearing.springboot.phone_shop.pojo.Goods;

import java.util.List;


/**
 * @Author slearing
 */
@Service
public class AdminGoodsService {
    @Autowired
    private AdminGoodsMapper adminGoodsMapper;
    @Autowired
    private AdminColorService adminColorService;
    @Autowired
    private AdminImgService adminImgService;


    /*分页查询*/
    public PageInfo<Goods> findByPage(Goods goods , int pageIndex , int pageSize){
        PageHelper.startPage(pageIndex , pageSize);

        Page<Goods> page = adminGoodsMapper.findByPage(goods);
        List<Goods> goodsList = page.getResult();
        /**把所有的颜色集中到第一个元素中**/
        for(Goods g : goodsList){
            StringBuffer buffer = new StringBuffer();
            if(g.getColorList() != null && g.getColorList().size() > 0) {
                for (Color color : g.getColorList()) {
                    buffer.append(color.getName() + " ");
                }
                g.getColorList().get(0).setName(buffer.toString());
            }
        }
        PageInfo<Goods> pageInfo = new PageInfo<Goods>(page);

        return pageInfo;
    }

    /**
     * 插入商品
     * @param goods
     * @param files
     * @param path
     * @param colors
     * @return
     */
    @Transactional(propagation = Propagation.REQUIRED)
    public boolean inserGoods(Goods goods , MultipartFile[] files , String path , String[] colors ){
        boolean flag = false;

        int goodsRowNumber = adminGoodsMapper.insert(goods);
        boolean colorReslut = adminColorService.bulkInsert(colors , goods.getId());
        boolean imgReslut = adminImgService.bulkInsert(files , path , goods.getId());

        if(goodsRowNumber > 0 && colorReslut && imgReslut){
            flag = true;
        }
        return flag;
    }

    /*更新商品信息*/
    @Transactional(propagation = Propagation.REQUIRED)
    public boolean updateGoods(Goods goods , MultipartFile[] files , String path , String[] colors ){
        boolean flag = false;


        int goodsRowNumber = adminGoodsMapper.update(goods);

        if(colors != null && colors.length != 0){
            boolean b = adminColorService.bulkInsert(colors , goods.getId());
            if(b){
                flag = true;
            }else{
                return false;
            }
        }

        if(files != null && files.length != 0){
            boolean b = adminImgService.bulkInsert(files , path , goods.getId());
            if(b){
                flag = true;
            }else{
                return false;
            }
        }

        if(goodsRowNumber > 0){
            flag = true;
        }
        return flag;
    }

    /***
     * 根据goodsId删除商品
     * @param goodsId
     * @return
     */
    @Transactional(propagation = Propagation.REQUIRED)
    public boolean deletGoods(int goodsId){
        boolean flag = false;

        int goodsRowNumber = adminGoodsMapper.delGoods(goodsId);
        adminColorService.deleteByGoodsId(goodsId);
        adminImgService.deleteByGoodsId(goodsId);

        if(goodsRowNumber > 0 ){
            flag = true;
        }
        return flag;
    }

    /***
     * 根据商品id查询商品
     * @param goodsId
     * @return
     */
    public Goods findGoodsById(int goodsId){
        Goods goods = adminGoodsMapper.findGoodsById(goodsId);

        return goods;
    }

}

