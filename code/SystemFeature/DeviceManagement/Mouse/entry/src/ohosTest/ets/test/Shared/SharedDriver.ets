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

let _driver: Driver | null = null;
let _uiOperationQueue: Promise<void> = Promise.resolve();

// Direction and navigation key codes used by the mouse settings page.
// These values follow the OpenHarmony key code definition so that simulated
// navigation matches real physical interaction on phones and tablets.
export const KEY_LEFT: number = 2014;

export const KEY_RIGHT: number = 2015;

export const KEY_UP: number = 2012;

export const KEY_DOWN: number = 2013;

export const KEY_ENTER: number = 2049;

export const KEY_TAB: number = 2049;

export const KEY_ESCAPE: number = 2070;

// Text markers rendered by the mouse settings page. They are used to detect
// that the page has finished rendering before assertions are executed.
export const TEXT_SETTING_TITLE: string = '鼠标设置';

export const TEXT_PRIMARY_BUTTON: string = '鼠标主按键';

export const TEXT_HOVER_SCROLL: string = '悬停滚动';

export const TEXT_POINTER_SIZE: string = '鼠标指针大小';

export const TEXT_POINTER_COLOR: string = '鼠标指针颜色';

export const TEXT_POINTER_STYLE: string = '鼠标指针样式';

export const TEXT_PRIMARY_LEFT: string = '向左键';

export const TEXT_PRIMARY_RIGHT: string = '向右键';

export const TEXT_COLOR_BLACK: string = '黑色';

export const TEXT_COLOR_WHITE: string = '白色';

export const TEXT_STYLE_DEFAULT: string = '默认';

export const TEXT_STYLE_LOADING: string = '加载';

// Timeout thresholds and delays tailored for a lightweight settings page.
export const TIMEOUT_PAGE_RENDER: number = 1000;

export const TIMEOUT_SETTING_APPLY: number = 2000;

export const TIMEOUT_SESSION_CREATE: number = 1000;

export const TIMEOUT_FOCUS_CHANGE: number = 500;

export const DELAY_KEY_NAVIGATION: number = 50;

export const DELAY_TOUCH_EVENT: number = 100;

export const DELAY_AFTER_SETTING_OP: number = 500;

// Tolerances used by stability checks to absorb minor rendering differences.
export const TOLERANCE_COMPONENT_COUNT: number = 3;

export const TOLERANCE_FOCUS_CHANGE: number = 2;

export const STABLE_ROUNDS: number = 1;

export const STABLE_TOLERANCE: number = 3;

export const STRESS_ROUNDS_NAVIGATION: number = 20;

export const STRESS_ROUNDS_LIFECYCLE: number = 10;

// Pointer size and color constants mirroring the values used by the page.
export const POINTER_SIZE_MIN: number = 1;

export const POINTER_SIZE_MAX: number = 7;

export const POINTER_SIZE_DEFAULT: number = 1;

export const POINTER_COLOR_BLACK: number = 0x171717;

export const POINTER_COLOR_WHITE: number = 0xFFFFFF;

/** Serialized UI executor: chains every UI operation onto a single Promise
 *  queue. The settings page renders on a single UI thread, therefore UI
 *  operations must be serialized to avoid focus races and inconsistent reads.
 */
export async function runSerializedUiOperation<T>(action: () => Promise<T>): Promise<T> {
  const currentQueue = _uiOperationQueue;

  const result = await new Promise<T>((resolve, reject) => {
    _uiOperationQueue = currentQueue.then(async () => {
      try {
        const actionResult = await action();
        resolve(actionResult);
      } catch (error) {
        const errorMsg: Error = error instanceof Error ? error : new Error(String(error));
        reject(errorMsg);
      }
    }).catch((error: Error) => {
      reject(error);
    });
  });

  return result;
}

/** Serialized delay: a delay must also pass through the queue so that it does
 *  not interleave with findComponents or triggerKey calls internally.
 */
export async function serializedDelay(driver: Driver, delayMs: number): Promise<void> {
  await runSerializedUiOperation(async () => {
    await driver.delayMs(delayMs);
  });
}

/** Serialized key trigger: wraps triggerKey to guarantee ordering. */
export async function triggerSerializedKey(driver: Driver, key: number): Promise<void> {
  await runSerializedUiOperation(async () => {
    await driver.triggerKey(key);
  });
}

