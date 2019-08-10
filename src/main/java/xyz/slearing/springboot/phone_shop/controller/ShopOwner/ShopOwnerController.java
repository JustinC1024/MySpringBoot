package xyz.slearing.springboot.phone_shop.controller.ShopOwner;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import xyz.slearing.springboot.phone_shop.pojo.ShopOwner;
import xyz.slearing.springboot.phone_shop.service.ShopOwner.ShopOwnerService;
import xyz.slearing.springboot.phone_shop.util.ParsingCookies;


@Controller
@RequestMapping("/shopOwner")
public class ShopOwnerController {

	@Autowired
	private ShopOwnerService shopOwnerService;
	
	/**
	 * 店主登录
	 * @return
	 */
	@RequestMapping("/login")
	public String login(HttpServletRequest request , HttpServletResponse response , ShopOwner owner){
		ShopOwner reslut = shopOwnerService.login(owner);
		Cookie idCookie = new Cookie("phone_shop_user_id" , reslut.getId()+"");
		Cookie nameCookie = new Cookie("phone_shop_user_name" , reslut.getName());




		if (reslut == null) {
			request.setAttribute("error", "用户名或密码错误");
			return  "./toLogin";
		} else {
			/**设置20分钟之后过期*/
			idCookie.setMaxAge(2* 60 * 60);
			/**设置20分钟之后过期*/
			nameCookie.setMaxAge(2* 60 * 60);
			idCookie.setPath("/");
			nameCookie.setPath("/");


			response.addCookie(idCookie);
			response.addCookie(nameCookie);

			return  "/admin/admin";
		}
	}


	/**
	 * 根据id查询店家信息
	 * @param request
	 * @param model
	 * @return
	 */
	@GetMapping("/findOwnerById")
	public String findOwnerById(HttpServletRequest request , Model model){
		/*默认跳回功能选择页面*/
		String path = "admin/admin";
		final Integer id = ParsingCookies.getId(request.getCookies());

		/*当id不合理时视为未登录，返回登录页面*/
		if(id == null && id <= 0){
			path = "/shopOwner/toLogin";
			return path;
		}


		final ShopOwner shopOwner = shopOwnerService.findOwnerById(id);

		if(shopOwner != null){
			/*点击信息首页*/
			path = "admin/shopOwnerInfo";

			model.addAttribute("shopOwner"  , shopOwner);
		}

		return path;

	}

	/**
	 * 更新之前查询数据
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/toUpdate")
	public ShopOwner toUpdate(HttpServletRequest request ){
		final Integer id = ParsingCookies.getId(request.getCookies());

		final ShopOwner shopOwner = shopOwnerService.findOwnerById(id);

		return shopOwner;

	}


	/**
	 * 更新店家信息
	 * @param shopOwner
	 * @return
	 */
	@ResponseBody
	@PutMapping("/shopOwner")
	public String updateOwnerInfo(ShopOwner shopOwner , HttpServletRequest request){
		Integer id = ParsingCookies.getId(request.getCookies());
		shopOwner.setId(id);

		boolean b = shopOwnerService.updateOwnerInfo(shopOwner);

		String message = (b ? "1" : "0");

		return message;
	}


	/***
	 * 跳到店主登录页面
	 * @return
	 */
	@RequestMapping("toLogin")
	public String toLogin(){
		return "admin/adminlogin";
	}


	/***
	 * 跳到店主功能页面
	 * @return
	 */
	@RequestMapping("/toAdmin")
	public String toAdmin(){
		return "admin/admin";
	}
}
