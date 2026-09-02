// [Start header_file]
#include <cstdint>
#include <cstring>
#include <string>
#include <sstream>
#include <vector>
#include <algorithm>
#include <arpa/inet.h>

#include "napi/native_api.h"
#include "hilog/log.h"
#include "network/netmanager_ext/net_trafficfilter.h"
// [End header_file]

// [Start create_redirector]
constexpr int BUFFER_SIZE = 128;
constexpr size_t IP_ADDR_BUF_LEN = 16;
constexpr size_t IPV4_ADDR_LEN = 4;
constexpr uint32_t DEFAULT_GROUP_ID = 1001;
constexpr uint32_t DEFAULT_PRIORITY = 100;
constexpr uint32_t DEFAULT_PACKET_COPY_LEN = 0xFFFF;
constexpr uint32_t DEFAULT_NFQUEUE_MAXLEN = 1024;
constexpr uint32_t DEFAULT_NFQUEUE_FLAGS = 1;
constexpr uint32_t PROTOCOL_TCP = OH_TRAFFICFILTER_PROTO_TCP;
constexpr uint16_t DEFAULT_HTTP_PORT = 80;
constexpr uint16_t DEFAULT_PROXY_PORT = 8080;
constexpr uint16_t HTTPS_PORT = 443;
constexpr uint16_t PORT_MIN_VALUE = 0;
constexpr uint16_t PORT_MAX_VALUE = 65535;
constexpr uint32_t UID_ANY = 4294967295u;
constexpr size_t INTERFACE_NAME_MAX_LEN = 31;
constexpr uint8_t IPV4_DEFAULT_PREFIX = 24;
constexpr uint8_t IPV6_DEFAULT_PREFIX = 64;
constexpr uint8_t IPV4_PREFIX_MAX = 32;
constexpr uint8_t IPV6_PREFIX_MAX = 128;
constexpr uint32_t LOG_DOMAIN_DEFAULT = 0x0000;
constexpr size_t ARRAY_BRACKET_PAIR_LEN = 2;
constexpr size_t ARRAY_CONTENT_START_OFFSET = 1;

constexpr int ARG_IDX_GROUP_ID = 0;
constexpr int ARG_IDX_PRIORITY = 1;
constexpr int ARG_IDX_PACKET_COPY_LEN = 2;
constexpr int ARG_IDX_NFQUEUE_MAXLEN = 3;
constexpr int ARG_IDX_NFQUEUE_FLAGS = 4;
constexpr int REQUIRED_ARG_COUNT = 5;

OH_TrafficFilter_Redirector* g_redirector = nullptr;

static napi_value CreateRedirectorNapi(napi_env env, napi_callback_info info)
{
    size_t argc = ARG_IDX_NFQUEUE_FLAGS + 1;
    napi_value args[ARG_IDX_NFQUEUE_FLAGS + 1] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    uint32_t groupId = DEFAULT_GROUP_ID;
    uint32_t priority = DEFAULT_PRIORITY;
    uint32_t packetCopyLen = DEFAULT_PACKET_COPY_LEN;
    uint32_t nfqueueMaxlen = DEFAULT_NFQUEUE_MAXLEN;
    uint32_t nfqueueFlags = DEFAULT_NFQUEUE_FLAGS;

    if (argc > ARG_IDX_GROUP_ID) {
        napi_get_value_uint32(env, args[ARG_IDX_GROUP_ID], &groupId);
    }
    if (argc > ARG_IDX_PRIORITY) {
        napi_get_value_uint32(env, args[ARG_IDX_PRIORITY], &priority);
    }
    if (argc > ARG_IDX_PACKET_COPY_LEN) {
        napi_get_value_uint32(env, args[ARG_IDX_PACKET_COPY_LEN], &packetCopyLen);
    }
    if (argc > ARG_IDX_NFQUEUE_MAXLEN) {
        napi_get_value_uint32(env, args[ARG_IDX_NFQUEUE_MAXLEN], &nfqueueMaxlen);
    }
    if (argc > ARG_IDX_NFQUEUE_FLAGS) {
        napi_get_value_uint32(env, args[ARG_IDX_NFQUEUE_FLAGS], &nfqueueFlags);
    }

// [StartExclude create_redirector]

    OH_TrafficFilter_Config config;
    config.packetCopyLen = packetCopyLen;
    config.nfqueueMaxlen = nfqueueMaxlen;
    config.nfqueueFlags = nfqueueFlags;

// [EndExclude create_redirector]

    int32_t ret = OH_TrafficFilter_CreateRedirector(groupId, priority, &g_redirector);

    char msg[BUFFER_SIZE * 2];

    napi_value result;
    napi_create_string_utf8(env, msg, strlen(msg), &result);
    return result;
}
// [End create_redirector]

bool ParseIPv4Address(const std::string& addrStr, uint8_t outAddr[IP_ADDR_BUF_LEN])
{
    OH_LOG_INFO(LOG_APP, "ParseIPv4Address - Input: %{public}s", addrStr.c_str());
    memset(outAddr, 0, IP_ADDR_BUF_LEN);
    if (addrStr.empty()) {
        OH_LOG_ERROR(LOG_APP, "ParseIPv4Address - Empty address");
        return false;
    }
    struct in_addr addr4 {};
    int ret = inet_pton(AF_INET, addrStr.c_str(), &addr4);
    if (ret != 1) {
        OH_LOG_ERROR(LOG_APP, "ParseIPv4Address - Invalid IPv4 address: %{public}s", addrStr.c_str());
        return false;
    }
    memcpy(outAddr, &addr4, IPV4_ADDR_LEN);
    OH_LOG_INFO(LOG_APP, "ParseIPv4Address - Success: %{public}s", addrStr.c_str());
    return true;
}

bool ParseIPv6Address(const std::string& addrStr, uint8_t outAddr[IP_ADDR_BUF_LEN])
{
    OH_LOG_INFO(LOG_APP, "ParseIPv6Address - Input: %{public}s", addrStr.c_str());
    memset(outAddr, 0, IP_ADDR_BUF_LEN);
    if (addrStr.empty()) {
        OH_LOG_ERROR(LOG_APP, "ParseIPv6Address - Empty address");
        return false;
    }
    std::string ip = addrStr;
    size_t zonePos = ip.find('%');
    if (zonePos != std::string::npos) {
        ip = ip.substr(0, zonePos);
    }
    struct in6_addr addr6 {};
    int ret = inet_pton(AF_INET6, ip.c_str(), &addr6);
    if (ret != 1) {
        OH_LOG_ERROR(LOG_APP, "ParseIPv6Address - Invalid IPv6 address: %{public}s", addrStr.c_str());
        return false;
    }
    memcpy(outAddr, &addr6, IP_ADDR_BUF_LEN);
    OH_LOG_INFO(LOG_APP, "ParseIPv6Address - Success: %{public}s", addrStr.c_str());
    return true;
}

