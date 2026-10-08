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
int32_t GamePad::LeftShoulderRegisterButtonInputMonitor()
{
    GameController_ErrorCode errorCode =
        OH_GamePad_LeftShoulder_RegisterButtonInputMonitor(GamePad::LeftShoulderOnButtonEvent);
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "LeftShoulder_RegisterButtonInputMonitor Failed, %{public}d", errorCode);
        return static_cast<int32_t>(errorCode);
    }
    OH_LOG_INFO(LOG_APP, "LeftShoulder_RegisterButtonInputMonitor Success");
    return 0;
}

int32_t GamePad::LeftShoulderUnregisterButtonInputMonitor()
{
    GameController_ErrorCode errorCode = OH_GamePad_LeftShoulder_UnregisterButtonInputMonitor();
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "LeftShoulder_UnregisterButtonInputMonitor Failed, %{public}d", errorCode);
        return static_cast<int32_t>(errorCode);
    }
    OH_LOG_INFO(LOG_APP, "LeftShoulder_UnregisterButtonInputMonitor Success");
    return 0;
}

void GamePad::LeftShoulderOnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent)
{
    OnButtonEvent(buttonEvent, "LeftShoulder_OnButtonEvent");
}

void GamePad::OnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent, const std::string &buttonName)
{
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
int32_t GamePad::RightShoulderRegisterButtonInputMonitor()
{
    GameController_ErrorCode errorCode =
        OH_GamePad_RightShoulder_RegisterButtonInputMonitor(GamePad::RightShoulderOnButtonEvent);
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "RightShoulder_RegisterButtonInputMonitor Failed, %{public}d", errorCode);
        return static_cast<int32_t>(errorCode);
    }
    OH_LOG_INFO(LOG_APP, "RightShoulder_RegisterButtonInputMonitor Success");
    return 0;
}

int32_t GamePad::RightShoulderUnregisterButtonInputMonitor()
{
    GameController_ErrorCode errorCode = OH_GamePad_RightShoulder_UnregisterButtonInputMonitor();
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "RightShoulder_UnregisterButtonInputMonitor Failed, %{public}d", errorCode);
        return static_cast<int32_t>(errorCode);
    }
    OH_LOG_INFO(LOG_APP, "RightShoulder_UnregisterButtonInputMonitor Success");
    return 0;
}

void GamePad::RightShoulderOnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent)
{
    OnButtonEvent(buttonEvent, "RightShoulder_OnButtonEvent");
}

int32_t GamePad::LeftTriggerRegisterButtonInputMonitor()
{
    GameController_ErrorCode errorCode =
        OH_GamePad_LeftTrigger_RegisterButtonInputMonitor(GamePad::LeftTriggerOnButtonEvent);
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "LeftTrigger_RegisterButtonInputMonitor Failed, %{public}d", errorCode);
        return static_cast<int32_t>(errorCode);
    }
    OH_LOG_INFO(LOG_APP, "LeftTrigger_RegisterButtonInputMonitor Success");
    return 0;
}

int32_t GamePad::LeftTriggerUnregisterButtonInputMonitor()
{
    GameController_ErrorCode errorCode = OH_GamePad_LeftTrigger_UnregisterButtonInputMonitor();
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "LeftTrigger_UnregisterButtonInputMonitor Failed, %{public}d", errorCode);
        return static_cast<int32_t>(errorCode);
    }
    OH_LOG_INFO(LOG_APP, "LeftTrigger_UnregisterButtonInputMonitor Success");
    return 0;
}

void GamePad::LeftTriggerOnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent)
{
    OnButtonEvent(buttonEvent, "LeftTrigger_OnButtonEvent");
}

int32_t GamePad::RightTriggerRegisterButtonInputMonitor()
{
    GameController_ErrorCode errorCode =
        OH_GamePad_RightTrigger_RegisterButtonInputMonitor(GamePad::RightTriggerOnButtonEvent);
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "RightTrigger_RegisterButtonInputMonitor Failed, %{public}d", errorCode);
        return static_cast<int32_t>(errorCode);
    }
    OH_LOG_INFO(LOG_APP, "RightTrigger_RegisterButtonInputMonitor Success");
    return 0;
}

