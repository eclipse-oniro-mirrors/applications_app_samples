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

import { Driver, ON, Component } from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import hilog from '@ohos.hilog';

const DOMAIN: number = 0x0000;
const TAG: string = 'RecordingDriver';

let _driver: Driver | null = null;
let _uiOperationQueue: Promise<void> = Promise.resolve();
let _queueLock: boolean = false;
let _uiOperationDepth: number = 0;

// Remote control key codes for OpenHarmony TV devices.
// The values are used by UI automation to simulate a physical remote control
// so that generated events stay consistent with real user behaviors on a TV.
export const KEY_LEFT: number = 2014;

export const KEY_RIGHT: number = 2015;

export const KEY_UP: number = 2012;

export const KEY_DOWN: number = 2013;

export const KEY_ENTER: number = 2049;

export const KEY_BACK: number = 2;

export const KEY_HOME: number = 3;

export const KEY_POWER: number = 26;

// Volume down is one of the two keys used to stop a running screen recording.
export const KEY_VOLUME_DOWN: number = 17;

// Menu key is the other key of the stop combination.
export const KEY_MENU: number = 2018;

// Timeout thresholds. The values follow the asynchronous floating windows that
// are created by ScreenRecorderAbility: the timer window appears quickly after
// the service is started, while the tip window lives for a fixed duration.
export const TIMEOUT_TIMER_RENDER: number = 600;

export const TIMEOUT_TIP_RENDER: number = 800;

export const TIMEOUT_RECORD_START: number = 2000;

export const TIMEOUT_RECORD_STOP: number = 3000;

export const TIMEOUT_FOCUS_CHANGE: number = 500;

// Delay applied between two remote control events so that the TV focus engine
// has enough time to settle before the next event is injected.
export const DELAY_KEY_NAVIGATION: number = 50;

export const DELAY_TOUCH_EVENT: number = 100;

export const DELAY_AFTER_STATE_CHANGE: number = 300;

// Hard upper bound for a single UiTest call. Normal interactions finish in a
// few hundred milliseconds; anything slower is treated as a stuck platform call
// so that one bad window state cannot block the remaining suites.
export const UI_OPERATION_TIMEOUT_MS: number = 3000;

// Auto-starting ScreenRecorderAbility through AbilityDelegator blocks on some TV
// products, because the service extension has no foreground window to activate.
// Test cases therefore never start it implicitly: the recording service is
// started by the system when the user triggers recording, and the UI suites
// simply probe whatever is currently on screen. Flip this flag only on a device
// where the delegator call is known to return.
export const ENABLE_SERVICE_AUTOSTART: boolean = false;

// Tolerance values used to absorb tiny rendering fluctuations of the floating
// windows. They avoid false negatives caused by decorations added by the
// system window manager.
export const TOLERANCE_COMPONENT_COUNT: number = 3;

export const TOLERANCE_FOCUS_CHANGE: number = 2;

// Stability probing parameters. One round is enough because the probing loop is
// event driven and stops as soon as the expected window content is observed.
export const STABLE_ROUNDS: number = 1;

export const STABLE_TOLERANCE: number = 3;

// Stress rounds for navigation and lifecycle operations.
export const STRESS_ROUNDS_NAVIGATION: number = 20;

export const STRESS_ROUNDS_LIFECYCLE: number = 10;

// The recording tip page displays these literals, so they are the most stable
// signal that the tip window has really been rendered.
export const TIP_TEXT_TITLE: string = '录屏';

export const TIP_TEXT_CONTENT: string = '录屏视频已存储到"照片"';

// The timer page displays the stop hint and the error hint.
export const TIMER_TEXT_HINT: string = '同时按下菜单键与音量减键，即可结束录屏';

export const TIMER_TEXT_ERROR: string = '未知错误,录制停止';

// The resolution dialog is shown when the device resolution is too high.
export const RESOLUTION_TEXT_TITLE: string = '暂不支持';

export const RESOLUTION_TEXT_CONTENT: string = '当前设备分辨率过高，请降低分辨率';

