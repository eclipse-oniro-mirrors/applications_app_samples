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

#include <string>
#include "GameControllerKit/game_device.h"
#include "device_api.h"
#include "game_controller_log.h"
#include "hilog/log.h"

// [Start register_device_monitor]
int32_t DeviceApi::RegisterDeviceMonitor()
{
    GameController_ErrorCode errorCode = OH_GameDevice_RegisterDeviceMonitor(DeviceApi::OnDeviceChanged);
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "RegisterDeviceMonitor Failed, %{public}d", errorCode);
        return static_cast<int32_t>(errorCode);
    }
    OH_LOG_INFO(LOG_APP, "RegisterDeviceMonitor Success");
    return 0;
}

void DeviceApi::OnDeviceChanged(const struct GameDevice_DeviceEvent *deviceEvent)
{
    GameDevice_StatusChangedType type;
    OH_GameDevice_DeviceEvent_GetChangedType(deviceEvent, &type);
    GameDevice_DeviceInfo *deviceInfo;
    OH_GameDevice_DeviceEvent_GetDeviceInfo(deviceEvent, &deviceInfo);
    std::string temp = GetDeviceInfoStringForPrint(deviceInfo);
    Log::GetInstance()->PrintLog("OnDeviceChanged type[" + std::to_string(type) + "] DeviceInfo" + temp);
    OH_LOG_INFO(LOG_APP, "OnDeviceChanged type:%{public}d DeviceInfo:%{public}s", type, temp.c_str());
    OH_GameDevice_DestroyDeviceInfo(&deviceInfo);
}
// [End register_device_monitor]

// [Start unregister_device_monitor]
int32_t DeviceApi::UnregisterDeviceMonitor()
{
    GameController_ErrorCode errorCode = OH_GameDevice_UnregisterDeviceMonitor();
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "UnregisterDeviceMonitor Failed, %{public}d", errorCode);
        return static_cast<int32_t>(errorCode);
    }
    OH_LOG_INFO(LOG_APP, "UnregisterDeviceMonitor Success");
    return 0;
}
// [End unregister_device_monitor]

// [Start query_all_device_infos]
GameController_ErrorCode DeviceApi::DoQueryAllDeviceInfos()
{
    GameDevice_AllDeviceInfos *gameDeviceAllDeviceInfos;
    
    // Query all online devices.
    GameController_ErrorCode errorCode = OH_GameDevice_GetAllDeviceInfos(&gameDeviceAllDeviceInfos);
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "GetAllDeviceInfos Failed, %{public}d", errorCode);
        Log::GetInstance()->PrintLog("GetAllDeviceInfos Failed, errorCode: " + std::to_string(errorCode));
        return errorCode;
    }
    
    // Obtain device info one by one.
    int count;
    OH_GameDevice_AllDeviceInfos_GetCount(gameDeviceAllDeviceInfos, &count);
    Log::GetInstance()->PrintLog("GetAllDeviceInfos Success, the count is " + std::to_string(count));
    for (int idx = 0; idx < count; idx++) {
        GameDevice_DeviceInfo *deviceInfo;
        errorCode = OH_GameDevice_AllDeviceInfos_GetDeviceInfo(gameDeviceAllDeviceInfos, idx, &deviceInfo);
        if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
            OH_LOG_ERROR(LOG_APP, "OH_GameDevice_AllDeviceInfos_GetDeviceInfo Failed, %{public}d", errorCode);
            Log::GetInstance()->PrintLog("OH_GameDevice_AllDeviceInfos_GetDeviceInfo Failed, errorCode: " +
                                         std::to_string(errorCode));
            OH_GameDevice_DestroyAllDeviceInfos(&gameDeviceAllDeviceInfos);
            return errorCode;
        }
        std::string temp = GetDeviceInfoStringForPrint(deviceInfo);
        Log::GetInstance()->PrintLog("AllDeviceInfos[" + std::to_string(idx) + "] " + temp);
        OH_LOG_INFO(LOG_APP, "AllDeviceInfos[%{public}d] DeviceInfo: %{public}s", idx, temp.c_str());
        OH_GameDevice_DestroyDeviceInfo(&deviceInfo);
    }
    
    // Destroy the pointer to the device query result.
    OH_GameDevice_DestroyAllDeviceInfos(&gameDeviceAllDeviceInfos);
    OH_LOG_INFO(LOG_APP, "GetAllDeviceInfos Success");
    return errorCode;
}

std::string DeviceApi::GetDeviceInfoStringForPrint(GameDevice_DeviceInfo *deviceInfo)
{
    std::string log;
    char *deviceId = nullptr;
    OH_GameDevice_DeviceInfo_GetDeviceId(deviceInfo, &deviceId);
    log.append("deviceId:").append(deviceId);
    free(deviceId);
    char *name = nullptr;
    OH_GameDevice_DeviceInfo_GetName(deviceInfo, &name);
    log.append(", name:").append(name);
    free(name);
    int vendor;
    OH_GameDevice_DeviceInfo_GetVendor(deviceInfo, &vendor);
    log.append(", vendor:").append(std::to_string(vendor));
    int product;
    OH_GameDevice_DeviceInfo_GetProduct(deviceInfo, &product);
    log.append(", product:").append(std::to_string(product));
    int version;
    OH_GameDevice_DeviceInfo_GetVersion(deviceInfo, &version);
    log.append(", version:").append(std::to_string(version));
    char *physicalAddress = nullptr;
    OH_GameDevice_DeviceInfo_GetPhysicalAddress(deviceInfo, &physicalAddress);
    log.append(", physicalAddress:").append(physicalAddress);
    free(physicalAddress);
    GameDevice_DeviceType type;
    OH_GameDevice_DeviceInfo_GetDeviceType(deviceInfo, &type);
    log.append(", type:").append(std::to_string(type));
    return log;
}
// [End query_all_device_infos]