int32_t GamePad::RightTriggerUnregisterButtonInputMonitor()
{
    GameController_ErrorCode errorCode = OH_GamePad_RightTrigger_UnregisterButtonInputMonitor();
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "RightTrigger_UnregisterButtonInputMonitor Failed, %{public}d", errorCode);
        return static_cast<int32_t>(errorCode);
    }
    OH_LOG_INFO(LOG_APP, "RightTrigger_UnregisterButtonInputMonitor Success");
    return 0;
}

void GamePad::RightTriggerOnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent)
{
    OnButtonEvent(buttonEvent, "RightTrigger_OnButtonEvent");
}

int32_t GamePad::ButtonMenuRegisterButtonInputMonitor()
{
    GameController_ErrorCode errorCode =
        OH_GamePad_ButtonMenu_RegisterButtonInputMonitor(GamePad::ButtonMenuOnButtonEvent);
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "ButtonMenu_RegisterButtonInputMonitor Failed, %{public}d", errorCode);
        return static_cast<int32_t>(errorCode);
    }
    OH_LOG_INFO(LOG_APP, "ButtonMenu_RegisterButtonInputMonitor Success");
    return 0;
}

int32_t GamePad::ButtonMenuUnregisterButtonInputMonitor()
{
    GameController_ErrorCode errorCode = OH_GamePad_ButtonMenu_UnregisterButtonInputMonitor();
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "ButtonMenu_UnregisterButtonInputMonitor Failed, %{public}d", errorCode);
        return static_cast<int32_t>(errorCode);
    }
    OH_LOG_INFO(LOG_APP, "ButtonMenu_UnregisterButtonInputMonitor Success");
    return 0;
}

void GamePad::ButtonMenuOnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent)
{
    OnButtonEvent(buttonEvent, "ButtonMenu_OnButtonEvent");
}

int32_t GamePad::ButtonHomeRegisterButtonInputMonitor()
{
    GameController_ErrorCode errorCode =
        OH_GamePad_ButtonHome_RegisterButtonInputMonitor(GamePad::ButtonHomeOnButtonEvent);
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "ButtonHome_RegisterButtonInputMonitor Failed, %{public}d", errorCode);
        return static_cast<int32_t>(errorCode);
    }
    OH_LOG_INFO(LOG_APP, "ButtonHome_RegisterButtonInputMonitor Success");
    return 0;
}

int32_t GamePad::ButtonHomeUnregisterButtonInputMonitor()
{
    GameController_ErrorCode errorCode = OH_GamePad_ButtonHome_UnregisterButtonInputMonitor();
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "ButtonHome_UnregisterButtonInputMonitor Failed, %{public}d", errorCode);
        return static_cast<int32_t>(errorCode);
    }
    OH_LOG_INFO(LOG_APP, "ButtonHome_UnregisterButtonInputMonitor Success");
    return 0;
}

void GamePad::ButtonHomeOnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent)
{
    OnButtonEvent(buttonEvent, "ButtonHome_OnButtonEvent");
}

int32_t GamePad::ButtonARegisterButtonInputMonitor()
{
    GameController_ErrorCode errorCode = OH_GamePad_ButtonA_RegisterButtonInputMonitor(GamePad::ButtonAOnButtonEvent);
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "ButtonA_RegisterButtonInputMonitor Failed, %{public}d", errorCode);
        return static_cast<int32_t>(errorCode);
    }
    OH_LOG_INFO(LOG_APP, "ButtonA_RegisterButtonInputMonitor Success");
    return 0;
}

int32_t GamePad::ButtonAUnregisterButtonInputMonitor()
{
    GameController_ErrorCode errorCode = OH_GamePad_ButtonA_UnregisterButtonInputMonitor();
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "ButtonA_UnregisterButtonInputMonitor Failed, %{public}d", errorCode);
        return static_cast<int32_t>(errorCode);
    }
    OH_LOG_INFO(LOG_APP, "ButtonA_UnregisterButtonInputMonitor Success");
    return 0;
}

void GamePad::ButtonAOnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent)
{
    OnButtonEvent(buttonEvent, "ButtonA_OnButtonEvent");
}

