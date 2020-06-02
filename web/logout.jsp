<%
    session.removeAttribute("uname");
    session.removeAttribute("usern");
    session.invalidate();
    response.sendRedirect("index.html");
%>