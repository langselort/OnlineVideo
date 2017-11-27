package Mod;

public class Answer {
	private int id;
	private Ass ass;
	private Client client;
	private double score;
	private String url;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Ass getAss() {
		return ass;
	}
	public void setAss(Ass ass) {
		this.ass = ass;
	}
	public Client getClient() {
		return client;
	}
	public void setClient(Client client) {
		this.client = client;
	}
	public double getScore() {
		return score;
	}
	public void setScore(double score) {
		this.score = score;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
}
