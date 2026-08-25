// [Start header_file]
#include "napi/native_api.h"
#include <cstdint>
#include <cstring>
#include <string>
#include <vector>
#include <map>
#include <algorithm>
#include <arpa/inet.h>
#include "hilog/log.h"
#include "network/netmanager_ext/net_trafficfilter.h"
// [End header_file]

using namespace std;
// [Start create_packet_controller]
constexpr int BUFFER_SIZE = 128;
constexpr int GLOBAL_NETSTACK = 0xFF00;
constexpr int IP_ADDR_BUF_LEN = 16;
constexpr int IPV4_ADDR_LEN = 4;
constexpr int MAX_STR_ARRAY_LEN = 46;
constexpr uint32_t DEFAULT_GROUP_ID = 1001;
constexpr uint32_t DEFAULT_PRIORITY = 100;
constexpr uint32_t DEFAULT_PACKET_COPY_LEN = 0xFFFF;
constexpr uint32_t DEFAULT_NFQUEUE_MAXLEN = 1024;
constexpr uint32_t DEFAULT_NFQUEUE_FLAGS = 1;
constexpr uint32_t DEFAULT_PACKET_COPY_MODE = 2;
constexpr int PORT_MIN_VALUE = 0;
constexpr int PORT_MAX_VALUE = 65535;
constexpr int MAX_PORT_MULTI_COUNT = 16;
constexpr int MAX_IP_MULTI_COUNT = 8;
constexpr int32_t ERR_CONTROLLER_NOT_FOUND = 29410101;
constexpr int DUMMY_CALLBACK_ARG = 23;

// Argument indices for CreatePacketControllerNapi
constexpr int PACKET_CTRL_ARG_IDX_GROUP_ID = 0;
constexpr int PACKET_CTRL_ARG_IDX_PRIORITY = 1;
constexpr int PACKET_CTRL_ARG_IDX_PACKET_COPY_LEN = 2;
constexpr int PACKET_CTRL_ARG_IDX_NFQUEUE_MAXLEN = 3;
constexpr int PACKET_CTRL_ARG_IDX_NFQUEUE_FLAGS = 4;
constexpr int PACKET_CTRL_ARG_IDX_PACKET_COPY_MODE = 5;

constexpr int HOOK_INPUT_VALUE = 0;
constexpr int HOOK_OUTPUT_VALUE = 1;
constexpr int HOOK_FORWARD_VALUE = 2;
constexpr int HOOK_PREROUTING_VALUE = 3;
constexpr int HOOK_POSTROUTING_VALUE = 4;

constexpr int ARG_IDX_JS_CALLBACK = 2;
constexpr int ARG_IDX_RULE_CONFIG = 2;

constexpr size_t MAX_PORT_STRING_LEN = 1024;

map<int, OH_TrafficFilter_PacketController*> g_controllerMap;
int g_controllerId = 1;

static const char *TAG = "[packet]";

napi_threadsafe_function tsFn;
static int g_value = 0;

struct PacketCallbackCtx {
    napi_env env;
    napi_ref jsCallbackRef;
    const OH_TrafficFilter_PacketDesc* packet;
};

auto g_asyncContext = new PacketCallbackCtx();

static napi_value CreatePacketControllerNapi(napi_env env, napi_callback_info info)
{
    size_t argc = PACKET_CTRL_ARG_IDX_PACKET_COPY_MODE + 1;
    napi_value args[PACKET_CTRL_ARG_IDX_PACKET_COPY_MODE + 1] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    uint32_t groupId = DEFAULT_GROUP_ID;
    uint32_t priority = DEFAULT_PRIORITY;
    uint32_t packetCopyLen = DEFAULT_PACKET_COPY_LEN;
    uint32_t nfqueueMaxlen = DEFAULT_NFQUEUE_MAXLEN;
    uint32_t nfqueueFlags = DEFAULT_NFQUEUE_FLAGS;
    uint32_t packetCopyMode = DEFAULT_PACKET_COPY_MODE;

    if (argc > PACKET_CTRL_ARG_IDX_GROUP_ID) {
        napi_get_value_uint32(env, args[PACKET_CTRL_ARG_IDX_GROUP_ID], &groupId);
    }
    if (argc > PACKET_CTRL_ARG_IDX_PRIORITY) {
        napi_get_value_uint32(env, args[PACKET_CTRL_ARG_IDX_PRIORITY], &priority);
    }
    if (argc > PACKET_CTRL_ARG_IDX_PACKET_COPY_LEN) {
        napi_get_value_uint32(env, args[PACKET_CTRL_ARG_IDX_PACKET_COPY_LEN], &packetCopyLen);
    }
    if (argc > PACKET_CTRL_ARG_IDX_NFQUEUE_MAXLEN) {
        napi_get_value_uint32(env, args[PACKET_CTRL_ARG_IDX_NFQUEUE_MAXLEN], &nfqueueMaxlen);
    }
    if (argc > PACKET_CTRL_ARG_IDX_PACKET_COPY_MODE) {
        napi_get_value_uint32(env, args[PACKET_CTRL_ARG_IDX_PACKET_COPY_MODE], &packetCopyMode);
    }

    OH_TrafficFilter_Config config;
    config.size = sizeof(OH_TrafficFilter_Config);
    config.packetCopyLen = packetCopyLen;
    config.nfqueueMaxlen = nfqueueMaxlen;
    config.nfqueueFlags = nfqueueFlags;
    config.packetCopyMode = packetCopyMode;

    OH_TrafficFilter_PacketController* controller = nullptr;
    int32_t ret = OH_TrafficFilter_CreatePacketController(groupId, priority, &config, &controller);
// [StartExclude create_packet_controller]
    OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG,
                 "CreatePacketControllerNapi ret: %{public}d", ret);
