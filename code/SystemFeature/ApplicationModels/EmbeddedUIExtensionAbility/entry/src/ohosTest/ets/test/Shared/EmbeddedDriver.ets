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
import commonEventManager from '@ohos.commonEventManager';
import Want from '@ohos.app.ability.Want';
import hilog from '@ohos.hilog';

const LOG_DOMAIN: number = 0xFF00;
const LOG_TAG: string = 'EmbeddedDriver';

let _driver: Driver | null = null;
let _uiOperationQueue: Promise<void> = Promise.resolve();
let _queueLock: boolean = false;

// Remote control key codes: OpenHarmony standard key code definitions.
// Used by UI automation to emulate the physical remote controller of a device.
export const KEY_LEFT: number = 2014;

export const KEY_RIGHT: number = 2015;

export const KEY_UP: number = 2012;

export const KEY_DOWN: number = 2013;

export const KEY_ENTER: number = 2049;

export const KEY_BACK: number = 2;

export const KEY_HOME: number = 3;

export const KEY_POWER: number = 26;

// Timeout thresholds for embedded extension rendering and session creation.
export const TIMEOUT_EXTENSION_RENDER: number = 1000;

export const TIMEOUT_SESSION_CREATE: number = 1000;

export const TIMEOUT_FOCUS_CHANGE: number = 500;

export const TIMEOUT_COMMON_EVENT: number = 1000;

// Operation delays: tuned to keep the suite fast while remaining deterministic.
export const DELAY_KEY_NAVIGATION: number = 50;

export const DELAY_TOUCH_EVENT: number = 100;

export const DELAY_AFTER_EXTENSION_OP: number = 500;

// Tolerance thresholds: absorb tiny UI rendering fluctuations between runs.
export const TOLERANCE_COMPONENT_COUNT: number = 3;

export const TOLERANCE_FOCUS_CHANGE: number = 2;

// Stability detection parameters.
export const STABLE_ROUNDS: number = 1;

export const STABLE_TOLERANCE: number = 3;

// Stress rounds for high frequency navigation and lifecycle operations.
export const STRESS_ROUNDS_NAVIGATION: number = 20;

export const STRESS_ROUNDS_LIFECYCLE: number = 10;

// Business constants shared by the whole embedded UI extension sample.
export const EXTENSION_BUNDLE_NAME: string = 'com.samples.embeddeduiextensionability';

export const EXTENSION_ABILITY_NAME: string = 'EmbeddedUIExtAbility';

export const ENTRY_ABILITY_NAME: string = 'EntryAbility';

export const PAGE_SHOW_EVENT: string = 'page_show';

export const PROVIDER_MESSAGE: string = 'EmbeddedUIExtensionAbility provider';

export const CONSUMER_MESSAGE: string = 'EmbeddedUIExtAbility User';

export const EXTENSION_PAGE: string = 'pages/extension';

export const MAIN_PAGE: string = 'pages/Index';

/** UI operation serializer: guarantees that every UiTest call runs in sequence.
 *  The embedded component shares the host UI thread, so concurrent UiTest calls
 *  may cause focus races and inconsistent snapshots. All UI helpers below route
 *  through this queue, which keeps the suite deterministic and repeatable.
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

/** Serialized delay: keeps waiting inside the same queue as UiTest calls.
 */
export async function serializedDelay(driver: Driver, delayMs: number): Promise<void> {
  await runSerializedUiOperation(async () => {
    await driver.delayMs(delayMs);
  });
}

/** Serialized key trigger: wraps triggerKey to preserve event ordering.
 */
export async function triggerSerializedKey(driver: Driver, key: number): Promise<void> {
  await runSerializedUiOperation(async () => {
    await driver.triggerKey(key);
  });
}

/** Get the singleton Driver instance used by the whole embedded UI suite.
 */
export function getDriver(): Driver {
  if (_driver === null) {
    _driver = Driver.create();
  }
  return _driver;
}

/** Reset the UI operation queue. Only used in fully controlled teardown paths.
 */
export function resetDriver(): void {
  _uiOperationQueue = Promise.resolve();
  _queueLock = false;
}

/** Count the components rendered by the host page plus embedded provider page.
 */
