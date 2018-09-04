#!/bin/bash
mkdir -p ~/tmp
mkdir -p ~/.fonts
pushd ~/tmp
sudo apt-get install fontforge
wget http://levien.com/type/myfonts/Inconsolata.otf
wget http://iij.dl.sourceforge.jp/mix-mplus-ipa/59022/migu-1m-20130617.zip
unzip migu-1m-20130617.zip
git clone https://github.com/yascentur/Ricty.git
pushd Ricty
./ricty_generator.sh ~/tmp/Inconsolata.otf ~/tmp/migu-1m-20130617/migu-1m-regular.ttf ~/tmp/migu-1m-20130617/migu-1m-bold.ttf
mv Ricty*.ttf ~/.fonts
popd
git clone https://github.com/Lokaltog/vim-powerline.git
fontforge -lang=py -script ./vim-powerline/fontpatcher/fontpatcher $HOME/.fonts/Ricty-Regular.ttf
fontforge -lang=py -script ./vim-powerline/fontpatcher/fontpatcher $HOME/.fonts/Ricty-Bold.ttf
mv Ricty-Regular-Powerline.ttf ~/.fonts
mv Ricty-Bold-Powerline.ttf ~/.fonts
popd
fc-cache -vf
