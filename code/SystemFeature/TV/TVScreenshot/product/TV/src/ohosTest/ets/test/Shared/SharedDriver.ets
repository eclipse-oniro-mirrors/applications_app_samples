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

const DOMAIN: number = 0x55EE;
const TAG: string = 'Screenshot-SharedDriver';

let driverInstance: Driver | null = null;
let uiQueue: Promise<void> = Promise.resolve();

/**
 * TV remote key codes used by the capture flows. The preview window is focusless, so
 * only the system level toggle and the back / home keys reach the service.
 */
export const KEY_LEFT: number = 2014;

export const KEY_RIGHT: number = 2015;

export const KEY_UP: number = 2012;

export const KEY_DOWN: number = 2013;

export const KEY_ENTER: number = 2049;

export const KEY_BACK: number = 2;

export const KEY_HOME: number = 3;

export const KEY_POWER: number = 26;

/**
 * Timeout budget shared by every interaction suite.
 */
export const TIMEOUT_PREVIEW_RENDER: number = 1000;

export const TIMEOUT_CAPTURE_CYCLE: number = 2000;

export const TIMEOUT_SESSION_CREATE: number = 1000;

export const TIMEOUT_FOCUS_CHANGE: number = 500;

export const DELAY_KEY_NAVIGATION: number = 50;

export const DELAY_TOUCH_EVENT: number = 100;

export const DELAY_AFTER_CAPTURE: number = 500;

/**
 * Tolerances that absorb rendering jitter on TV panels.
 */
export const TOLERANCE_COMPONENT_COUNT: number = 3;

export const TOLERANCE_FOCUS_CHANGE: number = 2;

export const STABLE_ROUNDS: number = 1;

export const STABLE_TOLERANCE: number = 3;

export const STRESS_ROUNDS_NAVIGATION: number = 20;

export const STRESS_ROUNDS_LIFECYCLE: number = 10;

/**
 * Serialize every UiTest call. The underlying driver does not allow overlapping
 * findComponents / triggerKey calls, therefore all helpers funnel through this queue.
 */
export async function runSerializedUiOperation<T>(action: () => Promise<T>): Promise<T> {
  const currentQueue: Promise<void> = uiQueue;
  const result: T = await new Promise<T>((resolve: (value: T) => void, reject: (reason: Error) => void) => {
    uiQueue = currentQueue.then(async () => {
      try {
        const actionResult: T = await action();
        resolve(actionResult);
      } catch (error) {
        const errorMessage: Error = error instanceof Error ? error : new Error(String(error));
        reject(errorMessage);
      }
    }).catch((error: Error) => {
      reject(error);
    });
  });
  return result;
}

/**
 * Delay helper that participates in the serialization queue.
 */
export async function serializedDelay(driver: Driver, milliseconds: number): Promise<void> {
  await runSerializedUiOperation(async () => {
    await driver.delayMs(milliseconds);
  });
}

/**
 * Trigger a remote key inside the serialization queue.
 */
export async function triggerSerializedKey(driver: Driver, key: number): Promise<void> {
  await runSerializedUiOperation(async () => {
    await driver.triggerKey(key);
  });
}

/**
 * Lazily created driver singleton. Creating the driver before the test ability is
 * ready throws, therefore the instance is created on first use.
 */
export function getDriver(): Driver {
  if (driverInstance === null) {
    driverInstance = Driver.create();
  }
  return driverInstance;
}

/**
 * Reset the internal queue. Only used by suites that deliberately abort a flow.
 */
export function resetDriver(): void {
  uiQueue = Promise.resolve();
}

/**
 * Count all components currently rendered by the preview window.
 */
