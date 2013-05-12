js_galerie
==========

Galerie photo en Javascript qui tient dans un unique fichier HTML.
Créé pour visualiser en local ou via Internet des galeries comportant des milliers de photos.

Exemple d'utilisation https://ecirtam.net/galerie/

Structure des dossiers à avoir
==============================
```
.
├── galerie1
│   ├── img_01.jpg
│   ├── img_02.jpg
│   ├── ...
│   ...
├── galerie2
│   ├── img_01.jpg
│   ├── img_02.jpg
│   ...
├── ...
│   ├── ...
│   ...
├── gen_list.sh
└── index.html
```

- index.html : la galerie photo
- gen_list.sh : script permettant de créer le listing des photos à afficher

Initialiser la galerie
======================

Executer gen_list.sh
```sh
chmod +x gen_list.sh
./gen_list.sh
```
Ouverez index.html avec un navigateur web et parcourez les photos.


Infos
=====

Développé avec Firefox sous GNU/Linux.
Si vous testez la galerie, surveillez l'utilisation de la RAM.
si votre navigateur à des fuites de mémoire, ça peut faire très mal !
