<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<!--  <link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
	crossorigin="anonymous"></script>-->
<link rel="stylesheet" href="./css/style.css" type="text/css">
<title>Matricula web</title>
</head>
<body>

	 <div class="form">
        <div class="form-panel one">
          <div class="form-header">
            <h1>Inicio de sesión</h1>
          </div>
          <div class="form-content">
            <form>
              <div class="form-group">
                <label for="username">Email</label>
                <input type="email" id="username" name="username" required placeholder="email">
              </div>
              <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required placeholder="password">
              </div>
              <div class="form-group">
                <a class="btnIngresar" href="index.jsp">Ingresar</a>
              </div>
            </form>
          </div>
        </div>
      </div>
      <footer>
      <h3>Desarrollado por @angeldev</h3>
      </footer>
</body>
</html>