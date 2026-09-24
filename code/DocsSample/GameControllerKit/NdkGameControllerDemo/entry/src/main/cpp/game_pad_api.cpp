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
#include "GameControllerKit/game_pad.h"
#include "game_pad_api.h"
#include "game_controller_log.h"
#include "hilog/log.h"

// [Start button_input_monitor]
napi_value GamePad::LeftShoulder_RegisterButtonInputMonitor(napi_env env, napi_callback_info info) {
    napi_value result;
    GameController_ErrorCode errorCode =
        OH_GamePad_LeftShoulder_RegisterButtonInputMonitor(GamePad::LeftShoulder_OnButtonEvent);
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "LeftShoulder_RegisterButtonInputMonitor Failed, %{public}d", errorCode);
        napi_create_double(env, errorCode, &result);
        return result;
    }
    OH_LOG_INFO(LOG_APP, "LeftShoulder_RegisterButtonInputMonitor Success");
    napi_create_double(env, 0, &result);
    return result;
}

napi_value GamePad::LeftShoulder_UnregisterButtonInputMonitor(napi_env env, napi_callback_info info) {
    napi_value result;
    GameController_ErrorCode errorCode = OH_GamePad_LeftShoulder_UnregisterButtonInputMonitor();
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "LeftShoulder_UnregisterButtonInputMonitor Failed, %{public}d", errorCode);
        napi_create_double(env, errorCode, &result);
        return result;
    }
    OH_LOG_INFO(LOG_APP, "LeftShoulder_UnregisterButtonInputMonitor Success");
    napi_create_double(env, 0, &result);
    return result;
}

void GamePad::LeftShoulder_OnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent) {
    OnButtonEvent(buttonEvent, "LeftShoulder_OnButtonEvent");
}

void GamePad::OnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent, const std::string &buttonName) {
    std::string temp;
    temp.append("OnButtonEvent:").append(buttonName);
    char *deviceId;
    OH_GamePad_ButtonEvent_GetDeviceId(buttonEvent, &deviceId);
    temp.append(" ,deviceId:").append(deviceId);
    free(deviceId);
    GamePad_Button_ActionType action;
    OH_GamePad_ButtonEvent_GetButtonAction(buttonEvent, &action);
    temp.append(" ,action:").append(std::to_string(action));
    std::int32_t buttonCode;
    OH_GamePad_ButtonEvent_GetButtonCode(buttonEvent, &buttonCode);
    temp.append(" ,code:").append(std::to_string(buttonCode));
    char *buttonCodeName;
    OH_GamePad_ButtonEvent_GetButtonCodeName(buttonEvent, &buttonCodeName);
    temp.append(" ,codeName:").append(buttonCodeName);
    free(buttonCodeName);
    std::int64_t actionTime;
    OH_GamePad_ButtonEvent_GetActionTime(buttonEvent, &actionTime);
    temp.append(" ,actionTime:").append(std::to_string(actionTime));
    std::int32_t count;
    OH_GamePad_PressedButtons_GetCount(buttonEvent, &count);
    temp.append(" ,count:").append(std::to_string(count));
    std::string pressedButtonCodes;
    for (std::int32_t idx = 0; idx < count; idx++) {
        GamePad_PressedButton *pressedButton;
        OH_GamePad_PressedButtons_GetButtonInfo(buttonEvent, idx, &pressedButton);
        int code;
        OH_GamePad_PressedButton_GetButtonCode(pressedButton, &code);
        char *name;
        OH_GamePad_PressedButton_GetButtonCodeName(pressedButton, &name);
        if (idx != 0) {
            pressedButtonCodes = pressedButtonCodes.append(";");
        }
        pressedButtonCodes = pressedButtonCodes.append(std::to_string(code) + "|").append(name);
        free(name);
        OH_GamePad_DestroyPressedButton(&pressedButton);
    }
    temp.append(" ,pressedButtonCodes:").append(pressedButtonCodes);
    OH_LOG_INFO(LOG_APP, "%{public}s", temp.c_str());
    Log::GetInstance()->PrintLog(temp);
}
// [End button_input_monitor]

// The other button monitors follow the same pattern as LeftShoulder.
napi_value GamePad::RightShoulder_RegisterButtonInputMonitor(napi_env env, napi_callback_info info) {
    napi_value result;
    GameController_ErrorCode errorCode =
        OH_GamePad_RightShoulder_RegisterButtonInputMonitor(GamePad::RightShoulder_OnButtonEvent);
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "RightShoulder_RegisterButtonInputMonitor Failed, %{public}d", errorCode);
        napi_create_double(env, errorCode, &result);
        return result;
    }
    OH_LOG_INFO(LOG_APP, "RightShoulder_RegisterButtonInputMonitor Success");
    napi_create_double(env, 0, &result);
    return result;
}

