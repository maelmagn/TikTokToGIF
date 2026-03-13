# TikTok to GIF Converter

Script Bash pour macOS permettant de télécharger des vidéos TikTok et de les convertir en GIF haute qualité localement.

## Prérequis

Le script nécessite l'installation des outils suivants via Homebrew :

* yt-dlp : Extraction de la vidéo.
* FFmpeg : Découpage et ré-encodage technique.
* gifski : Conversion haute fidélité vers le format GIF.

### Installation des dépendances

brew install yt-dlp ffmpeg gifski

## Utilisation

1. Rendre le script exécutable :
chmod +x tiktoktoGIF.sh

2. Syntaxe de la commande :
./tiktoktoGIF.sh "URL" "nom_de_sortie.gif" [TEMPS_DE_DEBUT] [TEMPS_DE_FIN]

### Exemples

Conversion de la vidéo complète :
./tiktoktoGIF.sh "https://www.tiktok.com/@user/video/123" sortie.gif

Conversion d'un segment spécifique (de 2s à 5s) :
./tiktoktoGIF.sh "https://www.tiktok.com/@user/video/123" sortie.gif 00:00:02 00:00:05

## Paramètres de conversion

Le script applique par défaut les réglages suivants pour assurer la compatibilité avec Discord (limite de 25 Mo) :
* Largeur : 600px
* FPS : 20
* Qualité : 80%
* Boucle : Infinie (repeat 0)

## Maintenance

En cas d'échec du téléchargement, mettre à jour l'extracteur :
brew upgrade yt-dlp
