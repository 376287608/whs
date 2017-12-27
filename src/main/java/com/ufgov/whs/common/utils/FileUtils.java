package com.ufgov.whs.common.utils;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.LinkedList;
import java.util.List;
import java.util.TimeZone;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.lang.StringUtils;

import com.ufgov.whs.system.utils.SysConstant;

import jcifs.smb.NtlmPasswordAuthentication;
import jcifs.smb.SmbFile;
import jcifs.smb.SmbFileOutputStream;
import jcifs.smb.SmbRandomAccessFile;

public class FileUtils {
	
	public static String genSaveFilePath(Calendar cc, String seprator) {
		String basePath = ConfigReader.getIns().getProperties("fileDir");
		// 指定东八区，即北京时间
		if (cc == null) {			
			cc = Calendar.getInstance(TimeZone.getTimeZone("GMT+8"));
		}
		int year = cc.get(Calendar.YEAR);
		// 月份是从0开始计数的，所以此处进行加1
		int month = cc.get(Calendar.MONTH) + 1;
		int day = cc.get(Calendar.DAY_OF_MONTH);
		StringBuffer result = new StringBuffer(basePath);
		result.append(seprator).append(SysConstant.FILE_FILE).append(seprator);
		result.append(year).append(seprator).append(month).append(seprator)
				.append(day).append(seprator);
		return result.toString();
	}
	
	/**
	 * 删除delDir下不以dateStr开头的文件夹
	 */
	public static void deleteOutdateFolders(String delDir, String dateStr) {
		if (StringUtils.isNotBlank(delDir)) {
			File dd = new File(delDir);
			if (dd.exists()) {
				File[] folders = dd.listFiles();
				if (folders != null && folders.length > 0) {
					for (File fo : folders) {
						if (!fo.getName().startsWith(dateStr)) {
							FileUtils.deleteAllFiles(fo, true);
						}
					}
				}
			}
		}
		
	}
	
	/**
	 * 把Array转成List
	 */
	public static <T> List<T> arrayToList(T[] array) {
		List<T> list = null;
		if (array != null) {			
			list = new ArrayList<T>(array.length);
			for (int i = 0; i < array.length; i++) {
				list.add(array[i]);
			}
		}
		return list;
	}
	
	/**
	 * 根据路径创建文件
	 * @param target  目标路径文件
	 * @param flag  路径不存在是否继续创建
	 * @return
	 */
	public static File generateFile(Object target, boolean flag) {
		File f = turnObjectToFile(target);
		if (f == null) {
			return null;
		}
		File dir = f.getParentFile();
		if (!dir.exists()) {
			if (flag) {						
				dir.mkdirs();
			} else {
				return null;
			}
		}
		return f;
	}
	
	/**
	 * 创建指定路径
	 * @param flag  路径不存在是否继续创建
	 * @return
	 */
	public static File generateDir(Object target, boolean flag) {
		File f = turnObjectToFile(target);
		if (f == null) {
			return null;
		}
		if (!f.exists()) {
			if (flag) {						
				f.mkdirs();
			} else {
				return null;
			}
		}
		return f;
	}

	/**
	 * 将字符串集合写入文件
	 */
	public static void writeToFile(List<String> txt, File file) {
		if (txt != null && txt.size() > 0 && file != null) {
			PrintWriter pw = null;
			try {				
				pw = new PrintWriter(file);
				for (String s : txt) {
					pw.write(s + System.getProperty("line.separator"));
				}
				pw.flush();
				pw.close();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (pw != null) {
					pw.close();
				}
			}
		}
	}
	
	/**
	 * 删除指定路径下所有文件和文件夹，true则连同本目录删除，false则只删除下级
	 */
	public static void deleteAllFiles(File dir, boolean flag) {
		if (dir != null && dir.isDirectory()) {
			if (dir.exists()) {
				File[] files = dir.listFiles();
				if (files != null && files.length > 0) {
					for (File f : files) {
						if (f.isDirectory()) {
							deleteAllFiles(f, false);
							f.delete();
						} else {							
							f.delete();
						}
					}
				}
				if (flag) {
					dir.delete();
				}
			}
		}
	}
	