int32_t GamePad::ButtonBRegisterButtonInputMonitor()
{
    GameController_ErrorCode errorCode = OH_GamePad_ButtonB_RegisterButtonInputMonitor(GamePad::ButtonBOnButtonEvent);
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "ButtonB_RegisterButtonInputMonitor Failed, %{public}d", errorCode);
        return static_cast<int32_t>(errorCode);
    }
    OH_LOG_INFO(LOG_APP, "ButtonB_RegisterButtonInputMonitor Success");
    return 0;
}

int32_t GamePad::ButtonBUnregisterButtonInputMonitor()
{
    GameController_ErrorCode errorCode = OH_GamePad_ButtonB_UnregisterButtonInputMonitor();
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "ButtonB_UnregisterButtonInputMonitor Failed, %{public}d", errorCode);
        return static_cast<int32_t>(errorCode);
    }
    OH_LOG_INFO(LOG_APP, "ButtonB_UnregisterButtonInputMonitor Success");
    return 0;
}

void GamePad::ButtonBOnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent)
{
    OnButtonEvent(buttonEvent, "ButtonB_OnButtonEvent");
}

int32_t GamePad::ButtonCRegisterButtonInputMonitor()
{
    GameController_ErrorCode errorCode = OH_GamePad_ButtonC_RegisterButtonInputMonitor(GamePad::ButtonCOnButtonEvent);
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "ButtonC_RegisterButtonInputMonitor Failed, %{public}d", errorCode);
        return static_cast<int32_t>(errorCode);
    }
    OH_LOG_INFO(LOG_APP, "ButtonC_RegisterButtonInputMonitor Success");
    return 0;
}

int32_t GamePad::ButtonCUnregisterButtonInputMonitor()
{
    GameController_ErrorCode errorCode = OH_GamePad_ButtonC_UnregisterButtonInputMonitor();
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "ButtonC_UnregisterButtonInputMonitor Failed, %{public}d", errorCode);
        return static_cast<int32_t>(errorCode);
    }
    OH_LOG_INFO(LOG_APP, "ButtonC_UnregisterButtonInputMonitor Success");
    return 0;
}

void GamePad::ButtonCOnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent)
{
    OnButtonEvent(buttonEvent, "ButtonC_OnButtonEvent");
}

int32_t GamePad::ButtonXRegisterButtonInputMonitor()
{
    GameController_ErrorCode errorCode = OH_GamePad_ButtonX_RegisterButtonInputMonitor(GamePad::ButtonXOnButtonEvent);
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "ButtonX_RegisterButtonInputMonitor Failed, %{public}d", errorCode);
        return static_cast<int32_t>(errorCode);
    }
    OH_LOG_INFO(LOG_APP, "ButtonX_RegisterButtonInputMonitor Success");
    return 0;
}

int32_t GamePad::ButtonXUnregisterButtonInputMonitor()
{
    GameController_ErrorCode errorCode = OH_GamePad_ButtonX_UnregisterButtonInputMonitor();
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "ButtonX_UnregisterButtonInputMonitor Failed, %{public}d", errorCode);
        return static_cast<int32_t>(errorCode);
    }
    OH_LOG_INFO(LOG_APP, "ButtonX_UnregisterButtonInputMonitor Success");
    return 0;
}

void GamePad::ButtonXOnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent)
{
    OnButtonEvent(buttonEvent, "ButtonX_OnButtonEvent");
}

int32_t GamePad::ButtonYRegisterButtonInputMonitor()
{
    GameController_ErrorCode errorCode = OH_GamePad_ButtonY_RegisterButtonInputMonitor(GamePad::ButtonYOnButtonEvent);
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "ButtonY_RegisterButtonInputMonitor Failed, %{public}d", errorCode);
        return static_cast<int32_t>(errorCode);
    }
    OH_LOG_INFO(LOG_APP, "ButtonY_RegisterButtonInputMonitor Success");
    return 0;
}

int32_t GamePad::ButtonYUnregisterButtonInputMonitor()
{
    GameController_ErrorCode errorCode = OH_GamePad_ButtonY_UnregisterButtonInputMonitor();
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "ButtonY_UnregisterButtonInputMonitor Failed, %{public}d", errorCode);
        return static_cast<int32_t>(errorCode);
    }
    OH_LOG_INFO(LOG_APP, "ButtonY_UnregisterButtonInputMonitor Success");
    return 0;
}

