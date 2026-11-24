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

import { Driver, ON, Component, MatchPattern } from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import hilog from '@ohos.hilog';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_DeviceManagement_SharedDriver]';

/**
 * Shared UI automation driver for the DeviceManagementCollection XTS suite.
 *
 * The reference TV power dialog suite serializes every UiTest operation through
 * a single promise chain because the TV UI thread is single threaded. The
 * DeviceManagement sample has the same constraint: the capability list, the
 * detail pages and the auxiliary input listeners all run on the same UI thread.
 * All helpers below therefore route through runSerializedUiOperation so that
 * component lookup, key injection and delayed waits never overlap.
 */

let _driver: Driver | null = null;
let _uiOperationQueue: Promise<void> = Promise.resolve();

// Remote control / remote key codes used to navigate the capability list.
export const KEY_LEFT: number = 2014;
export const KEY_RIGHT: number = 2015;
export const KEY_UP: number = 2012;
export const KEY_DOWN: number = 2013;
export const KEY_ENTER: number = 2049;
export const KEY_BACK: number = 2;
export const KEY_HOME: number = 3;
export const KEY_POWER: number = 26;

// Timeouts, expressed in milliseconds.
export const TIMEOUT_PAGE_RENDER: number = 1000;
export const TIMEOUT_MENU_LOAD: number = 1500;
export const TIMEOUT_FOCUS_CHANGE: number = 500;
export const TIMEOUT_INPUT_EVENT: number = 800;

// Delays between key or pointer operations.
export const DELAY_KEY_NAVIGATION: number = 60;
export const DELAY_TOUCH_EVENT: number = 100;
export const DELAY_AFTER_PAGE_OP: number = 400;

// Tolerances and stress configuration.
export const TOLERANCE_COMPONENT_COUNT: number = 3;
export const STABLE_ROUNDS: number = 2;
export const STRESS_ROUNDS_NAVIGATION: number = 20;
export const STRESS_ROUNDS_LIFECYCLE: number = 10;

// Capability menu titles. These mirror app.strarray.device_management_list.
export const MENU_TITLES: string[] = [
  'Battery statistics',
  'Brightness manager',
  'Power manager',
  'Settings',
  'System capability',
  'System parameter',
  'Battery info',
  'Device info',
  'Input consumer',
  'Mouse pointer',
  'Input event',
  'Input device',
  'Input key event'
];

/**
 * Serialize a UI action through the shared promise chain.
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

/**
 * Serialized delay so that delayMs never overlaps a UiTest lookup.
 */
export async function serializedDelay(driver: Driver, delayMs: number): Promise<void> {
  await runSerializedUiOperation(async () => {
    await driver.delayMs(delayMs);
  });
}

/**
 * Serialized key injection.
 */
export async function triggerSerializedKey(driver: Driver, key: number): Promise<void> {
  await runSerializedUiOperation(async () => {
    await driver.triggerKey(key);
  });
}

/**
 * Lazily create and reuse the global Driver instance.
 */
export function getDriver(): Driver {
  if (_driver === null) {
    _driver = Driver.create();
  }
  return _driver;
}

/**
 * Reset the operation queue. Only use when no UI operation is in flight.
 */
export function resetDriver(): void {
  _uiOperationQueue = Promise.resolve();
}

/**
 * Launch the DeviceManagement entry ability.
 */
export async function launchDeviceManagementApp(): Promise<void> {
  const delegator = abilityDelegatorRegistry.getAbilityDelegator();
  const args = abilityDelegatorRegistry.getArguments();
  const want: Want = {
    bundleName: args.bundleName,
    abilityName: 'EntryAbility'
  };
  hilog.info(DOMAIN, TAG, '%{public}s', 'launchDeviceManagementApp entry ability');
  await delegator.startAbility(want);
}

/**
 * Start the application with an explicit bundle and ability name.
 */
