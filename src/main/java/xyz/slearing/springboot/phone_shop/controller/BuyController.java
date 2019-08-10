package xyz.slearing.springboot.phone_shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import xyz.slearing.springboot.phone_shop.pojo.Cart;
import xyz.slearing.springboot.phone_shop.pojo.Goods;
import xyz.slearing.springboot.phone_shop.service.CartServiceImpl;
import xyz.slearing.springboot.phone_shop.service.ColorService;
import xyz.slearing.springboot.phone_shop.service.GoodsServiceImpl;
import xyz.slearing.springboot.phone_shop.service.ImgService;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/buy")
public class BuyController {

    @Autowired
    private CartServiceImpl cartService;
    @Autowired
    private GoodsServiceImpl goodsService;
    @Autowired
    private ImgService imgService;
    @Autowired
    private ColorService colorService;

    /*
     * 加入购物车
     * 不带数量
     * 不带颜色
     * */
    @RequestMapping("/addCart")
    @ResponseBody
    public Object addCart(HttpServletRequest request,int goodsId) {
        Goods goods = new Goods();
        goods.setId(goodsId);
        List<Goods> goodsList = goodsService.getGoodById(goods);//查商品
        String color=colorService.getFirstColor(goodsId).getName();//查颜色
        return addBase(goodsList.get(0), request, color, 1);
    }

    /*
     * 加入购物车
     * 不带颜色
     * */
    @RequestMapping("/addCartWithNum")
    @ResponseBody
    public Object addCartWithNum(HttpServletRequest request,int goodsId,int goodsCount) {
        Goods goods = new Goods();
        goods.setId(goodsId);
        List<Goods> goodsList = goodsService.getGoodById(goods);//查商品
        String color=imgService.getFirstImgByGoods(goodsId).getName();//查颜色
        return addBase(goodsList.get(0), request, color, goodsCount);
    }

    /*
     * 加入购物车
     * */
    @RequestMapping("/addCartWithColor")
    @ResponseBody
    public Object addCartWithColor(HttpServletRequest request,int goodsId, String goodsColor,int goodsCount) {
        Goods goods = new Goods();
        goods.setId(goodsId);
        List<Goods> goodsList = goodsService.getGoodById(goods);
        return addBase(goodsList.get(0), request, goodsColor, goodsCount);
    }

    /*
     * 加入购物车
     * 基本
     * */
    public boolean addBase(Goods goods, HttpServletRequest request, String color, int numGoods) {
        String userName = (String) request.getSession().getAttribute("username");
        String gid = goods.getId() + "";
        String img = imgService.getFirstImgByGoods(goods.getId()).getName();
        String name = goods.getName();
        double pri = goods.getPrice() * numGoods;
        String price = pri + "";
        String num = numGoods + "";
        Cart cart = new Cart();
        cart.setGid(gid);
        cart.setImg(img);
        cart.setName(name);
        cart.setType(color);
        cart.setUserName(userName);
        cart.setPrice(Double.parseDouble(price));
        if (num != null && userName != null) {
            cart.setNum(Integer.parseInt(num));
        } else {
            return false;
        }
        List<Cart> list = cartService.getCartByGid(cart);
        if (list == null || list.size() < 1) {
            int result1 = cartService.insert(cart);
            if (result1 >= 1) {
                return true;
            }
        } else {
            for (Cart cart2 : list) {
                int num1 = cart2.getNum() + cart.getNum();
                cart.setNum(num1);
                int result = cartService.update(cart);
                if (result >= 1) {
                    return true;
                }
            }
        }
        return true;
    }

}