// [EndExclude create_packet_controller]

    g_controllerMap[g_controllerId] = controller;

    napi_value resultObj;
    napi_create_object(env, &resultObj);

    napi_value retValue;
    napi_create_int32(env, ret, &retValue);
    napi_set_named_property(env, resultObj, "ret", retValue);

    napi_value id;
    napi_create_int32(env, g_controllerId, &id);
    napi_set_named_property(env, resultObj, "id", id);

    g_controllerId++;

    return resultObj;
}
// [End create_packet_controller]

// [Start destroy_packet_controller]
static napi_value DestroyPacketControllerNapi(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    uint32_t id;
    if (argc >= 1) {
        napi_get_value_uint32(env, args[0], &id);
    }

    int ret = -1;
    OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG,
                 "DestroyPacketControllerNapi id: %{public}d", id);

    OH_TrafficFilter_PacketController* controller = g_controllerMap[id];
    if (controller != nullptr) {
        OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG,
                     "DestroyPacketControllerNapi id111: %{public}d", id);
        ret = OH_TrafficFilter_DestroyPacketController(controller);
        g_controllerMap[id] = nullptr;
    }

    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}
// [End destroy_packet_controller]

static bool GetObjBool(napi_env env, napi_value obj, const char* key, bool def)
{
    bool has;
    if (napi_has_named_property(env, obj, key, &has) != napi_ok || !has) {
        return def;
    }

    napi_value val;
    bool res = def;
    napi_get_named_property(env, obj, key, &val);
    napi_get_value_bool(env, val, &res);
    return res;
}

static uint32_t GetObjU32(napi_env env, napi_value obj, const char* key, uint32_t def)
{
    bool has;
    if (napi_has_named_property(env, obj, key, &has) != napi_ok || !has) {
        return def;
    }

    napi_value val;
    uint32_t res = def;
    napi_get_named_property(env, obj, key, &val);
    napi_get_value_uint32(env, val, &res);
    return res;
}

static bool ObjHasProp(napi_env env, napi_value obj, const char* key)
{
    bool has = false;
    napi_has_named_property(env, obj, key, &has);
    return has;
}

static int ReadStrArray(napi_env env, napi_value arr, char out[][MAX_STR_ARRAY_LEN], int maxCnt)
{
    uint32_t len = 0;
    napi_get_array_length(env, arr, &len);

    int copy = (len > static_cast<uint32_t>(maxCnt)) ? maxCnt : static_cast<int>(len);
    for (uint32_t i = 0; i < copy; i++) {
        napi_value item;
        char buf[MAX_STR_ARRAY_LEN] = {0};
        size_t strLen = 0;
        napi_get_element(env, arr, i, &item);
        napi_get_value_string_utf8(env, item, buf, sizeof(buf), &strLen);
        strcpy(out[i], buf);
    }
    return copy;
}

static int ReadPortArray(napi_env env, napi_value arr, uint16_t out[], int maxCnt)
{
    uint32_t len = 0;
    napi_get_array_length(env, arr, &len);

    int copy = (len > static_cast<uint32_t>(maxCnt)) ? maxCnt : static_cast<int>(len);
    for (uint32_t i = 0; i < copy; i++) {
        napi_value item;
        uint32_t num = 0;
        napi_get_element(env, arr, i, &item);
        napi_get_value_uint32(env, item, &num);
        out[i] = static_cast<uint16_t>(num);
    }
    return copy;
}

static int IpStrToBin(const char* str, uint8_t* binaryBuf, OH_TrafficFilter_IPFamily family)
{
    memset(binaryBuf, 0, IP_ADDR_BUF_LEN);
    if (family == OH_TRAFFICFILTER_IP_FAMILY_V4) {
        return inet_pton(AF_INET, str, binaryBuf);
    } else if (family == OH_TRAFFICFILTER_IP_FAMILY_V6) {
        return inet_pton(AF_INET6, str, binaryBuf);
    }
    return -1;
}