export async function startAbility(bundleName: string, abilityName: string): Promise<void> {
  const delegator = abilityDelegatorRegistry.getAbilityDelegator();
  const want: Want = {
    bundleName: bundleName,
    abilityName: abilityName
  };
  await delegator.startAbility(want);
}

/**
 * Return true when the capability menu List is present.
 */
export async function isMenuVisible(driver: Driver): Promise<boolean> {
  try {
    return await runSerializedUiOperation(async () => {
      const lists = await driver.findComponents(ON.type('List'));
      const visible = lists !== null && lists !== undefined && lists.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', 'isMenuVisible: ' + visible);
      return visible;
    });
  } catch (error) {
    hilog.error(DOMAIN, TAG, '%{public}s', 'isMenuVisible failed: ' + error);
    return false;
  }
}

/**
 * Wait until the capability menu is rendered.
 */
export async function waitForMenuStable(driver: Driver, maxWaitMs: number = TIMEOUT_MENU_LOAD): Promise<boolean> {
  const deadline = Date.now() + maxWaitMs;
  while (Date.now() < deadline) {
    if (await isMenuVisible(driver)) {
      return true;
    }
    await serializedDelay(driver, 100);
  }
  hilog.info(DOMAIN, TAG, '%{public}s', 'waitForMenuStable timeout, relaunching');
  await launchDeviceManagementApp();
  const secondDeadline = Date.now() + maxWaitMs;
  while (Date.now() < secondDeadline) {
    if (await isMenuVisible(driver)) {
      return true;
    }
    await serializedDelay(driver, 100);
  }
  return false;
}

/**
 * Open a capability page by scrolling the menu list until the title appears.
 */
export async function openCapability(driver: Driver, title: string): Promise<boolean> {
  try {
    return await runSerializedUiOperation(async () => {
      const lists = await driver.findComponents(ON.type('List'));
      if (lists === null || lists === undefined || lists.length === 0) {
        hilog.info(DOMAIN, TAG, '%{public}s', 'openCapability: no list found');
        return false;
      }
      const list = lists[0];
      const target = await list.scrollSearch(ON.text(title));
      if (target === null || target === undefined) {
        hilog.info(DOMAIN, TAG, '%{public}s', 'openCapability: title not found ' + title);
        return false;
      }
      await target.click();
      await driver.delayMs(DELAY_AFTER_PAGE_OP);
      hilog.info(DOMAIN, TAG, '%{public}s', 'openCapability: opened ' + title);
      return true;
    });
  } catch (error) {
    hilog.error(DOMAIN, TAG, '%{public}s', 'openCapability failed: ' + error);
    return false;
  }
}

/**
 * Press back until the capability menu is visible again.
 */
export async function backToMenu(driver: Driver, maxPress: number = 3): Promise<boolean> {
  for (let i = 0; i < maxPress; i++) {
    if (await isMenuVisible(driver)) {
      return true;
    }
    await triggerSerializedKey(driver, KEY_BACK);
    await serializedDelay(driver, DELAY_KEY_NAVIGATION);
  }
  return await isMenuVisible(driver);
}

/**
 * Count all components currently rendered.
 */
export async function componentCount(driver: Driver): Promise<number> {
  try {
    return await runSerializedUiOperation(async () => {
      const components = await driver.findComponents(ON.type('*'));
      const count = components ? components.length : 0;
      hilog.info(DOMAIN, TAG, '%{public}s', 'componentCount: ' + count);
      return count;
    });
  } catch (error) {
    hilog.error(DOMAIN, TAG, '%{public}s', 'componentCount failed: ' + error);
    return 0;
  }
}

/**
 * Count components of a concrete type.
 */
export async function countByType(driver: Driver, type: string): Promise<number> {
  try {
    return await runSerializedUiOperation(async () => {
      const components = await driver.findComponents(ON.type(type));
      return components ? components.length : 0;
    });
  } catch (error) {
    hilog.error(DOMAIN, TAG, '%{public}s', 'countByType failed: ' + error);
    return 0;
  }
}

/**
 * Check that a component with the given text exists.
 */