bool ParseIPAddressByFamily(
    const std::string& addrStr,
    OH_TrafficFilter_IPFamily family,
    uint8_t outAddr[IP_ADDR_BUF_LEN])
{
    if (family == OH_TRAFFICFILTER_IP_FAMILY_V4) {
        return ParseIPv4Address(addrStr, outAddr);
    }
    if (family == OH_TRAFFICFILTER_IP_FAMILY_V6) {
        return ParseIPv6Address(addrStr, outAddr);
    }
    OH_LOG_ERROR(LOG_APP, "ParseIPAddressByFamily - Invalid family: %{public}d", family);
    return false;
}

OH_TrafficFilter_IPFamily DetectIPFamilyFromAddr(const std::string& addrStr)
{
    if (addrStr.find(':') != std::string::npos) {
        return OH_TRAFFICFILTER_IP_FAMILY_V6;
    }
    return OH_TRAFFICFILTER_IP_FAMILY_V4;
}

bool IsValidIPFamily(OH_TrafficFilter_IPFamily family)
{
    return family == OH_TRAFFICFILTER_IP_FAMILY_V4 ||
           family == OH_TRAFFICFILTER_IP_FAMILY_V6;
}

std::string ExtractJsonValue(const std::string& json, const std::string& key, int startPos = 0)
{
    std::string searchPattern = "\"" + key + "\":";
    size_t keyPos = json.find(searchPattern, startPos);
    if (keyPos == std::string::npos) {
        OH_LOG_INFO(LOG_APP, "ExtractJsonValue - Key not found: %{public}s", key.c_str());
        return "";
    }

    size_t valueStart = keyPos + searchPattern.length();
    while (valueStart < json.length() && json[valueStart] == ' ') {
        valueStart++;
    }

    if (valueStart >= json.length()) {
        OH_LOG_ERROR(LOG_APP, "ExtractJsonValue - Invalid value position for key: %{public}s", key.c_str());
        return "";
    }

    char firstChar = json[valueStart];
    std::string result = "";
    if (firstChar == '"') {
        size_t endQuote = json.find('"', valueStart + 1);
        if (endQuote == std::string::npos) {
            OH_LOG_ERROR(LOG_APP,
                "ExtractJsonValue - Unterminated string for key: %{public}s",
                key.c_str());
            return "";
        }
        result = json.substr(valueStart + 1, endQuote - valueStart - 1);
    } else if ((firstChar >= '0' && firstChar <= '9') || firstChar == '-') {
        size_t endPos = json.find_first_of(",}", valueStart);
        if (endPos == std::string::npos) {
            OH_LOG_ERROR(LOG_APP,
                "ExtractJsonValue - No delimiter found for key: %{public}s",
                key.c_str());
            return "";
        }
        result = json.substr(valueStart, endPos - valueStart);
    } else if (firstChar == 't' || firstChar == 'f') {
        size_t endPos = json.find_first_of(",}", valueStart);
        if (endPos == std::string::npos) {
            OH_LOG_ERROR(LOG_APP,
                "ExtractJsonValue - No delimiter found for boolean key: %{public}s",
                key.c_str());
            return "";
        }
        result = json.substr(valueStart, endPos - valueStart);
    }

    OH_LOG_INFO(LOG_APP,
        "ExtractJsonValue - Key: %{public}s, Value: %{public}s",
        key.c_str(), result.c_str());
    return result;
}

std::string ExtractNestedObject(const std::string& json, const std::string& key)
{
    std::string searchPattern = "\"" + key + "\":";
    size_t keyPos = json.find(searchPattern);
    if (keyPos == std::string::npos) {
        return "";
    }

    size_t startBrace = json.find('{', keyPos + searchPattern.length());
    if (startBrace == std::string::npos) {
        return "";
    }

    int braceCount = 1;
    size_t pos = startBrace + 1;
    while (pos < json.length() && braceCount > 0) {
        if (json[pos] == '{') {
            braceCount++;
        } else if (json[pos] == '}') {
            braceCount--;
        }
        pos++;
    }

    if (braceCount == 0) {
        return json.substr(startBrace, pos - startBrace);
    }
    return "";
}

std::string ExtractArray(const std::string& json, const std::string& key)
{
    std::string searchPattern = "\"" + key + "\":";
    size_t keyPos = json.find(searchPattern);
    if (keyPos == std::string::npos) {
        return "";
    }

    size_t startBracket = json.find('[', keyPos + searchPattern.length());
    if (startBracket == std::string::npos) {
        return "";
    }

    int bracketCount = 1;
    size_t pos = startBracket + 1;
    while (pos < json.length() && bracketCount > 0) {
        if (json[pos] == '[') {
            bracketCount++;
        } else if (json[pos] == ']') {
            bracketCount--;
        }
        pos++;
    }

    if (bracketCount == 0) {
        return json.substr(startBracket, pos - startBracket);
    }
    return "";
}

std::vector<std::string> ExtractArrayElements(const std::string& arrayStr)
{
    std::vector<std::string> elements;
    if (arrayStr.length() < ARRAY_BRACKET_PAIR_LEN) {
        return elements;
    }

    std::string content = arrayStr.substr(ARRAY_CONTENT_START_OFFSET,
        arrayStr.length() - ARRAY_BRACKET_PAIR_LEN);
    int braceCount = 0;
    std::string current;

    for (char c : content) {
        if (c == '{') {
            braceCount++;
        }
        if (c == '}') {
            braceCount--;
        }

        if (c == ',' && braceCount == 0) {
            if (!current.empty()) {
                elements.push_back(current);
                current.clear();
            }
        } else {
            current += c;
        }
    }
    if (!current.empty()) {
        elements.push_back(current);
    }

    return elements;
}

std::vector<uint16_t> ExtractPortArray(const std::string& portArrayStr)
{
    std::vector<uint16_t> ports;
    std::vector<std::string> elements = ExtractArrayElements(portArrayStr);

    for (const auto& elem : elements) {
        try {
            uint16_t port = static_cast<uint16_t>(std::stoi(elem));
            ports.push_back(port);
        } catch (...) {
            OH_LOG_ERROR(LOG_APP, "ExtractPortArray - Invalid port: %{public}s", elem.c_str());
        }
    }

    return ports;
}

