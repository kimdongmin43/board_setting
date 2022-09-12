package woo.edu.c.vo;

import java.util.Date;

import lombok.Data;

@Data
public class CalendarVo {
	
	private int calNo;
	
	private String calYear;
	
	private String calMonth;
	
	private String calDay;
	
	private String calTime;
	
	private String calReq;
	
	private Date calDate;
	
	private String calContents;

}
