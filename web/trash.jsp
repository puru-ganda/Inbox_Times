<%@page import="java.sql.*"%>
<%!
    Connection co;
    PreparedStatement ps;
    ResultSet rs;
%>
<%
    co=(Connection)application.getAttribute("con");
    String su=(String)session.getAttribute("usern");
        %>
         <html>
             <h3>Trash</h3>
             <form action="trashrd.jsp?rdv=ism" method="post">
                    <table width="580" height="318" align="center" border="1">
                    <tr>
                        <td height="288" colspan="2">
        <%        
             try
            {
                ps=co.prepareStatement("select * from sentm where visible=?");
                ps.setString(1,"deactive");
                rs=ps.executeQuery();
                while(rs.next())
                {
                %> 
                    <input type="checkbox" name="checktrse" value="<%=rs.getString(6)%>"><a href="mail.jsp?id=<%=rs.getString(6)%>&val=tro&trv=sev"><span style="color: black">To:</span><%=rs.getString(2)%>&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: black">Subject:</span><span style="color: green"><%=rs.getString(3)%></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: brown"><%=rs.getString(5)%></span></a><br><br>
                <%
                }
            }catch(Exception e)
            {
                out.print("Exception is ..."+e);
            }
            try
            {
                ps=co.prepareStatement("select * from inboxm where visible=?");
                ps.setString(1,"deactive");
                rs=ps.executeQuery();
                while(rs.next())
                {
                %> 
                    <input type="checkbox" name="checktrin" value="<%=rs.getString(6)%>"><a href="mail.jsp?id=<%=rs.getString(6)%>&val=tro&trv=inv"><span style="color: black">From:</span><%=rs.getString(1)%>&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: black">Subject:</span><span style="color: green"><%=rs.getString(3)%></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: brown"><%=rs.getString(5)%></span></a><br><br>
                <%
                }
            }catch(Exception ee)
            {
                out.print("Exception is ..."+ee);
            }            
        %>
                        </td>
                    </tr>
                    <tr>
                        <td height="30" align="center"><input type="submit" value="Restore" name="rdmbut"></td>
                        <td align="center"><input type="submit" value="Delete" name="rdmbut"></td>
                    </tr>
                    </table>
                </form>
            </html>            
