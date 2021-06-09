<?php
header("Access-Control-Allow-Origin: *");
	if (isset($_POST['nom'])){
			include_once('../model/bigModelForMe.php');
			 $id_users = htmlspecialchars(addslashes($_POST['id_users']));
			 $nom = htmlspecialchars(addslashes($_POST['nom']));
			 $prenom = htmlspecialchars(addslashes($_POST['prenom']));
			 $telephone1 = htmlspecialchars(addslashes($_POST['tel1']));
			 $telephone2 = htmlspecialchars(addslashes($_POST['tel2']));
			 $email = htmlspecialchars(addslashes($_POST['email']));
			 $datess = htmlspecialchars(addslashes($_POST['jour'])).'-'.htmlspecialchars(addslashes($_POST['mois'])).'-'.htmlspecialchars(addslashes($_POST['annee']));
				
			$envoi0 = $manager->selectionUnique2('users',array('*'),"tel1='$telephone1' OR tel2='$telephone2' AND id_users <> $id_users");
			if(count($envoi0)==0){
				$table = array(
					'nom'=>$nom,
					'prenom'=>$prenom,
					'datess'=>$datess,
					'tel1'=>$telephone1,
					'tel2'=>$telephone2,
					'email'=>$email
				);
				$r8 = $manager->modifier('users',$table,"id_users = $id_users");
				$envoi = $manager->selectionUnique2('users',array('*'),"id_users = $id_users");
				echo json_encode($envoi);
			}else{
				echo json_encode('');
			}
				
				
	}else{
		echo json_encode('aucune information envoyée');
	}
		
?>