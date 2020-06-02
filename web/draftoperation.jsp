<%@page import="java.sql.*"%>
<%!
    Connection co;
    PreparedStatement ps;
    ResultSet rs;
%>
<%
    String s1=request.getParameter("id");
    co=(Connection)application.getAttribute("con");
    try
        {
            ps=co.prepareStatement("select * from draftm where id=?");
            ps.setString(1,s1);
            rs=ps.executeQuery();
            if(rs.next())
            {
                %>
                <h3>Drafts</h3>
                <form action="draftresend.jsp?id=<%=s1%>" method="post">
                <table width="580" height="318" align="center">
                <tr>
                    <td height="30" colspan="2"><label for="to">To: </label><input type="text" name="mto" id="to" value="<%=rs.getString(2)%>"></td>
                    <td>Date:<%=rs.getString(5)%></td>
                </tr>
                <tr>
                    <td height="30" colspan="3"><label for="subject">Subject: </label><input type="text" name="msubject" id="subject" value="<%=rs.getString(3)%>"></td>
                </tr>
                <tr>
                    <td height="217" colspan="3"><textarea name="mtexta" rows="13" cols="70"><%=rs.getString(4)%></textarea></td>
                </tr>
                <tr>
                    <td width="262" align="left"><a href="mail.jsp?val=dr"><span style="color: #000099"><< back</span></a></td>
                    <td width="116"><input type="submit" value="Send" name="drbut"></td>
                    <td width="186" align="right"><input type="submit" value="Delete" name="drbut"></td>
                </tr>
                </table>
                </form>
                <%
            }
            rs.close();
            ps.close();
        }catch(Exception e)
        {
            out.print("exception is ...."+e);
        }
%>