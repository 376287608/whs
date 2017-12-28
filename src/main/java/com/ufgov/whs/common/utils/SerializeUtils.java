package com.ufgov.whs.common.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.LinkedList;
import java.util.List;

public class SerializeUtils {
	
	/**
	 * 把对象集合序列化到指定路径下
	 * @param objs
	 * @param dir
	 */
	public static <T> void serializeObjectToFile(List<T> objs, File dir) {
		if (objs != null && dir != null && dir.isDirectory()) {
			int count = 0;
			for (T t : objs) {
				File file = new File(dir.getAbsolutePath() + File.separator + count);
				ObjectOutputStream out = null;
				try {
					out = new ObjectOutputStream(new FileOutputStream(file));
					out.writeObject(t);
					out.flush();
					out.close();
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					if (out != null) {
						try {
							out.close();
						} catch (IOException e) {
							e.printStackTrace();
						}
					}
				}
				count++;
			}
		}
	}
	
	/**
	 * 从文件中恢复被序列化的对象
	 * @param files
	 * @return
	 */
	public static <T> List<Object> getObjectFromFile(List<File> files) {
		List<Object> objs = new LinkedList<Object>();
		if (files != null && files.size() > 0) {
			for (File file : files) {
				ObjectInputStream in = null;
				try {
					in = new ObjectInputStream(new FileInputStream(file));
					Object obj = in.readObject();
					objs.add(obj);
					in.close();
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					if (in != null) {
						try {
							in.close();
						} catch (IOException e) {
							e.printStackTrace();
						}
					}
				}
			}
		}
		return objs;
	}

}
