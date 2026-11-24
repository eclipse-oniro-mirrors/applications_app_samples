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

import { Driver, ON, Component, DisplayRotation } from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import hilog from '@ohos.hilog';

let _driver: Driver | null = null;
let _uiOperationQueue: Promise<void> = Promise.resolve();
let _queueLock: boolean = false;

/* Standard OpenHarmony key codes retained for shared UI helpers. */
/* Use these constants to simulate physical navigation keys. */
export const KEY_LEFT: number = 2014;

export const KEY_RIGHT: number = 2015;

export const KEY_UP: number = 2012;

export const KEY_DOWN: number = 2013;

export const KEY_ENTER: number = 2049;

export const KEY_BACK: number = 2;

export const KEY_HOME: number = 3;

export const KEY_POWER: number = 26;

/* Timeouts for page rendering, calls, sessions, and focus polling. */
/* Values are milliseconds: 1000, 2000, 1000, and 500 respectively. */
export const TIMEOUT_PAGE_RENDER: number = 1000;

export const TIMEOUT_CALL_OPERATION: number = 2000;

export const TIMEOUT_SESSION_CREATE: number = 1000;

export const TIMEOUT_FOCUS_CHANGE: number = 500;

/* Delays between serialized input operations. */
export const DELAY_KEY_NAVIGATION: number = 50;

export const DELAY_TOUCH_EVENT: number = 100;

export const DELAY_AFTER_CALL_OP: number = 500;

/* Component and focus tolerances retained from the reference helpers. */
/* Allow small rendering differences when these helpers are used. */
export const TOLERANCE_COMPONENT_COUNT: number = 3;

export const TOLERANCE_FOCUS_CHANGE: number = 2;

/* A single observation round is retained for shared stability checks. */
export const STABLE_ROUNDS: number = 1;

export const STABLE_TOLERANCE: number = 3;

/* Bounded stress loop counts for navigation and lifecycle helpers. */
/* These constants do not imply a memory or performance benchmark. */
export const STRESS_ROUNDS_NAVIGATION: number = 20;

export const STRESS_ROUNDS_LIFECYCLE: number = 10;

/** Serialize UI operations through a shared promise queue.
 *  UiTest actions must not compete for focus or driver state.
 *  Route UI operations through this helper to preserve execution order.
 */
export async function runSerializedUiOperation<T>(action: () => Promise<T>): Promise<T> {
  /* Wait for the existing queue before starting another action. */
  const currentQueue = _uiOperationQueue;

  /* Append the action to the shared promise queue. */
  const result = await new Promise<T>((resolve, reject) => {
    _uiOperationQueue = currentQueue
      .then(async () => {
        try {
          const actionResult = await action();
          resolve(actionResult);
        } catch (error) {
          const errorMsg: Error = error instanceof Error ? error : new Error(String(error));
          reject(errorMsg);
        }
      })
      .catch((error: Error) => {
        reject(error);
      });
  });

  return result;
}

/** Serialize delays with other UiTest operations.
 *  Avoid entering delayMs while a component query or key event is active.
 */
export async function serializedDelay(driver: Driver, delayMs: number): Promise<void> {
  await runSerializedUiOperation(async () => {
    await driver.delayMs(delayMs);
  });
}

/** Serialize key events through the shared UI operation queue.
 *  Keep repeated key events in their requested order.
 */
export async function triggerSerializedKey(driver: Driver, key: number): Promise<void> {
  await runSerializedUiOperation(async () => {
    await driver.triggerKey(key);
  });
}

/** Return the shared UiTest driver instance.
 *  Create the driver lazily after the test environment is ready.
 */
export function getDriver(): Driver {
  if (_driver === null) {
    try {
      _driver = Driver.create();
    } catch (error) {
      hilog.error(0x0000, 'MakeCallTest', 'Driver creation failed: %{public}s', String(error));
      throw new Error('Driver creation failed');
    }
  }
  return _driver;
}

