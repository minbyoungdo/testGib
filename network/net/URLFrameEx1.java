package net;


import java.awt.Button;
import java.awt.Panel;
import java.awt.TextArea;
import java.awt.TextField;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.BufferedReader;
import java.io.FileWriter;
import java.io.InputStreamReader;
import java.net.URL;

import io.MFrame;

public class URLFrameEx1 extends MFrame implements ActionListener {

	TextArea ta;
	TextField tf;
	Button connect;
	Button save;

	public URLFrameEx1() {
		super(500, 500);
		setTitle("ViewHost");
		Panel p = new Panel();
		p.add(tf = new TextField("http://", 40));
		p.add(connect = new Button("connect"));
		p.add(save = new Button("save"));
		ta = new TextArea();
		add("North", p);
		add("Center", ta);
		//listener와 연결
		save.setEnabled(false);
		connect.addActionListener(this);
		save.addActionListener(this);
		tf.addActionListener(this);
		validate();
	}

	@Override 
	public void actionPerformed(ActionEvent e) 
	{
		Object obj = e.getSource();
		String host = tf.getText();
		if(obj== tf || obj== connect)//사이트 접속과 동시에 html 코드에 append한다.
		{
			ta.setText("");//초기화
			connectHost(host);
			save.setEnabled(true);
		}
		else if(obj == save)//ta에 문자열을 저장
		{
			createFile(host,ta.getText());//파일명 host 내용 ta의 내용
			save.setEnabled(false);
			tf.setText("http://");
			ta.setText("");
			ta.append("저장하였습니다.");
			tf.requestFocus();
		}
	}
	//독립적인 기능은 최대한 세부적으로 구현해야 한다.
	public void connectHost(String host)
	{
		try 
		{
			URL url = new URL(host);
			BufferedReader br= new BufferedReader(new InputStreamReader(url.openStream(),"UTF-8"));
			String line ="";
			while(true)
			{
				line = br.readLine();
				if(line == null)break;
				ta.append(line+"\n");
			}
			br.close();
		}
		catch(Exception e)
		{
			ta.append("해당되는 호스트가 없습니다.");
		}
	}
	//첫번째 매개변수는 파일명으로 지정합니다.
	public void createFile(String file, String content)
	{
		try 
		{
			FileWriter fw = new FileWriter("net/"+file.substring(7)+".txt");
			fw.write(content);
			fw.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}
	public static void main(String[] args) {
		URLFrameEx1 ex = new URLFrameEx1();
	}
}








