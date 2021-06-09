<?php
if(isset($_POST)){
	include_once('../model/bigModelForMe.php');
	$designation = $_POST['designation'];
	if($designation == 'repas'){
		unset($_POST['designation']);
		$envoi = $manager->insertion('repas',$_POST,'');
		$id = $manager->dernierIdInserer();
		$envoi2 = $manager->selectionUnique('repas',array('*'),$id,'num_repas');
		if(count($envoi2) == 0){
			echo json_encode('pas enregistré');
		}else{
			echo json_encode($envoi2);
		}
	}else{
		unset($_POST['designation']);
		$envoi = $manager->insertion('boissons',$_POST,'');
		$id = $manager->dernierIdInserer();
		$envoi2 = $manager->selectionUnique('boissons',array('*'),$id,'num_bss');
		if(count($envoi2) == 0){
			echo json_encode('pas enregistré');
		}else{
			echo json_encode($envoi2);
		}
	}
 }
?>