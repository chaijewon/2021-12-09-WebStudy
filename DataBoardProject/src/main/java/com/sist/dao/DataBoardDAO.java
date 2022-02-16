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
    		String sql="SELECT no,subject,name,regdate,hit,num "
    				  +"FROM (SELECT no,subject,name,regdate,hit,rownum as num "
    				  +"FROM (SELECT no,subject,name,regdate,hit "
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
}









