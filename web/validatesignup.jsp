<%@page import="java.sql.*"%>
<%!
    Connection co;
    PreparedStatement ps;
    ResultSet rs;
%>
<%
    String s1=request.getParameter("fname");
    String s2=request.getParameter("lname");
    String s3=request.getParameter("emailid");
    String s4=request.getParameter("userp");
    String s5=request.getParameter("usercp");
    co=(Connection)application.getAttribute("con");
        int start=0;
        try
        {
            ps=co.prepareStatement("select * from newuser where Username=?");
            ps.setString(1,s3);
            rs=ps.executeQuery();
            while(rs.next())
            {
                start=1;
            }
            rs.close();
            ps.close();
            if(start==0)
            {
                if(s4.equals(s5))
                {
                    ps=co.prepareStatement("insert into newuser(Firstname,Lastname,Username,Upassword) values(?,?,?,?)");
                    ps.setString(1,s1);
                    ps.setString(2,s2);
                    ps.setString(3,s3);
                    ps.setString(4,s4);
                    ps.executeUpdate();
                    ps.close();
                    %>
                    <script>
                        alert("Your Account Has Been Created");
                        window.location("index.html");
	            </script>
                    <%
                }
                else
                {
                    %>
                    <script>
                            alert("Password Not Matched");
                            window.location("createaccount.html");
                    </script>
                    <%
                }
            }    
            else
            {
                %>
                    <script>
                        alert("Your Account Already Exsists");
                        window.location("index.html");
	            </script>
                <%
            }
        }catch(Exception ee)
        {
            out.print("exception is ...."+ee);
        }
%>