napi_value GamePad::RightShoulder_UnregisterButtonInputMonitor(napi_env env, napi_callback_info info) {
    napi_value result;
    GameController_ErrorCode errorCode = OH_GamePad_RightShoulder_UnregisterButtonInputMonitor();
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "RightShoulder_UnregisterButtonInputMonitor Failed, %{public}d", errorCode);
        napi_create_double(env, errorCode, &result);
        return result;
    }
    OH_LOG_INFO(LOG_APP, "RightShoulder_UnregisterButtonInputMonitor Success");
    napi_create_double(env, 0, &result);
    return result;
}

void GamePad::RightShoulder_OnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent) {
    OnButtonEvent(buttonEvent, "RightShoulder_OnButtonEvent");
}

napi_value GamePad::LeftTrigger_RegisterButtonInputMonitor(napi_env env, napi_callback_info info) {
    napi_value result;
    GameController_ErrorCode errorCode =
        OH_GamePad_LeftTrigger_RegisterButtonInputMonitor(GamePad::LeftTrigger_OnButtonEvent);
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "LeftTrigger_RegisterButtonInputMonitor Failed, %{public}d", errorCode);
        napi_create_double(env, errorCode, &result);
        return result;
    }
    OH_LOG_INFO(LOG_APP, "LeftTrigger_RegisterButtonInputMonitor Success");
    napi_create_double(env, 0, &result);
    return result;
}

napi_value GamePad::LeftTrigger_UnregisterButtonInputMonitor(napi_env env, napi_callback_info info) {
    napi_value result;
    GameController_ErrorCode errorCode = OH_GamePad_LeftTrigger_UnregisterButtonInputMonitor();
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "LeftTrigger_UnregisterButtonInputMonitor Failed, %{public}d", errorCode);
        napi_create_double(env, errorCode, &result);
        return result;
    }
    OH_LOG_INFO(LOG_APP, "LeftTrigger_UnregisterButtonInputMonitor Success");
    napi_create_double(env, 0, &result);
    return result;
}

void GamePad::LeftTrigger_OnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent) {
    OnButtonEvent(buttonEvent, "LeftTrigger_OnButtonEvent");
}

napi_value GamePad::RightTrigger_RegisterButtonInputMonitor(napi_env env, napi_callback_info info) {
    napi_value result;
    GameController_ErrorCode errorCode =
        OH_GamePad_RightTrigger_RegisterButtonInputMonitor(GamePad::RightTrigger_OnButtonEvent);
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "RightTrigger_RegisterButtonInputMonitor Failed, %{public}d", errorCode);
        napi_create_double(env, errorCode, &result);
        return result;
    }
    OH_LOG_INFO(LOG_APP, "RightTrigger_RegisterButtonInputMonitor Success");
    napi_create_double(env, 0, &result);
    return result;
}

napi_value GamePad::RightTrigger_UnregisterButtonInputMonitor(napi_env env, napi_callback_info info) {
    napi_value result;
    GameController_ErrorCode errorCode = OH_GamePad_RightTrigger_UnregisterButtonInputMonitor();
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "RightTrigger_UnregisterButtonInputMonitor Failed, %{public}d", errorCode);
        napi_create_double(env, errorCode, &result);
        return result;
    }
    OH_LOG_INFO(LOG_APP, "RightTrigger_UnregisterButtonInputMonitor Success");
    napi_create_double(env, 0, &result);
    return result;
}

void GamePad::RightTrigger_OnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent) {
    OnButtonEvent(buttonEvent, "RightTrigger_OnButtonEvent");
}

napi_value GamePad::ButtonMenu_RegisterButtonInputMonitor(napi_env env, napi_callback_info info) {
    napi_value result;
    GameController_ErrorCode errorCode =
        OH_GamePad_ButtonMenu_RegisterButtonInputMonitor(GamePad::ButtonMenu_OnButtonEvent);
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "ButtonMenu_RegisterButtonInputMonitor Failed, %{public}d", errorCode);
        napi_create_double(env, errorCode, &result);
        return result;
    }
    OH_LOG_INFO(LOG_APP, "ButtonMenu_RegisterButtonInputMonitor Success");
    napi_create_double(env, 0, &result);
    return result;
}

napi_value GamePad::ButtonMenu_UnregisterButtonInputMonitor(napi_env env, napi_callback_info info) {
    napi_value result;
    GameController_ErrorCode errorCode = OH_GamePad_ButtonMenu_UnregisterButtonInputMonitor();
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "ButtonMenu_UnregisterButtonInputMonitor Failed, %{public}d", errorCode);
        napi_create_double(env, errorCode, &result);
        return result;
    }
    OH_LOG_INFO(LOG_APP, "ButtonMenu_UnregisterButtonInputMonitor Success");
    napi_create_double(env, 0, &result);
    return result;
}

