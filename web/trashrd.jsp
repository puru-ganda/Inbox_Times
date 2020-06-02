<%@page import="java.sql.*"%>
<%!
    Connection co;
    PreparedStatement ps;
    ResultSet rs;
    String rdv="";
%>
<%
    String s1=request.getParameter("id");
    co=(Connection)application.getAttribute("con");
    rdv=request.getParameter("rdv");
    String s2=request.getParameter("rdbut");
    String s3=request.getParameter("rdmbut");
    String checktrin[]=request.getParameterValues("checktrin");
    String checktrse[]=request.getParameterValues("checktrse");
    if(rdv!=null)
    {
        if(rdv.equals("se"))
        {
            if(s2.equals("Restore"))
            {
                try
                {
                    ps=co.prepareStatement("update sentm set visible=? where id=?");
                    ps.setString(1,"active");
                    ps.setString(2,s1);
                    ps.executeUpdate();
                    ps.close();
                    %>
                    <script>
                        alert("Message Restored");
                        window.location("mail.jsp?val=tr");
                    </script>
                    <%
                }catch(Exception e1)
                {
                    out.print("exception is ..."+e1);
                }
            }
            else
            {
                try
                {
                    ps=co.prepareStatement("delete from sentm where id=?");
                    ps.setString(1,s1);
                    ps.executeUpdate();
                    ps.close();
                    %>
                    <script>
                        alert("Message Deleted");
                        window.location("mail.jsp?val=tr");
                    </script>
                    <%        
                }catch(Exception e2)
                {
                    out.print("exception is ...."+e2);
                }
            }
        }
        else if(rdv.equals("in"))
        {
            if(s2.equals("Restore"))
            {
                try
                {
                    ps=co.prepareStatement("update inboxm set visible=? where id=?");
                    ps.setString(1,"active");
                    ps.setString(2,s1);
                    ps.executeUpdate();
                    ps.close();
                    %>
                    <script>
                        alert("Message Restored");
                        window.location("mail.jsp?val=tr");
                    </script>
                    <%
                }catch(Exception e3)
                {
                    out.print("exception is ..."+e3);
                }
            }
            else
            {
                try
                {
                    ps=co.prepareStatement("delete from inboxm where id=?");
                    ps.setString(1,s1);
                    ps.executeUpdate();
                    ps.close();
                    %>
                    <script>
                        alert("Message Deleted");
                        window.location("mail.jsp?val=tr");
                    </script>
                    <%        
                }catch(Exception e4)
                {
                    out.print("exception is ..."+e4);
                }
            }
        }
        else if(rdv.equals("ism"))
        {
            if(s3.equals("Restore"))
            {
                if(checktrin!=null&&checktrse!=null)
                {
                    int i,j;
                    for(i=0;i<checktrin.length;i++)
                    {
                        try
                        {
                            ps=co.prepareStatement("update inboxm set visible=? where id=?");
                            ps.setString(1,"active");
                            ps.setString(2,checktrin[i]);
                            ps.executeUpdate();
                            ps.close();
                        }catch(Exception e5)
                        {
                            out.print("exception is ..."+e5);
                        }
                    }
                    for(j=0;j<checktrse.length;j++)
                    {
                        try
                        {
                            ps=co.prepareStatement("update sentm set visible=? where id=?");
                            ps.setString(1,"active");
                            ps.setString(2,checktrse[j]);
                            ps.executeUpdate();
                            ps.close();
                        }catch(Exception e6)
                        {
                            out.print("exception is ..."+e6);
                        }
                    }
                    %>
                    <script>
                        alert("<%=i+j%> Message Restored");
                        window.location("mail.jsp?val=tr");
                    </script>
                    <%
                }
                else if(checktrin!=null)
                {
                    int i;
                    for(i=0;i<checktrin.length;i++)
                    {
                        try
                        {
                            ps=co.prepareStatement("update inboxm set visible=? where id=?");
                            ps.setString(1,"active");
                            ps.setString(2,checktrin[i]);
                            ps.executeUpdate();
                            ps.close();
                        }catch(Exception e5)
                        {
                            out.print("exception is ..."+e5);
                        }
                    }
                    %>
                    <script>
                        alert("<%=i%> Message Restored");
                        window.location("mail.jsp?val=tr");
                    </script>
                    <%
                }
                else if(checktrse!=null)
                {
                    int j;
                    for(j=0;j<checktrse.length;j++)
                    {
                        try
                        {
                            ps=co.prepareStatement("update sentm set visible=? where id=?");
                            ps.setString(1,"active");
                            ps.setString(2,checktrse[j]);
                            ps.executeUpdate();
                            ps.close();
                        }catch(Exception e5)
                        {
                            out.print("exception is ..."+e5);
                        }
                    }
                    %>
                    <script>
                        alert("<%=j%> Message Restored");
                        window.location("mail.jsp?val=tr");
                    </script>
                    <%
                }
                else
                {
                %>
                <script>
                    alert("Please Select an Entry");
                    window.location("mail.jsp?val=tr");
                </script>
                <%
                }
            }
            else
            {
                if(checktrin!=null&&checktrse!=null)
                {
                    int i,j;
                    for(i=0;i<checktrin.length;i++)
                    {
                        try
                        {
                            ps=co.prepareStatement("delete from inboxm where id=?");
                            ps.setString(1,checktrin[i]);
                            ps.executeUpdate();
                            ps.close();
                        }catch(Exception e5)
                        {
                            out.print("exception is ..."+e5);
                        }
                    }
                    for(j=0;j<checktrse.length;j++)
                    {
                        try
                        {
                            ps=co.prepareStatement("delete from sentm where id=?");
                            ps.setString(1,checktrse[j]);
                            ps.executeUpdate();
                            ps.close();
                        }catch(Exception e6)
                        {
                            out.print("exception is ..."+e6);
                        }
                    }
                    %>
                    <script>
                        alert("<%=i+j%> Message Deleted");
                        window.location("mail.jsp?val=tr");
                    </script>
                    <%
                }
                else if(checktrin!=null)
                {
                    int i;
                    for(i=0;i<checktrin.length;i++)
                    {
                        try
                        {
                            ps=co.prepareStatement("delete from inboxm where id=?");
                            ps.setString(1,checktrin[i]);
                            ps.executeUpdate();
                            ps.close();
                        }catch(Exception e5)
                        {
                            out.print("exception is ..."+e5);
                        }
                    }
                    %>
                    <script>
                        alert("<%=i%> Message Deleted");
                        window.location("mail.jsp?val=tr");
                    </script>
                    <%
                }
                else if(checktrse!=null)
                {
                    int j;
                    for(j=0;j<checktrse.length;j++)
                    {
                        try
                        {
                            ps=co.prepareStatement("delete from sentm where id=?");
                            ps.setString(1,checktrse[j]);
                            ps.executeUpdate();
                            ps.close();
                        }catch(Exception e5)
                        {
                            out.print("exception is ..."+e5);
                        }
                    }
                    %>
                    <script>
                        alert("<%=j%> Message Deleted");
                        window.location("mail.jsp?val=tr");
                    </script>
                    <%
                }
                else
                {
                %>
                <script>
                    alert("Please Select an Entry");
                    window.location("mail.jsp?val=tr");
                </script>
                <%
                }
            }
        }
    }
%>