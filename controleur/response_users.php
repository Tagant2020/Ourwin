<?php
if(isset($_POST)){
	include_once('../model/bigModelForMe.php');
		$envoi = $manager->insertion('message',$_POST,'');
		$id = $manager->dernierIdInserer();
		$envoi2 = $manager->selectionUnique('message',array('*'),$id,'num_msg');
		if(count($envoi2) == 0){
			echo json_encode('pas enregistré');
		}else{
			echo json_encode($envoi2);
		}
 }
?>