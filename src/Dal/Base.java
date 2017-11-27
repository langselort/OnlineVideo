package Dal;
import java.util.*;
import java.util.Date;
import java.text.*;

public class Base {
		/**
	　　 * 获取当前日期是星期几<br>
	　　 *
	　　 * @param dt
	　　 * @return 当前日期是星期几
	　　 */
	 public static int getWeekOfNum(Date dt) {
	int[] weekDays = {0, 1, 2, 3, 4, 5, 6};
	Calendar cal = Calendar.getInstance();
	cal.setTime(dt);
	int w = cal.get(Calendar.DAY_OF_WEEK) - 1;
	if (w < 0)
		w = 0;
	return weekDays[w];
	}
	 
	 /**
　　 * 获取当前日期是星期几<br>
　　 *
　　 * @param dt
　　 * @return 当前日期是星期几
　　 */
	public static String getWeekOfCn(Date dt) {
		String[] weekDays = {"星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"};
		Calendar cal = Calendar.getInstance();
		cal.setTime(dt);
		int w = cal.get(Calendar.DAY_OF_WEEK) - 1;
		if (w < 0)
		w = 0;
		return weekDays[w];
	}
	
	//STRING到日期 
	public static java.sql.Date stringToDate(String dateStr) 
	{ 
		return java.sql.Date.valueOf(dateStr); 
	} 
	//日期到STRING 
	public static String dateToString(java.sql.Date datee) 
	{ 
		return datee.toString(); 
	}
	
	///获取天差
	public static long GetDay(Date starttime,Date endTime)
	{
		long  day=(endTime.getTime()-starttime.getTime())/(24*60*60*1000);
		return day;
	}
	
	///获取小时差
	public static long GetHours(Date starttime,Date endTime)
	{
		long  hours=(endTime.getTime()-starttime.getTime())/(60*60*1000);
		return hours;
	}
	
	///获取分钟差
	public static long GetMinutes(Date starttime,Date endTime)
	{
		long  minutes=(endTime.getTime()-starttime.getTime())/(60*1000);
		return minutes;
	}
}
