package net;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Vector;

import net.ChatServer1.ClientThread1;

public class ChatServer2 
{
	Vector<ClientThread2> vc;
	ServerSocket server;
	int port= 8002;
	public ChatServer2()//생성자
	{
		try
		{
			vc = new Vector<ClientThread2>();
			server = new ServerSocket(port);
			
		}
		catch(Exception e)
		{
			System.err.println("Error in server");
			e.printStackTrace();
			System.exit(1);
		}
		System.out.println("*ChatServer ver2.0 ***********************************");
		System.out.println("클라이언트 접속을 기다리고 있습니다.");
		System.out.println("*******************************************");
		try 
		{
			while(true)
			{
				Socket sock = server.accept();
				ClientThread2 ct = new ClientThread2(sock);
				ct.start();
				vc.addElement(ct);
			}
		}
		catch(Exception e)
		{
			System.out.println("Error in Socket");
			e.printStackTrace();
		}
	}
	public void sendAllMessage(String msg)
	{
		for(int i =0; i<vc.size(); i++)
		{
			ClientThread2 ct = vc.elementAt(i);//vector에 저장된 여럿 ct를 하나씩 부른다for문 사용해서
			ct.SendMessage(msg);//불러온 ct에 연결도니 클라이언트에게 메세지 전송
		}
	}
	public void removeClient(ClientThread2 ct)
	{
		vc.remove(ct);
	}
	
	//접속된 모든 id 리스트 리턴하는 메소드
	public String getIds()
	{
		String ids="";
		for(int i=0; i<vc.size(); i++)
		{
			ClientThread2 ct = vc.get(i);
			ids+=ct.id+";";//;아이디를 구분
		}
		return ids;
	}
	//매개변수 id값으로 ClientThread2를 검색
	public ClientThread2 findClient(String id)
	{
		ClientThread2 ct = null;
		for(int i =0; i<vc.size(); i++)
		{
			 ct = vc.get(i);
			 if(ct.id.equals(id))//클라이언트 아이디와 매개변수의 id가 같다면 내가 찾던 id임으로 나간다. 
			 {
				 break;
			 }
		}
		return ct;
	}
	
	class ClientThread2 extends Thread
	{
		Socket sock;
		BufferedReader in;
		PrintWriter out;
		String id;
		public ClientThread2(Socket sock)
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
			{
				out.println("사용할시 아이디를 입력하세요.");
				while(true)
				{
					String line = in.readLine();
					if(line == null)
						break;
					else
						routine(line);
				}
			}
			catch(Exception e)
			{
				removeClient(this);
				System.err.println(sock+"["+id+"]끊어짐");
			}
		}
		public void routine(String line)
		{
			System.out.println("line :"+ line);
			int idx = line.indexOf(':');
			String cmd = line.substring(0,idx);//CHATALL:
			String data = line.substring(idx+1);//오늘은 목요일입니다.
			if(cmd.equals(ChatProtocol2.ID))//ID:aaa cmd =ID: data = aaa
			{
				id=data;
				//새로운 접속자가 추가 되었기 때문에 리스트 재전송 필요
				sendAllMessage(ChatProtocol2.CHATLIST+":"+getIds());//이때 :는 구별자로 substring?때문에사용됨.
				//모든 접속자에게 웰컴 인사 메서지 전송
				sendAllMessage(ChatProtocol2.CHATALL+":"+"["+id+"]님이 입장하였습니다.");
			}
			else if(cmd.equals(ChatProtocol2.CHAT))//CHAT:bbb(아이디);밥먹자
			{
				idx= data.indexOf(';');
				cmd /*bbb*/ = data.substring(idx);
				data/*밥먹자*/= data.substring(idx+1);
				//bbb라는 아이디를 찾아야 한다.
				ClientThread2 ct = findClient(cmd);//bbb
				if(ct != null)
				{
					//bbb가 볼 메세지
					ct.SendMessage(ChatProtocol2.CHAT+":"+"["+id+"(s)]"+data);
					//보낸 당사자 aaa가 볼 메세지
					SendMessage(ChatProtocol2.CHAT+":"+"["+id+"(s)]"+data);
				}
				else
				{
					//보낸 당사자 aaa가 볼 수 있는 메세지
					SendMessage(ChatProtocol2.CHAT+":"+"["+cmd+"] 접속자가 아닙니다." );
				}
			}
			else if(cmd.equals(ChatProtocol2.CHATALL))
			{
				sendAllMessage(ChatProtocol2.CHATALL+":"+"["+id+"]"+data);
			}
			else if(cmd.equals(ChatProtocol2.MESSAGE))
			{
				idx= data.indexOf(';');
				cmd /*bbb*/ = data.substring(idx);
				data/*밥먹자*/= data.substring(idx+1);
				//bbb라는 아이디를 찾아야 한다.
				ClientThread2 ct = findClient(cmd);//bbb
				if(ct != null)
				{
					//bbb가 볼 메세지
					ct.SendMessage(ChatProtocol2.MESSAGE+":"+id+";"+data);
				}
				else
				{
					//보낸 당사자 aaa가 볼 수 있는 메세지
					SendMessage(ChatProtocol2.MESSAGE+":"+"["+cmd+"] 접속자가 아닙니다." );
				}
			}
		}
		public void SendMessage(String msg)
		{
			out.println(msg);
		}
	}
	
	public static void main(String[] args)
	{
		new ChatServer2();

		//CHATALL:오늘은 목요일입니다.
		/*
		 * String str = "CHATALL:오늘은 목요일입니다."; int idx = str.indexOf(':'); String cmd =
		 * str.substring(0,idx); String data = str.substring(idx+1);
		 * System.out.println(cmd); System.out.println(data);
		 */
	}

}