static void ParseIPAddress(napi_env env, napi_value obj, OH_TrafficFilter_IPAddress* out)
{
    memset(out, 0, sizeof(OH_TrafficFilter_IPAddress));

    out->family = static_cast<OH_TrafficFilter_IPFamily>(
        GetObjU32(env, obj, "family", OH_TRAFFICFILTER_IP_FAMILY_UNSPEC));

    if (ObjHasProp(env, obj, "addr")) {
        napi_value arr;
        napi_get_named_property(env, obj, "addr", &arr);

        uint32_t arrLen = 0;
        napi_get_array_length(env, arr, &arrLen);

        if (arrLen > OH_TRAFFICFILTER_IP_ADDRLEN) {
            arrLen = OH_TRAFFICFILTER_IP_ADDRLEN;
        }

        for (uint32_t i = 0; i < arrLen; i++) {
            napi_value numItem;
            napi_get_element(env, arr, i, &numItem);

            uint32_t byteVal = 0;
            napi_get_value_uint32(env, numItem, &byteVal);

            out->addr[i] = static_cast<uint8_t>(byteVal);
        }
        std::string addrStr;
        for (int i = 0; i < IPV4_ADDR_LEN; i++) {
            if (i > 0) {
                addrStr += ".";
            }
            addrStr += std::to_string(out->addr[i]);
        }
        OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG,
                     "fz ParseIPAddress IPv4: %{public}s", addrStr.c_str());
    }
}

static void ParseIPCidr(napi_env env, napi_value obj, OH_TrafficFilter_IPCidr* out)
{
    memset(out, 0, sizeof(OH_TrafficFilter_IPCidr));
    if (ObjHasProp(env, obj, "base")) {
        napi_value baseObj;
        napi_get_named_property(env, obj, "base", &baseObj);
        ParseIPAddress(env, baseObj, &out->base);
    }
    out->prefixLen = GetObjU32(env, obj, "prefixLen", 0);
}

static void ParseIPRange(napi_env env, napi_value obj, OH_TrafficFilter_IPRange* out)
{
    memset(out, 0, sizeof(OH_TrafficFilter_IPRange));
    if (ObjHasProp(env, obj, "start")) {
        napi_value sObj;
        napi_get_named_property(env, obj, "start", &sObj);
        ParseIPAddress(env, sObj, &out->start);
    }
    if (ObjHasProp(env, obj, "end")) {
        napi_value eObj;
        napi_get_named_property(env, obj, "end", &eObj);
        ParseIPAddress(env, eObj, &out->end);
    }
}

static void ParseIPMulti(napi_env env, napi_value obj, OH_TrafficFilter_IPMulti* out)
{
    memset(out, 0, sizeof(OH_TrafficFilter_IPMulti));
    if (!ObjHasProp(env, obj, "ips")) {
        return;
    }

    napi_value arr;
    uint32_t arrLen = 0;
    napi_get_named_property(env, obj, "ips", &arr);
    napi_get_array_length(env, arr, &arrLen);

    int copy = (arrLen > static_cast<uint32_t>(MAX_IP_MULTI_COUNT)) ? MAX_IP_MULTI_COUNT
                                                                    : static_cast<int>(arrLen);
    out->ipCount = copy;
    for (int i = 0; i < copy; i++) {
        napi_value item;
        napi_get_element(env, arr, i, &item);
        ParseIPAddress(env, item, &out->ips[i]);
    }
}

static void ParseIPMatch(napi_env env, napi_value matchObj, OH_TrafficFilter_IPMatch* out)
{
    memset(out, 0, sizeof(OH_TrafficFilter_IPMatch));
    out->type = static_cast<OH_TrafficFilter_IPMatchType>(
        GetObjU32(env, matchObj, "type", OH_TRAFFICFILTER_IP_MATCH_ANY));
    out->invert = GetObjBool(env, matchObj, "invert", false);

    if (out->type == OH_TRAFFICFILTER_IP_MATCH_ANY) {
        return;
    }

    if (!ObjHasProp(env, matchObj, "value")) {
        return;
    }

    napi_value valObj;
    napi_get_named_property(env, matchObj, "value", &valObj);

    switch (out->type) {
        case OH_TRAFFICFILTER_IP_MATCH_SINGLE:
            ParseIPAddress(env, valObj, &out->value.single);
            break;
        case OH_TRAFFICFILTER_IP_MATCH_CIDR:
            ParseIPCidr(env, valObj, &out->value.cidr);
            break;
        case OH_TRAFFICFILTER_IP_MATCH_RANGE:
            ParseIPRange(env, valObj, &out->value.range);
            break;
        case OH_TRAFFICFILTER_IP_MATCH_MULTI:
            ParseIPMulti(env, valObj, &out->value.multi);
            break;
        default:
            break;
    }
}

