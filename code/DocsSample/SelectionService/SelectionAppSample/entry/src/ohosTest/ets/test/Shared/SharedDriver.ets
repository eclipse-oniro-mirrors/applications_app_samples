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
import window from '@ohos.window';
import hilog from '@ohos.hilog';
import { yieldToEventLoop } from './TestScheduler';

let _driver: Driver | null = null;
let _uiOperationQueue: Promise<void> = Promise.resolve();

export const KEY_LEFT: number = 2014;

export const KEY_RIGHT: number = 2015;

export const KEY_UP: number = 2012;

export const KEY_DOWN: number = 2013;

export const KEY_ENTER: number = 2049;

export const KEY_BACK: number = 2;

export const KEY_HOME: number = 3;

export const TIMEOUT_DIALOG_RENDER: number = 1000;

export const TIMEOUT_PANEL_OPERATION: number = 2000;

export const TIMEOUT_SESSION_CREATE: number = 1000;

export const TIMEOUT_FOCUS_CHANGE: number = 500;

export const DELAY_KEY_NAVIGATION: number = 50;

export const DELAY_TOUCH_EVENT: number = 100;

export const DELAY_AFTER_PANEL_OPERATION: number = 500;

export const TOLERANCE_COMPONENT_COUNT: number = 3;

export const TOLERANCE_FOCUS_CHANGE: number = 2;

export const STABLE_ROUNDS: number = 1;

export const STABLE_TOLERANCE: number = 3;

export const STRESS_ROUNDS_NAVIGATION: number = 20;

export const STRESS_ROUNDS_LIFECYCLE: number = 10;

/** Serializes UI operations through a promise queue.
 *  The device UI driver requires sequential operations to avoid focus races.
 *  Route test UI operations through this function for deterministic execution.
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

/** Queues delays with other UiTest operations.
 *  UiTest must not enter delayMs while findComponents or triggerKey is running.
 */
export async function serializedDelay(driver: Driver, delayMs: number): Promise<void> {
  await runSerializedUiOperation(async () => {
    await driver.delayMs(delayMs);
  });
}

/** Queues key events through runSerializedUiOperation.
 *  Serial execution preserves key order across test cases.
 */
export async function triggerSerializedKey(driver: Driver, key: number): Promise<void> {
  await runSerializedUiOperation(async () => {
    await driver.triggerKey(key);
  });
}

/** Returns the shared UI automation driver.
 *  Creates the driver lazily after the test environment is ready.
 */
export function getDriver(): Driver {
  if (_driver === null) {
    _driver = Driver.create();
  }
  return _driver;
}

/** Resets the driver queue only when no UI operation is in progress.
 *  Resetting an active queue allows later operations to overlap pending work.
 *  Reserve this method for controlled scenarios, not routine suite setup.
 */
export async function resetDriver(): Promise<void> {
  await _uiOperationQueue;
  _driver = null;
}

/** Counts dialog components using the available lookup strategies.
 *  Starts with all component types before checking common component types.
 */
export async function selectionComponentCount(driver: Driver): Promise<number> {
  try {
    return await runSerializedUiOperation(async () => {
      const allComponents = await driver.findComponents(ON.type('*'));
      const count = allComponents ? allComponents.length : 0;

      hilog.info(0x0000, 'testTag', '%{public}s', `selectionComponentCount:`);
      hilog.info(0x0000, 'testTag', '%{public}s', `  - Found ${count} components using ON.type(\"*\")`);

      if (count === 0) {
        hilog.info(0x0000, 'testTag', '%{public}s', `  - Trying alternative component search strategies...`);

        const textComponents = await driver.findComponents(ON.type('Text'));
        const imageComponents = await driver.findComponents(ON.type('Image'));
        const buttonComponents = await driver.findComponents(ON.type('Button'));

        hilog.info(0x0000, 'testTag', '%{public}s', `  - Text components: ${textComponents ? textComponents.length : 0}`);
        hilog.info(0x0000, 'testTag', '%{public}s', `  - Image components: ${imageComponents ? imageComponents.length : 0}`);
        hilog.info(0x0000, 'testTag', '%{public}s', `  - Button components: ${buttonComponents ? buttonComponents.length : 0}`);

        const maxCount =
          Math.max(textComponents ? textComponents.length : 0, imageComponents ? imageComponents.length : 0,
            buttonComponents ? buttonComponents.length : 0);

        if (maxCount > 0) {
          hilog.info(0x0000, 'testTag', '%{public}s', `  - Using alternative count: ${maxCount}`);
          return maxCount;
        }
      }

      return count;
    });
  } catch (error) {
    hilog.error(0x0000, 'testTag', '%{public}s', `selectionComponentCount error: ${error}`);
    return 0;
  }
}

