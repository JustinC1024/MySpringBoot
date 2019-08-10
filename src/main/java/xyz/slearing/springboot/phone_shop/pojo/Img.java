package xyz.slearing.springboot.phone_shop.pojo;

import java.io.Serializable;
/*
* 图片类
* */
public class Img implements Serializable {

    private static final long serialVersionUID = -4497000743919374956L;

    private int id;
    private String name;//图片名
    private int goodsId;//商品id

    public Img() {
    }

    public Img(int id, String name, int goodsId) {
        this.id = id;
        this.name = name;
        this.goodsId = goodsId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(int goodsId) {
        this.goodsId = goodsId;
    }
}
