package com.ufgov.whs.common.utils;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import org.apache.log4j.Logger;

/**
 * 读取配置文件application.properties
 * 
 * @author wangfya
 *
 */
public class ConfigReader {
	protected Logger logger = Logger.getLogger(getClass());
	private static ConfigReader ins = new ConfigReader();

	private ConfigReader() {
	}

	public static ConfigReader getIns() {
		return ins;
	}

	public String getProperties(String key) {
		Properties prop = new Properties();
		String value = null;
		try {
			InputStream is = getClass().getResourceAsStream(
					"/application.properties");
			prop.load(is);
			value = prop.getProperty(key);
		} catch (FileNotFoundException e) {
			logger.error("application.properties配置文件没有找到");
		} catch (IOException e2) {
			logger.error("读取application.properties文件错误！");
		}
		return value;
	}
}