/** Serialized UI operation runner.
 *  TV devices expose a single UI thread, therefore every UiTest call has to be
 *  serialized. Chaining the operations on a promise queue removes
 *  "concurrent ui operation" failures and keeps the suite deterministic.
 *  Every action is additionally bounded by UI_OPERATION_TIMEOUT_MS: a platform
 *  call that never returns (for example a key injection while a system dialog
 *  owns the focus) must not freeze the whole run.
 */
export async function runSerializedUiOperation<T>(action: () => Promise<T>): Promise<T> {
  // Nested usage (a helper called from inside another serialized action) must
  // run inline, otherwise the action would wait for its own queue slot.
  if (_uiOperationDepth > 0) {
    return await withUiTimeout(action(), UI_OPERATION_TIMEOUT_MS);
  }

  const currentQueue = _uiOperationQueue;
  let releaseGuard: () => void = (): void => {};
  const guard: Promise<void> = new Promise<void>((resolve) => {
    releaseGuard = resolve;
  });
  _uiOperationQueue = currentQueue.then(async () => {
    await guard;
  }).catch(() => {
    // A previous timeout must never poison the queue.
  });

  try {
    await currentQueue;
  } catch (error) {
    hilog.warn(DOMAIN, TAG, 'previous ui operation failed: %{public}s', String(error));
  }

  _uiOperationDepth++;
  try {
    return await withUiTimeout(action(), UI_OPERATION_TIMEOUT_MS);
  } finally {
    _uiOperationDepth--;
    releaseGuard();
  }
}

/** Races one UiTest promise against a hard timeout. */
function withUiTimeout<T>(action: Promise<T>, timeoutMs: number): Promise<T> {
  return new Promise<T>((resolve, reject) => {
    let settled: boolean = false;
    const timer: number = setTimeout(() => {
      if (settled) {
        return;
      }
      settled = true;
      reject(new Error('ui operation timeout after ' + timeoutMs + ' ms'));
    }, timeoutMs);
    action.then((value: T) => {
      if (settled) {
        return;
      }
      settled = true;
      clearTimeout(timer);
      resolve(value);
    }).catch((error: Error) => {
      if (settled) {
        return;
      }
      settled = true;
      clearTimeout(timer);
      reject(error);
    });
  });
}

/** Serialized delay. Delays injected through the driver must also go through the
 *  queue, otherwise UiTest rejects them while a lookup is in progress.
 */
export async function serializedDelay(driver: Driver, delayMs: number): Promise<void> {
  await runSerializedUiOperation(async () => {
    await driver.delayMs(delayMs);
  });
}

/** Serialized key injection. */
export async function triggerSerializedKey(driver: Driver, key: number): Promise<void> {
  await runSerializedUiOperation(async () => {
    await driver.triggerKey(key);
  });
}

/** Lazy singleton of the UI test driver. */
export function getDriver(): Driver {
  if (_driver === null) {
    _driver = Driver.create();
  }
  return _driver;
}

/** Resets the serialized operation queue. Only used by suites that own the
 *  whole UI session and confirmed that no operation is in flight.
 */
export function resetDriver(): void {
  _uiOperationQueue = Promise.resolve();
  _queueLock = false;
}

/** Counts every component of the current screen.
 *  The wildcard lookup is followed by a per-type degraded lookup, because some
 *  TV products do not report a complete list for ON.type('*').
 */