static void ParsePortRange(napi_env env, napi_value obj, OH_TrafficFilter_PortRange* out)
{
    memset(out, 0, sizeof(OH_TrafficFilter_PortRange));
    out->startPort = static_cast<uint16_t>(GetObjU32(env, obj, "startPort", PORT_MIN_VALUE));
    out->endPort = static_cast<uint16_t>(GetObjU32(env, obj, "endPort", PORT_MAX_VALUE));
}

static void ParsePortMultiFromString(napi_env env, napi_value strObj,
                                     OH_TrafficFilter_PortMulti* out)
{
    size_t bufLen = 0;
    napi_get_value_string_utf8(env, strObj, nullptr, 0, &bufLen);
    if (bufLen == 0 || bufLen > MAX_PORT_STRING_LEN) {
        return;
    }


    char* buf = reinterpret_cast<char*>(malloc(bufLen + 1));
    if (buf == nullptr) {
        return;
    }

    size_t resultLen = 0;
    napi_get_value_string_utf8(env, strObj, buf, bufLen + 1, &resultLen);
    buf[bufLen] = '\0';

    uint32_t count = 0;
    char* token = strtok(buf, ",， ");
    while (token != nullptr && count < MAX_PORT_MULTI_COUNT) {
        int portVal = atoi(token);
        if (portVal >= PORT_MIN_VALUE && portVal <= PORT_MAX_VALUE) {
            out->ports[count] = static_cast<uint16_t>(portVal);
            count++;
        }
        token = strtok(nullptr, ",， ");
    }

    out->portCount = count;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, "out->portCount:%{public}d",
                 out->portCount);
    free(buf);
}

static void ParsePortSingle(napi_env env, napi_value obj, OH_TrafficFilter_PortMatch* out)
{
    out->value.single = static_cast<uint16_t>(GetObjU32(env, obj, "value", 0));
    OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG, "fz SINGLE Port: %{public}u",
                 out->value.single);
}

static void ParsePortRangeValue(napi_env env, napi_value dataTargetObj,
                                OH_TrafficFilter_PortMatch* out)
{
    out->value.range.startPort = static_cast<uint16_t>(
        GetObjU32(env, dataTargetObj, "startPort", PORT_MIN_VALUE));
    out->value.range.endPort = static_cast<uint16_t>(
        GetObjU32(env, dataTargetObj, "endPort", PORT_MAX_VALUE));
    OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG,
                 "fz RANGE: %{public}u - %{public}u",
                 out->value.range.startPort, out->value.range.endPort);
}

static void ParsePortMultiValue(napi_env env, napi_value dataTargetObj,
                                OH_TrafficFilter_PortMatch* out)
{
    if (ObjHasProp(env, dataTargetObj, "ports")) {
        napi_value portsObj;
        napi_get_named_property(env, dataTargetObj, "ports", &portsObj);

        napi_valuetype propType;
        napi_typeof(env, portsObj, &propType);
        if (propType == napi_object) {
            out->value.multi.portCount = ReadPortArray(env, portsObj, out->value.multi.ports,
                                                       MAX_PORT_MULTI_COUNT);
        } else if (propType == napi_string) {
            ParsePortMultiFromString(env, portsObj, &(out->value.multi));
        }
    }

    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG,
                 "fz MULTI Count parsed: %{public}u", out->value.multi.portCount);
    for (uint32_t i = 0; i < out->value.multi.portCount; i++) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG,
                     "fz MULTI Ports[%{public}u]: %{public}u", i, out->value.multi.ports[i]);
    }
}

static void ParsePortMatch(napi_env env, napi_value obj, OH_TrafficFilter_PortMatch* out)
{
    if (obj == nullptr || out == nullptr) {
        return;
    }

    memset(out, 0, sizeof(OH_TrafficFilter_PortMatch));

    if (ObjHasProp(env, obj, "invert")) {
        napi_value invertVal;
        napi_get_named_property(env, obj, "invert", &invertVal);
        napi_get_value_bool(env, invertVal, &out->invert);
    }

    if (!ObjHasProp(env, obj, "type")) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_DOMAIN, LOG_TAG,
                     "fz Error: 'type' property missing.");
        return;
    }

    napi_value typeObj;
    napi_get_named_property(env, obj, "type", &typeObj);
    uint32_t typeVal = 0;
    napi_get_value_uint32(env, typeObj, &typeVal);

    out->type = static_cast<OH_TrafficFilter_PortMatchType>(typeVal);
    OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG, "fz Received Type: %{public}u",
                 out->type);

    napi_value dataTargetObj = obj;
    if (ObjHasProp(env, obj, "value")) {
        napi_get_named_property(env, obj, "value", &dataTargetObj);
    }

    switch (out->type) {
        case OH_TRAFFICFILTER_PORT_MATCH_SINGLE:
            ParsePortSingle(env, obj, out);
            break;
        case OH_TRAFFICFILTER_PORT_MATCH_RANGE:
            ParsePortRangeValue(env, dataTargetObj, out);
            break;
        case OH_TRAFFICFILTER_PORT_MATCH_MULTI:
            ParsePortMultiValue(env, dataTargetObj, out);
            break;
        case OH_TRAFFICFILTER_PORT_MATCH_ANY:
        default:
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, "fz ANY Mode or Unknown.");
            break;
    }
}