/** Lazily create the singleton UiTest driver. */
export function getDriver(): Driver {
  if (_driver === null) {
    _driver = Driver.create();
  }
  return _driver;
}

/** Reset the driver operation queue. Only used in controlled teardown paths. */
export function resetDriver(): void {
  _uiOperationQueue = Promise.resolve();
}

/** Count the components rendered by the mouse settings page. */
export async function mouseSettingsComponentCount(driver: Driver): Promise<number> {
  try {
    return await runSerializedUiOperation(async () => {
      const allComponents = await driver.findComponents(ON.type('*'));
      const count = allComponents ? allComponents.length : 0;
      hilog.info(0x0000, 'testTag', '%{public}s', `mouseSettingsComponentCount: found ${count} components`);
      return count;
    });
  } catch (error) {
    hilog.error(0x0000, 'testTag', '%{public}s', `mouseSettingsComponentCount error: ${error}`);
    return 0;
  }
}

/** Find components by type, normalizing null/undefined to an empty array. */
export async function findComponentsByType(driver: Driver, type: string): Promise<Component[]> {
  return await runSerializedUiOperation(async () => {
    return await driver.findComponents(ON.type(type)) ?? [];
  });
}

/** Check whether the given text exists among all rendered Text components. */
export async function checkTextContent(driver: Driver, expectedText: string): Promise<boolean> {
  try {
    return await runSerializedUiOperation(async () => {
      const texts = await driver.findComponents(ON.type('Text')) ?? [];
      if (texts.length === 0) {
        hilog.info(0x0000, 'testTag', '%{public}s', 'checkTextContent: no text components found');
        return false;
      }
      for (const text of texts) {
        try {
          const content = await text.getText();
          if (content === expectedText) {
            hilog.info(0x0000, 'testTag', '%{public}s', `checkTextContent: matched ${expectedText}`);
            return true;
          }
        } catch (e) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'checkTextContent: single component read failed');
        }
      }
      return false;
    });
  } catch (error) {
    hilog.error(0x0000, 'testTag', '%{public}s', `checkTextContent error: ${error}`);
    return false;
  }
}

/** Determine whether the mouse settings page is visible by matching titles. */
export async function isMouseSettingsVisible(driver: Driver): Promise<boolean> {
  try {
    return await runSerializedUiOperation(async () => {
      const texts = await driver.findComponents(ON.type('Text')) ?? [];
      if (texts.length === 0) {
        return false;
      }
      for (const text of texts) {
        try {
          const content = await text.getText();
          if (content === TEXT_SETTING_TITLE || content === TEXT_PRIMARY_BUTTON ||
            content === TEXT_POINTER_SIZE || content === TEXT_POINTER_STYLE) {
            return true;
          }
        } catch (e) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'isMouseSettingsVisible: read failed');
        }
      }
      return false;
    });
  } catch (error) {
    hilog.error(0x0000, 'testTag', '%{public}s', `isMouseSettingsVisible error: ${error}`);
    return false;
  }
}

/** Wait until the settings page render event is observed or timeout hits. */
export async function waitForMouseSettingsStable(driver: Driver,
  maxWaitMs: number = TIMEOUT_PAGE_RENDER): Promise<boolean> {
  try {
    hilog.info(0x0000, 'testTag', '%{public}s',
      `waitForMouseSettingsStable: waiting for render event, maxWaitMs: ${maxWaitMs}`);
    const deadline = Date.now() + maxWaitMs;
    while (Date.now() < deadline) {
      const visible = await isMouseSettingsVisible(driver);
      if (visible) {
        hilog.info(0x0000, 'testTag', '%{public}s', 'waitForMouseSettingsStable: render event observed');
        return true;
      }
      await serializedDelay(driver, 100);
    }
    hilog.info(0x0000, 'testTag', '%{public}s', 'waitForMouseSettingsStable: relaunching settings page');
    await triggerMouseSettings(driver);
    const secondDeadline = Date.now() + maxWaitMs;
    while (Date.now() < secondDeadline) {
      const visible = await isMouseSettingsVisible(driver);
      if (visible) {
        hilog.info(0x0000, 'testTag', '%{public}s', 'waitForMouseSettingsStable: render observed after relaunch');
        return true;
      }
      await serializedDelay(driver, 100);
    }
    return false;
  } catch (error) {
    hilog.error(0x0000, 'testTag', '%{public}s', `waitForMouseSettingsStable error: ${error}`);
    return false;
  }
}

