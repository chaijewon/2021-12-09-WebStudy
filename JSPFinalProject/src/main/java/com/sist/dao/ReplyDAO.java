package com.sist.dao;
import java.util.*;

import com.sist.vo.ReplyVO;

import java.sql.*;
public class ReplyDAO {
   private Connection conn;
   private PreparedStatement ps;
   private DBCPConnection dbcp=new DBCPConnection();
   // 1. 댓글 추가 C
   public void replyInsert(ReplyVO vo)
   {
	   try
	   {
		   conn=dbcp.getConnection();
		   String sql="INSERT INTO project_reply VALUES("
				     +"pr_no_seq.nextval,?,?,?,?,?,SYSDATE)";
		   ps=conn.prepareStatement(sql);
		   ps.setInt(1,vo.getRno());
		   ps.setInt(2, vo.getType());
		   ps.setString(3, vo.getId());
		   ps.setString(4, vo.getName());
		   ps.setString(5, vo.getMsg());
		   
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
   // 2. 댓글 읽기 R ==> food_detail
   public List<ReplyVO> replyListData(int rno,int type)
   {
	   List<ReplyVO> list=new ArrayList<ReplyVO>();
	   try
	   {
		   /*
		    *   INDEX => UNIQUE , Primary key => 자동 설정
		    *   ------ 검색시 (최적화)
		    *   정렬 
		    *    INDEX_ASC(테이블명 pk명)  
		    *    INDEX_DESC(테이블명 pk명)
		    */
		   conn=dbcp.getConnection();
		   String sql="SELECT /*+ INDEX_DESC(project_reply pr_no_pk)*/ no,rno,type,id,name,msg,"
				     +"TO_CHAR(regdate,'YYYY-MM-DD HH24:MI:SS') "
				     +"FROM project_reply "
				     +"WHERE rno=? AND type=?";
		   ps=conn.prepareStatement(sql);
		   ps.setInt(1, rno);
		   ps.setInt(2, type);
		   ResultSet rs=ps.executeQuery();
		   while(rs.next())
		   {
			   ReplyVO vo=new ReplyVO();
			   vo.setNo(rs.getInt(1));
			   vo.setRno(rs.getInt(2));
			   vo.setType(rs.getInt(3));
			   vo.setId(rs.getString(4));
			   vo.setName(rs.getString(5));
			   vo.setMsg(rs.getString(6));
			   vo.setDbday(rs.getString(7));
			   
			   list.add(vo);
		   }
		   rs.close();
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   dbcp.disConnection(conn, ps);
	   }
	   return list;
   }
   // 3. 댓글 수정 U
   public void replyUpdate(int no,String msg)
   {
	   try
	   {
		   conn=dbcp.getConnection();
		   String sql="UPDATE project_reply SET "
				     +"msg=?"
				     +"WHERE no=?";
		   ps=conn.prepareStatement(sql);
		   ps.setString(1, msg);
		   ps.setInt(2, no);
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
   // 4. 댓글 삭제 D
   public void replyDelete(int no)
   {
	   try
	   {
		   conn=dbcp.getConnection();
		   String sql="DELETE FROM project_reply "
				     +"WHERE no=?";
		   ps=conn.prepareStatement(sql);
		   ps.setInt(1, no);
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









