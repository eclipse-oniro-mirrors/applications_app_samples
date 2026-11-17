/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <algorithm>
#include <chrono>
#include <array>
#include <iomanip>
#include <locale>
#include <fstream>
#include <iostream>
#include <map>
#include <mutex>
#include <sstream>
#include <string>
#include <thread>
#include <vector>
#include "napi/native_api.h"
#include "hilog/log.h"
#include "mock_api.h"

constexpr int DEFAULT_ERROR_CODE = 401;
constexpr int DEFAULT_DATA_LENGTH = 3;
constexpr int DEFAULT_ACCURACY = 2;
constexpr uint32_t NAME_CAPACITY = 64;
constexpr int MAX_SENSOR_COUNT = 128;
constexpr int MAX_DATA_LENGTH = 64;
constexpr int MAX_SEED = 1000000;
constexpr float RESOLUTION_SCALE = 1024.0f;
constexpr float EVENT_DATA_SCALE = 4.0f;
constexpr int64_t MIN_INTERVAL_STEP = 1000;
constexpr int64_t NANOSECONDS_PER_SECOND = 1000000000;
constexpr size_t MAX_SCENARIO_LENGTH = 1024;
constexpr int LOG_DECIMAL_PLACES = 6;
constexpr int STANDALONE_ARG_COUNT = 2;
constexpr int EXIT_ARGUMENT_ERROR = 2;
constexpr int EXIT_OPEN_ERROR = 3;
constexpr int EXIT_READ_ERROR = 4;

struct Scenario {
    std::string mode;
    int count = 1;
    std::string fault;
    int failAt = 0;
    // Used by the standalone lifecycle probe; not exposed through scenario input.
    bool persistentFailure = false;
    int errorCode = DEFAULT_ERROR_CODE;
    int length = DEFAULT_DATA_LENGTH;
    int accuracy = DEFAULT_ACCURACY;
    int type = 1;
    int seed = 0;
    int nullEvent = 0;
    int nullData = 0;
};
struct Observation {
    std::vector<std::string> trace;
    std::vector<std::string> errors;
    std::vector<std::string> messages;
    std::map<std::string, int> calls;
    std::map<void *, std::string> resources;
    int violations = 0;
    int active = 0;
    int waitMs = 0;
    int configuredType = -1;
    int64_t configuredInterval = -1;
    int callbacks = 0;
    Sensor_EventCallback callback = nullptr;
};
static Scenario g_scenario;
static Observation g_observation;
static std::mutex g_scenarioMutex;
static Sensor_Info **g_allocatedInfos = nullptr;
static std::vector<int> g_sensorIndexes;
static std::vector<float> g_eventData;
static int g_fakeEvent = 0;

static bool Record(const std::string &name, const std::string &detail = "")
{
    int occurrence = g_observation.calls[name]++;
    g_observation.trace.push_back(name + detail);
    return g_scenario.fault == name && (g_scenario.persistentFailure || occurrence == g_scenario.failAt);
}
static void *Allocate(const std::string &kind)
{
    void *value = new int(0);
    g_observation.resources[value] = kind;
    return value;
}
static void Release(void *value, const std::string &kind)
{
    auto found = g_observation.resources.find(value);
    if (found == g_observation.resources.end() || found->second != kind) {
        g_observation.violations++;
        return;
    }
    if (kind == "subscriber" && g_observation.active != 0) {
        g_observation.violations++;
    }
    g_observation.resources.erase(found);
    delete static_cast<int *>(value);
}
static void CheckResource(const void *value, const std::string &kind)
{
    auto found = g_observation.resources.find(const_cast<void *>(value));
    if (found == g_observation.resources.end() || found->second != kind) {
        g_observation.violations++;
    }
}
namespace SensorTestStandard
{
using namespace ::std;
namespace this_thread
{
static void sleep_for(::std::chrono::milliseconds duration)
{
    Record("wait", ":" + ::std::to_string(duration.count()));
    g_observation.waitMs += static_cast<int>(duration.count());
}
} // namespace this_thread
} // namespace SensorTestStandard