void GamePad::ButtonMenu_OnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent) {
    OnButtonEvent(buttonEvent, "ButtonMenu_OnButtonEvent");
}

napi_value GamePad::ButtonHome_RegisterButtonInputMonitor(napi_env env, napi_callback_info info) {
    napi_value result;
    GameController_ErrorCode errorCode =
        OH_GamePad_ButtonHome_RegisterButtonInputMonitor(GamePad::ButtonHome_OnButtonEvent);
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "ButtonHome_RegisterButtonInputMonitor Failed, %{public}d", errorCode);
        napi_create_double(env, errorCode, &result);
        return result;
    }
    OH_LOG_INFO(LOG_APP, "ButtonHome_RegisterButtonInputMonitor Success");
    napi_create_double(env, 0, &result);
    return result;
}

napi_value GamePad::ButtonHome_UnregisterButtonInputMonitor(napi_env env, napi_callback_info info) {
    napi_value result;
    GameController_ErrorCode errorCode = OH_GamePad_ButtonHome_UnregisterButtonInputMonitor();
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "ButtonHome_UnregisterButtonInputMonitor Failed, %{public}d", errorCode);
        napi_create_double(env, errorCode, &result);
        return result;
    }
    OH_LOG_INFO(LOG_APP, "ButtonHome_UnregisterButtonInputMonitor Success");
    napi_create_double(env, 0, &result);
    return result;
}

void GamePad::ButtonHome_OnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent) {
    OnButtonEvent(buttonEvent, "ButtonHome_OnButtonEvent");
}

napi_value GamePad::ButtonA_RegisterButtonInputMonitor(napi_env env, napi_callback_info info) {
    napi_value result;
    GameController_ErrorCode errorCode =
        OH_GamePad_ButtonA_RegisterButtonInputMonitor(GamePad::ButtonA_OnButtonEvent);
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "ButtonA_RegisterButtonInputMonitor Failed, %{public}d", errorCode);
        napi_create_double(env, errorCode, &result);
        return result;
    }
    OH_LOG_INFO(LOG_APP, "ButtonA_RegisterButtonInputMonitor Success");
    napi_create_double(env, 0, &result);
    return result;
}

napi_value GamePad::ButtonA_UnregisterButtonInputMonitor(napi_env env, napi_callback_info info) {
    napi_value result;
    GameController_ErrorCode errorCode = OH_GamePad_ButtonA_UnregisterButtonInputMonitor();
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "ButtonA_UnregisterButtonInputMonitor Failed, %{public}d", errorCode);
        napi_create_double(env, errorCode, &result);
        return result;
    }
    OH_LOG_INFO(LOG_APP, "ButtonA_UnregisterButtonInputMonitor Success");
    napi_create_double(env, 0, &result);
    return result;
}

void GamePad::ButtonA_OnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent) {
    OnButtonEvent(buttonEvent, "ButtonA_OnButtonEvent");
}

napi_value GamePad::ButtonB_RegisterButtonInputMonitor(napi_env env, napi_callback_info info) {
    napi_value result;
    GameController_ErrorCode errorCode =
        OH_GamePad_ButtonB_RegisterButtonInputMonitor(GamePad::ButtonB_OnButtonEvent);
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "ButtonB_RegisterButtonInputMonitor Failed, %{public}d", errorCode);
        napi_create_double(env, errorCode, &result);
        return result;
    }
    OH_LOG_INFO(LOG_APP, "ButtonB_RegisterButtonInputMonitor Success");
    napi_create_double(env, 0, &result);
    return result;
}

napi_value GamePad::ButtonB_UnregisterButtonInputMonitor(napi_env env, napi_callback_info info) {
    napi_value result;
    GameController_ErrorCode errorCode = OH_GamePad_ButtonB_UnregisterButtonInputMonitor();
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "ButtonB_UnregisterButtonInputMonitor Failed, %{public}d", errorCode);
        napi_create_double(env, errorCode, &result);
        return result;
    }
    OH_LOG_INFO(LOG_APP, "ButtonB_UnregisterButtonInputMonitor Success");
    napi_create_double(env, 0, &result);
    return result;
}

void GamePad::ButtonB_OnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent) {
    OnButtonEvent(buttonEvent, "ButtonB_OnButtonEvent");
}

napi_value GamePad::ButtonC_RegisterButtonInputMonitor(napi_env env, napi_callback_info info) {
    napi_value result;
    GameController_ErrorCode errorCode =
        OH_GamePad_ButtonC_RegisterButtonInputMonitor(GamePad::ButtonC_OnButtonEvent);
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "ButtonC_RegisterButtonInputMonitor Failed, %{public}d", errorCode);
        napi_create_double(env, errorCode, &result);
        return result;
    }
    OH_LOG_INFO(LOG_APP, "ButtonC_RegisterButtonInputMonitor Success");
    napi_create_double(env, 0, &result);
    return result;
}

