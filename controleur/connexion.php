<?php
header("Access-Control-Allow-Origin: *");
	if(isset($_POST)){
			include_once('../model/bigModelForMe.php');
			$nom = htmlspecialchars(addslashes($_POST['nom']));
			$mdp = sha1(htmlspecialchars(addslashes($_POST['mdp'])));
			$envoi = $manager->selectionUnique2('users',array('*'),"nom='$nom' AND mdp='$mdp'");
			if(count($envoi)==0){
				echo json_encode('');
			}else{
				echo json_encode($envoi);
			}
	}else{
		echo json_encode('aucune information envoyée');
	}
?>