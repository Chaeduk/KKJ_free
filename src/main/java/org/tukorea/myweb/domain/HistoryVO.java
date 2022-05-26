package org.tukorea.myweb.domain;

public class HistoryVO {
	private int history_seq;
	private int user_seq;
	private int notebook_seq;
	private String status;
	private String date;
	private String notebook_name;
	private String notebook_url;
	
	public int getHistory_seq() {
		return history_seq;
	}
	public void setHistory_seq(int history_seq) {
		this.history_seq = history_seq;
	}
	public int getUser_seq() {
		return user_seq;
	}
	public void setUser_seq(int user_seq) {
		this.user_seq = user_seq;
	}
	public int getNotebook_seq() {
		return notebook_seq;
	}
	public void setNotebook_seq(int notebook_seq) {
		this.notebook_seq = notebook_seq;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
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
		return "HistoryVO [history_seq=" + history_seq + ", user_seq=" + user_seq + ", notebook_seq=" + notebook_seq
				+ ", status=" + status + ", date=" + date + ", notebook_name=" + notebook_name + ", notebook_url="
				+ notebook_url + "]";
	}
	
}
