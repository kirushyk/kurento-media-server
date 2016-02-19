CXX=i686-w64-mingw32-g++
TARGET_DIR=win32
TARGET=$(TARGET_DIR)/kurento.exe

CXXFLAGS=--std=gnu++17

CFLAGS=-DWIN32_LEAN_AND_MEAN=1 -Dushort="unsigned short" -Duint="unsigned" -mms-bitfields -I. -I/usr/i686-w64-mingw32/sys-root/mingw/include/gstreamer-1.0 -I/usr/i686-w64-mingw32/sys-root/mingw/lib/gstreamer-1.0/include -I/usr/i686-w64-mingw32/sys-root/mingw/include/glibmm-2.4 -I/usr/i686-w64-mingw32/sys-root/mingw/lib/glibmm-2.4/include -I/usr/i686-w64-mingw32/sys-root/mingw/include/glib-2.0 -I/usr/i686-w64-mingw32/sys-root/mingw/lib/glib-2.0/include -I/usr/i686-w64-mingw32/sys-root/mingw/include/sigc++-2.0 -I/usr/i686-w64-mingw32/sys-root/mingw/lib/sigc++-2.0/include -I../kms-jsonrpc/src/ -I../kms-jsonrpc/src/jsonrpc/ -I../jsoncpp/include/ -I../kms-core/src/server/interface/ -I../kms-core/src/server/implementation/ -I../kms-core/src/server/implementation/objects/ -I../kurento-media-server/server/transport/ -I../libevent/include/ -I./win32/ -I./server/ -I./server/transport/websocket/

LIBS=-L/usr/i686-w64-mingw32/sys-root/mingw/lib -lgstreamer-1.0 -lglibmm-2.4 -lgobject-2.0 -lglib-2.0 -lintl -lsigc-2.0

SRC=./server/CacheEntry.cpp \
./server/transport/TransportFactory.cpp \
./server/transport/websocket/WebSocketTransport.cpp \
./server/transport/websocket/WebSocketRegistrar.cpp \
./server/transport/websocket/WebSocketEventHandler.cpp \
./server/transport/websocket/WebSocketTransportFactory.cpp \
./server/death_handler.cpp \
./server/ResourceManager.cpp \
./server/version.cpp \
./server/RequestCache.cpp \
./server/loadConfig.cpp \
./server/logging.cpp \
./server/main.cpp \
./server/ServerMethods.cpp \
./server/modules.cpp \
\
../kms-jsonrpc/src/JsonFixes.cpp \
../kms-jsonrpc/src/JsonRpcHandler.cpp \
../kms-jsonrpc/src/JsonRpcClient.cpp \
../kms-jsonrpc/src/JsonRpcUtils.cpp \
\
../jsoncpp/src/lib_json/json_value.cpp \
../jsoncpp/src/lib_json/json_reader.cpp \
../jsoncpp/src/lib_json/json_writer.cpp

all:
	mkdir -p $(TARGET_DIR)
	$(CXX) -o $(TARGET_DIR)/kurento.exe $(CFLAGS) $(CXXFLAGS) $(SRC) $(LIBS)

