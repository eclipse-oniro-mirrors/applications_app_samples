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

// [Start print_native_init]
#include "napi/native_api.h"
#include "BasicServicesKit/ohprint.h"
#include "hilog/log.h"
#include <string>
#include <fcntl.h>
#include <unistd.h>
#include <vector>

#undef LOG_TAG
#define LOG_TAG "print c/c++"
#define LOGE(...) OH_LOG_ERROR(LOG_APP, ##__VA_ARGS__)
#define LOGI(...) OH_LOG_INFO(LOG_APP, ##__VA_ARGS__)
// [End print_native_init]

// [Start print_native_callback1]
static void PrinterDiscoveryCallback(Print_DiscoveryEvent event, const Print_PrinterInfo *printerInfo)
{
    // 发现打印设备事件，以设备Id作为唯一标识符
    if (printerInfo == nullptr) {
        LOGE("printerInfo is nullptr");
        return;
    }
    // 开发者需根据具体事件实现相关逻辑
    switch (event) {
        // 探测到一台打印设备，可能会重复上报
        case PRINTER_DISCOVERED:
            LOGI("do something, printer[%{public}s] discovered", printerInfo->printerId);
            break;
        // 打印设备从发现列表移除，仅上报一次
        case PRINTER_LOST:
            LOGI("do something, printer[%{public}s] lost", printerInfo->printerId);
            break;
        // 打印设备开始连接，由OH_Print_ConnectPrinter触发
        case PRINTER_CONNECTING:
            LOGI("do something, printer[%{public}s] on connecting", printerInfo->printerId);
            break;
        // 打印设备成功连接，由OH_Print_ConnectPrinter触发
        case PRINTER_CONNECTED:
            LOGI("do something, printer[%{public}s] connected", printerInfo->printerId);
            break;
        default:
            break;
    }
}
// [End print_native_callback1]

// [Start print_native_callback2]
static void PrinterChangeCallback(Print_PrinterEvent event, const Print_PrinterInfo *printerInfo)
{
    // 以设备Id作为唯一标识符
    if (printerInfo == nullptr) {
        LOGE("printerInfo is nullptr");
        return;
    }
    // 开发者需根据具体事件实现相关逻辑
    switch (event) {
        // 打印设备新增到已添加设备列表
        case PRINTER_ADDED:
            LOGI("do something, printer[%{public}s] added", printerInfo->printerId);
            break;
        // 打印设备从已添加设备列表移除
        case PRINTER_DELETED:
            LOGI("do something, printer[%{public}s] deleted", printerInfo->printerId);
            break;
        // 打印设备状态变更
        case PRINTER_STATE_CHANGED:
            LOGI("do something, printer[%{public}s] state change to %{public}d",
                 printerInfo->printerId, printerInfo->printerState);
            break;
        // 打印设备基础属性变更
        case PRINTER_INFO_CHANGED:
            LOGI("do something, printer[%{public}s] info changed", printerInfo->printerId);
            break;
        default:
            break;
    }
}
// [End print_native_callback2]

// [Start print_native_lifecycle1]
static napi_value NativeInit(napi_env env, napi_callback_info info)
{
    // 初始化打印服务
    Print_ErrorCode ret = OH_Print_Init();
    LOGI("nativeInit, ret = %{public}d", ret);
    napi_value n_ret = nullptr;
    napi_get_boolean(env, !ret, &n_ret);
    if (ret == 0) {
        // 订阅已添加设备状态变更事件
        Print_ErrorCode error = OH_Print_RegisterPrinterChangeListener(PrinterChangeCallback);
        LOGI("OH_Print_RegisterPrinterChangeListener, error = %{public}d", error);
        // 订阅设备发现相关事件
        error = OH_Print_StartPrinterDiscovery(PrinterDiscoveryCallback);
        LOGI("OH_Print_StartPrinterDiscovery, error = %{public}d", error);
    }
    return n_ret;
}
// [End print_native_lifecycle1]

// [Start print_native_lifecycle2]
static napi_value NativeRelease(napi_env env, napi_callback_info info)
{
    // 取消订阅已添加设备状态变更事件
    OH_Print_UnregisterPrinterChangeListener();
    // 取消订阅设备发现相关事件
    OH_Print_StopPrinterDiscovery();
    // 释放打印服务
    Print_ErrorCode ret = OH_Print_Release();
    LOGI("nativeRelease, ret = %{public}d", ret);
    napi_value n_ret = nullptr;
    napi_get_boolean(env, !ret, &n_ret);
    return n_ret;
}
// [End print_native_lifecycle2]

// [Start print_native_startprint1]
// WriteFile 由开发者实现，示例仅为简单的文件拷贝。根据当前用户修改后的打印参数，若需要更新打印文件可重新写入系统提供的fd中
static uint32_t WriteFile(uint32_t fd, const Print_PrintAttributes *oldAttrs, const Print_PrintAttributes *newAttrs)
{
    // 沙箱内合法路径
    const char* filePath = "/data/storage/el2/base/files/test.pdf";
    int32_t fileFd = open(filePath, O_RDONLY);
    if (fileFd == -1) {
        LOGE("open failed, errno=%{public}d", errno);
        return 1;
    }

    char buffer[4096];
    ssize_t bytesRead = -1;
    while ((bytesRead = read(fileFd, buffer, sizeof(buffer))) > 0) {
        if (write(fd, buffer, bytesRead) < bytesRead) {
            close(fileFd);
            return 1;
        }
    }
    close(fileFd);
    return 0;
}
// [End print_native_startprint1]

