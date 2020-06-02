<%@page import="java.sql.*"%>
<%!
    Connection co;
    PreparedStatement ps;
    ResultSet rs;
    String op="";
%>
<%
    String si=request.getParameter("id");
    String s1=request.getParameter("mto");
    String s2=request.getParameter("msubject");
    String s3=request.getParameter("mtexta");
    String s4=request.getParameter("drbut");
    String su=(String)session.getAttribute("usern");
    co=(Connection)application.getAttribute("con");
    if(s4.equals("Send"))
    {
        int start=0;
        try
        {
            ps=co.prepareStatement("select * from newuser where Username=?");
            ps.setString(1,s1);
            rs=ps.executeQuery();
            while(rs.next())
            {
                start=1;
            }
            rs.close();
            ps.close();
            if(start==0||su.equals(s1))
            {
                %>
                <script>
                    alert("Invalid UserId:Message Not Sent");
                    window.location("mail.jsp?val=dto&id=<%=si%>");
                </script>
                <%
            }
            else
            {
                ps=co.prepareStatement("insert into sentm(fromd,tod,subjectd,messaged,visible) values(?,?,?,?,?)");
                ps.setString(1,su);
                ps.setString(2,s1);
                ps.setString(3,s2);
                ps.setString(4,s3);
                ps.setString(5,"active");
                ps.executeUpdate();
                ps.close();
                ps=co.prepareStatement("insert into inboxm(fromd,tod,subjectd,messaged,visible) values(?,?,?,?,?)");
                ps.setString(1,su);
                ps.setString(2,s1);
                ps.setString(3,s2);
                ps.setString(4,s3);
                ps.setString(5,"active");
                ps.executeUpdate();
                ps.close();
                %>
                <script>
                    alert("Message Sent");
                    window.location("mail.jsp?val=dr");
                </script>
                <%
            }
        }catch(Exception e)
        {
            out.print("exception is ...."+e);
        }
    }
    else //delete
    {
        try
        {
            ps=co.prepareStatement("delete from draftm where id=?");
            ps.setString(1,si);
            ps.executeUpdate();
            ps.close();
            %>
            <script>
                alert("Message Deleted");
                window.location("mail.jsp?val=dr");
            </script>
            <%           
        }catch(Exception ee)
        {
            out.print("exception is ...."+ee);
        }
    }

%>