package xyz.slearing.springboot.phone_shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import xyz.slearing.springboot.phone_shop.pojo.Cart;
import xyz.slearing.springboot.phone_shop.pojo.GoodsOrder;
import xyz.slearing.springboot.phone_shop.service.CartServiceImpl;
import xyz.slearing.springboot.phone_shop.service.GoodsOrderService;
import xyz.slearing.springboot.phone_shop.util.ParsingCookies;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/order")
public class OrderController {

    @Autowired
    private GoodsOrderService goodsOrderService;
    @Autowired
    private CartServiceImpl cartService;

    /*
    * 查看订单
    * */
    @RequestMapping("/list")
    public String list(HttpServletRequest request){
        List<GoodsOrder> goodsOrderList=goodsOrderService.getOrderByUser(ParsingCookies.getId(request.getCookies()));//查订单
        request.getSession().setAttribute("golist",goodsOrderList);
        return "order";
    }


    /*
    * 订单提交
    * */
    @RequestMapping("/addOrder")
    public Object addOrder(HttpServletRequest request,GoodsOrder goodsOrder){
        Cart cart = new Cart();
        cart.setUserName(ParsingCookies.getName(request.getCookies()));
        List<Cart> cartList = cartService.getAll(cart);//查cart
        cartService.deleteByUser(ParsingCookies.getName(request.getCookies()));// 删除cart
        for (Cart c : cartList) {
            goodsOrder.setGoodsId(Integer.parseInt(c.getGid()));
            goodsOrder.setImg(c.getImg());
            goodsOrder.setName(c.getName());
            goodsOrder.setType(c.getType());
            goodsOrder.setPrice(c.getPrice());
            goodsOrder.setNum(c.getNum());
            goodsOrder.setUserId(ParsingCookies.getId(request.getCookies()));
            goodsOrderService.addOrder(goodsOrder);//插入order
        }

        /*
         * CartController
         * */
        Cart cart1 = new Cart();
        String userName = (String) request.getSession().getAttribute("username");
        cart1.setUserName(userName);
        List<Cart> list2 = cartService.getAll(cart1);
        double total = 0;
        for (Cart cart2 : list2) {
            total += cart2.getPrice() * cart2.getNum();
        }
        request.getSession().setAttribute("total", total);
        request.getSession().setAttribute("list2", list2);

        return "redirect:/order/list";
    }


    /*
    *退订
    * */
    @RequestMapping("/deleteOrder/{id}")
    public Object deleteOrder(HttpServletRequest request,@PathVariable int id){
        int flag=goodsOrderService.deleteOrder(id);//删除order
        if (flag>0){
            return "redirect:/order/list";
        }else {
            return "redirect:/order/list";
        }
    }

}