/** Checks focus existence or the expected component index.
 *  The UiTest component order can change as the device renders the UI.
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
              } catch (e) {
              }
            }
          }
          hilog.info(0x0000, 'testTag', '%{public}s', `checkFocusState: Focus existence check - hasFocus: ${hasFocus} attempt: ${attempt}`);
          return hasFocus;
        }

        if (allComponents.length === 0 || expectedFocusedIndex >= allComponents.length) {
          hilog.info(0x0000, 'testTag', '%{public}s', `checkFocusState: Invalid component count or index, attempt: ${attempt}`);
          return false;
        }

        try {
          const targetComponent = allComponents[expectedFocusedIndex];
          const isFocused = await targetComponent.isFocused();
          hilog.info(0x0000, 'testTag', '%{public}s', `checkFocusState: Component at index ${expectedFocusedIndex} isFocused: ${isFocused} attempt: ${attempt}`);
          return isFocused;
        } catch (e) {
          hilog.info(0x0000, 'testTag', '%{public}s', `checkFocusState: Error checking focus for component ${expectedFocusedIndex} attempt: ${attempt}`);
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

/** Detects the selection app using its distinctive dialog text.
 *  Focus and component count alone do not reliably identify the dialog.
 */
export async function isSelectionAppVisible(driver: Driver): Promise<boolean> {
  try {
    return await runSerializedUiOperation(async () => {
      const texts = await driver.findComponents(ON.type('Text')) ?? [];
      if (texts.length === 0) {
        return false;
      }
      for (const text of texts) {
        try {
          const content = await text.getText();
          if (content === 'Hello World' || content === 'Welcome' || content === 'click to show MAIN_PANEL') {
            return true;
          }
        } catch (e) {
        }
      }
      return false;
    });
  } catch (error) {
    hilog.error(0x0000, 'testTag', '%{public}s', `isSelectionAppVisible error: ${error}`);
    return false;
  }
}

/** Waits for dialog option text to appear in the rendered UI.
 *  Polls isSelectionAppVisible for the Hello World, Welcome, or menu text.
 *  Uses maxWaitMs as a timeout instead of accepting any nonzero component count.
 *  Relaunches the dialog after a timeout and waits for the same render condition.
 */
export async function waitForDialogStable(driver: Driver, maxWaitMs: number = TIMEOUT_DIALOG_RENDER): Promise<boolean> {
  try {
    hilog.info(0x0000, 'testTag', '%{public}s', `waitForDialogStable: waiting for dialog render event, maxWaitMs: ${maxWaitMs}`);

    const deadline = Date.now() + maxWaitMs;
    while (Date.now() < deadline) {
      const visible = await isSelectionAppVisible(driver);
      if (visible) {
        hilog.info(0x0000, 'testTag', '%{public}s', `waitForDialogStable: dialog render event observed`);
        return true;
      }
      await serializedDelay(driver, 100);
    }

    hilog.info(0x0000, 'testTag', '%{public}s', `waitForDialogStable: render timeout, relaunching selection app`);
    await triggerSelectionApp(driver);

    const secondDeadline = Date.now() + maxWaitMs;
    while (Date.now() < secondDeadline) {
      const visible = await isSelectionAppVisible(driver);
      if (visible) {
        hilog.info(0x0000, 'testTag', '%{public}s', `waitForDialogStable: dialog render event observed after relaunch`);
        return true;
      }
      await serializedDelay(driver, 100);
    }

    hilog.info(0x0000, 'testTag', '%{public}s', `waitForDialogStable: dialog still not rendered after relaunch, timeout: ${maxWaitMs}`);
    return false;
  } catch (error) {
    hilog.error(0x0000, 'testTag', '%{public}s', `waitForDialogStable error: ${error}`);
    return false;
  }
}

/** Finds components by type and handles null or undefined results.
 *  Provides a consistent return type for callers.
 */
export async function findComponentsByType(driver: Driver, type: string): Promise<Component[]> {
  return await runSerializedUiOperation(async () => {
    return await driver.findComponents(ON.type(type)) ?? [];
  });
}

/** Searches Text components for the expected content.
 *  Supports checks of dialog buttons, titles, and localized UI text.
 */
