<%@page import="java.sql.*"%>
<%!
    Connection co;
    PreparedStatement ps;
    ResultSet rs;
%>
<%
    co=(Connection)application.getAttribute("con");
    String su=(String)session.getAttribute("usern");
    try
    {
        ps=co.prepareStatement("select * from inboxm where tod=?");
        ps.setString(1,su);
        rs=ps.executeQuery();
        %>
         <html>
             <h3>Inbox</h3>
             <form action="delete.jsp?op=inm" method="post">
                    <table width="580" height="318" align="center" border="1">
                    <tr>
                        <td height="288">
        <%           
        while(rs.next())
        {
            if(rs.getString(7).equals("active"))
            {
                %> 
                <input type="checkbox" name="checkin" value="<%=rs.getString(6)%>"><a href="mail.jsp?id=<%=rs.getString(6)%>&val=ino"><span style="color: black">From:</span><%=rs.getString(1)%>&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: black">Subject:</span><span style="color: green"><%=rs.getString(3)%></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: brown"><%=rs.getString(5)%></span></a><br><br>
                <%
            }
        }
            %>
                        </td>
                    </tr>
                    <tr>
                        <td height="30" align="center"><input type="submit" value="Delete"></td>
                    </tr>
                    </table>
                </form>
            </html>            
    <%    
    }catch(Exception e)
    {
        out.print("Exception is ..."+e);
    }
%>