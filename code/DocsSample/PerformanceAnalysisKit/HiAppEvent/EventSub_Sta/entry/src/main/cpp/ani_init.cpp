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

#include "ani/ani.h"
#include <array>
#include <iostream>

// [Start EventSub_napi_Header]
#include "../../../build/jsoncpp-1.9.6/include/json/json.h"
#include "hiappevent/hiappevent.h"
#include "hiappevent/hiappevent_event.h"
#include "hilog/log.h"

#undef LOG_TAG
#define LOG_TAG "testTag"
// [End EventSub_napi_Header]

// [Start AppEvent_Crash_C++_Add_Watcher]
// 定义变量，用来缓存创建的观察者的指针。
static HiAppEvent_Watcher *eventWatcherR1;

static void OnReceive1(const char *domain, const struct HiAppEvent_AppEventGroup *appEventGroups, uint32_t groupLen)
{
    OH_LOG_INFO(LogType::LOG_APP, "AppEvents HiAppEvent success to read events with onReceive callback from C API \n");
    for (int i = 0; i < groupLen; ++i) {
        for (int j = 0; j < appEventGroups[i].infoLen; ++j) {
            OH_LOG_INFO(LogType::LOG_APP, "AppEvents HiAppEvent eventInfo.domain=%{public}s",
                appEventGroups[i].appEventInfos[j].domain);
            OH_LOG_INFO(LogType::LOG_APP, "AppEvents HiAppEvent eventInfo.name=%{public}s",
                appEventGroups[i].appEventInfos[j].name);
            OH_LOG_INFO(LogType::LOG_APP, "AppEvents HiAppEvent eventInfo.eventType=%{public}d",
                appEventGroups[i].appEventInfos[j].type);
            if (strcmp(appEventGroups[i].appEventInfos[j].domain, DOMAIN_OS) != 0 ||
                strcmp(appEventGroups[i].appEventInfos[j].name, EVENT_APP_CRASH) != 0) {
                continue;
            }
            Json::Value params;
            Json::Reader reader(Json::Features::strictMode());
            Json::FastWriter writer;
            if (reader.parse(appEventGroups[i].appEventInfos[j].params, params)) {
                // 开发者可以获取到崩溃事件发生的时间戳
                OH_LOG_INFO(LogType::LOG_APP, "AppEvents HiAppEvent eventInfo.params.time=%{public}lld",
                    params["time"].asInt64());
                // 开发者可以获取到崩溃应用的包名
                OH_LOG_INFO(LogType::LOG_APP, "AppEvents HiAppEvent eventInfo.params.bundle_name=%{public}s",
                    params["bundle_name"].asString().c_str());
                auto external_log = writer.write(params["external_log"]);
                // 开发者可以获取到崩溃事件发生时的故障日志文件
                OH_LOG_INFO(LogType::LOG_APP, "AppEvents HiAppEvent eventInfo.params.external_log=%{public}s",
                    external_log.c_str());
            }
        }
    }
}
static void RegisterWatcherCrash([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    // 开发者自定义观察者名称，系统根据不同的名称来识别不同的观察者。
    eventWatcherR1 = OH_HiAppEvent_CreateWatcher("AppCrashWatcher1");
    // 设置订阅的事件名称为EVENT_APP_CRASH，即崩溃事件。
    const char *names[] = {EVENT_APP_CRASH};
    // 开发者订阅感兴趣的事件，此处订阅了系统事件。
    OH_HiAppEvent_SetAppEventFilter(eventWatcherR1, DOMAIN_OS, 0, names, 1);
    // 开发者设置已实现的回调函数，观察者接收到事件后会立即触发OnReceive1回调。
    OH_HiAppEvent_SetWatcherOnReceive(eventWatcherR1, OnReceive1);
    // 使观察者开始监听订阅的事件。
    OH_HiAppEvent_AddWatcher(eventWatcherR1);
}
// [End AppEvent_Crash_C++_Add_Watcher]
// [Start AppEvent_Click_C++_Add_Watcher]
// 定义变量，用来缓存创建的观察者的指针。
static HiAppEvent_Watcher *eventWatcherT1;
// 开发者可以自行实现获取已监听到事件的回调函数，其中events指针指向内容仅在该函数内有效。
static void OnTake1(const char *const *events, uint32_t eventLen)
{
    Json::Reader reader(Json::Features::strictMode());
    OH_LOG_INFO(LogType::LOG_APP, "AppEvents HiAppEvent success to read events with onTrigger callback from C API \n");
    for (int i = 0; i < eventLen; ++i) {
        OH_LOG_INFO(LogType::LOG_APP, "AppEvents HiAppEvent eventInfo=%{public}s", events[i]);
        Json::Value eventInfo;
        if (reader.parse(events[i], eventInfo)) {
            auto domain = eventInfo["domain_"].asString();
            auto name = eventInfo["name_"].asString();
            auto type = eventInfo["type_"].asInt();
            OH_LOG_INFO(LogType::LOG_APP, "AppEvents HiAppEvent eventInfo.domain=%{public}s", domain.c_str());
            OH_LOG_INFO(LogType::LOG_APP, "AppEvents HiAppEvent eventInfo.name=%{public}s", name.c_str());
            OH_LOG_INFO(LogType::LOG_APP, "AppEvents HiAppEvent eventInfo.eventType=%{public}d", type);
            if (domain == "button" && name == "click") {
                auto clickTime = eventInfo["clickTime"].asInt64();
                OH_LOG_INFO(LogType::LOG_APP, "AppEvents HiAppEvent eventInfo.params.clickTime=%{public}lld",
                    clickTime);
            }
        }
    }
}

// 开发者可以自行实现订阅回调函数，以便对获取到的事件打点数据进行自定义处理。
static void OnTrigger1(int row, int size)
{
    // 接收回调后，获取指定数量的已接收事件。
    OH_HiAppEvent_TakeWatcherData(eventWatcherT1, row, OnTake1);
}

static void RegisterWatcherClick([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    // 开发者自定义观察者名称，系统根据不同的名称来识别不同的观察者。
    eventWatcherT1 = OH_HiAppEvent_CreateWatcher("ButtonClickWatcher1");
    // 设置订阅的事件名称为click。
    const char *names[] = {"click"};
    // 开发者订阅感兴趣的应用事件，此处订阅了button相关事件。
    OH_HiAppEvent_SetAppEventFilter(eventWatcherT1, "button", 0, names, 1);
    // 开发者设置已实现的回调函数，需OH_HiAppEvent_SetTriggerCondition设置的条件满足方可触发。
    OH_HiAppEvent_SetWatcherOnTrigger(eventWatcherT1, OnTrigger1);
    // 开发者可以设置订阅触发回调的条件，此处是设置新增事件打点数量为1个时，触发onTrigger回调。
    OH_HiAppEvent_SetTriggerCondition(eventWatcherT1, 1, 0, 0);
    // 使观察者开始监听订阅的事件。
    OH_HiAppEvent_AddWatcher(eventWatcherT1);
    OH_LOG_INFO(LogType::LOG_APP, "AppEvents HiAppEvent success to RegisterWatcherClick from C API \n");
}
// [End AppEvent_Click_C++_Add_Watcher]
// [Start AppEvent_Click_C++_WriteAppEvent]
static void WriteAppEvent([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object) {
    auto params = OH_HiAppEvent_CreateParamList();
    OH_HiAppEvent_AddInt64Param(params, "clickTime", time(nullptr));
    OH_HiAppEvent_Write("button", "click", EventType::BEHAVIOR, params);
    OH_HiAppEvent_DestroyParamList(params);
    OH_LOG_INFO(LogType::LOG_APP, "writeEvent C++ success");
}
// [End AppEvent_Click_C++_WriteAppEvent]

// [Start AppEvent_C++_RemoveWatcher]
static void RemoveWatcher([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    // [StartExclude AppEvent_C++_RemoveWatcher]
    // [EndExclude AppEvent_C++_RemoveWatcher]
    OH_HiAppEvent_RemoveWatcher(eventWatcherT1);
    OH_HiAppEvent_RemoveWatcher(eventWatcherR1);
    // [StartExclude AppEvent_C++_RemoveWatcher]
    // [EndExclude AppEvent_C++_RemoveWatcher]
}
// [End AppEvent_C++_RemoveWatcher]

// [Start AppEvent_C++_DestroyWatcher]
static void DestroyWatcher([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    // 销毁创建的观察者，并置eventWatcher为nullptr。
    // [StartExclude AppEvent_C++_DestroyWatcher]
    // [EndExclude AppEvent_C++_DestroyWatcher]
    OH_HiAppEvent_DestroyWatcher(eventWatcherT1);
    OH_HiAppEvent_DestroyWatcher(eventWatcherR1);
    eventWatcherT1 = nullptr;
    eventWatcherR1 = nullptr;
    // [StartExclude AppEvent_C++_DestroyWatcher]
    // [EndExclude AppEvent_C++_DestroyWatcher]
}
// [End AppEvent_C++_DestroyWatcher]

// [Start AppEvent_C++_Init]
static ani_status bindCase(ani_vm *vm, const char *clsName, ani_native_function* methods, size_t methodCount) {
    ani_env *env;
    if (ANI_OK != vm->GetEnv(ANI_VERSION_1, &env)) {
        std::cerr << "Unsupported ANI_VERSION_1" << std::endl;
        return (ani_status)9;
    }

    ani_class cls {};
    if (ANI_OK != env->FindClass(clsName, &cls)) {
        std::cerr << "Not found '" << clsName << "'" << std::endl;
        return (ani_status)2;
    }

    if (ANI_OK != env->Class_BindNativeMethods(cls, methods, methodCount)) {
        std::cerr << "Cannot bind native methods to '" << clsName << "'" << std::endl;
        return (ani_status)3;
    };
    return ANI_OK;
}

ANI_EXPORT ani_status ANI_Constructor(ani_vm *vm, uint32_t *result) {
    OH_LOG_INFO(LogType::LOG_APP, "testTag : entering libentry.so's ANI_Constructor");
    const char *voidSignature = ":";

    std::array calcMethods = {
        ani_native_function {"writeAppEvent", voidSignature, reinterpret_cast<void *>(WriteAppEvent)},
    };

    std::array registerCMethods = {
        // [StartExclude AppEvent_C++_Init]
        // [EndExclude AppEvent_C++_Init]
        ani_native_function {"registerWatcherCrash", voidSignature, reinterpret_cast<void *>(RegisterWatcherCrash)},
        ani_native_function {"registerWatcherClick", voidSignature, reinterpret_cast<void *>(RegisterWatcherClick)},
        // [StartExclude AppEvent_C++_Init]
        // [EndExclude AppEvent_C++_Init]
    };

    ani_status status1 = bindCase(vm, "entry.src.main.ets.pages.Index.Calc", calcMethods.data(), calcMethods.size());
    ani_status status2 = bindCase(vm, "entry.src.main.ets.entryability.EntryAbility.RegisterC", registerCMethods.data(), registerCMethods.size()); 
    *result = ANI_VERSION_1;
    return ANI_OK;
}
// [End AppEvent_C++_Init]
