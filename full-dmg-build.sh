#!/bin/bash
set -e
PREVIOUSDIR=previous-code
VER=2.4
REV=1122
DATE=$(date +%Y%m%d)

if [ -z $PREVIOUSDIR ]
then
    echo "Using $PREVIOUSDIR..."
else
    echo "Checking out Previous..."
    svn checkout https://svn.code.sf.net/p/previous/code/trunk previous-code
    PREVIOUSDIR=$(find ./ -name previous-code)
fi

SDLGUIC=$(find $PREVIOUSDIR -name sdlgui.c)

if [ -z $SDLGUIC ]
then
    echo "Can't find sdlgui.c"
    exit 1

else
    echo "Tweaking SDL GUI..."

    echo "blackWhiteColors"
    sed -i bak 's/SDL_Color blackWhiteColors[2] = {{255, 255, 255, 0}, {0, 0, 0, 0}}\;/SDL_Color blackWhiteColors[2] = {{255, 255, 255, 255}, {0, 0, 0, 255}}\;/g' $SDLGUIC

    echo "grey"
    sed -i bak 's/Uint32 grey = SDL_MapRGB(pSdlGuiScrn->format,170,170,170);/Uint32 grey = SDL_MapRGB(pSdlGuiScrn->format,181,183,170);/g' $SDLGUIC

    echo "upleftc"
    sed -i bak 's/upleftc = SDL_MapRGB(pSdlGuiScrn->format,86,86,86);/upleftc = SDL_MapRGB(pSdlGuiScrn->format,147,145,170);/g' $SDLGUIC

    echo "downleftc"
    sed -i bak 's/downrightc = SDL_MapRGB(pSdlGuiScrn->format,0,0,0);/downrightc = SDL_MapRGB(pSdlGuiScrn->format,147,145,170);/g' $SDLGUIC

    echo "grey0"
    sed -i bak 's/SDL_MapRGB(pSdlGuiScrn->format,147,145,170)/SDL_MapRGB(pSdlGuiScrn->format,170,170,170)/g' $SDLGUIC

    echo "grey1"
    sed -i bak 's/Uint32 grey1 = SDL_MapRGB(pSdlGuiScrn->format,80,80,80);/Uint32 grey1 = SDL_MapRGB(pSdlGuiScrn->format,181,183,170);/g' $SDLGUIC

    echo "grey2"
    sed -i bak 's/Uint32 grey2 = SDL_MapRGB(pSdlGuiScrn->format, 0, 0, 0);/Uint32 grey2 = SDL_MapRGB(pSdlGuiScrn->format, 73, 72, 85);/g' $SDLGUIC

fi


echo "Using patched font.."
FONT=$(find $PREVIOUSDIR -name font10x16.h)

mv $FONT font10x16.h.old

cp fontstuff/font10x16.xbm $FONT

echo "Tweaked font Ohlfs AKA CERN mono."

echo "Building Mac app and DMG"

export LDFLAGS="-L/usr/local/opt/zlib/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include"
export LDFLAGS="-L/usr/local/opt/libpcap/lib"
export CPPFLAGS="-I/usr/local/opt/libpcap/include"
export LDFLAGS="-L/usr/local/opt/zlib/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include"
export LDFLAGS="-L/usr/local/opt/libpcap/lib"
export CPPFLAGS="-I/usr/local/opt/libpcap/include"


mkdir -p previous-code/build
cd previous-code/build
cmake ..

#Have a look at the manual of CMake for other options. Alternatively, you can
#use the "cmake-gui" program to configure the sources with a graphical
#application or "ccmake" to configure them with ncurses UI.

#Once CMake has successfully configured the build settings, you can compile
#Previous with:

cmake --build .

cp -aR src/Previous.app ../../

cd ../../

#echo "Installing appdmg..."
#brew install npm
#npm install -g appdmg


convert background-base.png -font Helvetica -pointsize 9 -fill red -annotate +10+10 "$REV" background.png

cp Previous.icns Previous.app/Contents/Resources/Previous.icns 

appdmg previous.appdmg.json Previous.$VER.r$REV.$DATE.dmg

open Previous.$VER.r$REV.$DATE.dmg
