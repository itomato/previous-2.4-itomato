PREVIOUSDIR=previous-code

if [ -z $PREVIOUSDIR ]
then
    echo "Using $PREVIOUSDIR..."
else
    echo "Checking out Previous..."
    svn checkout https://svn.code.sf.net/p/previous/code/trunk previous-code
    PREVIOUSDIR=$(find ./ -name previous-code)
    
fi

export LDFLAGS="-L/usr/local/opt/zlib/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include"
export LDFLAGS="-L/usr/local/opt/libpcap/lib"
export CPPFLAGS="-I/usr/local/opt/libpcap/include"
export LDFLAGS="-L/usr/local/opt/zlib/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include"
export LDFLAGS="-L/usr/local/opt/libpcap/lib"
export CPPFLAGS="-I/usr/local/opt/libpcap/include"

# tweak font
sh tweak.sh

mkdir -p previous-code/build
cd previous-code/build
cmake ..

#Have a look at the manual of CMake for other options. Alternatively, you can
#use the "cmake-gui" program to configure the sources with a graphical
#application or "ccmake" to configure them with ncurses UI.

#Once CMake has successfully configured the build settings, you can compile
#Previous with:

cmake --build .