export async function previewComponentCount(driver: Driver): Promise<number> {
  try {
    return await runSerializedUiOperation(async () => {
      const all: Component[] = await driver.findComponents(ON.type('*'));
      const count: number = all === null || all === undefined ? 0 : all.length;
      hilog.info(DOMAIN, TAG, '%{public}s', 'previewComponentCount=' + count);
      if (count === 0) {
        const images: Component[] = await driver.findComponents(ON.type('Image'));
        const texts: Component[] = await driver.findComponents(ON.type('Text'));
        const fallback: number = Math.max(images === null ? 0 : images.length, texts === null ? 0 : texts.length);
        hilog.info(DOMAIN, TAG, '%{public}s', 'previewComponentCount fallback=' + fallback);
        return fallback;
      }
      return count;
    });
  } catch (error) {
    hilog.error(DOMAIN, TAG, '%{public}s', 'previewComponentCount failed: ' + String(error));
    return 0;
  }
}

/**
 * Find components by an explicit selector factory. Supports type, id and text lookups
 * so suites can express their expectations without duplicating ON handling.
 */
export async function findComponentsBySelector(driver: Driver, factory: string, value: string): Promise<Component[]> {
  return await runSerializedUiOperation(async () => {
    let components: Component[] = [];
    if (factory === 'type') {
      components = await driver.findComponents(ON.type(value));
    } else if (factory === 'id') {
      components = await driver.findComponents(ON.id(value));
    } else {
      components = await driver.findComponents(ON.text(value));
    }
    if (components === null || components === undefined) {
      return [];
    }
    return components;
  });
}

/**
 * Verify that a component of the given type exists.
 */
export async function checkComponentExists(driver: Driver, type: string): Promise<boolean> {
  try {
    const components: Component[] = await findComponentsBySelector(driver, 'type', type);
    return components.length > 0;
  } catch (error) {
    hilog.error(DOMAIN, TAG, '%{public}s', 'checkComponentExists failed: ' + String(error));
    return false;
  }
}

/**
 * Verify that a text component with the expected content exists.
 */
export async function checkTextContent(driver: Driver, expected: string): Promise<boolean> {
  try {
    return await runSerializedUiOperation(async () => {
      const texts: Component[] = await driver.findComponents(ON.type('Text'));
      if (texts === null || texts === undefined || texts.length === 0) {
        return false;
      }
      for (let index: number = 0; index < texts.length; index++) {
        try {
          const content: string = await texts[index].getText();
          if (content === expected) {
            return true;
          }
        } catch (error) {
          hilog.info(DOMAIN, TAG, '%{public}s', 'text read skipped at ' + index);
        }
      }
      return false;
    });
  } catch (error) {
    hilog.error(DOMAIN, TAG, '%{public}s', 'checkTextContent failed: ' + String(error));
    return false;
  }
}

/**
 * Check whether the preview window is currently visible. The preview is identified by
 * an image component inside the floating window.
 */
export async function isPreviewVisible(driver: Driver): Promise<boolean> {
  try {
    const images: Component[] = await findComponentsBySelector(driver, 'type', 'Image');
    hilog.info(DOMAIN, TAG, '%{public}s', 'isPreviewVisible images=' + images.length);
    return images.length > 0;
  } catch (error) {
    hilog.error(DOMAIN, TAG, '%{public}s', 'isPreviewVisible failed: ' + String(error));
    return false;
  }
}

/**
 * Wait until the preview render event is observed, or until the timeout expires.
 */
export async function waitForPreviewStable(driver: Driver, maxWaitMs: number = TIMEOUT_PREVIEW_RENDER): Promise<boolean> {
  try {
    const deadline: number = Date.now() + maxWaitMs;
    while (Date.now() < deadline) {
      if (await isPreviewVisible(driver)) {
        hilog.info(DOMAIN, TAG, '%{public}s', 'preview render event observed');
        return true;
      }
      await serializedDelay(driver, 100);
    }
    hilog.info(DOMAIN, TAG, '%{public}s', 'preview render event timeout');
    return false;
  } catch (error) {
    hilog.error(DOMAIN, TAG, '%{public}s', 'waitForPreviewStable failed: ' + String(error));
    return false;
  }
}

