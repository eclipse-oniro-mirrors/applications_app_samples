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

// Directional key codes used by the TabsSample remote/key navigation tests
export const KEY_LEFT: number = 2014;
export const KEY_RIGHT: number = 2015;
export const KEY_UP: number = 2012;
export const KEY_DOWN: number = 2013;
export const KEY_ENTER: number = 2049;
export const KEY_BACK: number = 2;
export const KEY_HOME: number = 3;

// Timing thresholds tuned for tab switching / focus changes
export const TIMEOUT_TABS_RENDER: number = 1000;
export const TIMEOUT_FOCUS_CHANGE: number = 500;
export const DELAY_KEY_NAVIGATION: number = 50;
export const DELAY_TOUCH_EVENT: number = 100;
export const TOLERANCE_COMPONENT_COUNT: number = 5;
export const STABLE_ROUNDS: number = 1;
export const STRESS_ROUNDS_NAVIGATION: number = 20;

// Default labels of the custom TabBar page
export const TAB_LABELS: string[] = ['首页', '新闻', '视频', '朋友圈', '我的'];

/** Serialize UI operations: the TV/phone UI thread is single and shared by all UiTest calls. */
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

export async function serializedDelay(driver: Driver, delayMs: number): Promise<void> {
  await runSerializedUiOperation(async () => {
    await driver.delayMs(delayMs);
  });
}

export function getDriver(): Driver {
  if (_driver === null) {
    _driver = Driver.create();
  }
  return _driver;
}

export function resetDriver(): void {
  _uiOperationQueue = Promise.resolve();
}

export async function pressAndWait(driver: Driver, key: number, times: number = 1,
  delayMs: number = DELAY_KEY_NAVIGATION): Promise<void> {
  await runSerializedUiOperation(async () => {
    for (let i: number = 0; i < times; i++) {
      await driver.triggerKey(key);
      await driver.delayMs(delayMs);
    }
  });
}

export async function triggerSerializedKey(driver: Driver, key: number): Promise<void> {
  await runSerializedUiOperation(async () => {
    await driver.triggerKey(key);
  });
}

export async function tabsComponentCount(driver: Driver): Promise<number> {
  try {
    return await runSerializedUiOperation(async () => {
      const allComponents = await driver.findComponents(ON.type('*'));
      return allComponents ? allComponents.length : 0;
    });
  } catch (error) {
    hilog.error(0x0000, 'testTag', '%{public}s', `tabsComponentCount error: ${error}`);
    return 0;
  }
}

export async function findComponentsByType(driver: Driver, type: string): Promise<Component[]> {
  return await runSerializedUiOperation(async () => {
    return await driver.findComponents(ON.type(type)) ?? [];
  });
}

export async function getCurrentFocusIndex(driver: Driver): Promise<number> {
  try {
    return await runSerializedUiOperation(async () => {
      const allComponents: Component[] = await driver.findComponents(ON.type('*')) ?? [];
      for (let i: number = 0; i < allComponents.length; i++) {
        try {
          const isFocused: boolean = await allComponents[i].isFocused();
          if (isFocused) {
            return i;
          }
        } catch (e) {
        }
      }
      return -1;
    });
  } catch (error) {
    hilog.error(0x0000, 'testTag', '%{public}s', `getCurrentFocusIndex error: ${error}`);
    return -1;
  }
}

export async function checkFocusState(driver: Driver, expectedIndex: number): Promise<boolean> {
  const focusIndex: number = await getCurrentFocusIndex(driver);
  if (expectedIndex === -1) {
    return focusIndex >= -1;
  }
  return focusIndex === expectedIndex;
}

export async function checkTextContent(driver: Driver, expectedText: string): Promise<boolean> {
  try {
    return await runSerializedUiOperation(async () => {
      const texts = await driver.findComponents(ON.type('Text')) ?? [];
      for (const text of texts) {
        try {
          const content: string = await text.getText();
          if (content === expectedText) {
            return true;
          }
        } catch (e) {
        }
      }
      return false;
    });
  } catch (error) {
    return false;
  }
}

export async function checkComponentExists(driver: Driver, type: string): Promise<boolean> {
  const components: Component[] = await findComponentsByType(driver, type);
  return components.length > 0;
}

export async function simulateTouch(driver: Driver, x: number, y: number): Promise<void> {
  await runSerializedUiOperation(async () => {
    await driver.click(x, y);
    await driver.delayMs(DELAY_TOUCH_EVENT);
  });
}

/** Cold start the TabsSample entry ability (loads pages/Index). */
export async function launchTabsApp(): Promise<void> {
  const delegator = abilityDelegatorRegistry.getAbilityDelegator();
  const args = abilityDelegatorRegistry.getArguments();
  const want: Want = {
    bundleName: args.bundleName,
    abilityName: 'EntryAbility'
  };
  const maxAttempts: number = 3;
  for (let attempt: number = 1; attempt <= maxAttempts; attempt++) {
    try {
      await delegator.startAbility(want);
      return;
    } catch (error) {
      if (attempt === maxAttempts) {
        throw error as Error;
      }
      logFailure('launchTabsApp', `attempt ${attempt} failed: ${error}`);
      await sleep(300);
    }
  }
}

