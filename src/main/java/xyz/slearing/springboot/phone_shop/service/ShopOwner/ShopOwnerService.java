package xyz.slearing.springboot.phone_shop.service.ShopOwner;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xyz.slearing.springboot.phone_shop.mapper.Admin.ShopOwnerMapper;
import xyz.slearing.springboot.phone_shop.pojo.ShopOwner;


/**
 * @Author slearing
 */
@Service
public class ShopOwnerService {
    @Autowired
    private ShopOwnerMapper mapper;

    /**
     * 店家登录
     * @param shopOwner
     * @return
     */
    public ShopOwner login(ShopOwner shopOwner){
        ShopOwner reslut = mapper.selectByNameAndPass(shopOwner);

        return reslut;
    }


    /***
     * 根据id查询店家信息
     * @param id
     * @return
     */
    public ShopOwner findOwnerById(int id){
        if(id < 0){
            return null;
        }

        ShopOwner shopOwner = mapper.findOwnerById(id);

        return shopOwner;

    }


    /**
     * 更新店家信息
     * @param shopOwner
     * @return
     */
    public boolean updateOwnerInfo(ShopOwner shopOwner){
        if(shopOwner == null || shopOwner.getId() == null || shopOwner.getId() < 0){
            return false;
        }

        int rowNum = mapper.updateOwnerInfo(shopOwner);

        if(rowNum != 0){
            return true;
        }

        return false;
    }
}
