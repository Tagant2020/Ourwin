<?php
header("Access-Control-Allow-Origin: *");
			include_once('../model/bigModelForMe.php');
			if($_POST['statut'] == 'employe'){
				$users = $_POST['users_num'];
				$recup = $manager->selectionUnique2('users',array('*'),"num_users =$users");
				$periode = $recup[0]->periode;
				$zone = $recup[0]->zone;
				$recup_id_msg = $manager->selectionUnique2('groupe_users',array('*'),"zone='$zone' AND periode='$periode'");
				
				if(count($recup_id_msg) > 0){
					$id_msg = $recup_id_msg[0]->msg_num;
					$recup_msg = $manager->selectionUnique2('message',array('*'),"num_msg=$id_msg");
					foreach($recup_msg as $key => $val){
						foreach($val as $key1 => $val1){
							if($key1 == 'users_num'){
								$recup_users = $manager->selectionUnique2('users',array('*'),"num_users=$val1");
								$prenom_users = $recup_users[0]->prenom;
								$recup_msg[$key]->$key1 = $prenom_users;
							}
						}
					}
					echo json_encode($recup_msg);
				}else{
					echo json_encode($recup_id_msg);
				}
			}else if($_POST['statut'] == 'administration'){
				$users = $_POST['users_num'];
				$recup = $manager->selectionUnique2('message',array('*'),"users_num =$users AND statut_diffusion = 'actif'");
				$id_msg_diffusé =$recup[0]->num_msg;
				$recup2 = $manager->selectionUnique2('message',array('*'),"message_referent =$id_msg_diffusé");
				if(count($recup2) > 0){
					foreach($recup2 as $key => $val){
						$id_utilisateur = '';
						foreach($val as $key1 => $val1){
							if($key1 == 'users_num'){
								$id_utilisateur = $val1;
							}
							if($key1 == 'anonymat' AND $val1 == 'Non'){
								$recup_users = $manager->selectionUnique2('users',array('*'),"num_users=$id_utilisateur");
								$prenom_users = $recup_users[0]->nom.' '.$recup_users[0]->prenom;
								$recup2[$key]->$key1 = $prenom_users;
							}
							
							
						}
					}
					echo json_encode($recup2);
				}else{
					echo json_encode('aucun message trouvé');
				}
			}
 ?>