package xyz.slearing.springboot.phone_shop.controller.ShopOwner;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import xyz.slearing.springboot.phone_shop.service.ShopOwner.AdminColorService;
import xyz.slearing.springboot.phone_shop.service.ShopOwner.AdminImgService;

/**
 * @Author slearing
 */
@Controller
@RequestMapping("/adminColor")
public class AdminColorController {
    @Autowired
    private AdminColorService adminColorService;

    /**
     * 根据id删除颜色
     * @param id
     * @return
     */
    @ResponseBody
    @DeleteMapping("/color/{id}")
    public String deleteById(@PathVariable("id") int id){
         String message = "0";  //0 删除失败

         Boolean flag = adminColorService.deleteById(id);

         if(flag){
            message = "1";
         }

         return message;
    }
}
