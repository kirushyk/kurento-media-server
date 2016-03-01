CXX=i686-w64-mingw32-g++
CC=i686-w64-mingw32-gcc
TARGET_DIR=./build/
TARGET=kurento-media-server.exe

CXXFLAGS=--std=gnu++17 -fpermissive

CFLAGS= \
-DKURENTO_MODULES_DIR="\".\"" \
-DBOOST_LOG_USE_NATIVE_SYSLOG \
-DWIN32_LEAN_AND_MEAN=1 \
-DPACKAGE="\"kurento\"" \
-DVERSION="\"6.4.0\"" \
-Dushort="unsigned short" \
-Duint="unsigned" \
-mms-bitfields \
\
-I. \
-I/usr/i686-w64-mingw32/sys-root/mingw/include/gstreamer-1.0 \
-I/usr/i686-w64-mingw32/sys-root/mingw/lib/gstreamer-1.0/include \
-I/usr/i686-w64-mingw32/sys-root/mingw/include/glibmm-2.4 \
-I/usr/i686-w64-mingw32/sys-root/mingw/lib/glibmm-2.4/include \
-I/usr/i686-w64-mingw32/sys-root/mingw/include/glib-2.0 \
-I/usr/i686-w64-mingw32/sys-root/mingw/lib/glib-2.0/include \
-I/usr/i686-w64-mingw32/sys-root/mingw/include/sigc++-2.0 \
-I/usr/i686-w64-mingw32/sys-root/mingw/lib/sigc++-2.0/include \
-I../kms-jsonrpc/src/ \
-I../kms-jsonrpc/src/jsonrpc/ \
-I../jsoncpp/include/ \
-I../kurento-media-server/server/transport/ \
-I../libevent/include/ \
-I../libvpx/ \
-I./win32/ \
-I./server/ \
-I./server/transport/websocket/ \
-I./win32/ \
-I./win32/modules \
-I./win32/modules/core \
-I./win32/modules/elements \
-I./win32/modules/filters \
-I./win32/jsonrpc \
-I./win32/webrtcendpoint \
-I./win32/commons \
-I./win32/commons/sdpagent \
-I./win32/interface/generated-cpp \
-I./win32/implementation/generated-cpp

LIBS= \
-L/usr/i686-w64-mingw32/sys-root/mingw/lib \
-L/usr/lib/gcc/i686-w64-mingw32/5.2.0 \
-L/usr/i686-w64-mingw32/lib/ \
-L../kms-jsonrpc/build/ \
-L../jsoncpp/build/ \
-L../kms-core/build/ \
-lkmsjsoncpp.dll \
-lkmsjsonrpc.dll \
-lkmscoreimpl.dll \
-lkmsgstcommons.dll \
-lkmssdpagent.dll \
-lgstreamer-1.0 \
-lgstsdp-1.0.dll \
-lglibmm-2.4 \
-lgobject-2.0 \
-lglib-2.0 \
-lintl \
-lsigc-2.0 \
-lws2_32 \
-lmswsock \
-lssl.dll \
-lcrypto.dll \
-lrpcrt4 \
-lole32 \
-lboost_system-mt \
-lboost_log-mt \
-lboost_log_setup-mt \
-lboost_program_options-mt \
-lboost_filesystem-mt \
-lboost_thread-mt

