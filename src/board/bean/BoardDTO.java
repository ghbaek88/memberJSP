package board.bean;

import java.util.Date;

import lombok.Data;

@Data
public class BoardDTO {
	private int seq, ref, lev, step, pseq, reply, hit;
	private String id, name, email, subject, content;
	private Date logtime;
}
