package io;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;

public class FileCopyEx3 {
	
	public static void main(String[] args) {
		copyFileByStream("C:/Temp/a.pptx", "C:/Temp/b.pptx");
	}
	
	public static void copyFileByStream(String sourcePath,
			String targetPath){
	        
	    File source = new File(sourcePath);
	    File target = new File(targetPath);
            
	    if(!source.exists()){
	      return;
	    }             
	    if(!target.getParentFile().exists()){
	      target.getParentFile().mkdirs();
	    }

	    try {
	     
	      InputStream inputStream = new FileInputStream(source);
	      OutputStream outputStream = new FileOutputStream(target);
	      int temp = 0;
	      byte[] data = new byte[1024];    
	      while ((temp = inputStream.read(data)) != -1){ 
	        outputStream.write(data,0,temp);
	      }

	      inputStream.close();
	      outputStream.close();
	    } catch (Exception e) {
	      e.printStackTrace();
	    }
	  }


}
