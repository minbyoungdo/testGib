package net;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
public class URLEx1 {

	public static void main(String[] args) 
	{
		//네이버 주소
		String str="https://search.naver.com:80/search.naver?"
				+ "where=nexearch&sm=top_hty&fbm=1&ie=utf8&"
				+ "query=java#top";
		try {
			URL url = new URL(str);
			System.out.println("Protocol : "+url.getProtocol());//https
			System.out.println("Host : "+url.getHost());//serah.naver.com
			System.out.println("Port : "+url.getPort());//80
			System.out.println("Path : "+url.getPath());///search.naver
			System.out.println("Query : "+url.getQuery());// where=nexearch&sm=top_hty&fbm=1&ie=utf8&query=java
			System.out.println("Filename : "+url.getFile());///search.naver?where=nexearch&sm=top_hty&fbm=1&ie=utf8&query=java
			System.out.println("ref : "+url.getRef());//top - 스크롤 위치? 개발자 기준에서 중요하지 않지만 프론트 엔드에서는 중요하게 느낀다.
			url = new URL("https://www.naver.com/");//네이버 홈페이지 코드?를 가져온다 버퍼로
			BufferedReader br= new BufferedReader(new InputStreamReader(url.openStream(),"UTF-8"));
			String line ="";
			while(true)
			{
				line = br.readLine();
				if(line == null)break;
				System.out.println(line);
			}
			br.close();
			System.out.println("~~~~~~~~~~~end~~~~~~~~~~~~~~~~~~");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//search.naver? =naver는 확장자
}
