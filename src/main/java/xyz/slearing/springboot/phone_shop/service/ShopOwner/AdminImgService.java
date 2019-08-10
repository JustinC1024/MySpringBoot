package xyz.slearing.springboot.phone_shop.service.ShopOwner;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import xyz.slearing.springboot.phone_shop.mapper.Admin.AdminImgMapper;
import xyz.slearing.springboot.phone_shop.pojo.Img;
import xyz.slearing.springboot.phone_shop.util.FileOperation;
import xyz.slearing.springboot.phone_shop.util.UploadImgResult;

import java.util.ArrayList;
import java.util.List;

/**
 * @Author slearing
 */
@Service
public class AdminImgService {
    @Autowired
    private AdminImgMapper adminImgMapper;

    /*批量插入图片*/
    public Boolean bulkInsert(MultipartFile[] imgs , String fileSavePath , int goodsId){
        if(imgs == null || imgs.length == 0){
            return true;
        }

        /**保存文件**/
        FileOperation fileOperation = new FileOperation();
        List<String> paths = fileOperation.bulksavaFile(imgs , fileSavePath);

        List<Img> imgList = new ArrayList<>();

        for(String path : paths){
            imgList.add(new Img(-1 , path , goodsId));
        }

        int rowNum = adminImgMapper.bulkInsert(imgList);

        if(rowNum > 0){
            return true;
        }

        return false;
    }

    /*插入单张图片*/
    public UploadImgResult insert(MultipartFile img , String fileSavePath ){
        UploadImgResult uploadImgResult = new UploadImgResult();
        /**保存文件**/
        FileOperation fileOperation = new FileOperation();
        String path = fileOperation.savaFile(img , fileSavePath);

        if(path != null ){
            uploadImgResult.setErrno(0);
            uploadImgResult.setData(new String[]{path});
        }

        return uploadImgResult;
    }

    /*根据name删除图片*/
    public Boolean deleteById(String path , String name){
        /*删除图片在数据库中的记录*/

        int rowNum = adminImgMapper.deleteById(name);

        if(rowNum > 0 ){
            //删除图片
            boolean b = new FileOperation().deleteFile(path, name);
            if(!b){
                return false;
            }
            return true;
        }
        return false;
    }


    /*根据goodsId删除图片*/
    public Boolean deleteByGoodsId(int goodsId){
        int rowNum = adminImgMapper.deleteByGoodsId(goodsId);

        if(rowNum > 0){
            return true;
        }

        return false;
    }
}
