<%@ page language="java" import="java.util.*,java.sql.*,com.it.bean.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>登录处理</title>

  </head>
  
  <body>
    <% 
    String x=request.getParameter("userName");
    String y=request.getParameter("Password");

    //网页和数据库沟通，把数据存放到数据库？
    //加载驱动，创建一个驱动管理器DriverManager
      Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
    //1.和数据库建立连接，描述清楚沟通的数据库位置，用户名，密码,连接类Connection
      String url="jdbc:sqlserver://localhost:1433;databaseName=forest";
      String username="sa";
      String password="ling302";
      Connection con=DriverManager.getConnection(url,username,password);
    //2.准备sql语句
      String sql="select * from account where aname='"+x+"' and apsd='"+y+"'";
    
    //3.创建一个陈述对象（虚拟的人）,陈述类Statement
      Statement stm=con.createStatement();
    
    //4.（由陈述对象）执行sql语句
       ResultSet rs= stm.executeQuery(sql);
       if(rs!=null&&rs.next())
       {      
         int aid= rs.getInt("aid");
         String aname= rs.getString("aname");
         String apsd= rs.getString("apsd");
         Forest forest=new Forest(aid,aname,apsd);
         session.setAttribute("forest",forest);//把当前登录的用户存放在一个会话对象session中，这样的话登录的用户在任何页面中都可以从会话对象session中获取到

         out.println(aname+",登录成功<a href='mainpage.html'>点此回到主页</a>");
       }
       else
       {
         out.println("登录失败，5秒钟之后自动返回到登录页面,或者点击<a href='login.html'>登录</a>");
         response.setHeader("refresh", "5;URL=login.html");
       }
    
    //5.关闭连接
       if(rs!=null)rs.close();
       if(stm!=null)stm.close();
       if(con!=null)con.close();

     %>
  </body>
</html>
