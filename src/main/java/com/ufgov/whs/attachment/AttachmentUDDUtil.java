package com.ufgov.whs.attachment;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import jcifs.smb.NtlmPasswordAuthentication;
import jcifs.smb.SmbFile;
import jcifs.smb.SmbFileOutputStream;
import jcifs.smb.SmbRandomAccessFile;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.support.DefaultMultipartHttpServletRequest;

import com.ufgov.whs.common.utils.UUIDUtil;

/**
 * 附件上传下载删除
 */
@Component
public class AttachmentUDDUtil {
	
	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	/**
	 * 上传附件
	 * @param sharedFolderPath 共享文件夹路径
	 * @param parentDirectory 存储文件的父目录
	 * @param multiRequest
	 * @throws Exception
	 */
	public List<Map<String,Object>> upload(String sharedFolderPath, String parentDirectory, 
			DefaultMultipartHttpServletRequest multiRequest) throws Exception {
		//定义存储附件的集合
		List<Map<String,Object>> fileList = new ArrayList<Map<String,Object>>();
		
		if (multiRequest != null) {				
			Iterator<String> iter = multiRequest.getFileNames();
			//multiRequest.getParameter("type");
			while (iter.hasNext()) {
				String fileName = iter.next();
				List<MultipartFile> files = multiRequest.getFiles(fileName);
				for (MultipartFile file : files) {
					//定义存储附件的对象
					Map<String,Object> fileMap = new HashMap<String,Object>();
					String fileIdAndName = UUIDUtil.genUUID();//附件id和名称相同（自动生成）
					String path = sharedFolderPath +File.separator+ parentDirectory + fileIdAndName;//附件全路径
					System.out.println("上传文件全路径为："+path);
					
					InputStream in = null;
					OutputStream out = null;
					try {
						String fileDir = sharedFolderPath +File.separator + parentDirectory;
						File filePath = new File(fileDir);
						if (!filePath.exists()){
							filePath.mkdirs();
						}
						in = new BufferedInputStream(file.getInputStream());
						out = new BufferedOutputStream(new FileOutputStream(path));

						byte[] buffer = new byte[1048576];
						int len = 0; // 读取长度
						while ((len = in.read(buffer, 0, buffer.length)) != -1) {
							out.write(buffer, 0, len);
						}
						out.flush(); // 刷新缓冲的输出流
					} catch (IllegalStateException e) {
						logger.error("上传文件时读写文件失败，" + e.getMessage());
						throw new IllegalStateException();
					} catch (IOException e) {
						logger.error("上传文件时读写文件失败，" + e.getMessage());
						throw new Exception("文件服务器暂时无法连接。");
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
					/**
					 * 保存附件每一个附件，需要的数据：
					 * 1.附件id，
					 * 2.附件名称，
					 * 3.附件原名称，
					 * 4.附件大小，
					 * 5.附件地址（从系统参数表取值），共享文件夹路径<传入的参数>
					 * 6.文件存储的父目录<传入的参数>
					 * 对应的数据格式如下：
					 * List<Map<String,Object>>
					 * map:
					 * key : value
					 * fileId : uuId;
					 * fileName : uuId;
					 * fileSrcName : fileSrcName;
					 * fileSize : fileSize;
					 * sharefloderPath : sharefloderPath;<传入的参数>
					 * parentDirectory : parentDirectory;<传入的参数>
					 */
					fileMap.put("fileId", fileIdAndName);//附件id
					fileMap.put("fileName", fileIdAndName);//附件名称
					fileMap.put("fileSrcName", file.getOriginalFilename());//附件原名称
					fileMap.put("fileSize", file.getSize());//附件大小
					fileMap.put("sharefloderPath", sharedFolderPath);//共享文件夹路径<传入的参数>
					fileMap.put("parentDirectory", parentDirectory);//文件存储的父目录<传入的参数>
					fileList.add(fileMap);
				}
			}
		}
		return fileList;
	}
	
	
	/**
	 * 上传附件
	 * @param sharedFolderPath 共享文件夹路径
	 * @param parentDirectory 存储文件的父目录
	 * @param domainName 登录验证：域名
	 * @param userName 登录验证：用户名
	 * @param password 登录验证：密码
	 * @param multiRequest
	 * @throws Exception
	 */
	public List<Map<String,Object>> upload(String sharedFolderPath, String parentDirectory, 
			String domainName, String userName, String password, 
			DefaultMultipartHttpServletRequest multiRequest) throws Exception {
		//定义存储附件的集合
		List<Map<String,Object>> fileList = new ArrayList<Map<String,Object>>();
		
		if (multiRequest != null) {
			SmbFile fileDir = null;
			NtlmPasswordAuthentication auth = null;
			try {
				auth = new NtlmPasswordAuthentication(domainName, userName, password);//登陆验证

				fileDir = new SmbFile(sharedFolderPath + parentDirectory, auth);
//				fileDir.connect();
			} catch (Exception e) {
				logger.error("上传文件时，读取远程文件失败，" + e.getMessage());
				throw new Exception("文件服务器暂时无法连接。");
			}
			if (!fileDir.exists())
				fileDir.mkdirs();
			Iterator<String> iter = multiRequest.getFileNames();
			//multiRequest.getParameter("type");
			while (iter.hasNext()) {
				String fileName = iter.next();
				List<MultipartFile> files = multiRequest.getFiles(fileName);
				for (MultipartFile file : files) {
					//定义存储附件的对象
					Map<String,Object> fileMap = new HashMap<String,Object>();
					String fileIdAndName = UUIDUtil.genUUID();//附件id和名称相同（自动生成）
					String path = sharedFolderPath + parentDirectory + fileIdAndName;//附件全路径
					
					InputStream in = null;
					OutputStream out = null;
					try {
						in = new BufferedInputStream(file.getInputStream());
						out = new BufferedOutputStream(new SmbFileOutputStream(new SmbFile(path, auth)));

						byte[] buffer = new byte[1048576];
						int len = 0; // 读取长度
						while ((len = in.read(buffer, 0, buffer.length)) != -1) {
							out.write(buffer, 0, len);
						}
						out.flush(); // 刷新缓冲的输出流
					} catch (IllegalStateException e) {
						logger.error("上传文件时读写文件失败，" + e.getMessage());
						throw new IllegalStateException();
					} catch (IOException e) {
						logger.error("上传文件时读写文件失败，" + e.getMessage());
						throw new Exception("文件服务器暂时无法连接。");
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
					/**
					 * 保存附件每一个附件，需要的数据：
					 * 1.附件id，
					 * 2.附件名称，
					 * 3.附件原名称，
					 * 4.附件大小，
					 * 5.附件地址（从系统参数表取值），共享文件夹路径<传入的参数>
					 * 6.文件存储的父目录<传入的参数>
					 * 对应的数据格式如下：
					 * List<Map<String,Object>>
					 * map:
					 * key : value
					 * fileId : uuId;
					 * fileName : uuId;
					 * fileSrcName : fileSrcName;
					 * fileSize : fileSize;
					 * sharefloderPath : sharefloderPath;<传入的参数>
					 * parentDirectory : parentDirectory;<传入的参数>
					 */
					fileMap.put("fileId", fileIdAndName);//附件id
					fileMap.put("fileName", fileIdAndName);//附件名称
					fileMap.put("fileSrcName", file.getOriginalFilename());//附件原名称
					fileMap.put("fileSize", file.getSize());//附件大小
					fileMap.put("sharefloderPath", sharedFolderPath);//共享文件夹路径<传入的参数>
					fileMap.put("parentDirectory", parentDirectory);//文件存储的父目录<传入的参数>
					fileList.add(fileMap);
				}
			}
		}
		return fileList;
	}
	
	/**
	 * 下载附件
	 * @param sharedFolderPath 共享文件夹路径
	 * @param parentDirectory 存储文件的父目录
	 * @param fileName 文件名称（上传时自动生成的名称）
	 * @param fileSrcName 文件原名称
	 * @param isCut 是否截取2K文件 0：截断文件，1：不截断文件
	 * @param response
	 * @throws Exception
	 */
	public void download(String sharedFolderPath, String parentDirectory, String fileName, 
			String fileSrcName, String isCut, HttpServletResponse response) throws Exception {
		//下载附件时，如果附件不存在的话，做处理TODO
		
//		InputStream input = null;
		InputStream in = null;
		OutputStream output = null;
		try {
			String filePath = sharedFolderPath+File.separator+parentDirectory+fileName;
			System.out.println("download:文件全路径为："+filePath);
			File file = new File(filePath);
			long fileLen = file.length();
//			file.setConnectTimeout(30000);
//			file.connect();
		    if("0".equals(isCut)){
		    	if(fileLen < 2048){
					logger.error("文件下载失败，源文件已损坏。");
					throw new Exception("文件下载失败，源文件已损坏。");
				}
		     }else if(!isCut.equals("1")){
		    	 logger.error("文件下载失败，参数isCut错误，不是0或1。");
		    	 throw new Exception("文件下载失败，参数isCut错误，不是0或1。");
		     }
//		    smbRandFile.setLength(fileLen);
//			input = new BufferedInputStream(new SmbFileInputStream(file));
			response.setCharacterEncoding("utf-8");
			fileSrcName = URLEncoder.encode(fileSrcName, "UTF-8");
			// fileSrcName = new String(fileSrcName.getBytes(), "iso-8859-1");
			// 设置文件MIME类型
			response.setContentType("application/octet-stream");
			// 设置Content-Disposition
			response.setHeader("Content-Disposition", "attachment;filename=" + fileSrcName);
			output = response.getOutputStream();	
			in = new FileInputStream(file);
			byte buf[] = new byte[1048576];
			if("0".equals(isCut)){
				/*
				long end = fileLen - 2048;
				for (int len = -1; (len = in.read(buf)) != -1;) {
					long p =  ;
					if(p < end){
						output.write(buf, 0, len);
						output.flush();
					}else{
						output.write(buf, 0, (int)(len-(p-end)));
						output.flush();
					}
				}*/
			}else if("1".equals(isCut)){
				for (int len = -1; (len = in.read(buf)) != -1;) {
					output.write(buf, 0, len);
					output.flush();
				}	
			}
		} catch (Exception e) {
			logger.error("下载文件时读写文件失败，" + e.getMessage());
			throw new IOException("文件服务器暂时无法连接。");
		} finally {
			try {
				if (in != null)
					in.close();
				if (output != null)
					output.close();
			} catch (Exception e) {
				logger.error("下载文件时关闭文件流失败，" + e.getMessage());
				throw new IOException("文件服务器暂时无法连接。");
			}
		}
	}	
	/**
	 * 下载附件
	 * @param sharedFolderPath 共享文件夹路径
	 * @param parentDirectory 存储文件的父目录
	 * @param fileName 文件名称（上传时自动生成的名称）
	 * @param domainName 登录验证：域名
	 * @param userName 登录验证：用户名
	 * @param password 登录验证：密码
	 * @param fileSrcName 文件原名称
	 * @param isCut 是否截取2K文件 0：截断文件，1：不截断文件
	 * @param response
	 * @throws Exception
	 */
	public void download(String sharedFolderPath, String parentDirectory, String fileName, 
			String domainName, String userName, String password, 
			String fileSrcName, String isCut, HttpServletResponse response) throws Exception {
		//下载附件时，如果附件不存在的话，做处理TODO
		
//		InputStream input = null;
		SmbRandomAccessFile smbRandFile = null;
		OutputStream output = null;
		try {
			NtlmPasswordAuthentication auth = new NtlmPasswordAuthentication(domainName, userName, password);//登陆验证

			SmbFile file = new SmbFile(sharedFolderPath + parentDirectory + fileName, auth);
			smbRandFile = new SmbRandomAccessFile(file, "r");
			long fileLen = smbRandFile.length();
//			file.setConnectTimeout(30000);
//			file.connect();

		    if("0".equals(isCut)){
		    	if(fileLen < 2048){
					logger.error("文件下载失败，源文件已损坏。");
					throw new Exception("文件下载失败，源文件已损坏。");
				}
		     }else if(!isCut.equals("1")){
		    	 logger.error("文件下载失败，参数isCut错误，不是0或1。");
		    	 throw new Exception("文件下载失败，参数isCut错误，不是0或1。");
		     }
//		    smbRandFile.setLength(fileLen);
//			input = new BufferedInputStream(new SmbFileInputStream(file));
			response.setCharacterEncoding("utf-8");
			fileSrcName = URLEncoder.encode(fileSrcName, "UTF-8");
			// fileSrcName = new String(fileSrcName.getBytes(), "iso-8859-1");
			// 设置文件MIME类型
			response.setContentType("application/octet-stream");
			// 设置Content-Disposition
			response.setHeader("Content-Disposition", "attachment;filename=" + fileSrcName);
			output = response.getOutputStream();
			
			byte buf[] = new byte[1048576];
			if("0".equals(isCut)){
				long end = fileLen - 2048;
				for (int len = -1; (len = smbRandFile.read(buf)) != -1;) {
					long p = smbRandFile.getFilePointer();
					if(p < end){
						output.write(buf, 0, len);
						output.flush();
					}else{
						output.write(buf, 0, (int)(len-(p-end)));
						output.flush();
					}
				}
			}else if("1".equals(isCut)){
				for (int len = -1; (len = smbRandFile.read(buf)) != -1;) {
					output.write(buf, 0, len);
					output.flush();
				}	
			}
		} catch (Exception e) {
			logger.error("下载文件时读写文件失败，" + e.getMessage());
			throw new IOException("文件服务器暂时无法连接。");
		} finally {
			try {
				if (smbRandFile != null)
					smbRandFile.close();
				if (output != null)
					output.close();
			} catch (Exception e) {
				logger.error("下载文件时关闭文件流失败，" + e.getMessage());
				throw new IOException("文件服务器暂时无法连接。");
			}
		}
	}
	/**
	 * 删除附件
	 * @param sharedFolderPath 共享文件夹路径
	 * @param parentDirectory 存储文件的父目录
	 * @param fileName 文件名称（上传时自动生成的名称）
	 * @return boolean
	 * @throws Exception
	 */
	@SuppressWarnings("finally")
	public String delete(String sharedFolderPath, String parentDirectory, String fileName) throws Exception {
		String message="";
		File tempFile = null;
		try {
			//NtlmPasswordAuthentication auth = new NtlmPasswordAuthentication(domainName, userName, password);//登陆验证
			String filePath = sharedFolderPath +File.separator+ parentDirectory + fileName;
			tempFile = new File(filePath);
			System.out.println("删除文件：文件全路径为"+filePath);
			if(tempFile.exists()){
				tempFile.delete();
				message = "删除成功";
	        }else{
	        	message = "删除失败，文件不存在";
	        }

		} catch (Exception e) {
			message="删除文件时，读取远程文件失败";
			logger.error("删除文件时，读取远程文件失败，" + e.getMessage());
			throw new IOException("文件服务器暂时无法连接。");
		}finally{
			return message;
		}
	}
	/**
	 * 删除附件
	 * @param sharedFolderPath 共享文件夹路径
	 * @param parentDirectory 存储文件的父目录
	 * @param fileName 文件名称（上传时自动生成的名称）
	 * @param domainName 登录验证：域名
	 * @param userName 登录验证：用户名
	 * @param password 登录验证：密码
	 * @return boolean
	 * @throws Exception
	 */
	@SuppressWarnings("finally")
	public String delete(String sharedFolderPath, String parentDirectory, String fileName, 
			String domainName, String userName, String password) throws Exception {
		String message="";
		SmbFile tempFile = null;
		try {
			NtlmPasswordAuthentication auth = new NtlmPasswordAuthentication(domainName, userName, password);//登陆验证
			tempFile = new SmbFile(sharedFolderPath + parentDirectory + fileName, auth);
			if(tempFile.exists()){
				tempFile.delete();
				message = "删除成功";
	        }else{
	        	message = "删除失败，文件不存在";
	        }

		} catch (Exception e) {
			message="删除文件时，读取远程文件失败";
			logger.error("删除文件时，读取远程文件失败，" + e.getMessage());
			throw new IOException("文件服务器暂时无法连接。");
		}finally{
			return message;
		}
	}
}
