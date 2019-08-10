package xyz.slearing.springboot.phone_shop;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import xyz.slearing.springboot.phone_shop.pojo.Appraise;
import xyz.slearing.springboot.phone_shop.pojo.Color;
import xyz.slearing.springboot.phone_shop.pojo.Goods;
import xyz.slearing.springboot.phone_shop.pojo.Img;
import xyz.slearing.springboot.phone_shop.service.AppraiseService;
import xyz.slearing.springboot.phone_shop.service.ColorService;
import xyz.slearing.springboot.phone_shop.service.GoodsServiceImpl;
import xyz.slearing.springboot.phone_shop.service.ImgService;

import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
@WebAppConfiguration
public class ServiceTest {
    @Autowired
    private GoodsServiceImpl goodsService;
    @Autowired
    private ImgService imgService;
    @Autowired
    private AppraiseService appraiseService;
    @Autowired
    private ColorService colorService;

    @Test
    public void test(){
        int gid=10119;
        Goods goods=new Goods();
        goods.setId(gid);
        List<Goods> goodsList=goodsService.getGoodById(goods);
        List<Img> imgList=imgService.getImgByGoods(gid);
        //List<Appraise> appraiseList= appraiseService.getAppraiseByGoods(gid);
        //List<Color> colorList=colorService.getColorByGoods(gid);
    }
}
