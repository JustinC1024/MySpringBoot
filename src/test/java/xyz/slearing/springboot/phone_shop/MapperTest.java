package xyz.slearing.springboot.phone_shop;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import xyz.slearing.springboot.phone_shop.mapper.*;
import xyz.slearing.springboot.phone_shop.pojo.Appraise;
import xyz.slearing.springboot.phone_shop.pojo.Color;
import xyz.slearing.springboot.phone_shop.pojo.Goods;
import xyz.slearing.springboot.phone_shop.pojo.Img;

import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
@WebAppConfiguration
public class MapperTest {

    @Autowired
    private GoodsMapper goodsMapper;
    @Autowired
    private ImgMapper imgMapper;

    @Test
    public void test1(){
        List<Goods> goodsList=goodsMapper.getAll();
        for (Goods goods:goodsList){
            System.out.println(goods.getName());
        }
    }

    @Test
    public void test2(){
        List<Goods> goodsList=goodsMapper.getFiveAll();
        for (Goods goods:goodsList){
            System.out.println(goods.getName());
        }
    }

    @Test
    public void test3(){
        Goods goods=new Goods();
        goods.setId(10119);
        List<Goods> goodsList=goodsMapper.getGoodById(goods);
        for (Goods g:goodsList){
            System.out.println(g.getName());
        }
    }

    @Test
    public void test4(){
        imgMapper.getFirstImgByGoods(10119);
        System.out.println(
                imgMapper.getFirstImgByGoods(10119)
        );
    }

    @Test
    public void test5(){
        List<Img> imgList=imgMapper.getAll();
        for (Img i:imgList){
            System.out.println(i.getName());
        }
    }

    @Autowired
    private ColorMapper colorMapper;

    @Test
    public void test6(){
        List<Color> colorList=colorMapper.getColorByGoods(10119);
    }

    @Test
    public void test7(){
        List<Goods> goodsList=goodsMapper.getGoodByName("i");
        for (Goods g:goodsList){
            System.out.println(g.getName());
        }
    }

    @Autowired
    private GoodsOrderMapper goodsOrderMapper;

    @Test
    public void test8(){
        goodsOrderMapper.getOrderByUser(1);
    }


}
