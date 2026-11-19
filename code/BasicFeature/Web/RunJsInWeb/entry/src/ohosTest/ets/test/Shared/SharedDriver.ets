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

/**
 * Shared UI automation driver for the RunJsInWeb sample.
 *
 * The application under test is a WebView container that injects JavaScript
 * into a hosted block breaker game. The test harness therefore works on two
 * layers:
 *   1. UI layer - the buttons Start / L / R / Reset and the embedded Web view.
 *   2. Injection layer - javascript: URLs evaluated by the WebviewController.
 *
 * All UiTest calls are serialized because the UiTest server rejects overlapping
 * requests (findComponent / triggerKey / delayMs must not run concurrently).
 */

let _driver: Driver | null = null;
let _uiOperationQueue: Promise<void> = Promise.resolve();
let _queueLock: boolean = false;

// Remote control key codes used by the UI automation server.
export const KEY_LEFT: number = 2014;

export const KEY_RIGHT: number = 2015;

export const KEY_UP: number = 2012;

export const KEY_DOWN: number = 2013;

export const KEY_ENTER: number = 2049;

export const KEY_BACK: number = 2;

export const KEY_HOME: number = 3;

export const KEY_TAB: number = 4;

// Timeout budget for rendering / injection / focus operations.
// The hosted game is loaded from a remote url, therefore page load gets a
// larger budget than a purely local dialog would need.
export const TIMEOUT_WEB_RENDER: number = 5000;

export const TIMEOUT_PAGE_LOAD: number = 8000;

export const TIMEOUT_SCRIPT_INJECT: number = 1000;

export const TIMEOUT_FOCUS_CHANGE: number = 500;

export const TIMEOUT_DIALOG_RENDER: number = 1000;

// Delays inserted between UI actions to let the WebView process the payload.
export const DELAY_KEY_NAVIGATION: number = 50;

export const DELAY_TOUCH_EVENT: number = 100;

export const DELAY_AFTER_INJECT: number = 500;

export const DELAY_PAGE_SETTLE: number = 1000;

// Tolerances used by stability oriented suites. The WebView component count
// may drift by a few nodes while the remote page repaints.
export const TOLERANCE_COMPONENT_COUNT: number = 5;

export const TOLERANCE_FOCUS_CHANGE: number = 2;

export const STABLE_ROUNDS: number = 2;

export const STABLE_TOLERANCE: number = 5;

// Stress loop sizes.
export const STRESS_ROUNDS_NAVIGATION: number = 20;

export const STRESS_ROUNDS_LIFECYCLE: number = 10;

export const STRESS_ROUNDS_INJECTION: number = 30;

// Business constants mirrored from the application under test.
export const GAME_BUNDLE_NAME: string = 'com.samples.runjsinweb';

export const GAME_ABILITY_NAME: string = 'EntryAbility';

export const GAME_MODULE_NAME: string = 'entry';

export const GAME_URL: string = 'https://yangyunhe369.github.io/h5-game-blockBreaker/';

export const LABEL_START: string = 'Start';

export const LABEL_LEFT: string = 'L';

export const LABEL_RIGHT: string = 'R';

export const LABEL_RESET: string = 'Reset';

export const SCRIPT_PREFIX: string = 'javascript:';

export const REMOTE_PAGE_TAG: string = 'div';

// Log domain aligned with the application logger and the test logger.
const LOG_DOMAIN: number = 0xF811;

const LOG_TAG: string = 'RunJsInWebTest';

/**
 * Writes an informational message. All test logging goes through hilog, the
 * console object is deliberately not used anywhere in the test harness.
 */
export function logInfo(message: string): void {
  hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', message);
}

/**
 * Writes an error message through hilog.
 */
export function logError(message: string): void {
  hilog.error(LOG_DOMAIN, LOG_TAG, '%{public}s', message);
}

/**
 * Returns the process wide Driver instance. Lazy creation avoids touching the
 * UiTest server before the test ability has been started.
 */