	/**
	 * 获取远程文件，保存到本地
	 */
	public static List<File> getRemoteFilesToLocal(String domainName, String userName, String pwd, 
			String remoteFile, String localFile) {
		SmbRandomAccessFile smbRandFile = null;
		OutputStream output = null;
		try {
			NtlmPasswordAuthentication auth = new NtlmPasswordAuthentication(domainName, userName, pwd);
			SmbFile file = new SmbFile(remoteFile, auth);
			smbRandFile = new SmbRandomAccessFile(file, "r");
			output = new FileOutputStream(generateFile(localFile, true));
			byte[] buffer = new byte[1024 * 1024 * 4];
			for (int len = -1; (len = smbRandFile.read(buffer)) != -1;) {
				output.write(buffer, 0, len);
				output.flush();
			}
			output.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {				
				if (smbRandFile != null) {
					smbRandFile.close();
				}
				if (output != null) {
					output.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return null;
	}
	
	/**
	 * 获取远程文件，保存到本地
	 * 
	 */
	public static List<File> getRemoteFilesToLocal( String remoteFile, String localFile) {
		InputStream in = null;
		OutputStream output = null;
		try {
			//NtlmPasswordAuthentication auth = new NtlmPasswordAuthentication(domainName, userName, pwd);
			//SmbFile file = new SmbFile(remoteFile, auth);
			//smbRandFile = new SmbRandomAccessFile(file, "r");
			System.out.println("download:文件全路径为："+remoteFile);
			File file = new File(remoteFile);
			in = new FileInputStream(file);
			output = new FileOutputStream(generateFile(localFile, true));
			byte[] buffer = new byte[1024 * 1024 * 4];
			for (int len = -1; (len = in.read(buffer)) != -1;) {
				output.write(buffer, 0, len);
				output.flush();
			}
			output.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {				
				if (in != null) {
					in.close();
				}
				if (output != null) {
					output.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return null;
	}
	
	/**
	 * 把本地文件推送到远程服务器
	 */
	public static void pushLocalFileToRemote(String domainName, String userName, String pwd, 
			String remoteFile, String localFile) {
		InputStream in = null;
		OutputStream out = null;
		try {
			NtlmPasswordAuthentication auth = new NtlmPasswordAuthentication(domainName, userName, pwd);
			in = new BufferedInputStream(new FileInputStream(new File(localFile)));
			out = new BufferedOutputStream(new SmbFileOutputStream(new SmbFile(remoteFile, auth)));
			byte[] buffer = new byte[1024 * 1024 * 4];
			int len = 0; 
			while ((len = in.read(buffer, 0, buffer.length)) != -1) {
				out.write(buffer, 0, len);
			}
			out.flush(); 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (out != null) {
					out.close();
				}
				if (in != null) {
					in.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	/**
	 * 把本地文件推送到远程服务器
	 */
	public static void pushLocalFileToRemote(String remoteFile, String localFile) {
		InputStream in = null;
		OutputStream out = null;
		try {
			in = new BufferedInputStream(new FileInputStream(new File(localFile)));
			String filePath = remoteFile.substring(0, remoteFile.lastIndexOf(File.separator));
			File file = new File(filePath);
			if(!file.exists()){
				file.mkdirs();
			}
			out = new BufferedOutputStream(new FileOutputStream(new File(remoteFile)));
			byte[] buffer = new byte[1024 * 1024 * 4];
			int len = 0; 
			while ((len = in.read(buffer, 0, buffer.length)) != -1) {
				out.write(buffer, 0, len);
			}
			out.flush(); 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (out != null) {
					out.close();
				}
				if (in != null) {
					in.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * 按行读取文件，返回行的list
	 */
	public static List<String> readFile(Object fileObj) {
		List<String> list = new LinkedList<String>();
		File file = turnObjectToFile(fileObj);
		if (file == null) {
			return list;
		}
		BufferedReader br = null;
		try {				
			if (file.exists()) {
				br = new BufferedReader(new FileReader(file));
				String line = null;
				while ((line = br.readLine()) != null) {
					list.add(line);
				}
				br.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {					
				if (br != null) {
					br.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return list;
	}
	
	/**
	 * 按文件名正则匹配目录下的文件
	 * @param dir
	 * @param pattern
	 * @return List<File>
	 */
	public static List<File> getFileFromDir(File dir, String pattern) {
		List<File> list = new LinkedList<File>();
		if (dir != null && dir.exists() && dir.isDirectory()) {
			File[] files = dir.listFiles();
			if (files != null && files.length > 0) {
				Pattern p = Pattern.compile(pattern);
				for (File f : files) {
					String fName = f.getName();
					Matcher m = p.matcher(fName);
					if (m.find()) {
						list.add(f);
					}
				}
			}
		}
		return list;
	}
	
	/**
	 * 找到指定路径下的所有文件，包括子文件夹
	 */
	public static List<File> getAllFilesFromDir(File dir) {
		List<File> list = new LinkedList<File>();
		if (dir != null) {
			File[] files = dir.listFiles();
			if (files != null && files.length > 0) {
				for (File file : files) {
					if (file.isDirectory()) {
						list.addAll(getAllFilesFromDir(file));
					} else {
						list.add(file);
					}
				}
			}
		}
		return list;
	}
	
	public static File turnObjectToFile(Object obj) {
		if (obj != null) {
			if (obj instanceof String && StringUtils.isNotBlank((String) obj)) {
				return new File((String) obj);
			}
			if (obj instanceof File) {
				return (File) obj;
			}
		}
		return null;
	}
	
	 //获取项目的根路径  
    public static String classPath = FileUtils.class.getClassLoader().getResource("/").getPath();  
    //对项目的根路径进行解析，拿到项目路径  
      
    public static String getRootPath() {  
        String rootPath = "";  
        //windows下  
        if("\\".equals(File.separator)){  
            System.out.println("windows");  
        rootPath = classPath.substring(1,classPath.indexOf("/WEB-INF/classes"));  
        rootPath = rootPath.replace("/", "\\");  
        }  
        //linux下  
        if("/".equals(File.separator)){  
            System.out.println("linux");  
        rootPath = classPath.substring(0,classPath.indexOf("/WEB-INF/classes"));  
        rootPath = rootPath.replace("\\", "/");  
        }  
        return rootPath;  
        }  
    
    public static String getRootPath(String path) {  
        String rootPath = "";  
        //windows下  
        if("\\".equals(File.separator)){  
            System.out.println("windows");  
        rootPath = classPath.substring(1,classPath.indexOf("/"+path+"/WEB-INF/classes"));  
        rootPath = rootPath.replace("/", "\\");  
        }  
        //linux下  
        if("/".equals(File.separator)){  
            System.out.println("linux");  
        rootPath = classPath.substring(0,classPath.indexOf("/"+path+"/WEB-INF/classes"));  
        rootPath = rootPath.replace("\\", "/");  
        }  
        return rootPath;  
        }  
}
