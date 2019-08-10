package xyz.slearing.springboot.phone_shop.util;

import sun.awt.SunHints;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class FileOperation {
    /*保存文件*/
    public String savaFile(MultipartFile file , String path){
        // 判断文件是否为空
        if (!file.isEmpty()) {
            try {
                File filepath = new File(path);
                if (!filepath.exists()) {
                    filepath.mkdirs();  //创建目录
                }
                // 文件保存路径
                String oldPath = file.getOriginalFilename();    //获得文件原本的文件名
                //拼凑新的文件名加上
                //new Date().getTime()根据时间获得一个数字
                String newPath = new Date().getTime() +oldPath.substring(oldPath.lastIndexOf("."));
                String savePath = path + newPath;

                // 转存文件到savePath目录下
                file.transferTo(new File(savePath));

                return "/file/contentImg/"+newPath;

            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return null;
    }

    /*批量保存文件*/
    public List<String> bulksavaFile(MultipartFile[] files , String path){
        List<String> paths = new ArrayList<String>();

        // 判断文件是否为空
        if (files.length != 0) {
            try {
                File filepath = new File(path);
                if (!filepath.exists()) {
                    filepath.mkdirs();  //创建目录
                }
                for(MultipartFile file : files) {
                    // 文件保存路径
                    String oldPath = file.getOriginalFilename();    //获得文件原本的文件名
                    //拼凑新的文件名加上
                    //new Date().getTime()根据时间获得一个数字
                    String newPath = new Date().getTime() + oldPath.substring(oldPath.lastIndexOf("."));
                    String savePath = path + newPath;

                    // 转存文件到savePath目录下
                    file.transferTo(new File(savePath));

                    paths.add(newPath);
                }

            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return paths;
    }

    /*删除文件*/
    public boolean deleteFile(String path , String imgName){
        final File file = new File(path + imgName);

        return file.delete();
    }

    /*批量删除文件*/
    public boolean bulkDeleteFile(String path , List<String> imgNameList){

        boolean flag = true;
        for (String s : imgNameList) {
            File file = new File(path + s);
            if(!file.delete()){
                flag = false;
                break;
            }
        }

        return flag;
    }
}
