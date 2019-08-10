package xyz.slearing.springboot.phone_shop.controller;

import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import xyz.slearing.springboot.phone_shop.pojo.*;
import xyz.slearing.springboot.phone_shop.service.*;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/client")
public class ClientController {

    @Autowired
    private GoodsServiceImpl goodsService;
    @Autowired
    private ImgService imgService;
    @Autowired
    private AppraiseService appraiseService;
    @Autowired
    private ColorService colorService;
    @Autowired
    private ShopService shopService;
    @Autowired
    private UserServiceImpl userService;
    @Autowired
    private CartServiceImpl cartService;


    /*
    * 主页
    * */
    @RequestMapping("/index")
    public String index(HttpServletRequest request){
        List<Goods> goodsList=goodsService.getFiveAll();//查询商品
        List<Img> imgList=new ArrayList<Img>();
//        List<ShopOwner> shopOwnerList=new ArrayList<ShopOwner>();
        for (Goods g:goodsList){
            imgList.add(imgService.getFirstImgByGoods(g.getId()));//对应商品的图片
//            shopOwnerList.add(shopService.getShopOwnerById(g.getOwnerId()));//对应商品的产家
        }
//        List<Map<Img,Goods>> newList=searchImg(goodsList);
        request.setAttribute("glist",goodsList);
//        request.setAttribute("nlist",newList);
        request.setAttribute("ilist",imgList);
//        request.setAttribute("slist",shopOwnerList);

        /*
         * CartController
         * */
        Cart cart = new Cart();
        String userName = (String) request.getSession().getAttribute("username");
        cart.setUserName(userName);
        List<Cart> list2 = cartService.getAll(cart);
        double total = 0;
        for (Cart cart2 : list2) {
            total += cart2.getPrice() * cart2.getNum();
        }
        request.getSession().setAttribute("total", total);
        request.getSession().setAttribute("list2", list2);

        return "moban3157/index";
    }

    @RequestMapping("/ImgJson")
    @ResponseBody
    public Object ImgJson(int id){
        Object img=imgService.getFirstImgByGoods(id);
        return img;
    }

    /*
    * 进入商品详情页
    * */
    @RequestMapping("/detail/{gid}")
    public String detail(HttpServletRequest request,@PathVariable int gid){
        Goods goods=new Goods();
        goods.setId(gid);
        List<Goods> goodsList=goodsService.getGoodById(goods);//根据id查询商品
        List<Img> imgList=imgService.getImgByGoods(gid);//查询对应的图片
        List<Appraise> appraiseList= appraiseService.getAppraiseByGoods(gid);//查询对应的评价
        List<Color> colorList=colorService.getColorByGoods(gid);//查询对应的颜色
        List<ShopOwner> shopOwnerList=new ArrayList<ShopOwner>();
        List<Img> imgList1=new ArrayList<Img>();
        List<Goods> goodsList1=new ArrayList<Goods>();
        for (Goods g:goodsList){
            shopOwnerList.add(shopService.getShopOwnerById(g.getOwnerId()));//对应商品的产家
            goodsList1=goodsService.getSixByOwner(g.getOwnerId());//同一家的产品
        }
        for(Goods g:goodsList1){
            imgList1.add(imgService.getFirstImgByGoods(g.getId()));//对应商品的图片
        }
        List<User> userList=userService.getAll();

        request.setAttribute("ulist",userList);
        request.setAttribute("filist",imgList1);
        request.setAttribute("gslist",goodsList1);
        request.setAttribute("slist",shopOwnerList);
        request.setAttribute("glist",goodsList);
        request.setAttribute("ilist",imgList);
        request.setAttribute("alist",appraiseList);
        request.setAttribute("clist",colorList);

        /*
        * CartController
        * */
        Cart cart = new Cart();
        String userName = (String) request.getSession().getAttribute("username");
        cart.setUserName(userName);
        List<Cart> list2 = cartService.getAll(cart);
        double total = 0;
        for (Cart cart2 : list2) {
            total += cart2.getPrice() * cart2.getNum();
        }
        request.getSession().setAttribute("total", total);
        request.getSession().setAttribute("list2", list2);

        return "moban3157/detail";
    }