napi_value GamePad::ButtonC_UnregisterButtonInputMonitor(napi_env env, napi_callback_info info) {
    napi_value result;
    GameController_ErrorCode errorCode = OH_GamePad_ButtonC_UnregisterButtonInputMonitor();
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "ButtonC_UnregisterButtonInputMonitor Failed, %{public}d", errorCode);
        napi_create_double(env, errorCode, &result);
        return result;
    }
    OH_LOG_INFO(LOG_APP, "ButtonC_UnregisterButtonInputMonitor Success");
    napi_create_double(env, 0, &result);
    return result;
}

void GamePad::ButtonC_OnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent) {
    OnButtonEvent(buttonEvent, "ButtonC_OnButtonEvent");
}

napi_value GamePad::ButtonX_RegisterButtonInputMonitor(napi_env env, napi_callback_info info) {
    napi_value result;
    GameController_ErrorCode errorCode =
        OH_GamePad_ButtonX_RegisterButtonInputMonitor(GamePad::ButtonX_OnButtonEvent);
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "ButtonX_RegisterButtonInputMonitor Failed, %{public}d", errorCode);
        napi_create_double(env, errorCode, &result);
        return result;
    }
    OH_LOG_INFO(LOG_APP, "ButtonX_RegisterButtonInputMonitor Success");
    napi_create_double(env, 0, &result);
    return result;
}

napi_value GamePad::ButtonX_UnregisterButtonInputMonitor(napi_env env, napi_callback_info info) {
    napi_value result;
    GameController_ErrorCode errorCode = OH_GamePad_ButtonX_UnregisterButtonInputMonitor();
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "ButtonX_UnregisterButtonInputMonitor Failed, %{public}d", errorCode);
        napi_create_double(env, errorCode, &result);
        return result;
    }
    OH_LOG_INFO(LOG_APP, "ButtonX_UnregisterButtonInputMonitor Success");
    napi_create_double(env, 0, &result);
    return result;
}

void GamePad::ButtonX_OnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent) {
    OnButtonEvent(buttonEvent, "ButtonX_OnButtonEvent");
}

napi_value GamePad::ButtonY_RegisterButtonInputMonitor(napi_env env, napi_callback_info info) {
    napi_value result;
    GameController_ErrorCode errorCode =
        OH_GamePad_ButtonY_RegisterButtonInputMonitor(GamePad::ButtonY_OnButtonEvent);
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "ButtonY_RegisterButtonInputMonitor Failed, %{public}d", errorCode);
        napi_create_double(env, errorCode, &result);
        return result;
    }
    OH_LOG_INFO(LOG_APP, "ButtonY_RegisterButtonInputMonitor Success");
    napi_create_double(env, 0, &result);
    return result;
}

napi_value GamePad::ButtonY_UnregisterButtonInputMonitor(napi_env env, napi_callback_info info) {
    napi_value result;
    GameController_ErrorCode errorCode = OH_GamePad_ButtonY_UnregisterButtonInputMonitor();
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "ButtonY_UnregisterButtonInputMonitor Failed, %{public}d", errorCode);
        napi_create_double(env, errorCode, &result);
        return result;
    }
    OH_LOG_INFO(LOG_APP, "ButtonY_UnregisterButtonInputMonitor Success");
    napi_create_double(env, 0, &result);
    return result;
}

void GamePad::ButtonY_OnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent) {
    OnButtonEvent(buttonEvent, "ButtonY_OnButtonEvent");
}

napi_value GamePad::Dpad_LeftButton_RegisterButtonInputMonitor(napi_env env, napi_callback_info info) {
    napi_value result;
    GameController_ErrorCode errorCode =
        OH_GamePad_Dpad_LeftButton_RegisterButtonInputMonitor(GamePad::Dpad_LeftButton_OnButtonEvent);
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "Dpad_LeftButton_RegisterButtonInputMonitor Failed, %{public}d", errorCode);
        napi_create_double(env, errorCode, &result);
        return result;
    }
    OH_LOG_INFO(LOG_APP, "Dpad_LeftButton_RegisterButtonInputMonitor Success");
    napi_create_double(env, 0, &result);
    return result;
}

napi_value GamePad::Dpad_LeftButton_UnregisterButtonInputMonitor(napi_env env, napi_callback_info info) {
    napi_value result;
    GameController_ErrorCode errorCode = OH_GamePad_Dpad_LeftButton_UnregisterButtonInputMonitor();
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "Dpad_LeftButton_UnregisterButtonInputMonitor Failed, %{public}d", errorCode);
        napi_create_double(env, errorCode, &result);
        return result;
    }
    OH_LOG_INFO(LOG_APP, "Dpad_LeftButton_UnregisterButtonInputMonitor Success");
    napi_create_double(env, 0, &result);
    return result;
}

