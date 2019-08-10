package xyz.slearing.springboot.phone_shop.pojo;

import lombok.*;

import java.io.Serializable;
import java.util.List;

/**
 * 
 * @author
 *
 */
@Data	//为属性提供get、set、所有参构造方法等方法
@NoArgsConstructor	//提供无参构造方法
public class Goods implements Serializable{

	/**
	 * 商品类
	 */
	private static final long serialVersionUID = 1L;

	private int id;
	private String name = "";//商品名称
	private Double price;//商品价格
	private Integer stock;//商品库存
	private String content;//商品详情
	private List<Color> colorList;	//颜色列表
	private List<Img> imgList;	//图片列表
	@Getter @Setter private Integer ownerId; //店铺id

}