export async function triggerTabsHome(driver: Driver): Promise<void> {
  await serializedDelay(driver, 500);
  await launchTabsApp();
  await serializedDelay(driver, 500);
  hilog.info(0x0000, 'testTag', '%{public}s', 'TabsSample home triggered');
}

// ---------------------------------------------------------------------------
// Extended navigation and inspection helpers shared by the TabsSample suites.
// Every UI operation goes through the serialization queue so that parallel test
// files never interleave UiTest calls on the single UI thread.
// ---------------------------------------------------------------------------

export const KEY_TAB: number = 2049;
export const KEY_SHIFT_TAB: number = 2050;
export const KEY_SPACE: number = 2051;
export const KEY_PAGE_UP: number = 2016;
export const KEY_PAGE_DOWN: number = 2017;
export const KEY_MENU: number = 2042;
export const KEY_POWER: number = 18;
export const KEY_VOLUME_UP: number = 16;
export const KEY_VOLUME_DOWN: number = 17;

export const TIMEOUT_APP_LAUNCH: number = 3000;
export const TIMEOUT_COMPONENT_FIND: number = 2000;
export const DELAY_AFTER_CLICK: number = 200;
export const DELAY_BETWEEN_ROUNDS: number = 100;
export const MAX_RETRY: number = 3;
export const STABLE_THRESHOLD: number = 2;
export const TOLERANCE_TEXT_MATCH: number = 0;

export async function sleep(delayMs: number): Promise<void> {
  await new Promise<void>((resolve) => {
    setTimeout(() => {
      resolve();
    }, delayMs);
  });
}

export function logStep(tag: string, message: string): void {
  hilog.info(0x0000, 'testTag', '%{public}s: %{public}s', tag, message);
}

export function logFailure(tag: string, message: string): void {
  hilog.error(0x0000, 'testTag', '%{public}s: %{public}s', tag, message);
}

export async function delayRounds(driver: Driver, rounds: number,
  delayMs: number = DELAY_BETWEEN_ROUNDS): Promise<void> {
  for (let i: number = 0; i < rounds; i++) {
    await serializedDelay(driver, delayMs);
  }
}

export async function resetDriverState(): Promise<void> {
  resetDriver();
  _driver = null;
  logStep('resetDriverState', 'driver state has been reset');
}

export function getTabLabels(): string[] {
  return TAB_LABELS.slice();
}

export function labelAt(index: number): string {
  if (index < 0 || index >= TAB_LABELS.length) {
    return '';
  }
  return TAB_LABELS[index];
}

export function isKnownTabLabel(label: string): boolean {
  for (let i: number = 0; i < TAB_LABELS.length; i++) {
    if (TAB_LABELS[i] === label) {
      return true;
    }
  }
  return false;
}

export function tabLabelIndex(label: string): number {
  for (let i: number = 0; i < TAB_LABELS.length; i++) {
    if (TAB_LABELS[i] === label) {
      return i;
    }
  }
  return -1;
}

export async function safeClick(driver: Driver, x: number, y: number): Promise<boolean> {
  try {
    await runSerializedUiOperation(async () => {
      await driver.click(x, y);
      await driver.delayMs(DELAY_AFTER_CLICK);
    });
    return true;
  } catch (error) {
    logFailure('safeClick', `${error}`);
    return false;
  }
}

export async function safeTriggerKey(driver: Driver, key: number): Promise<boolean> {
  try {
    await triggerSerializedKey(driver, key);
    return true;
  } catch (error) {
    logFailure('safeTriggerKey', `${error}`);
    return false;
  }
}

export async function findFirstByType(driver: Driver, type: string): Promise<Component | null> {
  try {
    return await runSerializedUiOperation(async () => {
      const components: Component[] = await driver.findComponents(ON.type(type)) ?? [];
      return components.length > 0 ? components[0] : null;
    });
  } catch (error) {
    logFailure('findFirstByType', `${error}`);
    return null;
  }
}

export async function countByType(driver: Driver, type: string): Promise<number> {
  const components: Component[] = await findComponentsByType(driver, type);
  return components.length;
}

export async function safeGetText(component: Component): Promise<string> {
  try {
    const content: string = await component.getText();
    return content ?? '';
  } catch (error) {
    return '';
  }
}

export async function getTexts(driver: Driver): Promise<string[]> {
  try {
    return await runSerializedUiOperation(async () => {
      const texts: Component[] = await driver.findComponents(ON.type('Text')) ?? [];
      const result: string[] = [];
      for (let i: number = 0; i < texts.length; i++) {
        const content: string = await safeGetText(texts[i]);
        if (content.length > 0) {
          result.push(content);
        }
      }
      return result;
    });
  } catch (error) {
    logFailure('getTexts', `${error}`);
    return [];
  }
}