export async function checkTextContent(driver: Driver, expectedText: string): Promise<boolean> {
  try {
    return await runSerializedUiOperation(async () => {
      const texts = await driver.findComponents(ON.type('Text')) ?? [];

      if (texts.length === 0) {
        hilog.info(0x0000, 'testTag', '%{public}s', `checkTextContent: No text components found`);
        return false;
      }

      hilog.info(0x0000, 'testTag', '%{public}s', `checkTextContent: Found ${texts.length} text components`);

      for (const text of texts) {
        try {
          const content = await text.getText();
          hilog.info(0x0000, 'testTag', '%{public}s', `checkTextContent: Checking text: ${content} expected: ${expectedText}`);
          if (content === expectedText) {
            hilog.info(0x0000, 'testTag', '%{public}s', `checkTextContent: Match found!`);
            return true;
          }
        } catch (error) {
          hilog.info(0x0000, 'testTag', '%{public}s', `checkTextContent: Error getting text from component: ${error}`);
        }
      }

      hilog.info(0x0000, 'testTag', '%{public}s', `checkTextContent: No matching text found`);
      return false;
    });
  } catch (error) {
    hilog.error(0x0000, 'testTag', '%{public}s', `checkTextContent error: ${error}`);
    return false;
  }
}

/** Clicks the supplied coordinates and waits for touch handling.
 *  Supports touch interaction checks alongside keyboard navigation.
 */
export async function simulateTouch(driver: Driver, x: number, y: number): Promise<void> {
  await runSerializedUiOperation(async () => {
    await driver.click(x, y);
    await driver.delayMs(DELAY_TOUCH_EVENT);
  });
}

/** Starts EntryAbility through AbilityDelegator to show the selection app.
 *  The power key cannot reliably reopen a closed selection app during tests.
 */
export async function launchSelectionApp(): Promise<void> {
  const delegator = abilityDelegatorRegistry.getAbilityDelegator();
  const args = abilityDelegatorRegistry.getArguments();
  const want: Want = {
    bundleName: args.bundleName, abilityName: 'EntryAbility'
  };
  await delegator.startAbility(want);
}

/** Ensures the selection app is visible, starting EntryAbility if needed.
 *  Allows a short delay for the system to settle before checking the dialog.
 */
export async function triggerSelectionApp(driver: Driver): Promise<void> {
  await serializedDelay(driver, 1000);
  const visible = await isSelectionAppVisible(driver);
  if (!visible) {
    await launchSelectionApp();
  }
  await serializedDelay(driver, 1000);

  hilog.info(0x0000, 'testTag', '%{public}s', `Selection app triggered`);
}

/** Repeats a key operation with a fixed delay after each event.
 *  Shares the key loop across test cases.
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

/** Resolves after the requested delay. */
async function delay(ms: number): Promise<void> {
  return new Promise(resolve => setTimeout(resolve, ms));
}

/** Checks whether a component of the specified type exists in the UI.
 *  Supports assertions that dialog elements have rendered.
 */
export async function checkComponentExists(driver: Driver, type: string): Promise<boolean> {
  try {
    return await runSerializedUiOperation(async () => {
      hilog.info(0x0000, 'testTag', '%{public}s', `checkComponentExists: Searching for component type: ${type}`);
      const components = await driver.findComponents(ON.type(type));
      const exists = components !== null && components !== undefined && components.length > 0;
      hilog.info(0x0000, 'testTag', '%{public}s', `checkComponentExists: Type ${type} exists: ${exists} components found: ${components ? components.length : 0}`);
      return exists;
    });
  } catch (error) {
    hilog.error(0x0000, 'testTag', '%{public}s', `checkComponentExists error: ${error}`);
    return false;
  }
}

/** Returns the index of the currently focused component.
 *  Supports focus navigation checks in test cases.
 */
