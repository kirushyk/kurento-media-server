CXX=i686-w64-mingw32-g++
TARGET_DIR=win32
TARGET=$(TARGET_DIR)/kurento.exe

CXXFLAGS=--std=gnu++17

CFLAGS=-DBOOST_LOG_USE_NATIVE_SYSLOG -DWIN32_LEAN_AND_MEAN=1 -Dushort="unsigned short" -Duint="unsigned" -mms-bitfields -I. -I/usr/i686-w64-mingw32/sys-root/mingw/include/gstreamer-1.0 -I/usr/i686-w64-mingw32/sys-root/mingw/lib/gstreamer-1.0/include -I/usr/i686-w64-mingw32/sys-root/mingw/include/glibmm-2.4 -I/usr/i686-w64-mingw32/sys-root/mingw/lib/glibmm-2.4/include -I/usr/i686-w64-mingw32/sys-root/mingw/include/glib-2.0 -I/usr/i686-w64-mingw32/sys-root/mingw/lib/glib-2.0/include -I/usr/i686-w64-mingw32/sys-root/mingw/include/sigc++-2.0 -I/usr/i686-w64-mingw32/sys-root/mingw/lib/sigc++-2.0/include -I../kms-jsonrpc/src/ -I../kms-jsonrpc/src/jsonrpc/ -I../jsoncpp/include/ -I../kms-core/src/server/interface/ -I../kms-core/src/server/implementation/ -I../kms-core/src/server/implementation/objects/ -I../kurento-media-server/server/transport/ -I../libevent/include/ -I./win32/ -I./server/ -I./server/transport/websocket/ \
-Iwin32/ \
-Iwin32/modules \
-Iwin32/modules/core \
-Iwin32/modules/elements \
-Iwin32/modules/filters \
-Iwin32/jsonrpc \
-Iwin32/webrtcendpoint \
-Iwin32/commons \
-Iwin32/commons/sdpagent

LIBS=-L/usr/i686-w64-mingw32/sys-root/mingw/lib -lgstreamer-1.0 -lglibmm-2.4 -lgobject-2.0 -lglib-2.0 -lintl -lsigc-2.0 -lboost_system-mt -lboost_log-mt -lboost_program_options-mt

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
../jsoncpp/src/lib_json/json_writer.cpp \
\
../kms-core/src/server/implementation/DotGraph.cpp \
../kms-core/src/server/implementation/RegisterParent.cpp \
../kms-core/src/server/implementation/objects/ServerManagerImpl.cpp \
../kms-core/src/server/implementation/objects/PassThroughImpl.cpp \
../kms-core/src/server/implementation/objects/HubImpl.cpp \
../kms-core/src/server/implementation/objects/MediaPipelineImpl.cpp \
../kms-core/src/server/implementation/objects/MediaPadImpl.cpp \
../kms-core/src/server/implementation/objects/SessionEndpointImpl.cpp \
../kms-core/src/server/implementation/objects/SdpEndpointImpl.cpp \
../kms-core/src/server/implementation/objects/HubPortImpl.cpp \
../kms-core/src/server/implementation/objects/MediaElementImpl.cpp \
../kms-core/src/server/implementation/objects/FilterImpl.cpp \
../kms-core/src/server/implementation/objects/UriEndpointImpl.cpp \
../kms-core/src/server/implementation/objects/MediaObjectImpl.cpp \
../kms-core/src/server/implementation/objects/BaseRtpEndpointImpl.cpp \
../kms-core/src/server/implementation/objects/EndpointImpl.cpp \
../kms-core/src/server/implementation/MediaSet.cpp \
../kms-core/src/server/implementation/Factory.cpp \
../kms-core/src/server/implementation/ModuleManager.cpp \
../kms-core/src/server/implementation/WorkerPool.cpp \
../kms-core/src/server/implementation/UUIDGenerator.cpp \
../kms-core/src/server/implementation/EventHandler.cpp

all:
	mkdir -p $(TARGET_DIR)
	$(CXX) -o $(TARGET_DIR)/kurento.exe $(CFLAGS) $(CXXFLAGS) $(SRC) $(LIBS)