static void ParseInterfaceMatch(napi_env env, napi_value obj,
                                OH_TrafficFilter_InterfaceMatch* out)
{
    memset(out, 0, sizeof(OH_TrafficFilter_InterfaceMatch));

    out->enabled = GetObjBool(env, obj, "enabled", false);
    out->invert = GetObjBool(env, obj, "invert", false);
    out->isPrefix = GetObjBool(env, obj, "isPrefix", false);

    if (ObjHasProp(env, obj, "ifName")) {
        napi_value strVal;
        size_t strLen = 0;
        napi_get_named_property(env, obj, "ifName", &strVal);
        napi_get_value_string_utf8(env, strVal, out->ifName, sizeof(out->ifName), &strLen);
    }
}

static void ParseMacMatch(napi_env env, napi_value macObj, OH_TrafficFilter_MACMatch* out)
{
    memset(out, 0, sizeof(OH_TrafficFilter_MACMatch));

    out->enable = GetObjBool(env, macObj, "enable", false);
    out->invert = GetObjBool(env, macObj, "invert", false);

    if (ObjHasProp(env, macObj, "srcMac")) {
        napi_value macArr;
        napi_get_named_property(env, macObj, "srcMac", &macArr);

        bool isArray = false;
        napi_is_array(env, macArr, &isArray);
        if (isArray) {
            napi_value macStrElement;
            napi_get_element(env, macArr, 0, &macStrElement);

            size_t strLen = 0;
            napi_get_value_string_utf8(env, macStrElement, out->srcMac, sizeof(out->srcMac),
                                       &strLen);
        }
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, "ParseMacMatch:%{public}s",
                     out->srcMac);
    }
}

static void ParseTcpFlagsMatch(napi_env env, napi_value obj, OH_TrafficFilter_TCPFlagsMatch* out)
{
    memset(out, 0, sizeof(OH_TrafficFilter_TCPFlagsMatch));
    out->enable = GetObjBool(env, obj, "enable", false);
    out->flagMask = GetObjU32(env, obj, "flagMask", OH_TRAFFICFILTER_TCP_FLAG_NONE);
    out->flagComp = GetObjU32(env, obj, "flagComp", 0);
}

static void ParseConntrackMatch(napi_env env, napi_value obj,
                                OH_TrafficFilter_ConntrackMatch* out)
{
    memset(out, 0, sizeof(OH_TrafficFilter_ConntrackMatch));
    out->enable = GetObjBool(env, obj, "enable", false);
    out->stateMask = GetObjU32(env, obj, "stateMask", OH_TRAFFICFILTER_CT_STATE_ANY);
}

static OH_TrafficFilter_HookPoint ParseHookPointFromConfig(napi_env env, napi_value configObj)
{
    OH_TrafficFilter_HookPoint hookPoint = OH_TRAFFICFILTER_HOOK_OUTPUT;
    bool hasProp = false;
    napi_value propVal;
    if (napi_has_named_property(env, configObj, "hookPoint", &hasProp) == napi_ok && hasProp) {
        napi_get_named_property(env, configObj, "hookPoint", &propVal);
        uint32_t tempHook = 0;
        napi_get_value_uint32(env, propVal, &tempHook);
        switch (tempHook) {
            case HOOK_INPUT_VALUE:
                hookPoint = OH_TRAFFICFILTER_HOOK_INPUT;
                break;
            case HOOK_OUTPUT_VALUE:
                hookPoint = OH_TRAFFICFILTER_HOOK_OUTPUT;
                break;
            case HOOK_FORWARD_VALUE:
                hookPoint = OH_TRAFFICFILTER_HOOK_FORWARD;
                break;
            case HOOK_PREROUTING_VALUE:
                hookPoint = OH_TRAFFICFILTER_HOOK_PREROUTING;
                break;
            case HOOK_POSTROUTING_VALUE:
                hookPoint = OH_TRAFFICFILTER_HOOK_POSTROUTING;
                break;
            default:
                break;
        }
    }
    return hookPoint;
}

static uint32_t ParseProtocolFromConfig(napi_env env, napi_value configObj)
{
    uint32_t protocol = OH_TRAFFICFILTER_PROTO_TCP;
    bool hasProp = false;
    napi_value propVal;
    if (napi_has_named_property(env, configObj, "protocol", &hasProp) == napi_ok && hasProp) {
        napi_get_named_property(env, configObj, "protocol", &propVal);
        napi_get_value_uint32(env, propVal, &protocol);
    }
    return protocol;
}