static bool ParseIPMultiArrayElement(const std::string& elementStr, size_t index,
    OH_TrafficFilter_IPMulti& multi)
{
    std::string addrStr = ExtractJsonValue(elementStr, "addr");
    std::string familyStr = ExtractJsonValue(elementStr, "family");
    if (addrStr.empty()) {
        OH_LOG_ERROR(LOG_APP,
            "ParseIPMultiArray - Missing addr for IP index %{public}zu",
            index);
        return false;
    }
    OH_TrafficFilter_IPFamily family = familyStr.empty()
        ? DetectIPFamilyFromAddr(addrStr)
        : static_cast<OH_TrafficFilter_IPFamily>(static_cast<int32_t>(std::stoul(familyStr)));
    if (!IsValidIPFamily(family)) {
        OH_LOG_ERROR(LOG_APP,
            "ParseIPMultiArray - Invalid family for IP index %{public}zu: %{public}d",
            index, family);
        return false;
    }
    uint32_t ipIndex = multi.ipCount;
    multi.ips[ipIndex].family = family;
    bool parseOk = ParseIPAddressByFamily(addrStr, family, multi.ips[ipIndex].addr);
    if (!parseOk) {
        OH_LOG_ERROR(LOG_APP,
            "ParseIPMultiArray - Failed to parse IP index %{public}zu, addr=%{public}s, "
            "family=%{public}d",
            index, addrStr.c_str(), family);
        return false;
    }
    multi.ipCount++;
    return true;
}

bool ParseIPMultiArray(const std::string& multiIpArrayStr, OH_TrafficFilter_IPMatch& ipMatch)
{
    std::vector<std::string> ipElements = ExtractArrayElements(multiIpArrayStr);
    if (ipElements.empty()) {
        OH_LOG_ERROR(LOG_APP, "ParseIPMultiArray - Empty IP multi array");
        return false;
    }
    if (ipElements.size() > OH_TRAFFICFILTER_MAX_MULTI_IP_COUNT) {
        OH_LOG_ERROR(LOG_APP,
            "ParseIPMultiArray - Too many IPs: %{public}zu, max %{public}d",
            ipElements.size(), OH_TRAFFICFILTER_MAX_MULTI_IP_COUNT);
        return false;
    }
    ipMatch.value.multi.ipCount = 0;
    for (size_t i = 0; i < ipElements.size(); i++) {
        if (!ParseIPMultiArrayElement(ipElements[i], i, ipMatch.value.multi)) {
            return false;
        }
    }
    OH_LOG_INFO(LOG_APP,
        "ParseIPMultiArray - Successfully parsed %{public}u IPs",
        ipMatch.value.multi.ipCount);
    return ipMatch.value.multi.ipCount > 0;
}

template <typename PortMatchT>
bool ParsePortMultiArray(const std::string& multiPortArrayStr, PortMatchT& portMatch)
{
    std::vector<std::string> portElements = ExtractArrayElements(multiPortArrayStr);
    if (portElements.empty()) {
        OH_LOG_ERROR(LOG_APP, "ParsePortMultiArray - Empty port multi array");
        return false;
    }
    if (portElements.size() > OH_TRAFFICFILTER_MAX_MULTI_PORT_COUNT) {
        OH_LOG_ERROR(LOG_APP,
            "ParsePortMultiArray - Too many ports: %{public}zu, max %{public}d",
            portElements.size(), OH_TRAFFICFILTER_MAX_MULTI_PORT_COUNT);
        return false;
    }
    portMatch.value.multi.portCount = 0;
    for (size_t i = 0; i < portElements.size(); i++) {
        try {
            int port = std::stoi(portElements[i]);
            if (port < PORT_MIN_VALUE || port > PORT_MAX_VALUE) {
                OH_LOG_ERROR(LOG_APP,
                    "ParsePortMultiArray - Invalid port value: %{public}d",
                    port);
                return false;
            }
            portMatch.value.multi.ports[portMatch.value.multi.portCount++] =
                static_cast<uint16_t>(port);
        } catch (...) {
            OH_LOG_ERROR(LOG_APP,
                "ParsePortMultiArray - Invalid port string: %{public}s",
                portElements[i].c_str());
            return false;
        }
    }
    OH_LOG_INFO(LOG_APP,
        "ParsePortMultiArray - Successfully parsed %{public}u ports",
        portMatch.value.multi.portCount);
    return portMatch.value.multi.portCount > 0;
}

OH_TrafficFilter_IPFamily GetIPFamilyFromJsonOrAddr(const std::string& ipObj, const std::string& addrStr)
{
    std::string familyStr = ExtractJsonValue(ipObj, "family");
    if (!familyStr.empty()) {
        return static_cast<OH_TrafficFilter_IPFamily>(
            static_cast<int32_t>(std::stoul(familyStr))
        );
    }
    return DetectIPFamilyFromAddr(addrStr);
}

template <typename TrafficIpT>
bool FillTrafficIpFromJsonObject(
    const std::string& ipObj,
    TrafficIpT& outIp,
    const std::string& label)
{
    std::string addrStr = ExtractJsonValue(ipObj, "addr");
    if (addrStr.empty()) {
        OH_LOG_ERROR(LOG_APP, "%{public}s - Missing addr", label.c_str());
        return false;
    }
    OH_TrafficFilter_IPFamily family = GetIPFamilyFromJsonOrAddr(ipObj, addrStr);
    if (!IsValidIPFamily(family)) {
        OH_LOG_ERROR(LOG_APP, "%{public}s - Invalid family: %{public}d", label.c_str(), family);
        return false;
    }
    outIp.family = family;
    if (!ParseIPAddressByFamily(addrStr, family, outIp.addr)) {
        OH_LOG_ERROR(LOG_APP,
            "%{public}s - Failed to parse address: %{public}s, family=%{public}d",
            label.c_str(), addrStr.c_str(), family);
        return false;
    }
    OH_LOG_INFO(LOG_APP,
        "%{public}s - Parsed address: %{public}s, family=%{public}d",
        label.c_str(), addrStr.c_str(), family);
    return true;
}