export function getDriver(): Driver {
  if (_driver === null) {
    _driver = Driver.create();
  }
  return _driver;
}

/**
 * Resets the driver queue. Only used by suites that intentionally rebuild the
 * whole UI state between groups of cases.
 */
export function resetDriver(): void {
  _uiOperationQueue = Promise.resolve();
  _queueLock = false;
}

/**
 * Serializes a UI operation behind all previously scheduled operations.
 */
export async function runSerializedUiOperation<T>(action: () => Promise<T>): Promise<T> {
  const currentQueue: Promise<void> = _uiOperationQueue;
  const result: T = await new Promise<T>((resolve: (value: T) => void, reject: (reason: Error) => void) => {
    _uiOperationQueue = currentQueue.then(async () => {
      try {
        const actionResult: T = await action();
        resolve(actionResult);
      } catch (error) {
        const errorObject: Error = error instanceof Error ? error : new Error(String(error));
        reject(errorObject);
      }
    }).catch((error: Error) => {
      reject(error);
    });
  });
  return result;
}

/**
 * Serialized delay. UiTest refuses delayMs while another request is in flight,
 * so waits are pushed through the same queue.
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
 * Counts the components that belong to the page under test.
 *
 * ON.type('*') is tried first. Some builds of the UiTest server do not expand
 * the wildcard, in that case the count falls back to the sum of the concrete
 * component types that make up the sample page.
 */
export async function gameComponentCount(driver: Driver): Promise<number> {
  try {
    return await runSerializedUiOperation(async () => {
      const allComponents: Component[] = await driver.findComponents(ON.type('*')) ?? [];
      if (allComponents.length > 0) {
        logInfo(`gameComponentCount: wildcard found ${allComponents.length} components`);
        return allComponents.length;
      }

      const buttons: Component[] = await driver.findComponents(ON.type('Button')) ?? [];
      const texts: Component[] = await driver.findComponents(ON.type('Text')) ?? [];
      const webs: Component[] = await driver.findComponents(ON.type('Web')) ?? [];
      const rows: Component[] = await driver.findComponents(ON.type('Row')) ?? [];
      const columns: Component[] = await driver.findComponents(ON.type('Column')) ?? [];

      const fallbackCount: number = buttons.length + texts.length + webs.length + rows.length + columns.length;
      logInfo(`gameComponentCount: fallback found ${fallbackCount} components`);
      return fallbackCount;
    });
  } catch (error) {
    logError(`gameComponentCount failed: ${String(error)}`);
    return 0;
  }
}

/**
 * Checks whether a text node with the expected content is present.
 */
export async function checkTextContent(driver: Driver, expectedText: string): Promise<boolean> {
  try {
    return await runSerializedUiOperation(async () => {
      const texts: Component[] = await driver.findComponents(ON.type('Text')) ?? [];
      if (texts.length === 0) {
        return false;
      }
      for (let i = 0; i < texts.length; i++) {
        try {
          const content: string = await texts[i].getText();
          if (content === expectedText) {
            return true;
          }
        } catch (error) {
          // A single unreadable node must not abort the whole scan.
          logInfo(`checkTextContent: read failure at index ${i}`);
        }
      }
      return false;
    });
  } catch (error) {
    logError(`checkTextContent failed: ${String(error)}`);
    return false;
  }
}

/**
 * Checks whether the game page is on screen. The Start label is rendered by
 * the container and is therefore a stable signal that the page was laid out.
 */
