package io;
import java.io.InputStream;
import java.io.*;
public class InputStreamEx1 
{
	public static void main(String[] args) 
	{
		InputStream is = System.in;
		//System이란느 클래스는 하드웨어로 키보드에 해당된다
		//System.out - 콘솔창을 의미한다.
		//inputStream은 입력의 입구/출력으로 가는 출구 /1byte단위로 보낼수 있다.
		while(true)
		{
			try 
			{
				int i= is.read();//내부적으로 쓰레드 대기 상태
				//a->65라는 아스키 코드?값(1byte)을 가지고 ->1byte인 아스키코드로 변환되어 vm에 전달된다. 그래서 int i = is.read();코드를 사용한다.
				if(i==-1)//-1==ctrl+z를 의미한다.
				{
					break;
				}	
				System.out.print((char)i);//-1이 아니면 char타입으로 변환해서 i를 출력하여라
			}
			catch(Exception e) 
			{e.printStackTrace();}//예왜의 모든 경로까지 출력
			
		}
	}
}