void GamePad::Dpad_LeftButton_OnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent) {
    OnButtonEvent(buttonEvent, "Dpad_LeftButton_OnButtonEvent");
}

napi_value GamePad::Dpad_RightButton_RegisterButtonInputMonitor(napi_env env, napi_callback_info info) {
    napi_value result;
    GameController_ErrorCode errorCode =
        OH_GamePad_Dpad_RightButton_RegisterButtonInputMonitor(GamePad::Dpad_RightButton_OnButtonEvent);
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "Dpad_RightButton_RegisterButtonInputMonitor Failed, %{public}d", errorCode);
        napi_create_double(env, errorCode, &result);
        return result;
    }
    OH_LOG_INFO(LOG_APP, "Dpad_RightButton_RegisterButtonInputMonitor Success");
    napi_create_double(env, 0, &result);
    return result;
}

napi_value GamePad::Dpad_RightButton_UnregisterButtonInputMonitor(napi_env env, napi_callback_info info) {
    napi_value result;
    GameController_ErrorCode errorCode = OH_GamePad_Dpad_RightButton_UnregisterButtonInputMonitor();
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "Dpad_RightButton_UnregisterButtonInputMonitor Failed, %{public}d", errorCode);
        napi_create_double(env, errorCode, &result);
        return result;
    }
    OH_LOG_INFO(LOG_APP, "Dpad_RightButton_UnregisterButtonInputMonitor Success");
    napi_create_double(env, 0, &result);
    return result;
}

void GamePad::Dpad_RightButton_OnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent) {
    OnButtonEvent(buttonEvent, "Dpad_RightButton_OnButtonEvent");
}

napi_value GamePad::Dpad_UpButton_RegisterButtonInputMonitor(napi_env env, napi_callback_info info) {
    napi_value result;
    GameController_ErrorCode errorCode =
        OH_GamePad_Dpad_UpButton_RegisterButtonInputMonitor(GamePad::Dpad_UpButton_OnButtonEvent);
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "Dpad_UpButton_RegisterButtonInputMonitor Failed, %{public}d", errorCode);
        napi_create_double(env, errorCode, &result);
        return result;
    }
    OH_LOG_INFO(LOG_APP, "Dpad_UpButton_RegisterButtonInputMonitor Success");
    napi_create_double(env, 0, &result);
    return result;
}

napi_value GamePad::Dpad_UpButton_UnregisterButtonInputMonitor(napi_env env, napi_callback_info info) {
    napi_value result;
    GameController_ErrorCode errorCode = OH_GamePad_Dpad_UpButton_UnregisterButtonInputMonitor();
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "Dpad_UpButton_UnregisterButtonInputMonitor Failed, %{public}d", errorCode);
        napi_create_double(env, errorCode, &result);
        return result;
    }
    OH_LOG_INFO(LOG_APP, "Dpad_UpButton_UnregisterButtonInputMonitor Success");
    napi_create_double(env, 0, &result);
    return result;
}

void GamePad::Dpad_UpButton_OnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent) {
    OnButtonEvent(buttonEvent, "Dpad_UpButton_OnButtonEvent");
}

napi_value GamePad::Dpad_DownButton_RegisterButtonInputMonitor(napi_env env, napi_callback_info info) {
    napi_value result;
    GameController_ErrorCode errorCode =
        OH_GamePad_Dpad_DownButton_RegisterButtonInputMonitor(GamePad::Dpad_DownButton_OnButtonEvent);
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "Dpad_DownButton_RegisterButtonInputMonitor Failed, %{public}d", errorCode);
        napi_create_double(env, errorCode, &result);
        return result;
    }
    OH_LOG_INFO(LOG_APP, "Dpad_DownButton_RegisterButtonInputMonitor Success");
    napi_create_double(env, 0, &result);
    return result;
}

napi_value GamePad::Dpad_DownButton_UnregisterButtonInputMonitor(napi_env env, napi_callback_info info) {
    napi_value result;
    GameController_ErrorCode errorCode = OH_GamePad_Dpad_DownButton_UnregisterButtonInputMonitor();
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "Dpad_DownButton_UnregisterButtonInputMonitor Failed, %{public}d", errorCode);
        napi_create_double(env, errorCode, &result);
        return result;
    }
    OH_LOG_INFO(LOG_APP, "Dpad_DownButton_UnregisterButtonInputMonitor Success");
    napi_create_double(env, 0, &result);
    return result;
}

void GamePad::Dpad_DownButton_OnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent) {
    OnButtonEvent(buttonEvent, "Dpad_DownButton_OnButtonEvent");
}