    /*
    * 搜索框功能
    * */
    @RequestMapping("/search")
    public String search(HttpServletRequest request, String key) {
        List<Goods> goodsList = new ArrayList<Goods>();
        int totalp;
        if("".equals(key)||key==null){
            goodsList=goodsService.getAll(1);//查询所有
            totalp=goodsService.getGoodsCount();//统计
        }else {
            goodsList = goodsService.getGoodByName(key,1);//模糊查询
            totalp=goodsService.getGoodsCountByName(key);//统计
        }

        List<Img> imgList = new ArrayList<Img>();
        for (Goods g : goodsList) {
            imgList.add(imgService.getFirstImgByGoods(g.getId()));//对应商品的图片
        }

        int y=(totalp%9==0)?(totalp/9):(totalp/9+1);
        int []x=new int[y];
        for (int i=1;i<=y;i++){
            x[i-1]=i;
        }
        request.setAttribute("page",x);
        request.setAttribute("totalPage",y);
        request.setAttribute("nowPage",1);

        request.getSession().setAttribute("key",key);
        request.setAttribute("glist", goodsList);
        request.setAttribute("ilist", imgList);

        return "moban3157/shop";
    }

    /*
    * 翻页
    * */
    @RequestMapping("/pageTurn")
    @ResponseBody
    public Object pageTurn(HttpServletRequest request, int nowPage){
        List<Goods> goodsList = new ArrayList<Goods>();
        int totalp;
        nowPage+=1;
        if(request.getSession().getAttribute("key")==null){
            goodsList=goodsService.getAll(nowPage);//查询所有
        }else {
            goodsList = goodsService.getGoodByName(request.getSession().getAttribute("key").toString(),nowPage);//模糊查询
        }
        List<NewTemp> newTemps=new ArrayList<NewTemp>();
        for (Goods g : goodsList) {
            NewTemp newTemp=new NewTemp(g,imgService.getFirstImgByGoods(g.getId()));//对应商品的图片
            newTemps.add(newTemp);
        }

        return newTemps;
    }

    /*
    * 跳页
    * */
    @RequestMapping("/pageJump")
    @ResponseBody
    public Object pageJump(HttpServletRequest request, int tar){
        List<Goods> goodsList = new ArrayList<Goods>();
        if(request.getSession().getAttribute("key")==null){
            goodsList=goodsService.getAll(tar);//查询所有
        }else {
            goodsList = goodsService.getGoodByName(request.getSession().getAttribute("key").toString(),tar);//模糊查询
        }
        List<NewTemp> newTemps=new ArrayList<NewTemp>();
        for (Goods g : goodsList) {
            NewTemp newTemp=new NewTemp(g,imgService.getFirstImgByGoods(g.getId()));//对应商品的图片
            newTemps.add(newTemp);
        }

        return newTemps;
    }


    /*
    * 刷新购物车
    * */
    @RequestMapping("/refleshCart")
    @ResponseBody
    public Object refleshCart(HttpServletRequest request){
        Cart cart = new Cart();
        String userName = (String) request.getSession().getAttribute("username");
        cart.setUserName(userName);
        List<Cart> list2 = cartService.getAll(cart);
        double total = 0;
        for (Cart cart2 : list2) {
            total += cart2.getPrice() * cart2.getNum();
        }
        request.getSession().setAttribute("total", total);
        request.getSession().setAttribute("list2", list2);

        return list2;
    }

    /*
    * 刷新钱
    * */
    @RequestMapping("/refleshMoney")
    @ResponseBody
    public Object refleshMoney(HttpServletRequest request){
        Cart cart = new Cart();
        String userName = (String) request.getSession().getAttribute("username");
        cart.setUserName(userName);
        List<Cart> list2 = cartService.getAll(cart);
        double total = 0;
        for (Cart cart2 : list2) {
            total += cart2.getPrice() * cart2.getNum();
        }

        return total;
    }

}

/*
* 暂时存放使用
* */
@Data

class NewTemp {
    private Goods goods;
    private Img img;

    public NewTemp(Goods goods, Img img) {
        this.goods = goods;
        this.img = img;
    }
}