/**
 * Return the raw component list, used by suites that need index based navigation.
 */
export async function findComponentsByType(driver: Driver, type: string): Promise<Component[]> {
  return await runSerializedUiOperation(async () => {
    const components: Component[] = await driver.findComponents(ON.type(type));
    if (components === null || components === undefined) {
      return [];
    }
    return components;
  });
}

/**
 * Simulate a touch on absolute coordinates.
 */
export async function simulateTouch(driver: Driver, x: number, y: number): Promise<void> {
  await runSerializedUiOperation(async () => {
    await driver.click(x, y);
    await driver.delayMs(DELAY_TOUCH_EVENT);
  });
}

/**
 * Start the capture service through the ability delegator.
 */
export async function launchCaptureService(): Promise<void> {
  const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
  const args: abilityDelegatorRegistry.AbilityDelegatorArgs = abilityDelegatorRegistry.getArguments();
  const want: Want = {
    bundleName: args.bundleName,
    abilityName: 'com.ohos.screenshot.ServiceExtAbility'
  };
  await delegator.startAbility(want);
}

/**
 * Trigger the system level screenshot toggle if the preview is not already visible.
 */
export async function triggerCapture(driver: Driver): Promise<void> {
  await serializedDelay(driver, DELAY_AFTER_CAPTURE);
  if (!await isPreviewVisible(driver)) {
    await launchCaptureService();
  }
  await serializedDelay(driver, DELAY_AFTER_CAPTURE);
  hilog.info(DOMAIN, TAG, '%{public}s', 'capture triggered');
}

/**
 * Press a key repeatedly with a fixed delay between the presses.
 */
export async function pressAndWait(driver: Driver, key: number, times: number = 1,
  delay: number = DELAY_KEY_NAVIGATION): Promise<void> {
  await runSerializedUiOperation(async () => {
    for (let index: number = 0; index < times; index++) {
      await driver.triggerKey(key);
      await driver.delayMs(delay);
    }
  });
}

/**
 * Return the index of the focused component, or -1 when no component owns the focus.
 */
export async function getCurrentFocusIndex(driver: Driver): Promise<number> {
  try {
    return await runSerializedUiOperation(async () => {
      const all: Component[] = await driver.findComponents(ON.type('*'));
      if (all === null || all === undefined || all.length === 0) {
        return -1;
      }
      for (let index: number = 0; index < all.length; index++) {
        try {
          if (await all[index].isFocused()) {
            return index;
          }
        } catch (error) {
          hilog.info(DOMAIN, TAG, '%{public}s', 'focus probe skipped at ' + index);
        }
      }
      return -1;
    });
  } catch (error) {
    hilog.error(DOMAIN, TAG, '%{public}s', 'getCurrentFocusIndex failed: ' + String(error));
    return -1;
  }
}

/**
 * Wait until the focus settles on the expected index, used by navigation suites.
 */
export async function checkFocusState(driver: Driver, expectedIndex: number): Promise<boolean> {
  const deadline: number = Date.now() + TIMEOUT_FOCUS_CHANGE;
  while (Date.now() < deadline) {
    const index: number = await getCurrentFocusIndex(driver);
    if (expectedIndex === -1 && index === -1) {
      return true;
    }
    if (index === expectedIndex) {
      return true;
    }
    await serializedDelay(driver, 50);
  }
  return false;
}

/**
 * Wait until the component count becomes stable across two consecutive probes.
 */
export async function waitForComponentCountStable(driver: Driver, maxWaitMs: number = TIMEOUT_PREVIEW_RENDER): Promise<number> {
  let previous: number = -1;
  const deadline: number = Date.now() + maxWaitMs;
  while (Date.now() < deadline) {
    const current: number = await previewComponentCount(driver);
    if (previous >= 0 && Math.abs(current - previous) <= STABLE_TOLERANCE) {
      return current;
    }
    previous = current;
    await serializedDelay(driver, 100);
  }
  return previous;
}
