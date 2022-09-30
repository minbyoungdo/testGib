package net;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Vector;

public class ChatServer3 {

	Vector<ClientThread3> vc;
	ServerSocket server;
	int port = 8003;
	ChatMgr3 mgr;
	MsgMgr mgr2;
	public ChatServer3() {
		try {
			vc = new Vector<ClientThread3>();
			server = new ServerSocket(port);
			mgr = new ChatMgr3();
			mgr2 = new MsgMgr();
		} catch (Exception e) {
			System.err.println("Error in Server");
			e.printStackTrace();
			System.exit(1);
		}
		System.out.println("****************************************");
		System.out.println("*Welcome Chat Server 3.0...");
		System.out.println("*클라이언트 접속을 기다리고 있습니다..");
		System.out.println("****************************************");
		try {
			while (true) {
				Socket sock = server.accept();
				ClientThread3 ct = new ClientThread3(sock);
				ct.start();
				vc.addElement(ct);
			}
		} catch (Exception e) {
			System.err.println("Error in Socket");
			e.printStackTrace();
		}
	}

	public void sendAllMessage(String msg) {
		for (int i = 0; i < vc.size(); i++) {
			ClientThread3 ct = vc.elementAt(i);
			ct.sendMessage(msg);
		}
	}

	public void removeClient(ClientThread3 ct) {
		vc.remove(ct);
	}

	//접속된 모든 id 리스트 리턴하는 메소드
	public String getIds() {
		String ids = "";
		for (int i = 0; i < vc.size(); i++) {
			ClientThread3 ct = vc.get(i);
			ids += ct.id + ";";
		}
		return ids;
	}

	//매개변수 id값으로 ClientThread2를 검색
	public ClientThread3 findClient(String id) {
		ClientThread3 ct = null;
		for (int i = 0; i < vc.size(); i++) {
			ct = vc.get(i);
			if (ct.id.equals(id)) {//클라이언트 아이디와 매개변수의 id가 같다면 내가 찾던 id임으로 나간다. .
				break;
			}
		} // --for
		return ct;
	}// --findClient

	class ClientThread3 extends Thread {

		Socket sock;
		BufferedReader in;
		PrintWriter out;
		String id = "익명";

		public ClientThread3(Socket sock) {
			try {
				this.sock = sock;
				in = new BufferedReader(new InputStreamReader(sock.getInputStream()));
				out = new PrintWriter((sock.getOutputStream()), true);
				System.out.println(sock + " 접속됨..");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		@Override
		public void run() {
			try {
				while (true) {
					String line = in.readLine();
					if (line == null)
						break;
					else
					{
						routine(line);
					}
				}
			} catch (Exception e) {
				removeClient(this);
				System.err.println(sock + "[" + id + "] 끊어짐...");
			}
		}

		public void routine(String line) {
			System.out.println("line:" + line);
			int idx = line.indexOf(':');
			String cmd = line.substring(0, idx); 
			String data = line.substring(idx + 1); 
			//ID:aaa;1234
			if (cmd.equals(ChatProtocol3.ID)) 
			{
				idx = data.indexOf(';');
				cmd = data.substring(0, idx);//aaa
				data = data.substring(idx+1);//1234
				if(mgr.loginChk(cmd, data)) {
					ClientThread3 ct = findClient(cmd);//aaa
					if(ct!=null&&ct.id.equals(cmd)) 
					{
						sendMessage(ChatProtocol3.ID+":"+"C");
					}
					else
					{
						id = cmd;
						sendMessage(ChatProtocol3.ID+":"+"T");
						sendAllMessage(ChatProtocol3.CHATLIST+":"+getIds());
						sendAllMessage(ChatProtocol3.CHATALL+":"+"["+id+"]왔다.");
					}
				}
				else 
				{
					sendMessage(ChatProtocol3.ID+":"+"F");
				}
			} 
			else if (cmd.equals(ChatProtocol3.CHAT)) {//CHAT:bbb(아이디);밥먹자
				idx = data.indexOf(';');
				cmd/* bbb */ = data.substring(idx);
				data/*밥먹자*/= data.substring(idx + 1);
				//bbb라는 아이디를 찾아야 한다.
				ClientThread3 ct = findClient(cmd);
				if (ct != null) {
					ct.sendMessage(ChatProtocol3.CHAT + ":" + "[" + id + "(S)]" + data); //bbb가 볼 메세지
					sendMessage(ChatProtocol3.CHAT + ":" + "[" + id + "(S)]" + data); //보낸 당사자 aaa가 볼 메세지
				} else {
					sendMessage(ChatProtocol3.CHAT + ":" + "[" + cmd +"] 접속자가 아닙니다." );
				}
			} 
			else if (cmd.equals(ChatProtocol3.MSGLIST))
			{
				//db에서 msglst 리턴 받아서 client로 보냄.
				Vector<MessageBean3> vlist = mgr2.getMsgList(id);
				String str= "";
				for(int i =0;i<vlist.size(); i++)
				{
					MessageBean3 bean = vlist.get(i);
					str+=bean.getFid()+",";
					str+=bean.getTid()+",";
					str+=bean.getMsg()+",";
				}
				sendMessage(ChatProtocol3.MSGLIST+":"+str);
			}
			else if (cmd.equals(ChatProtocol3.CHATALL)) 
			{
				sendAllMessage(ChatProtocol3.CHATALL + ":" + "[" + id + "]" + data);
			} 
			else if (cmd.equals(ChatProtocol3.MESSAGE))
			{
				idx = data.indexOf(';');
				cmd = data.substring(0, idx);
				data = data.substring(idx + 1);
				ClientThread3 ct = findClient(cmd);
				if (ct != null) {
					MessageBean3 bean = new MessageBean3();
					bean.setFid(id);
					bean.setTid(cmd);
					bean.setMsg(data);
					mgr2.insertMsg(bean);
					ct.sendMessage(ChatProtocol3.MESSAGE+":"+id+";"+data);
				} 
				else {//보낸 당사자 aaa가 볼 수 있는 메세지
					sendMessage(ChatProtocol3.CHAT + ":" + "[" + cmd + "] 접속자가 아닙니다..");
				}
			}
		}
		public void sendMessage(String msg) {
			out.println(msg);
		}
	}

	public static void main(String[] args) {
		new ChatServer3();
	}
}