namespace SensorSampleUnderTest
{
namespace std = SensorTestStandard;

template <typename T> static ::std::string LogValue(const T &value)
{
    ::std::ostringstream output;
    output.imbue(::std::locale::classic());
    output << ::std::fixed << ::std::setprecision(LOG_DECIMAL_PLACES) << value;
    return output.str();
}

// The included sample uses public decimal integers and fixed-point values only.
// Reject unsupported formats so a sample logging change fails the observation checks.
template <typename... Args>
static int SampleLog(LogType, LogLevel level, unsigned int, const char *, const char *format, const Args &...args)
{
    const ::std::array<::std::string, sizeof...(Args)> values = {LogValue(args)...};
    const ::std::string text(format);
    const ::std::string marker = "%{public}";
    ::std::string message;
    size_t argument = 0;
    for (size_t index = 0; index < text.size();) {
        if (text[index] != '%') {
            message += text[index++];
            continue;
        }
        if (text.compare(index, marker.size(), marker) != 0 || index + marker.size() >= text.size() ||
            (text[index + marker.size()] != 'd' && text[index + marker.size()] != 'f') || argument >= values.size()) {
            g_observation.violations++;
            return -1;
        }
        message += values[argument++];
        index += marker.size() + 1;
    }
    if (argument != values.size()) {
        g_observation.violations++;
        return -1;
    }
    if (level == LOG_ERROR) {
        g_observation.errors.push_back(message);
    } else {
        g_observation.messages.push_back(message);
    }
    return 0;
}

static void IgnoreSampleRegistration(napi_module *)
{
}

inline constexpr auto OH_LOG_Print = [](auto... arguments) {
    return SampleLog(arguments...);
};
inline constexpr auto napi_module_register = IgnoreSampleRegistration;

// Keep the sample constructor local to the test library. Its registration is ignored above.
#pragma GCC visibility push(hidden)
#include "../../main/cpp/oh_sensor_capi.cpp"
#pragma GCC visibility pop
} // namespace SensorSampleUnderTest

