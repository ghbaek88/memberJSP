package member.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import member.been.MemberDTO;
import member.been.ZipcodeDTO;

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
    
    public List<ZipcodeDTO> getZipcodeList(String sido, String sigungu, String roadname){
    	List<ZipcodeDTO> list = new ArrayList<ZipcodeDTO>();
    	System.out.println(sido+","+sigungu+","+roadname);
    	getConnection();
    	String sql = "select * from newzipcode where sido like ? and (sigungu like ? or sigungu is null) and roadname like ? ";
    	//String sql = "select * from newzipcode where sido like ? and nvl(sigungu,'0') like ? and roadname like ?";
    	
    	try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, "%"+sido+"%");
			pstmt.setString(2, "%"+sigungu+"%");
			pstmt.setString(3, "%"+roadname+"%");
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ZipcodeDTO zipcodeDTO = new ZipcodeDTO();
				
				zipcodeDTO.setZipcode(rs.getString("zipcode"));
				zipcodeDTO.setSido(rs.getString("sido"));
				// 조건연산자 
				// 조건 ? 참 : 거짓
				zipcodeDTO.setSigungu(rs.getString("sigungu")==null ? "" : rs.getString("sigungu"));
				zipcodeDTO.setYubmyundong(rs.getString("yubmyundong"));				
				// 조건연산자 
				// 조건 ? 참 : 거짓
				zipcodeDTO.setRi(rs.getString("ri")==null ? "" : rs.getString("ri"));
				zipcodeDTO.setRoadname(rs.getString("roadname"));
				// 조건연산자 
				// 조건 ? 참 : 거짓
				zipcodeDTO.setBuildingname(rs.getString("buildingname")==null ? "" : rs.getString("buildingname"));

				list.add(zipcodeDTO);				
			}
			System.out.println(list.size());
			
		} catch (SQLException e) {
			e.printStackTrace();
			list = null;
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
		return list;
    }
    public String loginMember(String id, String pwd){
		String name = null;		
		getConnection();
		String sql = "select * from member where id=? and pwd=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			
			rs = pstmt.executeQuery(); // 실행
			
			if(rs.next())
			name = rs.getString("name");
			
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
		return name;
	}
    
    public MemberDTO modifyMember(String id) {
    	MemberDTO memberDTO = null;
    	//List<MemberDTO> list = new ArrayList<MemberDTO>();
    	getConnection();
    	String sql = "select * from member where id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery(); // 실행
			
			while(rs.next()) {
				memberDTO = new MemberDTO();
				
				memberDTO.setName(rs.getString("name"));
				memberDTO.setId(rs.getString("id"));
				memberDTO.setPwd(rs.getString("pwd"));
				memberDTO.setGender(rs.getString("gender"));
				memberDTO.setEmail1(rs.getString("email1"));
				memberDTO.setEmail2(rs.getString("email2"));
				memberDTO.setTel1(rs.getString("tel1"));
				memberDTO.setTel2(rs.getString("tel2"));
				memberDTO.setTel3(rs.getString("tel3"));
				memberDTO.setZipcode(rs.getString("zipcode"));
				memberDTO.setAddr1(rs.getString("addr1"));
				memberDTO.setAddr2(rs.getString("addr2"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
			memberDTO = null;
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
    	return memberDTO;    	
    }
    
    
    public int modifyMemberUpdate(MemberDTO memberDTO) {
    	int su = 0;
    	getConnection();
//    	String sql = "update member set name= ?, pwd= ?, gender= ?, "
//    				+ "email1= ?, email2= ?, "
//    				+ "tel1= ?, tel2= ?, tel=3 ?, "
//    				+ "zipcode= ?, addr1= ?, addr2= ? "
//    				+ "where id= ?";
    	String sql = "update member set name=?, pwd=?, gender=?, email1=?, email2=?, tel1=?, tel2=?, tel3=?, zipcode=?, addr1=?, addr2=? where id=?";
    	
    	try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, memberDTO.getName());
			pstmt.setString(2, memberDTO.getPwd());
			pstmt.setString(3, memberDTO.getGender());
			pstmt.setString(4, memberDTO.getEmail1());
			pstmt.setString(5, memberDTO.getEmail2());
			pstmt.setString(6, memberDTO.getTel1());
			pstmt.setString(7, memberDTO.getTel2());
			pstmt.setString(8, memberDTO.getTel3());
			pstmt.setString(9, memberDTO.getZipcode());
			pstmt.setString(10, memberDTO.getAddr1());
			pstmt.setString(11, memberDTO.getAddr2());
			pstmt.setString(12, memberDTO.getId());
			
			su = pstmt.executeUpdate();		
			
		} catch (SQLException e) {
			e.printStackTrace();			
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
    	return su;
    }
    
}// class MemberDAO

