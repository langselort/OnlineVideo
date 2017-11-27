package Mod;
import java.util.Date;
public class Board {
	private int id;
	private Client client;
	private String title;
	private String content;
	private Date inTime;
	private String huifu;
	public String getHuifu() {
		return huifu;
	}
	public void setHuifu(String huifu) {
		this.huifu = huifu;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Client getClient() {
		return client;
	}
	public void setClient(Client client) {
		this.client = client;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getInTime() {
		return inTime;
	}
	public void setInTime(Date inTime) {
		this.inTime = inTime;
	}
}
