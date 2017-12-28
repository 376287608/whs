package com.ufgov.whs.common.utils;

import java.beans.BeanInfo;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class MapBeanUtil {
	
	private static final  Logger logger = LoggerFactory.getLogger(MapBeanUtil.class);
    /**
	 * 将一个 Map 对象转化为一个 JavaBean
	 * 
	 * @param type
	 *            要转化的类型
	 * @param map
	 *            包含属性值的 map
	 * @return 转化出来的 JavaBean 对象
	 */
    public static Object map2bean(Class<?> type, Map<String, Object> map) throws Exception {
		BeanInfo beanInfo = Introspector.getBeanInfo(type); // 获取类属性
		Object obj = type.newInstance(); // 创建 JavaBean 对象
        // 给 JavaBean 对象的属性赋值
        PropertyDescriptor[] propertyDescriptors = beanInfo
                .getPropertyDescriptors();
        //map中key变为驼峰形式
        map = captureMap(map);
        for (int i = 0; i < propertyDescriptors.length; i++) {
            PropertyDescriptor descriptor = propertyDescriptors[i];
            String propertyName = descriptor.getName();
            if (map.containsKey(propertyName)) {
                Object value = map.get(propertyName);
                Object[] args = new Object[1];
                args[0] = value;
                descriptor.getWriteMethod().invoke(obj, args);
            }
        }
        return obj;
    }
    
    /**
     * 把Map中带“_”的key变为驼峰形式
     * @param map
     * @return
     */
    public static Map<String,Object> captureMap(Map<String,Object> map){
    	if(map == null) return null;
    	Set<String> keySet = map.keySet();
    	Map<String,Object> tempMap = new HashMap<String, Object>();
    	for(String key : keySet){
    		if(key.contains("_")){
    			Object value = map.get(key);
    			tempMap.put(captureName(key), value);
    		}
    	}
    	map.putAll(tempMap);
    	return map ;
    }
    
    /**
     * 把带“_”的字符串改成驼峰形式
     * @param str
     * @return
     */
    public static String captureName(String str){
    	if(str == null || str.trim().isEmpty()){
    		return null ;
    	}
    	String[] names = str.split("_");
    	String temp = names[0] ;
    	for(int i=1;i<names.length;i++){
    		temp += names[i].substring(0, 1).toUpperCase() + names[i].substring(1);
    	}
    	return temp ;
    }
    
    
    
    /**
	 * 将javaBean转换成Map
	 * 
	 * @param javaBean
	 *            javaBean
	 * @return Map对象
	 */
	public static Map<String, Object> toMap(Object javaBean) {
		Map<String, Object> result = new HashMap<String, Object>();
		
		// 获取父类参数
		Class<?> superClazz = javaBean.getClass().getSuperclass();
		while (superClazz != Object.class) {
			Method[] methods = javaBean.getClass().getSuperclass()
					.getDeclaredMethods();

			for (Method method : methods) {
				try {
					if (method.getName().startsWith("get")) {
						String field = method.getName();
						field = field.substring(field.indexOf("get") + 3);
						field = field.toLowerCase().charAt(0)
								+ field.substring(1);

						Object value = method.invoke(javaBean, (Object[]) null);
						result.put(field, null == value ? "" : value);
					}
				} catch (Exception e) {
					logger.error(e.getMessage());
				}
			}

			superClazz = superClazz.getClass().getSuperclass();

		}

		Method[] methods = javaBean.getClass().getDeclaredMethods();

		for (Method method : methods) {
			try {
				if (method.getName().startsWith("get")) {
					String field = method.getName();
					field = field.substring(field.indexOf("get") + 3);
					field = field.toLowerCase().charAt(0) + field.substring(1);
					Object value = method.invoke(javaBean, (Object[]) null);
					result.put(field, null == value ? "" : value);
				}
			} catch (Exception e) {
				logger.error(e.getMessage());
			}
		}

		return result;
	}
    
    
}