export async function isGamePageVisible(driver: Driver): Promise<boolean> {
  try {
    return await runSerializedUiOperation(async () => {
      // Buttons expose their label through getText() on every device profile,
      // while the label is not always mirrored by a Text component. Check the
      // buttons first and keep the text scan as a fallback.
      const buttons: Component[] = await driver.findComponents(ON.type('Button')) ?? [];
      for (let i = 0; i < buttons.length; i++) {
        try {
          const label: string = await buttons[i].getText();
          if (label === LABEL_START || label === LABEL_LEFT || label === LABEL_RIGHT || label === LABEL_RESET) {
            return true;
          }
        } catch (error) {
          logInfo(`isGamePageVisible: button read failure at index ${i}`);
        }
      }

      const texts: Component[] = await driver.findComponents(ON.type('Text')) ?? [];
      for (let i = 0; i < texts.length; i++) {
        try {
          const content: string = await texts[i].getText();
          if (content === LABEL_START || content === LABEL_LEFT || content === LABEL_RIGHT ||
            content === LABEL_RESET) {
            return true;
          }
        } catch (error) {
          logInfo(`isGamePageVisible: text read failure at index ${i}`);
        }
      }
      return false;
    });
  } catch (error) {
    logError(`isGamePageVisible failed: ${String(error)}`);
    return false;
  }
}

/**
 * Waits until the game page has rendered. When the deadline expires the
 * ability is started once and the same rendering condition is awaited again.
 */
export async function waitForGamePageStable(driver: Driver, maxWaitMs: number = TIMEOUT_WEB_RENDER): Promise<boolean> {
  try {
    logInfo(`waitForGamePageStable: waiting up to ${maxWaitMs} ms`);
    const deadline: number = Date.now() + maxWaitMs;
    while (Date.now() < deadline) {
      if (await isGamePageVisible(driver)) {
        logInfo('waitForGamePageStable: page render observed');
        return true;
      }
      await serializedDelay(driver, 200);
    }

    logInfo('waitForGamePageStable: render timeout, relaunching ability');
    await launchGameApp();
    const secondDeadline: number = Date.now() + maxWaitMs;
    while (Date.now() < secondDeadline) {
      if (await isGamePageVisible(driver)) {
        logInfo('waitForGamePageStable: page render observed after relaunch');
        return true;
      }
      await serializedDelay(driver, 200);
    }
    logError('waitForGamePageStable: page still not rendered');
    return false;
  } catch (error) {
    logError(`waitForGamePageStable failed: ${String(error)}`);
    return false;
  }
}

/**
 * Returns all components of the requested type, never null.
 */
export async function findComponentsByType(driver: Driver, type: string): Promise<Component[]> {
  try {
    return await runSerializedUiOperation(async () => {
      const components: Component[] = await driver.findComponents(ON.type(type)) ?? [];
      return components;
    });
  } catch (error) {
    logError(`findComponentsByType failed: ${String(error)}`);
    return [];
  }
}

/**
 * Checks that at least one component of the requested type exists.
 */
export async function checkComponentExists(driver: Driver, type: string): Promise<boolean> {
  const components: Component[] = await findComponentsByType(driver, type);
  const exists: boolean = components.length > 0;
  logInfo(`checkComponentExists: type ${type} exists ${exists}`);
  return exists;
}

/**
 * Sends a tap to the requested coordinates and waits for the event to settle.
 */
export async function simulateTouch(driver: Driver, x: number, y: number): Promise<void> {
  await runSerializedUiOperation(async () => {
    await driver.click(x, y);
    await driver.delayMs(DELAY_TOUCH_EVENT);
  });
}

/**
 * Starts the application under test through the ability delegator.
 */
export async function launchGameApp(): Promise<void> {
  const delegator = abilityDelegatorRegistry.getAbilityDelegator();
  const args = abilityDelegatorRegistry.getArguments();
  const bundleName: string = args.bundleName ?? GAME_BUNDLE_NAME;
  const want: Want = {
    bundleName: bundleName,
    abilityName: GAME_ABILITY_NAME
  };
  await delegator.startAbility(want);
}

/**
 * Makes sure the game page is displayed before a suite starts.
 */
export async function triggerGamePage(driver: Driver): Promise<void> {
  await serializedDelay(driver, DELAY_PAGE_SETTLE);
  if (!(await isGamePageVisible(driver))) {
    await launchGameApp();
  }
  await serializedDelay(driver, DELAY_PAGE_SETTLE);
  logInfo('triggerGamePage: game page triggered');
}

