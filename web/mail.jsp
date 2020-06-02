<%
    String s=(String)session.getAttribute("uname");
    String val="";
%>
<table width="792" height="424" align="center" border="1">
  <tr>
    <th height="87" colspan="2">
		<h1 style="color:#FF0000" align="center"><em><span style="color:#000000"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Inbox</span> Times</em></h1>
		<h2 align="left"><em><span style="color: #000066">Welcome <span style="color: #660033"><%=s%></span></span></em> </h2>
                <p></p>
	</th>
	<th>
		<form action="logout.jsp" method="post"><input type="submit" value="LogOut"></form>	</th>
  </tr>
  <tr>
    <td width="114" height="318" align="center">
        <h3><a href="mail.jsp?val=co">Compose</a></h3>
        <h3><a href="mail.jsp?val=in">Inbox</a></h3>
        <h3><a href="mail.jsp?val=se">Sent</a></h3>
        <h3><a href="mail.jsp?val=dr">Draft</a></h3>
    <h3><a href="mail.jsp?val=tr">Trash</a></h3>    </td>
    <td width="580">
        <%
            val=request.getParameter("val");
            if(val!=null)
            {
                if(val.equals("co"))
                {
                %>
                    <jsp:include page="compose.jsp" />
                <%
                }
                else if(val.equals("in"))
                {
                %>
                    <jsp:include page="inbox.jsp" />
                <%
                }
                else if(val.equals("se"))
                {
                %>
                    <jsp:include page="sent.jsp" />
                <%
                }
                else if(val.equals("dr"))
                {
                %>
                    <jsp:include page="draft.jsp" />
                <%
                }
                else if(val.equals("tr"))
                {
                %>
                    <jsp:include page="trash.jsp" />
                <%
                }
                else if(val.equals("sto"))
                {
                %>
                    <jsp:include page="sentoperation.jsp" />
                <%
                }
                else if(val.equals("dto"))
                {
                %>
                    <jsp:include page="draftoperation.jsp" />
                <%
                }
                else if(val.equals("ino"))
                {
                %>
                    <jsp:include page="inboxoperation.jsp" />
                <%
                }
                else if(val.equals("tro"))
                {
                %>
                    <jsp:include page="trashoperation.jsp" />
    <%
                }
            }
        %>    </td>
    <td width="76">&nbsp;</td>
  </tr>
</table>

