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

// [Start hicollie_NapiInit_Callback_Inc]
// [Start hicollie_NapiInit_InputBlock_Inc]
// [Start hicollie_NapiInit_StuckDetectionWithTimeout_Inc]
// [Start hicollie_NapiInit_StuckDetection_Inc]
// [Start hicollie_NapiInit_JankDetection_Inc]
#include <thread>
#include <string>
#include <unistd.h>
#include "napi/native_api.h"
#include "hilog/log.h"
#include "hicollie/hicollie.h"
// [StartExclude hicollie_NapiInit_Callback_Inc]
// [StartExclude hicollie_NapiInit_StuckDetectionWithTimeout_Inc]
// [StartExclude hicollie_NapiInit_JankDetection_Inc]
#include <atomic>
// [EndExclude hicollie_NapiInit_JankDetection_Inc]
// [StartExclude hicollie_NapiInit_InputBlock_Inc]
// [StartExclude hicollie_NapiInit_StuckDetection_Inc]
#undef LOG_TAG
#define LOG_TAG "JankTest"
// [EndExclude hicollie_NapiInit_StuckDetection_Inc]
// [EndExclude hicollie_NapiInit_InputBlock_Inc]
// [EndExclude hicollie_NapiInit_StuckDetectionWithTimeout_Inc]
// [EndExclude hicollie_NapiInit_Callback_Inc]
// [End hicollie_NapiInit_JankDetection_Inc]
#undef LOG_TAG
#define LOG_TAG "StuckTest"
// [End hicollie_NapiInit_StuckDetection_Inc]
// [End hicollie_NapiInit_StuckDetectionWithTimeout_Inc]
// [End hicollie_NapiInit_InputBlock_Inc]
// [End hicollie_NapiInit_Callback_Inc]

// [Start hicollie_NapiInit_JankDetection_BeginEnd_Func]
// 定义两个回调函数对象
static OH_HiCollie_BeginFunc beginFunc_;
static OH_HiCollie_EndFunc endFunc_;
// [End hicollie_NapiInit_JankDetection_BeginEnd_Func]
// [Start hicollie_NapiInit_JankDetection_Init_BeginEnd_Func]
// 线程启动后的延迟等待时长，单位：s
constexpr int INIT_DELAY_SECONDS = 1;
// 定义监控应用显示开始、结束的回调函数
void InitBeginFunc(const char* eventName)
{
    std::string str(eventName);
    OH_LOG_INFO(LogType::LOG_APP, "InitBeginFunc eventName: %{public}s", str.c_str());
}
void InitEndFunc(const char* eventName)
{
    std::string str(eventName);
    OH_LOG_INFO(LogType::LOG_APP, "OH_HiCollie_EndFunc eventName: %{public}s", str.c_str());
}

void StartDelayTimer()
{
    // 等待1s
    std::chrono::seconds delay(INIT_DELAY_SECONDS);
    OH_LOG_INFO(LogType::LOG_APP, "OH_HiCollie_Init_JankDetection delay before");
    std::this_thread::sleep_for(delay);
    OH_LOG_INFO(LogType::LOG_APP, "OH_HiCollie_Init_JankDetection delay after");
}
// [End hicollie_NapiInit_JankDetection_Init_BeginEnd_Func]
// [Start hicollie_NapiInit_JankDetection_Test]
// 卡顿检测的循环次数
constexpr int JANK_DETECTION_LOOP_COUNT = 3;
// 单次模拟任务的执行耗时，单位：ms
constexpr int JANK_TASK_DURATION_MS = 350;
// 毫秒与微秒的换算系数（1ms = 1000us）
constexpr int MICROSECONDS_PER_MILLISECOND = 1000;
// 定义子线程回调函数
void TestJankDetection()
{
    // 初始化回调函数参数
    beginFunc_ = InitBeginFunc;
    endFunc_ = InitEndFunc;
    HiCollie_DetectionParam param {0};
    // 初始化线程卡顿监控函数
    int initResult = OH_HiCollie_Init_JankDetection(&beginFunc_, &endFunc_, param);
    // 线程启动1s内，不进行检测
    StartDelayTimer();
    // 成功结果：0
    OH_LOG_INFO(LogType::LOG_APP, "OH_HiCollie_Init_JankDetection: %{public}d", initResult);
    int count = 0;
    while (count < JANK_DETECTION_LOOP_COUNT) {
        // 设置处理开始回调函数，监控线程任务执行开始时长
        beginFunc_("TestBegin");
        // 休眠350ms，模拟任务线程处理事件卡顿场景
        usleep(JANK_TASK_DURATION_MS * MICROSECONDS_PER_MILLISECOND);
        // 设置处理结束回调函数，监控线程任务执行结束时长
        endFunc_("TestEnd");
        count++;
    }
}

