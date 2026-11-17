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
#include <cstdarg>
#include <cstdio>
#include <cstring>
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

struct Scenario {
    std::string mode;
    int count = 1;
    std::string fault;
    int failAt = 0;
    // Used by the standalone lifecycle probe; not exposed through scenario input.
    bool persistentFailure = false;
    int errorCode = 401;
    int length = 3;
    int accuracy = 2;
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
static Scenario scenario;
static Observation observation;
static std::mutex scenarioMutex;
static Sensor_Info **allocatedInfos = nullptr;
static std::vector<int> sensorIndexes;
static std::vector<float> eventData;
static int fakeEvent = 0;

static bool Record(const std::string &name, const std::string &detail = "")
{
    int occurrence = observation.calls[name]++;
    observation.trace.push_back(name + detail);
    return scenario.fault == name && (scenario.persistentFailure || occurrence == scenario.failAt);
}
static void *Allocate(const std::string &kind)
{
    void *value = new int(0);
    observation.resources[value] = kind;
    return value;
}
static void Release(void *value, const std::string &kind)
{
    auto found = observation.resources.find(value);
    if (found == observation.resources.end() || found->second != kind) {
        observation.violations++;
        return;
    }
    if (kind == "subscriber" && observation.active != 0) {
        observation.violations++;
    }
    observation.resources.erase(found);
    delete static_cast<int *>(value);
}
static void CheckResource(const void *value, const std::string &kind)
{
    auto found = observation.resources.find(const_cast<void *>(value));
    if (found == observation.resources.end() || found->second != kind) {
        observation.violations++;
    }
}
static int SampleLog(LogType, LogLevel level, unsigned int, const char *, const char *format, ...)
{
    std::string normalized(format);
    const std::string visibility = "%{public}";
    size_t position = 0;
    while ((position = normalized.find(visibility, position)) != std::string::npos) {
        normalized.replace(position, visibility.size(), "%");
        position++;
    }
    char buffer[2048] = {};
    va_list arguments;
    va_start(arguments, format);
    vsnprintf(buffer, sizeof(buffer), normalized.c_str(), arguments);
    va_end(arguments);
    if (level == LOG_ERROR) {
        observation.errors.emplace_back(buffer);
    } else {
        observation.messages.emplace_back(buffer);
    }
    return 0;
}
static void IgnoreSampleRegistration(napi_module *) {}
namespace std { namespace this_thread {
static void SampleSleepFor(std::chrono::milliseconds duration)
{
    Record("wait", ":" + std::to_string(duration.count()));
    observation.waitMs += static_cast<int>(duration.count());
}
}}
#define OH_LOG_Print SampleLog
#define napi_module_register IgnoreSampleRegistration
#define sleep_for SampleSleepFor
#define RegisterEntryModule IgnoredProductionRegistration
#include "../../main/cpp/oh_sensor_capi.cpp"
#undef RegisterEntryModule
#undef sleep_for
#undef napi_module_register
#undef OH_LOG_Print

static int ReadInfo(Sensor_Info *sensor, const std::string &operation)
{
    int index = *reinterpret_cast<int *>(sensor);
    if (index < 0 || index >= scenario.count) {
        observation.violations++;
    }
    return Record(operation, ":" + std::to_string(index)) ? scenario.errorCode : 0;
}
Sensor_Result Mock_OH_Sensor_GetInfos(Sensor_Info **infos, uint32_t *count)
{
    bool failed = Record(infos == nullptr ? "count" : "infos");
    if (failed) return static_cast<Sensor_Result>(scenario.errorCode);
    if (infos != nullptr && (*count != static_cast<uint32_t>(scenario.count) || infos != allocatedInfos)) {
        observation.violations++;
    }
    *count = static_cast<uint32_t>(scenario.count);
    return SENSOR_SUCCESS;
}
Sensor_Info **Mock_OH_Sensor_CreateInfos(uint32_t count)
{
    if (Record("createInfos", ":" + std::to_string(count))) return nullptr;
    sensorIndexes.resize(count);
    allocatedInfos = new Sensor_Info *[std::max(1u, count)];
    observation.resources[allocatedInfos] = "infos";
    for (uint32_t index = 0; index < count; index++) {
        sensorIndexes[index] = static_cast<int>(index);
        allocatedInfos[index] = reinterpret_cast<Sensor_Info *>(&sensorIndexes[index]);
    }
    return allocatedInfos;
}
int32_t Mock_OH_Sensor_DestroyInfos(Sensor_Info **infos, uint32_t count)
{
    Record("destroyInfos", ":" + std::to_string(count));
    if (infos != allocatedInfos || count != static_cast<uint32_t>(scenario.count)) observation.violations++;
    observation.resources.erase(infos);
    delete[] infos;
    allocatedInfos = nullptr;
    return 0;
}
static int ReadName(Sensor_Info *sensor, char *value, uint32_t *length, const std::string &operation)
{
    int status = ReadInfo(sensor, operation);
    if (*length != 64) observation.violations++;
    if (status != 0) return status;
    std::string text(static_cast<size_t>(1 + scenario.seed % 63), operation == "name" ? 'S' : 'V');
    if (*length < text.size() + 1) { observation.violations++; return 401; }
    std::memcpy(value, text.c_str(), text.size() + 1);
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
    if (status == 0) *value = static_cast<Sensor_Type>(scenario.type);
    return status;
}
int32_t Mock_OH_SensorInfo_GetResolution(Sensor_Info *sensor, float *value)
{
    int status = ReadInfo(sensor, "resolution");
    if (status == 0) *value = static_cast<float>(scenario.seed + 1) / 1024.0f;
    return status;
}
int32_t Mock_OH_SensorInfo_GetMinSamplingInterval(Sensor_Info *sensor, int64_t *value)
{
    int status = ReadInfo(sensor, "minimum");
    if (status == 0) *value = static_cast<int64_t>(scenario.seed + 1) * 1000;
    return status;
}
int32_t Mock_OH_SensorInfo_GetMaxSamplingInterval(Sensor_Info *sensor, int64_t *value)
{
    int status = ReadInfo(sensor, "maximum");
    if (status == 0) *value = static_cast<int64_t>(scenario.seed + 1) * 1000000000;
    return status;
}
Sensor_Subscriber *Mock_OH_Sensor_CreateSubscriber(void)
{
    if (Record("createSubscriber")) return nullptr;
    return reinterpret_cast<Sensor_Subscriber *>(Allocate("subscriber"));
}
int32_t Mock_OH_SensorSubscriber_SetCallback(Sensor_Subscriber *subscriber, const Sensor_EventCallback callback)
{
    CheckResource(subscriber, "subscriber");
    if (Record("setCallback")) return scenario.errorCode;
    if (callback == nullptr) observation.violations++;
    observation.callback = callback;
    return 0;
}
Sensor_SubscriptionId *Mock_OH_Sensor_CreateSubscriptionId(void)
{
    if (Record("createId")) return nullptr;
    return reinterpret_cast<Sensor_SubscriptionId *>(Allocate("id"));
}
int32_t Mock_OH_SensorSubscriptionId_SetType(Sensor_SubscriptionId *id, const Sensor_Type type)
{
    CheckResource(id, "id");
    observation.configuredType = static_cast<int>(type);
    return Record("setType", ":" + std::to_string(type)) ? scenario.errorCode : 0;
}
Sensor_SubscriptionAttribute *Mock_OH_Sensor_CreateSubscriptionAttribute(void)
{
    if (Record("createAttribute")) return nullptr;
    return reinterpret_cast<Sensor_SubscriptionAttribute *>(Allocate("attribute"));
}
int32_t Mock_OH_SensorSubscriptionAttribute_SetSamplingInterval(Sensor_SubscriptionAttribute *attribute, const int64_t interval)
{
    CheckResource(attribute, "attribute");
    observation.configuredInterval = interval;
    return Record("setInterval", ":" + std::to_string(interval)) ? scenario.errorCode : 0;
}
Sensor_Result Mock_OH_Sensor_Subscribe(const Sensor_SubscriptionId *id,
    const Sensor_SubscriptionAttribute *attribute, const Sensor_Subscriber *subscriber)
{
    CheckResource(id, "id");
    CheckResource(attribute, "attribute");
    CheckResource(subscriber, "subscriber");
    if (Record("subscribe")) return static_cast<Sensor_Result>(scenario.errorCode);
    observation.active++;
    if (observation.callback != nullptr) {
        observation.callbacks++;
        observation.callback(scenario.nullEvent ? nullptr : reinterpret_cast<Sensor_Event *>(&fakeEvent));
    }
    return SENSOR_SUCCESS;
}
Sensor_Result Mock_OH_Sensor_Unsubscribe(const Sensor_SubscriptionId *id, const Sensor_Subscriber *subscriber)
{
    CheckResource(id, "id");
    CheckResource(subscriber, "subscriber");
    if (Record("unsubscribe")) return static_cast<Sensor_Result>(scenario.errorCode);
    observation.active--;
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
    if (event == nullptr) observation.violations++;
    if (Record("timestamp")) return scenario.errorCode;
    *value = static_cast<int64_t>(scenario.seed) * 1000000000;
    return 0;
}
int32_t Mock_OH_SensorEvent_GetType(Sensor_Event *event, Sensor_Type *value)
{
    if (event == nullptr) observation.violations++;
    if (Record("eventType")) return scenario.errorCode;
    *value = static_cast<Sensor_Type>(scenario.type);
    return 0;
}
int32_t Mock_OH_SensorEvent_GetAccuracy(Sensor_Event *event, Sensor_Accuracy *value)
{
    if (event == nullptr) observation.violations++;
    if (Record("accuracy")) return scenario.errorCode;
    *value = static_cast<Sensor_Accuracy>(scenario.accuracy);
    return 0;
}
int32_t Mock_OH_SensorEvent_GetData(Sensor_Event *event, float **value, uint32_t *length)
{
    if (event == nullptr) observation.violations++;
    if (Record("data")) return scenario.errorCode;
    *value = scenario.nullData ? nullptr : eventData.data();
    *length = static_cast<uint32_t>(scenario.length);
    return 0;
}
static std::string Join(const std::vector<std::string> &parts)
{
    std::string result;
    for (const std::string &part : parts) {
        if (!result.empty()) result += "|";
        result += part;
    }
    return result;
}
static std::string Quote(const std::string &text)
{
    std::string result = "\"";
    for (char ch : text) {
        if (ch == '\\' || ch == '"') result += '\\';
        result += ch;
    }
    return result + "\"";
}
static std::string RunScenario(const std::string &input)
{
    std::lock_guard<std::mutex> guard(scenarioMutex);
    scenario = Scenario();
    observation = Observation();
    std::istringstream stream(input);
    stream >> scenario.mode >> scenario.count >> scenario.fault >> scenario.failAt >> scenario.errorCode
        >> scenario.length >> scenario.accuracy >> scenario.type >> scenario.seed >> scenario.nullEvent >> scenario.nullData;
    std::string trailing;
    if (!stream || (stream >> trailing) || scenario.count < 0 || scenario.count > 128 ||
        scenario.length < 0 || scenario.length > 64 || scenario.seed < 0 || scenario.seed > 1000000 ||
        (scenario.mode != "info" && scenario.mode != "subscription" && scenario.mode != "callback")) {
        return "{\"inputError\":true}";
    }
    eventData.resize(std::max(1, scenario.length));
    for (int i = 0; i < scenario.length; i++) eventData[i] = static_cast<float>(scenario.seed - i) / 4.0f;
    if (scenario.mode == "info") GetSensorInfos(nullptr, nullptr);
    if (scenario.mode == "subscription") Subscriber(nullptr, nullptr);
    if (scenario.mode == "callback") {
        observation.callbacks++;
        SensorDataCallbackImpl(scenario.nullEvent ? nullptr : reinterpret_cast<Sensor_Event *>(&fakeEvent));
    }
    std::ostringstream result;
    result << "{\"trace\":" << Quote(Join(observation.trace))
        << ",\"errors\":" << Quote(Join(observation.errors))
        << ",\"messages\":" << Quote(Join(observation.messages))
        << ",\"liveResources\":" << observation.resources.size()
        << ",\"activeSubscriptions\":" << observation.active
        << ",\"violations\":" << observation.violations
        << ",\"waitMs\":" << observation.waitMs
        << ",\"configuredType\":" << observation.configuredType
        << ",\"configuredInterval\":" << observation.configuredInterval
        << ",\"callbacks\":" << observation.callbacks << "}";
    for (auto &resource : observation.resources) {
        if (resource.second == "infos") delete[] reinterpret_cast<Sensor_Info **>(resource.first);
        else delete static_cast<int *>(resource.first);
    }
    allocatedInfos = nullptr;
    return result.str();
}
#ifdef SENSOR_STANDALONE
int main(int argc, char **argv)
{
    if (argc != 2) return 2;
    std::ifstream inputs(argv[1]);
    if (!inputs) return 3;
    std::string line;
    while (std::getline(inputs, line)) {
        if (!line.empty() && line.back() == '\r') line.pop_back();
        if (!line.empty()) std::cout << RunScenario(line) << std::endl;
    }
    return inputs.bad() ? 4 : 0;
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
    if (napi_get_value_string_utf8(env, argument, nullptr, 0, &length) != napi_ok || length > 1024) {
        napi_throw_type_error(env, nullptr, "A bounded scenario string is required");
        return nullptr;
    }
    std::vector<char> input(length + 1);
    napi_get_value_string_utf8(env, argument, input.data(), input.size(), &length);
    std::string result = RunScenario(std::string(input.data(), length));
    napi_value output;
    napi_create_string_utf8(env, result.c_str(), result.size(), &output);
    return output;
}
EXTERN_C_START
static napi_value TestInit(napi_env env, napi_value exports)
{
    napi_property_descriptor method = {"runScenario", nullptr, RunBridge, nullptr, nullptr, nullptr, napi_default, nullptr};
    napi_define_properties(env, exports, 1, &method);
    return exports;
}
EXTERN_C_END
static napi_module testModule = {1, 0, nullptr, TestInit, "sensor_test", nullptr, {0}};
extern "C" __attribute__((constructor)) void RegisterSensorTest(void)
{
    napi_module_register(&testModule);
}
#endif
