package net;

public class ChatProtocol3 
{
	//id,chat,chatall,message,chatlist/-프로토콜이다 만들
	//클라이언트->서버로 ID:AAA;1234 보내면 
	//서버->클라이언트 날아가는 중 >> id:t(ure)(성공),id:f(alse)(실패),id:c(이중 접속 체크)
	//서버->클라이언트 CHATLIST : AAA,BBB,CCC,DDD 리스트에 추가한다.
	public static final String ID="ID";//상수
	
	//클라이언트->서버로 CHAT:받는아이디;메시지 형태로 보내면
	//EX) CHAT:BBB;밥먹자
	//서버->클라이언트로 CHAT:보낸아이디;메시지 형태로 보내면
	//EX) CHAT:AAA;밥먹자
	public static final String CHAT="CHAT";//상수
	
	//클라이언트->서버 MESSAGE:받는 아이디 :쪽지내용
	//서버->클라이언트 MESSAGE:보낸 아이디 :쪽지내용
	public static final String MESSAGE="MESSAGE";//상수
	
	//클라이언트->서버 CHATALL:메세지
	//서버->클라이언트 CHATALL:[보낸 아이디]메세지
	public static final String CHATALL="CHATALL";//상수
	public static final String MSGLIST="MSGLIST";//상수
	//서버->클라이언트 CHATLIST : AAA;BBB;CCC;DDD;
	public static final String CHATLIST="CHATLIST";//상수
	
	public static void main(String[] args) 
	{
		
	}
}