static void ParseIpMatchesFromConfig(napi_env env, napi_value configObj,
    OH_TrafficFilter_IPMatch& srcIpCfg, OH_TrafficFilter_IPMatch& dstIpCfg)
{
    if (ObjHasProp(env, configObj, "srcIp")) {
        napi_value srcIpObj;
        napi_get_named_property(env, configObj, "srcIp", &srcIpObj);
        ParseIPMatch(env, srcIpObj, &srcIpCfg);
    }
    if (ObjHasProp(env, configObj, "dstIp")) {
        napi_value dstIpObj;
        napi_get_named_property(env, configObj, "dstIp", &dstIpObj);
        ParseIPMatch(env, dstIpObj, &dstIpCfg);
    }
}

static void ParsePortMatchesFromConfig(napi_env env, napi_value configObj,
    OH_TrafficFilter_PortMatch& srcPortCfg, OH_TrafficFilter_PortMatch& dstPortCfg)
{
    if (ObjHasProp(env, configObj, "srcPort")) {
        napi_value srcPortObj;
        napi_get_named_property(env, configObj, "srcPort", &srcPortObj);
        ParsePortMatch(env, srcPortObj, &srcPortCfg);
    }
    if (ObjHasProp(env, configObj, "dstPort")) {
        napi_value dstPortObj;
        napi_get_named_property(env, configObj, "dstPort", &dstPortObj);
        ParsePortMatch(env, dstPortObj, &dstPortCfg);
    }
}

static void ParseInterfaceMatchesFromConfig(napi_env env, napi_value configObj,
    OH_TrafficFilter_InterfaceMatch& inIfCfg, OH_TrafficFilter_InterfaceMatch& outIfCfg)
{
    if (ObjHasProp(env, configObj, "inInterface")) {
        napi_value inIfObj;
        napi_get_named_property(env, configObj, "inInterface", &inIfObj);
        ParseInterfaceMatch(env, inIfObj, &inIfCfg);
    }
    if (ObjHasProp(env, configObj, "outInterface")) {
        napi_value outIfObj;
        napi_get_named_property(env, configObj, "outInterface", &outIfObj);
        ParseInterfaceMatch(env, outIfObj, &outIfCfg);
    }
}

static void ParseUidFromConfig(napi_env env, napi_value configObj,
    uint32_t& uidStart, uint32_t& uidEnd)
{
    bool hasProp = false;
    napi_value propVal;
    if (napi_has_named_property(env, configObj, "uidStart", &hasProp) == napi_ok && hasProp) {
        napi_get_named_property(env, configObj, "uidStart", &propVal);
        napi_get_value_uint32(env, propVal, &uidStart);
    }
    if (napi_has_named_property(env, configObj, "uidEnd", &hasProp) == napi_ok && hasProp) {
        napi_get_named_property(env, configObj, "uidEnd", &propVal);
        napi_get_value_uint32(env, propVal, &uidEnd);
    }
}

static void ParseMacTcpCtFromConfig(napi_env env, napi_value configObj,
    OH_TrafficFilter_MACMatch& macRule,
    OH_TrafficFilter_TCPFlagsMatch& tcpRule,
    OH_TrafficFilter_ConntrackMatch& ctRule)
{
    if (ObjHasProp(env, configObj, "macMatch")) {
        napi_value macObj;
        napi_get_named_property(env, configObj, "macMatch", &macObj);
        ParseMacMatch(env, macObj, &macRule);
    }
    if (ObjHasProp(env, configObj, "tcpFlagsMatch")) {
        napi_value tcpObj;
        napi_get_named_property(env, configObj, "tcpFlagsMatch", &tcpObj);
        ParseTcpFlagsMatch(env, tcpObj, &tcpRule);
    }
    if (ObjHasProp(env, configObj, "conntrackMatch")) {
        napi_value ctObj;
        napi_get_named_property(env, configObj, "conntrackMatch", &ctObj);
        ParseConntrackMatch(env, ctObj, &ctRule);
    }
}

