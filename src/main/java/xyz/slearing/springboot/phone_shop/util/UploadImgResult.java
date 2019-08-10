package xyz.slearing.springboot.phone_shop.util;

import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Author slearing
 */
@Data
@NoArgsConstructor
public class UploadImgResult {
    private Integer errno = -1;
    private String [] data;
}
