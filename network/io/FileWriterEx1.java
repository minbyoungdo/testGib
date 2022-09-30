package io;
import java.io.*;
public class FileWriterEx1 
{

	public static void main(String[] args) 
	{
		String str ="dream as if you'll live forver,\n"+ "live as if you'll die today";
		
		try 
		{
			FileWriter fw = new FileWriter("io/bbb.txt");
			fw.write(str);
			fw.flush();
			fw.close();
			System.out.println("end");
		}
		catch(Exception e)
		{e.printStackTrace();}
	}
}