void GamePad::ButtonYOnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent)
{
    OnButtonEvent(buttonEvent, "ButtonY_OnButtonEvent");
}

int32_t GamePad::DpadLeftButtonRegisterButtonInputMonitor()
{
    GameController_ErrorCode errorCode =
        OH_GamePad_Dpad_LeftButton_RegisterButtonInputMonitor(GamePad::DpadLeftButtonOnButtonEvent);
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "Dpad_LeftButton_RegisterButtonInputMonitor Failed, %{public}d", errorCode);
        return static_cast<int32_t>(errorCode);
    }
    OH_LOG_INFO(LOG_APP, "Dpad_LeftButton_RegisterButtonInputMonitor Success");
    return 0;
}

int32_t GamePad::DpadLeftButtonUnregisterButtonInputMonitor()
{
    GameController_ErrorCode errorCode = OH_GamePad_Dpad_LeftButton_UnregisterButtonInputMonitor();
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "Dpad_LeftButton_UnregisterButtonInputMonitor Failed, %{public}d", errorCode);
        return static_cast<int32_t>(errorCode);
    }
    OH_LOG_INFO(LOG_APP, "Dpad_LeftButton_UnregisterButtonInputMonitor Success");
    return 0;
}

void GamePad::DpadLeftButtonOnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent)
{
    OnButtonEvent(buttonEvent, "Dpad_LeftButton_OnButtonEvent");
}

int32_t GamePad::DpadRightButtonRegisterButtonInputMonitor()
{
    GameController_ErrorCode errorCode =
        OH_GamePad_Dpad_RightButton_RegisterButtonInputMonitor(GamePad::DpadRightButtonOnButtonEvent);
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "Dpad_RightButton_RegisterButtonInputMonitor Failed, %{public}d", errorCode);
        return static_cast<int32_t>(errorCode);
    }
    OH_LOG_INFO(LOG_APP, "Dpad_RightButton_RegisterButtonInputMonitor Success");
    return 0;
}

int32_t GamePad::DpadRightButtonUnregisterButtonInputMonitor()
{
    GameController_ErrorCode errorCode = OH_GamePad_Dpad_RightButton_UnregisterButtonInputMonitor();
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "Dpad_RightButton_UnregisterButtonInputMonitor Failed, %{public}d", errorCode);
        return static_cast<int32_t>(errorCode);
    }
    OH_LOG_INFO(LOG_APP, "Dpad_RightButton_UnregisterButtonInputMonitor Success");
    return 0;
}

void GamePad::DpadRightButtonOnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent)
{
    OnButtonEvent(buttonEvent, "Dpad_RightButton_OnButtonEvent");
}

int32_t GamePad::DpadUpButtonRegisterButtonInputMonitor()
{
    GameController_ErrorCode errorCode =
        OH_GamePad_Dpad_UpButton_RegisterButtonInputMonitor(GamePad::DpadUpButtonOnButtonEvent);
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "Dpad_UpButton_RegisterButtonInputMonitor Failed, %{public}d", errorCode);
        return static_cast<int32_t>(errorCode);
    }
    OH_LOG_INFO(LOG_APP, "Dpad_UpButton_RegisterButtonInputMonitor Success");
    return 0;
}

int32_t GamePad::DpadUpButtonUnregisterButtonInputMonitor()
{
    GameController_ErrorCode errorCode = OH_GamePad_Dpad_UpButton_UnregisterButtonInputMonitor();
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "Dpad_UpButton_UnregisterButtonInputMonitor Failed, %{public}d", errorCode);
        return static_cast<int32_t>(errorCode);
    }
    OH_LOG_INFO(LOG_APP, "Dpad_UpButton_UnregisterButtonInputMonitor Success");
    return 0;
}

void GamePad::DpadUpButtonOnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent)
{
    OnButtonEvent(buttonEvent, "Dpad_UpButton_OnButtonEvent");
}

