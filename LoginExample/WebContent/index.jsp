<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Mitfahrzentrale</title>
</head>
<body>
        <form method="post" action="login.jsp">
            <center>
            <table border="2" width="30%" cellpadding="3">
                <thead>
                    <tr>
                        <th colspan="2">Mitfahrzentrale</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Benutzername</td>
                        <td><input type="text" name="username" value="" /></td>
                    </tr>
                    <tr>
                        <td>Passwort</td>
                        <td><input type="password" name="password" value="" /></td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="Login" /></td>
                    </tr>
                    <tr>
                        <td colspan="2"><a href="registerpage.jsp">Neu Registrieren</a></td>
                    </tr>
                </tbody>
            </table>
            </center>
        </form>
    </body>
</html>