CPP_SRC= \
./server/CacheEntry.cpp \
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
./win32/implementation/generated-cpp/SessionEndpointImplInternal.cpp \
./win32/implementation/generated-cpp/MediaElementImplInternal.cpp \
./win32/implementation/generated-cpp/MediaPipelineImplInternal.cpp \
./win32/implementation/generated-cpp/UriEndpointImplInternal.cpp \
./win32/implementation/generated-cpp/SdpEndpointImplInternal.cpp \
./win32/implementation/generated-cpp/HubPortImplInternal.cpp \
./win32/implementation/generated-cpp/HubImplInternal.cpp \
./win32/implementation/generated-cpp/SerializerExpanderCore.cpp \
./win32/implementation/generated-cpp/EndpointImplInternal.cpp \
./win32/implementation/generated-cpp/FilterImplInternal.cpp \
./win32/implementation/generated-cpp/PassThroughImplInternal.cpp \
./win32/implementation/generated-cpp/ServerManagerImplInternal.cpp \
./win32/implementation/generated-cpp/MediaObjectImplInternal.cpp \
./win32/implementation/generated-cpp/BaseRtpEndpointImplInternal.cpp \
./win32/implementation/generated-cpp/Module.cpp \
./win32/interface/generated-cpp/RTCStatsIceCandidatePairState.cpp \
./win32/interface/generated-cpp/RTCTransportStats.cpp \
./win32/interface/generated-cpp/RaiseBase.cpp \
./win32/interface/generated-cpp/ObjectDestroyed.cpp \
./win32/interface/generated-cpp/Error.cpp \
./win32/interface/generated-cpp/ElementDisconnected.cpp \
./win32/interface/generated-cpp/SdpEndpointInternal.cpp \
./win32/interface/generated-cpp/EndpointInternal.cpp \
./win32/interface/generated-cpp/CodecConfiguration.cpp \
./win32/interface/generated-cpp/Hub.cpp \
./win32/interface/generated-cpp/RTCInboundRTPStreamStats.cpp \
./win32/interface/generated-cpp/HubInternal.cpp \
./win32/interface/generated-cpp/ElementStats.cpp \
./win32/interface/generated-cpp/UriEndpoint.cpp \
./win32/interface/generated-cpp/ModuleInfo.cpp \
./win32/interface/generated-cpp/RTCStats.cpp \
./win32/interface/generated-cpp/Filter.cpp \
./win32/interface/generated-cpp/MediaState.cpp \
./win32/interface/generated-cpp/RTCMediaStreamStats.cpp \
./win32/interface/generated-cpp/MediaPipeline.cpp \
./win32/interface/generated-cpp/EndpointStats.cpp \
./win32/interface/generated-cpp/ConnectionStateChanged.cpp \
./win32/interface/generated-cpp/RTCRTPStreamStats.cpp \
./win32/interface/generated-cpp/RTCDataChannelState.cpp \
./win32/interface/generated-cpp/MediaElementInternal.cpp \
./win32/interface/generated-cpp/MediaStateChanged.cpp \
./win32/interface/generated-cpp/ElementConnectionData.cpp \
./win32/interface/generated-cpp/MediaFlowInStateChange.cpp \
./win32/interface/generated-cpp/MediaObject.cpp \
./win32/interface/generated-cpp/ObjectCreated.cpp \
./win32/interface/generated-cpp/SessionEndpoint.cpp \
./win32/interface/generated-cpp/AudioCaps.cpp \
./win32/interface/generated-cpp/RTCIceCandidatePairStats.cpp \
./win32/interface/generated-cpp/RTCMediaStreamTrackStats.cpp \
./win32/interface/generated-cpp/MediaSessionTerminated.cpp \
./win32/interface/generated-cpp/ServerManager.cpp \
./win32/interface/generated-cpp/SessionEndpointInternal.cpp \
./win32/interface/generated-cpp/Media.cpp \
./win32/interface/generated-cpp/ServerInfo.cpp \
./win32/interface/generated-cpp/BaseRtpEndpointInternal.cpp \
./win32/interface/generated-cpp/RTCIceCandidateAttributes.cpp \
./win32/interface/generated-cpp/Endpoint.cpp \
./win32/interface/generated-cpp/MediaFlowOutStateChange.cpp \
./win32/interface/generated-cpp/PassThroughInternal.cpp \
./win32/interface/generated-cpp/MediaObjectInternal.cpp \
./win32/interface/generated-cpp/MediaElement.cpp \
./win32/interface/generated-cpp/RTCCertificateStats.cpp \
./win32/interface/generated-cpp/StatsType.cpp \
./win32/interface/generated-cpp/Stats.cpp \
./win32/interface/generated-cpp/RTCCodec.cpp \
./win32/interface/generated-cpp/PassThrough.cpp \
./win32/interface/generated-cpp/RTCPeerConnectionStats.cpp \
./win32/interface/generated-cpp/AudioCodec.cpp \
./win32/interface/generated-cpp/HubPortInternal.cpp \
./win32/interface/generated-cpp/Tag.cpp \
./win32/interface/generated-cpp/FilterType.cpp \
./win32/interface/generated-cpp/MediaType.cpp \
./win32/interface/generated-cpp/FilterInternal.cpp \
./win32/interface/generated-cpp/UriEndpointInternal.cpp \
./win32/interface/generated-cpp/MediaLatencyStat.cpp \
./win32/interface/generated-cpp/SdpEndpoint.cpp \
./win32/interface/generated-cpp/VideoCodec.cpp \
./win32/interface/generated-cpp/RTCStatsIceCandidateType.cpp \
./win32/interface/generated-cpp/RembParams.cpp \
./win32/interface/generated-cpp/MediaPipelineInternal.cpp \
./win32/interface/generated-cpp/Fraction.cpp \
./win32/interface/generated-cpp/RTCDataChannelStats.cpp \
./win32/interface/generated-cpp/ServerType.cpp \
./win32/interface/generated-cpp/RTCOutboundRTPStreamStats.cpp \
./win32/interface/generated-cpp/HubPort.cpp \
./win32/interface/generated-cpp/MediaFlowState.cpp \
./win32/interface/generated-cpp/GstreamerDotDetails.cpp \
./win32/interface/generated-cpp/ConnectionState.cpp \
./win32/interface/generated-cpp/ElementConnected.cpp \
./win32/interface/generated-cpp/ServerManagerInternal.cpp \
./win32/interface/generated-cpp/VideoCaps.cpp \
./win32/interface/generated-cpp/BaseRtpEndpoint.cpp \
./win32/interface/generated-cpp/MediaSessionStarted.cpp

OBJS=$(CPP_SRC:.cpp=.o)

%.o: %.cpp
	$(CXX) -c $(CFLAGS) $(CXXFLAGS) -o $@ $<

all: $(OBJS)
	mkdir -p $(TARGET_DIR)
	$(CXX) -o $(TARGET_DIR)/$(TARGET) $(OBJS) $(LIBS)

.PHONY: clean
clean:
	rm $(OBJS)
	rm $(TARGET_DIR)/$(TARGET)

