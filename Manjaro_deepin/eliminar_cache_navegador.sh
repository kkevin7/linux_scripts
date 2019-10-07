#Eliminar la cache de Firefox
rm ~/.mozilla/firefox/*.default/cookies.sqlite
rm ~/.mozilla/firefox/*.default/*.sqlite ~/.mozilla/firefox/*default/sessionstore.js
rm -r ~/.cache/mozilla/firefox/*.default/*

#Eliminar la cache de google chrome
#rm -r ~/.config/google-chrome/Default/
#rm -r ~/.cache/google-chrome/