template <typename TrafficIpT>
bool FillTrafficIpRangeFromJsonObject(
    const std::string& rangeObj,
    TrafficIpT& startIp,
    TrafficIpT& endIp,
    const std::string& label)
{
    std::string startAddrStr = ExtractJsonValue(rangeObj, "startAddr");
    std::string endAddrStr = ExtractJsonValue(rangeObj, "endAddr");
    if (startAddrStr.empty() || endAddrStr.empty()) {
        OH_LOG_ERROR(LOG_APP, "%{public}s - Missing startAddr or endAddr", label.c_str());
        return false;
    }
    std::string familyStr = ExtractJsonValue(rangeObj, "family");
    OH_TrafficFilter_IPFamily family;
    if (!familyStr.empty()) {
        family = static_cast<OH_TrafficFilter_IPFamily>(
            static_cast<int32_t>(std::stoul(familyStr))
        );
    } else {
        OH_TrafficFilter_IPFamily startFamily = DetectIPFamilyFromAddr(startAddrStr);
        OH_TrafficFilter_IPFamily endFamily = DetectIPFamilyFromAddr(endAddrStr);
        family = startFamily;
        (void)endFamily;
    }
    if (!IsValidIPFamily(family)) {
        OH_LOG_ERROR(LOG_APP, "%{public}s - Invalid family: %{public}d", label.c_str(), family);
        return false;
    }
    startIp.family = family;
    endIp.family = family;
    if (!ParseIPAddressByFamily(startAddrStr, family, startIp.addr)) {
        OH_LOG_ERROR(LOG_APP,
            "%{public}s - Failed to parse startAddr: %{public}s",
            label.c_str(), startAddrStr.c_str());
        return false;
    }
    if (!ParseIPAddressByFamily(endAddrStr, family, endIp.addr)) {
        OH_LOG_ERROR(LOG_APP,
            "%{public}s - Failed to parse endAddr: %{public}s",
            label.c_str(), endAddrStr.c_str());
        return false;
    }
    OH_LOG_INFO(LOG_APP,
        "%{public}s - Parsed range: %{public}s - %{public}s, family=%{public}d",
        label.c_str(), startAddrStr.c_str(), endAddrStr.c_str(), family);
    return true;
}

bool ParsePrefixLen(
    const std::string& prefixStr,
    OH_TrafficFilter_IPFamily family,
    uint8_t& prefixLen)
{
    uint8_t defaultPrefix = family == OH_TRAFFICFILTER_IP_FAMILY_V6
        ? IPV6_DEFAULT_PREFIX
        : IPV4_DEFAULT_PREFIX;
    uint8_t maxPrefix = family == OH_TRAFFICFILTER_IP_FAMILY_V6
        ? IPV6_PREFIX_MAX
        : IPV4_PREFIX_MAX;
    if (prefixStr.empty()) {
        prefixLen = defaultPrefix;
        (void)maxPrefix;
        return true;
    }
    int prefix = 0;
    try {
        prefix = std::stoi(prefixStr);
    } catch (...) {
        OH_LOG_ERROR(LOG_APP, "ParsePrefixLen - Invalid prefix: %{public}s", prefixStr.c_str());
        return false;
    }
    prefixLen = static_cast<uint8_t>(prefix);
    (void)maxPrefix;
    return true;
}

static bool ParseIpMatchSingle(const std::string& ipObj,
    OH_TrafficFilter_IPMatch& match, const std::string& label)
{
    std::string singleIpObj = ExtractNestedObject(ipObj, "single");
    if (singleIpObj.empty()) {
        OH_LOG_ERROR(LOG_APP,
            "BuildRedirectRuleFromJson - %{public}s SINGLE but no single object found",
            label.c_str());
        return false;
    }
    return FillTrafficIpFromJsonObject(singleIpObj, match.value.single, label + " SINGLE");
}

static bool ParseIpMatchCidr(const std::string& ipObj,
    OH_TrafficFilter_IPMatch& match, const std::string& label)
{
    std::string cidrIpObj = ExtractNestedObject(ipObj, "cidr");
    if (cidrIpObj.empty()) {
        OH_LOG_ERROR(LOG_APP,
            "BuildRedirectRuleFromJson - %{public}s CIDR but no cidr object found",
            label.c_str());
        return false;
    }
    if (!FillTrafficIpFromJsonObject(cidrIpObj, match.value.cidr.base, label + " CIDR")) {
        return false;
    }
    std::string prefixStr = ExtractJsonValue(cidrIpObj, "prefix");
    if (!ParsePrefixLen(prefixStr, match.value.cidr.base.family, match.value.cidr.prefixLen)) {
        return false;
    }
    OH_LOG_INFO(LOG_APP,
        "BuildRedirectRuleFromJson - %{public}s CIDR parsed, family=%{public}d, "
        "prefix=%{public}d",
        label.c_str(), match.value.cidr.base.family, match.value.cidr.prefixLen);
    return true;
}

static bool ParseIpMatchRange(const std::string& ipObj,
    OH_TrafficFilter_IPMatch& match, const std::string& label)
{
    std::string rangeIpObj = ExtractNestedObject(ipObj, "range");
    if (rangeIpObj.empty()) {
        OH_LOG_ERROR(LOG_APP,
            "BuildRedirectRuleFromJson - %{public}s RANGE but no range object found",
            label.c_str());
        return false;
    }
    return FillTrafficIpRangeFromJsonObject(
        rangeIpObj, match.value.range.start, match.value.range.end, label + " RANGE");
}

static bool ParseIpMatchMulti(const std::string& ipObj,
    OH_TrafficFilter_IPMatch& match, const std::string& label)
{
    std::string multiIpArrayStr = ExtractArray(ipObj, "multi");
    if (multiIpArrayStr.empty()) {
        OH_LOG_ERROR(LOG_APP,
            "BuildRedirectRuleFromJson - %{public}s MULTI type but no multi array found",
            label.c_str());
        return false;
    }
    if (!ParseIPMultiArray(multiIpArrayStr, match)) {
        OH_LOG_ERROR(LOG_APP,
            "BuildRedirectRuleFromJson - Failed to parse %{public}s MULTI array",
            label.c_str());
        return false;
    }
    OH_LOG_INFO(LOG_APP,
        "BuildRedirectRuleFromJson - %{public}s MULTI parsed, count=%{public}u",
        label.c_str(), match.value.multi.ipCount);
    return true;
}

static bool ParseIpMatchValueFromJson(const std::string& ipObj,
    OH_TrafficFilter_IPMatchType type, OH_TrafficFilter_IPMatch& match, const std::string& label)
{
    switch (type) {
        case OH_TRAFFICFILTER_IP_MATCH_SINGLE:
            return ParseIpMatchSingle(ipObj, match, label);
        case OH_TRAFFICFILTER_IP_MATCH_CIDR:
            return ParseIpMatchCidr(ipObj, match, label);
        case OH_TRAFFICFILTER_IP_MATCH_RANGE:
            return ParseIpMatchRange(ipObj, match, label);
        case OH_TRAFFICFILTER_IP_MATCH_MULTI:
            return ParseIpMatchMulti(ipObj, match, label);
        default:
            return true;
    }
}

bool ParseSrcIpFromJson(const std::string& jsonStr, OH_TrafficFilter_RedirectRule& rule)
{
    std::string srcIpObj = ExtractNestedObject(jsonStr, "srcIp");
    if (srcIpObj.empty()) {
        return true;
    }

    std::string srcIpType = ExtractJsonValue(srcIpObj, "type");
    rule.srcIp.type = srcIpType.empty()
        ? OH_TRAFFICFILTER_IP_MATCH_ANY
        : static_cast<OH_TrafficFilter_IPMatchType>(static_cast<int32_t>(std::stoul(srcIpType)));
    OH_LOG_INFO(LOG_APP,
        "BuildRedirectRuleFromJson - src_ip type: %{public}d",
        rule.srcIp.type);

    std::string srcIpInvert = ExtractJsonValue(srcIpObj, "invert");
    rule.srcIp.invert = (srcIpInvert == "true");
    OH_LOG_INFO(LOG_APP,
        "BuildRedirectRuleFromJson - src_ip invert: %{public}s",
        srcIpInvert.c_str());

    return ParseIpMatchValueFromJson(srcIpObj, rule.srcIp.type, rule.srcIp, "src_ip");
}

