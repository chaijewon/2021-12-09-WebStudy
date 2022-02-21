package com.sist.dao;
// 모든 DAO에서 중복적으로 사용 => 모아서 재사용(공통 모듈)
// getConnection / disConnection
import java.util.*;
import java.sql.*;
import javax.sql.*;
import javax.naming.*;
public class DBCPConnection {
   //DBCP는 먼저 Connection 생성 => 저장 => 관리 
   //Connection의 객체주소를 얻어온다 
   //데이터베이스에서 시간이 가장 많이 걸리는 부분 => 연결 (오라클 연결에 소모되는 시간을 줄인다)
   //Connection의 객체가 일정하기 때문에 관리하기 편하다(부하없이)
   //한번 여러 접속가 동시에 접속시에 서버가 쉽게 다운이 되지 않는다 
   //DBCP => 웹 프로그램에서 일반적으로 사용한다 (MyBatis => DBCP) => XML파일로 설정 
   //Spring => Model등록(XML) , Controller => .jar첨부 
   public Connection getConnection()
   {
	   Connection conn=null;
	   try
	   {
		   Context init=new InitialContext();
		   Context c=(Context)init.lookup("java://comp//env");
		   DataSource ds=(DataSource)c.lookup("jdbc/oracle");
		   conn=ds.getConnection();
	   }catch(Exception ex){}
	   return conn;
   }
   public void disConnection(Connection conn,PreparedStatement ps)
   {
	   try
	   {
		   if(ps!=null) ps.close();
		   if(conn!=null) conn.close();
	   }catch(Exception ex){}
   }
}
