<?php
header("Access-Control-Allow-Origin: *");
	if(isset($_POST['users_num'])){
			include_once('../model/bigModelForMe.php');
			$users_num = $_POST['users_num'];
			$envoi = $manager->selectionUnique2('enregistrement',array('*'),"users_num=$users_num");
			if(count($envoi)==0){
				echo json_encode('');
			}else{
				echo json_encode($envoi);
			}
	}else{
		echo json_encode('aucune information envoyée');
	}
?>