static napi_value TestHiCollieJankNdk(napi_env env, napi_callback_info info)
{
    // 创建子线程
    std::thread threadObj(TestJankDetection);
    // 执行TestJankDetection任务
    threadObj.join();
    return 0;
}

// [End hicollie_NapiInit_JankDetection_Test]
// [Start hicollie_NapiInit_InputBlock_BlockTime_Flag]
// [Start hicollie_NapiInit_StuckDetectionWithTimeout_BlockTime_Flag]
// [Start hicollie_NapiInit_StuckDetection_BlockTime_Flag]
// 自定义阻塞时间，模拟卡死场景，单位：s
// [StartExclude hicollie_NapiInit_StuckDetectionWithTimeout_BlockTime_Flag]
const int64_t BLOCK_TIME = 3;
// [EndExclude hicollie_NapiInit_StuckDetectionWithTimeout_BlockTime_Flag]
// [StartExclude hicollie_NapiInit_InputBlock_BlockTime_Flag]
// [StartExclude hicollie_NapiInit_StuckDetection_BlockTime_Flag]
const int64_t BLOCK_TIME2 = 5;
// [EndExclude hicollie_NapiInit_StuckDetection_BlockTime_Flag]
// [EndExclude hicollie_NapiInit_InputBlock_BlockTime_Flag]
// 设置应用线程执行任务情况标志位, true-正常，false-卡死
std::shared_ptr<std::atomic<bool>> appThreadIsAlive_ = std::make_shared<std::atomic<bool>>(true);
// 设置上报应用线程卡死事件标志位
std::shared_ptr<std::atomic<bool>> isSixSecondEvent_ = std::make_shared<std::atomic<bool>>(false);
// [End hicollie_NapiInit_StuckDetection_BlockTime_Flag]
// [End hicollie_NapiInit_StuckDetectionWithTimeout_BlockTime_Flag]
// [End hicollie_NapiInit_InputBlock_BlockTime_Flag]
// [Start hicollie_NapiInit_InputBlock_Report_Set_Timer]
// [Start hicollie_NapiInit_StuckDetection_Report_Set_Timer]
void ReportEvent()
{
    bool temp = isSixSecondEvent_->load();
    int reportResult = OH_HiCollie_Report(&temp);
    // 成功：0
    OH_LOG_INFO(LogType::LOG_APP, "OH_HiCollie_Report: %{public}d, isSixSecondEvent: %{public}d",
        reportResult, isSixSecondEvent_->load());
    isSixSecondEvent_->store(temp);
}

void SetTimeout()
{
    int64_t now = std::chrono::duration_cast<std::chrono::milliseconds>(
        std::chrono::system_clock::now().time_since_epoch()).count();
    sleep(BLOCK_TIME);
    int64_t currentTime = std::chrono::duration_cast<std::chrono::milliseconds>(
        std::chrono::system_clock::now().time_since_epoch()).count();
    if (currentTime - now < BLOCK_TIME) {
        appThreadIsAlive_->store(true);
        return;
    }
    appThreadIsAlive_->store(false);
}

// 开发者可自定义周期性检测任务
void Timer()
{
    // 每隔3s检查应用是否正常执行任务
    if (appThreadIsAlive_->load()) {
        OH_LOG_INFO(LogType::LOG_APP, "Check appThread isAlive.");
        // 更新appThreadIsAlive_，正常执行下次检测时为true
        appThreadIsAlive_->store(false);
        // 模拟超时场景
        SetTimeout();
        return;
    }
    ReportEvent();
}

