package Mod;

public class Teacher {
	private int id=0;
	private String name="";
	private int age=0;
	private String tel="";
	private String xueli="";
	private ZhuanYe zhuanye;
	private String content="";
	private String img;
	private String pass="";
	private String login="";
	
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
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getXueli() {
		return xueli;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	public void setXueli(String xueli) {
		this.xueli = xueli;
	}
	public ZhuanYe getZhuanye() {
		return zhuanye;
	}
	public void setZhuanye(ZhuanYe zhuanye) {
		this.zhuanye = zhuanye;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	
}
