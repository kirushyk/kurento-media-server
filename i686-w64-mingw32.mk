CXX=i686-w64-mingw32-g++
CC=i686-w64-mingw32-gcc
TARGET_DIR=./build/
TARGET=kurento.exe

CXXFLAGS=--std=gnu++17 -fpermissive

CFLAGS=-DKURENTO_MODULES_DIR="\".\"" \
-DBOOST_LOG_USE_NATIVE_SYSLOG \
-DWIN32_LEAN_AND_MEAN=1 \
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
-I../kms-core/src/server/interface/ \
-I../kms-core/src/server/implementation/ \
-I../kms-core/src/server/implementation/objects/ \
-I../kurento-media-server/server/transport/ \
-I../libevent/include/ \
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

LIBS=-L/usr/i686-w64-mingw32/sys-root/mingw/lib \
-L/usr/lib/gcc/i686-w64-mingw32/5.2.0 \
-L/usr/i686-w64-mingw32/lib/ \
-lgstreamer-1.0 \
-lgstsdp-1.0.dll \
-lglibmm-2.4 \
-lgobject-2.0 \
-lglib-2.0 \
-lintl \
-lsigc-2.0 \
/usr/i686-w64-mingw32/sys-root/mingw/lib/libboost_system-mt.a \
/usr/i686-w64-mingw32/sys-root/mingw/lib/libboost_log-mt.a \
/usr/i686-w64-mingw32/sys-root/mingw/lib/libboost_log_setup-mt.a \
/usr/i686-w64-mingw32/sys-root/mingw/lib/libboost_program_options-mt.a \
/usr/i686-w64-mingw32/sys-root/mingw/lib/libboost_filesystem-mt.a \
/usr/i686-w64-mingw32/sys-root/mingw/lib/libboost_thread-mt.a

CPP_SRC=./server/CacheEntry.cpp \
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
../kms-core/src/server/implementation/EventHandler.cpp \
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

C_SRC=../kms-core/src/gst-plugins/kmsdummysink.c \
../kms-core/src/gst-plugins/kmsagnosticbin3.c \
../kms-core/src/gst-plugins/kmsagnosticbin.c \
../kms-core/src/gst-plugins/kmsdummyduplex.c \
../kms-core/src/gst-plugins/vp8parse/vp8parse.c \
../kms-core/src/gst-plugins/vp8parse/kmsvp8parse.c \
../kms-core/src/gst-plugins/kmsfilterelement.c \
../kms-core/src/gst-plugins/kmsdummyuri.c \
../kms-core/src/gst-plugins/kmsdummysrc.c \
../kms-core/src/gst-plugins/kmsbitratefilter.c \
../kms-core/src/gst-plugins/kmsdummyrtp.c \
../kms-core/src/gst-plugins/kmsaudiomixer.c \
../kms-core/src/gst-plugins/kmsaudiomixerbin.c \
../kms-core/src/gst-plugins/kmsbufferinjector.c \
../kms-core/src/gst-plugins/kmsdummysdp.c \
../kms-core/src/gst-plugins/kmscore.c \
../kms-core/src/gst-plugins/kmspassthrough.c \
../kms-core/src/gst-plugins/commons/kmsrtcp.c \
../kms-core/src/gst-plugins/commons/kmshubport.c \
../kms-core/src/gst-plugins/commons/kmsbasesdpendpoint.c \
../kms-core/src/gst-plugins/commons/kmsenctreebin.c \
../kms-core/src/gst-plugins/commons/kmsbasertpsession.c \
../kms-core/src/gst-plugins/commons/kmsrecordingprofile.c \
../kms-core/src/gst-plugins/commons/kmsloop.c \
../kms-core/src/gst-plugins/commons/kmsuriendpoint.c \
../kms-core/src/gst-plugins/commons/kmsbufferlacentymeta.c \
../kms-core/src/gst-plugins/commons/kmstreebin.c \
../kms-core/src/gst-plugins/commons/kmsbasehub.c \
../kms-core/src/gst-plugins/commons/kmsremb.c \
../kms-core/src/gst-plugins/commons/kmsutils.c \
../kms-core/src/gst-plugins/commons/kmssdpsession.c \
../kms-core/src/gst-plugins/commons/kmsstats.c \
../kms-core/src/gst-plugins/commons/kmsirtpconnection.c \
../kms-core/src/gst-plugins/commons/kmsparsetreebin.c \
../kms-core/src/gst-plugins/commons/kmsdectreebin.c \
../kms-core/src/gst-plugins/commons/kmselement.c \
../kms-core/src/gst-plugins/commons/kmsrefstruct.c \
../kms-core/src/gst-plugins/commons/sdp_utils.c \
../kms-core/src/gst-plugins/commons/sdpagent/kmssdpmidext.c \
../kms-core/src/gst-plugins/commons/sdpagent/kmssdpgroupmanager.c \
../kms-core/src/gst-plugins/commons/sdpagent/kmssdpmediahandler.c \
../kms-core/src/gst-plugins/commons/sdpagent/kmssdpagent.c \
../kms-core/src/gst-plugins/commons/sdpagent/kmssdpcontext.c \
../kms-core/src/gst-plugins/commons/sdpagent/kmsisdpmediaextension.c \
../kms-core/src/gst-plugins/commons/sdpagent/kmssdpagentcommon.c \
../kms-core/src/gst-plugins/commons/sdpagent/kmssdpbundlegroup.c \
../kms-core/src/gst-plugins/commons/sdpagent/kmssdprtpsavpmediahandler.c \
../kms-core/src/gst-plugins/commons/sdpagent/kmssdprtpmediahandler.c \
../kms-core/src/gst-plugins/commons/sdpagent/kmssdpbasegroup.c \
../kms-core/src/gst-plugins/commons/sdpagent/kmssdprtpsavpfmediahandler.c \
../kms-core/src/gst-plugins/commons/sdpagent/kmsisdpsessionextension.c \
../kms-core/src/gst-plugins/commons/sdpagent/kmssdprtpavpfmediahandler.c \
../kms-core/src/gst-plugins/commons/sdpagent/kmssdppayloadmanager.c \
../kms-core/src/gst-plugins/commons/sdpagent/kmssdpsctpmediahandler.c \
../kms-core/src/gst-plugins/commons/sdpagent/kmssdprtpavpmediahandler.c \
../kms-core/src/gst-plugins/commons/sdpagent/kmssdpsdesext.c \
../kms-core/src/gst-plugins/commons/sdpagent/kmsisdppayloadmanager.c \
../kms-core/src/gst-plugins/commons/sdpagent/kmssdprejectmediahandler.c \
../kms-core/src/gst-plugins/commons/kmsirtpsessionmanager.c \
../kms-core/src/gst-plugins/commons/kmslist.c \
../kms-core/src/gst-plugins/commons/kmsserializablemeta.c \
../kms-core/src/gst-plugins/commons/kmsbasertpendpoint.c

OBJS=$(CPP_SRC:.cpp=.o)
#OBJS += $(C_SRC:.c=.o)

%.o : %.c
	$(CC) -c $(CFLAGS) -o $@ $<

%.o : %.cpp
	$(CXX) -c $(CFLAGS) $(CXXFLAGS) -o $@ $<

all: $(OBJS)
	mkdir -p $(TARGET_DIR)
	$(CXX) -o $(TARGET_DIR)/$(TARGET) $(OBJS) $(LIBS)

.PHONY: clean
clean:
	rm $(OBJS)
	rm $(TARGET_DIR)/$(TARGET)