export async function checkTextContent(driver: Driver, expected: string): Promise<boolean> {
  try {
    return await runSerializedUiOperation(async () => {
      const texts = await driver.findComponents(ON.type('Text'));
      if (texts === null || texts === undefined || texts.length === 0) {
        return false;
      }
      for (const text of texts) {
        try {
          const content = await text.getText();
          if (content === expected) {
            return true;
          }
        } catch (error) {
          hilog.info(DOMAIN, TAG, '%{public}s', 'checkTextContent: skip unreadable text');
        }
      }
      return false;
    });
  } catch (error) {
    hilog.error(DOMAIN, TAG, '%{public}s', 'checkTextContent failed: ' + error);
    return false;
  }
}

/**
 * Check that a component with the given id exists.
 */
export async function checkComponentById(driver: Driver, id: string): Promise<boolean> {
  try {
    const components = await runSerializedUiOperation(async () => {
      return await driver.findComponents(ON.id(id));
    });
    const exists = components !== null && components !== undefined && components.length > 0;
    hilog.info(DOMAIN, TAG, '%{public}s', 'checkComponentById ' + id + ': ' + exists);
    return exists;
  } catch (error) {
    hilog.error(DOMAIN, TAG, '%{public}s', 'checkComponentById failed: ' + error);
    return false;
  }
}

/**
 * Return the index of the focused component, or -1 when nothing is focused.
 */
export async function getFocusIndex(driver: Driver): Promise<number> {
  try {
    return await runSerializedUiOperation(async () => {
      const components: Component[] = await driver.findComponents(ON.type('*'));
      if (components === null || components === undefined || components.length === 0) {
        return -1;
      }
      for (let i = 0; i < components.length; i++) {
        try {
          const focused = await components[i].isFocused();
          if (focused) {
            return i;
          }
        } catch (error) {
          hilog.info(DOMAIN, TAG, '%{public}s', 'getFocusIndex: component ' + i + ' not focusable');
        }
      }
      return -1;
    });
  } catch (error) {
    hilog.error(DOMAIN, TAG, '%{public}s', 'getFocusIndex failed: ' + error);
    return -1;
  }
}

/**
 * Wait until any component holds focus.
 */
export async function waitForFocus(driver: Driver, maxWaitMs: number = TIMEOUT_FOCUS_CHANGE): Promise<boolean> {
  const deadline = Date.now() + maxWaitMs;
  while (Date.now() < deadline) {
    if (await getFocusIndex(driver) >= 0) {
      return true;
    }
    await serializedDelay(driver, 80);
  }
  return false;
}

/**
 * Simulate a touch on the given screen coordinates.
 */
export async function simulateTouch(driver: Driver, x: number, y: number): Promise<void> {
  await runSerializedUiOperation(async () => {
    await driver.click(x, y);
    await driver.delayMs(DELAY_TOUCH_EVENT);
  });
}

/**
 * Trigger a key a number of times with a fixed delay.
 */
export async function pressAndWait(driver: Driver, key: number, times: number = 1,
  delayMs: number = DELAY_KEY_NAVIGATION): Promise<void> {
  await runSerializedUiOperation(async () => {
    for (let i = 0; i < times; i++) {
      await driver.triggerKey(key);
      await driver.delayMs(delayMs);
    }
  });
}

/**
 * Toggle a switch identified by id.
 */
export async function toggleSwitch(driver: Driver, id: string): Promise<boolean> {
  try {
    const toggle = await runSerializedUiOperation(async () => {
      return await driver.findComponent(ON.id(id));
    });
    if (toggle === null || toggle === undefined) {
      return false;
    }
    await runSerializedUiOperation(async () => {
      await toggle.click();
      await driver.delayMs(DELAY_AFTER_PAGE_OP);
    });
    return true;
  } catch (error) {
    hilog.error(DOMAIN, TAG, '%{public}s', 'toggleSwitch failed: ' + error);
    return false;
  }
}

/**
 * Scroll a component until the given text becomes visible.
 */
