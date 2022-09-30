package io;
import java.io.*;
public class FileReaderEx1 
{	//동일한 폴더에 존재하는 텍스트 파일 불러오기
	public static void main(String[] args) 
	{
		try
		{
			FileReader fr = new FileReader("io/aaa.txt");
			int i;
			while((i=fr.read())!=-1)
			{
				System.out.print((char)i);
			}
			fr.close();
		}
		catch(FileNotFoundException e)// new FileReader("io/aaa.txt");관련 에러 잡기 위해서 빨간줄 제거하기 위해서
		{e.printStackTrace();}
		catch(IOException e)//(i=fr.read())관련 에러 잡기 위해서 빨간줄 제거하기 위해서 사용되었다.
		{e.printStackTrace();}
		//catch의 순서는 상관없지만? 참조관계에 따라서는 순서에 에러가 뜰 수 있다. 하위객체 자손이 더 위로 가고 상위 객체가 더 아래 순으로 가야한다.
		//그래야 참조가 되기 대문이다.
		
	}
}
