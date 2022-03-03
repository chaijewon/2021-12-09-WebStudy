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
   // ID => 전화번호로 찾기 
   public String idfind_tel(String tel)
   {
	   String result="";
	   try
	   {
		   conn=dbcp.getConnection();
		   String sql="SELECT COUNT(*) "
				     +"FROM project_member "
				     +"WHERE REGEXP_REPLACE(tel,'[^0-9]','')=?";
		   ps=conn.prepareStatement(sql);
		   ps.setString(1, tel);
		   ResultSet rs=ps.executeQuery();
		   rs.next();
		   int count=rs.getInt(1);
		   rs.close();
		   if(count==0)
		   {
			   result="no";
		   }
		   else
		   {
			   // 전화번호가 존재 
			   sql="SELECT RPAD(SUBSTR(id,1,1),LENGTH(id),'*') "
				  +"FROM project_member "
				  +"WHERE REGEXP_REPLACE(tel,'[^0-9]','')=?";
			   ps=conn.prepareStatement(sql);
			   ps.setString(1, tel);
			   rs=ps.executeQuery();
			   rs.next();
			   result=rs.getString(1);
			   rs.close();
		   }
		   
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   dbcp.disConnection(conn, ps);
	   }
	   return result;
   }
   public String idfind_email(String email)
   {
	   String result="";
	   try
	   {
		   conn=dbcp.getConnection();
		   String sql="SELECT COUNT(*) "
				     +"FROM project_member "
				     +"WHERE email=?";
		   ps=conn.prepareStatement(sql);
		   ps.setString(1, email);
		   ResultSet rs=ps.executeQuery();
		   rs.next();
		   int count=rs.getInt(1);
		   rs.close();
		   if(count==0)
		   {
			   result="no";
		   }
		   else
		   {
			   // 전화번호가 존재 
			   sql="SELECT RPAD(SUBSTR(id,1,1),LENGTH(id),'*') "
				  +"FROM project_member "
				  +"WHERE email=?";
			   ps=conn.prepareStatement(sql);
			   ps.setString(1, email);
			   rs=ps.executeQuery();
			   rs.next();
			   result=rs.getString(1);
			   rs.close();
		   }
		   
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   dbcp.disConnection(conn, ps);
	   }
	   return result;
   }
   
   //  수정하기 => 상세보기와 동일 
   // Model (VO,DAO,Manager) => 분리목적 (재사용)
   /*
    *    Spring => VO,DAO ,Manager , JSP
    *                 ---- MyBatis
    *              Model만 달라진다 
    *              ===등록 (XML) ===> X(Spring-Boot)
    */
   public MemberVO memberUpdateData(String id)
   {
	   MemberVO vo=new MemberVO();
	   try
	   {
		   conn=dbcp.getConnection();
		   String sql="SELECT id,name,sex,birthday,email,post,addr1,"
				     +"NVL(addr2,' '),tel,content "
				     +"FROM project_member "
				     +"WHERE id=?";
		   ps=conn.prepareStatement(sql);
		   ps.setString(1, id);
		   ResultSet rs=ps.executeQuery();
		   rs.next();
		   vo.setId(rs.getString(1));
		   vo.setName(rs.getString(2));
		   vo.setSex(rs.getString(3));
		   vo.setBirthday(rs.getString(4));
		   vo.setEmail(rs.getString(5));
		   vo.setPost(rs.getString(6));
		   vo.setAddr1(rs.getString(7));
		   vo.setAddr2(rs.getString(8));
		   vo.setTel(rs.getString(9));
		   vo.setContent(rs.getString(10));
		   rs.close();
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
   
   // 실제 수정 ==> Model => DAO => JSP
   public boolean memberUpdateOk(MemberVO vo)
   {
	   boolean bCheck=false;
	   try
	   {
		   conn=dbcp.getConnection();
		   String sql="SELECT pwd FROM project_member "
				     +"WHERE id=?";
		   ps=conn.prepareStatement(sql);
		   ps.setString(1, vo.getId());
		   ResultSet rs=ps.executeQuery();
		   rs.next();
		   String pwd=rs.getString(1);
		   rs.close();
		   
		   if(pwd.equals(vo.getPwd()))
		   {
			   bCheck=true;
			   // 실제 수정 
			   sql="UPDATE project_member SET "
				  +"name=?,sex=?,birthday=?,email=?,"
				  +"post=?,addr1=?,addr2=?,tel=?,content=? "
				  +"WHERE id=?";
			   ps=conn.prepareStatement(sql);
			   ps.setString(1, vo.getName());
			   ps.setString(2, vo.getSex());
			   ps.setString(3, vo.getBirthday());
			   ps.setString(4, vo.getEmail());
			   ps.setString(5, vo.getPost());
			   ps.setString(6, vo.getAddr1());
			   ps.setString(7, vo.getAddr2());
			   ps.setString(8, vo.getTel());
			   ps.setString(9, vo.getContent());
			   ps.setString(10, vo.getId());
			   ps.executeUpdate();//commit()
		   }
		   else
		   {
			   bCheck=false;
		   }
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   dbcp.disConnection(conn, ps);
	   }
	   return bCheck;
   }
   // 탈퇴
   public String memberJoinDelete(String pwd,String id)
   {
	   String result="";
	   try
	   {
		   conn=dbcp.getConnection();
		   String sql="SELECT pwd FROM project_member "
				     +"WHERE id=?";
		   ps=conn.prepareStatement(sql);
		   ps.setString(1, id);
		   ResultSet rs=ps.executeQuery();
		   rs.next();
		   String db_pwd=rs.getString(1);
		   rs.close();
		   
		   if(db_pwd.equals(pwd))
		   {
			   result="yes";
			   sql="DELETE FROM project_member "
				  +"WHERE id=?";
			   ps=conn.prepareStatement(sql);
			   ps.setString(1, id);
			   ps.executeUpdate();
		   }
		   else
		   {
			   result="no";
		   }
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   dbcp.disConnection(conn, ps);
	   }
	   return result;
   }
   
}





