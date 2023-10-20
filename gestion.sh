#!/bin/bash
create(){
    echo "Entrer le nom du répertoire"
    read nom

 

    # Vérifie si le répertoire n'existe PAS
    if [ ! -d "$nom" ]; then
        mkdir "$nom"
        echo "Le répertoire a été créé."
    else 
        echo "Le répertoire existe déjà."
   fi
}


view(){
echo "Entrer le nom du répertoire "
read nom
if [ -d  "$nom" ]; then 
ls "$nom"
else 
echo "Le répertoire '$nom' n'existe pas"
fi
}
move()

{

    echo "Entrer le nom du fichier/répertoire que vous souhaitez déplacer"

    read nom


    if [ -e "$nom" ]; then

        # Demande où mettre le fichier/répertoire

        echo "Où voulez-vous placer le fichier/répertoire '$nom'? (Entrez le chemin du répertoire de destination) : " 
        read repertoire


 

        # Déplace le fichier/répertoire vers le répertoire de destination

        mv "$nom" "$repertoire"

        echo "Le fichier/répertoire '$nom' a été déplacé vers '$repertoire'"

    else

        echo "Le fichier/répertoire '$nom' n'existe pas"  

    fi

}

rename(){

 

    echo "Entrez le nom du fichier/répertoire que vous voulez renommer"
    read nom

 

    # Vérifiez si le fichier/répertoire existe
    if [ -e "$nom" ]; then
        read -p "Entrez le nouveau nom: " nouveau_nom

 

        # Vérification pour s'assurer que le nouveau nom n'existe pas déjà
        if [ -e "$nouveau_nom" ]; then
            echo "Un fichier/répertoire avec le nom '$nouveau_nom' existe déjà."
            return
        fi

 

        # Effectue le renommage
        mv "$nom" "$nouveau_nom"
        echo "Le fichier/répertoire '$nom' a été renommé en '$nouveau_nom'"
    else
        echo "Le fichier/répertoire '$nom' n'existe pas"
    fi
}
delete(){
    echo "Entrez le nom  du fichier/répertoire que vous voulez supprimer:"
    read nom

if [ -e "$nom" ]; then
        echo "Voulez-vous vraiment supprimer '$nom'? [y/n]"
        read choix

 

        case $choix in
            y|Y)
                rm -r "$nom"
                echo "'$nom' a été supprimé."
                ;;
            n|N)
                echo "Suppression annulée."
                ;;
            *)
                echo "Choix invalide. Opération annulée."
                ;;
        esac
    else
        echo "Le fichier/répertoire '$nom' n'existe pas."
    fi

}

copy(){
    echo "Entrez le nom du fichier/répertoire que vous souhaitez copier"
    read nom

 

    if [ -e "$nom" ]; then
        read -p "Entrez le nom de la copie: " copi
 

        # Si c'est un répertoire, copiez-le de manière récursive
        if [ -d "$nom" ]; then

      cp -r "$nom" "$copie"
        else
            cp "$nom" "$copie"
        fi
        echo "Le fichier/répertoire '$nom' a été copié en '$copie'"
    else
        echo "Le fichier/répertoire '$nom' n'existe pas"
    fi
}
find_item(){
    echo "Entrez le nom du fichier/répertoire que vous cherchez :"
    read nom

 

    echo "Entrez le répertoire de départ pour la recherche (par exemple /home/username) ou appuyez sur Entrée pour rechercher dans tout le système :"
    read start_directory

 

    # Si l'utilisateur n'a pas fourni de répertoire de départ, recherchez dans tout le système
    if [ -z "$start_directory" ]; then
        start_directory="/"
    fi

 

    # Recherche du fichier ou du répertoire
    results=$(find "$start_directory" -name "$nom" 2>/dev/null)

 

    if [ -z "$results" ]; then
        echo "Aucun fichier ou répertoire nommé '$nom' trouvé dans '$start_directory'."
    else
        echo "Résultats de la recherche :"
       echo "$results"
    fi
}
count(){
echo "Entrez le chemin du répertoire"
read nom
if  [ -d "$nom" ]; then
        echo "Il y a $(ls -l "$nom" | grep ^- | wc -l) fichiers dans le répertoire $nom"

else
echo "Le répertoire n'existe pas"
fi
}
quit(){
exit
}






 


create_f(){

 

    # Demandez à l'utilisateur le répertoire
    echo "Entrez le chemin du répertoire où vous voulez créer le fichier :"
    read repertoire

    # Vérifiez si le répertoire existe
    if [ -d "$repertoire" ]; then

 

        # Demandez à l'utilisateur le nom du fichier
        echo "Entrez le nom du fichier :"
        read nom

 

        # Créez le fichier dans le répertoire spécifié
        touch "$repertoire/$nom"

 

        echo "Fichier '$nom' créé dans '$repertoire'."

 

    else
        echo "Le répertoire '$repertoire' n'existe pas."
    fi
}
echo "1.Créer un répertoire"
echo "2.Afficher le contenu d'un répertoire"
echo "3.Deplacer un fichier/répertoire"
echo "4.Renommer un fichier/répertoire"
echo "5.Supprimer un fichier/répertoire"
echo "6.Copier un fichier/répertoire"
echo "7.Rechercher des fichiers"
echo "8.Compter les fichiers dans un répertoire"
echo "9.Quitter"
read -p  "Faites votre choix:  " choix 
 
case $choix in
1)create ;;
2)view ;;
3)move ;;
4)rename ;;
5)delete ;;
6)copy ;;
7)find_item ;;
8)count ;;
9)quit ;;
10)create_f ;;
*) echo "Choix invalide. Veuillez entrer un numéro valide." ;;
 
esac