export async function getCurrentFocusIndex(driver: Driver): Promise<number> {
  try {
    return await runSerializedUiOperation(async () => {
      hilog.info(0x0000, 'testTag', '%{public}s', `getCurrentFocusIndex: Starting focus search...`);

      const allComponents: Component[] = await driver.findComponents(ON.type('*'));
      if (!allComponents || allComponents.length === 0) {
        hilog.info(0x0000, 'testTag', '%{public}s', `getCurrentFocusIndex: No components found`);
        return -1;
      }

      hilog.info(0x0000, 'testTag', '%{public}s', `getCurrentFocusIndex: Found ${allComponents.length} total components`);

      for (let i = 0; i < allComponents.length; i++) {
        const component = allComponents[i];
        try {
          const isFocused = await component.isFocused();
          hilog.info(0x0000, 'testTag', '%{public}s', `getCurrentFocusIndex: Component ${i} isFocused: ${isFocused}`);
          if (isFocused) {
            hilog.info(0x0000, 'testTag', '%{public}s', `getCurrentFocusIndex: Focus found at index ${i}`);
            return i;
          }
        } catch (e) {
          hilog.info(0x0000, 'testTag', '%{public}s', `getCurrentFocusIndex: Error checking focus for component ${i} : ${e.message}`);
        }
      }

      hilog.info(0x0000, 'testTag', '%{public}s', `getCurrentFocusIndex: No focused component found in component list`);
      return -1;
    });
  } catch (error) {
    hilog.error(0x0000, 'testTag', '%{public}s', `getCurrentFocusIndex error: ${error}`);
    return -1;
  }
}

/** Production pages are loaded in the test window without copying their implementation. */
let testWindowStage: window.WindowStage | undefined;

export function setTestWindowStage(stage: window.WindowStage | undefined): void {
  testWindowStage = stage;
}

export async function openProductionPage(page: string): Promise<void> {
  const stage = testWindowStage;
  if (stage === undefined) {
    throw new Error('TestAbility window is unavailable');
  }
  await runSerializedUiOperation(async () => {
    await stage.loadContent(page);
    /** Leave the native loadContent completion before continuing the test queue. */
    await yieldToEventLoop();
  });
}

export async function requireComponentById(id: string, timeout: number = 5000): Promise<Component> {
  const driver = getDriver();
  const deadline = Date.now() + timeout;
  while (Date.now() < deadline) {
    const component = await runSerializedUiOperation(async () => driver.findComponent(ON.id(id)));
    if (component !== null && component !== undefined) {
      return component;
    }
    await serializedDelay(driver, 50);
  }
  throw new Error('Component did not appear: ' + id);
}

export async function requireComponentByText(text: string, timeout: number = 5000): Promise<Component> {
  const driver = getDriver();
  const deadline = Date.now() + timeout;
  while (Date.now() < deadline) {
    const component = await runSerializedUiOperation(async () => driver.findComponent(ON.text(text)));
    if (component !== null && component !== undefined) {
      return component;
    }
    await serializedDelay(driver, 50);
  }
  throw new Error('Text did not appear: ' + text);
}

export async function clickText(text: string): Promise<void> {
  const component = await requireComponentByText(text);
  await runSerializedUiOperation(async () => component.click());
}

interface InspectorTextAttributes {
  content?: string;
}

interface InspectorTextNode {
  $type?: string;
  $attrs?: InspectorTextAttributes;
}

/** Read the production render tree, including zero-width empty/newline Text nodes. */
/** Accessibility component lookup omits those nodes on the test device. */
function inspectTextById(id: string): string | undefined {
  const serialized: string = getInspectorByKey(id);
  if (serialized.length === 0) {
    return undefined;
  }
  const node = JSON.parse(serialized) as InspectorTextNode;
  if (node.$type !== 'Text') {
    throw new Error('Expected a rendered Text node: ' + id);
  }
  const content = node.$attrs?.content;
  if (typeof content !== 'string') {
    throw new Error('Rendered Text content is unavailable: ' + id);
  }
  return content;
}

export async function readTextById(id: string, timeout: number = 5000): Promise<string> {
  const deadline = Date.now() + timeout;
  do {
    const actual = await runSerializedUiOperation(async () => inspectTextById(id));
    if (actual !== undefined) {
      return actual;
    }
    await yieldToEventLoop();
  } while (Date.now() < deadline);
  throw new Error('Rendered Text did not appear: ' + id);
}

export async function waitForCondition(condition: () => boolean, description: string,
  timeout: number = 5000): Promise<void> {
  const deadline = Date.now() + timeout;
  while (Date.now() < deadline) {
    if (condition()) {
      return;
    }
    await serializedDelay(getDriver(), 25);
  }
  throw new Error('Condition timed out: ' + description);
}

export async function waitForTextById(id: string, expected: string): Promise<void> {
  const deadline = Date.now() + 5000;
  let actual: string | undefined;
  do {
    actual = await runSerializedUiOperation(async () => inspectTextById(id));
    if (actual === expected) {
      return;
    }
    await yieldToEventLoop();
  } while (Date.now() < deadline);
  throw new Error('Text mismatch at component: ' + id +
    ', expected=' + JSON.stringify(expected) + ', actual=' + JSON.stringify(actual));
}
