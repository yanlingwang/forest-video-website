<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">   
    <title>注册</title>
  </head>  
  <body>
    <% 
    String user_name=request.getParameter("userName");
    String pass_word=request.getParameter("Password");
        
    //加载驱动，创建一个驱动管理器DriverManager
      Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
    //1.和数据库建立连接，描述清楚沟通的数据库位置，用户名，密码,连接类Connection
      String url="jdbc:sqlserver://localhost:1433;databaseName=forest";
      String username="sa";
      String password="ling302";
      Connection con=DriverManager.getConnection(url,username,password);
    //2.准备sql语句  
      String sql="insert into account(aname,apsd) values('"+user_name+"','"+pass_word+"')";
    //3.创建一个陈述对象（虚拟的人）,陈述类Statement
      Statement stm=con.createStatement();    
    //4.（由陈述对象）执行sql语句
       int i= stm.executeUpdate(sql);   
    //5.关闭连接
       if(stm!=null)stm.close();
       if(con!=null)con.close();
       
       if(i>0)
       {
         out.println("注册成功!");
       }
       else
       {
         out.println("注册失败!");
       }              
      %>
      <a href="login.html">点击登录</a>   
  </body>
</html>
