package net;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;

public class EchoServer 
{
	//java.io java.net java.sql 거의 모든 메소드 예외 가능성이 있다. 
	public EchoServer()
	{
		try 
		{
			int port= 8000;
			int cnt =0;//클라이언트 접속 갯수?횟수
			ServerSocket server = new ServerSocket(port); 
			System.out.println("ServerSocket sTart...");
			while(true)
			{
				Socket sock = server.accept();//대기상태 Client가 접속하기 전까지는
				EchoThread et = new EchoThread(sock);
				et.start();//run메소드 호출
				cnt++;
				System.out.println("Client"+cnt+"socket");
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	class EchoThread extends Thread
	{
		Socket sock;//this.sock
		BufferedReader in;
		PrintWriter out;
		public EchoThread(Socket sock)
		{
			try
			{
				this.sock = sock;
				in = new BufferedReader(new InputStreamReader(sock.getInputStream()));
				out = new PrintWriter(sock.getOutputStream(),true);
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}//생성자
		
		public void run()
		{
			try//client에게 접속하면 처음으로 받는 메세지
			{
				out.println("hello Enter bye to exit");
				while(true)
				{
					String line = in.readLine();
					if(line == null)
					{
						break;//client가 접속을 끊을때 
					}
					else
					{
						out.println("Echo : "+ line);
						if(line.equals("bye"))
						{
							break;//종료
						}
					}

				}
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
	}
	
	public static void main(String[] args) 
	{
		new EchoServer();
	}
}
