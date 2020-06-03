package member.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberDAO {
    private static MemberDAO instance; // 싱글톤이라는 티를 팍팍 낸다.
    
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String userName = "c##java";
	private String password = "bit";
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;		
   
    public MemberDAO() {
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
    
    public static MemberDAO getInstance() { 
    	if(instance == null) {
    		// 스레드 동기화 (MemberDAO.class로 아무리 많이 들어와도 한사람만 처리한다?? 락을 건다??) 
    		synchronized(MemberDAO.class) {
    			instance = new MemberDAO(); // 메모리에 한번밖에 생성이 안된다.
			}
    	}
        return instance;
    }// getInstance()
    
    public boolean isExistId(String id) {
    	boolean exist = false;
    	getConnection();
    	//String sql = "select count(*) as count from member where id=?";
    	String sql = "select * from member where id=?";
    	try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
//			if(rs.next()) {
//				if(rs.getInt("count") != 0)
//					exist = true;
//				else
//					exist = false;	
//			}	
			if(rs.next()) exist = true;
		} catch (SQLException e) {
			e.printStackTrace();
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
    	return exist;
    }// isExistId()
    
}// class MemberDAO

