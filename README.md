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
│   ├── img_001.jpg
│   ├── img_002.jpg
│   ├── ...
│   ...
├── galerie2
│   ├── img_001.jpg
│   ├── img_002.jpg
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


Ce que fait gen_list.sh
=======================

Lorsque l'on lance gen_list.sh, il génaire plusieurs fichiers :
- 1 fichier liste_nb.txt se trouvant dans le dossier courant
- 1 ou plusieurs fichier liste_{N}.txt se trouvant dans les dossiers des galeries.
- Si des miniatures doivent être générés, dans chaque dossier de galerie sont créé les dossiers 200x et x200


Structure de liste_nb.txt
=========================

```
[
['./{NOM_DE_LA_GALERIE}/',{NOMBRE_DE_FICHIER_LISTE},{NOMBRE_D'IMAGE_+1},'[200x]','[X200]'],
...
false]
```

Exemple si utilisation de miniatures :
```
[
['./galerie1/',2,123,'200x','X200'],
['./galerie2/',1,42,'200x','X200'],
false]
```

Exemple sans l'utilisation de miniatures :
```
[
['./galerie1/',2,123,'',''],
['./galerie2/',1,42,'',''],
false]
```


Structure de liste_{N}.txt
==========================
Il y a 1 fichier liste_{N}.txt de créé par tranche de 100 images.

liste_1.txt

```
[
'{IMG_1}',
...
'{IMG_100}',
true]
```

le dernier liste_{N}.txt
```
[
'{IMG_101}',
...
'{IMG_N}',
false]
```

Exemple :
./galerie1/liste_1.txt

```
[
'img_001.jpg',
'img_002.jpg',
...
'img_100.jpg',
true]
```
./galerie1/liste_2.txt

```
[
'img_101.jpg',
'img_102.jpg',
...
'img_122.jpg',
false]
```
./galerie2/liste_1.txt

```
[
'img_001.jpg',
'img_002.jpg',
...
'img_041.jpg',
false]
```


Infos
=====

Développé avec Firefox sous GNU/Linux.  
Si vous testez la galerie, surveillez l'utilisation de la RAM.  
si votre navigateur à des fuites de mémoire, ça peut faire très mal !
