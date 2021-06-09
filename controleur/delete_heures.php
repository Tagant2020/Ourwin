<?php
header("Access-Control-Allow-Origin: *");
	if(isset($_POST)){
			include_once('../model/bigModelForMe.php');
			$id_users = $_POST['users_num'];
			$valeur = $_POST['valeur'];
			$recup = $manager->supprimer('enregistrement',"users_num=$id_users AND datess = '$valeur'");
			echo json_encode('supprimé');
	}else{
		echo json_encode('aucune information envoyée');
	}
?>