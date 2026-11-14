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
import abilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import TestLogger from './TestLogger';

/* ------------------------------------------------------------------ */
/* Constants shared by every browser suite                              */
/* ------------------------------------------------------------------ */

export const TEST_TAG: string = 'BrowserKit';

/** Component ids declared in entry/src/main/ets/common. */
export const ID_INPUT_URL: string = 'inputUrl';
export const ID_NAV_BACK: string = 'navigationButton0';
export const ID_NAV_FORWARD: string = 'navigationButton1';
export const ID_NAV_REFRESH: string = 'navigationButton2';
export const ID_NAV_HOME: string = 'navigationButton3';
export const ID_ACTION_SUBMIT: string = 'actionButton0';
export const ID_ACTION_ADD: string = 'actionButton1';
export const ID_CANCEL_TAB: string = 'cancelBtn';

/** Key codes of a standard OpenHarmony remote control / keyboard. */
export const KEY_BACK: number = 2;
export const KEY_HOME: number = 3;
export const KEY_ENTER: number = 2054;
export const KEY_DPAD_UP: number = 2012;
export const KEY_DPAD_DOWN: number = 2013;
export const KEY_DPAD_LEFT: number = 2014;
export const KEY_DPAD_RIGHT: number = 2015;

/** Timing budget of the Web engine: page load is much slower than a dialog. */
export const TIMEOUT_APP_LAUNCH: number = 3000;
export const TIMEOUT_PAGE_LOAD: number = 5000;
export const TIMEOUT_TAB_SWITCH: number = 1500;
export const TIMEOUT_COMPONENT: number = 2000;
export const TIMEOUT_FOCUS_CHANGE: number = 800;
export const DELAY_KEY_NAVIGATION: number = 100;
export const DELAY_TOUCH_EVENT: number = 150;
export const DELAY_TAB_OPERATION: number = 300;

/** Tolerances absorb render jitter without hiding real regressions. */
export const TOLERANCE_COMPONENT_COUNT: number = 3;
export const TOLERANCE_FOCUS_CHANGE: number = 2;
export const TOLERANCE_PROGRESS: number = 5;
export const STABLE_ROUNDS: number = 1;
export const STABLE_TOLERANCE: number = 3;

/** Business limits mirrored from model/Browser.ets. */
export const MAX_TAB_COUNT: number = 10;
export const MIN_TAB_COUNT: number = 1;
export const URL_SCHEME: string = 'https://';
export const PAD_HOME_PAGE: string = 'pad.html';
export const PHONE_HOME_PAGE: string = 'phone.html';
export const SEARCH_ENGINE: string = 'https://www.bing.com/search?q=';

/** Explicit capacity failure message used by the model. */
export const TAB_LIMIT_MESSAGE: string = '页签数量已满';

/* ------------------------------------------------------------------ */
/* Driver plumbing                                                     */
/* ------------------------------------------------------------------ */

let _driver: Driver | null = null;
let _operationQueue: Promise<void> = Promise.resolve();
let _serializedRunning: boolean = false;

/**
 * Upper bound of a single UiTest call.
 *
 * A case that hits the hypium budget is abandoned but its pending UiTest call
 * keeps occupying the serialization chain. Without a bound the chain would stay
 * occupied forever and the next `beforeAll` (which queries the UI) would hang,
 * stalling the whole run. Timing the operation out keeps the queue moving.
 */
const TIMEOUT_UI_OPERATION: number = 12000;

/** Lazily created UiTest driver, shared by all suites of this module. */
export function getDriver(): Driver {
  if (_driver === null) {
    _driver = Driver.create();
  }
  return _driver;
}

/** Wraps a UiTest promise so a stuck operation can never block the queue. */
function settleWithTimeout<T>(operation: Promise<T>): Promise<T> {
  return new Promise<T>((resolve: (value: T) => void, reject: (reason: Error) => void) => {
    let settled: boolean = false;
    const timer: number = setTimeout(() => {
      if (!settled) {
        settled = true;
        reject(new Error(`UiTest operation timed out after ${TIMEOUT_UI_OPERATION} ms`));
      }
    }, TIMEOUT_UI_OPERATION);
    operation.then((value: T) => {
      if (!settled) {
        settled = true;
        clearTimeout(timer);
        resolve(value);
      }
    }).catch((error: Error) => {
      if (!settled) {
        settled = true;
        clearTimeout(timer);
        reject(error);
      }
    });
  });
}