napi_value GamePad::LeftThumbstick_RegisterButtonInputMonitor(napi_env env, napi_callback_info info) {
    napi_value result;
    GameController_ErrorCode errorCode =
        OH_GamePad_LeftThumbstick_RegisterButtonInputMonitor(GamePad::LeftThumbstick_OnButtonEvent);
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "LeftThumbstick_RegisterButtonInputMonitor Failed, %{public}d", errorCode);
        napi_create_double(env, errorCode, &result);
        return result;
    }
    OH_LOG_INFO(LOG_APP, "LeftThumbstick_RegisterButtonInputMonitor Success");
    napi_create_double(env, 0, &result);
    return result;
}

napi_value GamePad::LeftThumbstick_UnregisterButtonInputMonitor(napi_env env, napi_callback_info info) {
    napi_value result;
    GameController_ErrorCode errorCode = OH_GamePad_LeftThumbstick_UnregisterButtonInputMonitor();
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "LeftThumbstick_UnregisterButtonInputMonitor Failed, %{public}d", errorCode);
        napi_create_double(env, errorCode, &result);
        return result;
    }
    OH_LOG_INFO(LOG_APP, "LeftThumbstick_UnregisterButtonInputMonitor Success");
    napi_create_double(env, 0, &result);
    return result;
}

void GamePad::LeftThumbstick_OnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent) {
    OnButtonEvent(buttonEvent, "LeftThumbstick_OnButtonEvent");
}

napi_value GamePad::RightThumbstick_RegisterButtonInputMonitor(napi_env env, napi_callback_info info) {
    napi_value result;
    GameController_ErrorCode errorCode =
        OH_GamePad_RightThumbstick_RegisterButtonInputMonitor(GamePad::RightThumbstick_OnButtonEvent);
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "RightThumbstick_RegisterButtonInputMonitor Failed, %{public}d", errorCode);
        napi_create_double(env, errorCode, &result);
        return result;
    }
    OH_LOG_INFO(LOG_APP, "RightThumbstick_RegisterButtonInputMonitor Success");
    napi_create_double(env, 0, &result);
    return result;
}

napi_value GamePad::RightThumbstick_UnregisterButtonInputMonitor(napi_env env, napi_callback_info info) {
    napi_value result;
    GameController_ErrorCode errorCode = OH_GamePad_RightThumbstick_UnregisterButtonInputMonitor();
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "RightThumbstick_UnregisterButtonInputMonitor Failed, %{public}d", errorCode);
        napi_create_double(env, errorCode, &result);
        return result;
    }
    OH_LOG_INFO(LOG_APP, "RightThumbstick_UnregisterButtonInputMonitor Success");
    napi_create_double(env, 0, &result);
    return result;
}

void GamePad::RightThumbstick_OnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent) {
    OnButtonEvent(buttonEvent, "RightThumbstick_OnButtonEvent");
}

napi_value GamePad::ButtonNonstandard_RegisterButtonInputMonitor(napi_env env, napi_callback_info info) {
    napi_value result;
    GameController_ErrorCode errorCode =
        OH_GamePad_ButtonNonstandard_RegisterButtonInputMonitor(GamePad::ButtonNonstandard_OnButtonEvent);
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "ButtonNonstandard_RegisterButtonInputMonitor Failed, %{public}d", errorCode);
        napi_create_double(env, errorCode, &result);
        return result;
    }
    OH_LOG_INFO(LOG_APP, "ButtonNonstandard_RegisterButtonInputMonitor Success");
    napi_create_double(env, 0, &result);
    return result;
}

napi_value GamePad::ButtonNonstandard_UnregisterButtonInputMonitor(napi_env env, napi_callback_info info) {
    napi_value result;
    GameController_ErrorCode errorCode = OH_GamePad_ButtonNonstandard_UnregisterButtonInputMonitor();
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "ButtonNonstandard_UnregisterButtonInputMonitor Failed, %{public}d", errorCode);
        napi_create_double(env, errorCode, &result);
        return result;
    }
    OH_LOG_INFO(LOG_APP, "ButtonNonstandard_UnregisterButtonInputMonitor Success");
    napi_create_double(env, 0, &result);
    return result;
}

void GamePad::ButtonNonstandard_OnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent) {
    OnButtonEvent(buttonEvent, "ButtonNonstandard_OnButtonEvent");
}

// [Start axis_input_monitor]
napi_value GamePad::LeftThumbstick_RegisterAxisInputMonitor(napi_env env, napi_callback_info info) {
    napi_value result;
    GameController_ErrorCode errorCode =
        OH_GamePad_LeftThumbstick_RegisterAxisInputMonitor(GamePad::LeftThumbstick_OnAxisEvent);
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "LeftThumbstick_RegisterAxisInputMonitor Failed, %{public}d", errorCode);
        napi_create_double(env, errorCode, &result);
        return result;
    }
    OH_LOG_INFO(LOG_APP, "LeftThumbstick_RegisterAxisInputMonitor Success");
    napi_create_double(env, 0, &result);
    return result;
}

