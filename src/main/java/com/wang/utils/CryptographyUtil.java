package com.wang.utils;

import org.apache.ibatis.jdbc.Null;
import org.apache.shiro.crypto.hash.Md5Hash;

public class CryptographyUtil {
    //MD5加密
    public static String md5(String str,String salt){
        return new Md5Hash(str,salt).toString();
    }
}