static OH_TrafficFilter_FilterRule BuildFilterRuleFromConfig(
    napi_env env,
    napi_value configObj,
    uint32_t priority,
    OH_TrafficFilter_HookPoint hookPoint,
    uint32_t protocol)
{
    OH_TrafficFilter_IPMatch srcIpCfg;
    OH_TrafficFilter_IPMatch dstIpCfg;
    ParseIpMatchesFromConfig(env, configObj, srcIpCfg, dstIpCfg);

    OH_TrafficFilter_PortMatch srcPortCfg;
    OH_TrafficFilter_PortMatch dstPortCfg;
    ParsePortMatchesFromConfig(env, configObj, srcPortCfg, dstPortCfg);

    OH_TrafficFilter_InterfaceMatch inIfCfg;
    OH_TrafficFilter_InterfaceMatch outIfCfg;
    ParseInterfaceMatchesFromConfig(env, configObj, inIfCfg, outIfCfg);

    uint32_t uidStart = 0;
    uint32_t uidEnd = 0;
    ParseUidFromConfig(env, configObj, uidStart, uidEnd);

    OH_TrafficFilter_MACMatch macRule = {0};
    OH_TrafficFilter_TCPFlagsMatch tcpRule = {0};
    OH_TrafficFilter_ConntrackMatch ctRule = {0};
    ParseMacTcpCtFromConfig(env, configObj, macRule, tcpRule, ctRule);

    OH_TrafficFilter_FilterRule rule = {0};
    rule.size = sizeof(OH_TrafficFilter_FilterRule);
    rule.priority = priority;
    rule.hookPoint = hookPoint;
    rule.protocol = protocol;
    rule.srcIp = srcIpCfg;
    rule.dstIp = dstIpCfg;
    rule.srcPort = srcPortCfg;
    rule.dstPort = dstPortCfg;
    rule.inInterface = inIfCfg;
    rule.outInterface = outIfCfg;
    rule.uidStart = uidStart;
    rule.uidEnd = uidEnd;
    rule.macMatch = macRule;
    rule.tcpFlagsMatch = tcpRule;
    rule.conntrackMatch = ctRule;

    return rule;
}

// [Start add_packet_rule]
static napi_value AddPacketRuleNapi(napi_env env, napi_callback_info info)
{
    size_t argc = ARG_IDX_RULE_CONFIG;
    napi_value args[ARG_IDX_RULE_CONFIG] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    uint32_t id = -1;
    napi_get_value_uint32(env, args[0], &id);
    OH_TrafficFilter_PacketController* controller = g_controllerMap[id];
    if (controller == nullptr) {
        napi_value result;
        napi_create_int32(env, -1, &result);
        return result;
    }

    napi_value configObj = args[1];

    uint32_t priority = DEFAULT_PRIORITY;
    bool hasProp = false;
    napi_value propVal;
    if (napi_has_named_property(env, configObj, "priority", &hasProp) == napi_ok && hasProp) {
        napi_get_named_property(env, configObj, "priority", &propVal);
        napi_get_value_uint32(env, propVal, &priority);
    }

    OH_TrafficFilter_HookPoint hookPoint = ParseHookPointFromConfig(env, configObj);
    uint32_t protocol = ParseProtocolFromConfig(env, configObj);
    OH_TrafficFilter_FilterRule rule = BuildFilterRuleFromConfig(env, configObj, priority, hookPoint, protocol);

    OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG,
                 "AddPacketRuleNapi srcMac: %{public}s", rule.macMatch.srcMac);

    int ret = OH_TrafficFilter_AddPacketRule(controller, &rule);
    OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG,
                 "AddPacketRuleNapi ret: %{public}d", ret);

    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}
// [End add_packet_rule]

// [Start clear_packet_rule]
static napi_value ClearPacketRuleNapi(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    uint32_t id;
    if (argc >= 1) {
        napi_get_value_uint32(env, args[0], &id);
    }

    int ret = -1;
    OH_TrafficFilter_PacketController* controller = g_controllerMap[id];
    if (controller != nullptr) {
        ret = OH_TrafficFilter_ClearPacketRule(controller);
    }

    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}
// [End clear_packet_rule]

static napi_value CreateIpAddressObject(napi_env env, const OH_TrafficFilter_IPAddress& ip)
{
    napi_value ipObj;
    napi_create_object(env, &ipObj);

    napi_value ipFamily;
    napi_create_int32(env, ip.family, &ipFamily);
    napi_set_named_property(env, ipObj, "family", ipFamily);

    napi_value addrArray;
    napi_create_array(env, &addrArray);

    napi_value ipAddr[IPV4_ADDR_LEN] = {nullptr};
    for (int i = 0; i < IPV4_ADDR_LEN; i++) {
        napi_create_int32(env, ip.addr[i], &ipAddr[i]);
        napi_set_element(env, addrArray, i, ipAddr[i]);
    }

    napi_set_named_property(env, ipObj, "addr", addrArray);
    return ipObj;
}

