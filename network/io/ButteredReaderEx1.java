package io;
import java.io.*;

public class ButteredReaderEx1
{
	public static void main(String[] args) 
	{
		InputStream is = System.in;//stream
		InputStreamReader isr = new InputStreamReader(is);//문자처리
		BufferedReader br = new BufferedReader(isr);//버퍼기능
		//==아래와 위가 같다.
		/* BufferedReader br1 = new BufferedReader(new InputStreamReader(System.in)); */
		String s="";
		while(true)
		{
			try 
			{
				s=br.readLine();
				System.out.println("출력: "+s);
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
	}

}
