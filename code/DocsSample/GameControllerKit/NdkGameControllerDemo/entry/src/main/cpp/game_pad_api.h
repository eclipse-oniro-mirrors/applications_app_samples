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

#ifndef GAME_PAD_API_H
#define GAME_PAD_API_H

#include <string>
#include "GameControllerKit/game_pad_event.h"
#include "napi/native_api.h"

/**
 * @brief Encapsulates the game pad APIs of GameControllerKit:
 * button input monitors and axis input monitors.
 */
class GamePad {
public:
    // Button input monitors.
    static napi_value LeftShoulder_RegisterButtonInputMonitor(napi_env env, napi_callback_info info);
    static napi_value LeftShoulder_UnregisterButtonInputMonitor(napi_env env, napi_callback_info info);
    static void LeftShoulder_OnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent);
    static napi_value RightShoulder_RegisterButtonInputMonitor(napi_env env, napi_callback_info info);
    static napi_value RightShoulder_UnregisterButtonInputMonitor(napi_env env, napi_callback_info info);
    static void RightShoulder_OnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent);
    static napi_value LeftTrigger_RegisterButtonInputMonitor(napi_env env, napi_callback_info info);
    static napi_value LeftTrigger_UnregisterButtonInputMonitor(napi_env env, napi_callback_info info);
    static void LeftTrigger_OnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent);
    static napi_value RightTrigger_RegisterButtonInputMonitor(napi_env env, napi_callback_info info);
    static napi_value RightTrigger_UnregisterButtonInputMonitor(napi_env env, napi_callback_info info);
    static void RightTrigger_OnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent);
    static napi_value ButtonMenu_RegisterButtonInputMonitor(napi_env env, napi_callback_info info);
    static napi_value ButtonMenu_UnregisterButtonInputMonitor(napi_env env, napi_callback_info info);
    static void ButtonMenu_OnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent);
    static napi_value ButtonHome_RegisterButtonInputMonitor(napi_env env, napi_callback_info info);
    static napi_value ButtonHome_UnregisterButtonInputMonitor(napi_env env, napi_callback_info info);
    static void ButtonHome_OnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent);
    static napi_value ButtonA_RegisterButtonInputMonitor(napi_env env, napi_callback_info info);
    static napi_value ButtonA_UnregisterButtonInputMonitor(napi_env env, napi_callback_info info);
    static void ButtonA_OnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent);
    static napi_value ButtonB_RegisterButtonInputMonitor(napi_env env, napi_callback_info info);
    static napi_value ButtonB_UnregisterButtonInputMonitor(napi_env env, napi_callback_info info);
    static void ButtonB_OnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent);
    static napi_value ButtonC_RegisterButtonInputMonitor(napi_env env, napi_callback_info info);
    static napi_value ButtonC_UnregisterButtonInputMonitor(napi_env env, napi_callback_info info);
    static void ButtonC_OnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent);
    static napi_value ButtonX_RegisterButtonInputMonitor(napi_env env, napi_callback_info info);
    static napi_value ButtonX_UnregisterButtonInputMonitor(napi_env env, napi_callback_info info);
    static void ButtonX_OnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent);
    static napi_value ButtonY_RegisterButtonInputMonitor(napi_env env, napi_callback_info info);
    static napi_value ButtonY_UnregisterButtonInputMonitor(napi_env env, napi_callback_info info);
    static void ButtonY_OnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent);
    static napi_value Dpad_LeftButton_RegisterButtonInputMonitor(napi_env env, napi_callback_info info);
    static napi_value Dpad_LeftButton_UnregisterButtonInputMonitor(napi_env env, napi_callback_info info);
    static void Dpad_LeftButton_OnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent);
    static napi_value Dpad_RightButton_RegisterButtonInputMonitor(napi_env env, napi_callback_info info);
    static napi_value Dpad_RightButton_UnregisterButtonInputMonitor(napi_env env, napi_callback_info info);
    static void Dpad_RightButton_OnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent);
    static napi_value Dpad_UpButton_RegisterButtonInputMonitor(napi_env env, napi_callback_info info);
    static napi_value Dpad_UpButton_UnregisterButtonInputMonitor(napi_env env, napi_callback_info info);
    static void Dpad_UpButton_OnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent);
    static napi_value Dpad_DownButton_RegisterButtonInputMonitor(napi_env env, napi_callback_info info);
    static napi_value Dpad_DownButton_UnregisterButtonInputMonitor(napi_env env, napi_callback_info info);
    static void Dpad_DownButton_OnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent);
    static napi_value LeftThumbstick_RegisterButtonInputMonitor(napi_env env, napi_callback_info info);
    static napi_value LeftThumbstick_UnregisterButtonInputMonitor(napi_env env, napi_callback_info info);
    static void LeftThumbstick_OnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent);
    static napi_value RightThumbstick_RegisterButtonInputMonitor(napi_env env, napi_callback_info info);
    static napi_value RightThumbstick_UnregisterButtonInputMonitor(napi_env env, napi_callback_info info);
    static void RightThumbstick_OnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent);
    static napi_value ButtonNonstandard_RegisterButtonInputMonitor(napi_env env, napi_callback_info info);
    static napi_value ButtonNonstandard_UnregisterButtonInputMonitor(napi_env env, napi_callback_info info);
    static void ButtonNonstandard_OnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent);

    // Axis input monitors.
    static napi_value LeftTrigger_RegisterAxisInputMonitor(napi_env env, napi_callback_info info);
    static napi_value LeftTrigger_UnregisterAxisInputMonitor(napi_env env, napi_callback_info info);
    static void LeftTrigger_OnAxisEvent(const struct GamePad_AxisEvent *axisEvent);
    static napi_value RightTrigger_RegisterAxisInputMonitor(napi_env env, napi_callback_info info);
    static napi_value RightTrigger_UnregisterAxisInputMonitor(napi_env env, napi_callback_info info);
    static void RightTrigger_OnAxisEvent(const struct GamePad_AxisEvent *axisEvent);
    static napi_value Dpad_RegisterAxisInputMonitor(napi_env env, napi_callback_info info);
    static napi_value Dpad_UnregisterAxisInputMonitor(napi_env env, napi_callback_info info);
    static void Dpad_OnAxisEvent(const struct GamePad_AxisEvent *axisEvent);
    static napi_value LeftThumbstick_RegisterAxisInputMonitor(napi_env env, napi_callback_info info);
    static napi_value LeftThumbstick_UnregisterAxisInputMonitor(napi_env env, napi_callback_info info);
    static void LeftThumbstick_OnAxisEvent(const struct GamePad_AxisEvent *axisEvent);
    static napi_value RightThumbstick_RegisterAxisInputMonitor(napi_env env, napi_callback_info info);
    static napi_value RightThumbstick_UnregisterAxisInputMonitor(napi_env env, napi_callback_info info);
    static void RightThumbstick_OnAxisEvent(const struct GamePad_AxisEvent *axisEvent);

    // Shared event handlers.
    static void OnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent, const std::string &buttonName);
    static void OnAxisEvent(const struct GamePad_AxisEvent *axisEvent, const std::string &name, const std::string &val);
};

#endif // GAME_PAD_API_H
