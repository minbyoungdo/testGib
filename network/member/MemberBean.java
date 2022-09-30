package member;

public class MemberBean {
	private int id;
	private String name;
	private String phone;
	private String team;
	private String address;
	public MemberBean() //기본생성자는 매개변수 있는 생성자가 있으면 jvm 제공하지 않음
	{
		super();//상위 (부모/슈퍼)클래스의 생성자 호출 -extends 없을 경우 상위는 object가 상위가 된다.
	}
	//매개변수 생성자
	public MemberBean(int id, String name,String phone,String team,String address) {
		super();//슈퍼는 생성자 라인 맨 첫 줄에 있어야 한다.
		this.id = id;
		this.name = name;
		this.phone = phone;
		this.team = team;
		this.address = address;
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
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getTeam() {
		return team;
	}
	public void setTeam(String team) {
		this.team = team;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	

}
