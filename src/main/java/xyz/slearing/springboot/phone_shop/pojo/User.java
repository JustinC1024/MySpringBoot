package xyz.slearing.springboot.phone_shop.pojo;

import java.io.Serializable;

/**
 * 
 * @author admin
 *
 */
public class User implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer id;
	private String userName;
	private String passWord;
	private String cellphone;

	public User() {
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public User(Integer id, String userName, String passWord, String cellphone) {
		this.id = id;
		this.userName = userName;
		this.passWord = passWord;
		this.cellphone = cellphone;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassWord() {
		return passWord;
	}

	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}

	public String getCellphone() {
		return cellphone;
	}

	public void setCellphone(String cellphone) {
		this.cellphone = cellphone;
	}

}
