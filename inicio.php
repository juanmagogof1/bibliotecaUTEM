<?php  session_start();  ?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Bienvenido <?php echo $_SESSION['userData']['first_name']?> </title>
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <style>
    /* Estilos personalizados */
    body {
      display: flex;
      flex-direction: column;
      min-height: 100vh;
    }
    
    main {
      flex: 1;
    }
    .bg-dgreen{
    	background: darkgreen !important;
    }
  </style>
</head>
<body>
  <!-- Barra de navegación -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dgreen">
    <div class="container">
      <a class="navbar-brand" href="#">Biblioteca UTEM</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto">
          
          <li class="nav-item">
            <a class="nav-link" href="#">Acerca de</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Cerrar Sesión</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <!-- Contenedor principal -->
  <div class="container-fluid flex-grow-1 border border-2">
    <div class="row">
      <!-- Menú lateral izquierdo -->
      <aside class="col-md-3 bg-dark rounded border border-5" style="min-height: 680px;">
        <h2 class="text-center text-white">Menú Lateral</h2>
        <!-- Aquí puedes agregar los elementos de tu menú -->
      </aside>
      
      <!-- Contenido principal -->
      <main class="col-md-9 bg-secondary rounded border border-2" style="min-height: 680px;">
        <h2>Contenido Principal</h2>
        <!-- Aquí puedes agregar el contenido principal de tu página -->
      </main>
    </div>
  </div>

  <!-- Footer -->
  <footer class="bg-dgreen text-white py-2">
    <div class="container">
      <p>Footer</p>
    </div>
  </footer>

  <!-- Bootstrap JS -->
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
<?php
print_r($_SESSION)?>
</html>
