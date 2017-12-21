package com.ufgov.whs.common.utils;

import java.util.UUID;

/**
  * @ClassName: UUIDUtil
  * @Description: UUID生成工具類
  * @author Comsys-Gaoming
  * @date 2015年4月29日 下午9:00:42
 */
public class UUIDUtil {
    private UUIDUtil() {
        throw new Error("禁止实例化");
    }

    /**
      * genUUID 产生32位UUID
      * @Title: genUUID
      * @Description: 产生32位UUID
      * @return String UUID
     */
    public static String genUUID() {
        return UUID.randomUUID().toString().replace("-", "");
    }

}
