package io;
import java.io.*;
//Reader 스트림의 한글 처리 클래스
public class ReaderEx1 {

	public static void main(String[] args) 
	{
		InputStream is = System.in;
		Reader reader = new InputStreamReader(is);
		//Reader는 추상 클래스
		//InputStreamReader는 일반 클래스
		//바이트 단위의 data를 문자 단위로 처리하는 클래스
		try
		{
			while(true)
			{
				int i = reader.read();
				if(i==-1)
					break;
				System.out.print((char)i);
			}
			reader.close();
			is.close();
		}
		catch(Exception e) {e.printStackTrace();}
	}
}