export async function embeddedComponentCount(driver: Driver): Promise<number> {
  try {
    return await runSerializedUiOperation(async () => {
      const allComponents = await driver.findComponents(ON.type('*'));
      const count = allComponents ? allComponents.length : 0;

      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', `embeddedComponentCount: ${count} components`);

      if (count === 0) {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', `embeddedComponentCount: trying fallback search`);

        const textComponents = await driver.findComponents(ON.type('Text'));
        const imageComponents = await driver.findComponents(ON.type('Image'));
        const embeddedComponents = await driver.findComponents(ON.type('EmbeddedComponent'));

        const maxCount = Math.max(textComponents ? textComponents.length : 0,
          imageComponents ? imageComponents.length : 0, embeddedComponents ? embeddedComponents.length : 0);

        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', `embeddedComponentCount: fallback max ${maxCount}`);
        if (maxCount > 0) {
          return maxCount;
        }
      }

      return count;
    });
  } catch (error) {
    hilog.error(LOG_DOMAIN, LOG_TAG, '%{public}s', `embeddedComponentCount error: ${error}`);
    return 0;
  }
}
/** Check whether the current focus matches the expected index.
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
                hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', `checkFocusState: skip component ${i}`);
              }
            }
          }
          hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', `checkFocusState: existence=${hasFocus} attempt=${attempt}`);
          return hasFocus;
        }

        if (allComponents.length === 0 || expectedFocusedIndex >= allComponents.length) {
          hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', `checkFocusState: invalid index attempt=${attempt}`);
          return false;
        }

        try {
          const targetComponent = allComponents[expectedFocusedIndex];
          const isFocused = await targetComponent.isFocused();
          hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s',
            `checkFocusState: index=${expectedFocusedIndex} focused=${isFocused} attempt=${attempt}`);
          return isFocused;
        } catch (innerError) {
          hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', `checkFocusState: index check error attempt=${attempt}`);
          return false;
        }
      });

      if (result) {
        return true;
      }
    } catch (error) {
      hilog.error(LOG_DOMAIN, LOG_TAG, '%{public}s', `checkFocusState error: ${error} attempt=${attempt}`);
    }

    attempt++;
    await serializedDelay(driver, retryIntervalMs);
  }

  return false;
}

/** Check whether the embedded provider page is visible by matching its title text.
 */
export async function isExtensionPageVisible(driver: Driver): Promise<boolean> {
  try {
    return await runSerializedUiOperation(async () => {
      const texts = await driver.findComponents(ON.type('Text')) ?? [];
      if (texts.length === 0) {
        return false;
      }
      for (const text of texts) {
        try {
          const content = await text.getText();
          if (content === PROVIDER_MESSAGE || content === CONSUMER_MESSAGE) {
            return true;
          }
        } catch (innerError) {
          hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', `isExtensionPageVisible: read text skipped`);
        }
      }
      return false;
    });
  } catch (error) {
    hilog.error(LOG_DOMAIN, LOG_TAG, '%{public}s', `isExtensionPageVisible error: ${error}`);
    return false;
  }
}

/** Wait until the embedded provider page renders, relaunching the host if needed.
 */
export async function waitForExtensionReady(driver: Driver, maxWaitMs: number = TIMEOUT_EXTENSION_RENDER): Promise<boolean> {
  try {
    hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', `waitForExtensionReady: maxWaitMs=${maxWaitMs}`);

    const deadline = Date.now() + maxWaitMs;
    while (Date.now() < deadline) {
      const visible = await isExtensionPageVisible(driver);
      if (visible) {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', `waitForExtensionReady: provider page observed`);
        return true;
      }
      await serializedDelay(driver, 100);
    }

    hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', `waitForExtensionReady: relaunching host ability`);
    await triggerExtension(driver);

    const secondDeadline = Date.now() + maxWaitMs;
    while (Date.now() < secondDeadline) {
      const visible = await isExtensionPageVisible(driver);
      if (visible) {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', `waitForExtensionReady: provider page observed after relaunch`);
        return true;
      }
      await serializedDelay(driver, 100);
    }

    hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', `waitForExtensionReady: timeout=${maxWaitMs}`);
    return false;
  } catch (error) {
    hilog.error(LOG_DOMAIN, LOG_TAG, '%{public}s', `waitForExtensionReady error: ${error}`);
    return false;
  }
}

/** Find components by type, always returning a non-null array.
 */
export async function findComponentsByType(driver: Driver, type: string): Promise<Component[]> {
  return await runSerializedUiOperation(async () => {
    return await driver.findComponents(ON.type(type)) ?? [];
  });
}
/** Check whether any Text component carries the expected content.
 */
export async function checkTextContent(driver: Driver, expectedText: string): Promise<boolean> {
  try {
    return await runSerializedUiOperation(async () => {
      const texts = await driver.findComponents(ON.type('Text')) ?? [];

      if (texts.length === 0) {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', `checkTextContent: no text components`);
        return false;
      }

      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', `checkTextContent: ${texts.length} text components`);

      for (const text of texts) {
        try {
          const content = await text.getText();
          hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', `checkTextContent: candidate=${content}`);
          if (content === expectedText) {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', `checkTextContent: match found`);
            return true;
          }
        } catch (innerError) {
          hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', `checkTextContent: read text error`);
        }
      }

      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', `checkTextContent: no match`);
      return false;
    });
  } catch (error) {
    hilog.error(LOG_DOMAIN, LOG_TAG, '%{public}s', `checkTextContent error: ${error}`);
    return false;
  }
}

/** Simulate a touch event at the given coordinates.
 */
export async function simulateTouch(driver: Driver, x: number, y: number): Promise<void> {
  await runSerializedUiOperation(async () => {
    await driver.click(x, y);
    await driver.delayMs(DELAY_TOUCH_EVENT);
  });
}

/** Launch the host UIAbility which embeds the extension provider page.
 */
