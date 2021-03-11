package net.board.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.db.*;

 public class BoardModifyAction implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	 	throws Exception{
		 request.setCharacterEncoding("euc-kr");
		 ActionForward forward = new ActionForward();
		 boolean result = false;
		 
		 int num=Integer.parseInt(request.getParameter("BOARD_NUM"));
		 
		 BoardDAO boarddao=new BoardDAO();
		 BoardBean boarddata=new BoardBean();
		 
		 boolean usercheck=boarddao.isBoardWriter(
				 				num, request.getParameter("BOARD_ID"));
		 if(usercheck==false){
		   		response.setContentType("text/html;charset=euc-kr");
		   		PrintWriter out=response.getWriter();
		   		out.println("<script>");
		   		out.println("alert('������ ������ �����ϴ�.');");
		   		out.println("location.href='./BoardList.bo';");
		   		out.println("</script>");
		   		out.close();
		   		return null;
		 }
		 
		 try{
			 boarddata.setBOARD_NUM(num);
			 boarddata.setBOARD_SUBJECT(
					 			request.getParameter("BOARD_SUBJECT"));
			 boarddata.setBOARD_CONTENT(
					 			request.getParameter("BOARD_CONTENT"));
			 
			 result = boarddao.boardModify(boarddata);
			 if(result==false){
		   		System.out.println("�Խ��� ���� ����");
		   		return null;
		   	 }
		   	 System.out.println("�Խ��� ���� �Ϸ�");
		   	 
		   	 forward.setRedirect(true);
		   	 forward.setPath(
		   			 	"./BoardDetailAction.bo?num="+boarddata.getBOARD_NUM());
		   	 //return forward;
	   	 }catch(Exception ex){
	   			ex.printStackTrace();	 
		 }
		 
		 return forward;
	 }
}