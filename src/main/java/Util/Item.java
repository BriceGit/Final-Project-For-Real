package Util;

import java.sql.Date;

public class Item {
	
	private int id;
	private String name, image_url, desc;
	private Date date_created;
	private int user_id;
	
	
	public Item(int id, String name, String image_url, String desc, Date date_created, int user_id) {
		this.id = id;
		this.name = name;
		this.image_url = image_url;
		this.desc = desc;
		this.date_created = date_created;
		this.user_id = user_id;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getImage_url() {
		return image_url;
	}


	public void setImage_url(String image_url) {
		this.image_url = image_url;
	}


	public String getDesc() {
		return desc;
	}


	public void setDesc(String desc) {
		this.desc = desc;
	}


	public Date getDate_created() {
		return date_created;
	}


	public void setDate_created(Date date_created) {
		this.date_created = date_created;
	}


	public int getUser_id() {
		return user_id;
	}


	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}


}
