<%@page import="java.sql.*"%>
<%!
    Connection co;
    PreparedStatement ps;
    ResultSet rs;
%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
    String s1=request.getParameter("una");
    String s2=request.getParameter("upa");
    co=(Connection)application.getAttribute("con");
        try
        {
            ps=co.prepareStatement("select * from newuser where Username=?");
            ps.setString(1,s1);
            rs=ps.executeQuery();
            if(rs.next())
            {
                String s3=rs.getString(4);
                if(s3.equals(s2))
                {
                        String s4=rs.getString(1);
                        String s5=rs.getString(2);
                        String s6=s4+" "+s5;
                        session.setAttribute("uname",s6);
                        session.setAttribute("usern",s1);
                        
                        response.sendRedirect("mail.jsp?val=in");
                }
                else
                {
                %>
                    <script>
                        alert("Wrong Password:ReEnter Password");
                        window.location("index.html");
	            </script>
                <%
                }
                rs.close();
                ps.close();
            }
            else
            {
            %>
                <script>
                    alert("Invalid Username");
		    window.location("index.html");
	        </script>
            <%
            }
        }catch(Exception eee)
        {
            out.print("exception is ...."+eee);
        }
%>