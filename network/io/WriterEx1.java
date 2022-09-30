package io;
import java.io.*;
public class WriterEx1 
{
	public static void main(String[] args) 
	{
		int i='A';
		char c= 'b';
		char c1 ='김';
		
		try
		{
			OutputStream os = System.out;
			Writer writer = new OutputStreamWriter(os);
			Writer writer1 = new OutputStreamWriter(System.out);
			writer.write(i);
			writer.write(c);
			writer.write(c1);
			writer1.write(c1);
			writer1.write(c);
			writer1.write(i);
			writer.flush();
			writer1.flush();
			writer.close();
			writer1.close();
		}
		catch(Exception e) 
		{e.printStackTrace();}
	}
}