int32_t GamePad::DpadDownButtonRegisterButtonInputMonitor()
{
    GameController_ErrorCode errorCode =
        OH_GamePad_Dpad_DownButton_RegisterButtonInputMonitor(GamePad::DpadDownButtonOnButtonEvent);
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "Dpad_DownButton_RegisterButtonInputMonitor Failed, %{public}d", errorCode);
        return static_cast<int32_t>(errorCode);
    }
    OH_LOG_INFO(LOG_APP, "Dpad_DownButton_RegisterButtonInputMonitor Success");
    return 0;
}

int32_t GamePad::DpadDownButtonUnregisterButtonInputMonitor()
{
    GameController_ErrorCode errorCode = OH_GamePad_Dpad_DownButton_UnregisterButtonInputMonitor();
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "Dpad_DownButton_UnregisterButtonInputMonitor Failed, %{public}d", errorCode);
        return static_cast<int32_t>(errorCode);
    }
    OH_LOG_INFO(LOG_APP, "Dpad_DownButton_UnregisterButtonInputMonitor Success");
    return 0;
}

void GamePad::DpadDownButtonOnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent)
{
    OnButtonEvent(buttonEvent, "Dpad_DownButton_OnButtonEvent");
}

int32_t GamePad::LeftThumbstickRegisterButtonInputMonitor()
{
    GameController_ErrorCode errorCode =
        OH_GamePad_LeftThumbstick_RegisterButtonInputMonitor(GamePad::LeftThumbstickOnButtonEvent);
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "LeftThumbstick_RegisterButtonInputMonitor Failed, %{public}d", errorCode);
        return static_cast<int32_t>(errorCode);
    }
    OH_LOG_INFO(LOG_APP, "LeftThumbstick_RegisterButtonInputMonitor Success");
    return 0;
}

int32_t GamePad::LeftThumbstickUnregisterButtonInputMonitor()
{
    GameController_ErrorCode errorCode = OH_GamePad_LeftThumbstick_UnregisterButtonInputMonitor();
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "LeftThumbstick_UnregisterButtonInputMonitor Failed, %{public}d", errorCode);
        return static_cast<int32_t>(errorCode);
    }
    OH_LOG_INFO(LOG_APP, "LeftThumbstick_UnregisterButtonInputMonitor Success");
    return 0;
}

void GamePad::LeftThumbstickOnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent)
{
    OnButtonEvent(buttonEvent, "LeftThumbstick_OnButtonEvent");
}

int32_t GamePad::RightThumbstickRegisterButtonInputMonitor()
{
    GameController_ErrorCode errorCode =
        OH_GamePad_RightThumbstick_RegisterButtonInputMonitor(GamePad::RightThumbstickOnButtonEvent);
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "RightThumbstick_RegisterButtonInputMonitor Failed, %{public}d", errorCode);
        return static_cast<int32_t>(errorCode);
    }
    OH_LOG_INFO(LOG_APP, "RightThumbstick_RegisterButtonInputMonitor Success");
    return 0;
}

int32_t GamePad::RightThumbstickUnregisterButtonInputMonitor()
{
    GameController_ErrorCode errorCode = OH_GamePad_RightThumbstick_UnregisterButtonInputMonitor();
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "RightThumbstick_UnregisterButtonInputMonitor Failed, %{public}d", errorCode);
        return static_cast<int32_t>(errorCode);
    }
    OH_LOG_INFO(LOG_APP, "RightThumbstick_UnregisterButtonInputMonitor Success");
    return 0;
}

void GamePad::RightThumbstickOnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent)
{
    OnButtonEvent(buttonEvent, "RightThumbstick_OnButtonEvent");
}

int32_t GamePad::ButtonNonstandardRegisterButtonInputMonitor()
{
    GameController_ErrorCode errorCode =
        OH_GamePad_ButtonNonstandard_RegisterButtonInputMonitor(GamePad::ButtonNonstandardOnButtonEvent);
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "ButtonNonstandard_RegisterButtonInputMonitor Failed, %{public}d", errorCode);
        return static_cast<int32_t>(errorCode);
    }
    OH_LOG_INFO(LOG_APP, "ButtonNonstandard_RegisterButtonInputMonitor Success");
    return 0;
}