export async function launchExtensionAbility(): Promise<void> {
  const delegator = abilityDelegatorRegistry.getAbilityDelegator();
  const args = abilityDelegatorRegistry.getArguments();
  const want: Want = {
    bundleName: args.bundleName,
    abilityName: ENTRY_ABILITY_NAME
  };
  await delegator.startAbility(want);
}

/** Trigger the host page and wait for the embedded provider to be ready.
 */
export async function triggerExtension(driver: Driver): Promise<void> {
  await serializedDelay(driver, 1000);
  const visible = await isExtensionPageVisible(driver);
  if (!visible) {
    await launchExtensionAbility();
  }
  await serializedDelay(driver, 1000);
  hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', `extension triggered`);
}

/** Press a key several times with a fixed delay between presses.
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

/** Check whether a component of the given type exists in the current UI.
 */
export async function checkComponentExists(driver: Driver, type: string): Promise<boolean> {
  try {
    return await runSerializedUiOperation(async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', `checkComponentExists: type=${type}`);
      const components = await driver.findComponents(ON.type(type));
      const exists = components !== null && components !== undefined && components.length > 0;
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s',
        `checkComponentExists: type=${type} exists=${exists} count=${components ? components.length : 0}`);
      return exists;
    });
  } catch (error) {
    hilog.error(LOG_DOMAIN, LOG_TAG, '%{public}s', `checkComponentExists error: ${error}`);
    return false;
  }
}

/** Get the index of the currently focused component, or -1 when none is focused.
 */
export async function getCurrentFocusIndex(driver: Driver): Promise<number> {
  try {
    return await runSerializedUiOperation(async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', `getCurrentFocusIndex: start`);

      const allComponents: Component[] = await driver.findComponents(ON.type('*'));
      if (!allComponents || allComponents.length === 0) {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', `getCurrentFocusIndex: no components`);
        return -1;
      }

      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', `getCurrentFocusIndex: total=${allComponents.length}`);

      for (let i = 0; i < allComponents.length; i++) {
        const component = allComponents[i];
        try {
          const isFocused = await component.isFocused();
          if (isFocused) {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', `getCurrentFocusIndex: focus at ${i}`);
            return i;
          }
        } catch (innerError) {
          hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', `getCurrentFocusIndex: skip ${i}`);
        }
      }

      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', `getCurrentFocusIndex: none focused`);
      return -1;
    });
  } catch (error) {
    hilog.error(LOG_DOMAIN, LOG_TAG, '%{public}s', `getCurrentFocusIndex error: ${error}`);
    return -1;
  }
}

/** Collect all visible text values from the current UI as a snapshot array.
 */
export async function collectTextSnapshot(driver: Driver): Promise<string[]> {
  try {
    return await runSerializedUiOperation(async () => {
      const result: string[] = [];
      const texts = await driver.findComponents(ON.type('Text')) ?? [];
      for (const text of texts) {
        try {
          const content = await text.getText();
          result.push(content);
        } catch (innerError) {
          hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', `collectTextSnapshot: skipped one text`);
        }
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', `collectTextSnapshot: collected ${result.length} values`);
      return result;
    });
  } catch (error) {
    hilog.error(LOG_DOMAIN, LOG_TAG, '%{public}s', `collectTextSnapshot error: ${error}`);
    return [];
  }
}

/** Count the Text components currently rendered in the UI.
 */
export async function countTextComponents(driver: Driver): Promise<number> {
  try {
    return await runSerializedUiOperation(async () => {
      const texts = await driver.findComponents(ON.type('Text'));
      const count = texts ? texts.length : 0;
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', `countTextComponents: ${count}`);
      return count;
    });
  } catch (error) {
    hilog.error(LOG_DOMAIN, LOG_TAG, '%{public}s', `countTextComponents error: ${error}`);
    return 0;
  }
}

/** Publish the provider page show common event, mirroring extension.ets behaviour.
 */
export async function publishPageShow(): Promise<void> {
  await commonEventManager.publish(PAGE_SHOW_EVENT, (err) => {
    if (err) {
      hilog.error(LOG_DOMAIN, LOG_TAG, '%{public}s', `publishPageShow failed: ${err.code}`);
      return;
    }
    hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', `publishPageShow succeeded`);
  });
}

/** Verify the embedded component type is present in the host page.
 */
export async function hasEmbeddedComponent(driver: Driver): Promise<boolean> {
  return await checkComponentExists(driver, 'EmbeddedComponent');
}

/** Verify that the provider page title text is rendered.
 */
export async function hasProviderTitle(driver: Driver): Promise<boolean> {
  return await checkTextContent(driver, PROVIDER_MESSAGE);
}

/** Verify that the consumer page title text is rendered.
 */
export async function hasConsumerTitle(driver: Driver): Promise<boolean> {
  return await checkTextContent(driver, CONSUMER_MESSAGE);
}

/** Wait for a fixed settle delay after an extension operation.
 */
export async function settleAfterExtension(driver: Driver): Promise<void> {
  await serializedDelay(driver, DELAY_AFTER_EXTENSION_OP);
}