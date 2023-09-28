<h1 align="center">
Le Pôticha éditions<br>
</h1>
<h4 align="center">Création du site de la maison d'édition associative Le Pôticha - Projet final THP - Backend Rails API - Frontend React</h4>
<p align="center"> Ceci est l'API Back du projet </p>

## Présentation du projet 😺
Le Pôticha éditions est une maison d'édition associative toulousaine qui publie des textes de théâtre et fonctionne sur un système d'abonnements. Elle est présente sur les réseaux sociaux mais ne disposait jusqu'à ce jour pas d'un site web professionnel. Elle a fait appel à nous pour le réaliser. Ce site permet aux membres de l'association de documenter les activités de l'association :
- [x] actualité
- [x] publications
- [x] auteurices
- [x] temps restant avant la fermeture des abonnements

# Lien Heroku 😺
https://lepoticha-874408a4e159.herokuapp.com/

# Frontend 😺
- [x] repo github : https://github.com/Sojabio/Poticha_front
- [x] en ligne : https://poticha-front.vercel.app/

# Quelques exemples de requêtes 

##Se connecter en tant qu'admin: 
POST on /users/sign_in  with payload :
```json
{
  "user": {
    "email": "admin@test.fr ",
    "password": "azerty"
  }
}
```

## index des auteurices, ouvrages, actus : 

- [x] GET on /authors
- [x] GET on /books
- [x] GET on /posts

## show d'une auteurice, ouvrage, actu : 

- [x] GET on /authors/:id
- [x] GET on /books/:id
- [x] GET on /posts/:id 

## création d'une auteurice : 
### POST on /authors with auth and payload : 
```json
{
  "author": {
      "first_name": "",
      "lat_name": "",
      "biography": "",
      "email": "",
      "image": "",
  }
}
```

## modification d'une auteurice : 
- [x] PATCH on /authors/:id with auth and same payload 

## suppression d'une auteurice, ouvrage, actu: 
- [x] DELETE on /authors/:id with auth
- [x] DELETE on /books/:id with auth
- [x] DELETE on /posts/:id with auth





