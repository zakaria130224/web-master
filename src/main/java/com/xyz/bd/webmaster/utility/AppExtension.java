package com.xyz.bd.webmaster.utility;

import org.springframework.util.DigestUtils;

public class AppExtension {
    public static String toMD5(String str)
    {
        return DigestUtils.md5DigestAsHex(str.getBytes()).toUpperCase();
    }
}