// [End hicollie_NapiInit_StuckDetection_Report_Set_Timer]
// [End hicollie_NapiInit_InputBlock_Report_Set_Timer]
// [Start hicollie_NapiInit_InputBlock_Test]
// [Start hicollie_NapiInit_StuckDetection_Test]
// 定义子线程回调函数
void InitStuckDetection()
{
    // 初始化线程卡死监控函数
    int initResult = OH_HiCollie_Init_StuckDetection(Timer);
    // 成功结果：0
    OH_LOG_INFO(LogType::LOG_APP, "OH_HiCollie_Init_StuckDetection: %{public}d", initResult);
}

static napi_value TestHiCollieStuckNdk(napi_env env, napi_callback_info info)
{
    // 创建子线程
    std::thread threadObj(InitStuckDetection);
    // 执行任务
    threadObj.join();
    return 0;
}
// [End hicollie_NapiInit_StuckDetection_Test]

static napi_value TestHiCollieInputBlock(napi_env env, napi_callback_info info)
{
    // 子线程未卡死，不上报
    if (appThreadIsAlive_->load()) {
        return 0;
    }
    OH_HiCollie_ReportInputBlock();
    return 0;
}
// [End hicollie_NapiInit_InputBlock_Test]

// [Start hicollie_NapiInit_StuckDetectionWithTimeout_Report_Set_Timer]
void ReportEvent2()
{
    bool temp = isSixSecondEvent_->load();
    int reportResult = OH_HiCollie_Report(&temp);
    // 成功：0
    OH_LOG_INFO(LogType::LOG_APP, "OH_HiCollie_Report: %{public}d, isSixSecondEvent: %{public}d",
        reportResult, isSixSecondEvent_->load());
    isSixSecondEvent_->store(temp);
}

void SetTimeout2()
{
    int64_t now = std::chrono::duration_cast<std::chrono::milliseconds>(
        std::chrono::system_clock::now().time_since_epoch()).count();
    sleep(BLOCK_TIME2);
    int64_t currentTime = std::chrono::duration_cast<std::chrono::milliseconds>(
        std::chrono::system_clock::now().time_since_epoch()).count();
    if (currentTime - now < BLOCK_TIME2) {
        appThreadIsAlive_->store(true);
        return;
    }
    appThreadIsAlive_->store(false);
}

// 开发者可自定义周期性检测任务
void Timer2()
{
    // 每隔5s检查应用是否正常执行任务
    if (appThreadIsAlive_->load()) {
        OH_LOG_INFO(LogType::LOG_APP, "Check appThread isAlive.");
        // 更新appThreadIsAlive_，正常执行下次检测时为true
        appThreadIsAlive_->store(false);
        // 模拟超时场景
        SetTimeout2();
        return;
    }
    ReportEvent2();
}
// [End hicollie_NapiInit_StuckDetectionWithTimeout_Report_Set_Timer]

// [Start hicollie_NapiInit_StuckDetectionWithTimeout_Test]
// 卡死检测阈值，单位：s，取值范围为[3, 15]
constexpr int STUCK_DETECTION_TIMEOUT_SECONDS = 5;
// 定义子线程回调函数
void InitStuckDetectionWithTimeout()
{
    // 初始化线程卡死监控函数
    int initResult = OH_HiCollie_Init_StuckDetectionWithTimeout(Timer2, STUCK_DETECTION_TIMEOUT_SECONDS);
    // 成功结果：0
    OH_LOG_INFO(LogType::LOG_APP, "OH_HiCollie_Init_StuckDetectionWithTimeout: %{public}d", initResult);
}

static napi_value TestHiCollieStuckWithTimeoutNdk(napi_env env, napi_callback_info info)
{
    // 创建子线程
    std::thread threadObj(InitStuckDetectionWithTimeout);
    // 执行任务
    threadObj.join();
    return 0;
}
// [End hicollie_NapiInit_StuckDetectionWithTimeout_Test]

// [Start hicollie_NapiInit_Callback_Test]
static size_t UserCall(OH_HiCollie_Freeze_Type type, void* buffer, size_t size)
{
    std::string source("Freeze is happened");
    if (type == OH_THREAD_BLOCK_3S) {
        source += ":block 3s";
    } else if (type == OH_THREAD_BLOCK_6S) {
        source += ":block 6s";
    } else {
        source += ":other block";
    }
    if (buffer == nullptr || size == 0) {
        return 0;
    }
    std::string info = "UserCallback" + source;
    char* dest = static_cast<char*>(buffer);
    // 末尾预留1字节写入结束符'\0'，避免缓冲区越界
    size_t maxCopyLen = size - 1;
    size_t copyLen = info.size() < maxCopyLen ? info.size() : maxCopyLen;
    info.copy(dest, copyLen);
    dest[copyLen] = '\0';
    return copyLen;
}

