package net;

public class MessageBean3 {	
	private int no;
	private String fid;//보낸이
	private String tid;//받는이
	private String msg;
	private String mdate;
	public MessageBean3() 
	{
		super();//상위 (부모/슈퍼)클래스의 생성자 호출 -extends 없을 경우 상위는 object가 상위가 된다.
	}
	
//매개변수 생성자
public MessageBean3(int no, String fid,String tid,String msg,String mdate) {
	super();//슈퍼는 생성자 라인 맨 첫 줄에 있어야 한다.
	this.no = no;
	this.fid = fid;
	this.tid = tid;
	this.msg = msg;
	this.mdate = mdate;
}
public int getNo() {
	return no;
}
public void setNo(int no) {
	this.no = no;
}
public String getFid() {
	return fid;
}
public void setFid(String fid) {
	this.fid = fid;
}
public String getTid() {
	return tid;
}
public void setTid(String tid) {
	this.tid = tid;
}
public String getMsg() {
	return msg;
}
public void setMsg(String msg) {
	this.msg = msg;
}
public String getMdate() {
	return mdate;
}
public void setMdate(String mdate) {
	this.mdate = mdate;
}

}
