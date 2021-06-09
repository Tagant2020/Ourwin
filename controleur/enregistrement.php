<?php
if(isset($_POST)){
	include_once('../model/bigModelForMe.php');
	$nom_bi = $_POST['bi_num'];
	$nom_ep = $_POST['ep_num'];
	$id_bi = $manager->selectionUnique2('boite_interim',array('num_bi'),"nom ='$nom_bi'");
	$id_bi = $id_bi[0]->num_bi;
	
	$id_ep = $manager->selectionUnique2('entreprise',array('num_ep'),"nom ='$nom_ep'");
	$id_ep = $id_ep[0]->num_ep;
	
	$_POST['bi_num'] = intval($id_bi);
	$_POST['ep_num'] = intval($id_ep);
	$_POST['droit_num'] = 2;
			foreach($_POST as $key => $val){
				if($key == 'mdp'){
					$_POST[$key] = sha1(htmlspecialchars(addslashes($val)));
				}else{
					$_POST[$key] = htmlspecialchars(addslashes($val));
				}
			}
			$envoi = $manager->insertion('users',$_POST,'');
			$id = $manager->dernierIdInserer();
			$envoi2 = $manager->selectionUnique('users',array('*'),$id,'num_users');
			if(count($envoi2) == 0){
				echo json_encode($envoi);
			}else{
				echo json_encode($envoi2);
			}
			
 }
?>