/**
 * Serializes every UiTest call.
 *
 * UiTest does not allow two operations (findComponents, triggerKey, delayMs)
 * to overlap. Chaining them on a single promise keeps suites deterministic
 * when several describe blocks run in the same process.
 *
 * The helper is reentrant: when it is called again from inside a running
 * action (for example a case that wraps `serializedDelay` in its own
 * `runSerialized` block), the inner action is executed directly. Queueing it
 * would make the queue wait for itself, deadlock the whole chain and make all
 * following UI cases time out.
 */
export async function runSerialized<T>(action: () => Promise<T>): Promise<T> {
  if (_serializedRunning) {
    return await settleWithTimeout(action());
  }
  const previous: Promise<void> = _operationQueue;
  let resolveResult: (value: T) => void = () => {};
  let rejectResult: (reason: Error) => void = () => {};
  const result: Promise<T> = new Promise<T>((resolve, reject) => {
    resolveResult = resolve;
    rejectResult = reject;
  });
  _operationQueue = previous.then(async () => {
    _serializedRunning = true;
    try {
      resolveResult(await settleWithTimeout(action()));
    } catch (error) {
      const wrapped: Error = error instanceof Error ? error : new Error(String(error));
      rejectResult(wrapped);
    } finally {
      _serializedRunning = false;
    }
  }).catch((error: Error) => {
    rejectResult(error);
  });
  return result;
}

/** Resets the serialization chain; call only when no UI call is in flight. */
export function resetOperationQueue(): void {
  _serializedRunning = false;
  _operationQueue = Promise.resolve();
}

let _appLaunched: boolean = false;

/**
 * Brings the sample under test to the foreground.
 *
 * Every suite calls this from its `beforeAll`, but relaunching the sample over
 * and over churns the ability stack of a long run. When the sample window is
 * already visible the call is a no-op; otherwise the ability is (re)started.
 *
 * Both the launch request and the settle period are bounded: a suite must never
 * block its `beforeAll` because the ability manager or the UI is unresponsive.
 */
export async function startBrowserApp(): Promise<void> {
  const driver: Driver = getDriver();
  try {
    if (_appLaunched && await componentByIdExists(driver, ID_INPUT_URL)) {
      TestLogger.info(TEST_TAG, 'browser sample already visible, reusing it');
      return;
    }
  } catch (error) {
    TestLogger.warn(TEST_TAG, `browser sample probe failed: ${JSON.stringify(error)}`);
  }
  const delegator = abilityDelegatorRegistry.getAbilityDelegator();
  const args = abilityDelegatorRegistry.getArguments();
  const want: Want = {
    bundleName: args.bundleName,
    abilityName: 'MainAbility'
  };
  TestLogger.info(TEST_TAG, 'starting MainAbility of the browser sample');
  _appLaunched = true;
  try {
    await settleWithTimeout(delegator.startAbility(want));
  } catch (error) {
    TestLogger.warn(TEST_TAG, `startAbility did not complete: ${JSON.stringify(error)}`);
  }
  await new Promise<void>((resolve) => setTimeout(() => resolve(), TIMEOUT_APP_LAUNCH));
}

/* ------------------------------------------------------------------ */
/* Low level UI helpers                                               */
/* ------------------------------------------------------------------ */

export async function serializedDelay(driver: Driver, delayMs: number): Promise<void> {
  await runSerialized<void>(async () => {
    await driver.delayMs(delayMs);
  });
}

export async function componentByIdExists(driver: Driver, id: string): Promise<boolean> {
  return await runSerialized<boolean>(async () => {
    try {
      const components: Component[] = await driver.findComponents(ON.id(id)) ?? [];
      return components.length > 0;
    } catch (error) {
      TestLogger.error(TEST_TAG, `componentByIdExists(${id}) error: ${error}`);
      return false;
    }
  });
}

export async function countById(driver: Driver, id: string): Promise<number> {
  return await runSerialized<number>(async () => {
    try {
      const components: Component[] = await driver.findComponents(ON.id(id)) ?? [];
      return components.length;
    } catch (error) {
      TestLogger.error(TEST_TAG, `countById(${id}) error: ${error}`);
      return 0;
    }
  });
}