bool ParseDstIpFromJson(const std::string& jsonStr, OH_TrafficFilter_RedirectRule& rule)
{
    std::string dstIpObj = ExtractNestedObject(jsonStr, "dstIp");
    if (dstIpObj.empty()) {
        return true;
    }

    std::string dstIpType = ExtractJsonValue(dstIpObj, "type");
    rule.dstIp.type = dstIpType.empty()
        ? OH_TRAFFICFILTER_IP_MATCH_SINGLE
        : static_cast<OH_TrafficFilter_IPMatchType>(static_cast<int32_t>(std::stoul(dstIpType)));
    OH_LOG_INFO(LOG_APP,
        "BuildRedirectRuleFromJson - dst_ip type: %{public}d",
        rule.dstIp.type);
    rule.dstIp.invert = false;

    return ParseIpMatchValueFromJson(dstIpObj, rule.dstIp.type, rule.dstIp, "dst_ip");
}

static bool ParsePortMatchSingle(const std::string& portObj,
    OH_TrafficFilter_PortMatch& portMatch, uint16_t defaultSinglePort, const std::string& label)
{
    std::string singlePortStr = ExtractJsonValue(portObj, "single");
    portMatch.value.single = singlePortStr.empty()
        ? defaultSinglePort
        : static_cast<uint16_t>(std::stoi(singlePortStr));
    OH_LOG_INFO(LOG_APP,
        "BuildRedirectRuleFromJson - %{public}s SINGLE: %{public}u",
        label.c_str(), portMatch.value.single);
    return true;
}

static bool ParsePortMatchRange(const std::string& portObj,
    OH_TrafficFilter_PortMatch& portMatch, const std::string& label)
{
    std::string startPortStr = ExtractJsonValue(portObj, "startPort");
    std::string endPortStr = ExtractJsonValue(portObj, "endPort");
    portMatch.value.range.startPort = startPortStr.empty()
        ? PORT_MIN_VALUE
        : static_cast<uint16_t>(std::stoi(startPortStr));
    portMatch.value.range.endPort = endPortStr.empty()
        ? PORT_MAX_VALUE
        : static_cast<uint16_t>(std::stoi(endPortStr));
    OH_LOG_INFO(LOG_APP,
        "BuildRedirectRuleFromJson - %{public}s RANGE: %{public}u - %{public}u",
        label.c_str(), portMatch.value.range.startPort,
        portMatch.value.range.endPort);
    return true;
}

static bool ParsePortMatchMulti(const std::string& portObj,
    OH_TrafficFilter_PortMatch& portMatch, const std::string& label)
{
    std::string multiPortArrayStr = ExtractArray(portObj, "multi");
    if (multiPortArrayStr.empty()) {
        OH_LOG_ERROR(LOG_APP,
            "BuildRedirectRuleFromJson - %{public}s MULTI type but no multi array found",
            label.c_str());
        return false;
    }
    if (!ParsePortMultiArray(multiPortArrayStr, portMatch)) {
        OH_LOG_ERROR(LOG_APP,
            "BuildRedirectRuleFromJson - Failed to parse %{public}s MULTI array",
            label.c_str());
        return false;
    }
    OH_LOG_INFO(LOG_APP,
        "BuildRedirectRuleFromJson - %{public}s MULTI parsed, count=%{public}u",
        label.c_str(), portMatch.value.multi.portCount);
    return true;
}

static bool ParsePortMatchValueFromJson(const std::string& portObj,
    OH_TrafficFilter_PortMatchType type, OH_TrafficFilter_PortMatch& portMatch,
    uint16_t defaultSinglePort, const std::string& label)
{
    switch (type) {
        case OH_TRAFFICFILTER_PORT_MATCH_SINGLE:
            return ParsePortMatchSingle(portObj, portMatch, defaultSinglePort, label);
        case OH_TRAFFICFILTER_PORT_MATCH_RANGE:
            return ParsePortMatchRange(portObj, portMatch, label);
        case OH_TRAFFICFILTER_PORT_MATCH_MULTI:
            return ParsePortMatchMulti(portObj, portMatch, label);
        default:
            return true;
    }
}

bool ParseSrcPortFromJson(const std::string& jsonStr, OH_TrafficFilter_RedirectRule& rule)
{
    std::string srcPortObj = ExtractNestedObject(jsonStr, "srcPort");
    if (srcPortObj.empty()) {
        return true;
    }

    std::string srcPortType = ExtractJsonValue(srcPortObj, "type");
    rule.srcPort.type = srcPortType.empty() ? OH_TRAFFICFILTER_PORT_MATCH_ANY
        : static_cast<OH_TrafficFilter_PortMatchType>(static_cast<int32_t>(std::stoul(srcPortType)));
    OH_LOG_INFO(LOG_APP,
        "BuildRedirectRuleFromJson - src_port type: %{public}d", rule.srcPort.type);

    std::string srcPortInvert = ExtractJsonValue(srcPortObj, "invert");
    rule.srcPort.invert = (srcPortInvert == "true");

    return ParsePortMatchValueFromJson(srcPortObj, rule.srcPort.type, rule.srcPort,
                                       PORT_MIN_VALUE, "src_port");
}

bool ParseDstPortFromJson(const std::string& jsonStr, OH_TrafficFilter_RedirectRule& rule)
{
    std::string dstPortObj = ExtractNestedObject(jsonStr, "dstPort");
    if (dstPortObj.empty()) {
        return true;
    }

    std::string dstPortType = ExtractJsonValue(dstPortObj, "type");
    rule.dstPort.type = dstPortType.empty()
        ? OH_TRAFFICFILTER_PORT_MATCH_SINGLE
        : static_cast<OH_TrafficFilter_PortMatchType>(static_cast<int32_t>(std::stoul(dstPortType)));
    OH_LOG_INFO(LOG_APP,
        "BuildRedirectRuleFromJson - dst_port type: %{public}d",
        rule.dstPort.type);
    rule.dstPort.invert = false;

    return ParsePortMatchValueFromJson(dstPortObj, rule.dstPort.type, rule.dstPort,
                                       DEFAULT_HTTP_PORT, "dst_port");
}

