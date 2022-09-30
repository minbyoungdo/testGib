package net;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Vector;

public class ChatServer1 
{
	
	Vector<ClientThread1> vc;
	ServerSocket server;
	int port= 8001;
	public ChatServer1()
	{
		try 
		{
			vc = new Vector<ClientThread1>();
			server = new ServerSocket(port);
		}
		catch(Exception e)
		{
			System.out.println("Error in Server");
			System.exit(1);//비정상 종료시 이를 알리기 위한 기능
		}
		System.out.println("*******************************************");
		System.out.println("ChatServer ver1.0 시작되었습니다.");
		System.out.println("*******************************************");
		try 
		{
			Socket sock = server.accept();
			ClientThread1 ct = new ClientThread1(sock);
			ct.start();//쓰레드 스케줄러에게 이 쓰레드객체 시작할 준비를 등록하는 메서드가 start메서드이다.
			vc.addElement(ct);//클라이언트 접속 후 생성된 객체(ClientThread1)를 vector에 저장하는 코드
		}
		catch(Exception e)
		{
			e.printStackTrace();
			System.err.println("Error in Socket");
		}
	}
	public void sendAllMessage(String msg)//전체 접속자(vc에 저장되어 있음)에게 메세지 전달
	{
		for(int i =0; i<vc.size(); i++)
		{
			ClientThread1 ct = vc.get(i);//vector에 저장된 여럿 ct를 하나씩 부른다for문 사용해서
			ct.sendMessage(msg);//불러온 ct에 연결도니 클라이언트에게 메세지 전송
		}
	}
	
	//vector 에서 ClientThread1 제거용 메소드
	public void removeClient(ClientThread1 ct)
	{
		vc.remove(ct);
	}
	
	class ClientThread1 extends Thread
	{
		Socket sock;
		BufferedReader in;
		PrintWriter out;
		String id;
		public ClientThread1(Socket sock)
		{
			try
			{
				this.sock = sock;
				in = new BufferedReader(new InputStreamReader(sock.getInputStream()));
				out = new PrintWriter(sock.getOutputStream(),true);
				//sock=> sock.toString()
				System.out.println(sock+"접속됨..");
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
		public void run()
		{
			try 
			{//클라이언트에게 최초로 보내는 메세지
				out.println("사용할시 아이디를 입력하세요.");
				//클라이언트가 입력한 id 값을 저장
				id= in.readLine();
				//모든 클라이언트에게 welcome 메세지 전달
				sendAllMessage("["+id+"]님이 입장하셨습니다." );
				String data="";
				while(true)
				{
					data= in.readLine();
					if(data== null)break;
					sendAllMessage("["+id+"] : "+data);
				}
				//while문 종료되면 다른거 닫기?
				in.close();
				out.close();
				sock.close();
			}
			catch(Exception e)
			{
				//e.printStackTrace();
				removeClient(this);//예외처리시 자신스스로의 객체를 제거한다.
				System.out.println(sock+ "끊어짐..");
			}
		}
		//클라이언트에게 메세지 보내는 메소드
		public void sendMessage(String msg)
		{
			out.println(msg);
		}
	}
	public static void main(String[] args) 
	{
		new ChatServer1();
	}

}
