<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <div class="row justify-content-center mt-5">
            <div class="col-md-4">
                <h2>Login</h2>
                <?php
                require_once 'connection.php';

                // Comprobar si se ha enviado el formulario
                if ($_SERVER['REQUEST_METHOD'] === 'POST') {
                    echo "Password tecleado:";
                    echo $_POST['password'];
                    echo "<br>";
                    echo "Password cifrado md5:";
                    echo md5($_POST['password']);
                    // Obtener los datos del formulario
                    /*$userCode = $_POST['userCode'];
                    $password = $_POST['password'];
                    
                    // Consultar la tabla usersactive
                    $sql = "SELECT * FROM usersactive WHERE userCode = '$userCode' AND Pass = '$password'";
                    $result = $conn->query($sql);
                    
                    // Comprobar si se encontró un usuario válido
                    if ($result->num_rows > 0) {
                        echo '<div class="alert alert-success">Inicio de sesión exitoso.</div>';
                        $row = $result->fetch_assoc();
                        $type = $row['UserType'];
                        $query = "";
                        $id = (int)$row['uId'];
                        switch($type){
                        	default:
                        		$query = "SELECT * FROM vwadmins where user_id =". $id;
                        		break;
                        	case 3:
                        		$query = "SELECT * FROM vwadminstrativos where user_id =". $id;
                        		break;
                        	case 4:
                        		$query = "SELECT * FROM vwdocente where user_id =". $id;
                        		break;
                        	case 5:
                        		$query = "SELECT * FROM vwalumnos where user_id =". $id;
                        		break;
                        	case 6:
                        		$query = "SELECT * FROM vwexternos where user_id =". $id;
                        		break;
                        }
                         $result2 = $conn->query($query);
                         if ($result2->num_rows > 0) {
                         	$user = $result2->fetch_assoc();
                         	session_start();
                         	$_SESSION['userData']=$user;
                         	print_r(json_encode($_SESSION['userData']));
                         	header("Location: inicio.php");
                         }	
                    } else {
                        echo '<div class="alert alert-danger">Usuario o contraseña incorrectos.</div>';
                    }*/
                }

                // Cerrar la conexión a la base de datos
                $conn->close();
                ?>
                <form method="post" action="<?php echo $_SERVER['PHP_SELF']; ?>">
                    <div class="mb-3">
                        <label for="userCode" class="form-label">Usuario</label>
                        <input type="text" class="form-control" id="userCode" name="userCode" required>
                    </div>
                    <div class="mb-3">
                        <label for="password" class="form-label">Contraseña</label>
                        <input type="password" class="form-control" id="password" name="password" required>
                    </div>
                    <button type="submit" class="btn btn-primary">Iniciar sesión</button>
                </form>
            </div>
        </div>
    </div>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/js/bootstrap.bundle.min.js"></script>
</body>
</html>
