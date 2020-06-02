<%@page import="java.sql.*"%>
<%!
    Connection co;
    PreparedStatement ps;
    ResultSet rs;
%>
<%
    String s1=request.getParameter("mto");
    String s2=request.getParameter("msubject");
    String s3=request.getParameter("mtexta");
    String s4=request.getParameter("but");
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
                ps=co.prepareStatement("insert into draftm(fromd,tod,subjectd,messaged,status) values(?,?,?,?,?)");
                ps.setString(1,su);
                ps.setString(2,"");
                ps.setString(3,s2);
                ps.setString(4,s3);
                ps.setString(5,"invalid");
                ps.executeUpdate();
                ps.close();
                %>
                <script>
                    alert("Invalid UserId:Message saved as Draft");
                    window.location("mail.jsp?val=in");
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
                    window.location("mail.jsp?val=in");
                </script>
                <%
            }
        }catch(Exception ee)
        {
            out.print("exception is ...."+ee);
        }
    }
    else //save as draft
    {
        try
        {
            ps=co.prepareStatement("insert into draftm(fromd,tod,subjectd,messaged,status) values(?,?,?,?,?)");
            ps.setString(1,su);
            ps.setString(2,s1);
            ps.setString(3,s2);
            ps.setString(4,s3);
            ps.setString(5,"draft");
            ps.executeUpdate();
            ps.close();
            %>
            <script>
                alert("Message Saved as Draft");
                window.location("mail.jsp?val=in");
	    </script>
            <%
        }catch(Exception eee)
        {
            out.print("exception is ...."+eee);
        }
    }

%>