package board.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import member.dao.MemberDAO;

import java.util.ArrayList;
import java.util.Map;

import board.bean.BoardDTO;


public class BoardDAO {
	private static BoardDAO instance; // 싱글톤이라는 티를 팍팍 낸다.

	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String userName = "c##java";
	private String password = "bit";

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public BoardDAO() {
    	// 드라이버로딩
		try {
			Class.forName(driver);
			System.out.println("드라이버 로딩 성공!");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} 	
	} // 생성자

	// 오라클 접속하기
	public void getConnection() {
		try {
			conn = DriverManager.getConnection(url, userName, password);
			System.out.println("오라클 접속 성공!");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}// getConnection()

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
		getConnection();
		String sql = "insert into board(seq,id,name,email,subject,content,ref) "
				+ "values(seq_board.nextval,?,?,?,?,?,seq_board.nextval)";
		
		try {
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
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	// DB에서 데이터 불러오기
	public ArrayList<BoardDTO> getBoardList(int startNum, int endNum){
		ArrayList<BoardDTO> ar = new ArrayList<BoardDTO>();
		getConnection();
		String sql = "select * from (select rownum rn, tt.* from (select seq,id,name,email,subject,content,ref,lev,step,pseq,reply,hit, to_char(logtime,'YYYY.MM.DD') as logtime"
				+ " from board order by seq desc)tt)"
				+ " where rn>=? and rn<=?";
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, startNum);
			pstmt.setInt(2, endNum);
		
			rs = pstmt.executeQuery();
			while(rs.next()) {
				
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
				boardDTO.setLogtime(rs.getString("logtime"));
			
				ar.add(boardDTO);
			}				
		} catch (SQLException e) {
			e.printStackTrace();
			ar = null;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}		
		return ar;
	}
}