napi_value GamePad::LeftThumbstick_UnregisterAxisInputMonitor(napi_env env, napi_callback_info info) {
    napi_value result;
    GameController_ErrorCode errorCode = OH_GamePad_LeftThumbstick_UnregisterAxisInputMonitor();
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "LeftThumbstick_UnregisterAxisInputMonitor Failed, %{public}d", errorCode);
        napi_create_double(env, errorCode, &result);
        return result;
    }
    OH_LOG_INFO(LOG_APP, "LeftThumbstick_UnregisterAxisInputMonitor Success");
    napi_create_double(env, 0, &result);
    return result;
}

void GamePad::LeftThumbstick_OnAxisEvent(const struct GamePad_AxisEvent *axisEvent) {
    std::string val = "X";
    double xAxisValue;
    OH_GamePad_AxisEvent_GetXAxisValue(axisEvent, &xAxisValue);
    val.append(std::to_string(xAxisValue)).append("_Y");
    double yAxisValue;
    OH_GamePad_AxisEvent_GetYAxisValue(axisEvent, &yAxisValue);
    val.append(std::to_string(yAxisValue));
    OnAxisEvent(axisEvent, "LeftThumbstick_OnAxisEvent", val);
}
// [End axis_input_monitor]

// The shared handler prints the axis event to the log page.
void GamePad::OnAxisEvent(const struct GamePad_AxisEvent *axisEvent, const std::string &name,
    const std::string &val) {
    std::string temp;
    temp.append(name).append(":").append(val);
    char *deviceId;
    OH_GamePad_AxisEvent_GetDeviceId(axisEvent, &deviceId);
    temp.append(" ,deviceId:").append(deviceId);
    free(deviceId);
    std::int64_t actionTime;
    OH_GamePad_AxisEvent_GetActionTime(axisEvent, &actionTime);
    temp.append(" ,actionTime:").append(std::to_string(actionTime));
    OH_LOG_INFO(LOG_APP, "%{public}s", temp.c_str());
    Log::GetInstance()->PrintLog(temp);
}

// The other axis monitors follow the same pattern as LeftThumbstick.
napi_value GamePad::RightThumbstick_RegisterAxisInputMonitor(napi_env env, napi_callback_info info) {
    napi_value result;
    GameController_ErrorCode errorCode =
        OH_GamePad_RightThumbstick_RegisterAxisInputMonitor(GamePad::RightThumbstick_OnAxisEvent);
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "RightThumbstick_RegisterAxisInputMonitor Failed, %{public}d", errorCode);
        napi_create_double(env, errorCode, &result);
        return result;
    }
    OH_LOG_INFO(LOG_APP, "RightThumbstick_RegisterAxisInputMonitor Success");
    napi_create_double(env, 0, &result);
    return result;
}

napi_value GamePad::RightThumbstick_UnregisterAxisInputMonitor(napi_env env, napi_callback_info info) {
    napi_value result;
    GameController_ErrorCode errorCode = OH_GamePad_RightThumbstick_UnregisterAxisInputMonitor();
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "RightThumbstick_UnregisterAxisInputMonitor Failed, %{public}d", errorCode);
        napi_create_double(env, errorCode, &result);
        return result;
    }
    OH_LOG_INFO(LOG_APP, "RightThumbstick_UnregisterAxisInputMonitor Success");
    napi_create_double(env, 0, &result);
    return result;
}

void GamePad::RightThumbstick_OnAxisEvent(const struct GamePad_AxisEvent *axisEvent) {
    std::string val = "Z";
    double zAxisValue;
    OH_GamePad_AxisEvent_GetZAxisValue(axisEvent, &zAxisValue);
    val.append(std::to_string(zAxisValue)).append("_RZ");
    double rzAxisValue;
    OH_GamePad_AxisEvent_GetRZAxisValue(axisEvent, &rzAxisValue);
    val.append(std::to_string(rzAxisValue));
    OnAxisEvent(axisEvent, "RightThumbstick_OnAxisEvent", val);
}

napi_value GamePad::Dpad_RegisterAxisInputMonitor(napi_env env, napi_callback_info info) {
    napi_value result;
    GameController_ErrorCode errorCode = OH_GamePad_Dpad_RegisterAxisInputMonitor(GamePad::Dpad_OnAxisEvent);
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "Dpad_RegisterAxisInputMonitor Failed, %{public}d", errorCode);
        napi_create_double(env, errorCode, &result);
        return result;
    }
    OH_LOG_INFO(LOG_APP, "Dpad_RegisterAxisInputMonitor Success");
    napi_create_double(env, 0, &result);
    return result;
}