int32_t GamePad::ButtonNonstandardUnregisterButtonInputMonitor()
{
    GameController_ErrorCode errorCode = OH_GamePad_ButtonNonstandard_UnregisterButtonInputMonitor();
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "ButtonNonstandard_UnregisterButtonInputMonitor Failed, %{public}d", errorCode);
        return static_cast<int32_t>(errorCode);
    }
    OH_LOG_INFO(LOG_APP, "ButtonNonstandard_UnregisterButtonInputMonitor Success");
    return 0;
}

void GamePad::ButtonNonstandardOnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent)
{
    OnButtonEvent(buttonEvent, "ButtonNonstandard_OnButtonEvent");
}

// [Start axis_input_monitor]
int32_t GamePad::LeftThumbstickRegisterAxisInputMonitor()
{
    GameController_ErrorCode errorCode =
        OH_GamePad_LeftThumbstick_RegisterAxisInputMonitor(GamePad::LeftThumbstickOnAxisEvent);
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "LeftThumbstick_RegisterAxisInputMonitor Failed, %{public}d", errorCode);
        return static_cast<int32_t>(errorCode);
    }
    OH_LOG_INFO(LOG_APP, "LeftThumbstick_RegisterAxisInputMonitor Success");
    return 0;
}

int32_t GamePad::LeftThumbstickUnregisterAxisInputMonitor()
{
    GameController_ErrorCode errorCode = OH_GamePad_LeftThumbstick_UnregisterAxisInputMonitor();
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "LeftThumbstick_UnregisterAxisInputMonitor Failed, %{public}d", errorCode);
        return static_cast<int32_t>(errorCode);
    }
    OH_LOG_INFO(LOG_APP, "LeftThumbstick_UnregisterAxisInputMonitor Success");
    return 0;
}

void GamePad::LeftThumbstickOnAxisEvent(const struct GamePad_AxisEvent *axisEvent)
{
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
void GamePad::OnAxisEvent(const struct GamePad_AxisEvent *axisEvent, const std::string &name, const std::string &val)
{
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
int32_t GamePad::RightThumbstickRegisterAxisInputMonitor()
{
    GameController_ErrorCode errorCode =
        OH_GamePad_RightThumbstick_RegisterAxisInputMonitor(GamePad::RightThumbstickOnAxisEvent);
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "RightThumbstick_RegisterAxisInputMonitor Failed, %{public}d", errorCode);
        return static_cast<int32_t>(errorCode);
    }
    OH_LOG_INFO(LOG_APP, "RightThumbstick_RegisterAxisInputMonitor Success");
    return 0;
}

int32_t GamePad::RightThumbstickUnregisterAxisInputMonitor()
{
    GameController_ErrorCode errorCode = OH_GamePad_RightThumbstick_UnregisterAxisInputMonitor();
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "RightThumbstick_UnregisterAxisInputMonitor Failed, %{public}d", errorCode);
        return static_cast<int32_t>(errorCode);
    }
    OH_LOG_INFO(LOG_APP, "RightThumbstick_UnregisterAxisInputMonitor Success");
    return 0;
}

void GamePad::RightThumbstickOnAxisEvent(const struct GamePad_AxisEvent *axisEvent)
{
    std::string val = "Z";
    double zAxisValue;
    OH_GamePad_AxisEvent_GetZAxisValue(axisEvent, &zAxisValue);
    val.append(std::to_string(zAxisValue)).append("_RZ");
    double rzAxisValue;
    OH_GamePad_AxisEvent_GetRZAxisValue(axisEvent, &rzAxisValue);
    val.append(std::to_string(rzAxisValue));
    OnAxisEvent(axisEvent, "RightThumbstick_OnAxisEvent", val);
}

int32_t GamePad::DpadRegisterAxisInputMonitor()
{
    GameController_ErrorCode errorCode = OH_GamePad_Dpad_RegisterAxisInputMonitor(GamePad::DpadOnAxisEvent);
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "Dpad_RegisterAxisInputMonitor Failed, %{public}d", errorCode);
        return static_cast<int32_t>(errorCode);
    }
    OH_LOG_INFO(LOG_APP, "Dpad_RegisterAxisInputMonitor Success");
    return 0;
}

