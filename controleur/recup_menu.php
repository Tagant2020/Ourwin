<?php
header("Access-Control-Allow-Origin: *");
			include_once('../model/bigModelForMe.php');
			$envoi = $manager->selection('repas',array('*'));
			$envoi1 = $manager->selection('boissons',array('*'));
			$tab = array(
				'repas'=>$envoi,
				'boissons'=>$envoi1
			);
			echo json_encode($tab);
?>