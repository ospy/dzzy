<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%
 String path = request.getContextPath();
 String basePath = request.getScheme() + "://"
   + request.getServerName() + ":" + request.getServerPort()
   + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

 <body>
  <%
   Connection conn = null;
   Context initCtx = new InitialContext();
   if (initCtx == null)
    throw new Exception("不能获取Context!");
   Context ctx = (Context) initCtx.lookup("java:comp/env");
   Object obj = (Object) ctx.lookup("jdbc/zmj");//获取连接池对象
   DataSource ds = (javax.sql.DataSource) obj; //类型转换
   conn = ds.getConnection();
   Statement stmt = conn.createStatement();
   String sql = "select * from TBSYSCZY";
   ResultSet rs = stmt.executeQuery(sql);
   while (rs.next()) {
    out.println(rs.getString(6) + "<BR>");
   }
   rs.close();
   stmt.close();
   conn.close();
   out.println("连接池测试成功");
   //测试git-修改2015-06-03
  %>
 </body>
</html>