bool ParseInterfaceFromJson(
    const std::string& jsonStr,
    const std::string& key,
    OH_TrafficFilter_InterfaceMatch& interfaceMatch,
    const std::string& label)
{
    std::string ifObj = ExtractNestedObject(jsonStr, key);
    if (ifObj.empty()) {
        return true;
    }

    interfaceMatch.enabled = (ExtractJsonValue(ifObj, "enabled") == "true");
    interfaceMatch.invert = (ExtractJsonValue(ifObj, "invert") == "true");
    interfaceMatch.isPrefix = (ExtractJsonValue(ifObj, "isPrefix") == "true");
    std::string ifName = ExtractJsonValue(ifObj, "ifName");
    strncpy(interfaceMatch.ifName, ifName.c_str(), INTERFACE_NAME_MAX_LEN);
    OH_LOG_INFO(LOG_APP,
        "BuildRedirectRuleFromJson - %{public}s: enabled=%{public}s, invert=%{public}s, "
        "isPrefix=%{public}s, name=%{public}s",
        label.c_str(),
        interfaceMatch.enabled ? "true" : "false",
        interfaceMatch.invert ? "true" : "false",
        interfaceMatch.isPrefix ? "true" : "false",
        ifName.c_str());
    return true;
}

bool ParseUidRangeFromJson(const std::string& jsonStr, OH_TrafficFilter_RedirectRule& rule)
{
    std::string uidStartStr = ExtractJsonValue(jsonStr, "uidStart");
    std::string uidEndStr = ExtractJsonValue(jsonStr, "uidEnd");
    rule.uidStart = uidStartStr.empty() ? UID_ANY : std::stoul(uidStartStr);
    rule.uidEnd = uidEndStr.empty() ? UID_ANY : std::stoul(uidEndStr);
    OH_LOG_INFO(LOG_APP,
        "BuildRedirectRuleFromJson - UID range: %{public}u - %{public}u",
        rule.uidStart, rule.uidEnd);
    return true;
}

bool ParseProxyFromJson(const std::string& jsonStr, OH_TrafficFilter_RedirectRule& rule)
{
    std::string proxyIpObj = ExtractNestedObject(jsonStr, "proxyIp");
    if (!proxyIpObj.empty()) {
        if (!FillTrafficIpFromJsonObject(proxyIpObj, rule.proxyIp, "proxy_ip")) {
            return false;
        }
        OH_LOG_INFO(LOG_APP,
            "BuildRedirectRuleFromJson - proxy_ip parsed, family=%{public}d",
            rule.proxyIp.family);
    }

    std::string proxyPortStr = ExtractJsonValue(jsonStr, "proxyPort");
    rule.proxyPort = proxyPortStr.empty()
        ? DEFAULT_PROXY_PORT
        : static_cast<uint16_t>(std::stoi(proxyPortStr));
    OH_LOG_INFO(LOG_APP,
        "BuildRedirectRuleFromJson - proxy_port: %{public}u",
        rule.proxyPort);
    return true;
}

int32_t BuildRedirectRuleFromJson(const std::string& jsonStr, OH_TrafficFilter_RedirectRule& rule)
{
    memset(&rule, 0, sizeof(rule));
    rule.size = sizeof(OH_TrafficFilter_RedirectRule);
    OH_LOG_INFO(LOG_APP, "BuildRedirectRuleFromJson - Starting to parse JSON");

    try {
        rule.protocol = PROTOCOL_TCP;

        std::string priorityStr = ExtractJsonValue(jsonStr, "priority");
        rule.priority = priorityStr.empty() ? DEFAULT_PRIORITY : std::stoul(priorityStr);
        OH_LOG_INFO(LOG_APP,
            "BuildRedirectRuleFromJson - Priority: %{public}u",
            rule.priority);

        std::string hookPointStr = ExtractJsonValue(jsonStr, "hookPoint");
        rule.hookPoint = hookPointStr.empty()
            ? OH_TRAFFICFILTER_HOOK_PREROUTING
            : static_cast<OH_TrafficFilter_HookPoint>(static_cast<int32_t>(std::stoi(hookPointStr)));
        OH_LOG_INFO(LOG_APP,
            "BuildRedirectRuleFromJson - Hook point: %{public}d",
            rule.hookPoint);

        if (!ParseSrcIpFromJson(jsonStr, rule)) {
            return OH_TRAFFICFILTER_ERROR_INVALID_PARAM;
        }
        if (!ParseSrcPortFromJson(jsonStr, rule)) {
            return OH_TRAFFICFILTER_ERROR_INVALID_PARAM;
        }
        if (!ParseDstIpFromJson(jsonStr, rule)) {
            return OH_TRAFFICFILTER_ERROR_INVALID_PARAM;
        }
        if (!ParseDstPortFromJson(jsonStr, rule)) {
            return OH_TRAFFICFILTER_ERROR_INVALID_PARAM;
        }
        if (!ParseInterfaceFromJson(jsonStr, "inInterface", rule.inInterface, "in_interface")) {
            return OH_TRAFFICFILTER_ERROR_INVALID_PARAM;
        }
        if (!ParseInterfaceFromJson(jsonStr, "outInterface", rule.outInterface, "out_interface")) {
            return OH_TRAFFICFILTER_ERROR_INVALID_PARAM;
        }
        if (!ParseUidRangeFromJson(jsonStr, rule)) {
            return OH_TRAFFICFILTER_ERROR_INVALID_PARAM;
        }
        if (!ParseProxyFromJson(jsonStr, rule)) {
            return OH_TRAFFICFILTER_ERROR_INVALID_PARAM;
        }

        OH_LOG_INFO(LOG_APP, "BuildRedirectRuleFromJson - Successfully parsed rule");
        return OH_TRAFFICFILTER_OK;
    } catch (...) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_DOMAIN_DEFAULT,
            "BuildRedirectRuleFromJson", "Parse error - exception caught");
        return OH_TRAFFICFILTER_ERROR_INVALID_PARAM;
    }
}

// [Start destroy_redirect_rule]
static napi_value DestroyRedirectorNapi(napi_env env, napi_callback_info info)
{
    if (g_redirector != nullptr) {
        OH_TrafficFilter_DestroyRedirector(g_redirector);
        g_redirector = nullptr;

        char msg[] = "SUCCESS: Redirector destroyed";
        napi_value result;
        napi_create_string_utf8(env, msg, strlen(msg), &result);
        return result;
    }
    char msg[] = "WARNING: No redirector to destroy";
    napi_value result;
    napi_create_string_utf8(env, msg, strlen(msg), &result);
    return result;
}
// [End destroy_redirect_rule]

