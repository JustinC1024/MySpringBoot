package xyz.slearing.springboot.phone_shop.controller.ShopOwner;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import xyz.slearing.springboot.phone_shop.service.ShopOwner.AdminImgService;
import xyz.slearing.springboot.phone_shop.util.FileOperation;
import xyz.slearing.springboot.phone_shop.util.UploadImgResult;

import javax.servlet.http.HttpServletRequest;

/**
 * @Author slearing
 */
@Controller
@RequestMapping("/adminPicture")
public class AdminImgController {
    @Autowired
    private AdminImgService adminImgService;

    /**
     * 根据name删除照片
     * @param imgName
     * @return
     */
    @ResponseBody
    @RequestMapping("/deletPicture")
    public String deleteById(String imgName  ,HttpServletRequest request){

         String message = "0";
         String path = request.getSession().getServletContext().getRealPath("/file/goodsImg/");
         Boolean flag = adminImgService.deleteById(path , imgName);

         if(flag){
            message = "1";
         }

         return message;
    }


    /**
     * 富文本编辑器中上传单张图片
     * @param contentImg
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping("/uploadImg")
    public UploadImgResult uploadImg(MultipartFile contentImg , HttpServletRequest request){
        //获取上传文件的路径
        String path = request.getSession().getServletContext().getRealPath("/file/contentImg/");

        UploadImgResult result = adminImgService.insert(contentImg, path);
        System.out.println(result.toString());

        if(result.getData() != null){
            result.setErrno(0);
        }

        return result;
    }
}