export async function recorderComponentCount(driver: Driver): Promise<number> {
  try {
    return await runSerializedUiOperation(async () => {
      const allComponents = await driver.findComponents(ON.type('*'));
      const count = allComponents ? allComponents.length : 0;
      hilog.info(DOMAIN, TAG, 'recorderComponentCount total: %{public}d', count);
      if (count > 0) {
        return count;
      }
      const textComponents = await driver.findComponents(ON.type('Text'));
      const imageComponents = await driver.findComponents(ON.type('Image'));
      const buttonComponents = await driver.findComponents(ON.type('Button'));
      const textCount = textComponents ? textComponents.length : 0;
      const imageCount = imageComponents ? imageComponents.length : 0;
      const buttonCount = buttonComponents ? buttonComponents.length : 0;
      hilog.info(DOMAIN, TAG, 'degraded count text: %{public}d image: %{public}d button: %{public}d',
        textCount, imageCount, buttonCount);
      return Math.max(textCount, Math.max(imageCount, buttonCount));
    });
  } catch (error) {
    hilog.error(DOMAIN, TAG, 'recorderComponentCount failed: %{public}s', String(error));
    return 0;
  }
}

/** Focus existence and focus index probe.
 *  On TV products ON.focused(true) is not always supported, so the fallback
 *  iterates over the component list and queries isFocused() one by one.
 */
export async function checkFocusState(driver: Driver, expectedFocusedIndex: number): Promise<boolean> {
  const retryIntervalMs = 100;
  const deadline = Date.now() + TIMEOUT_FOCUS_CHANGE;
  let attempt = 1;
  while (Date.now() < deadline) {
    try {
      const result = await runSerializedUiOperation(async () => {
        const focusedComponent = await driver.findComponent(ON.focused(true));
        const allComponents: Component[] = await driver.findComponents(ON.type('*')) ?? [];
        if (expectedFocusedIndex === -1) {
          let hasFocus = !!focusedComponent;
          if (!hasFocus) {
            for (let i = 0; i < allComponents.length; i++) {
              try {
                if (await allComponents[i].isFocused()) {
                  hasFocus = true;
                  break;
                }
              } catch (innerError) {
                hilog.debug(DOMAIN, TAG, 'focus query skipped: %{public}s', String(innerError));
              }
            }
          }
          return hasFocus;
        }
        if (allComponents.length === 0 || expectedFocusedIndex >= allComponents.length) {
          return false;
        }
        try {
          const targetComponent = allComponents[expectedFocusedIndex];
          return await targetComponent.isFocused();
        } catch (innerError) {
          hilog.debug(DOMAIN, TAG, 'focus index skipped: %{public}s', String(innerError));
          return false;
        }
      });
      if (result) {
        return true;
      }
    } catch (error) {
      hilog.error(DOMAIN, TAG, 'checkFocusState failed: %{public}s attempt: %{public}d', String(error), attempt);
    }
    attempt++;
    await serializedDelay(driver, retryIntervalMs);
  }
  return false;
}

/** Checks whether one of the expected literals is present on the screen.
 *  Text matching is the most reliable way to detect the floating windows,
 *  because component counts change with the decorations of the window manager.
 */
export async function checkTextContent(driver: Driver, expectedText: string): Promise<boolean> {
  try {
    return await runSerializedUiOperation(async () => {
      const texts = await driver.findComponents(ON.type('Text')) ?? [];
      if (texts.length === 0) {
        return false;
      }
      for (const text of texts) {
        try {
          const content = await text.getText();
          if (content === expectedText) {
            return true;
          }
        } catch (error) {
          hilog.debug(DOMAIN, TAG, 'text reading skipped: %{public}s', String(error));
        }
      }
      return false;
    });
  } catch (error) {
    hilog.error(DOMAIN, TAG, 'checkTextContent failed: %{public}s', String(error));
    return false;
  }
}

/** Checks whether any of the given literals is present on the screen. */
export async function checkAnyTextContent(driver: Driver, expectedTexts: string[]): Promise<boolean> {
  for (let i = 0; i < expectedTexts.length; i++) {
    const matched = await checkTextContent(driver, expectedTexts[i]);
    if (matched) {
      return true;
    }
  }
  return false;
}

/** Finds all components of a given type. */
export async function findComponentsByType(driver: Driver, type: string): Promise<Component[]> {
  return await runSerializedUiOperation(async () => {
    return await driver.findComponents(ON.type(type)) ?? [];
  });
}

