package xyz.slearing.springboot.phone_shop.pojo;


import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;
/*
* 评价类
* */
public class Appraise implements Serializable {

    private static final long serialVersionUID = -8153198263387652758L;

    private int id;
    private String content;//评价内容
    private int userId;//用户id
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date createTime;//评价时间
    private int goodsId;//物品id

    public Appraise() {
    }

    public Appraise(int id, String content, int userId, Date createTime, int goodsId) {
        this.id = id;
        this.content = content;
        this.userId = userId;
        this.createTime = createTime;
        this.goodsId = goodsId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public int getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(int goodsId) {
        this.goodsId = goodsId;
    }
}
