<?php
header("Access-Control-Allow-Origin: *");
	if(isset($_POST)){
			include_once('../model/bigModelForMe.php');
			$repas_ou_boissons = $_POST['repas_ou_boissons'];
			$son_nom = $_POST['son_nom'];
			if($repas_ou_boissons == 'menu_repas'){
				$envoi = $manager->supprimer('repas',"repas='$son_nom'");
			}else{
				$envoi = $manager->supprimer('boissons',"boissons='$son_nom'");
			}
			
			if(count($envoi)==0){
				echo json_encode('');
			}else{
				echo json_encode($envoi);
			}
	}else{
		echo json_encode('aucune information envoyée');
	}
?>