export async function countByType(driver: Driver, type: string): Promise<number> {
  return await runSerialized<number>(async () => {
    try {
      const components: Component[] = await driver.findComponents(ON.type(type)) ?? [];
      return components.length;
    } catch (error) {
      TestLogger.error(TEST_TAG, `countByType(${type}) error: ${error}`);
      return 0;
    }
  });
}

export async function textById(driver: Driver, id: string): Promise<string> {
  return await runSerialized<string>(async () => {
    try {
      const component: Component = await driver.findComponent(ON.id(id));
      if (component === null || component === undefined) {
        return '';
      }
      const value: string = await component.getText();
      return value ?? '';
    } catch (error) {
      TestLogger.error(TEST_TAG, `textById(${id}) error: ${error}`);
      return '';
    }
  });
}

export async function clickById(driver: Driver, id: string): Promise<boolean> {
  return await runSerialized<boolean>(async () => {
    try {
      const component: Component = await driver.findComponent(ON.id(id));
      if (component === null || component === undefined) {
        TestLogger.warn(TEST_TAG, `clickById(${id}) component not found`);
        return false;
      }
      await component.click();
      await driver.delayMs(DELAY_TOUCH_EVENT);
      return true;
    } catch (error) {
      TestLogger.error(TEST_TAG, `clickById(${id}) error: ${error}`);
      return false;
    }
  });
}

export async function inputById(driver: Driver, id: string, text: string): Promise<boolean> {
  return await runSerialized<boolean>(async () => {
    try {
      const component: Component = await driver.findComponent(ON.id(id));
      if (component === null || component === undefined) {
        TestLogger.warn(TEST_TAG, `inputById(${id}) component not found`);
        return false;
      }
      await component.clearText();
      await component.inputText(text);
      await driver.delayMs(DELAY_KEY_NAVIGATION);
      return true;
    } catch (error) {
      TestLogger.error(TEST_TAG, `inputById(${id}) error: ${error}`);
      return false;
    }
  });
}

export async function pressKey(driver: Driver, key: number, times: number = 1,
  delayMs: number = DELAY_KEY_NAVIGATION): Promise<void> {
  await runSerialized<void>(async () => {
    for (let index = 0; index < times; index++) {
      await driver.triggerKey(key);
      await driver.delayMs(delayMs);
    }
  });
}

export async function swipeUp(driver: Driver, fromX: number, fromY: number,
  toX: number, toY: number): Promise<void> {
  await runSerialized<void>(async () => {
    await driver.swipe(fromX, fromY, toX, toY);
    await driver.delayMs(DELAY_TOUCH_EVENT);
  });
}

export async function tapAt(driver: Driver, x: number, y: number): Promise<void> {
  await runSerialized<void>(async () => {
    await driver.click(x, y);
    await driver.delayMs(DELAY_TOUCH_EVENT);
  });
}

/** Polls a predicate until it returns true or the timeout expires. */
export async function waitFor(driver: Driver, predicate: () => Promise<boolean>,
  timeoutMs: number = TIMEOUT_COMPONENT, intervalMs: number = 100): Promise<boolean> {
  const deadline: number = Date.now() + timeoutMs;
  while (Date.now() < deadline) {
    if (await predicate()) {
      return true;
    }
    await serializedDelay(driver, intervalMs);
  }
  return false;
}

export async function waitForId(driver: Driver, id: string,
  timeoutMs: number = TIMEOUT_COMPONENT): Promise<boolean> {
  return await waitFor(driver, async () => await componentByIdExists(driver, id), timeoutMs);
}

export async function waitForCount(driver: Driver, id: string, expected: number,
  timeoutMs: number = TIMEOUT_COMPONENT): Promise<boolean> {
  return await waitFor(driver, async () => {
    const actual: number = await countById(driver, id);
    return actual === expected;
  }, timeoutMs);
}

export async function hasText(driver: Driver, expected: string): Promise<boolean> {
  return await runSerialized<boolean>(async () => {
    try {
      const texts: Component[] = await driver.findComponents(ON.type('Text')) ?? [];
      for (let index = 0; index < texts.length; index++) {
        try {
          const content: string = await texts[index].getText();
          if (content === expected) {
            return true;
          }
        } catch (error) {
          // A single unmaterialized node must not abort the whole scan.
        }
      }
      return false;
    } catch (error) {
      TestLogger.error(TEST_TAG, `hasText(${expected}) error: ${error}`);
      return false;
    }
  });
}