// [Start add_redirect_rule]
static napi_value AddRedirectRuleNapi(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    if (argc <= 0) {
        char msg[] = "ERROR: ruleJson parameter required";
        napi_value result;
        napi_create_string_utf8(env, msg, strlen(msg), &result);
        return result;
    }

    size_t jsonLen = 0;
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &jsonLen);
    char* jsonStr = new char[jsonLen + 1];
    napi_get_value_string_utf8(env, args[0], jsonStr, jsonLen + 1, &jsonLen);
    std::string json(jsonStr);
    delete[] jsonStr;

    OH_TrafficFilter_RedirectRule rule;
    int32_t parseRet = BuildRedirectRuleFromJson(json, rule);
    if (parseRet != OH_TRAFFICFILTER_OK) {
        char msg[BUFFER_SIZE];
        napi_value result;
        napi_create_string_utf8(env, msg, strlen(msg), &result);
        return result;
    }

    int32_t ret = OH_TrafficFilter_AddRedirectRule(g_redirector, &rule);

    char msg[BUFFER_SIZE * 2];
    napi_value result;
    napi_create_string_utf8(env, msg, strlen(msg), &result);
    return result;
}
// [End add_redirect_rule]

// [Start clear_redirect_rule]
static napi_value ClearRedirectRuleNapi(napi_env env, napi_callback_info info)
{
    if (g_redirector == nullptr) {
        char msg[] = "ERROR: No redirector exists";
        napi_value result;
        napi_create_string_utf8(env, msg, strlen(msg), &result);
        return result;
    }

    int32_t ret = OH_TrafficFilter_ClearRedirectRule(g_redirector);

    char msg[BUFFER_SIZE * 2];
    napi_value result;
    napi_create_string_utf8(env, msg, strlen(msg), &result);
    return result;
}
// [End clear_redirect_rule]

static std::string BuildBasicRuleTemplate()
{
    std::ostringstream oss;
    oss << "{"
        << "\"priority\":" << DEFAULT_PRIORITY << ","
        << "\"hookPoint\":" << static_cast<int>(OH_TRAFFICFILTER_HOOK_PREROUTING) << ","
        << "\"protocol\":" << PROTOCOL_TCP << ","
        << "\"srcIp\":{\"type\":" << static_cast<int>(OH_TRAFFICFILTER_IP_MATCH_ANY)
        << ",\"invert\":false},"
        << "\"srcPort\":{\"type\":" << static_cast<int>(OH_TRAFFICFILTER_PORT_MATCH_ANY)
        << ",\"invert\":false},"
        << "\"dstIp\":{\"type\":" << static_cast<int>(OH_TRAFFICFILTER_IP_MATCH_SINGLE)
        << ",\"invert\":false,\"value\":{\"single\":{\"family\":"
        << static_cast<int>(OH_TRAFFICFILTER_IP_FAMILY_V4)
        << ",\"addr\":\"192.168.1.100\"}},\"dstPort\":{\"type\":"
        << static_cast<int>(OH_TRAFFICFILTER_PORT_MATCH_SINGLE)
        << ",\"invert\":false,\"value\":{\"single\":" << DEFAULT_HTTP_PORT << "}}},"
        << "\"inInterface\":{\"enabled\":false,\"invert\":false,\"isPrefix\":false,\"ifName\":\"\"},"
        << "\"outInterface\":{\"enabled\":false,\"invert\":false,\"isPrefix\":false,\"ifName\":\"\"},"
        << "\"uidStart\":" << UID_ANY << ","
        << "\"uidEnd\":" << UID_ANY << ","
        << "\"proxyIp\":{\"family\":" << static_cast<int>(OH_TRAFFICFILTER_IP_FAMILY_V4)
        << ",\"addr\":\"127.0.0.1\"},"
        << "\"proxyPort\":" << DEFAULT_PROXY_PORT
        << "}";
    return oss.str();
}

static std::string BuildFullRuleTemplate()
{
    std::ostringstream oss;
    oss << "{"
        << "\"priority\":" << DEFAULT_PRIORITY << ","
        << "\"hookPoint\":" << static_cast<int>(OH_TRAFFICFILTER_HOOK_PREROUTING) << ","
        << "\"protocol\":" << PROTOCOL_TCP << ","
        << "\"srcIp\":{\"type\":" << static_cast<int>(OH_TRAFFICFILTER_IP_MATCH_CIDR)
        << ",\"invert\":false,\"value\":{\"cidr\":{\"family\":"
        << static_cast<int>(OH_TRAFFICFILTER_IP_FAMILY_V4)
        << ",\"addr\":\"192.168.1.0\",\"prefix\":" << static_cast<int>(IPV4_DEFAULT_PREFIX) << "}}},"
        << "\"srcPort\":{\"type\":" << static_cast<int>(OH_TRAFFICFILTER_PORT_MATCH_RANGE)
        << ",\"invert\":false,\"value\":{\"range\":{\"startPort\":" << DEFAULT_HTTP_PORT
        << ",\"endPort\":" << HTTPS_PORT << "}}},"
        << "\"dstIp\":{\"type\":" << static_cast<int>(OH_TRAFFICFILTER_IP_MATCH_RANGE)
        << ",\"invert\":false,\"value\":{\"range\":{\"family\":"
        << static_cast<int>(OH_TRAFFICFILTER_IP_FAMILY_V4)
        << ",\"startAddr\":\"192.168.1.1\",\"endAddr\":\"192.168.1.100\"}},\"dstPort\":{\"type\":"
        << static_cast<int>(OH_TRAFFICFILTER_PORT_MATCH_MULTI)
        << ",\"invert\":false,\"value\":{\"multi\":["
        << DEFAULT_HTTP_PORT << "," << HTTPS_PORT << "," << DEFAULT_PROXY_PORT << "]}},"
        << "\"inInterface\":{\"enabled\":true,\"invert\":false,\"isPrefix\":false,\"ifName\":\"eth0\"},"
        << "\"outInterface\":{\"enabled\":false,\"invert\":false,\"isPrefix\":false,\"ifName\":\"\"},"
        << "\"uidStart\":" << UID_ANY << ","
        << "\"uidEnd\":" << UID_ANY << ","
        << "\"proxyIp\":{\"family\":" << static_cast<int>(OH_TRAFFICFILTER_IP_FAMILY_V4)
        << ",\"addr\":\"127.0.0.1\"},"
        << "\"proxyPort\":" << DEFAULT_PROXY_PORT
        << "}";
    return oss.str();
}

static napi_value GetRuleTemplateNapi(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    std::string templateType = "basic";
    if (argc > 0) {
        size_t len = 0;
        napi_get_value_string_utf8(env, args[0], nullptr, 0, &len);
        char* typeStr = new char[len + 1];
        napi_get_value_string_utf8(env, args[0], typeStr, len + 1, &len);
        templateType = std::string(typeStr);
        delete[] typeStr;
    }

    std::string templateJson = "{}";
    if (templateType == "basic") {
        templateJson = BuildBasicRuleTemplate();
    } else if (templateType == "full") {
        templateJson = BuildFullRuleTemplate();
    }

    napi_value result;
    napi_create_string_utf8(env, templateJson.c_str(), templateJson.length(), &result);
    return result;
}

