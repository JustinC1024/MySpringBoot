package xyz.slearing.springboot.phone_shop.pojo;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@NoArgsConstructor
public class GoodsOrder implements Serializable {

    private int id;
    private int goodsId;
    private String img;
    private String name;
    private String type;
    private Double price;
    private int num;
    private int userId;

}