/** Reset the queue only when no UI operation is in progress.
 *  Resetting an active promise chain can permit concurrent driver access.
 *  Normal suite initialization should preserve the existing queue.
 */
export function resetDriver(): void {
  _uiOperationQueue = Promise.resolve();
  _queueLock = false;
}

/** Count components using the retained shared query strategies.
 *  Try specific component types if the wildcard query returns no result.
 */
export async function makeCallComponentCount(driver: Driver): Promise<number> {
  try {
    return await runSerializedUiOperation(async () => {
      /* Use fallback component queries within the same serialized action. */
      const allComponents = await driver.findComponents(ON.type('*'));
      const count = allComponents ? allComponents.length : 0;

      /* Log component counts for diagnosis. */
      hilog.info(0x0000, 'testTag', '%{public}s', `makeCallComponentCount:`);
      hilog.info(0x0000, 'testTag', '%{public}s', `  - Found ${count} components using ON.type(\"*\")`);

      if (count === 0) {
        /* Try specific types when the wildcard query has no result. */
        hilog.info(0x0000, 'testTag', '%{public}s', `  - Trying alternative component search strategies...`);

        /* Query common component types. */
        const textComponents = await driver.findComponents(ON.type('Text'));
        const imageComponents = await driver.findComponents(ON.type('Image'));
        const buttonComponents = await driver.findComponents(ON.type('Button'));

        hilog.info(
          0x0000,
          'testTag',
          '%{public}s',
          `  - Text components: ${textComponents ? textComponents.length : 0}`,
        );
        hilog.info(
          0x0000,
          'testTag',
          '%{public}s',
          `  - Image components: ${imageComponents ? imageComponents.length : 0}`,
        );
        hilog.info(
          0x0000,
          'testTag',
          '%{public}s',
          `  - Button components: ${buttonComponents ? buttonComponents.length : 0}`,
        );

        /* Return the largest count observed by these fallback queries. */
        const maxCount = Math.max(
          textComponents ? textComponents.length : 0,
          imageComponents ? imageComponents.length : 0,
          buttonComponents ? buttonComponents.length : 0,
        );

        if (maxCount > 0) {
          hilog.info(0x0000, 'testTag', '%{public}s', `  - Using alternative count: ${maxCount}`);
          return maxCount;
        }
      }

      return count;
    });
  } catch (error) {
    hilog.error(0x0000, 'testTag', '%{public}s', `makeCallComponentCount error: ${error}`);
    return 0;
  }
}

/** Check whether focus exists and optionally verify its component index.
 *  Component ordering can vary between rendered UI trees.
 */