static napi_value TestHiCollieSetFreezeCallback(napi_env env, napi_callback_info info)
{
    // 设置用户回调
    OH_HiCollie_SetFreezeCallback(UserCall);
    return 0;
}

// 模拟线程阻塞时长，单位：s，用于触发BUSINESS_THREAD_BLOCK_3S事件
constexpr int THREAD_BLOCK_3S_SECONDS = 3;

static napi_value TestHiCollieAssociateProcessReport(napi_env env, napi_callback_info info)
{
    // 上报BUSINESS_THREAD_BLOCK_3S事件
    OH_HiCollie_AssociateProcessReport(false);
    sleep(THREAD_BLOCK_3S_SECONDS);
    // 上报BUSINESS_THREAD_BLOCK_6S事件
    OH_HiCollie_AssociateProcessReport(true);
    return 0;
}
// [End hicollie_NapiInit_Callback_Test]

// [Start hicollie_NapiInit_Callback_Init]
// [Start hicollie_NapiInit_InputBlock_Init]
// [Start hicollie_NapiInit_StuckDetectionWithTimeout_Init]
// [Start hicollie_NapiInit_StuckDetection_Init]
// [Start hicollie_NapiInit_JankDetection_Init]
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        // [StartExclude hicollie_NapiInit_Callback_Init]
        // [StartExclude hicollie_NapiInit_StuckDetectionWithTimeout_Init]
        // [StartExclude hicollie_NapiInit_InputBlock_Init]
        // [StartExclude hicollie_NapiInit_StuckDetection_Init]
        { "testHiCollieJankNdk", nullptr, TestHiCollieJankNdk, nullptr, nullptr, nullptr, napi_default, nullptr },
        // [EndExclude hicollie_NapiInit_StuckDetection_Init]
        // [EndExclude hicollie_NapiInit_InputBlock_Init]
        // [StartExclude hicollie_NapiInit_JankDetection_Init]
        { "testHiCollieStuckNdk", nullptr, TestHiCollieStuckNdk, nullptr, nullptr, nullptr, napi_default, nullptr },
        // [StartExclude hicollie_NapiInit_StuckDetection_Init]
        { "testHiCollieInputBlock", nullptr, TestHiCollieInputBlock, nullptr, nullptr, nullptr, napi_default, nullptr },
        // [EndExclude hicollie_NapiInit_StuckDetection_Init]
        // [EndExclude hicollie_NapiInit_StuckDetectionWithTimeout_Init]
        // [StartExclude hicollie_NapiInit_InputBlock_Init]
        // [StartExclude hicollie_NapiInit_StuckDetection_Init]
        { "testHiCollieStuckWithTimeoutNdk", nullptr, TestHiCollieStuckWithTimeoutNdk, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        // [EndExclude hicollie_NapiInit_Callback_Init]
        // [StartExclude hicollie_NapiInit_StuckDetectionWithTimeout_Init]
        { "testHiCollieSetFreezeCallback", nullptr, TestHiCollieSetFreezeCallback, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "testHiCollieAssociateProcessReport", nullptr, TestHiCollieAssociateProcessReport, nullptr, nullptr,
            nullptr, napi_default, nullptr }
        // [EndExclude hicollie_NapiInit_StuckDetectionWithTimeout_Init]
        // [EndExclude hicollie_NapiInit_StuckDetection_Init]
        // [EndExclude hicollie_NapiInit_InputBlock_Init]
        // [EndExclude hicollie_NapiInit_JankDetection_Init]
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END
// [End hicollie_NapiInit_JankDetection_Init]
// [End hicollie_NapiInit_StuckDetection_Init]
// [End hicollie_NapiInit_StuckDetectionWithTimeout_Init]
// [End hicollie_NapiInit_InputBlock_Init]
// [End hicollie_NapiInit_Callback_Init]

// [Start hicollie_NapiInit_demoModule]
static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "entry",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
// [End hicollie_NapiInit_demoModule]
