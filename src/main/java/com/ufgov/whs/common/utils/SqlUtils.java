package com.ufgov.whs.common.utils;

import java.lang.reflect.Field;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.ufgov.whs.approval.bean.ApprovalReport;
import com.ufgov.whs.approval.dao.ApprovalReportDao;


public class SqlUtils {
	
	public static final int DB_TYPE_ORACLE = 1;
	public static final int DB_TYPE_MYSQL = 2;
	
	/**
	 * 业务唯一编号
	 * 年份（4位） + 月份（2位） + 日（2位） + 来源标识（1位：0互联网申请、1柜台申请） + 业务编号（000开始），如：20170801 0 001；
	 * @param lar
	 * @param dao
	 * @param source 0互联网申请、1柜台申请
	 */
	public static synchronized void setBusinessVerifyCode(List<ApprovalReport> lar, 
			ApprovalReportDao dao, String source) {
		if (lar != null && lar.size() > 0 && dao != null) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			String dateStr = sdf.format(new Date());
			String maxCode = dao.getMaxBusinessVerifyCode("________" + source + "___");
			if (maxCode != null && maxCode.startsWith(dateStr)) {
				Integer start = Integer.valueOf(maxCode.substring(9, 12)) + 1;
				setBVC(lar, dateStr, source, start);
			} else {				
				setBVC(lar, dateStr, source, 0);
			}
		}
	}
	
	private static void setBVC(List<ApprovalReport> lar, String dateStr, String source, Integer start) {
		for (ApprovalReport ar : lar) {
			ar.setBusinessVerifyCode(dateStr + source + formatInteger(start, 3));
			start++;
		}
	}
	
	/**
	 * 把数字 1 变成字符串 001
	 * @param num  1
	 * @param scale 001总位数是3
	 * @return 001
	 */
	public static String formatInteger(Integer num, int scale) {
		if (num != null) {
			String s = "" + num;
			int len = s.length();
			if (len >= scale) {
				return s;
			} else {
				for (int i = 0; i < scale - len; i++) {
					s = "0" + s;
				}
				return s;
			}
		}
		return null;
	}
	
	public static <T> List<String> turnObjectToInsertSql(List<T> list, int dbType) {
		List<String> result = null;
		if (list != null && list.size() > 0) {
			result = new ArrayList<String>(list.size());
			for (T t : list) {
				Class<? extends Object> c = t.getClass();
				Field[] fs = c.getDeclaredFields();
				if (fs != null && fs.length > 0) {
					String classNameTemp = transformToSql(c.getSimpleName());
					String tableName= classNameTemp.substring(1, classNameTemp.length());
					StringBuffer fsb = new StringBuffer("(");
					StringBuffer vsb = new StringBuffer("(");
					for (Field f : fs) {
						try {						
							fsb.append(transformToSql(f.getName())).append(", ");
							vsb.append(getValueString(t, f, dbType)).append(", ");
						} catch (Exception e) {
							e.printStackTrace();
						}
					}
					fsb.setLength(fsb.length() - 2);
					fsb.append(") ");
					vsb.setLength(vsb.length() - 2);
					vsb.append(")");
					result.add("insert into " + tableName + " " + fsb.toString() 
						+ "values " + vsb.toString() + "; ");
				}
			}
		}
		return result;
	}

	private static <T> String getValueString(T t, Field f, int dbType) throws Exception {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		f.setAccessible(true);
		String result = null;
		switch (dbType) {
			case SqlUtils.DB_TYPE_ORACLE : {
				Object v = f.get(t);
				if (v != null) {					
					if (v instanceof String) {
						result = "'" + (String) v + "'";
					} else if (v instanceof Integer || v instanceof Long || v instanceof Character 
							|| v instanceof Byte || v instanceof Double || v instanceof Float 
							|| v instanceof Boolean) {
						result = "" + v;
					} else if (v instanceof Date) {
						result = "'" + sdf.format((Date)v) + "'";
					}
				}
			} break;
			case SqlUtils.DB_TYPE_MYSQL : {
				Object v = f.get(t);
				if (v != null) {					
					if (v instanceof String) {
						result = "'" + (String) v + "'";
					} else if (v instanceof Integer || v instanceof Long || v instanceof Character 
							|| v instanceof Byte || v instanceof Double || v instanceof Float 
							|| v instanceof Boolean) {
						result = "" + v;
					} else if (v instanceof Date) {
						result = "'" + sdf.format((Date)v) + "'";
					}
				}
			} break;
		}
		return result;
	}

	/**
	 * 把成员变量名字aBbCc变成a_bb_cc的形式
	 */
	private static String transformToSql(String name) {
		if (name != null && name.length() > 0) {
			char[] arr = name.toCharArray();
			String result = "";
			for (char c : arr) {
				if (c >= 'A' && c <= 'Z') {
					result += "_" + (char)(c + 32);
				} else {
					result += c;
				}
			}
			return result;
		}
		return null;
	}

}
