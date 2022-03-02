package com.sist.dao;
import java.util.*;

import com.sist.vo.MemberVO;

import java.sql.*;
public class MemberDAO {
   private Connection conn;
   private PreparedStatement ps;
   private DBCPConnection dbcp=new DBCPConnection(); //연결/해제 => has-a
   //1.로그인 기능 
   public MemberVO isLogin(String id,String pwd)
   {
	   MemberVO vo=new MemberVO();
	   try
	   {
		   conn=dbcp.getConnection();
		   String sql="SELECT COUNT(*) FROM project_member "
				     +"WHERE id=?";
		   ps=conn.prepareStatement(sql);
		   ps.setString(1, id);
		   ResultSet rs=ps.executeQuery();
		   rs.next();
		   int count=rs.getInt(1);
		   rs.close();
		   /////////////////////////////// ID존재 여부 확인 
		   if(count==0) //ID가 없는 상태
		   {
			   vo.setMsg("NOID");;
		   }
		   else //ID가 있는 상태 
		   {
			   sql="SELECT pwd,name,admin FROM project_member "
			      +"WHERE id=?";
			   ps=conn.prepareStatement(sql);
			   ps.setString(1, id);
			   rs=ps.executeQuery();
			   rs.next();
			   String db_pwd=rs.getString(1);
			   String name=rs.getString(2);
			   String admin=rs.getString(3); // y/n
			   rs.close();
			   
			   if(db_pwd.equals(pwd)) // 로그인 
			   {
				   vo.setMsg("OK");
				   vo.setName(name);
				   vo.setAdmin(admin);
			   }
			   else //비밀번호가 틀리다 
			   {
				   vo.setMsg("NOPWD");
			   }
		   }
		   
		   
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   dbcp.disConnection(conn, ps);
	   }
	   return vo;
   }
   // 아이디중복체크
   public int memberIdcheck(String id)
   {
	   int count=0;
	   try
	   {
		   conn=dbcp.getConnection();
		   String sql="SELECT COUNT(*) FROM project_member "
				     +"WHERE id=?";
		   ps=conn.prepareStatement(sql);
		   ps.setString(1, id);
		   ResultSet rs=ps.executeQuery();
		   rs.next();
		   count=rs.getInt(1);
		   rs.close();
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   dbcp.disConnection(conn, ps);
	   }
	   return count;
   }
   // 회원가입 
   public void memberJoin(MemberVO vo)
   {
	   try
	   {
		   conn=dbcp.getConnection();
		   String sql="INSERT INTO project_member VALUES(?,?,?,?,?,"
				     +"?,?,?,?,?,?,'n')";
		   ps=conn.prepareStatement(sql);
		   ps.setString(1, vo.getId());
		   ps.setString(2, vo.getPwd());
		   ps.setString(3, vo.getName());
		   ps.setString(4, vo.getSex());
		   ps.setString(5, vo.getBirthday());
		   ps.setString(6, vo.getEmail());
		   ps.setString(7, vo.getPost());
		   ps.setString(8, vo.getAddr1());
		   ps.setString(9, vo.getAddr2());
		   ps.setString(10, vo.getTel());
		   ps.setString(11, vo.getContent());
		   ps.executeUpdate();
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   dbcp.disConnection(conn, ps);
	   }
   }
   
}