/** Trigger a touch at the given coordinates and wait for event handling. */
export async function simulateTouch(driver: Driver, x: number, y: number): Promise<void> {
  await runSerializedUiOperation(async () => {
    await driver.click(x, y);
    await driver.delayMs(DELAY_TOUCH_EVENT);
  });
}

/** Cold start the entry ability that hosts the mouse settings page. */
export async function launchMouseSettingsApp(): Promise<void> {
  const delegator = abilityDelegatorRegistry.getAbilityDelegator();
  const args = abilityDelegatorRegistry.getArguments();
  const want: Want = {
    bundleName: args.bundleName,
    abilityName: 'EntryAbility'
  };
  await delegator.startAbility(want);
}

/** Ensure the mouse settings page is displayed. */
export async function triggerMouseSettings(driver: Driver): Promise<void> {
  await serializedDelay(driver, 1000);
  const visible = await isMouseSettingsVisible(driver);
  if (!visible) {
    await launchMouseSettingsApp();
  }
  await serializedDelay(driver, 1000);
  hilog.info(0x0000, 'testTag', '%{public}s', 'mouse settings page triggered');
}

/** Press a key repeatedly with a fixed delay after each press. */
export async function pressAndWait(driver: Driver, key: number, times: number = 1,
  delayMs: number = DELAY_KEY_NAVIGATION): Promise<void> {
  await runSerializedUiOperation(async () => {
    for (let i = 0; i < times; i++) {
      await driver.triggerKey(key);
      await driver.delayMs(delayMs);
    }
  });
}

/** Check whether a component of the given type exists. */
export async function checkComponentExists(driver: Driver, type: string): Promise<boolean> {
  try {
    return await runSerializedUiOperation(async () => {
      const components = await driver.findComponents(ON.type(type));
      const exists = components !== null && components !== undefined && components.length > 0;
      hilog.info(0x0000, 'testTag', '%{public}s', `checkComponentExists: ${type} exists: ${exists}`);
      return exists;
    });
  } catch (error) {
    hilog.error(0x0000, 'testTag', '%{public}s', `checkComponentExists error: ${error}`);
    return false;
  }
}

/** Return the index of the currently focused component, or -1. */
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
            hilog.info(0x0000, 'testTag', '%{public}s', `getCurrentFocusIndex: focus at ${i}`);
            return i;
          }
        } catch (e) {
          hilog.info(0x0000, 'testTag', '%{public}s', `getCurrentFocusIndex: check ${i} failed`);
        }
      }
      return -1;
    });
  } catch (error) {
    hilog.error(0x0000, 'testTag', '%{public}s', `getCurrentFocusIndex error: ${error}`);
    return -1;
  }
}

/** Check whether focus exists (optionally at a specific index). */
export async function checkFocusState(driver: Driver, expectedFocusedIndex: number): Promise<boolean> {
  const retryIntervalMs = 100;
  const deadline = Date.now() + TIMEOUT_FOCUS_CHANGE;
  let attempt = 1;
  while (Date.now() < deadline) {
    try {
      const result = await runSerializedUiOperation(async () => {
        const allComponents: Component[] = await driver.findComponents(ON.type('*')) ?? [];
        if (expectedFocusedIndex === -1) {
          for (let i = 0; i < allComponents.length; i++) {
            try {
              if (await allComponents[i].isFocused()) {
                return true;
              }
            } catch (e) {
              hilog.info(0x0000, 'testTag', '%{public}s', 'checkFocusState: skip component');
            }
          }
          return false;
        }
        if (allComponents.length === 0 || expectedFocusedIndex >= allComponents.length) {
          return false;
        }
        try {
          return await allComponents[expectedFocusedIndex].isFocused();
        } catch (e) {
          return false;
        }
      });
      if (result) {
        return true;
      }
    } catch (error) {
      hilog.error(0x0000, 'testTag', '%{public}s', `checkFocusState error: ${error} attempt: ${attempt}`);
    }
    attempt++;
    await serializedDelay(driver, retryIntervalMs);
  }
  return false;
}