/** Checks whether a component of the given type is present. */
export async function checkComponentExists(driver: Driver, type: string): Promise<boolean> {
  try {
    return await runSerializedUiOperation(async () => {
      const components = await driver.findComponents(ON.type(type));
      const exists = components !== null && components !== undefined && components.length > 0;
      hilog.info(DOMAIN, TAG, 'component type: %{public}s exists: %{public}s', type, String(exists));
      return exists;
    });
  } catch (error) {
    hilog.error(DOMAIN, TAG, 'checkComponentExists failed: %{public}s', String(error));
    return false;
  }
}

/** Index of the focused component, or -1 when no component owns the focus. */
export async function getCurrentFocusIndex(driver: Driver): Promise<number> {
  try {
    return await runSerializedUiOperation(async () => {
      const allComponents: Component[] = await driver.findComponents(ON.type('*')) ?? [];
      if (allComponents.length === 0) {
        return -1;
      }
      for (let i = 0; i < allComponents.length; i++) {
        try {
          if (await allComponents[i].isFocused()) {
            return i;
          }
        } catch (error) {
          hilog.debug(DOMAIN, TAG, 'focus probe skipped: %{public}s', String(error));
        }
      }
      return -1;
    });
  } catch (error) {
    hilog.error(DOMAIN, TAG, 'getCurrentFocusIndex failed: %{public}s', String(error));
    return -1;
  }
}

/** Simulates a touch at the given screen coordinates. */
export async function simulateTouch(driver: Driver, x: number, y: number): Promise<void> {
  await runSerializedUiOperation(async () => {
    await driver.click(x, y);
    await driver.delayMs(DELAY_TOUCH_EVENT);
  });
}

/** Simulates a swipe between two screen coordinates. */
export async function simulateSwipe(driver: Driver, fromX: number, fromY: number, toX: number, toY: number): Promise<void> {
  await runSerializedUiOperation(async () => {
    await driver.swipe(fromX, fromY, toX, toY);
    await driver.delayMs(DELAY_TOUCH_EVENT);
  });
}

/** Triggers the given key a number of times with a fixed delay between events. */
export async function pressAndWait(driver: Driver, key: number, times: number = 1,
  delayMs: number = DELAY_KEY_NAVIGATION): Promise<void> {
  await runSerializedUiOperation(async () => {
    for (let i = 0; i < times; i++) {
      await driver.triggerKey(key);
      await driver.delayMs(delayMs);
    }
  });
}

/** Races a promise against a timeout so that a blocking platform call can never
 *  freeze the whole test run.
 */
async function withTimeout(action: Promise<void>, timeoutMs: number): Promise<void> {
  let timer: number = -1;
  const guard: Promise<void> = new Promise<void>((resolve) => {
    timer = setTimeout(() => {
      resolve();
    }, timeoutMs);
  });
  try {
    await Promise.race([action, guard]);
  } finally {
    if (timer !== -1) {
      clearTimeout(timer);
      timer = -1;
    }
  }
}

/** Starts the ScreenRecorderAbility service extension through the delegator.
 *  The call is disabled by default (see ENABLE_SERVICE_AUTOSTART) and is always
 *  bounded when enabled, so it can never hang the suite.
 */
export async function launchRecorderService(): Promise<void> {
  if (!ENABLE_SERVICE_AUTOSTART) {
    hilog.info(DOMAIN, TAG, 'service autostart is disabled, skip startAbility');
    return;
  }
  try {
    const delegator = abilityDelegatorRegistry.getAbilityDelegator();
    const args = abilityDelegatorRegistry.getArguments();
    const want: Want = {
      bundleName: args.bundleName,
      abilityName: 'ScreenRecorderAbility'
    };
    await withTimeout(delegator.startAbility(want), 1500);
    hilog.info(DOMAIN, TAG, 'startAbility returned');
  } catch (error) {
    hilog.error(DOMAIN, TAG, 'launchRecorderService failed: %{public}s', String(error));
  }
}

