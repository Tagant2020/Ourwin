<?php
header("Access-Control-Allow-Origin: *");
			include_once('../model/bigModelForMe.php');
			$envoi = $manager->selection('commandes',array('*'));
			foreach($envoi as $key => $val){
				foreach($val as $key1 => $val1){
					if($key1 == 'repas_num'){
						$repas = $manager->selectionUnique2('repas',array('repas'),"num_repas =$val1");
						$repas = $repas[0]->repas;
						$envoi[$key]->$key1 = $repas;
					}else if($key1 == 'bss_num'){
						$boissons = $manager->selectionUnique2('boissons',array('boissons'),"num_bss =$val1");
						$boissons = $boissons[0]->boissons;
						$envoi[$key]->$key1 = $boissons;
					}else if($key1 == 'users_num'){
						$nom_users = $manager->selectionUnique2('users',array('nom'),"num_users =$val1");
						$nom_users = $nom_users[0]->nom;
						$envoi[$key]->$key1= $nom_users;
					}
				}
			}
			// echo '<pre>';
				// print_r($envoi);
			// echo '</pre>';
			echo json_encode($envoi);
 ?>