<?php
if(isset($_POST)){
	include_once('../model/bigModelForMe.php');
			$message = $_POST['message_diffusion'];
			$users = $_POST['num_users'];
			$periode=array();
			$zone=array();
			if(isset($_POST['matin'])){
				array_push($periode, "matin");
			}if(isset($_POST['apres-midi'])){
				array_push($periode, "apres-midi");
			}if(isset($_POST['soir'])){
				array_push($periode, "soir");
			}
			
			if(isset($_POST['fruit_legume'])){
				array_push($zone, "fruit_legume");
			}if(isset($_POST['202'])){
				array_push($zone, "202");
			}if(isset($_POST['211'])){
				array_push($zone, "211");
			}	if(isset($_POST['208'])){
				array_push($zone, "208");
			}
			
			$tab0 = array(
				'libelle' => $message,
				'users_num' => $users
			);
			$envoi0 = $manager->insertion('message',$tab0,'');
			$id = $manager->dernierIdInserer();
			
			
			foreach($periode as $key => $val){
				foreach($zone as $key1 => $val1){
					$tab1 = array(
						'zone' => $val1,
						'periode' => $val,
						'msg_num' => $id
					);
					$envoi1 = $manager->insertion('groupe_users',$tab1,'');
				}
			}
			echo json_encode($periode);
 }
?>