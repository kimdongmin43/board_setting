package woo.edu.c.vo;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVo {


	/*게시판 번호*/
	private String bno;
	
	/* 게시판 제목 */
    private String title;
    
    /* 게시판 내용 */
    private String content;
    
    /* 게시판 작가 */
    private String writer;
    
    /* 날짜 */
    private Date ddate;


	
}
