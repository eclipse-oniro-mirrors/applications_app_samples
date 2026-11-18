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

#include <cstdint>
#include <string>
#include "GameControllerKit/game_pad_event.h"

/**
 * @brief Encapsulates the game pad APIs of GameControllerKit:
 * button input monitors and axis input monitors.
 */
class GamePad {
public:
    // Button input monitors.
    static int32_t LeftShoulderRegisterButtonInputMonitor();
    static int32_t LeftShoulderUnregisterButtonInputMonitor();
    static void LeftShoulderOnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent);
    static int32_t RightShoulderRegisterButtonInputMonitor();
    static int32_t RightShoulderUnregisterButtonInputMonitor();
    static void RightShoulderOnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent);
    static int32_t LeftTriggerRegisterButtonInputMonitor();
    static int32_t LeftTriggerUnregisterButtonInputMonitor();
    static void LeftTriggerOnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent);
    static int32_t RightTriggerRegisterButtonInputMonitor();
    static int32_t RightTriggerUnregisterButtonInputMonitor();
    static void RightTriggerOnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent);
    static int32_t ButtonMenuRegisterButtonInputMonitor();
    static int32_t ButtonMenuUnregisterButtonInputMonitor();
    static void ButtonMenuOnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent);
    static int32_t ButtonHomeRegisterButtonInputMonitor();
    static int32_t ButtonHomeUnregisterButtonInputMonitor();
    static void ButtonHomeOnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent);
    static int32_t ButtonARegisterButtonInputMonitor();
    static int32_t ButtonAUnregisterButtonInputMonitor();
    static void ButtonAOnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent);
    static int32_t ButtonBRegisterButtonInputMonitor();
    static int32_t ButtonBUnregisterButtonInputMonitor();
    static void ButtonBOnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent);
    static int32_t ButtonCRegisterButtonInputMonitor();
    static int32_t ButtonCUnregisterButtonInputMonitor();
    static void ButtonCOnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent);
    static int32_t ButtonXRegisterButtonInputMonitor();
    static int32_t ButtonXUnregisterButtonInputMonitor();
    static void ButtonXOnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent);
    static int32_t ButtonYRegisterButtonInputMonitor();
    static int32_t ButtonYUnregisterButtonInputMonitor();
    static void ButtonYOnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent);
    static int32_t DpadLeftButtonRegisterButtonInputMonitor();
    static int32_t DpadLeftButtonUnregisterButtonInputMonitor();
    static void DpadLeftButtonOnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent);
    static int32_t DpadRightButtonRegisterButtonInputMonitor();
    static int32_t DpadRightButtonUnregisterButtonInputMonitor();
    static void DpadRightButtonOnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent);
    static int32_t DpadUpButtonRegisterButtonInputMonitor();
    static int32_t DpadUpButtonUnregisterButtonInputMonitor();
    static void DpadUpButtonOnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent);
    static int32_t DpadDownButtonRegisterButtonInputMonitor();
    static int32_t DpadDownButtonUnregisterButtonInputMonitor();
    static void DpadDownButtonOnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent);
    static int32_t LeftThumbstickRegisterButtonInputMonitor();
    static int32_t LeftThumbstickUnregisterButtonInputMonitor();
    static void LeftThumbstickOnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent);
    static int32_t RightThumbstickRegisterButtonInputMonitor();
    static int32_t RightThumbstickUnregisterButtonInputMonitor();
    static void RightThumbstickOnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent);
    static int32_t ButtonNonstandardRegisterButtonInputMonitor();
    static int32_t ButtonNonstandardUnregisterButtonInputMonitor();
    static void ButtonNonstandardOnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent);

    // Axis input monitors.
    static int32_t LeftTriggerRegisterAxisInputMonitor();
    static int32_t LeftTriggerUnregisterAxisInputMonitor();
    static void LeftTriggerOnAxisEvent(const struct GamePad_AxisEvent *axisEvent);
    static int32_t RightTriggerRegisterAxisInputMonitor();
    static int32_t RightTriggerUnregisterAxisInputMonitor();
    static void RightTriggerOnAxisEvent(const struct GamePad_AxisEvent *axisEvent);
    static int32_t DpadRegisterAxisInputMonitor();
    static int32_t DpadUnregisterAxisInputMonitor();
    static void DpadOnAxisEvent(const struct GamePad_AxisEvent *axisEvent);
    static int32_t LeftThumbstickRegisterAxisInputMonitor();
    static int32_t LeftThumbstickUnregisterAxisInputMonitor();
    static void LeftThumbstickOnAxisEvent(const struct GamePad_AxisEvent *axisEvent);
    static int32_t RightThumbstickRegisterAxisInputMonitor();
    static int32_t RightThumbstickUnregisterAxisInputMonitor();
    static void RightThumbstickOnAxisEvent(const struct GamePad_AxisEvent *axisEvent);

    // Shared event handlers.
    static void OnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent, const std::string &buttonName);
    static void OnAxisEvent(const struct GamePad_AxisEvent *axisEvent, const std::string &name, const std::string &val);
};

#endif // GAME_PAD_API_H