/* ------------------------------------------------------------------ */
/* Pure business helpers (mirror of model/Browser.ets behaviour)       */
/* ------------------------------------------------------------------ */

/** Browser.loadUrl always prefixes the raw address with https://. */
export function normalizeUrl(address: string): string {
  if (address === null || address === undefined || address.length === 0) {
    return URL_SCHEME;
  }
  if (address.startsWith('http://') || address.startsWith('https://') ||
    address.startsWith('file://') || address.startsWith('about:')) {
    return address;
  }
  return URL_SCHEME + address;
}

/** Lightweight address validation used by the title bar before loading. */
export function isValidAddress(address: string): boolean {
  if (address === null || address === undefined) {
    return false;
  }
  const trimmed: string = address.trim();
  if (trimmed.length === 0 || trimmed.length > 2048) {
    return false;
  }
  // The sanitizer strips blanks before validation; a raw leading or trailing
  // blank therefore means the caller skipped sanitizing and is rejected.
  if (trimmed !== address) {
    return false;
  }
  if (trimmed.indexOf(' ') >= 0) {
    return false;
  }
  const host: string = trimmed.replace('https://', '').replace('http://', '');
  const dotIndex: number = host.indexOf('.');
  return dotIndex > 0 && dotIndex < host.length - 1;
}

export function isExternalUrl(url: string): boolean {
  if (url === null || url === undefined || !url.startsWith('http')) {
    return false;
  }
  // A bare scheme ("https://") has no host and is not a real external target.
  const rest: string = url.replace('https://', '').replace('http://', '');
  return rest.length > 0;
}

/** addTab refuses to grow beyond ten tabs. */
export function tabCapacityReached(tabCount: number): boolean {
  return tabCount > MAX_TAB_COUNT;
}

/** Index of the newly appended tab. */
export function nextTabIndex(tabCount: number): number {
  return tabCount;
}

/** tabArrayIndex bookkeeping of Browser.deleteTab. */
export function resolveTabIndexAfterDelete(currentIndex: number, removedIndex: number,
  remainingCount: number): number {
  let result: number = currentIndex;
  if (result > removedIndex || result === remainingCount) {
    result -= 1;
  }
  if (result < 0) {
    result = 0;
  }
  return result;
}

/** Re-numbers the keys of the tabs that follow the deleted one. */
export function rebaseTabKeys(keys: number[], removedIndex: number): number[] {
  const result: number[] = [];
  for (let index = 0; index < keys.length; index++) {
    if (index === removedIndex) {
      continue;
    }
    result.push(index < removedIndex ? keys[index] : keys[index] - 1);
  }
  return result;
}

export function encodeSearchWord(word: string): string {
  return encodeURI(word);
}

export function buildSearchUrl(word: string): string {
  return SEARCH_ENGINE + encodeSearchWord(word);
}

/** Progress bar is hidden only when a load reached 100 percent. */
export function progressVisibleAfter(progress: number): boolean {
  return progress !== 100;
}

export function progressResetAfterComplete(progress: number): number {
  return progress === 100 ? 0 : progress;
}

/** Index.ets treats every non default device as a phone layout. */
export function deviceIsPhone(deviceType: string): boolean {
  return deviceType !== 'default';
}

/** onBackPress consumes the event while a page can go backward. */
export function backPressConsumes(accessBackward: boolean, loading: boolean): boolean {
  return accessBackward || loading;
}

/** Pushes a url onto a bounded history stack. */
export function pushHistory(stack: string[], url: string, limit: number = 50): string[] {
  const result: string[] = stack.slice(0);
  if (result.length > 0 && result[result.length - 1] === url) {
    return result;
  }
  result.push(url);
  while (result.length > limit) {
    result.shift();
  }
  return result;
}

export function sanitizeInput(value: string): string {
  if (value === null || value === undefined) {
    return '';
  }
  return value.replace('\n', '').trim();
}

export function summariseTags(items: string[]): string {
  return items.join('|');
}