export async function containsText(driver: Driver, text: string): Promise<boolean> {
  if (text.length === 0) {
    return false;
  }
  try {
    return await runSerializedUiOperation(async () => {
      const texts: Component[] = await driver.findComponents(ON.type('Text')) ?? [];
      for (let i: number = 0; i < texts.length; i++) {
        const content: string = await safeGetText(texts[i]);
        if (content === text) {
          return true;
        }
      }
      return false;
    });
  } catch (error) {
    logFailure('containsText', `${error}`);
    return false;
  }
}

export async function waitForText(driver: Driver, text: string,
  timeoutMs: number = TIMEOUT_COMPONENT_FIND): Promise<boolean> {
  const start: number = Date.now();
  while (Date.now() - start < timeoutMs) {
    const found: boolean = await containsText(driver, text);
    if (found) {
      return true;
    }
    await serializedDelay(driver, DELAY_BETWEEN_ROUNDS);
  }
  return false;
}

export async function waitForType(driver: Driver, type: string,
  timeoutMs: number = TIMEOUT_COMPONENT_FIND): Promise<boolean> {
  const start: number = Date.now();
  while (Date.now() - start < timeoutMs) {
    const count: number = await countByType(driver, type);
    if (count > 0) {
      return true;
    }
    await serializedDelay(driver, DELAY_BETWEEN_ROUNDS);
  }
  return false;
}

export async function pressBack(driver: Driver): Promise<void> {
  await triggerSerializedKey(driver, KEY_BACK);
  await serializedDelay(driver, DELAY_KEY_NAVIGATION);
}

export async function pressHome(driver: Driver): Promise<void> {
  await triggerSerializedKey(driver, KEY_HOME);
  await serializedDelay(driver, DELAY_KEY_NAVIGATION);
}

export async function pressEnter(driver: Driver): Promise<void> {
  await triggerSerializedKey(driver, KEY_ENTER);
  await serializedDelay(driver, DELAY_KEY_NAVIGATION);
}

export async function navigateLeft(driver: Driver): Promise<void> {
  await pressAndWait(driver, KEY_LEFT);
}

export async function navigateRight(driver: Driver): Promise<void> {
  await pressAndWait(driver, KEY_RIGHT);
}

export async function navigateUp(driver: Driver): Promise<void> {
  await pressAndWait(driver, KEY_UP);
}

export async function navigateDown(driver: Driver): Promise<void> {
  await pressAndWait(driver, KEY_DOWN);
}

export async function swipe(driver: Driver, fromX: number, fromY: number,
  toX: number, toY: number): Promise<void> {
  await runSerializedUiOperation(async () => {
    await driver.swipe(fromX, fromY, toX, toY, 500);
    await driver.delayMs(DELAY_TOUCH_EVENT);
  });
}

export async function swipeLeft(driver: Driver): Promise<void> {
  await swipe(driver, 720, 640, 240, 640);
}

export async function swipeRight(driver: Driver): Promise<void> {
  await swipe(driver, 240, 640, 720, 640);
}

export async function swipeUp(driver: Driver): Promise<void> {
  await swipe(driver, 480, 900, 480, 300);
}

export async function swipeDown(driver: Driver): Promise<void> {
  await swipe(driver, 480, 300, 480, 900);
}

export async function stressPress(driver: Driver, key: number,
  times: number = STRESS_ROUNDS_NAVIGATION): Promise<number> {
  let success: number = 0;
  for (let i: number = 0; i < times; i++) {
    const ok: boolean = await safeTriggerKey(driver, key);
    if (ok) {
      success++;
    }
    await serializedDelay(driver, DELAY_KEY_NAVIGATION);
  }
  return success;
}

export async function repeatUntilFocused(driver: Driver, key: number,
  expectedIndex: number, maxRounds: number = MAX_RETRY * 10): Promise<boolean> {
  for (let i: number = 0; i < maxRounds; i++) {
    const focused: boolean = await checkFocusState(driver, expectedIndex);
    if (focused) {
      return true;
    }
    await safeTriggerKey(driver, key);
    await serializedDelay(driver, DELAY_KEY_NAVIGATION);
  }
  return await checkFocusState(driver, expectedIndex);
}

export async function collectVisibleTexts(driver: Driver, maxItems: number = 10): Promise<string[]> {
  const texts: string[] = await getTexts(driver);
  if (texts.length <= maxItems) {
    return texts;
  }
  return texts.slice(0, maxItems);
}

export async function describeUi(driver: Driver): Promise<string> {
  const total: number = await tabsComponentCount(driver);
  const texts: string[] = await getTexts(driver);
  return `components=${total};texts=${texts.length}`;
}

export async function triggerTabsHomeWithRetry(driver: Driver,
  retries: number = MAX_RETRY): Promise<boolean> {
  for (let i: number = 0; i < retries; i++) {
    try {
      await triggerTabsHome(driver);
      const ready: boolean = await waitForType(driver, 'Text', TIMEOUT_APP_LAUNCH);
      if (ready) {
        return true;
      }
    } catch (error) {
      logFailure('triggerTabsHomeWithRetry', `${error}`);
    }
  }
  return false;
}