/** Simple delay helper for pure logic suites. */
export async function plainDelay(ms: number): Promise<void> {
  return new Promise(resolve => setTimeout(resolve, ms));
}

/** Return the primary button label that the page should display for the given
 *  numeric value (0 = left, 1 = right). This mirrors the Select component that
 *  renders the mouse primary button option on the settings page.
 */
export function primaryButtonLabel(value: number): string {
  return value === 0 ? TEXT_PRIMARY_LEFT : TEXT_PRIMARY_RIGHT;
}

/** Return the pointer color label for the given ARGB value. */
export function pointerColorLabel(value: number): string {
  return value === POINTER_COLOR_BLACK ? TEXT_COLOR_BLACK : TEXT_COLOR_WHITE;
}

/** Return the pointer style label for the given style index. */
export function pointerStyleLabel(value: number): string {
  return value === 0 ? TEXT_STYLE_DEFAULT : TEXT_STYLE_LOADING;
}

/** Clamp a pointer size into the supported range of the slider. */
export function clampPointerSize(size: number): number {
  if (size < POINTER_SIZE_MIN) {
    return POINTER_SIZE_MIN;
  }
  if (size > POINTER_SIZE_MAX) {
    return POINTER_SIZE_MAX;
  }
  return size;
}

/** Convert a pointer size into the slider percentage used by the page tip. */
export function pointerSizeToPercent(size: number): number {
  const clamped: number = clampPointerSize(size);
  return Math.round(((clamped - POINTER_SIZE_MIN) / (POINTER_SIZE_MAX - POINTER_SIZE_MIN)) * 100);
}

/** Wait until the given text appears among the rendered Text components.
 *  Returns false when the timeout is reached; the caller can decide whether a
 *  missing text is a hard failure or an acceptable optional element.
 */
export async function waitForTextContent(driver: Driver, text: string,
  maxWaitMs: number = TIMEOUT_SETTING_APPLY): Promise<boolean> {
  const deadline = Date.now() + maxWaitMs;
  while (Date.now() < deadline) {
    const found: boolean = await checkTextContent(driver, text);
    if (found) {
      hilog.info(0x0000, 'testTag', '%{public}s', `waitForTextContent: found ${text}`);
      return true;
    }
    await serializedDelay(driver, 100);
  }
  hilog.info(0x0000, 'testTag', '%{public}s', `waitForTextContent: timeout for ${text}`);
  return false;
}

/** Check whether any component of the given type is currently present. */
export async function isComponentPresent(driver: Driver, type: string): Promise<boolean> {
  const components: Component[] = await findComponentsByType(driver, type);
  return components.length > 0;
}

/** Count text components that exactly match one of the expected labels. */
export async function countMatchingTexts(driver: Driver, expected: string[]): Promise<number> {
  try {
    return await runSerializedUiOperation(async () => {
      const texts = await driver.findComponents(ON.type('Text')) ?? [];
      let matched: number = 0;
      for (const text of texts) {
        try {
          const content = await text.getText();
          if (expected.includes(content)) {
            matched++;
          }
        } catch (e) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'countMatchingTexts: read failed');
        }
      }
      return matched;
    });
  } catch (error) {
    hilog.error(0x0000, 'testTag', '%{public}s', `countMatchingTexts error: ${error}`);
    return 0;
  }
}

/** Provide the canonical mouse settings labels expected on the page. */
export function mouseSettingLabels(): string[] {
  return [
    TEXT_PRIMARY_BUTTON,
    TEXT_HOVER_SCROLL,
    TEXT_POINTER_SIZE,
    TEXT_POINTER_COLOR,
    TEXT_POINTER_STYLE
  ];
}

/** Describe the supported runtime constants for diagnostics in test reports. */
export function describeRuntimeConstants(): string {
  return `size:[${POINTER_SIZE_MIN},${POINTER_SIZE_MAX}] default:${POINTER_SIZE_DEFAULT} ` +
    `black:${POINTER_COLOR_BLACK} white:${POINTER_COLOR_WHITE}`;
}
