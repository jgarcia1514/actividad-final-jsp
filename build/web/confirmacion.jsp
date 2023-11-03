<%@ page import="java.sql.*" %>
<%@ page import="com.mysql.cj.jdbc.Driver" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Sport Sale Tienda Online </title>
  <style>
    :root {
      --white: #FFFFFF;
      --black: #000000;
      --very-light-pink: #C7C7C7;
      --text-input-field: #F7F7F7;
      --hospital-green: #ACD9B2;
      --sm: 14px;
      --md: 16px;
      --lg: 18px;
    }
    body {
      margin: 0;
      font-family: 'Quicksand', sans-serif;
      align-items: center;
      text-align: center;
    }
    nav {
      display: flex;
      justify-content: space-between;
      padding: 0 24px;
      border-bottom: 1px solid var(--very-light-pink);
    }
    .menu {
      display: none;
    }
    .logo {
      width: 100px;
    }
    .navbar-left ul,
    .navbar-right ul {
      list-style: none;
      padding: 0;
      margin: 0;
      display: flex;
      align-items: center;
      height: 60px;
    }
    .navbar-left {
      display: flex;
    }
    .navbar-left ul {
      margin-left: 12px;
    }
    .navbar-left ul li a,
    .navbar-right ul li a {
      text-decoration: none;
      color: var(--very-light-pink);
      border: 1px solid var(--white);
      padding: 8px;
      border-radius: 8px;
    }
    .cards-container {
      display: grid;
      grid-template-columns: repeat(auto-fill, 240px);
      gap: 26px;
      place-content: center;
    }
    .product-card {
      width: 240px;
    }

    .product-card img {
      width: 240px;
      height: 240px;
      border-radius: 20px;
      object-fit: cover;
    }

    .product-info {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-top: 12px;
    }
    .product-info figure {
      margin: 0;
    }
    .product-info figure img {
      width: 35px;
      height: 35px;
    }

    .navbar-left ul li a:hover,
    .navbar-right ul li a:hover {
      width: 100%;
      height: 360px;
      object-fit: cover;
      border: 1px solid var(--hospital-green);
      color: var(--hospital-green);
    }
    .navbar-email {
      color: var(--very-light-pink);
      font-size: var(--sm);
      margin-right: 12px;
    }
    .navbar-shopping-cart {
      position: relative;
    }
    .navbar-shopping-cart div {
      width: 16px;
      height: 16px;
      background-color: var(--hospital-green);
      border-radius: 50%;
      font-size: var(--sm);
      font-weight: bold;
      position: absolute;
      top: -6px;
      right: -3px;
      display: flex;
      justify-content: center;
      align-items: center;
    }
    
    h1 {
      color: #333;
  }

  form {
      background-color: #fff;
      border: 1px solid #ccc;
      padding: 20px;
      max-width: 400px;
      margin: 0 auto;
      border-radius: 5px;
  }

  label {
      display: block;
      margin-top: 10px;
  }

  input, select {
      width: 80%;
      padding: 10px;
      margin: 5px 0;
      border: 1px solid #ccc;
      border-radius: 3px;
  }

  input[type="submit"], input[type="reset"] {
      background-color: var(--hospital-green);
      color: white;
      border: none;
      padding: 10px 20px;
      margin-top: 20px;
      cursor: pointer;
      border-radius: 3px;
  }

  input[type="submit"]:hover, input[type="reset"]:hover {
      background-color: var(--very-light-pink);
  }

  table {
      border-collapse: collapse;
      width: 100%;
      margin-top: 20px;
  }

  table, th, td {
      border: 1px solid #ccc;
  }

  table, th, td {
      padding: 10px;
      text-align: left;
  }

  table {
    border-collapse: collapse;
    max-width: 600px;
    margin: 0 auto;
    background-color: #fff;
    border: 1px solid #ccc;
    border-radius: 5px;
}

    @media (max-width: 640px) {
      .menu {
        display: block;
      }
      .navbar-left ul {
        display: none;
      }
      .navbar-email {
        display: none;
      }

      .cards-container {
        grid-template-columns: repeat(auto-fill, 140px);
      }
    }
  </style>
</head>
<body class="body">
  <nav>
    <img src="./icons/icon_menu.svg" alt="menu" class="menu">

    <div class="navbar-left">
      <img src="./logos/logo2.svg" alt="logo" class="logo">

      <ul>
        <li>
          <a href="base.html">Nuestra Tienda on-line</a>
        </li>
        <li>
          <a href="./servicios.html">Servicios</a>
        </li>
        <li>
          <a href="contactenos.html">Contactenos</a>
        </li>
        <li>
          <a href="./solicitud-jsp.jsp">Solicitud de servicios</a>
        
      </ul>
    </div>

    <div class="navbar-right">
      <ul>
        <li class="navbar-email">ventas@soy-ucn.com</li>
        <li class="navbar-shopping-cart">
          <img src="./icons/icon_shopping_cart.svg" alt="shopping cart">
          <div>2</div>
        </li>
      </ul>
    </div>
  </nav>

  <div class="body">
    <h1>Confirma tus Datos</h1>
    
<%
String url = "jdbc:mysql://localhost:3306/ucn";
String user = "root";
String password = "";

String nombres = request.getParameter("nombres");
String apellidos = request.getParameter("apellidos");
String correo = request.getParameter("correo");
String telefono = request.getParameter("telefono");
String servicio = request.getParameter("servicio");

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection(url, user, password);
    String insertQuery = "INSERT INTO formulario (nombre, apellido, correo, celular, servicio_sol) VALUES (?, ?, ?, ?, ?)";
    PreparedStatement preparedStatement = conn.prepareStatement(insertQuery);
    preparedStatement.setString(1, nombres);
    preparedStatement.setString(2, apellidos);
    preparedStatement.setString(3, correo);
    preparedStatement.setString(4, telefono);
    preparedStatement.setString(5, servicio);
    preparedStatement.executeUpdate();

    // Ahora, realizamos una consulta para obtener los datos de la base de datos
    String selectQuery = "SELECT nombre, apellido, correo, celular, servicio_sol FROM formulario";
    preparedStatement = conn.prepareStatement(selectQuery);
    ResultSet resultSet = preparedStatement.executeQuery();
%>

<table>
    <tr>
        <th>Campo</th>
        <th>Valor</th>
    </tr>
    <%
    while (resultSet.next()) {
    %>
    <tr>
        <td>Nombres:</td>
        <td><%= resultSet.getString("nombre") %></td>
    </tr>
    <tr>
        <td>Apellidos:</td>
        <td><%= resultSet.getString("apellido") %></td>
    </tr>
    <tr>
        <td>Correo Electrónico:</td>
        <td><%= resultSet.getString("correo") %></td>
    </tr>
    <tr>
        <td>Número de Celular:</td>
        <td><%= resultSet.getString("celular") %></td>
    </tr>
    <tr>
        <td>Servicio Solicitado:</td>
        <td><%= resultSet.getString("servicio_sol") %></td>
    </tr>
    <%
    }
    resultSet.close();
    %>
</table>

<%
    conn.close();
} catch (SQLException e) {
    out.println("Error al conectar a la base de datos: " + e.getMessage());
} catch (ClassNotFoundException e) {
    out.println("Error al cargar el controlador de MySQL: " + e.getMessage());
}
%>


</div>
</body>
</html>