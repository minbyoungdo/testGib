package Talk;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Vector;




public class TalkServer 
{
	Vector<TalkThread> vc;
	ServerSocket server;
	int port = 8005;
	TalkMgr mgr;
	
	public TalkServer()
	{
		try
		{
			vc = new Vector<TalkThread>();
			server = new ServerSocket(port);
			mgr = new TalkMgr();
			
		}
		catch(Exception e)
		{
			System.err.println("Error in server");
			e.printStackTrace();
			System.exit(1);
		}
		System.out.println("*Welcome TalkServer ***********************************");
		System.out.println("클라이언트 접속을 기다리고 있습니다.");
		System.out.println("*******************************************");
		try 
		{
			while(true)
			{
				Socket sock = server.accept();
				TalkThread ct = new TalkThread(sock);
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
			TalkThread ct = vc.elementAt(i);
			ct.SendMessage(msg);
		}
	}
	public void removeClient(TalkThread ct)
	{
		vc.remove(ct);
	}

	
	class TalkThread extends Thread
	{
		Socket sock;
		BufferedReader in;
		PrintWriter out;
		String id = "익명";
		public TalkThread(Socket sock)
		{
			try
			{
				this.sock = sock;
				in = new BufferedReader(new InputStreamReader(sock.getInputStream()));
				out = new PrintWriter(sock.getOutputStream(),true);
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
				while(true)
				{
					String line = in.readLine();
					if(line == null)
						break;
					  else 
					  {
						  	System.out.println("line :"+ line);
							int idx = line.indexOf(':');
							String cmd = line.substring(0,idx);
							String data = line.substring(idx+1);
							if(cmd.equals("ID"))
							{
							idx =data.indexOf(';');
							cmd = data.substring(0,idx);
							data= data.substring(idx+1);
							if(mgr.loginChk(cmd, data))
							{
								TalkThread ct = null; 
								for(int i =0; i<vc.size(); i++)
								{ 
									  ct = vc.get(i);
									  if(ct.id.equals(cmd)) 
										  break;
								}
								if(ct!= null&&ct.id.equals(cmd))//true면 이중접속상황
									SendMessage("ID"+":"+"C");
								else//이중 접속도 아니고 로그인에도 성공한 상태
								{
									id = cmd;
									SendMessage("ID"+":"+"T");
								}
							}
							else//로그인 실패
								SendMessage("ID"+":"+"F");
							}
					  } 
				}
			}
			catch(Exception e)
			{
				removeClient(this);
				System.err.println(sock+"["+id+"]끊어짐");
			}
		}
		
		public void SendMessage(String msg)
		{
			out.println(msg);
		}
	}
	
	public static void main(String[] args)
	{
		new TalkServer();
	}
}

