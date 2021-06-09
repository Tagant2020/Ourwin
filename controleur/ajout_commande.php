<?php
if(isset($_POST)){
	include_once('../model/bigModelForMe.php');
	$repas = $_POST['repas'];
	$boissons = $_POST['boissons'];
	$users_num = $_POST['users_num'];
	
	$repas = $manager->selectionUnique2('repas',array('num_repas'),"repas ='$repas'");
	$repas = $repas[0]->num_repas;
	
	$boissons = $manager->selectionUnique2('boissons',array('num_bss'),"boissons ='$boissons'");
	$boissons = $boissons[0]->num_bss;
	
	$tab = array(
		'repas_num'=>$repas,
		'bss_num'=>$boissons,
		'users_num'=>$users_num
	);
	
		$envoi = $manager->insertion('commandes',$tab,'');
		$id = $manager->dernierIdInserer();
		$envoi2 = $manager->selectionUnique('commandes',array('*'),$id,'num_cmd');
		if(count($envoi2) == 0){
			echo json_encode('pas enregistré');
		}else{
			echo json_encode($envoi2);
		}
 }
?>