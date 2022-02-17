package com.sist.dao;
import java.sql.*;
import java.util.*;
import javax.sql.*; // DataSource
import javax.naming.*; // Context 
public class DataBoardDAO {
    private Connection conn;
    private PreparedStatement ps;
    public void getConnection()
    {
    	try
    	{
    		Context init=new InitialContext();
    		Context c=(Context)init.lookup("java://comp//env");
    		DataSource ds=(DataSource)c.lookup("jdbc/oracle");
    		conn=ds.getConnection();
    	}catch(Exception ex)
    	{
    		ex.printStackTrace();
    	}
    }
    // 사용후에 반환 => POOL(Connection객체 관리 영역)
    public void disConnection()
    {
    	try
    	{
    		if(ps!=null) ps.close();
    		if(conn!=null) conn.close();
    	}catch(Exception ex) {}
    }
    
    public List<DataBoardVO> databoardListData(int page)
    {
    	List<DataBoardVO> list=new ArrayList<DataBoardVO>();
    	try
    	{
    		getConnection();
    		String sql="SELECT no,subject,name,regdate,hit,group_tab,num "
    				  +"FROM (SELECT no,subject,name,regdate,hit,group_tab,rownum as num "
    				  +"FROM (SELECT no,subject,name,regdate,hit,group_tab "
    				  +"FROM databoard ORDER BY group_id DESC, group_step ASC)) "
    				  +"WHERE num BETWEEN ? AND ?";
    		int rowSize=10;
    		int start=(rowSize*page)-(rowSize-1);
    		int end=rowSize*page;
    		
    		ps=conn.prepareStatement(sql);
    		ps.setInt(1, start);
    		ps.setInt(2, end);
    		
    		ResultSet rs=ps.executeQuery();
    		while(rs.next())
    		{
    			DataBoardVO vo=new DataBoardVO();
    			vo.setNo(rs.getInt(1));
    			vo.setSubject(rs.getString(2));
    			vo.setName(rs.getString(3));
    			vo.setRegdate(rs.getDate(4));
    			vo.setHit(rs.getInt(5));
    			vo.setGroup_tab(rs.getInt(6));;
    			list.add(vo);
    		}
    		rs.close();
    		
    	}catch(Exception ex)
    	{
    		ex.printStackTrace();
    	}
    	finally
    	{
    		disConnection();
    	}
    	return list;
    }
    /*
     *                   요청 처리와 관련된 자바 파일을 모아서 => Model 
     *                   Model => Model + VO + DAO
     *    JSP =========> Model(Java) ========> DAO(사이트에 필요한 데이터 저장)
     *     요청 (request)    |
     *                    1.요청정보 받기 
     *                    2.DAO연결 
     *                    3.결과값을 request담아 준다
     *                      request.setAttribute() => 여러개 사용이 가능  
     *                      ---------------------
     *                       화면에 출력해야되는 모든 데이터 전송 
     */
    // 총페이지 가지고 오기 
    public int databoardTotalPage()
    {
    	int total=0;
    	try
    	{
    		//1. 미리 생성된 Connection의 주소 얻기 
    		getConnection();
    		//2. SQL문장 
    		String sql="SELECT CEIL(COUNT(*)/10.0) FROM databoard";
    		//3. 오라클로 전송 (DAO만이 => 오라클)
    		ps=conn.prepareStatement(sql);
    		//4. 실행요청을 요청 => 결과값 읽기
    		ResultSet rs=ps.executeQuery();
    		//5. rs에 있는 데이터를 total에 저장 => 필요시마다 사용이 가능 
    		rs.next();
    		total=rs.getInt(1);
    		rs.close();
    	}catch(Exception ex)
    	{
    		ex.printStackTrace();
    	}
    	finally
    	{
    		// 반환 => POOL안에 다시 재사용이 가능하게 만든다 
    		disConnection();
    	}
    	return total;
    }
    // 새글 올리기 => 파일 업로드 
    public void databoardInsert(DataBoardVO vo)
    {
    	try
    	{
    		getConnection();
    		String sql="INSERT INTO databoard(no,name,subject,content,"
    				  +"pwd,group_id,filename,filesize) "
    				  +"VALUES(db_no_seq.nextval,?,?,?,?,"
    				  +"(SELECT NVL(MAX(group_id)+1,1) FROM databoard),"
    				  +"?,?)";
    		// sql문장 전송 
    		ps=conn.prepareStatement(sql);
    		// ?에 값을 채운다 
    		ps.setString(1, vo.getName());
    		ps.setString(2, vo.getSubject());
    		ps.setString(3, vo.getContent());
    		ps.setString(4, vo.getPwd());
    		ps.setString(5, vo.getFilename());
    		ps.setInt(6, vo.getFilesize());
    		
    		// 실행 명령
    		ps.executeUpdate(); // Commit포함 
    	}catch(Exception ex) 
    	{
    		ex.printStackTrace();
    	}
    	finally
    	{
    		disConnection();
    	}
    }
    // 상세보기 => 파일 다운로드 (메소드 => SQL문장이 1개 아니다)
    // 답변 => SQL문장 5개 , 삭제 => SQL문장 5개 => 일괄 처리 (트랜잭션)
    /*
     *   DELETE , UPADTE , INSERT => COMMIT , ROLLBACK
     *   ** 자바의 JDBC 단점 : AutoCommit을 기본으로 수행 
     */
    public DataBoardVO databoardDetailData(int no)
    {
    	DataBoardVO vo=new DataBoardVO();
    	try
    	{
    		//1. 조회수 증가
    		getConnection();
    		String sql="UPDATE databoard SET "
    				  +"hit=hit+1 "
    				  +"WHERE no=?";
    		ps=conn.prepareStatement(sql);
    		ps.setInt(1, no);
    		// 실행 
    		ps.executeUpdate(); // commit()가 포함 
    		//2. 상세볼 게시물 가지고 오기 
    		
    		sql="SELECT no,name,subject,content,regdate,hit,"
    		   +"filename,filesize "
    		   +"FROM databoard "
    		   +"WHERE no=?";
    		ps=conn.prepareStatement(sql);
    		ps.setInt(1, no);
    		ResultSet rs=ps.executeQuery();
    		rs.next();
    		vo.setNo(rs.getInt(1));
    		vo.setName(rs.getString(2));
    		vo.setSubject(rs.getString(3));
    		vo.setContent(rs.getString(4));
    		vo.setRegdate(rs.getDate(5));
    		vo.setHit(rs.getInt(6));
    		vo.setFilename(rs.getString(7));
    		vo.setFilesize(rs.getInt(8));
    		rs.close();
    		/*
    		 *    핵심 => 페이지 (인라인뷰) => 블록단위로 페이지 설정 
    		 *    - JOIN / SubQuery 
    		 *    - INSERT / UPDATE / DELETE 
    		 *    - Spring : PL/SQL => 모든 상세보기에 댓글이 가능 
    		 *      ------- DAO(MyBatis)
    		 *                  -------- Annotation / XML 
    		 */
    	}catch(Exception ex)
    	{
    		ex.printStackTrace();
    	}
    	finally
    	{
    		disConnection();
    	}
    	return vo;
    }
    // 답변 / 수정 / 삭제 
}









