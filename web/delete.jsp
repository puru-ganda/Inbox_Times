<%@page import="java.sql.*"%>
<%!
    Connection co;
    PreparedStatement ps;
    ResultSet rs;
    String op="";
%>
<%
    String s1=request.getParameter("id");
    co=(Connection)application.getAttribute("con");
    String checkin[]=request.getParameterValues("checkin");
    String checkse[]=request.getParameterValues("checkse");
    String checkdr[]=request.getParameterValues("checkdr");
            op=request.getParameter("op");
           
            if(op!=null)
            {
                if(op.equals("in"))
                {
                    try
                    {
                        ps=co.prepareStatement("update inboxm set visible=? where id=?");
                        ps.setString(1,"deactive");
                        ps.setString(2,s1);
                        ps.executeUpdate();
                        ps.close();
                        %>
                        <script>
                            alert("Message moved to Trash");
                            window.location("mail.jsp?val=in");
                        </script>
                        <%
                    }catch(Exception e)
                    {
                        out.print("exception is ..."+e);
                    }
                }
                else if(op.equals("se"))
                {
                    try
                    {
                        ps=co.prepareStatement("update sentm set visible=? where id=?");
                        ps.setString(1,"deactive");
                        ps.setString(2,s1);
                        ps.executeUpdate();
                        ps.close();
                        %>
                        <script>
                            alert("Message moved to Trash");
                            window.location("mail.jsp?val=se");
                        </script>
                        <%
                    }catch(Exception ee)
                    {
                        out.print("exception is ..."+ee);
                    }
                }
                else if(op.equals("inm"))
                {
                    if(checkin!=null&&checkin.length!=0)
                    {
                        int i;
                        for(i=0;i<checkin.length;i++)
                        {
                            try
                            {
                                ps=co.prepareStatement("update inboxm set visible=? where id=?");
                                ps.setString(1,"deactive");
                                ps.setString(2,checkin[i]);
                                ps.executeUpdate();
                                ps.close();
                            }catch(Exception eee)
                            {
                                out.print("exception is ..."+eee);
                            }
                        }
                        %>
                        <script>
                            alert("<%=i%> Message moved to Trash");
                            window.location("mail.jsp?val=in");
                        </script>
                        <%
                    }
                    else
                    {
                    %>
                    <script>
                        alert("Please Select an Entry");
                        window.location("mail.jsp?val=in");
                    </script>
                    <%
                    }           
                }
                else if(op.equals("sem"))
                {
                    if(checkse!=null&&checkse.length!=0)
                    {
                        int i;
                        for(i=0;i<checkse.length;i++)
                        {
                            try
                            {
                                ps=co.prepareStatement("update sentm set visible=? where id=?");
                                ps.setString(1,"deactive");
                                ps.setString(2,checkse[i]);
                                ps.executeUpdate();
                                ps.close();
                            }catch(Exception eeee)
                            {
                                out.print("exception is ..."+eeee);
                            }
                        }
                        %>
                        <script>
                            alert("<%=i%> Message moved to Trash");
                            window.location("mail.jsp?val=se");
                        </script>
                        <%
                    }
                    else 
                    {
                    %>
                    <script>
                        alert("Please Select an Entry");
                        window.location("mail.jsp?val=se");
                    </script>
                    <%
                    }                    
                }
                else if(op.equals("drm"))
                {
                    if(checkdr!=null&&checkdr.length!=0)
                    {
                        int i;
                        for(i=0;i<checkdr.length;i++)
                        {
                            try
                            {
                                ps=co.prepareStatement("delete from draftm where id=?");
                                ps.setString(1,checkdr[i]);
                                ps.executeUpdate();
                                ps.close();
                            }catch(Exception eeeee)
                            {
                                out.print("exception is ..."+eeeee);
                            }
                        }
                        %>
                        <script>
                            alert("<%=i%> Message Deleted");
                            window.location("mail.jsp?val=dr");
                        </script>
                        <%
                    }
                    else
                    {
                    %>
                    <script>
                        alert("Please Select an Entry");
                        window.location("mail.jsp?val=dr");
                    </script>
                    <%
                    }
                }
            }
        %>       