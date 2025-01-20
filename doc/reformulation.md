# La chaîne de bibliothèque

Une chaîne interconnectée de bibliothèques souhaite centraliser et harmoniser la gestion de ses collections, abonnés, événements et prêts. La base de données devra fournir les fonctionnalités suivantes :

## Une Bibliothèque

- Une bibliothèque est définie par :
  - un **id unique**, 
  - une **adresse**, 
  - un **nom**, 
  - et une **région**.
- Chaque bibliothèque peut employer un ou plusieurs **salariés**.
- Une bibliothèque possède plusieurs **exemplaires** d’ouvrages et permet :
  - La **commande de livres** (via des transferts entre bibliothèques).  
  - Le **prêt d’ouvrages** aux abonnés.
  - L’organisation d’**événements**.

## Gestion des ouvrages et leur emplacement

- Un ouvrage est identifié par un **ISBN unique** et contient les informations suivantes :
  - **Titre**, **auteur**, **éditeur**, **date de publication**, et **collection** (le cas échéant).
- Chaque ouvrage peut exister en plusieurs **exemplaires** :
  - Chaque exemplaire est associé à une bibliothèque et possède un **emplacement précis** comprenant :
    - La **pièce numérotée**.
    - L’**étagère** dans cette pièce.
    - Le **rang exact** sur l’étagère.

## Gérer les abonnés et leur historique de prêt

- Un **abonné** est défini par :
  - une **adresse email unique**, 
  - son **nom**, 
  - son **prénom**, 
  - et sa **date de naissance**.
- Il est possible de connaître l’**historique** de chaque abonné grâce à son email.
- Un **prêt d’exemplaire** a une durée de **1 mois**, renouvelable une fois pour une durée supplémentaire de **2 semaines**.
- Un abonné n’est pas associé à une bibliothèque mais doit en fournir une pour :
  - **Venir chercher** les livres.
  - **Rendre** les livres.
- Si l’abonné ne rend pas le livre à temps, une **infraction** lui est associée.

## Pour le transfert de livre

- Un transfert de livre peut être demandé :
  - Lorsqu’un abonné effectue un prêt dans une autre bibliothèque qui demande ce livre.
  - Ou lorsqu’une bibliothèque en fait la demande sans motif particulier.
- Les règles de transfert incluent :
  - Les envois sont effectués :
    - **Une fois par semaine** (le dimanche).
    - **Dès que 5 transferts** vers une même destination sont prêts.
  - Un **employé** de la bibliothèque d’origine supervise l’envoi.
  - Un **employé** de la bibliothèque destinataire doit être présent lors de la réception.
  - Aucun transfert ne peut être réalisé si des **événements** sont en cours dans les bibliothèques d’envoi ou de réception.

## Suivre les événements

- Un **événement** est organisé par une bibliothèque et est défini par :
  - un **id unique**, 
  - un **type**, 
  - et une **date**.
- Il existe deux types d’événements :
  - Les **conférences** : une présentation d’ouvrages par un auteur.
  - Les **expositions** : une présentation d’ouvrages d'une thématique donnée.
