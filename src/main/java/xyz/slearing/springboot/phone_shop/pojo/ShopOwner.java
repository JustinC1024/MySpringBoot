package xyz.slearing.springboot.phone_shop.pojo;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * @Author slearing
 */
@Data
@NoArgsConstructor
public class ShopOwner implements Serializable {
    private Integer id;
    private String name;
    private String password;
    private String phone;
    private String idCard;
}
