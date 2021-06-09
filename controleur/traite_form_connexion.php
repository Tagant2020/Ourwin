<?php
header("Access-Control-Allow-Origin: *");
	if(isset($_POST)){
		include_once('../model/bigModelForMe.php');
		$login = htmlspecialchars(addslashes($_POST['login']));
		$password = sha1(htmlspecialchars(addslashes($_POST['pwd'])));
		$r = $manager->exists('utilisateur',$login,$password);
		echo json_encode($r);
	}
?>