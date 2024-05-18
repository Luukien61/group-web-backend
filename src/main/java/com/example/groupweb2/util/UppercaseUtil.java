package com.example.groupweb2.util;

public class UppercaseUtil {
    public static String toFirstUppercase(String source){
        return source.substring(0,1).toUpperCase()+source.substring(1);
    }
}
