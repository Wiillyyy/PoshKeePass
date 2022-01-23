
<?php include('server.php') ?>
<!DOCTYPE html>
<html>
<head>
  <title>Inscription</title>
  <style>
      @import url('https://fonts.googleapis.com/css2?family=Rajdhani:wght@300&display=swap');
      * {
  margin: 0px;
  padding: 0px;
}
body {
  font-size: 120%;
  background: #F8F8FF;
    font-family: 'Rajdhani', sans-serif;
}

.header {
  width: 30%;
  margin: 50px auto 0px;
  color: white;
  background: red;
  text-align: center;
  border: 1px solid red;
  border-bottom: none;
  border-radius: 10px 10px 0px 0px;
  padding: 20px;
}
form, .content {
  width: 30%;
  margin: 0px auto;
  padding: 20px;
  border: 1px solid #B0C4DE;
  background: white;
  border-radius: 0px 0px 10px 10px;
}
.input-group {
  margin: 10px 0px 10px 0px;
}
.input-group label {
  display: block;
  text-align: left;
  margin: 3px;
}
.input-group input {
  height: 30px;
  width: 93%;
  padding: 5px 10px;
  font-size: 16px;
  border-radius: 5px;
  border: 1px solid red;
}
.btn {
  padding: 10px;
  font-size: 15px;
  font-family: 'Rajdhani', sans-serif;
  color: white;
  background: red;
  border: none;
  border-radius: 5px;
}
.error {
  width: 92%; 
  margin: 0px auto; 
  padding: 10px; 
  border: 1px solid #a94442; 
  color: #a94442; 
  background: #f2dede; 
  border-radius: 5px; 
  text-align: left;
}
.success {
  color: #3c763d; 
  background: #dff0d8; 
  border: 1px solid #3c763d;
  margin-bottom: 20px;
}
</style>
</head>
<body>
  <div class="header">
  	<h2>Formulaire d'Inscription</h2>
  </div>
	
  <form method="post" action="register2.php">
  	<?php include('errors.php'); ?>
  	<div class="input-group">
  	  <label>Pseudo</label>
  	  <input type="text" name="username" value="<?php echo $username; ?>">
  	</div>
  	<div class="input-group">
  	  <label>Mail</label>
  	  <input type="email" name="email" value="<?php echo $email; ?>">
  	</div>
  	<div class="input-group">
  	  <label>Mot de Passe</label>
  	  <input type="password" name="password_1">
  	</div>
  	<div class="input-group">
  	  <label>Retapez MDP</label>
  	  <input type="password" name="password_2">
  	</div>
  	<div class="input-group">
  	  <button type="submit" class="btn" name="reg_user">S'inscrire</button>
  	</div>
  	<p>
  		Déjà membre ? <a href="index.php"> viens ici</a>
  	</p>
  </form>
</body>
</html>