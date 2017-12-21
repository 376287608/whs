package com.ufgov.whs.system.web;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;


/**
 * 上传文件controller
 * @author fucj
 * @date 2017年8月24日
 */
@Controller
@RequestMapping(value = "test")
public class UploadController{
	
	@RequestMapping(value = "upload", method = RequestMethod.POST,produces = "text/plain;charset=UTF-8")
	@ResponseBody 
	   public String upload(MultipartHttpServletRequest request, HttpServletResponse response) throws IOException {                 

	  	 //0. notice, we have used MultipartHttpServletRequest

	  	 //1. get the file from the request object
		 Iterator<String> iter =  request.getFileNames();
		 while (iter.hasNext()) {
				String fileName = (String) iter.next();
				List<MultipartFile> files = request.getFiles(fileName);
				for (MultipartFile file : files) {
					String fileSrcName = file.getOriginalFilename();
					//String path = remoteFileUrl + basePath + uid;
					String path = "C:\\bstdlog\\"+fileSrcName;
					InputStream in = null;
					OutputStream out = null;
					try {
						in = new BufferedInputStream(file.getInputStream());
						out = new BufferedOutputStream(new FileOutputStream(path));

						byte[] buffer = new byte[1048576];
						int len = 0; // 读取长度
						while ((len = in.read(buffer, 0, buffer.length)) != -1) {
							out.write(buffer, 0, len);
						}
						out.flush(); // 刷新缓冲的输出流
					} catch (IllegalStateException e) {
						throw new IllegalStateException();
					} catch (IOException e) {
						try {
							throw new Exception("文件服务器暂时无法连接。");
						} catch (Exception e1) {
							// TODO Auto-generated catch block
							e1.printStackTrace();
						}
					} finally {
						try {
							if (out != null) {
								out.close();
							}
							if (in != null) {
								in.close();
							}
						} catch (Exception e) {
							throw new IOException("文件服务器暂时无法连接。");
						}
					}
	  	 //2. send it back to the client as <img> that calls get method
	  	 //we are using getTimeInMillis to avoid server cached image 

	  }
 }
	  	 return "hello";
	}	
}