/** Triggers a recording start request (startId === 1). */
export async function triggerRecordingStart(driver: Driver): Promise<void> {
  await serializedDelay(driver, 300);
  const visible = await isTimerWindowVisible(driver);
  if (!visible) {
    await launchRecorderService();
  }
  await serializedDelay(driver, DELAY_AFTER_STATE_CHANGE);
  hilog.info(DOMAIN, TAG, 'recording start requested');
}

/** Triggers a recording stop request by injecting the stop key combination. */
export async function triggerRecordingStop(driver: Driver): Promise<void> {
  await runSerializedUiOperation(async () => {
    await driver.triggerKey(KEY_MENU);
    await driver.delayMs(DELAY_KEY_NAVIGATION);
    await driver.triggerKey(KEY_VOLUME_DOWN);
    await driver.delayMs(DELAY_KEY_NAVIGATION);
  });
  await serializedDelay(driver, DELAY_AFTER_STATE_CHANGE);
  hilog.info(DOMAIN, TAG, 'recording stop requested');
}

/** Checks whether the timer floating window is visible. */
export async function isTimerWindowVisible(driver: Driver): Promise<boolean> {
  try {
    return await checkAnyTextContent(driver, [TIMER_TEXT_HINT, TIMER_TEXT_ERROR]);
  } catch (error) {
    hilog.error(DOMAIN, TAG, 'isTimerWindowVisible failed: %{public}s', String(error));
    return false;
  }
}

/** Checks whether the recording tip window is visible. */
export async function isTipWindowVisible(driver: Driver): Promise<boolean> {
  try {
    return await checkAnyTextContent(driver, [TIP_TEXT_TITLE, TIP_TEXT_CONTENT]);
  } catch (error) {
    hilog.error(DOMAIN, TAG, 'isTipWindowVisible failed: %{public}s', String(error));
    return false;
  }
}

/** Checks whether the resolution-not-supported window is visible. */
export async function isResolutionWindowVisible(driver: Driver): Promise<boolean> {
  try {
    return await checkAnyTextContent(driver, [RESOLUTION_TEXT_TITLE, RESOLUTION_TEXT_CONTENT]);
  } catch (error) {
    hilog.error(DOMAIN, TAG, 'isResolutionWindowVisible failed: %{public}s', String(error));
    return false;
  }
}

/** Waits until the timer window is rendered.
 *  The loop is event driven: it stops as soon as the timer hint text appears,
 *  while maxWaitMs only works as a timeout protection.
 */
export async function waitForTimerWindowStable(driver: Driver,
  maxWaitMs: number = TIMEOUT_TIMER_RENDER): Promise<boolean> {
  try {
    const deadline = Date.now() + maxWaitMs;
    while (Date.now() < deadline) {
      if (await isTimerWindowVisible(driver)) {
        return true;
      }
      await serializedDelay(driver, 100);
    }
    hilog.info(DOMAIN, TAG, 'timer window not rendered within %{public}d ms', maxWaitMs);
    return false;
  } catch (error) {
    hilog.error(DOMAIN, TAG, 'waitForTimerWindowStable failed: %{public}s', String(error));
    return false;
  }
}

/** Waits until the tip window is rendered. */
export async function waitForTipWindowStable(driver: Driver,
  maxWaitMs: number = TIMEOUT_TIP_RENDER): Promise<boolean> {
  try {
    const deadline = Date.now() + maxWaitMs;
    while (Date.now() < deadline) {
      if (await isTipWindowVisible(driver)) {
        return true;
      }
      await serializedDelay(driver, 100);
    }
    return false;
  } catch (error) {
    hilog.error(DOMAIN, TAG, 'waitForTipWindowStable failed: %{public}s', String(error));
    return false;
  }
}

