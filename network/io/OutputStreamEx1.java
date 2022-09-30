package io;
import java.io.*;
import java.io.OutputStream;
public class OutputStreamEx1 {

	public static void main(String[] args)
	{
		int i='A';
		char c= 'b';
		char c1 ='김';
		try
		{
			OutputStream os =System.out;//1바이트 단위로 보내는데 한글 한글자는 2바이트이기 때문에 에러?문자로 출력된다.
			os.write(c);//write와 print는 흡사함 쓴다와 출력
			os.write(c1);
			os.write(i);
			os.flush();//stream에 남은 데이터를 비운다.
			os.close();//사용 다했으니 닫겠다.
		}
		catch(Exception e) 
		{e.printStackTrace();}
	}

}