/**
 * Triggers a key a given number of times with a fixed delay in between.
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
 * Returns the index of the focused component, or -1 when no component owns
 * the focus. The wildcard list is scanned with isFocused() because
 * ON.focused(true) is not reliable on every device profile.
 */
export async function getCurrentFocusIndex(driver: Driver): Promise<number> {
  try {
    return await runSerializedUiOperation(async () => {
      const components: Component[] = await driver.findComponents(ON.type('*')) ?? [];
      if (components.length === 0) {
        return -1;
      }
      for (let i = 0; i < components.length; i++) {
        try {
          if (await components[i].isFocused()) {
            logInfo(`getCurrentFocusIndex: focus at index ${i}`);
            return i;
          }
        } catch (error) {
          logInfo(`getCurrentFocusIndex: focus query failed at index ${i}`);
        }
      }
      return -1;
    });
  } catch (error) {
    logError(`getCurrentFocusIndex failed: ${String(error)}`);
    return -1;
  }
}

/**
 * Checks that some component owns the focus.
 */
export async function checkFocusState(driver: Driver, expectedFocusedIndex: number): Promise<boolean> {
  const index: number = await getCurrentFocusIndex(driver);
  if (expectedFocusedIndex === -1) {
    return index >= 0;
  }
  return index === expectedFocusedIndex;
}

// Bounds of a component, mirrored from the UiTest Rect so that the test code
// does not depend on the concrete Rect implementation.
export interface BoundsInfo {
  left: number;
  top: number;
  right: number;
  bottom: number;
  width: number;
  height: number;
}

/**
 * Reads the bounds of a component, returning a neutral box when the query
 * fails so that geometry assertions stay deterministic.
 */
export async function getComponentBounds(component: Component): Promise<BoundsInfo> {
  try {
    const rect = await component.getBounds();
    const bounds: BoundsInfo = {
      left: rect.left,
      top: rect.top,
      right: rect.right,
      bottom: rect.bottom,
      width: rect.right - rect.left,
      height: rect.bottom - rect.top
    };
    return bounds;
  } catch (error) {
    logError(`getComponentBounds failed: ${String(error)}`);
    const empty: BoundsInfo = { left: 0, top: 0, right: 0, bottom: 0, width: 0, height: 0 };
    return empty;
  }
}

/**
 * Finds the first clickable component whose text equals the label.
 */
export async function findButtonByLabel(driver: Driver, label: string): Promise<Component | null> {
  try {
    return await runSerializedUiOperation(async () => {
      const buttons: Component[] = await driver.findComponents(ON.type('Button')) ?? [];
      for (let i = 0; i < buttons.length; i++) {
        try {
          const text: string = await buttons[i].getText();
          if (text === label) {
            return buttons[i];
          }
        } catch (error) {
          logInfo(`findButtonByLabel: read failure for ${label} at index ${i}`);
        }
      }
      return null;
    });
  } catch (error) {
    logError(`findButtonByLabel failed: ${String(error)}`);
    return null;
  }
}

/**
 * Clicks the button with the requested label. Returns false when the label is
 * not on screen.
 */
export async function clickButtonByLabel(driver: Driver, label: string): Promise<boolean> {
  const button: Component | null = await findButtonByLabel(driver, label);
  if (button === null) {
    logError(`clickButtonByLabel: label ${label} not found`);
    return false;
  }
  await runSerializedUiOperation(async () => {
    await button.click();
    await driver.delayMs(DELAY_AFTER_INJECT);
  });
  return true;
}

/**
 * Collects the labels of all buttons currently rendered.
 */