static int ReadInfo(Sensor_Info *sensor, const std::string &operation)
{
    int index = *reinterpret_cast<int *>(sensor);
    if (index < 0 || index >= g_scenario.count) {
        g_observation.violations++;
    }
    return Record(operation, ":" + std::to_string(index)) ? g_scenario.errorCode : 0;
}
Sensor_Result Mock_OH_Sensor_GetInfos(Sensor_Info **infos, uint32_t *count)
{
    bool failed = Record(infos == nullptr ? "count" : "infos");
    if (failed) {
        return static_cast<Sensor_Result>(g_scenario.errorCode);
    }
    if (infos != nullptr && (*count != static_cast<uint32_t>(g_scenario.count) || infos != g_allocatedInfos)) {
        g_observation.violations++;
    }
    *count = static_cast<uint32_t>(g_scenario.count);
    return SENSOR_SUCCESS;
}
Sensor_Info **Mock_OH_Sensor_CreateInfos(uint32_t count)
{
    if (Record("createInfos", ":" + std::to_string(count))) {
        return nullptr;
    }
    g_sensorIndexes.resize(count);
    g_allocatedInfos = new Sensor_Info *[std::max(1u, count)];
    g_observation.resources[g_allocatedInfos] = "infos";
    for (uint32_t index = 0; index < count; index++) {
        g_sensorIndexes[index] = static_cast<int>(index);
        g_allocatedInfos[index] = reinterpret_cast<Sensor_Info *>(&g_sensorIndexes[index]);
    }
    return g_allocatedInfos;
}
int32_t Mock_OH_Sensor_DestroyInfos(Sensor_Info **infos, uint32_t count)
{
    Record("destroyInfos", ":" + std::to_string(count));
    if (infos != g_allocatedInfos || count != static_cast<uint32_t>(g_scenario.count)) {
        g_observation.violations++;
    }
    g_observation.resources.erase(infos);
    delete[] infos;
    g_allocatedInfos = nullptr;
    return 0;
}
static int ReadName(Sensor_Info *sensor, char *value, uint32_t *length, const std::string &operation)
{
    int status = ReadInfo(sensor, operation);
    if (*length != NAME_CAPACITY) {
        g_observation.violations++;
    }
    if (status != 0) {
        return status;
    }
    std::string text(static_cast<size_t>(1 + g_scenario.seed % (NAME_CAPACITY - 1)), operation == "name" ? 'S' : 'V');
    if (*length < text.size() + 1) {
        g_observation.violations++;
        return DEFAULT_ERROR_CODE;
    }
    std::copy(text.begin(), text.end(), value);
    value[text.size()] = '\0';
    *length = static_cast<uint32_t>(text.size() + 1);
    return 0;
}
int32_t Mock_OH_SensorInfo_GetName(Sensor_Info *sensor, char *value, uint32_t *length)
{
    return ReadName(sensor, value, length, "name");
}
int32_t Mock_OH_SensorInfo_GetVendorName(Sensor_Info *sensor, char *value, uint32_t *length)
{
    return ReadName(sensor, value, length, "vendor");
}
int32_t Mock_OH_SensorInfo_GetType(Sensor_Info *sensor, Sensor_Type *value)
{
    int status = ReadInfo(sensor, "infoType");
    if (status == 0) {
        *value = static_cast<Sensor_Type>(g_scenario.type);
    }
    return status;
}
int32_t Mock_OH_SensorInfo_GetResolution(Sensor_Info *sensor, float *value)
{
    int status = ReadInfo(sensor, "resolution");
    if (status == 0) {
        *value = static_cast<float>(g_scenario.seed + 1) / RESOLUTION_SCALE;
    }
    return status;
}
int32_t Mock_OH_SensorInfo_GetMinSamplingInterval(Sensor_Info *sensor, int64_t *value)
{
    int status = ReadInfo(sensor, "minimum");
    if (status == 0) {
        *value = static_cast<int64_t>(g_scenario.seed + 1) * MIN_INTERVAL_STEP;
    }
    return status;
}
int32_t Mock_OH_SensorInfo_GetMaxSamplingInterval(Sensor_Info *sensor, int64_t *value)
{
    int status = ReadInfo(sensor, "maximum");
    if (status == 0) {
        *value = static_cast<int64_t>(g_scenario.seed + 1) * NANOSECONDS_PER_SECOND;
    }
    return status;
}
Sensor_Subscriber *Mock_OH_Sensor_CreateSubscriber(void)
{
    if (Record("createSubscriber")) {
        return nullptr;
    }
    return reinterpret_cast<Sensor_Subscriber *>(Allocate("subscriber"));
}
int32_t Mock_OH_SensorSubscriber_SetCallback(Sensor_Subscriber *subscriber, const Sensor_EventCallback callback)
{
    CheckResource(subscriber, "subscriber");
    if (Record("setCallback")) {
        return g_scenario.errorCode;
    }
    if (callback == nullptr) {
        g_observation.violations++;
    }
    g_observation.callback = callback;
    return 0;
}
Sensor_SubscriptionId *Mock_OH_Sensor_CreateSubscriptionId(void)
{
    if (Record("createId")) {
        return nullptr;
    }
    return reinterpret_cast<Sensor_SubscriptionId *>(Allocate("id"));
}
int32_t Mock_OH_SensorSubscriptionId_SetType(Sensor_SubscriptionId *id, const Sensor_Type type)
{
    CheckResource(id, "id");
    g_observation.configuredType = static_cast<int>(type);
    return Record("setType", ":" + std::to_string(type)) ? g_scenario.errorCode : 0;
}
Sensor_SubscriptionAttribute *Mock_OH_Sensor_CreateSubscriptionAttribute(void)
{
    if (Record("createAttribute")) {
        return nullptr;
    }
    return reinterpret_cast<Sensor_SubscriptionAttribute *>(Allocate("attribute"));
}
int32_t Mock_OH_SensorSubscriptionAttribute_SetSamplingInterval(Sensor_SubscriptionAttribute *attribute,
                                                                const int64_t interval)
{
    CheckResource(attribute, "attribute");
    g_observation.configuredInterval = interval;
    return Record("setInterval", ":" + std::to_string(interval)) ? g_scenario.errorCode : 0;
}
Sensor_Result Mock_OH_Sensor_Subscribe(const Sensor_SubscriptionId *id, const Sensor_SubscriptionAttribute *attribute,
                                       const Sensor_Subscriber *subscriber)
{
    CheckResource(id, "id");
    CheckResource(attribute, "attribute");
    CheckResource(subscriber, "subscriber");
    if (Record("subscribe")) {
        return static_cast<Sensor_Result>(g_scenario.errorCode);
    }
    g_observation.active++;
    if (g_observation.callback != nullptr) {
        g_observation.callbacks++;
        g_observation.callback(g_scenario.nullEvent ? nullptr : reinterpret_cast<Sensor_Event *>(&g_fakeEvent));
    }
    return SENSOR_SUCCESS;
}
Sensor_Result Mock_OH_Sensor_Unsubscribe(const Sensor_SubscriptionId *id, const Sensor_Subscriber *subscriber)
{
    CheckResource(id, "id");
    CheckResource(subscriber, "subscriber");
    if (Record("unsubscribe")) {
        return static_cast<Sensor_Result>(g_scenario.errorCode);
    }
    g_observation.active--;
    return SENSOR_SUCCESS;
}
int32_t Mock_OH_Sensor_DestroySubscriptionAttribute(Sensor_SubscriptionAttribute *attribute)
{
    Record("destroyAttribute");
    Release(attribute, "attribute");
    return 0;
}
int32_t Mock_OH_Sensor_DestroySubscriptionId(Sensor_SubscriptionId *id)
{
    Record("destroyId");
    Release(id, "id");
    return 0;
}
int32_t Mock_OH_Sensor_DestroySubscriber(Sensor_Subscriber *subscriber)
{
    Record("destroySubscriber");
    Release(subscriber, "subscriber");
    return 0;
}
int32_t Mock_OH_SensorEvent_GetTimestamp(Sensor_Event *event, int64_t *value)
{
    if (event == nullptr) {
        g_observation.violations++;
    }
    if (Record("timestamp")) {
        return g_scenario.errorCode;
    }
    *value = static_cast<int64_t>(g_scenario.seed) * NANOSECONDS_PER_SECOND;
    return 0;
}
int32_t Mock_OH_SensorEvent_GetType(Sensor_Event *event, Sensor_Type *value)
{
    if (event == nullptr) {
        g_observation.violations++;
    }
    if (Record("eventType")) {
        return g_scenario.errorCode;
    }
    *value = static_cast<Sensor_Type>(g_scenario.type);
    return 0;
}
int32_t Mock_OH_SensorEvent_GetAccuracy(Sensor_Event *event, Sensor_Accuracy *value)
{
    if (event == nullptr) {
        g_observation.violations++;
    }
    if (Record("accuracy")) {
        return g_scenario.errorCode;
    }
    *value = static_cast<Sensor_Accuracy>(g_scenario.accuracy);
    return 0;
}
int32_t Mock_OH_SensorEvent_GetData(Sensor_Event *event, float **value, uint32_t *length)
{
    if (event == nullptr) {
        g_observation.violations++;
    }
    if (Record("data")) {
        return g_scenario.errorCode;
    }
    *value = g_scenario.nullData ? nullptr : g_eventData.data();
    *length = static_cast<uint32_t>(g_scenario.length);
    return 0;
}
static std::string Join(const std::vector<std::string> &parts)
{
    std::string result;
    for (const std::string &part : parts) {
        if (!result.empty()) {
            result += "|";
        }
        result += part;
    }
    return result;
}
static std::string Quote(const std::string &text)
{
    std::string result = "\"";
    for (char ch : text) {
        if (ch == '\\' || ch == '"') {
            result += '\\';
        }
        result += ch;
    }
    return result + "\"";
}
static std::string RunScenario(const std::string &input)
{
    std::lock_guard<std::mutex> guard(g_scenarioMutex);
    g_scenario = Scenario();
    g_observation = Observation();
    std::istringstream stream(input);
    stream >> g_scenario.mode >> g_scenario.count >> g_scenario.fault >> g_scenario.failAt >> g_scenario.errorCode >>
        g_scenario.length >> g_scenario.accuracy >> g_scenario.type >> g_scenario.seed >> g_scenario.nullEvent >>
        g_scenario.nullData;
    std::string trailing;
    if (!stream || (stream >> trailing) || g_scenario.count < 0 || g_scenario.count > MAX_SENSOR_COUNT ||
        g_scenario.length < 0 || g_scenario.length > MAX_DATA_LENGTH || g_scenario.seed < 0 ||
        g_scenario.seed > MAX_SEED ||
        (g_scenario.mode != "info" && g_scenario.mode != "subscription" && g_scenario.mode != "callback")) {
        return "{\"inputError\":true}";
    }
    g_eventData.resize(std::max(1, g_scenario.length));
    for (int i = 0; i < g_scenario.length; i++) {
        g_eventData[i] = static_cast<float>(g_scenario.seed - i) / EVENT_DATA_SCALE;
    }
    if (g_scenario.mode == "info") {
        SensorSampleUnderTest::GetSensorInfos(nullptr, nullptr);
    }
    if (g_scenario.mode == "subscription") {
        SensorSampleUnderTest::Subscriber(nullptr, nullptr);
    }
    if (g_scenario.mode == "callback") {
        g_observation.callbacks++;
        SensorSampleUnderTest::SensorDataCallbackImpl(
            g_scenario.nullEvent ? nullptr : reinterpret_cast<Sensor_Event *>(&g_fakeEvent));
    }
    std::ostringstream result;
    result << "{\"trace\":" << Quote(Join(g_observation.trace));
    result << ",\"errors\":" << Quote(Join(g_observation.errors));
    result << ",\"messages\":" << Quote(Join(g_observation.messages));
    result << ",\"liveResources\":" << g_observation.resources.size();
    result << ",\"activeSubscriptions\":" << g_observation.active;
    result << ",\"violations\":" << g_observation.violations;
    result << ",\"waitMs\":" << g_observation.waitMs;
    result << ",\"configuredType\":" << g_observation.configuredType;
    result << ",\"configuredInterval\":" << g_observation.configuredInterval;
    result << ",\"callbacks\":" << g_observation.callbacks << "}";
    for (auto &resource : g_observation.resources) {
        if (resource.second == "infos") {
            delete[] reinterpret_cast<Sensor_Info **>(resource.first);
        } else {
            delete static_cast<int *>(resource.first);
        }
    }
    g_allocatedInfos = nullptr;
    return result.str();
}
#ifdef SENSOR_STANDALONE
int main(int argc, char **argv)
{
    if (argc != STANDALONE_ARG_COUNT) {
        return EXIT_ARGUMENT_ERROR;
    }
    std::ifstream inputs(argv[1]);
    if (!inputs) {
        return EXIT_OPEN_ERROR;
    }
    std::string line;
    while (std::getline(inputs, line)) {
        if (!line.empty() && line.back() == '\r') {
            line.pop_back();
        }
        if (!line.empty()) {
            std::cout << RunScenario(line) << std::endl;
        }
    }
    return inputs.bad() ? EXIT_READ_ERROR : 0;
}
#else
static napi_value RunBridge(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argument;
    if (napi_get_cb_info(env, info, &argc, &argument, nullptr, nullptr) != napi_ok || argc != 1) {
        napi_throw_type_error(env, nullptr, "Exactly one scenario string is required");
        return nullptr;
    }
    size_t length = 0;
    if (napi_get_value_string_utf8(env, argument, nullptr, 0, &length) != napi_ok || length > MAX_SCENARIO_LENGTH) {
        napi_throw_type_error(env, nullptr, "A bounded scenario string is required");
        return nullptr;
    }
    std::vector<char> input(length + 1);
    if (napi_get_value_string_utf8(env, argument, input.data(), input.size(), &length) != napi_ok) {
        napi_throw_type_error(env, nullptr, "Cannot read scenario string");
        return nullptr;
    }
    std::string result = RunScenario(std::string(input.data(), length));
    napi_value output;
    if (napi_create_string_utf8(env, result.c_str(), result.size(), &output) != napi_ok) {
        napi_throw_error(env, nullptr, "Cannot create scenario result");
        return nullptr;
    }
    return output;
}
EXTERN_C_START
static napi_value TestInit(napi_env env, napi_value exports)
{
    napi_property_descriptor method = {"runScenario", nullptr, RunBridge,    nullptr,
                                       nullptr,       nullptr, napi_default, nullptr};
    if (napi_define_properties(env, exports, 1, &method) != napi_ok) {
        napi_throw_error(env, nullptr, "Cannot define scenario method");
        return nullptr;
    }
    return exports;
}
EXTERN_C_END
static napi_module g_testModule = {1, 0, nullptr, TestInit, "sensor_test", nullptr, {0}};
extern "C" __attribute__((constructor)) void RegisterSensorTest(void)
{
    napi_module_register(&g_testModule);
}
#endif
