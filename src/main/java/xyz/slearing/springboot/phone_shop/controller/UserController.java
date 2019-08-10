package xyz.slearing.springboot.phone_shop.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import xyz.slearing.springboot.phone_shop.pojo.User;
import xyz.slearing.springboot.phone_shop.service.UserServiceImpl;

@Controller
@RequestMapping("/userInfo")
public class UserController {
	
	@Autowired
	private UserServiceImpl userServiceImpl;
	
	/**
	 * 注册用户
	 * @return
	 */
	@RequestMapping("/reg")
	public String reg(HttpServletRequest request){
		User user = new User();
		user.setUserName(request.getParameter("user"));
		user.setPassWord(request.getParameter("psw"));
		user.setCellphone(request.getParameter("phone"));
		int result = userServiceImpl.insert(user);
		if (result == 1) {
			request.setAttribute("success", "注册成功");
			request.getSession().setAttribute("username",user.getUserName());
			return "redirect:/";
		} else {
			request.setAttribute("error", "●︿●用户名已存在，请重新注册！");
			return "register";
		}
	}
	
	/**
	 * 登录
	 * @return
	 */
	@RequestMapping("/login")
	public String login(HttpServletRequest request , HttpServletResponse response){
		User user = new User();
		user.setUserName(request.getParameter("user"));
		user.setPassWord(request.getParameter("psw"));
		User u = userServiceImpl.findUser(user);

		if (u == null) {
			request.setAttribute("error","用户名或密码错误");
			return "login";
		} else {
			Cookie idCookie = new Cookie("phone_shop_user_id" , u.getId().toString());
			Cookie nameCookie = new Cookie("phone_shop_user_name" , u.getUserName());

			/**设置20分钟之后过期*/
			idCookie.setMaxAge(2 * 60 * 60);
			/**设置20分钟之后过期*/
			nameCookie.setMaxAge(2 * 60 * 60);
			idCookie.setPath("/");
			nameCookie.setPath("/");

			response.addCookie(idCookie);
			response.addCookie(nameCookie);

			request.getSession().setAttribute("username",user.getUserName());
			return "redirect:/client/index";
		}
	}
	
	/**
	 * 退出
	 * @return
	 */
	@RequestMapping("/exit")
	public String exit(HttpServletRequest request){
		request.getSession().removeAttribute("username");
//		response.sendRedirect(request.getHeader("Referer"));
		return "index";
	}

	@RequestMapping("toLogin")
	public  String toLogin(){
		return "login";
	}
}
