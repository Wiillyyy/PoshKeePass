<?php
include('server.php')
// Check connection

?>


<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">
    <title>Inscription</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/sign-in/">

    

    <!-- Bootstrap core CSS -->
<link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>

    
    <!-- Custom styles for this template -->
    <link href="signin.css" rel="stylesheet">
  </head>
  <body class="text-center">
    
<main class="form-signin">


  <form method="post" action="register.php">
    <img class="mb-4" src="../assets/brand/bootstrap-logo.svg" alt="" width="72" height="57">
    <h1 class="h3 mb-3 fw-normal">Inscription</h1>

    <div class="form-floating">
      <input type="username" class="form-control" name="username" id="username" placeholder="William">
      <label for="floatingInput">Pseudo</label>
    </div>
    <div class="form-floating">
      <input type="password" class="form-control" name="password_1" id="password_1" placeholder="Password">
      <label for="floatingPassword">Mot de passe</label>
    </div>
    <div class="form-floating">
      <input type="password" class="form-control" name="password_2" id="password_2" placeholder="Password">
      <label for="floatingPassword">Confirmer passe</label>
    </div>
    <img 
    src="https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.pinclipart.com%2Fpicdir%2Fbig%2F2-23205_free-vector-button-green-clip-art-green-button.png&f=1&nofb=1" 
    width="5" height="5"> <?php echo "Connecté" ?>

    <div class="checkbox mb-3">
      <label>
        <!-- <input type="checkbox" value="remember-me"> Se souvenir de moi -->
      </label>
    </div>
    <button class="w-100 btn btn-lg btn-primary" type="submit">S'inscrire</button>
    <div class="PaCompte"><br>
    <h5 class="h5 mb-5 fw-normal">On se rappelle de ses ID ?</h5>
    <a href="index.php" class="h6 mb-6 fw-normal">C'est par ici</a>

    </div>
    <p class="mt-5 mb-3 text-muted">&copy; 2021–2021</p>
  </form>
</main>


    
  </body>
</html>
