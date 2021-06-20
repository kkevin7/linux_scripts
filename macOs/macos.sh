#Habilitar instalar instalaciones de aplicaciones de Internet
sudo spctl --master-disable

#Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew update
export PATH="/usr/local/bin:$PATH"

#Ruby
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install ruby
echo 'export PATH="/usr/local/opt/ruby/bin:$PATH"' >> ~/.bash_profile
source ~/.bash_profile

#Google chrome
brew install google-chrome

#NodeJS
brew install node

#Yarn
brew install yarn

#VLC Player
brew install vlc

#Visual Studio Code
brew install visual-studio-code

#Sublime Text
brew install sublime-text

#Watchman
brew install watchman

#Cocoapods
sudo gem install cocoapods
#sudo gem install -n /usr/local/bin cocoapods -v 1.8.4

#React Native
npm install -g react-native-cli
npm install -g react-devtools

#Java JRE and JDK
brew tap AdoptOpenJDK/openjdk
brew install --cask adoptopenjdk/openjdk/adoptopenjdk8

#Android Studio
brew install --cask android-studio
