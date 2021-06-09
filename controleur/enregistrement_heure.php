<?php
if(isset($_POST)){
	include_once('../model/bigModelForMe.php');
			$envoi = $manager->insertion('enregistrement',$_POST,'');
			$id = $manager->dernierIdInserer();
			$envoi2 = $manager->selectionUnique('enregistrement',array('*'),$id,'num_enreg');
			if(count($envoi2) == 0){
				echo json_encode($_POST);
			}else{
				echo json_encode($envoi2);
			}
			
 }
?>