napi_value GamePad::Dpad_UnregisterAxisInputMonitor(napi_env env, napi_callback_info info) {
    napi_value result;
    GameController_ErrorCode errorCode = OH_GamePad_Dpad_UnregisterAxisInputMonitor();
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "Dpad_UnregisterAxisInputMonitor Failed, %{public}d", errorCode);
        napi_create_double(env, errorCode, &result);
        return result;
    }
    OH_LOG_INFO(LOG_APP, "Dpad_UnregisterAxisInputMonitor Success");
    napi_create_double(env, 0, &result);
    return result;
}

void GamePad::Dpad_OnAxisEvent(const struct GamePad_AxisEvent *axisEvent) {
    std::string val = "HatX";
    double hatXAxisValue;
    OH_GamePad_AxisEvent_GetHatXAxisValue(axisEvent, &hatXAxisValue);
    val.append(std::to_string(hatXAxisValue)).append("_HatY");
    double hatYAxisValue;
    OH_GamePad_AxisEvent_GetHatYAxisValue(axisEvent, &hatYAxisValue);
    val.append(std::to_string(hatYAxisValue));
    OnAxisEvent(axisEvent, "Dpad_OnAxisEvent", val);
}

napi_value GamePad::LeftTrigger_RegisterAxisInputMonitor(napi_env env, napi_callback_info info) {
    napi_value result;
    GameController_ErrorCode errorCode =
        OH_GamePad_LeftTrigger_RegisterAxisInputMonitor(GamePad::LeftTrigger_OnAxisEvent);
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "LeftTrigger_RegisterAxisInputMonitor Failed, %{public}d", errorCode);
        napi_create_double(env, errorCode, &result);
        return result;
    }
    OH_LOG_INFO(LOG_APP, "LeftTrigger_RegisterAxisInputMonitor Success");
    napi_create_double(env, 0, &result);
    return result;
}

napi_value GamePad::LeftTrigger_UnregisterAxisInputMonitor(napi_env env, napi_callback_info info) {
    napi_value result;
    GameController_ErrorCode errorCode = OH_GamePad_LeftTrigger_UnregisterAxisInputMonitor();
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "LeftTrigger_UnregisterAxisInputMonitor Failed, %{public}d", errorCode);
        napi_create_double(env, errorCode, &result);
        return result;
    }
    OH_LOG_INFO(LOG_APP, "LeftTrigger_UnregisterAxisInputMonitor Success");
    napi_create_double(env, 0, &result);
    return result;
}

void GamePad::LeftTrigger_OnAxisEvent(const struct GamePad_AxisEvent *axisEvent) {
    std::string val = "Brake";
    double brakeAxisValue;
    OH_GamePad_AxisEvent_GetBrakeAxisValue(axisEvent, &brakeAxisValue);
    val.append(std::to_string(brakeAxisValue));
    OnAxisEvent(axisEvent, "LeftTrigger_OnAxisEvent", val);
}

napi_value GamePad::RightTrigger_RegisterAxisInputMonitor(napi_env env, napi_callback_info info) {
    napi_value result;
    GameController_ErrorCode errorCode =
        OH_GamePad_RightTrigger_RegisterAxisInputMonitor(GamePad::RightTrigger_OnAxisEvent);
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "RightTrigger_RegisterAxisInputMonitor Failed, %{public}d", errorCode);
        napi_create_double(env, errorCode, &result);
        return result;
    }
    OH_LOG_INFO(LOG_APP, "RightTrigger_RegisterAxisInputMonitor Success");
    napi_create_double(env, 0, &result);
    return result;
}

napi_value GamePad::RightTrigger_UnregisterAxisInputMonitor(napi_env env, napi_callback_info info) {
    napi_value result;
    GameController_ErrorCode errorCode = OH_GamePad_RightTrigger_UnregisterAxisInputMonitor();
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "RightTrigger_UnregisterAxisInputMonitor Failed, %{public}d", errorCode);
        napi_create_double(env, errorCode, &result);
        return result;
    }
    OH_LOG_INFO(LOG_APP, "RightTrigger_UnregisterAxisInputMonitor Success");
    napi_create_double(env, 0, &result);
    return result;
}

void GamePad::RightTrigger_OnAxisEvent(const struct GamePad_AxisEvent *axisEvent) {
    std::string val = "Gas";
    double gasAxisValue;
    OH_GamePad_AxisEvent_GetGasAxisValue(axisEvent, &gasAxisValue);
    val.append(std::to_string(gasAxisValue));
    OnAxisEvent(axisEvent, "RightTrigger_OnAxisEvent", val);
}