export async function scrollToText(driver: Driver, type: string, text: string): Promise<boolean> {
  try {
    return await runSerializedUiOperation(async () => {
      const containers = await driver.findComponents(ON.type(type));
      if (containers === null || containers === undefined || containers.length === 0) {
        return false;
      }
      const target = await containers[0].scrollSearch(ON.text(text, MatchPattern.CONTAINS));
      return target !== null && target !== undefined;
    });
  } catch (error) {
    hilog.error(DOMAIN, TAG, '%{public}s', 'scrollToText failed: ' + error);
    return false;
  }
}

/**
 * Verify that the number of components stays stable across rounds.
 */
export async function isComponentCountStable(driver: Driver, rounds: number = STABLE_ROUNDS): Promise<boolean> {
  let previous = -1;
  for (let i = 0; i < rounds; i++) {
    const current = await componentCount(driver);
    if (previous >= 0 && Math.abs(current - previous) > TOLERANCE_COMPONENT_COUNT) {
      return false;
    }
    previous = current;
    await serializedDelay(driver, 120);
  }
  return previous >= 0;
}

/**
 * Measure the elapsed time of an action in milliseconds.
 */
export async function measureActionDuration(action: () => Promise<void>): Promise<number> {
  const start = Date.now();
  await action();
  return Date.now() - start;
}

/**
 * Repeat an action a number of times, used by stress and stability suites.
 */
export async function repeatAction(action: (index: number) => Promise<void>,
  times: number = STRESS_ROUNDS_NAVIGATION): Promise<void> {
  for (let i = 0; i < times; i++) {
    await action(i);
  }
}

/**
 * Return a snapshot of all visible texts.
 */
export async function collectTexts(driver: Driver): Promise<string[]> {
  try {
    return await runSerializedUiOperation(async () => {
      const texts = await driver.findComponents(ON.type('Text'));
      const result: string[] = [];
      if (texts === null || texts === undefined) {
        return result;
      }
      for (const text of texts) {
        try {
          result.push(await text.getText());
        } catch (error) {
          hilog.info(DOMAIN, TAG, '%{public}s', 'collectTexts: skip unreadable text');
        }
      }
      return result;
    });
  } catch (error) {
    hilog.error(DOMAIN, TAG, '%{public}s', 'collectTexts failed: ' + error);
    return [];
  }
}

/**
 * Verify the menu contains every expected capability title.
 */
export async function verifyMenuTitles(driver: Driver): Promise<number> {
  const texts = await collectTexts(driver);
  let matched = 0;
  for (const title of MENU_TITLES) {
    if (texts.indexOf(title) >= 0) {
      matched++;
    }
  }
  hilog.info(DOMAIN, TAG, '%{public}s', 'verifyMenuTitles matched: ' + matched);
  return matched;
}

/**
 * Press the home key and wait for the system to settle.
 */
export async function pressHome(driver: Driver): Promise<void> {
  await triggerSerializedKey(driver, KEY_HOME);
  await serializedDelay(driver, DELAY_AFTER_PAGE_OP);
}

/**
 * Trigger a serialized enter key.
 */
export async function pressEnter(driver: Driver): Promise<void> {
  await triggerSerializedKey(driver, KEY_ENTER);
  await serializedDelay(driver, DELAY_KEY_NAVIGATION);
}

/**
 * Trigger a serialized back key.
 */
export async function pressBack(driver: Driver): Promise<void> {
  await triggerSerializedKey(driver, KEY_BACK);
  await serializedDelay(driver, DELAY_KEY_NAVIGATION);
}

/**
 * Convenience wrapper that opens, verifies then closes a capability page.
 */
export async function roundTripCapability(driver: Driver, title: string): Promise<boolean> {
  const opened = await openCapability(driver, title);
  if (!opened) {
    return false;
  }
  await serializedDelay(driver, DELAY_AFTER_PAGE_OP);
  const closed = await backToMenu(driver);
  return closed;
}
