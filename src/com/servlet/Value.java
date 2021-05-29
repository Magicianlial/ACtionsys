package com.servlet;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Value {

	public static String connect_state = null;
	public static String pub_topic = null;
	public static String receive_topic = null;
	
	public static String gasAlarm = null;
	public static String smokeAlarm = null;
	public static String fireAlarm =null;
	
	
    public static String get_Time() {
    	   
    	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
    	String date = df.format(new Date());// new Date()为获取当前系统时间，也可使用当前时间戳
    	return date;
		
	}
}
