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

<%@ page import = "java.sql.*" isThreadSafe="false" %>

<%
  String sDbDrv = "com.mysql.jdbc.Driver";
  String sDbUrl = "jdbc:mysql://localhost:3306/mfz2";
  String sUsr   = "root";
  String sPwd   = "40pmc";
  String sTable = "offer";
  String sSql   = "";
  if( request.getParameterNames().hasMoreElements() == true )
  {
    sDbDrv = request.getParameter( "prmDbDrv" );
    sDbUrl = request.getParameter( "prmDbUrl" );
    sUsr   = request.getParameter( "prmUsr" );
    sPwd   = request.getParameter( "prmPwd" );
    sTable = request.getParameter( "prmTab" );
    sSql   = request.getParameter( "prmSql" );
    if( null != sTable && 0 <  sTable.length() &&
       (null == sSql   || 0 == sSql.length())  )
      sSql = "SELECT * FROM " + sTable;
  }
%>
  
<form method="post">
<input type="hidden"     name="prmDbDrv" value='<%= sDbDrv %>' size=60><br>
<input type="hidden"     name="prmDbUrl" value='<%= sDbUrl %>' size=60><br>
<input type="hidden"     name="prmUsr"   value='<%= sUsr   %>' size=60><br>
<input type="hidden"     name="prmPwd"   value='<%= sPwd   %>' size=60><br>
<input type="hidden"     name="prmTab"   value='<%= sTable %>' size=60><br>
<input type="hidden"     name="prmSql"   value='<%= sSql   %>' size=60>
<input type="submit"     name="submit" value="Angebotene Fahrten anzeigen">
</form>


<%

  if( request.getParameterNames().hasMoreElements() == true
      && null != sDbDrv && 0 < sDbDrv.length()
      && null != sDbUrl && 0 < sDbUrl.length()
      && null != sSql   && 0 < sSql.length() )
  {
    Connection cn = null;
    Statement  st = null;
    ResultSet  rs = null;
    try {
      Class.forName( sDbDrv );
      cn = DriverManager.getConnection( sDbUrl, sUsr, sPwd );
      st = cn.createStatement();
      rs = st.executeQuery( sSql );
      ResultSetMetaData rsmd = rs.getMetaData();
      int n = rsmd.getColumnCount();
      out.println( "<table border=1 cellspacing=0><tr>" );
      for( int i=1; i<=n; i++ )    // Achtung: erste Spalte mit 1 statt 0
        out.println( "<th>" + rsmd.getColumnName( i ) + "</th>" );
      while( rs.next() )
      {
        out.println( "</tr><tr>" );
        for( int i=1; i<=n; i++ )  // Achtung: erste Spalte mit 1 statt 0
          out.println( "<td>" + rs.getString( i ) + "</td>" );
      }
      out.println( "</tr></table>" );
    } finally {
      try { if( null != rs ) rs.close(); } catch( Exception ex ) {/*ok*/}
      try { if( null != st ) st.close(); } catch( Exception ex ) {/*ok*/}
      try { if( null != cn ) cn.close(); } catch( Exception ex ) {/*ok*/}
    }
  }
%>