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

// [Start print_native_header]
#include "BasicServicesKit/ohprint.h"
#include "hilog/log.h"
#include "napi/native_api.h"

#include <cerrno>
#include <cstdint>
#include <fcntl.h>
#include <mutex>
#include <string>
#include <unistd.h>
#include <vector>

#undef LOG_TAG
#define LOG_TAG "NativePrintFile"
#define LOGE(...) OH_LOG_ERROR(LOG_APP, ##__VA_ARGS__)
#define LOGI(...) OH_LOG_INFO(LOG_APP, ##__VA_ARGS__)
// [End print_native_header]

namespace {
constexpr int32_t ERROR_INVALID_PRINTER = PRINT_ERROR_INVALID_PRINTER;
constexpr int32_t ERROR_GENERIC = PRINT_ERROR_GENERIC_FAILURE;
constexpr size_t MAX_STRING_LENGTH = 65536;

// [Start print_native_declarations]
struct PageSizeData {
    std::string id;
    std::string name;
    uint32_t width = 0;
    uint32_t height = 0;
};

struct PrinterInfoData {
    std::string printerId;
    std::string printerName;
    std::string printerUri;
    uint32_t printerState = 0;
    uint32_t colorMode = 0;
    uint32_t copySupported = 0;
    bool isOnline = false;
    std::vector<PageSizeData> pageSizes;
};

struct PrinterEventData {
    uint32_t event = 0;
    PrinterInfoData printerInfo;
};

struct NativePrintEventData {
    uint32_t eventType = 0;
    std::string jobId;
    uint32_t state = 0;
    uint32_t writeCode = 0;
};

struct PrintJobStateEventData {
    std::string jobId;
    uint32_t state = 0;
};
// [End print_native_declarations]

// [Start print_native_job_storage_cpp]
struct PrintJobStorage {
    Print_PrintJob job = {};
    std::vector<uint32_t> fdList;
    std::string printerId;
    std::string jobName;
    std::string paperSource;
    std::string mediaType;
    std::string pageSizeId;
    std::string advancedOptions;
};
// [End print_native_job_storage_cpp]

std::mutex gServiceMutex;
bool gInitialized = false;
bool gListenerRegistered = false;
bool gDiscoveryRunning = false;

std::mutex gDiscoveryMutex;
napi_threadsafe_function gDiscoveryTsfn = nullptr;

std::mutex gPrinterChangeMutex;
napi_threadsafe_function gPrinterChangeTsfn = nullptr;

std::mutex gNativePrintMutex;
napi_threadsafe_function gNativePrintTsfn = nullptr;
int32_t gNativePrintSourceFd = -1;

std::mutex gPrintJobStateMutex;
napi_threadsafe_function gPrintJobStateTsfn = nullptr;

void ReleaseNativePrintTask(napi_threadsafe_function_release_mode mode);
void ReleasePrintJobStateTask(napi_threadsafe_function_release_mode mode);

std::string SafeString(const char *value)
{
    return value == nullptr ? "" : value;
}

napi_value CreateInt32(napi_env env, int32_t value)
{
    napi_value result = nullptr;
    napi_create_int32(env, value, &result);
    return result;
}

napi_value CreateUint32(napi_env env, uint32_t value)
{
    napi_value result = nullptr;
    napi_create_uint32(env, value, &result);
    return result;
}

napi_value CreateString(napi_env env, const std::string &value)
{
    napi_value result = nullptr;
    napi_create_string_utf8(env, value.c_str(), value.size(), &result);
    return result;
}

napi_valuetype GetValueType(napi_env env, napi_value value)
{
    napi_valuetype type = napi_undefined;
    if (value != nullptr) {
        napi_typeof(env, value, &type);
    }
    return type;
}

napi_value GetProperty(napi_env env, napi_value object, const char *name)
{
    napi_value value = nullptr;
    if (napi_get_named_property(env, object, name, &value) != napi_ok) {
        return nullptr;
    }
    return value;
}

bool GetString(napi_env env, napi_value value, std::string &result)
{
    if (GetValueType(env, value) != napi_string) {
        return false;
    }
    size_t length = 0;
    if (napi_get_value_string_utf8(env, value, nullptr, 0, &length) != napi_ok || length > MAX_STRING_LENGTH) {
        return false;
    }
    std::vector<char> buffer(length + 1, '\0');
    size_t copied = 0;
    if (napi_get_value_string_utf8(env, value, buffer.data(), buffer.size(), &copied) != napi_ok) {
        return false;
    }
    result.assign(buffer.data(), copied);
    return true;
}

bool GetStringProperty(napi_env env, napi_value object, const char *name, std::string &result)
{
    napi_value value = GetProperty(env, object, name);
    return value != nullptr && GetString(env, value, result);
}

bool GetUint32Property(napi_env env, napi_value object, const char *name, uint32_t &result)
{
    napi_value value = GetProperty(env, object, name);
    return value != nullptr && GetValueType(env, value) == napi_number &&
        napi_get_value_uint32(env, value, &result) == napi_ok;
}

bool GetBooleanProperty(napi_env env, napi_value object, const char *name, bool &result)
{
    napi_value value = GetProperty(env, object, name);
    return value != nullptr && GetValueType(env, value) == napi_boolean &&
        napi_get_value_bool(env, value, &result) == napi_ok;
}

void SetProperty(napi_env env, napi_value object, const char *name, napi_value value)
{
    if (value != nullptr) {
        napi_set_named_property(env, object, name, value);
    }
}

napi_value CreateResult(napi_env env, int32_t code, const char *dataName = nullptr, napi_value data = nullptr)
{
    napi_value result = nullptr;
    napi_create_object(env, &result);
    SetProperty(env, result, "code", CreateInt32(env, code));
    if (dataName != nullptr) {
        if (data == nullptr) {
            napi_get_undefined(env, &data);
        }
        SetProperty(env, result, dataName, data);
    }
    return result;
}

PrinterInfoData CopyPrinterInfo(const Print_PrinterInfo *source)
{
    PrinterInfoData result;
    if (source == nullptr) {
        return result;
    }
    result.printerId = SafeString(source->printerId);
    result.printerName = SafeString(source->printerName);
    result.printerUri = SafeString(source->printerUri);
    result.printerState = static_cast<uint32_t>(source->printerState);
    result.colorMode = static_cast<uint32_t>(source->defaultValue.defaultColorMode);
    result.copySupported = source->capability.supportedCopies;
    result.isOnline = source->printerState != PRINTER_UNAVAILABLE;
    if (source->capability.supportedPageSizes != nullptr) {
        for (uint32_t index = 0; index < source->capability.supportedPageSizesCount; ++index) {
            const Print_PageSize &sourceSize = source->capability.supportedPageSizes[index];
            PageSizeData pageSize;
            pageSize.id = SafeString(sourceSize.id);
            pageSize.name = SafeString(sourceSize.name);
            pageSize.width = sourceSize.width;
            pageSize.height = sourceSize.height;
            result.pageSizes.push_back(pageSize);
        }
    }
    return result;
}

napi_value CreatePageSize(napi_env env, const PageSizeData &pageSize)
{
    napi_value result = nullptr;
    napi_create_object(env, &result);
    SetProperty(env, result, "id", CreateString(env, pageSize.id));
    SetProperty(env, result, "name", CreateString(env, pageSize.name));
    SetProperty(env, result, "width", CreateUint32(env, pageSize.width));
    SetProperty(env, result, "height", CreateUint32(env, pageSize.height));
    return result;
}

napi_value CreatePrinterInfo(napi_env env, const PrinterInfoData &printerInfo)
{
    napi_value result = nullptr;
    napi_create_object(env, &result);
    SetProperty(env, result, "printerId", CreateString(env, printerInfo.printerId));
    SetProperty(env, result, "printerName", CreateString(env, printerInfo.printerName));
    SetProperty(env, result, "printerUri", CreateString(env, printerInfo.printerUri));
    SetProperty(env, result, "printerState", CreateUint32(env, printerInfo.printerState));
    SetProperty(env, result, "colorMode", CreateUint32(env, printerInfo.colorMode));
    SetProperty(env, result, "copySupported", CreateUint32(env, printerInfo.copySupported));
    napi_value online = nullptr;
    napi_get_boolean(env, printerInfo.isOnline, &online);
    SetProperty(env, result, "isOnline", online);
    napi_value pageSizes = nullptr;
    napi_create_array_with_length(env, printerInfo.pageSizes.size(), &pageSizes);
    for (uint32_t index = 0; index < printerInfo.pageSizes.size(); ++index) {
        napi_set_element(env, pageSizes, index, CreatePageSize(env, printerInfo.pageSizes[index]));
    }
    SetProperty(env, result, "pageSizes", pageSizes);
    return result;
}

void CallPrinterEventJs(napi_env env, napi_value callback, void *, void *data)
{
    PrinterEventData *eventData = static_cast<PrinterEventData *>(data);
    if (env == nullptr || callback == nullptr || eventData == nullptr) {
        delete eventData;
        return;
    }
    napi_value args[] = {CreateUint32(env, eventData->event), CreatePrinterInfo(env, eventData->printerInfo)};
    napi_value ignored = nullptr;
    napi_call_function(env, nullptr, callback, 2, args, &ignored);
    delete eventData;
}

void ReleaseTsfn(std::mutex &mutex, napi_threadsafe_function &tsfn, napi_threadsafe_function_release_mode mode)
{
    napi_threadsafe_function current = nullptr;
    {
        std::lock_guard<std::mutex> lock(mutex);
        current = tsfn;
        tsfn = nullptr;
    }
    if (current != nullptr) {
        napi_release_threadsafe_function(current, mode);
    }
}

bool CreateTsfn(napi_env env, napi_value callback, const char *name,
    napi_threadsafe_function_call_js callJs, napi_threadsafe_function &result)
{
    napi_value resourceName = CreateString(env, name);
    return resourceName != nullptr && napi_create_threadsafe_function(env, callback, nullptr, resourceName, 0, 1,
        nullptr, nullptr, nullptr, callJs, &result) == napi_ok;
}

bool GetStringArray(napi_env env, napi_value value, std::vector<std::string> &result)
{
    bool isArray = false;
    uint32_t length = 0;
    if (napi_is_array(env, value, &isArray) != napi_ok || !isArray ||
        napi_get_array_length(env, value, &length) != napi_ok || length == 0) {
        return false;
    }
    result.reserve(length);
    for (uint32_t index = 0; index < length; ++index) {
        napi_value item = nullptr;
        std::string text;
        if (napi_get_element(env, value, index, &item) != napi_ok || !GetString(env, item, text) || text.empty()) {
            return false;
        }
        result.push_back(text);
    }
    return true;
}

bool GetUint32Array(napi_env env, napi_value value, std::vector<uint32_t> &result)
{
    bool isArray = false;
    uint32_t length = 0;
    if (napi_is_array(env, value, &isArray) != napi_ok || !isArray ||
        napi_get_array_length(env, value, &length) != napi_ok || length == 0) {
        return false;
    }
    result.reserve(length);
    for (uint32_t index = 0; index < length; ++index) {
        napi_value item = nullptr;
        uint32_t number = 0;
        if (napi_get_element(env, value, index, &item) != napi_ok || GetValueType(env, item) != napi_number ||
            napi_get_value_uint32(env, item, &number) != napi_ok) {
            return false;
        }
        result.push_back(number);
    }
    return true;
}

Print_StringList CreateStringList(std::vector<std::string> &values, std::vector<char *> &items)
{
    items.reserve(values.size());
    for (std::string &value : values) {
        items.push_back(value.data());
    }
    Print_StringList result = {static_cast<uint32_t>(items.size()), items.data()};
    return result;
}

Print_DocumentFormat ParseDocumentFormat(const std::string &value)
{
    if (value == "image/jpeg") {
        return DOCUMENT_FORMAT_JPEG;
    }
    if (value == "application/pdf") {
        return DOCUMENT_FORMAT_PDF;
    }
    if (value == "application/postscript") {
        return DOCUMENT_FORMAT_POSTSCRIPT;
    }
    if (value == "text/plain") {
        return DOCUMENT_FORMAT_TEXT;
    }
    return DOCUMENT_FORMAT_AUTO;
}

// [Start print_native_build_job_cpp]
bool BuildPrintJob(napi_env env, napi_value printJobValue, napi_value pageSizeValue, napi_value marginValue,
    napi_value optionValue, PrintJobStorage &storage)
{
    napi_value fdListValue = GetProperty(env, printJobValue, "fdList");
    uint32_t dpi = 0;
    uint32_t colorMode = 0;
    uint32_t duplexMode = 0;
    uint32_t orientationMode = 0;
    uint32_t printQuality = 0;
    std::string documentFormat;
    bool borderless = false;
    bool valid = fdListValue != nullptr && GetUint32Array(env, fdListValue, storage.fdList) &&
        GetStringProperty(env, printJobValue, "printerId", storage.printerId) && !storage.printerId.empty() &&
        GetUint32Property(env, printJobValue, "copyNumber", storage.job.copyNumber) &&
        GetUint32Property(env, printJobValue, "dpi", dpi) &&
        GetUint32Property(env, printJobValue, "colorMode", colorMode) &&
        GetUint32Property(env, printJobValue, "duplexMode", duplexMode) &&
        GetUint32Property(env, printJobValue, "orientationMode", orientationMode) &&
        GetStringProperty(env, pageSizeValue, "id", storage.pageSizeId) && !storage.pageSizeId.empty() &&
        GetUint32Property(env, marginValue, "leftMargin", storage.job.printMargin.leftMargin) &&
        GetUint32Property(env, marginValue, "topMargin", storage.job.printMargin.topMargin) &&
        GetUint32Property(env, marginValue, "rightMargin", storage.job.printMargin.rightMargin) &&
        GetUint32Property(env, marginValue, "bottomMargin", storage.job.printMargin.bottomMargin) &&
        GetStringProperty(env, optionValue, "jobName", storage.jobName) && !storage.jobName.empty() &&
        GetStringProperty(env, optionValue, "paperSource", storage.paperSource) &&
        GetStringProperty(env, optionValue, "mediaType", storage.mediaType) &&
        GetUint32Property(env, optionValue, "printQuality", printQuality) &&
        GetStringProperty(env, optionValue, "documentFormat", documentFormat) &&
        GetBooleanProperty(env, optionValue, "borderless", borderless) &&
        GetStringProperty(env, optionValue, "advancedOptions", storage.advancedOptions);
    if (!valid || storage.job.copyNumber == 0 || printQuality < PRINT_QUALITY_DRAFT ||
        printQuality > PRINT_QUALITY_HIGH || colorMode > COLOR_MODE_AUTO ||
        duplexMode > DUPLEX_MODE_TWO_SIDED_SHORT_EDGE || orientationMode > ORIENTATION_MODE_NONE) {
        return false;
    }
    storage.job.fdList = storage.fdList.data();
    storage.job.fdListCount = static_cast<uint32_t>(storage.fdList.size());
    storage.job.printerId = storage.printerId.data();
    storage.job.jobName = storage.jobName.data();
    storage.job.paperSource = storage.paperSource.empty() ? nullptr : storage.paperSource.data();
    storage.job.mediaType = storage.mediaType.empty() ? nullptr : storage.mediaType.data();
    storage.job.pageSizeId = storage.pageSizeId.data();
    storage.job.colorMode = static_cast<Print_ColorMode>(colorMode);
    storage.job.duplexMode = static_cast<Print_DuplexMode>(duplexMode);
    storage.job.resolution = {dpi, dpi};
    storage.job.borderless = borderless;
    storage.job.orientationMode = static_cast<Print_OrientationMode>(orientationMode);
    storage.job.printQuality = static_cast<Print_Quality>(printQuality);
    storage.job.documentFormat = ParseDocumentFormat(documentFormat);
    storage.job.advancedOptions = storage.advancedOptions.empty() ? nullptr : storage.advancedOptions.data();
    return true;
}
// [End print_native_build_job_cpp]

bool GetPrintArguments(napi_env env, napi_callback_info info, size_t expected, napi_value *args)
{
    size_t count = expected;
    if (napi_get_cb_info(env, info, &count, args, nullptr, nullptr) != napi_ok || count != expected) {
        return false;
    }
    for (size_t index = 0; index < 4; ++index) {
        if (GetValueType(env, args[index]) != napi_object) {
            return false;
        }
    }
    return true;
}

// [Start print_native_lifecycle_cpp]
napi_value NativeInit(napi_env env, napi_callback_info)
{
    std::lock_guard<std::mutex> lock(gServiceMutex);
    if (gInitialized) {
        return CreateInt32(env, PRINT_ERROR_NONE);
    }
    Print_ErrorCode code = OH_Print_Init();
    if (code == PRINT_ERROR_NONE) {
        gInitialized = true;
    }
    return CreateInt32(env, code);
}

napi_value NativeRelease(napi_env env, napi_callback_info)
{
    {
        std::lock_guard<std::mutex> lock(gServiceMutex);
        if (!gInitialized) {
            return CreateInt32(env, PRINT_ERROR_NONE);
        }
    }
    if (gDiscoveryRunning) {
        OH_Print_StopPrinterDiscovery();
        gDiscoveryRunning = false;
    }
    ReleaseTsfn(gDiscoveryMutex, gDiscoveryTsfn, napi_tsfn_abort);
    if (gListenerRegistered) {
        OH_Print_UnregisterPrinterChangeListener();
        gListenerRegistered = false;
    }
    ReleaseTsfn(gPrinterChangeMutex, gPrinterChangeTsfn, napi_tsfn_abort);
    Print_ErrorCode code = OH_Print_Release();
    ReleaseNativePrintTask(napi_tsfn_abort);
    ReleasePrintJobStateTask(napi_tsfn_abort);
    {
        std::lock_guard<std::mutex> lock(gServiceMutex);
        gInitialized = false;
    }
    return CreateInt32(env, code);
}
// [End print_native_lifecycle_cpp]

void PrinterChangeCallback(Print_PrinterEvent event, const Print_PrinterInfo *printerInfo)
{
    if (printerInfo == nullptr) {
        return;
    }
    PrinterEventData *data = new PrinterEventData;
    data->event = static_cast<uint32_t>(event);
    data->printerInfo = CopyPrinterInfo(printerInfo);
    std::lock_guard<std::mutex> lock(gPrinterChangeMutex);
    if (gPrinterChangeTsfn == nullptr ||
        napi_call_threadsafe_function(gPrinterChangeTsfn, data, napi_tsfn_nonblocking) != napi_ok) {
        delete data;
    }
}

napi_value NativeRegisterPrinterChangeListener(napi_env env, napi_callback_info info)
{
    size_t count = 1;
    napi_value args[1] = {nullptr};
    if (napi_get_cb_info(env, info, &count, args, nullptr, nullptr) != napi_ok || count != 1 ||
        GetValueType(env, args[0]) != napi_function) {
        return CreateInt32(env, PRINT_ERROR_INVALID_PARAMETER);
    }
    {
        std::lock_guard<std::mutex> lock(gPrinterChangeMutex);
        if (gPrinterChangeTsfn != nullptr ||
            !CreateTsfn(env, args[0], "PrinterChange", CallPrinterEventJs, gPrinterChangeTsfn)) {
            return CreateInt32(env, ERROR_GENERIC);
        }
    }
    Print_ErrorCode code = OH_Print_RegisterPrinterChangeListener(PrinterChangeCallback);
    if (code != PRINT_ERROR_NONE) {
        ReleaseTsfn(gPrinterChangeMutex, gPrinterChangeTsfn, napi_tsfn_abort);
    } else {
        gListenerRegistered = true;
    }
    return CreateInt32(env, code);
}

napi_value NativeUnregisterPrinterChangeListener(napi_env env, napi_callback_info)
{
    if (gListenerRegistered) {
        OH_Print_UnregisterPrinterChangeListener();
        gListenerRegistered = false;
    }
    ReleaseTsfn(gPrinterChangeMutex, gPrinterChangeTsfn, napi_tsfn_abort);
    return CreateInt32(env, PRINT_ERROR_NONE);
}

// [Start print_native_discovery_cpp]
void PrinterDiscoveryCallback(Print_DiscoveryEvent event, const Print_PrinterInfo *printerInfo)
{
    if (printerInfo == nullptr) {
        return;
    }
    PrinterEventData *data = new PrinterEventData;
    data->event = static_cast<uint32_t>(event);
    data->printerInfo = CopyPrinterInfo(printerInfo);
    std::lock_guard<std::mutex> lock(gDiscoveryMutex);
    if (gDiscoveryTsfn == nullptr ||
        napi_call_threadsafe_function(gDiscoveryTsfn, data, napi_tsfn_nonblocking) != napi_ok) {
        delete data;
    }
}

napi_value NativeStartPrinterDiscovery(napi_env env, napi_callback_info info)
{
    size_t count = 1;
    napi_value args[1] = {nullptr};
    if (napi_get_cb_info(env, info, &count, args, nullptr, nullptr) != napi_ok || count != 1 ||
        GetValueType(env, args[0]) != napi_function) {
        return CreateInt32(env, PRINT_ERROR_INVALID_PARAMETER);
    }
    {
        std::lock_guard<std::mutex> lock(gDiscoveryMutex);
        if (gDiscoveryTsfn != nullptr ||
            !CreateTsfn(env, args[0], "PrinterDiscovery", CallPrinterEventJs, gDiscoveryTsfn)) {
            return CreateInt32(env, ERROR_GENERIC);
        }
    }
    Print_ErrorCode code = OH_Print_StartPrinterDiscovery(PrinterDiscoveryCallback);
    if (code != PRINT_ERROR_NONE) {
        ReleaseTsfn(gDiscoveryMutex, gDiscoveryTsfn, napi_tsfn_abort);
    } else {
        gDiscoveryRunning = true;
    }
    return CreateInt32(env, code);
}

napi_value NativeStopPrinterDiscovery(napi_env env, napi_callback_info)
{
    Print_ErrorCode code = PRINT_ERROR_NONE;
    if (gDiscoveryRunning) {
        code = OH_Print_StopPrinterDiscovery();
        gDiscoveryRunning = false;
    }
    ReleaseTsfn(gDiscoveryMutex, gDiscoveryTsfn, napi_tsfn_abort);
    return CreateInt32(env, code);
}

napi_value NativeConnectPrinter(napi_env env, napi_callback_info info)
{
    size_t count = 1;
    napi_value args[1] = {nullptr};
    std::string printerId;
    if (napi_get_cb_info(env, info, &count, args, nullptr, nullptr) != napi_ok || count != 1 ||
        !GetString(env, args[0], printerId) || printerId.empty()) {
        return CreateInt32(env, PRINT_ERROR_INVALID_PARAMETER);
    }
    return CreateInt32(env, OH_Print_ConnectPrinter(printerId.c_str()));
}
// [End print_native_discovery_cpp]

napi_value NativeLaunchPrinterManager(napi_env env, napi_callback_info)
{
    return CreateInt32(env, OH_Print_LaunchPrinterManager());
}

napi_value NativeQueryPrinterList(napi_env env, napi_callback_info)
{
    Print_StringList printerList = {};
    Print_ErrorCode code = OH_Print_QueryPrinterList(&printerList);
    napi_value printerIds = nullptr;
    napi_create_array(env, &printerIds);
    if (code == PRINT_ERROR_NONE && printerList.list != nullptr) {
        for (uint32_t index = 0; index < printerList.count; ++index) {
            napi_set_element(env, printerIds, index, CreateString(env, SafeString(printerList.list[index])));
        }
    }
    OH_Print_ReleasePrinterList(&printerList);
    return CreateResult(env, code, "printerIds", printerIds);
}

napi_value NativeQueryPrinterInfo(napi_env env, napi_callback_info info)
{
    size_t count = 1;
    napi_value args[1] = {nullptr};
    std::string printerId;
    if (napi_get_cb_info(env, info, &count, args, nullptr, nullptr) != napi_ok || count != 1 ||
        !GetString(env, args[0], printerId) || printerId.empty()) {
        return CreateResult(env, PRINT_ERROR_INVALID_PARAMETER, "printerInfo");
    }
    Print_PrinterInfo *printerInfo = nullptr;
    Print_ErrorCode code = OH_Print_QueryPrinterInfo(printerId.c_str(), &printerInfo);
    napi_value value = nullptr;
    if (code == PRINT_ERROR_NONE && printerInfo != nullptr) {
        PrinterInfoData ownedInfo = CopyPrinterInfo(printerInfo);
        value = CreatePrinterInfo(env, ownedInfo);
        const Print_DefaultValue &defaults = printerInfo->defaultValue;
        napi_value defaultValue = nullptr;
        napi_create_object(env, &defaultValue);
        SetProperty(env, defaultValue, "defaultPageSizeId", CreateString(env, SafeString(defaults.defaultPageSizeId)));
        SetProperty(env, defaultValue, "defaultMediaType", CreateString(env, SafeString(defaults.defaultMediaType)));
        SetProperty(env, defaultValue, "defaultColorMode", CreateUint32(env, defaults.defaultColorMode));
        SetProperty(env, defaultValue, "defaultDuplexMode", CreateUint32(env, defaults.defaultDuplexMode));
        SetProperty(env, defaultValue, "defaultOrientation", CreateUint32(env, defaults.defaultOrientation));
        SetProperty(env, defaultValue, "defaultPrintQuality", CreateUint32(env, defaults.defaultPrintQuality));
        SetProperty(env, value, "defaultValue", defaultValue);
    } else if (code == PRINT_ERROR_NONE) {
        code = PRINT_ERROR_GENERIC_FAILURE;
    }
    if (printerInfo != nullptr) {
        OH_Print_ReleasePrinterInfo(printerInfo);
    }
    return CreateResult(env, code, "printerInfo", value);
}

napi_value NativeQueryPrinterProperties(napi_env env, napi_callback_info info)
{
    size_t count = 2;
    napi_value args[2] = {nullptr};
    std::string printerId;
    std::vector<std::string> keys;
    napi_value properties = nullptr;
    napi_create_array(env, &properties);
    if (napi_get_cb_info(env, info, &count, args, nullptr, nullptr) != napi_ok || count != 2 ||
        !GetString(env, args[0], printerId) || printerId.empty() || !GetStringArray(env, args[1], keys)) {
        return CreateResult(env, PRINT_ERROR_INVALID_PARAMETER, "properties", properties);
    }
    std::vector<char *> keyItems;
    Print_StringList keyList = CreateStringList(keys, keyItems);
    Print_PropertyList propertyList = {};
    Print_ErrorCode code = OH_Print_QueryPrinterProperties(printerId.c_str(), &keyList, &propertyList);
    if (code == PRINT_ERROR_NONE && propertyList.list != nullptr) {
        for (uint32_t index = 0; index < propertyList.count; ++index) {
            napi_value property = nullptr;
            napi_create_object(env, &property);
            SetProperty(env, property, "key", CreateString(env, SafeString(propertyList.list[index].key)));
            SetProperty(env, property, "value", CreateString(env, SafeString(propertyList.list[index].value)));
            napi_set_element(env, properties, index, property);
        }
    }
    OH_Print_ReleasePrinterProperties(&propertyList);
    return CreateResult(env, code, "properties", properties);
}

napi_value NativeUpdatePrinterProperties(napi_env env, napi_callback_info info)
{
    size_t count = 2;
    napi_value args[2] = {nullptr};
    std::string printerId;
    bool isArray = false;
    uint32_t length = 0;
    if (napi_get_cb_info(env, info, &count, args, nullptr, nullptr) != napi_ok || count != 2 ||
        !GetString(env, args[0], printerId) || printerId.empty() ||
        napi_is_array(env, args[1], &isArray) != napi_ok || !isArray ||
        napi_get_array_length(env, args[1], &length) != napi_ok || length == 0) {
        return CreateInt32(env, PRINT_ERROR_INVALID_PARAMETER);
    }
    std::vector<std::string> keys;
    std::vector<std::string> values;
    keys.reserve(length);
    values.reserve(length);
    for (uint32_t index = 0; index < length; ++index) {
        napi_value property = nullptr;
        std::string key;
        std::string value;
        if (napi_get_element(env, args[1], index, &property) != napi_ok ||
            !GetStringProperty(env, property, "key", key) || key.empty() ||
            !GetStringProperty(env, property, "value", value)) {
            return CreateInt32(env, PRINT_ERROR_INVALID_PARAMETER);
        }
        keys.push_back(key);
        values.push_back(value);
    }
    std::vector<Print_Property> properties(length);
    for (uint32_t index = 0; index < length; ++index) {
        properties[index] = {keys[index].data(), values[index].data()};
    }
    Print_PropertyList propertyList = {length, properties.data()};
    return CreateInt32(env, OH_Print_UpdatePrinterProperties(printerId.c_str(), &propertyList));
}

napi_value NativeRestorePrinterProperties(napi_env env, napi_callback_info info)
{
    size_t count = 2;
    napi_value args[2] = {nullptr};
    std::string printerId;
    std::vector<std::string> keys;
    if (napi_get_cb_info(env, info, &count, args, nullptr, nullptr) != napi_ok || count != 2 ||
        !GetString(env, args[0], printerId) || printerId.empty() || !GetStringArray(env, args[1], keys)) {
        return CreateInt32(env, PRINT_ERROR_INVALID_PARAMETER);
    }
    std::vector<char *> keyItems;
    Print_StringList keyList = CreateStringList(keys, keyItems);
    return CreateInt32(env, OH_Print_RestorePrinterProperties(printerId.c_str(), &keyList));
}

void CallNativePrintEventJs(napi_env env, napi_value callback, void *, void *data)
{
    NativePrintEventData *eventData = static_cast<NativePrintEventData *>(data);
    if (env == nullptr || callback == nullptr || eventData == nullptr) {
        delete eventData;
        return;
    }
    napi_value event = nullptr;
    napi_create_object(env, &event);
    SetProperty(env, event, "eventType", CreateUint32(env, eventData->eventType));
    SetProperty(env, event, "jobId", CreateString(env, eventData->jobId));
    SetProperty(env, event, "state", CreateUint32(env, eventData->state));
    SetProperty(env, event, "writeCode", CreateUint32(env, eventData->writeCode));
    napi_value ignored = nullptr;
    napi_call_function(env, nullptr, callback, 1, &event, &ignored);
    delete eventData;
}

void ReleaseNativePrintTask(napi_threadsafe_function_release_mode mode)
{
    int32_t sourceFd = -1;
    napi_threadsafe_function tsfn = nullptr;
    {
        std::lock_guard<std::mutex> lock(gNativePrintMutex);
        sourceFd = gNativePrintSourceFd;
        gNativePrintSourceFd = -1;
        tsfn = gNativePrintTsfn;
        gNativePrintTsfn = nullptr;
    }
    if (sourceFd >= 0) {
        close(sourceFd);
    }
    if (tsfn != nullptr) {
        napi_release_threadsafe_function(tsfn, mode);
    }
}

void NotifyNativePrintEvent(uint32_t eventType, const char *jobId, uint32_t state, uint32_t writeCode)
{
    NativePrintEventData *data = new NativePrintEventData;
    data->eventType = eventType;
    data->jobId = SafeString(jobId);
    data->state = state;
    data->writeCode = writeCode;
    std::lock_guard<std::mutex> lock(gNativePrintMutex);
    if (gNativePrintTsfn == nullptr ||
        napi_call_threadsafe_function(gNativePrintTsfn, data, napi_tsfn_nonblocking) != napi_ok) {
        delete data;
    }
}

uint32_t CopyFileToPrintFd(uint32_t destinationFd)
{
    int32_t sourceFd = -1;
    {
        std::lock_guard<std::mutex> lock(gNativePrintMutex);
        if (gNativePrintSourceFd >= 0) {
            sourceFd = dup(gNativePrintSourceFd);
        }
    }
    if (sourceFd < 0 || lseek(sourceFd, 0, SEEK_SET) < 0) {
        if (sourceFd >= 0) {
            close(sourceFd);
        }
        return PRINT_ERROR_FILE_IO;
    }
    char buffer[4096];
    uint32_t code = PRINT_ERROR_NONE;
    ssize_t bytesRead = 0;
    while ((bytesRead = read(sourceFd, buffer, sizeof(buffer))) > 0) {
        ssize_t offset = 0;
        while (offset < bytesRead) {
            ssize_t bytesWritten = write(static_cast<int32_t>(destinationFd), buffer + offset, bytesRead - offset);
            if (bytesWritten <= 0) {
                code = PRINT_ERROR_FILE_IO;
                break;
            }
            offset += bytesWritten;
        }
        if (code != PRINT_ERROR_NONE) {
            break;
        }
    }
    if (bytesRead < 0) {
        code = PRINT_ERROR_FILE_IO;
    }
    close(sourceFd);
    return code;
}

// [Start print_native_preview_cpp]
void NativeStartLayoutWrite(const char *jobId, uint32_t fd, const Print_PrintAttributes *,
    const Print_PrintAttributes *, Print_WriteResultCallback writeCallback)
{
    const uint32_t ioCode = CopyFileToPrintFd(fd);
    if (ioCode != PRINT_ERROR_NONE) {
        LOGE("Failed to copy PDF, error=%{public}u", ioCode);
    }
    const int closeResult = close(static_cast<int32_t>(fd));
    if (closeResult != 0) {
        LOGE("Failed to close layout file, errno=%{public}d", errno);
    }
    // Print_WriteResultCallback uses file creation results: 0 = success, 1 = failure.
    const uint32_t writeResult = ioCode == PRINT_ERROR_NONE && closeResult == 0 ? 0 : 1;
    NotifyNativePrintEvent(0, jobId, 0, writeResult);
    if (writeCallback != nullptr) {
        writeCallback(jobId, writeResult);
    }
}

void NativeJobStateChanged(const char *jobId, uint32_t state)
{
    NotifyNativePrintEvent(1, jobId, state, 0);
    if (state != PRINT_DOC_ADAPTER_PRINT_TASK_BLOCK) {
        ReleaseNativePrintTask(napi_tsfn_release);
    }
}

napi_value NativeStartPrintByNative(napi_env env, napi_callback_info info)
{
    size_t count = 4;
    napi_value args[4] = {nullptr};
    std::string jobName;
    int32_t sourceFd = -1;
    void *context = nullptr;
    if (napi_get_cb_info(env, info, &count, args, nullptr, nullptr) != napi_ok || count != 4 ||
        !GetString(env, args[0], jobName) || jobName.empty() || GetValueType(env, args[1]) != napi_number ||
        napi_get_value_int32(env, args[1], &sourceFd) != napi_ok || sourceFd < 0 ||
        napi_unwrap(env, args[2], &context) != napi_ok || context == nullptr ||
        GetValueType(env, args[3]) != napi_function) {
        return CreateInt32(env, PRINT_ERROR_INVALID_PARAMETER);
    }
    {
        std::lock_guard<std::mutex> lock(gNativePrintMutex);
        if (gNativePrintTsfn != nullptr ||
            !CreateTsfn(env, args[3], "NativePrint", CallNativePrintEventJs, gNativePrintTsfn)) {
            return CreateInt32(env, ERROR_GENERIC);
        }
        gNativePrintSourceFd = dup(sourceFd);
        if (gNativePrintSourceFd < 0) {
            napi_threadsafe_function failed = gNativePrintTsfn;
            gNativePrintTsfn = nullptr;
            napi_release_threadsafe_function(failed, napi_tsfn_abort);
            return CreateInt32(env, PRINT_ERROR_FILE_IO);
        }
    }
    Print_PrintDocCallback callback = {NativeStartLayoutWrite, NativeJobStateChanged};
    Print_ErrorCode code = OH_Print_StartPrintByNative(jobName.c_str(), callback, context);
    if (code != PRINT_ERROR_NONE) {
        ReleaseNativePrintTask(napi_tsfn_abort);
    }
    return CreateInt32(env, code);
}
// [End print_native_preview_cpp]

// [Start print_native_start_job_cpp]
napi_value NativeStartPrintJob(napi_env env, napi_callback_info info)
{
    napi_value args[4] = {nullptr};
    if (!GetPrintArguments(env, info, 4, args)) {
        return CreateInt32(env, PRINT_ERROR_INVALID_PARAMETER);
    }
    PrintJobStorage storage;
    if (!BuildPrintJob(env, args[0], args[1], args[2], args[3], storage)) {
        return CreateInt32(env, PRINT_ERROR_INVALID_PARAMETER);
    }
    return CreateInt32(env, OH_Print_StartPrintJob(&storage.job));
}
// [End print_native_start_job_cpp]

// [Start print_native_default_job_cpp]
napi_value NativeStartPrintJobWithDefaultSettings(napi_env env, napi_callback_info info)
{
    size_t count = 2;
    napi_value args[2] = {nullptr};
    int32_t fd = -1;
    std::string documentFormat;
    if (napi_get_cb_info(env, info, &count, args, nullptr, nullptr) != napi_ok || count != 2 ||
        napi_get_value_int32(env, args[0], &fd) != napi_ok || fd < 0 ||
        !GetString(env, args[1], documentFormat) ||
        (documentFormat != "application/pdf" && documentFormat != "image/jpeg")) {
        return CreateInt32(env, PRINT_ERROR_INVALID_PARAMETER);
    }
    Print_StringList printerList = {};
    Print_ErrorCode code = OH_Print_QueryPrinterList(&printerList);
    if (code != PRINT_ERROR_NONE || printerList.list == nullptr || printerList.count == 0 ||
        printerList.list[0] == nullptr || printerList.list[0][0] == '\0') {
        OH_Print_ReleasePrinterList(&printerList);
        return CreateInt32(env, code == PRINT_ERROR_NONE ? PRINT_ERROR_INVALID_PRINTER : code);
    }
    Print_PrinterInfo *printerInfo = nullptr;
    code = OH_Print_QueryPrinterInfo(printerList.list[0], &printerInfo);
    OH_Print_ReleasePrinterList(&printerList);
    if (code != PRINT_ERROR_NONE || printerInfo == nullptr) {
        if (printerInfo != nullptr) {
            OH_Print_ReleasePrinterInfo(printerInfo);
        }
        return CreateInt32(env, code == PRINT_ERROR_NONE ? PRINT_ERROR_GENERIC_FAILURE : code);
    }
    const Print_DefaultValue &defaults = printerInfo->defaultValue;
    uint32_t fdList[] = {static_cast<uint32_t>(fd)};
    char jobName[] = "NativePrintFileDefaults";
    Print_PrintJob job = {};
    job.jobName = jobName;
    job.fdList = fdList;
    job.fdListCount = 1;
    job.printerId = printerInfo->printerId;
    job.copyNumber = defaults.defaultCopies == 0 ? 1 : defaults.defaultCopies;
    job.paperSource = defaults.defaultPaperSource;
    job.mediaType = defaults.defaultMediaType;
    job.pageSizeId = defaults.defaultPageSizeId;
    job.colorMode = defaults.defaultColorMode;
    job.duplexMode = defaults.defaultDuplexMode;
    job.resolution = defaults.defaultResolution;
    job.printMargin = defaults.defaultMargin;
    job.borderless = false;
    job.orientationMode = defaults.defaultOrientation;
    job.printQuality = defaults.defaultPrintQuality;
    job.documentFormat = ParseDocumentFormat(documentFormat);
    job.advancedOptions = defaults.otherDefaultValues;
    LOGI("Print with printer defaults, printerId=%{public}s", SafeString(job.printerId).c_str());
    code = OH_Print_StartPrintJob(&job);
    OH_Print_ReleasePrinterInfo(printerInfo);
    return CreateInt32(env, code);
}
// [End print_native_default_job_cpp]

void CallPrintJobStateEventJs(napi_env env, napi_value callback, void *, void *data)
{
    PrintJobStateEventData *eventData = static_cast<PrintJobStateEventData *>(data);
    if (env == nullptr || callback == nullptr || eventData == nullptr) {
        delete eventData;
        return;
    }
    napi_value event = nullptr;
    napi_create_object(env, &event);
    SetProperty(env, event, "jobId", CreateString(env, eventData->jobId));
    SetProperty(env, event, "state", CreateUint32(env, eventData->state));
    napi_value ignored = nullptr;
    napi_call_function(env, nullptr, callback, 1, &event, &ignored);
    delete eventData;
}

void ReleasePrintJobStateTask(napi_threadsafe_function_release_mode mode)
{
    ReleaseTsfn(gPrintJobStateMutex, gPrintJobStateTsfn, mode);
}

// [Start print_native_job_state_cpp]
void PrintJobStateChanged(const char *jobId, OH_Print_JobState state)
{
    PrintJobStateEventData *data = new PrintJobStateEventData;
    data->jobId = SafeString(jobId);
    data->state = static_cast<uint32_t>(state);
    {
        std::lock_guard<std::mutex> lock(gPrintJobStateMutex);
        if (gPrintJobStateTsfn == nullptr ||
            napi_call_threadsafe_function(gPrintJobStateTsfn, data, napi_tsfn_nonblocking) != napi_ok) {
            delete data;
        }
    }
    if (state != OH_PRINT_JOB_BLOCK) {
        ReleasePrintJobStateTask(napi_tsfn_release);
    }
}

napi_value NativeStartPrintWithJobStateCallback(napi_env env, napi_callback_info info)
{
    napi_value args[5] = {nullptr};
    if (!GetPrintArguments(env, info, 5, args) || GetValueType(env, args[4]) != napi_function) {
        return CreateInt32(env, PRINT_ERROR_INVALID_PARAMETER);
    }
    PrintJobStorage storage;
    if (!BuildPrintJob(env, args[0], args[1], args[2], args[3], storage)) {
        return CreateInt32(env, PRINT_ERROR_INVALID_PARAMETER);
    }
    {
        std::lock_guard<std::mutex> lock(gPrintJobStateMutex);
        if (gPrintJobStateTsfn != nullptr ||
            !CreateTsfn(env, args[4], "PrintJobState", CallPrintJobStateEventJs, gPrintJobStateTsfn)) {
            return CreateInt32(env, ERROR_GENERIC);
        }
    }
    Print_ErrorCode code = OH_Print_StartPrintWithJobStateCallback(&storage.job, PrintJobStateChanged);
    if (code != PRINT_ERROR_NONE) {
        ReleasePrintJobStateTask(napi_tsfn_abort);
    }
    return CreateInt32(env, code);
}
// [End print_native_job_state_cpp]

} // namespace

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    // [Start print_native_napi_exports]
    napi_property_descriptor properties[] = {
        {"nativeInit", nullptr, NativeInit, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"nativeRelease", nullptr, NativeRelease, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"nativeRegisterPrinterChangeListener", nullptr, NativeRegisterPrinterChangeListener, nullptr, nullptr,
            nullptr, napi_default, nullptr},
        {"nativeUnregisterPrinterChangeListener", nullptr, NativeUnregisterPrinterChangeListener, nullptr, nullptr,
            nullptr, napi_default, nullptr},
        {"nativeStartPrinterDiscovery", nullptr, NativeStartPrinterDiscovery, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"nativeStopPrinterDiscovery", nullptr, NativeStopPrinterDiscovery, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"nativeConnectPrinter", nullptr, NativeConnectPrinter, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"nativeLaunchPrinterManager", nullptr, NativeLaunchPrinterManager, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"nativeQueryPrinterList", nullptr, NativeQueryPrinterList, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"nativeQueryPrinterInfo", nullptr, NativeQueryPrinterInfo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"nativeQueryPrinterProperties", nullptr, NativeQueryPrinterProperties, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"nativeUpdatePrinterProperties", nullptr, NativeUpdatePrinterProperties, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"nativeRestorePrinterProperties", nullptr, NativeRestorePrinterProperties, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"nativeStartPrintByNative", nullptr, NativeStartPrintByNative, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"nativeStartPrintJob", nullptr, NativeStartPrintJob, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"nativeStartPrintJobWithDefaultSettings", nullptr, NativeStartPrintJobWithDefaultSettings, nullptr, nullptr,
            nullptr, napi_default, nullptr},
        {"nativeStartPrintWithJobStateCallback", nullptr, NativeStartPrintWithJobStateCallback, nullptr, nullptr,
            nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(properties) / sizeof(properties[0]), properties);
    // [End print_native_napi_exports]
    return exports;
}
EXTERN_C_END

static napi_module nativePrintModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "entry",
    .nm_priv = nullptr,
    .reserved = {nullptr},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule()
{
    napi_module_register(&nativePrintModule);
}
