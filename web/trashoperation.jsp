<%@page import="java.sql.*"%>
<%!
    Connection co;
    PreparedStatement ps;
    ResultSet rs;
    String trv="";
%>
<%
    String s1=request.getParameter("id");
    co=(Connection)application.getAttribute("con");
    trv=request.getParameter("trv");
    if(trv!=null)
    {
        if(trv.equals("sev"))
        {
            try
        {
            ps=co.prepareStatement("select * from sentm where id=?");
            ps.setString(1,s1);
            rs=ps.executeQuery();
            if(rs.next())
            {
                %>
                <h3>Trash</h3>
                <form action="trashrd.jsp?id=<%=s1%>&rdv=se" method="post">
                <table width="580" height="318" align="center">
                <tr>
                    <td height="30" colspan="2"><label for="to">To: </label><input type="text" name="mfrom" id="to" value="<%=rs.getString(2)%>"></td>
                    <td>Date:<%=rs.getString(5)%></td>
                </tr>
                <tr>
                    <td height="30" colspan="3"><label for="subject">Subject: </label><input type="text" name="msubject" id="subject" value="<%=rs.getString(3)%>"></td>
                </tr>
                <tr>
                    <td height="217" colspan="3"><textarea name="mtexta" rows="13" cols="70"><%=rs.getString(4)%></textarea></td>
                </tr>
                <tr>
                    <td width="252" align="left"><a href="mail.jsp?val=tr"><span style="color: #000099"><< back</span></a></td>
                    <td width="129"><input type="submit" value="Restore" name="rdbut"></td>
                    <td width="183" align="right"><input type="submit" value="Delete" name="rdbut"></td>
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
        }
        else if(trv.equals("inv"))
        {
            try
        {
            ps=co.prepareStatement("select * from inboxm where id=?");
            ps.setString(1,s1);
            rs=ps.executeQuery();
            if(rs.next())
            {
                %>
                <h3>Trash</h3>
                <form action="trashrd.jsp?id=<%=s1%>&rdv=in" method="post">
                <table width="580" height="318" align="center">
                <tr>
                    <td height="30" colspan="2"><label for="from">From: </label><input type="text" name="mfrom" id="from" value="<%=rs.getString(1)%>"></td>
                    <td>Date:<%=rs.getString(5)%></td>
                </tr>
                <tr>
                    <td height="30" colspan="3"><label for="subject">Subject: </label><input type="text" name="msubject" id="subject" value="<%=rs.getString(3)%>"></td>
                </tr>
                <tr>
                    <td height="217" colspan="3"><textarea name="mtexta" rows="13" cols="70"><%=rs.getString(4)%></textarea></td>
                </tr>
                <tr>
                    <td width="252" align="left"><a href="mail.jsp?val=tr"><span style="color: #000099"><< back</span></a></td>
                    <td width="129"><input type="submit" value="Restore" name="rdbut"></td>
                    <td width="183" align="right"><input type="submit" value="Delete" name="rdbut"></td>
                </tr>
                </table>
                </form>
                <%
            }
            rs.close();
            ps.close();
        }catch(Exception ee)
        {
            out.print("exception is ...."+ee);
        }
        }
    }
%>