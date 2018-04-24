call "%VS140COMNTOOLS%..\..\vc\vcvarsall.bat" amd64

if not exist targets (
mkdir targets
curl https://nodejs.org/dist/v6.14.1/node-v6.14.1-headers.tar.gz | tar xz -C targets
curl https://nodejs.org/dist/v6.14.1/win-x64/node.lib > targets/node-v6.14.1/node.lib
curl https://nodejs.org/dist/v7.10.1/node-v7.10.1-headers.tar.gz | tar xz -C targets
curl https://nodejs.org/dist/v7.10.1/win-x64/node.lib > targets/node-v7.10.1/node.lib
curl https://nodejs.org/dist/v8.11.1/node-v8.11.1-headers.tar.gz | tar xz -C targets
curl https://nodejs.org/dist/v8.11.1/win-x64/node.lib > targets/node-v8.11.1/node.lib
curl https://nodejs.org/dist/v9.10.1/node-v9.10.1-headers.tar.gz | tar xz -C targets
curl https://nodejs.org/dist/v9.10.1/win-x64/node.lib > targets/node-v9.10.1/node.lib
curl https://nodejs.org/dist/v10.0.0/node-v10.0.0-headers.tar.gz | tar xz -C targets
curl https://nodejs.org/dist/v10.0.0/win-x64/node.lib > targets/node-v10.0.0/node.lib
)

cp README.md dist/README.md
cp ../uWebSockets/LICENSE dist/LICENSE
cp -r ../uWebSockets/src dist/
cp src/addon.cpp dist/src/addon.cpp
cp src/addon.h dist/src/addon.h
cp src/http.h dist/src/http.h

cl /I targets/node-v6.14.1/include/node /EHsc /Ox /LD /Fedist/uws_win32_48.node dist/src/*.cpp targets/node-v6.14.1/node.lib
cl /I targets/node-v7.10.1/include/node /EHsc /Ox /LD /Fedist/uws_win32_51.node dist/src/*.cpp targets/node-v7.10.1/node.lib
cl /I targets/node-v8.11.1/include/node /EHsc /Ox /LD /Fedist/uws_win32_57.node dist/src/*.cpp targets/node-v8.11.1/node.lib
cl /I targets/node-v9.10.1/include/node /EHsc /Ox /LD /Fedist/uws_win32_59.node dist/src/*.cpp targets/node-v9.10.1/node.lib
cl /I targets/node-v10.0.0/include/node /EHsc /Ox /LD /Fedist/uws_win32_64.node dist/src/*.cpp targets/node-v10.0.0/node.lib

rm *.obj
rm dist/*.exp
rm dist/*.lib
rm -rf dist/src
rm -rf targets