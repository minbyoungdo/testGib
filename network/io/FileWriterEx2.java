package io;

import java.awt.BorderLayout;
import java.awt.Button;
import java.awt.Panel;
import java.awt.TextArea;
import java.awt.TextField;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.FileWriter;
import java.io.IOException;

public class FileWriterEx2 extends MFrame
implements ActionListener{
	
	TextArea ta;
	TextField tf;
	Button save;
	
	public FileWriterEx2() {
		super(300, 400);
		setTitle("FileWriterFrameEx1");
		add(ta=new TextArea());
		Panel p = new Panel();
		p.add(tf = new TextField(30));
		p.add(save = new Button("SAVE"));
		ta.setEditable(false);
		tf.addActionListener(this);
		save.addActionListener(this);
		add(p,BorderLayout.SOUTH);
		validate();
	}
	
	@Override
	public void actionPerformed(ActionEvent e) 
	{
		Object obj = e.getSource();
		if(obj == tf)
		{	
			ta.append(tf.getText()+"\n" );
			tf.setText("");
			tf.requestFocus();
		}
		else if(obj==save)
		{
			saveFile(ta.getText());
			ta.setText("");
		}
	}
	
	public void saveFile(String str) 
	{
		try 
		{	
			//19700101 0시부터 현재까지 1초를 1000단위로 계산한 값 - 유니크하다->유일할 가능성이 높기때문에 파일값으로 사용했다 여기서는
			long name = System.currentTimeMillis();
			FileWriter fw= new FileWriter("io/"+name+".txt");
			fw.write(str);
			fw.flush();
			fw.close();
		}
		catch(Exception e) {e.printStackTrace();}
	}
	

	public static void main(String[] args) 
	{
		new FileWriterEx2();
	}
}






