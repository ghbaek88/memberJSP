package board.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import member.dao.MemberDAO;

import java.util.ArrayList;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import board.bean.BoardDTO;

public class BoardDAO {
	private static BoardDAO instance; // 싱글톤이라는 티를 팍팍 낸다.
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;

	public BoardDAO() {
		// 드라이버로딩
    	Context ctx;
		try {
			ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
			//ds = (DataSource)ctx.lookup("jdbc/oracle"); 톰캣이 아닌경우에는 이렇게 써도됨
		} catch (NamingException e) {
			e.printStackTrace();
		}
	} // 생성자

	public static BoardDAO getInstance() {
		if (instance == null) {
			// 스레드 동기화 (MemberDAO.class로 아무리 많이 들어와도 한사람만 처리한다?? 락을 건다??)
			synchronized (MemberDAO.class) {
				instance = new BoardDAO(); // 메모리에 한번밖에 생성이 안된다.
			}
		}
		return instance;
	}// getInstance()

	public void writeBoard(Map<String, String> map) {		
		String sql = "insert into board(seq,id,name,email,subject,content,ref) "
				+ "values(seq_board.nextval,?,?,?,?,?,seq_board.nextval)";

		try {
			conn = ds.getConnection(); // 오라클 접속
			
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, map.get("id"));
			pstmt.setString(2, map.get("name"));
			pstmt.setString(3, map.get("email"));
			pstmt.setString(4, map.get("subject"));
			pstmt.setString(5, map.get("content"));

			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				// 끊을때는 반대로 끊어야 한다!
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	// DB에서 데이터 불러오기
	public ArrayList<BoardDTO> getBoardList(int startNum, int endNum) {
		ArrayList<BoardDTO> ar = new ArrayList<BoardDTO>();
		/*
		 * String sql = "select * from (select rownum rn, tt.*" +
		 * " from (select seq,id,name,email,subject,content,ref,lev,step,pseq,reply,hit, to_char(logtime,'YYYY.MM.DD') as logtime"
		 * + " from board order by ref desc, step asc)tt)" + " where rn>=? and rn<=?";
		 */
		String sql = "select * from (select rownum rn, tt.* from (select * from board order by ref desc, step asc)tt) where rn>=? and rn<=?";

		// String sql = "select * from (select rownum rn, tt.* from (select a.*,
		// to_char(a.logtime, 'yyyy.mm.dd') as logdate from board a; order by ref desc,
		// step asc)tt) where rn>=? and rn<=?";

		try {
			conn = ds.getConnection(); // 오라클 접속
			
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, startNum);
			pstmt.setInt(2, endNum);

			rs = pstmt.executeQuery();
			while (rs.next()) {

				BoardDTO boardDTO = new BoardDTO();
				boardDTO.setSeq(rs.getInt("seq"));
				boardDTO.setId(rs.getString("id"));
				boardDTO.setName(rs.getString("name"));
				boardDTO.setEmail(rs.getNString("email"));
				boardDTO.setSubject(rs.getString("subject"));
				boardDTO.setContent(rs.getString("content"));
				boardDTO.setRef(rs.getInt("ref"));
				boardDTO.setLev(rs.getInt("lev"));
				boardDTO.setStep(rs.getInt("step"));
				boardDTO.setPseq(rs.getInt("pseq"));
				boardDTO.setReply(rs.getInt("reply"));
				boardDTO.setHit(rs.getInt("hit"));
				boardDTO.setLogtime(rs.getDate("logtime"));

				ar.add(boardDTO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			ar = null;
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return ar;
	}

	public BoardDTO getBoard(int seq) {
		BoardDTO boardDTO = new BoardDTO();
		String sql = "select * from board where seq=?";
		try {
			conn = ds.getConnection(); // 오라클 접속
						
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, seq);
			
			rs = pstmt.executeQuery();
			while (rs.next()) {
				boardDTO.setSeq(rs.getInt("seq"));
				boardDTO.setId(rs.getString("id"));
				boardDTO.setName(rs.getString("name"));
				boardDTO.setEmail(rs.getString("email"));
				boardDTO.setSubject(rs.getString("subject"));
				boardDTO.setContent(rs.getString("content"));
				boardDTO.setRef(rs.getInt("ref"));
				boardDTO.setLev(rs.getInt("lev"));
				boardDTO.setStep(rs.getInt("step"));
				boardDTO.setPseq(rs.getInt("pseq"));
				boardDTO.setReply(rs.getInt("reply"));
				boardDTO.setHit(rs.getInt("hit"));
				boardDTO.setLogtime(rs.getDate("logtime"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return boardDTO;
	}
	
	public int getTotalA() {
		int totalA = 0;

		String sql ="select count(*) from board";
		try {
			conn = ds.getConnection(); // 오라클 접속
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			rs.next();
			totalA = rs.getInt(1);			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return totalA;
	}	
	
	public void modifyBoard(Map<String, String> map) {
		String sql = "update board set subject=?, content=?, logtime=sysdate where seq=?";

		try {
			conn = ds.getConnection(); // 오라클 접속
			
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, map.get("subject"));
			pstmt.setString(2, map.get("content"));
			pstmt.setString(3, map.get("seq"));
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				// 끊을때는 반대로 끊어야 한다!
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