int32_t GamePad::DpadUnregisterAxisInputMonitor()
{
    GameController_ErrorCode errorCode = OH_GamePad_Dpad_UnregisterAxisInputMonitor();
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "Dpad_UnregisterAxisInputMonitor Failed, %{public}d", errorCode);
        return static_cast<int32_t>(errorCode);
    }
    OH_LOG_INFO(LOG_APP, "Dpad_UnregisterAxisInputMonitor Success");
    return 0;
}

void GamePad::DpadOnAxisEvent(const struct GamePad_AxisEvent *axisEvent)
{
    std::string val = "HatX";
    double hatXAxisValue;
    OH_GamePad_AxisEvent_GetHatXAxisValue(axisEvent, &hatXAxisValue);
    val.append(std::to_string(hatXAxisValue)).append("_HatY");
    double hatYAxisValue;
    OH_GamePad_AxisEvent_GetHatYAxisValue(axisEvent, &hatYAxisValue);
    val.append(std::to_string(hatYAxisValue));
    OnAxisEvent(axisEvent, "Dpad_OnAxisEvent", val);
}

int32_t GamePad::LeftTriggerRegisterAxisInputMonitor()
{
    GameController_ErrorCode errorCode =
        OH_GamePad_LeftTrigger_RegisterAxisInputMonitor(GamePad::LeftTriggerOnAxisEvent);
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "LeftTrigger_RegisterAxisInputMonitor Failed, %{public}d", errorCode);
        return static_cast<int32_t>(errorCode);
    }
    OH_LOG_INFO(LOG_APP, "LeftTrigger_RegisterAxisInputMonitor Success");
    return 0;
}

int32_t GamePad::LeftTriggerUnregisterAxisInputMonitor()
{
    GameController_ErrorCode errorCode = OH_GamePad_LeftTrigger_UnregisterAxisInputMonitor();
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "LeftTrigger_UnregisterAxisInputMonitor Failed, %{public}d", errorCode);
        return static_cast<int32_t>(errorCode);
    }
    OH_LOG_INFO(LOG_APP, "LeftTrigger_UnregisterAxisInputMonitor Success");
    return 0;
}

void GamePad::LeftTriggerOnAxisEvent(const struct GamePad_AxisEvent *axisEvent)
{
    std::string val = "Brake";
    double brakeAxisValue;
    OH_GamePad_AxisEvent_GetBrakeAxisValue(axisEvent, &brakeAxisValue);
    val.append(std::to_string(brakeAxisValue));
    OnAxisEvent(axisEvent, "LeftTrigger_OnAxisEvent", val);
}

int32_t GamePad::RightTriggerRegisterAxisInputMonitor()
{
    GameController_ErrorCode errorCode =
        OH_GamePad_RightTrigger_RegisterAxisInputMonitor(GamePad::RightTriggerOnAxisEvent);
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "RightTrigger_RegisterAxisInputMonitor Failed, %{public}d", errorCode);
        return static_cast<int32_t>(errorCode);
    }
    OH_LOG_INFO(LOG_APP, "RightTrigger_RegisterAxisInputMonitor Success");
    return 0;
}

int32_t GamePad::RightTriggerUnregisterAxisInputMonitor()
{
    GameController_ErrorCode errorCode = OH_GamePad_RightTrigger_UnregisterAxisInputMonitor();
    if (errorCode != GameController_ErrorCode::GAME_CONTROLLER_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "RightTrigger_UnregisterAxisInputMonitor Failed, %{public}d", errorCode);
        return static_cast<int32_t>(errorCode);
    }
    OH_LOG_INFO(LOG_APP, "RightTrigger_UnregisterAxisInputMonitor Success");
    return 0;
}

void GamePad::RightTriggerOnAxisEvent(const struct GamePad_AxisEvent *axisEvent)
{
    std::string val = "Gas";
    double gasAxisValue;
    OH_GamePad_AxisEvent_GetGasAxisValue(axisEvent, &gasAxisValue);
    val.append(std::to_string(gasAxisValue));
    OnAxisEvent(axisEvent, "RightTrigger_OnAxisEvent", val);
}
