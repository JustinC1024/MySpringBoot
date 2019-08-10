package xyz.slearing.springboot.phone_shop.util;

import sun.awt.SunHints;

import javax.servlet.http.Cookie;

/**
 * @Author slearing
 */
public class ParsingCookies {

    /**
     * 从cookie中获取当前用户id
     * @param cookies
     * @return
     */
    public static Integer getId(Cookie [] cookies){
        String value = null;

        for(Cookie cookie : cookies){
            if ("phone_shop_user_id".equals(cookie.getName())){
                value = cookie.getValue();
            }
        }

        if(value == null){
            try {
                throw new Exception("非法操作，跳过登录！！！！");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return Integer.parseInt(value);
    }

    /**
     * 从cookies中获取当前用户的用户名
     * @param cookies
     * @return
     */
    public static String getName(Cookie [] cookies){
        String name = null;

        for(Cookie cookie : cookies){
            if ("phone_shop_user_name".equals(cookie.getName())){
                name = cookie.getValue();
            }
        }

        if(name == null){
            try {
                throw new Exception("非法操作，跳过登录！！！！");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return name;
    }
}
