package com.model;
/**
 * 房源图片
 * @author MyZhang
 *
 */
public class House_Picture {
	/**
	 * 房源图片编号
	 */
	private int house_picture_id;
	/**
	 * 房源编号
	 */
	private House house_id;
	/**
	 * 图片地址
	 */
	private String house_picture_addr;
	/**
	 * 图片类型
	 */
	private String house_picture_type;
	public House_Picture(int house_picture_id, House house_id, String house_picture_addr, String house_picture_type) {
		super();
		this.house_picture_id = house_picture_id;
		this.house_id = house_id;
		this.house_picture_addr = house_picture_addr;
		this.house_picture_type = house_picture_type;
	}
	public House_Picture(int house_picture_id, String house_picture_addr, String house_picture_type) {
		super();
		this.house_picture_id = house_picture_id;
		this.house_picture_addr = house_picture_addr;
		this.house_picture_type = house_picture_type;
	}

	public House_Picture(House house_id, String house_picture_addr) {
		super();
		this.house_id = house_id;
		this.house_picture_addr = house_picture_addr;
	}
	public House_Picture() {
		super();
	}
	public int getHouse_picture_id() {
		return house_picture_id;
	}
	public void setHouse_picture_id(int house_picture_id) {
		this.house_picture_id = house_picture_id;
	}
	public House getHouse_id() {
		return house_id;
	}
	public void setHouse_id(House house_id) {
		this.house_id = house_id;
	}
	public String getHouse_picture_addr() {
		return house_picture_addr;
	}
	public void setHouse_picture_addr(String house_picture_addr) {
		this.house_picture_addr = house_picture_addr;
	}
	public String getHouse_picture_type() {
		return house_picture_type;
	}
	public void setHouse_picture_type(String house_picture_type) {
		this.house_picture_type = house_picture_type;
	}
}
