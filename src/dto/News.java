package dto;

import java.io.Serializable;
import java.util.Date;

public class News implements Serializable {
	private static final long serialVersionUID = -4274700572038677000L;
	
	private String n_num;
	private String n_tit;
	private String n_cate;
	private String n_con;
	private String n_author;
	private Date n_date;
	private String n_pic;
	private String n_link;
	
	public News() {
		super();
	}

	public String getN_num() {
		return n_num;
	}

	public void setN_num(String n_num) {
		this.n_num = n_num;
	}

	public String getN_tit() {
		return n_tit;
	}

	public void setN_tit(String n_tit) {
		this.n_tit = n_tit;
	}

	public String getN_cate() {
		return n_cate;
	}

	public void setN_cate(String n_cate) {
		this.n_cate = n_cate;
	}

	public String getN_con() {
		return n_con;
	}

	public void setN_con(String n_con) {
		this.n_con = n_con;
	}

	public String getN_author() {
		return n_author;
	}

	public void setN_author(String n_author) {
		this.n_author = n_author;
	}

	public Date getN_date() {
		return n_date;
	}

	public void setN_date(Date n_date) {
		this.n_date = n_date;
	}

	public String getN_pic() {
		return n_pic;
	}

	public void setN_pic(String n_pic) {
		this.n_pic = n_pic;
	}

	public String getN_link() {
		return n_link;
	}

	public void setN_link(String n_link) {
		this.n_link = n_link;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
