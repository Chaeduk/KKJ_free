package org.tukorea.myweb.domain;

public class NotebookVO {
	private int notebook_seq;
	private int notebook_stock;
	private int notebook_capacity;
	private String notebook_name;
	private String notebook_url;
	
	public int getNotebook_seq() {
		return notebook_seq;
	}
	public void setNotebook_seq(int notebook_seq) {
		this.notebook_seq = notebook_seq;
	}
	public int getNotebook_stock() {
		return notebook_stock;
	}
	public void setNotebook_stock(int notebook_stock) {
		this.notebook_stock = notebook_stock;
	}
	public int getNotebook_capacity() {
		return notebook_capacity;
	}
	public void setNotebook_capacity(int notebook_capacity) {
		this.notebook_capacity = notebook_capacity;
	}
	public String getNotebook_name() {
		return notebook_name;
	}
	public void setNotebook_name(String notebook_name) {
		this.notebook_name = notebook_name;
	}
	public String getNotebook_url() {
		return notebook_url;
	}
	public void setNotebook_url(String notebook_url) {
		this.notebook_url = notebook_url;
	}
	
	@Override
	public String toString() {
		return "NotebookVO [notebook_seq=" + notebook_seq + ", notebook_stock=" + notebook_stock
				+ ", notebook_capacity=" + notebook_capacity + ", notebook_name=" + notebook_name + ", notebook_url="
				+ notebook_url + "]";
	}
	
	
	
	

}
