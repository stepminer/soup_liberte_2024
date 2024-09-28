# soup_liberte_2024
Shiy app that illustrates participation in the soup liberte 2024.
# Application Shiny : Participants de la Soup Liberté 2024
# Description
Cette application Shiny permet de visualiser le nombre de participants ayant apprécié la Soup Liberté en 2024, ainsi que leur localisation géographique. L'application utilise une carte interactive pour illustrer la répartition des participants et fournit des statistiques sur leur appréciation de cet événement historique. La Soup Liberté est une soupe emblématique célébrée chaque année en Haïti pour commémorer l'indépendance.

# Fonctionnalités principales
Visualisation du nombre de participants ayant apprécié la Soup Liberté.
Carte interactive avec la localisation des participants.
Statistiques par région sur le niveau d'appréciation.
Interface utilisateur simple et intuitive.
# Prérequis
Avant d'exécuter l'application, assurez-vous que les éléments suivants sont installés sur votre machine :

R version 4.0 ou supérieure
RStudio (recommandé pour l'exécution locale)
Les bibliothèques R suivantes :
shiny
leaflet
dplyr
ggplot2
readr (pour la gestion des fichiers de données)
Installation
Clonez ce dépôt sur votre machine locale :

bash
Copy code
git clone https://github.com/votre-utilisateur/soup-liberte-app.git
Ouvrez le projet dans RStudio ou un autre environnement R.

Installez les bibliothèques R nécessaires :

r
Copy code
install.packages(c("shiny", "leaflet", "dplyr", "ggplot2", "readr"))
Exécution de l'application
Pour lancer l'application Shiny localement, exécutez le code suivant dans RStudio ou dans votre console R :

r
Copy code
library(shiny)
runApp("path_to_your_app_folder")
Si tout est correctement configuré, l'application s'ouvrira dans votre navigateur par défaut et vous pourrez interagir avec la carte et les statistiques.

Déploiement sur un serveur
Utilisation de Heroku
Assurez-vous d'avoir un compte Heroku et que l'outil Heroku CLI est installé sur votre machine.

Dans le répertoire de l'application, créez un fichier init.R pour indiquer à Heroku les paquets R nécessaires, par exemple :

r
Copy code
install.packages(c("shiny", "leaflet", "dplyr", "ggplot2", "readr"))
Suivez les étapes classiques pour déployer l'application sur Heroku :

bash
Copy code
heroku create
git push heroku master
Assurez-vous d'ajouter la buildpack pour R :

bash
Copy code
heroku buildpacks:set https://github.com/virtualstaticvoid/heroku-buildpack-r.git
Après déploiement, l'application sera accessible via une URL fournie par Heroku.

Fichiers de données
Les données utilisées par cette application contiennent les informations suivantes :

participants.csv : fichier contenant les détails des participants, leurs localisations et leur niveau d'appréciation.
Exemple de format de fichier CSV :
Nom	Localisation	Appréciation
Jean	Port-au-Prince	5
Marie	Cap-Haïtien	4
Jacques	Jacmel	3
Auteurs
Patrick Stephenson - Créateur de l'application
Votre Organisation - STOFoundationinternational.org
Licence
Ce projet est sous licence MIT. Vous êtes libre de modifier et redistribuer l'application selon les termes de la licence.

Ce document README fournit les informations nécessaires pour l'installation, l'utilisation et le déploiement de l'application Shiny.
