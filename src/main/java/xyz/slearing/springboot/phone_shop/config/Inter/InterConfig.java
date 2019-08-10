package xyz.slearing.springboot.phone_shop.config.Inter;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import xyz.slearing.springboot.phone_shop.Interceptor.LoginInter;

import java.util.ArrayList;
import java.util.List;

/**
 * @Author slearing
 */
@Configuration
public class InterConfig implements WebMvcConfigurer {
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        List<String> expaths = new ArrayList<>();

        expaths.add("/shopOwner/*");
        expaths.add("/userInfo/reg");
        expaths.add("/userInfo/login");
        expaths.add("/userInfo/toLogin");
        expaths.add("/moban3157/**");
        expaths.add("/login");

        expaths.add("/");

        expaths.add("/admin/**");
        expaths.add("/img/**");
        expaths.add("/js/**");
        expaths.add("/css/**");
        expaths.add("/fonts/**");
        expaths.add("/file/**");

        expaths.add("/client/**");
        expaths.add("/client/detail/**");
        expaths.add("/client/search/**");

        registry.addInterceptor(new LoginInter()).addPathPatterns("/**").excludePathPatterns(expaths);
    }
}
