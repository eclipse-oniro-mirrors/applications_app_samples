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

import { inputMethodEngine } from '@kit.IMEKit';
import { keyboardController } from '../../../../main/ets/InputMethodExtensionAbility/model/KeyboardController';

/** Key action value carried by a key-down KeyEvent. */
export const KEY_ACTION_DOWN: number = 2;
/** Key action value carried by a key-up KeyEvent. */
export const KEY_ACTION_UP: number = 3;

/**
 * Builds the two-field KeyEvent consumed by the production controller.
 *
 * @param keyCode raw multimodal key code
 * @param keyAction KEY_ACTION_DOWN or KEY_ACTION_UP
 */
export function makeKeyEvent(keyCode: number, keyAction: number): inputMethodEngine.KeyEvent {
  const event: inputMethodEngine.KeyEvent = { keyCode: keyCode, keyAction: keyAction };
  return event;
}

/**
 * Sends a key-down event to the production singleton.
 *
 * The controller is a process-wide singleton in this project, so each test
 * must release every key it presses; the state-policy suites do that cleanup.
 */
export function pressHardKey(keyCode: number): boolean {
  return keyboardController.onKeyDown(makeKeyEvent(keyCode, KEY_ACTION_DOWN));
}

/** Sends a key-up event to the production singleton. */
export function releaseHardKey(keyCode: number): boolean {
  return keyboardController.onKeyUp(makeKeyEvent(keyCode, KEY_ACTION_UP));
}

/** Returns true while the first held key is a left or right shift. */
export function isShiftHeld(): boolean {
  return keyboardController.isShiftKeyHold();
}