// [Start print_native_startprint2]
// 系统打印预览界面回调，首次拉起或用户修改打印参数时的延迟文件写入回调。可以根据新参数适当修改打印文件
static void OnStartLayoutWriteCb(const char *jobId,
                                 uint32_t fd,
                                 const Print_PrintAttributes *oldAttrs,
                                 const Print_PrintAttributes *newAttrs,
                                 Print_WriteResultCallback writeCallback)
{
    // 将数据写入系统提供的fd中，每次回调的fd不一定相同，请不要保存此fd
    uint32_t retCode = WriteFile(fd, oldAttrs, newAttrs);
    // 通知打印系统文件写入完成，若需要异步写入数据，请保存好jobId
    // retCode取值：0-写入成功，1-写入异常，2-无需重新写入
    writeCallback(jobId, retCode);
}

// 打印文件写入完成后，系统打印预览界面会进行预览，此时用户可以点击"开始打印"下发任务
// 任务ID对应的打印状态变化的回调函数
static void OnJobStateChangedCb(const char *jobId, uint32_t state)
{
    // state取值：0-任务准备中，1-任务排队中， 2-任务打印中， 3-任务异常暂停， 4-任务结束， 100-任务未知异常
    LOGI("do something with OnJobStateChangedCb, jobId: %{public}s, jobState: %{public}u", jobId, state);
}
// [End print_native_startprint2]

// [Start print_native_startprint3]
// 拉起系统打印预览界面
static napi_value NativeStartPrintByNative(napi_env env, napi_callback_info info)
{
    napi_value n_ret = nullptr;
    void *context = nullptr;
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    // 假设 napi_get_cb_info 和 napi_unwrap 均正常返回
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    napi_unwrap(env, argv[0], &context);

    // 调用打印接口以拉起系统打印预览界面
    std::string printJobName = "test";
    Print_PrintDocCallback printDocCallback = { OnStartLayoutWriteCb, OnJobStateChangedCb };
    Print_ErrorCode ret = OH_Print_StartPrintByNative(printJobName.c_str(), printDocCallback, context);
    napi_get_boolean(env, !ret, &n_ret);
    return n_ret;
}
// [End print_native_startprint3]

// [Start print_native_startjob]
// 下发打印任务
static napi_value NativeStartPrintJob(napi_env env, napi_callback_info info)
{
    napi_value n_ret = nullptr;
    napi_get_boolean(env, false, &n_ret);
    Print_ErrorCode ret = PRINT_ERROR_INVALID_PARAMETER;

    // 获取已添加打印机的列表
    Print_StringList pList = { 0 };
    ret = OH_Print_QueryPrinterList(&pList);
    if (ret != PRINT_ERROR_NONE) {
        OH_Print_ReleasePrinterList(&pList);
        return n_ret;
    }
    if (pList.count <= 0 || (!pList.list)) {
        OH_Print_ReleasePrinterList(&pList);
        return n_ret;
    }
    // 打印列表中所有的打印机Id
    for (uint32_t index = 0; index < pList.count; index++) {
        LOGI("pList->list[%{public}d]: %{public}s", index, pList.list[index]);
    }

    // 获取列表中第一台打印机属性
    const char *printerId = pList.list[0];
    Print_PrinterInfo *printerInfo = nullptr;
    ret = OH_Print_QueryPrinterInfo(printerId, &printerInfo);
    if (ret != PRINT_ERROR_NONE) {
        OH_Print_ReleasePrinterInfo(printerInfo);
        OH_Print_ReleasePrinterList(&pList);
        return n_ret;
    }
    // 打开要打印的文件，可以有多个，沙箱内合法路径
    const char* filePath = "/data/storage/el2/base/files/test.pdf";
    int32_t fd = open(filePath, O_RDONLY);
    if (fd == -1) {
        LOGE("open failed, errno=%{public}d", errno);
        ret = PRINT_ERROR_INVALID_PARAMETER;
        OH_Print_ReleasePrinterInfo(printerInfo);
        OH_Print_ReleasePrinterList(&pList);
        return n_ret;
    }
    std::vector<uint32_t> fdList = { static_cast<uint32_t>(fd) };
    // 本例子使用首选项 printerInfo->defaultValue 作为打印任务参数来下发任务
    Print_PrintJob printJob{ "jobName", fdList.data(), static_cast<uint32_t>(fdList.size()), printerInfo->printerId,
                             1, printerInfo->defaultValue.defaultPaperSource,
                             printerInfo->defaultValue.defaultMediaType, printerInfo->defaultValue.defaultPageSizeId,
                             printerInfo->defaultValue.defaultColorMode, printerInfo->defaultValue.defaultDuplexMode,
                             printerInfo->defaultValue.defaultResolution, printerInfo->defaultValue.defaultMargin,
                             true, printerInfo->defaultValue.defaultOrientation,
                             printerInfo->defaultValue.defaultPrintQuality, DOCUMENT_FORMAT_PDF,
                             printerInfo->defaultValue.otherDefaultValues, };
    ret = OH_Print_StartPrintJob(&printJob);
    close(fd);
    // 使用完打印机属性和添加列表后需要及时释放
    OH_Print_ReleasePrinterInfo(printerInfo);
    OH_Print_ReleasePrinterList(&pList);

    napi_get_boolean(env, !ret, &n_ret);
    return n_ret;
}
// [End print_native_startjob]

// 添加napi接口声明
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "nativeInit", nullptr, NativeInit, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "nativeRelease", nullptr, NativeRelease, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "nativeStartPrintByNative",
            nullptr, NativeStartPrintByNative, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "nativeStartPrintJob", nullptr, NativeStartPrintJob, nullptr, nullptr, nullptr, napi_default, nullptr },
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "entry",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
