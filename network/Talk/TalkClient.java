package Talk;

import java.awt.BorderLayout;
import java.awt.Button;
import java.awt.Color;
import java.awt.Dialog;
import java.awt.GridLayout;
import java.awt.Label;
import java.awt.Panel;
import java.awt.TextArea;
import java.awt.TextField;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.io.BufferedReader;
import java.io.FileWriter;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;
import java.util.StringTokenizer;

import io.MFrame;




public class TalkClient extends MFrame implements ActionListener, Runnable
{
	Button  saveBtn, sendBtn;
	TextField sendTf;
	TextArea ta;
	Panel p1;
	Panel p2;
	BufferedReader in;
	PrintWriter out;
	String title = "Talk 1.0";
	String id;
	int check = 0;
	public TalkClient(BufferedReader in, PrintWriter out, String id)
	{
		super(350,400,new Color(200, 100, 200));
		this.in = in;
		this.out = out;
		this.id = id; 
		p1 = new Panel();
		p1.setBackground(new Color(200, 100, 200));
		p1.add(saveBtn = new Button("Save"));
		setTitle(title);
		ta = new TextArea();
		ta.setBackground(Color.DARK_GRAY);
		ta.setForeground(Color.GREEN);
		ta.setEditable(false);
		add(BorderLayout.CENTER, ta);
		
		
		p2 = new Panel();
		p2.setBackground(new Color(200, 100, 200));
		sendTf = new TextField("", 25);
		sendTf.addActionListener(this);
		sendBtn = new Button("SEND");
		sendBtn.addActionListener(this);
		p2.add(sendTf);
		p2.add(sendBtn);	
		
		sendTf.addActionListener(this);
		saveBtn.addActionListener(this);
		
		add(p1,BorderLayout.NORTH);
		add(ta=new TextArea());
		add(p2,BorderLayout.SOUTH);
		new Thread(this).start();
		validate();
	}
	
	@Override
	public void run() {
		try
		{
			while(true)
			{
				String line =null;
				line = in.readLine();
				if(line==null)
					break;
			}
		}
		catch(Exception e)
		{
			System.err.println("error in run");
			e.printStackTrace();
			System.exit(1);
		}
	}
	
	
	public void sendMessage(String msg) 
	{
		//out.println(msg);
		ta.append(msg+"\n");
	}
	
	
	@Override
	public void actionPerformed(ActionEvent e) 
	{
		Object obj = e.getSource();
		if(obj==saveBtn/*save*/) 
		{
			String content = ta.getText();
			long fileName = System.currentTimeMillis();
			try 
			{
				FileWriter fw = new FileWriter("Talk/"+fileName+".txt");
				fw.write(content);
				fw.close();
				ta.setText("");
				new MDialog(this, "Save", "대화내용을 저장했습니다..");
			} 
			catch (Exception e2)
			{
				e2.printStackTrace();
			}
		}
		else if(obj==sendBtn ||obj==sendTf) 
		{
			String str = sendTf.getText();
			if(filterMgr(str) && check==0 && !str.equals("")) 
			{
				new MDialog(this, "경고", "입력하신 글짜는 금지어입니다.");
				check++;
				return;
			}
			else if(!str.equals(""))
			{
					String msg = null; 
					msg = "["+id+"]"+str;
					sendMessage(msg);
			}
			sendTf.setText("");
			sendTf.requestFocus();
			check =0;
		}
	}
	public boolean filterMgr(String msg){
		boolean flag = false;
		String str[] = {"바보","개새끼","새끼","자바","java"};
		StringTokenizer st = new StringTokenizer(msg);
		String msgs[] = new String[st.countTokens()];
		for (int i = 0; i < msgs.length; i++) 
		{
			msgs[i] = st.nextToken();
		}
		for (int i = 0; i < str.length; i++) 
		{
			if(flag) break;
			for (int j = 0; j < msgs.length; j++)
			{
				if(str[i].equalsIgnoreCase(msgs[j])) 
				{
					flag = true;
					break; 
				}
			}
		}
		return flag;
	}
	
	class MDialog extends Dialog implements ActionListener
	{
		Button ok;
		TalkClient ct2;
		public MDialog(TalkClient ct2,String title, String msg)
		{
			super(ct2, title, true);
			this.ct2 = ct2;
			
			   addWindowListener(new WindowAdapter() 
			   {
				   public void windowClosing(WindowEvent e) 
				   {
					   dispose();
				   }
			   });
			   setLayout(new GridLayout(2,1));
			   Label label = new Label(msg, Label.CENTER);
			   add(label);
			   add(ok = new Button("확인"));
			   ok.addActionListener(this);
			   layset();
			   setVisible(true);
			   validate();
		}
		
		public void layset()
		{
			int x = ct2.getX();
			int y = ct2.getY();
			int w = ct2.getWidth();
			int h = ct2.getHeight();
			int w1 = 150;
			int h1 = 100;
			setBounds(x + w / 2 - w1 / 2, 
					y + h / 2 - h1 / 2, 200, 100);
		}

		@Override
		public void actionPerformed(ActionEvent e) 
		{
			if(e.getSource()==sendBtn){
				sendMessage(id+";"+ ta.getText());
			}
			setVisible(false);
			dispose();
		}
	}
}
