package xyz.slearing.springboot.phone_shop.pojo;

import java.io.Serializable;

/*
* 颜色类
* */

public class Color implements Serializable {

    private static final long serialVersionUID = 3531876951467229585L;

    private int id;
    private String name;//颜色名
    private int goodsId;//商品id

    public Color() {
    }

    public Color(int id, String name, int goodsId) {
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