static napi_value BuildPacketResultObject(napi_env env,
                                          const OH_TrafficFilter_PacketDesc* packet)
{
    napi_value resultObj;
    napi_create_object(env, &resultObj);

    napi_value packetId;
    napi_create_int32(env, packet->packetId, &packetId);
    napi_set_named_property(env, resultObj, "packetId", packetId);

    napi_value protocol;
    napi_create_int32(env, packet->protocol, &protocol);
    napi_set_named_property(env, resultObj, "protocol", protocol);

    napi_value srcIpObj = CreateIpAddressObject(env, packet->srcIp);
    napi_set_named_property(env, resultObj, "srcIp", srcIpObj);

    napi_value dstIpObj = CreateIpAddressObject(env, packet->dstIp);
    napi_set_named_property(env, resultObj, "dstIp", dstIpObj);

    napi_value srcPort;
    napi_create_int32(env, packet->srcPort, &srcPort);
    napi_set_named_property(env, resultObj, "srcPort", srcPort);

    napi_value dstPort;
    napi_create_int32(env, packet->dstPort, &dstPort);
    napi_set_named_property(env, resultObj, "dstPort", dstPort);

    napi_value packetLen;
    napi_create_int32(env, packet->packetLen, &packetLen);
    napi_set_named_property(env, resultObj, "packetLen", packetLen);

    napi_value data1;
    napi_create_int32(env, *packet->data, &data1);
    napi_set_named_property(env, resultObj, "data", data1);

    return resultObj;
}

static void ThreadSafeCallJs(napi_env env, napi_value jsCb, void* asyncCtx, void* data)
{
    PacketCallbackCtx* argContext = reinterpret_cast<PacketCallbackCtx*>(data);

    napi_value jsCallBack;
    napi_get_reference_value(env, argContext->jsCallbackRef, &jsCallBack);

    napi_value resultObj = BuildPacketResultObject(env, argContext->packet);

    napi_value callResult;
    napi_create_int32(env, DUMMY_CALLBACK_ARG, &callResult);

    napi_call_function(env, nullptr, jsCallBack, 1, &resultObj, &callResult);
}

// [Start register_packet_callback]
OH_TrafficFilter_PacketDecision MyPacketHandler(
    const OH_TrafficFilter_PacketDesc* packet,
    void* userData)
{
    napi_acquire_threadsafe_function(tsFn);
    g_asyncContext->packet = packet;
    napi_call_threadsafe_function(tsFn, g_asyncContext, napi_tsfn_nonblocking);
    napi_release_threadsafe_function(tsFn, napi_tsfn_release);

    return OH_TRAFFICFILTER_DECISION_DROP;
}

static napi_value RegisterPacketCallbackNapi(napi_env env, napi_callback_info info)
{
    size_t argc = ARG_IDX_JS_CALLBACK + 1;
    napi_value args[ARG_IDX_JS_CALLBACK + 1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    uint32_t id = -1;
    napi_get_value_uint32(env, args[0], &id);
    OH_TrafficFilter_PacketController* controller = g_controllerMap[id];
    if (controller == nullptr) {
        napi_value result;
        napi_create_int32(env, ERR_CONTROLLER_NOT_FOUND, &result);
        return result;
    }

    size_t copyLen = 0;
    char buf[BUFFER_SIZE] = {0};
    napi_get_value_string_utf8(env, args[1], buf, BUFFER_SIZE, &copyLen);
    void* userData = reinterpret_cast<void*>(buf);

    napi_value workName;
    napi_create_string_utf8(env, "ThreadSafeCase", NAPI_AUTO_LENGTH, &workName);
    napi_create_threadsafe_function(env, nullptr, nullptr, workName, 0, 1, nullptr, nullptr,
                                    nullptr, ThreadSafeCallJs, &tsFn);

    g_asyncContext->env = env;
    napi_create_reference(env, args[ARG_IDX_JS_CALLBACK], 1, &g_asyncContext->jsCallbackRef);

    int ret = OH_TrafficFilter_RegisterPacketCallback(controller, MyPacketHandler, userData);
    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}
// [End register_packet_callback]

static napi_value UnregisterPacketCallbackNapi(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    uint32_t id;
    if (argc >= 1) {
        napi_get_value_uint32(env, args[0], &id);
    }

    int ret = -1;
    OH_TrafficFilter_PacketController* controller = g_controllerMap[id];
    static_cast<void>(controller);
    static_cast<void>(ret);

    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}

EXTERN_C_START
// [Start init_exports]
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "createPacketController", nullptr, CreatePacketControllerNapi, nullptr, nullptr,
          nullptr, napi_default, nullptr },
        { "destroyPacketController", nullptr, DestroyPacketControllerNapi, nullptr, nullptr,
          nullptr, napi_default, nullptr },
        { "addPacketRule", nullptr, AddPacketRuleNapi, nullptr, nullptr,
          nullptr, napi_default, nullptr },
        { "clearPacketRule", nullptr, ClearPacketRuleNapi, nullptr, nullptr,
          nullptr, napi_default, nullptr },
        { "registerPacketCallback", nullptr, RegisterPacketCallbackNapi, nullptr, nullptr,
          nullptr, napi_default, nullptr },
        { "unregisterPacketCallback", nullptr, UnregisterPacketCallbackNapi, nullptr, nullptr,
          nullptr, napi_default, nullptr }
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END
// [End init_exports]

// [Start register_module]
static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "entry",
    .nm_priv = nullptr,
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
// [End register_module]