// [Start query_process]
struct QueryArgs {
    std::string srcIp;
    std::string dstIp;
    uint32_t srcPort = 0;
    uint32_t dstPort = 0;
    uint32_t protocol = PROTOCOL_TCP;
};

static std::string ParseQueryArgsFromNapi(napi_env env, const napi_value args[], QueryArgs& queryArgs)
{
    int ardIdxDstIp = 2;
    int argIdxDstPort = 3;
    int argIdxProtocol = 4;
    size_t srcIpLen = 0;
    size_t dstIpLen = 0;

    napi_get_value_string_utf8(env, args[0], nullptr, 0, &srcIpLen);
    napi_get_value_string_utf8(env, args[ardIdxDstIp], nullptr, 0, &dstIpLen);

    std::vector<char> srcIpBuf(srcIpLen + 1);
    std::vector<char> dstIpBuf(dstIpLen + 1);

    napi_get_value_string_utf8(env, args[0], srcIpBuf.data(), srcIpBuf.size(), &srcIpLen);
    napi_get_value_string_utf8(env, args[ardIdxDstIp], dstIpBuf.data(), dstIpBuf.size(), &dstIpLen);

    queryArgs.srcIp = srcIpBuf.data();
    queryArgs.dstIp = dstIpBuf.data();

    napi_get_value_uint32(env, args[1], &queryArgs.srcPort);
    napi_get_value_uint32(env, args[argIdxDstPort], &queryArgs.dstPort);
    napi_get_value_uint32(env, args[argIdxProtocol], &queryArgs.protocol);

    if (queryArgs.srcPort > PORT_MAX_VALUE || queryArgs.dstPort > PORT_MAX_VALUE) {
        return "ERROR: Invalid port value";
    }

    if (queryArgs.protocol != OH_TRAFFICFILTER_PROTO_TCP && queryArgs.protocol != OH_TRAFFICFILTER_PROTO_UDP) {
        return "ERROR: Invalid protocol value (must be TCP=6 or UDP=17)";
    }

    return "";
}

static std::string BuildQueryConnectionInfo(
    napi_env env,
    const napi_value args[],
    OH_TrafficFilter_ConnectionInfo& connectionInfo)
{
    QueryArgs queryArgs;
    std::string error = ParseQueryArgsFromNapi(env, args, queryArgs);
    if (!error.empty()) {
        return error;
    }

    OH_LOG_INFO(LOG_APP,
        "QueryProcessNapi - srcIp=%{public}s, srcPort=%{public}u, dstIp=%{public}s, "
        "dstPort=%{public}u, protocol=%{public}u",
        queryArgs.srcIp.c_str(), queryArgs.srcPort,
        queryArgs.dstIp.c_str(), queryArgs.dstPort, queryArgs.protocol);

    memset(&connectionInfo, 0, sizeof(connectionInfo));
    connectionInfo.size = sizeof(OH_TrafficFilter_ConnectionInfo);

    connectionInfo.srcIp.family = DetectIPFamilyFromAddr(queryArgs.srcIp);
    if (!ParseIPAddressByFamily(queryArgs.srcIp, connectionInfo.srcIp.family,
        connectionInfo.srcIp.addr)) {
        return "ERROR: Invalid source IP address";
    }
    connectionInfo.src_port = static_cast<uint16_t>(queryArgs.srcPort);

    connectionInfo.dstIp.family = DetectIPFamilyFromAddr(queryArgs.dstIp);
    if (!ParseIPAddressByFamily(queryArgs.dstIp, connectionInfo.dstIp.family,
        connectionInfo.dstIp.addr)) {
        return "ERROR: Invalid destination IP address";
    }
    connectionInfo.dstPort = static_cast<uint16_t>(queryArgs.dstPort);

    connectionInfo.protocol = static_cast<uint8_t>(queryArgs.protocol);
    return "";
}

static napi_value CreateQueryResponseNapi(
    napi_env env,
    int32_t ret,
    const OH_TrafficFilter_ProcessInfo& processInfo)
{
    char response[BUFFER_SIZE * 2];
    if (ret == OH_TRAFFICFILTER_OK) {
        OH_LOG_INFO(LOG_APP,
            "QueryProcessNapi - Process found: pid=%{public}u, uid=%{public}u",
            processInfo.pid, processInfo.uid);
    } else if (ret == OH_TRAFFICFILTER_ERROR_NOT_FOUND) {
        OH_LOG_INFO(LOG_APP, "QueryProcessNapi - Process not found");
    } else if (ret == OH_TRAFFICFILTER_ERROR_INVALID_PARAM) {
        OH_LOG_ERROR(LOG_APP, "QueryProcessNapi - Invalid parameters");
    } else {
        OH_LOG_ERROR(LOG_APP, "QueryProcessNapi - Query failed with ret=%{public}d", ret);
    }

    napi_value result;
    napi_create_string_utf8(env, response, strlen(response), &result);
    return result;
}

static napi_value QueryProcessNapi(napi_env env, napi_callback_info info)
{
    size_t argc = REQUIRED_ARG_COUNT;
    napi_value args[REQUIRED_ARG_COUNT] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    auto CreateStringResult = [env](const char* msg) -> napi_value {
        napi_value result;
        napi_create_string_utf8(env, msg, strlen(msg), &result);
        return result;
    };

    if (argc < REQUIRED_ARG_COUNT) {
        return CreateStringResult("ERROR: Missing required parameters");
    }

    OH_TrafficFilter_ConnectionInfo connectionInfo;
    std::string error = BuildQueryConnectionInfo(env, args, connectionInfo);
    if (!error.empty()) {
        return CreateStringResult(error.c_str());
    }

    OH_TrafficFilter_ProcessInfo processInfo;
    memset(&processInfo, 0, sizeof(processInfo));
    processInfo.size = sizeof(OH_TrafficFilter_ProcessInfo);

    int32_t ret = OH_TrafficFilter_QueryProcess(&connectionInfo, &processInfo);

    return CreateQueryResponseNapi(env, ret, processInfo);
}
// [End query_process]

EXTERN_C_START
// [Start init_exports]
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "createRedirector", nullptr, CreateRedirectorNapi, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "destroyRedirector", nullptr, DestroyRedirectorNapi, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "addRedirectRule", nullptr, AddRedirectRuleNapi, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "clearRedirectRule", nullptr, ClearRedirectRuleNapi, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "getRuleTemplate", nullptr, GetRuleTemplateNapi, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "queryProcess", nullptr, QueryProcessNapi, nullptr, nullptr, nullptr, napi_default, nullptr }
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