export async function getButtonLabels(driver: Driver): Promise<string[]> {
  try {
    return await runSerializedUiOperation(async () => {
      const buttons: Component[] = await driver.findComponents(ON.type('Button')) ?? [];
      const labels: string[] = [];
      for (let i = 0; i < buttons.length; i++) {
        try {
          const text: string = await buttons[i].getText();
          labels.push(text);
        } catch (error) {
          logInfo(`getButtonLabels: read failure at index ${i}`);
        }
      }
      return labels;
    });
  } catch (error) {
    logError(`getButtonLabels failed: ${String(error)}`);
    return [];
  }
}

/**
 * Counts the buttons that carry the requested label.
 */
export async function countButtonsByLabel(driver: Driver, label: string): Promise<number> {
  const labels: string[] = await getButtonLabels(driver);
  let count: number = 0;
  for (let i = 0; i < labels.length; i++) {
    if (labels[i] === label) {
      count++;
    }
  }
  return count;
}

/**
 * Verifies that all four control buttons are present.
 */
export async function hasAllControls(driver: Driver): Promise<boolean> {
  const labels: string[] = await getButtonLabels(driver);
  return labels.includes(LABEL_START) && labels.includes(LABEL_LEFT) &&
    labels.includes(LABEL_RIGHT) && labels.includes(LABEL_RESET);
}

/**
 * Verifies the three column layout by comparing the x coordinates of the
 * left and right control buttons.
 */
export async function isHorizontalControlLayout(driver: Driver): Promise<boolean> {
  const leftButton: Component | null = await findButtonByLabel(driver, LABEL_LEFT);
  const rightButton: Component | null = await findButtonByLabel(driver, LABEL_RIGHT);
  if (leftButton === null || rightButton === null) {
    return false;
  }
  const leftBounds: BoundsInfo = await getComponentBounds(leftButton);
  const rightBounds: BoundsInfo = await getComponentBounds(rightButton);
  logInfo(`isHorizontalControlLayout: left=${leftBounds.left} right=${rightBounds.left}`);
  return rightBounds.left > leftBounds.left;
}

/**
 * Polls a predicate until it returns true or the timeout expires.
 */
export async function waitUntil(driver: Driver, predicate: () => Promise<boolean>,
  timeoutMs: number = TIMEOUT_SCRIPT_INJECT, intervalMs: number = 100): Promise<boolean> {
  const deadline: number = Date.now() + timeoutMs;
  while (Date.now() < deadline) {
    if (await predicate()) {
      return true;
    }
    await serializedDelay(driver, intervalMs);
  }
  return false;
}

/**
 * Measures the wall clock latency of a UI action.
 */
export async function measureLatency(action: () => Promise<void>): Promise<number> {
  const start: number = Date.now();
  await action();
  return Date.now() - start;
}

/**
 * Summary of the rendered page, used by rendering and layout suites.
 */
export interface PageSummary {
  buttonCount: number;
  textCount: number;
  webCount: number;
  componentCount: number;
  controlLabels: string[];
}

/**
 * Builds a summary of the rendered page.
 */
export async function summarizePage(driver: Driver): Promise<PageSummary> {
  const buttons: Component[] = await findComponentsByType(driver, 'Button');
  const texts: Component[] = await findComponentsByType(driver, 'Text');
  const webs: Component[] = await findComponentsByType(driver, 'Web');
  const summary: PageSummary = {
    buttonCount: buttons.length,
    textCount: texts.length,
    webCount: webs.length,
    componentCount: await gameComponentCount(driver),
    controlLabels: await getButtonLabels(driver)
  };
  return summary;
}

/**
 * Reads the text of a component and returns an empty string when the read
 * fails.
 */
export async function safeGetText(component: Component): Promise<string> {
  try {
    return await component.getText();
  } catch (error) {
    logInfo(`safeGetText failed: ${String(error)}`);
    return '';
  }
}

/**
 * Checks the focus flag of a single component.
 */
export async function isComponentFocused(component: Component): Promise<boolean> {
  try {
    return await component.isFocused();
  } catch (error) {
    logInfo(`isComponentFocused failed: ${String(error)}`);
    return false;
  }
}
