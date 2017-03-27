package member;

public class Member {
	private int id;
	private String name;
	private int grade;
	private String mail;
	private String phone;
	
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
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public Member() {}
	
	public Member(int id, String name, int grade, String mail, String phone) {
		this.id = id;
		this.name = name;
		this.grade = grade;
		this.mail = mail;
		this.phone = phone;
	}
}