export async function checkFocusState(driver: Driver, expectedFocusedIndex: number): Promise<boolean> {
  const retryIntervalMs = 100; /* Poll focus at a bounded interval. */
  /* Stop when focus matches the expectation or the deadline expires. */
  const deadline = Date.now() + TIMEOUT_FOCUS_CHANGE;
  let attempt = 1;

  while (Date.now() < deadline) {
    try {
      const result = await runSerializedUiOperation(async () => {
        const focusedComponent = await driver.findComponent(ON.focused(true));
        const allComponents: Component[] = (await driver.findComponents(ON.type('*'))) ?? [];

        /* A negative expected index only requires a focused component. */
        if (expectedFocusedIndex === -1) {
          /* Inspect individual components if the focused selector has no match. */
          let hasFocus = !!focusedComponent;
          if (!hasFocus) {
            for (let i = 0; i < allComponents.length; i++) {
              try {
                if (await allComponents[i].isFocused()) {
                  hasFocus = true;
                  break;
                }
              } catch (e) {
                hilog.debug(
                  0x0000,
                  'MakeCallTest',
                  'Component lookup failed: %{public}s',
                  String(e),
                ); /* Continue when one component cannot report its focus state. */
              }
            }
          }
          hilog.info(
            0x0000,
            'testTag',
            '%{public}s',
            `checkFocusState: Focus existence check - hasFocus: ${hasFocus} attempt: ${attempt}`,
          );
          return hasFocus;
        }

        /* Return false when the expected component index is unavailable. */
        if (allComponents.length === 0 || expectedFocusedIndex >= allComponents.length) {
          hilog.info(
            0x0000,
            'testTag',
            '%{public}s',
            `checkFocusState: Invalid component count or index, attempt: ${attempt}`,
          );
          return false;
        }

        /* Inspect the component at the requested index directly. */
        try {
          const targetComponent = allComponents[expectedFocusedIndex];
          const isFocused = await targetComponent.isFocused();
          hilog.info(
            0x0000,
            'testTag',
            '%{public}s',
            `checkFocusState: Component at index ${expectedFocusedIndex} isFocused: ${isFocused} attempt: ${attempt}`,
          );
          return isFocused;
        } catch (e) {
          hilog.info(
            0x0000,
            'testTag',
            '%{public}s',
            `checkFocusState: Error checking focus for component ${expectedFocusedIndex} attempt: ${attempt}`,
          );
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

/** Recognize the MakeCall page by its Make Call action label.
 *  Check the label instead of treating an arbitrary component count as page readiness.
 */
export async function isMakeCallVisible(driver: Driver): Promise<boolean> {
  try {
    return await runSerializedUiOperation(async () => {
      const texts = (await driver.findComponents(ON.text('Make Call'))) ?? [];
      if (texts.length === 0) {
        return false;
      }
      for (const text of texts) {
        try {
          const content = await text.getText();
          if (content === 'Make Call') {
            return true;
          }
        } catch (e) {
          hilog.debug(
            0x0000,
            'MakeCallTest',
            'Component lookup failed: %{public}s',
            String(e),
          ); /* Continue matching when one component cannot report its text. */
        }
      }
      return false;
    });
  } catch (error) {
    hilog.error(0x0000, 'testTag', '%{public}s', `isMakeCallVisible error: ${error}`);
    return false;
  }
}

/** Wait until the Make Call action is visible.
 *  Poll isMakeCallVisible until the rendering condition is satisfied.
 *  Apply maxWaitMs separately to each polling round.
 *  Relaunch the page after the first timeout, then poll once more.
 */
export async function waitForMakeCallStable(driver: Driver, maxWaitMs: number = TIMEOUT_PAGE_RENDER): Promise<boolean> {
  try {
    hilog.info(
      0x0000,
      'testTag',
      '%{public}s',
      `waitForMakeCallStable: waiting for page render event, maxWaitMs: ${maxWaitMs}`,
    );

    /* Poll the page visibility condition until the first deadline. */
    const deadline = Date.now() + maxWaitMs;
    while (Date.now() < deadline) {
      const visible = await isMakeCallVisible(driver);
      if (visible) {
        hilog.info(0x0000, 'testTag', '%{public}s', `waitForMakeCallStable: page render event observed`);
        return true;
      }
      await serializedDelay(driver, 100);
    }

    /* Relaunch if the page was closed or did not become visible. */
    hilog.info(0x0000, 'testTag', '%{public}s', `waitForMakeCallStable: render timeout, relaunching MakeCall page`);
    await showMakeCallPage(driver);

    /* Poll the same visibility condition after relaunch. */
    const secondDeadline = Date.now() + maxWaitMs;
    while (Date.now() < secondDeadline) {
      const visible = await isMakeCallVisible(driver);
      if (visible) {
        hilog.info(0x0000, 'testTag', '%{public}s', `waitForMakeCallStable: page render event observed after relaunch`);
        return true;
      }
      await serializedDelay(driver, 100);
    }

    hilog.info(
      0x0000,
      'testTag',
      '%{public}s',
      `waitForMakeCallStable: page still not rendered after relaunch, timeout: ${maxWaitMs}`,
    );
    return false;
  } catch (error) {
    hilog.error(0x0000, 'testTag', '%{public}s', `waitForMakeCallStable error: ${error}`);
    return false;
  }
}

/** Query components by type and normalize an absent result to an empty list.
 *  Keep null and undefined handling inside the shared query helper.
 */
export async function findComponentsByType(driver: Driver, type: string): Promise<Component[]> {
  return await runSerializedUiOperation(async () => {
    return (await driver.findComponents(ON.type(type))) ?? [];
  });
}

/** Check whether any Text component contains the expected content.
 *  Use this helper for page labels and other visible text.
 */
export async function checkTextContent(driver: Driver, expectedText: string): Promise<boolean> {
  try {
    return await runSerializedUiOperation(async () => {
      /* Query inside the current action to avoid waiting on the same queue. */
      const texts = (await driver.findComponents(ON.type('Text'))) ?? [];

      if (texts.length === 0) {
        hilog.info(0x0000, 'testTag', '%{public}s', `checkTextContent: No text components found`);
        return false;
      }

      hilog.info(0x0000, 'testTag', '%{public}s', `checkTextContent: Found ${texts.length} text components`);

      /* Match each Text component, including nested labels. */
      for (const text of texts) {
        try {
          const content = await text.getText();
          hilog.info(
            0x0000,
            'testTag',
            '%{public}s',
            `checkTextContent: Checking text: ${content} expected: ${expectedText}`,
          );
          if (content === expectedText) {
            hilog.info(0x0000, 'testTag', '%{public}s', `checkTextContent: Match found!`);
            return true;
          }
        } catch (error) {
          hilog.info(
            0x0000,
            'testTag',
            '%{public}s',
            `checkTextContent: Error getting text from component: ${error}`,
          ); /* Continue checking other components when one text query fails. */
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

/** Tap the requested position and wait for the touch event to settle.
 *  Keep touch input serialized with key events and component queries.
 */
export async function simulateTouch(driver: Driver, x: number, y: number): Promise<void> {
  await runSerializedUiOperation(async () => {
    await driver.click(x, y);
    await driver.delayMs(DELAY_TOUCH_EVENT);
  });
}

/** Wake and prepare the screen, then start the MakeCall EntryAbility.
 *  Use AbilityDelegator to launch the application with bounded retries.
 */
export async function launchMakeCallApp(): Promise<void> {
  const delegator = abilityDelegatorRegistry.getAbilityDelegator();
  const args = abilityDelegatorRegistry.getArguments();
  const want: Want = {
    bundleName: args.bundleName,
    abilityName: 'EntryAbility',
  };
  try {
    const driver = getDriver();
    await runSerializedUiOperation(async () => {
      await driver.wakeUpDisplay();
      await driver.delayMs(300);
      const unlockPrompts: string[] = ['上滑解锁', 'Swipe up to unlock', 'Swipe to unlock'];
      for (const prompt of unlockPrompts) {
        const lockHint = await driver.findComponent(ON.text(prompt));
        if (lockHint !== null && lockHint !== undefined) {
          const display = await driver.getDisplaySize();
          const centerX: number = Math.floor(display.x * 0.5);
          await driver.swipe(centerX, Math.floor(display.y * 0.86), centerX, Math.floor(display.y * 0.23), 1000);
          let lockScreenDismissed: boolean = false;
          for (let poll = 0; poll < 10; poll++) {
            await driver.delayMs(100);
            const remainingHint = await driver.findComponent(ON.text(prompt));
            if (remainingHint === null || remainingHint === undefined) {
              lockScreenDismissed = true;
              break;
            }
          }
          if (!lockScreenDismissed) {
            throw new Error('Swipe lock screen did not dismiss within the preparation timeout');
          }
          const idle = await driver.waitForIdle(500, 3000);
          if (!idle) {
            hilog.warn(0x0000, 'MakeCallTest', 'UI remained active after swipe unlock; checking ability startup');
          }
          hilog.info(0x0000, 'MakeCallTest', 'Dismissed swipe lock screen before EntryAbility startup');
          break;
        }
      }
      for (let attempt = 0; attempt < 3; attempt++) {
        try {
          await delegator.startAbility(want);
          return;
        } catch (error) {
          if (attempt === 2) {
            throw new Error('EntryAbility startup failed after 3 attempts: ' + String(error));
          }
          hilog.warn(
            0x0000,
            'MakeCallTest',
            'EntryAbility startup attempt %{public}d failed: %{public}s',
            attempt + 1,
            String(error),
          );
          await driver.delayMs(500);
        }
      }
    });
  } catch (error) {
    hilog.error(0x0000, 'MakeCallTest', 'EntryAbility UI preparation failed: %{public}s', String(error));
    throw new Error('EntryAbility UI preparation failed: ' + String(error));
  }
}

/** Ensure the MakeCall page is visible, launching EntryAbility when needed.
 *  Retain the short settling delay before checking page visibility.
 */
export async function showMakeCallPage(driver: Driver): Promise<void> {
  await serializedDelay(driver, 1000);
  const visible = await isMakeCallVisible(driver);
  if (!visible) {
    await launchMakeCallApp();
  }
  await serializedDelay(driver, 1000);

  hilog.info(0x0000, 'testTag', '%{public}s', `MakeCall page ready`);
}

/** Trigger the requested key repeatedly with a fixed delay between events.
 *  Reuse the serialized input helper for each key event.
 */
export async function pressAndWait(
  driver: Driver,
  key: number,
  times: number = 1,
  delayMs: number = DELAY_KEY_NAVIGATION,
): Promise<void> {
  await runSerializedUiOperation(async () => {
    for (let i = 0; i < times; i++) {
      await driver.triggerKey(key);
      await driver.delayMs(delayMs);
    }
  });
}

/** Return a promise that resolves after the requested delay. */
async function delay(ms: number): Promise<void> {
  return new Promise((resolve) => setTimeout(resolve, ms));
}

/** Check whether the current UI contains a component of the requested type.
 *  Use the shared query helper to normalize missing component results.
 */
export async function checkComponentExists(driver: Driver, type: string): Promise<boolean> {
  try {
    return await runSerializedUiOperation(async () => {
      hilog.info(0x0000, 'testTag', '%{public}s', `checkComponentExists: Searching for component type: ${type}`);
      const components = await driver.findComponents(ON.type(type));
      const exists = components !== null && components !== undefined && components.length > 0;
      hilog.info(
        0x0000,
        'testTag',
        '%{public}s',
        `checkComponentExists: Type ${type} exists: ${exists} components found: ${components ? components.length : 0}`,
      );
      return exists;
    });
  } catch (error) {
    hilog.error(0x0000, 'testTag', '%{public}s', `checkComponentExists error: ${error}`);
    return false;
  }
}

/** Return the index of the currently focused component.
 *  Inspect individual components when the focused selector is unavailable.
 */
export async function getCurrentFocusIndex(driver: Driver): Promise<number> {
  try {
    return await runSerializedUiOperation(async () => {
      hilog.info(0x0000, 'testTag', '%{public}s', `getCurrentFocusIndex: Starting focus search...`);

      /* Query all components and inspect isFocused as a selector fallback. */
      const allComponents: Component[] = await driver.findComponents(ON.type('*'));
      if (!allComponents || allComponents.length === 0) {
        hilog.info(0x0000, 'testTag', '%{public}s', `getCurrentFocusIndex: No components found`);
        return -1;
      }

      hilog.info(
        0x0000,
        'testTag',
        '%{public}s',
        `getCurrentFocusIndex: Found ${allComponents.length} total components`,
      );

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
          hilog.info(
            0x0000,
            'testTag',
            '%{public}s',
            `getCurrentFocusIndex: Error checking focus for component ${i} : ${e.message}`,
          ); /* Continue checking the next component. */
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
export { CallTestFixture, makeFailure } from './CallTestFixture';
