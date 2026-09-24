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

#ifndef DEVICE_API_H
#define DEVICE_API_H

#include <string>
#include "GameControllerKit/game_device_event.h"
#include "napi/native_api.h"

/**
 * @brief Encapsulates the game device APIs of GameControllerKit:
 * device status monitor and online device query.
 */
class DeviceApi {
public:
    static napi_value RegisterDeviceMonitor(napi_env env, napi_callback_info info);
    static napi_value UnregisterDeviceMonitor(napi_env env, napi_callback_info info);
    static GameController_ErrorCode DoQueryAllDeviceInfos();
    static void OnDeviceChanged(const struct GameDevice_DeviceEvent *deviceEvent);
    static std::string GetDeviceInfoStringForPrint(GameDevice_DeviceInfo *deviceInfo);
};

#endif // DEVICE_API_H