/** Reads the text of the first component matching the given type. */
export async function readFirstTextByType(driver: Driver, type: string): Promise<string> {
  try {
    return await runSerializedUiOperation(async () => {
      const components = await driver.findComponents(ON.type(type)) ?? [];
      if (components.length === 0) {
        return '';
      }
      try {
        return await components[0].getText();
      } catch (error) {
        hilog.debug(DOMAIN, TAG, 'first text unreadable: %{public}s', String(error));
        return '';
      }
    });
  } catch (error) {
    hilog.error(DOMAIN, TAG, 'readFirstTextByType failed: %{public}s', String(error));
    return '';
  }
}

/** Simple delay helper used by plain (non UI) scenarios. */
export async function delay(ms: number): Promise<void> {
  return new Promise(resolve => setTimeout(resolve, ms));
}

/** Builds the expected timer label for a duration expressed in seconds. */
export function formatTimerLabel(totalSeconds: number): string {
  const safe = totalSeconds < 0 ? 0 : Math.floor(totalSeconds);
  const hours = Math.floor(safe / 3600);
  const minutes = Math.floor((safe % 3600) / 60);
  const seconds = safe % 60;
  const hh = hours.toString().padStart(2, '0');
  const mm = minutes.toString().padStart(2, '0');
  const ss = seconds.toString().padStart(2, '0');
  return `${hh}:${mm}:${ss}`;
}

/** Builds the expected output file name of a recording.
 *  The production code uses `REC_yyyyMMdd_HHmmss.mp4`, therefore the helper is
 *  shared by every suite that validates persisted artifacts.
 */
export function buildRecordingFileName(date: Date): string {
  const year = date.getFullYear().toString().padStart(4, '0');
  const month = (date.getMonth() + 1).toString().padStart(2, '0');
  const day = date.getDate().toString().padStart(2, '0');
  const hour = date.getHours().toString().padStart(2, '0');
  const minute = date.getMinutes().toString().padStart(2, '0');
  const second = date.getSeconds().toString().padStart(2, '0');
  return `REC_${year}${month}${day}_${hour}${minute}${second}.mp4`;
}

/** Validates the naming rule of a recording file. */
export function isValidRecordingFileName(fileName: string): boolean {
  if (!fileName.startsWith('REC_') || !fileName.endsWith('.mp4')) {
    return false;
  }
  const body = fileName.substring(4, fileName.length - 4);
  if (body.length !== 15 || body.charAt(8) !== '_') {
    return false;
  }
  for (let i = 0; i < body.length; i++) {
    if (i === 8) {
      continue;
    }
    const code = body.charCodeAt(i);
    if (code < 48 || code > 57) {
      return false;
    }
  }
  return true;
}

/** Builds the stop-combination state machine used by InputConsumer.
 *  The recording stops only when the two keys are held at the same time and the
 *  gate is open; releasing any key re-opens the gate.
 */
export class StopCombinationGate {
  private keyA: number;
  private keyB: number;
  private downA: boolean = false;
  private downB: boolean = false;
  private open: boolean = true;
  private fired: number = 0;

  constructor(keyA: number, keyB: number) {
    this.keyA = keyA;
    this.keyB = keyB;
  }

  public onKeyDown(keyCode: number): boolean {
    if (keyCode === this.keyA) {
      this.downA = true;
    }
    if (keyCode === this.keyB) {
      this.downB = true;
    }
    if (this.downA && this.downB && this.open) {
      this.open = false;
      this.fired++;
      return true;
    }
    return false;
  }

  public onKeyUp(keyCode: number): void {
    if (keyCode === this.keyA) {
      this.downA = false;
    }
    if (keyCode === this.keyB) {
      this.downB = false;
    }
    this.open = true;
  }

  public isGateOpen(): boolean {
    return this.open;
  }

  public getFiredCount(): number {
    return this.fired;
  }

  public isDownA(): boolean {
    return this.downA;
  }

  public isDownB(): boolean {
    return this.downB;
  }
}

/** Builds a deterministic list of timestamps for scenario generation. */
export function createScenarioSeeds(count: number, seed: number = 1700000000000): number[] {
  const seeds: number[] = [];
  for (let i = 0; i < count; i++) {
    seeds.push(seed + i * 1000);
  }
  return seeds;
}

