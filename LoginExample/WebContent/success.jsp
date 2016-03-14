<%
    if ((session.getAttribute("username") == null) || (session.getAttribute("username") == "")) {
%>
Sie sind nicht eingeloggt.<br/>
<a href="index.jsp">Zum Login</a>
<%} else {
%>
Hallo <%=session.getAttribute("username")%>!
<a href='logout.jsp'>Ausloggen</a>
<%
    }
%>