<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="./css/style.css" type="text/css">
<title>Login</title>
</head>
<body>

	 <div class="form">
        <div class="form-panel one">
          <div class="form-header">
            <h1>Inicio de sesión</h1>
          </div>
          <div class="form-content">
            <form action="UsuarioServlet" method="post">
              <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" required placeholder="email">
              </div>
              <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="clave" name="clave" required placeholder="password">
              </div>
              <div class="form-group">
                <button class="btnIngresar" value="Ingresar" type="submit">Ingresar</button>
              </div>
              <div>
			<p id="mensaje" style="color: red;">
				<%
					String resultado = (String)request.getAttribute("mensaje");
					String mensaje = "";
					if (resultado != null) {
						mensaje = resultado;
					}
				%>
				<%=mensaje %>
			</p>
		</div>
            </form>
          </div>
        </div>
      </div>
      <footer>
      <h3>Derechos reservados</h3>
      </footer>
  <script>
    setTimeout(function() {
        document.getElementById("mensaje").style.display = "none";
    }, 5000);
</body>
</html>