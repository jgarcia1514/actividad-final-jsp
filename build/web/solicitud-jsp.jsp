<%@ page import="java.sql.*" %>
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

  th, td {
      padding: 10px;
      text-align: left;
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
    <h1>Solicitud de Servicios</h1>
    <form id="clienteForm" action="confirmacion.jsp" method="post">
        <label for="nombres">Nombres:</label>
        <input type="text" id="nombres" name="nombres" required>

        <label for="apellidos">Apellidos:</label>
        <input type="text" id="apellidos" name="apellidos" required>

        <label for="correo">Correo Electrónico:</label>
        <input type="email" id="correo" name="correo" required>

        <label for="telefono">Número de Celular:</label>
        <input type="tel" id="telefono" name="telefono" pattern="[0-9]+" required>

        <label for="servicio">Servicio que solicita:</label>
        <select id="servicio" name="servicio" required>
            <option value="Personalización">Personalización</option>
            <option value="Pedido Mayorista">Pedido Mayorista</option>
            <option value="Devolución">Devolución</option>
        </select>
        
     
        <input type="submit" value="Enviar datos">
        <input type="reset" value="Cancelar">
    </form>
</div>
</body>
</html>
