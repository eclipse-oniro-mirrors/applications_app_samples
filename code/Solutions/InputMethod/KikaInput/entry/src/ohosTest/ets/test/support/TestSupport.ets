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

import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import inputMethodEngine from '@ohos.inputMethodEngine';
import type InputMethodExtensionContext from '@ohos.InputMethodExtensionContext';
import { KeyboardController } from '../../../../main/ets/model/KeyboardController';

/** Key action value carried by a key-down KeyEvent. */
const KEY_ACTION_DOWN: number = 2;
/** Key action value carried by a key-up KeyEvent. */
const KEY_ACTION_UP: number = 3;

/**
 * Creates an isolated KeyboardController for one test case.
 *
 * The controller only stores the extension context; the key-handling paths under
 * test never dereference it. The ability's application context is therefore a
 * safe stand-in and keeps the key state local to the case.
 */
export function createKeyboardController(): KeyboardController {
  const appContext: InputMethodExtensionContext =
    AbilityDelegatorRegistry.getAbilityDelegator().getAppContext() as InputMethodExtensionContext;
  return new KeyboardController(appContext);
}

/**
 * Builds the two-field KeyEvent consumed by KeyboardController.
 *
 * @param keyCode raw multimodal key code
 * @param keyAction KEY_ACTION_DOWN or KEY_ACTION_UP
 */
function makeKeyEvent(keyCode: number, keyAction: number): inputMethodEngine.KeyEvent {
  const event: inputMethodEngine.KeyEvent = { keyCode: keyCode, keyAction: keyAction };
  return event;
}

/** Sends a key-down event and returns the controller's interception result. */
export function pressHardKey(controller: KeyboardController, keyCode: number): boolean {
  return controller.onKeyDown(makeKeyEvent(keyCode, KEY_ACTION_DOWN));
}

/** Sends a key-up event and returns the controller's interception result. */
export function releaseHardKey(controller: KeyboardController, keyCode: number): boolean {
  return controller.onKeyUp(makeKeyEvent(keyCode, KEY_ACTION_UP));
}

/**
 * Sends a key event with an arbitrary key action.
 *
 * The handler only reads keyCode, so this helper exposes that contract without
 * duplicating the KeyEvent construction in the boundary suite.
 */
export function sendKeyAction(controller: KeyboardController, keyCode: number, keyAction: number): boolean {
  return controller.onKeyDown(makeKeyEvent(keyCode, keyAction));
}

/** Sends a key-up event with an arbitrary key action. */
export function sendKeyUpAction(controller: KeyboardController, keyCode: number, keyAction: number): boolean {
  return controller.onKeyUp(makeKeyEvent(keyCode, keyAction));
}

/** Checks whether the code falls inside the A..Z block. */
export function isAlphabetKeyCode(controller: KeyboardController, keyCode: number): boolean {
  return controller.isKeyCodeAZ(keyCode);
}

/** Checks whether the code belongs to either decimal digit block. */
export function isNumberKeyCode(controller: KeyboardController, keyCode: number): boolean {
  return controller.isKeyCodeNumber(keyCode);
}

/** Returns true while the first held key is a left or right shift. */
export function isShiftHeld(controller: KeyboardController): boolean {
  return controller.isShiftKeyHold();
}

/** Routes a HardKeyUtils token through the function-key stage. */
export function processFunctionToken(controller: KeyboardController, token: string): boolean {
  return controller.processFunctionKeys(token);
}

/** Routes a HardKeyUtils token through the shift-key stage. */
export function translateShiftToken(controller: KeyboardController, token: string): boolean {
  return controller.shiftKeys(token);
}

/**
 * Routes a token through the composed input stage (function -> shift -> insert).
 *
 * @param token symbolic token emitted by GetHardKeyValue
 * @param keyCode original key code, kept for diagnostics in the controller
 */
export function inputHardKeyValue(controller: KeyboardController, token: string,
  keyCode: number): boolean {
  return controller.inputHardKeyCode(token, keyCode);
}
