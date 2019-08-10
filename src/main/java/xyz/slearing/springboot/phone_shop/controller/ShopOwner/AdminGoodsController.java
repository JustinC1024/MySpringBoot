package xyz.slearing.springboot.phone_shop.controller.ShopOwner;

import javax.servlet.http.HttpServletRequest;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import xyz.slearing.springboot.phone_shop.pojo.Goods;
import xyz.slearing.springboot.phone_shop.service.ShopOwner.AdminGoodsService;
import xyz.slearing.springboot.phone_shop.util.ParsingCookies;


@Controller
@RequestMapping("/adminGood")
public class AdminGoodsController {

	@Autowired
	private AdminGoodsService adminGoodsService;

	/***
	 * 对商品进行分页查询
	 * @param goods	查询条件
	 * @param pageNum 第几页
	 * @param pageSize	每页的商品的个数
	 * @param model
	 * @return
	 */
	@RequestMapping("/findByPage")
	public String findByPage(Goods goods , @RequestParam(defaultValue = "1") int pageNum , @RequestParam(defaultValue = "5") int pageSize , Model model , HttpServletRequest request){
		Integer ownerId = ParsingCookies.getId(request.getCookies());
		goods.setOwnerId(ownerId);

		PageInfo<Goods> pageInfo = adminGoodsService.findByPage(goods , pageNum , pageSize);

		model.addAttribute("pageInfo" , pageInfo);

		return "admin/goodsList";
	}


	/**
	 * 增加商品
	 * @param goods
	 * @param request
	 * @return
	 */
	@ResponseBody
	@PostMapping(value = "/goods")
	public String inserGoods(Goods goods , MultipartFile[] files , String[] colors , HttpServletRequest request){
		/**返回的信息**/
		String message = "增加商品失败";

		Integer ownerId = ParsingCookies.getId(request.getCookies());
		goods.setOwnerId(ownerId);

		//获取上传文件的路径
		String path = request.getSession().getServletContext().getRealPath("/file/goodsImg/");
		boolean flag = adminGoodsService.inserGoods(goods ,files , path , colors);

		if(flag){
			message = "增加商品成功";
		}

		return message;
	}

	/***
	 * 删除商品
	 * @param id
	 * @return
	 */
	@ResponseBody
	@DeleteMapping(value = "/goods/{id}" , produces = "application/json;charset=UTF-8")
	public String delGoods(@PathVariable("id") Integer id){
		/**返回的信息**/
		String message = "0";

		boolean flag = adminGoodsService.deletGoods(id);

		if(flag){
			message = "1";
		}

		return message;
	}


	/***
	 * 更新商品
	 * @param goods
	 * @param request
	 * @return
	 */
	@ResponseBody
	@PutMapping(value = "/goods" , produces = "application/json;charset=UTF-8")
	public String updateGoods(Goods goods , MultipartFile[] files , String[] colors , HttpServletRequest request){
		String message = "0";

		//获取上传文件的路径
		String path = request.getSession().getServletContext().getRealPath("/file/goodsImg/");
		boolean flag = adminGoodsService.updateGoods(goods ,files , path , colors);

		if(flag){
			message = "1";
		}

		return message;
	}


	/**
	 * 根据商品id查询商品信息
	 * @param goodsId
	 * @param model
	 * @return
	 */
	@GetMapping("/goods/{goodsId}")
	public String findGoodsById(@PathVariable("goodsId")int goodsId , Model model){
		Goods goods = adminGoodsService.findGoodsById(goodsId);

		model.addAttribute("goods" , goods);

		return "admin/updateGoods";
	}

    /**
     * 去往增加页面
     * @return
     */
	@RequestMapping("/toInsert")
	public String toInsert(){
		return "/admin/insertGoods";
	}





}
