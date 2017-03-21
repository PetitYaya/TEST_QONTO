Projet réalisé sous Swift 3 avec version XCode 8.2.1

Architecture globale :

Utilisation du design pattern MVC avec des services (couche Réseau) qui récupèrent les données.
J'aurais voulu mettre en place une couche "Presenter" pour passer d'un MVC à MVP.
Dans cette archi MVP, la couche Presenter utiliserait la couche Service pour fetcher les données pour ensuite les retourner au controller au travers d'une interface dédiée (dans notre cas Protocol).
La principale idée étant que le controller n'est pas au courant de l'implémentation retenue (il ne fait qu'interroger le presenter et affiche les données fournies par ce dernier)

J'aurais voulu faire des tests unitaires basiques (XCTest) autour du Model mais manque de temps :(


Choix des librairies

Utilisation d'Alamofire + SwiftyJSON pour la couche réseau'


Difficulté

RAS si ce n'est la gestion du temps !! :o
Pour ce qui est de la gallerie d'images, je pense que je serai parti sur une lib Cocoapods'


Avancement

Je pense avoir réalisé 50% du travail. 
Je pense que 2h supplémentaires aurait permis de finaliser le projet (avec tests unitaires)'
