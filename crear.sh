#!/bin/bash
clear
echo "**********************************"
echo "Administracion de usuarios y grupos"
echo ""
echo "***********************************"
echo "*** Menu***"
echo ""
echo "1.- Crear usuario"
echo "2.- Eliminar Usuario"
echo "3.- Crear grupo"
echo "4.- Agregar usuario al grupo"
echo "5.- Eliminar usuario de grupo"
echo "6.- salir"
echo ""
echo ""
echo "eliga una opcion"
read opcion
echo ""
echo ""
if [ $opcion = 1 ];
then
	echo "ingrese nombre de usuario ha crear"
	read user
	echo "desea agregar usuario a grupos especificos (s/n)?"
	read opcion
	if [ $opcion = s ];
	then	
		echo "ingrese nombre de grupo secundario"
		read group2
		echo  "ingrese nombre de grupo primario"
		read group1
		echo "esta seguro de crear usuario $user en el grupo primario $group1 y secundario $group2 (s/n)?"
		read opcion1
		if [ $opcion1 = s ];
		then
			useradd $user -g $group1 -G $group2
			echo " el usuario $user se ha creado en $group1 y grupo secundario $group2"	
			groups $user 
		fi
		if [ $opcion1 = n ];
		then
			echo "no se ha creado usuario"
		fi
	fi
	if [ $opcion = n ];
	then	
		echo "desea crear el usuario $user (s/n)?"
		read opcion3
		if [ $opcion3 = s ];
		then
			useradd  $user
			echo "se ha creado el usuario $user"
		fi
		if [ $opcion3 = n ];
		then
			echo "no se ha creado usuario"
		fi	
fi	
fi
if [ $opcion = 2 ];
then
	echo "ingrese nombre de usuario a eliminar"
	read userdel
	echo "desea eliminar usuario $userdel? (s/n)"
	read opcion4
	if [ $opcion4 = s ];
	then	
		echo "se ha eliminado el usuario $userdel"
		userdel $userdel
	fi
	if [ $opcion4 = n ];
	then
		echo "no se ha eliminado usuario $userdel"
	fi
fi
if [ $opcion = 3 ];
then
	echo "ingrese nombre de grupo a crear"
	read grupo
	echo "esta seguro de agregar el grupo (s/n)?"
	read tecla
	if [ $tecla = s ];
	then	
		groupadd $grupo
		echo "se ha creado el grupo $grupo"
	fi
	if [ $tecla = n ];
	then
		echo "no se ha creado el grupo $grupo"
	fi
fi
if [ $opcion = 4 ];
then
	echo "nombre de usuario que deseas agregar"
	read usermod
	echo "ingrese nombre de grupo que desea agregar el usuario $usermod"
	read grupo
	useradd $usermod
	groupadd $grupo
	usermod $usermod -g $grupo
	echo "se agrego el usuario $usermod al grupo $grupo"
fi
if [ $opcion = 5 ];
then
	echo "ingrese nombre de usuario que desea remover de un grupo"
	read usermod
	echo "ingrese nombre del grupo"
	read grupo4
	echo "esta seguro de eliminar el usuario $usermod del grupo $grupo (s/n)?"
	read opcion10
	if [ $opcion10 = s ];
	then
		gpasswd -d  $usermod $grupo4
		echo "se ha removido el usuario $usermod del grupo $grupo4"
	fi
	if [ $opcion10 = n ];
	then
		echo "no se ha eliminado el usuario $usermod del grupo $grupo4"
	fi
fi
if [ $opcion = 6 ];
then
	break
	echo "gracias, hasta luego"
fi
		
		
