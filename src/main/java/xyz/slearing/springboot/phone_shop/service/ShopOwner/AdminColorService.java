package xyz.slearing.springboot.phone_shop.service.ShopOwner;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import xyz.slearing.springboot.phone_shop.mapper.Admin.AdminColorMapper;
import xyz.slearing.springboot.phone_shop.pojo.Color;
import xyz.slearing.springboot.phone_shop.pojo.Img;
import xyz.slearing.springboot.phone_shop.util.FileOperation;

import java.util.ArrayList;
import java.util.List;

/**
 * 对颜色操作的service
 * @Author slearing
 */
@Service
public class AdminColorService {
    @Autowired
    private AdminColorMapper adminColorMapper;

    /*批量插入颜色*/
    public Boolean bulkInsert(String[] list , int goodsId){
       List<Color> colors = new ArrayList<Color>();

       if(list == null){
           return true;
       }

       for(String str : list){
           colors.add(new Color(-1 , str , goodsId));
       }
        int rowNum = adminColorMapper.bulkInsert(colors);

        if(rowNum > 0){
            return true;
        }

        return false;
    }


    /*根据id删除颜色*/
    public Boolean deleteById(int id){
        int rowNum = adminColorMapper.deleteById(id);

        if(rowNum > 0){
            return true;
        }

        return false;
    }

    /*根据goodsId删除颜色*/
    public Boolean deleteByGoodsId(int goodsId){
        int rowNum = adminColorMapper.deleteByGoodsId(goodsId);

        if(rowNum > 0){
            return true;
        }
        return false;
    }
}
