package Mod;
import java.util.Date;

public class MTV {
private int id;
private String title="";
private Date intime;
private String content="";
private MTVType type;
private String url;
private Teacher teacher;

public Teacher getTeacher() {
	return teacher;
}
public void setTeacher(Teacher teacher) {
	this.teacher = teacher;
}
public String getUrl() {
	return url;
}
public void setUrl(String url) {
	this.url = url;
}
public MTVType getType() {
	return type;
}
public void setType(MTVType type) {
	this.type = type;
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}
public Date getIntime() {
	return intime;
}
public void setIntime(Date intime) {
	this.intime = intime;
}
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}
}
