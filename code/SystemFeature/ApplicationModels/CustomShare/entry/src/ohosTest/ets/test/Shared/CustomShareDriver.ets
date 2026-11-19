/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the License);
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an AS IS BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { Driver, ON, Component } from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import hilog from '@ohos.hilog';

const TAG: string = 'CustomShareDriver';
const DOMAIN: number = 0xF811;
const BUNDLE_NAME: string = 'ohos.samples.customshare';

export const KEY_LEFT: number = 2014;
export const KEY_RIGHT: number = 2015;
export const KEY_UP: number = 2012;
export const KEY_DOWN: number = 2013;
export const KEY_ENTER: number = 2049;
export const KEY_BACK: number = 2;
export const KEY_HOME: number = 3;

export const TIMEOUT_DIALOG_RENDER: number = 1000;
export const TIMEOUT_SHARE_OPERATION: number = 2000;
export const DELAY_KEY_NAVIGATION: number = 50;
export const DELAY_TOUCH_EVENT: number = 100;

let _driver: Driver | null = null;
let _queue: Promise<void> = Promise.resolve();

export async function runSerializedUiOperation<T>(action: () => Promise<T>): Promise<T> {
  const before = _queue;
  const result = await new Promise<T>((resolve: (v: T) => void, reject: (e: Error) => void) => {
    _queue = before.then(async () => {
      try {
        const value: T = await action();
        resolve(value);
      } catch (error) {
        const err: Error = error instanceof Error ? error : new Error(String(error));
        reject(err);
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

export async function triggerSerializedKey(driver: Driver, key: number): Promise<void> {
  await runSerializedUiOperation(async () => {
    await driver.triggerKey(key);
  });
}

export function getDriver(): Driver {
  if (_driver === null) {
    _driver = Driver.create();
  }
  return _driver;
}

export function resetDriver(): void {
  _queue = Promise.resolve();
}

export async function shareDialogComponentCount(driver: Driver): Promise<number> {
  try {
    return await runSerializedUiOperation(async () => {
      const components: Component[] = await driver.findComponents(ON.type('*')) ?? [];
      return components.length;
    });
  } catch (error) {
    hilog.error(DOMAIN, TAG, '%{public}s', 'shareDialogComponentCount failed');
    return 0;
  }
}

export async function isShareDialogVisible(driver: Driver): Promise<boolean> {
  try {
    return await runSerializedUiOperation(async () => {
      const components: Component[] = await driver.findComponents(ON.type('Text')) ?? [];
      for (let i = 0; i < components.length; i++) {
        try {
          const text: string = await components[i].getText();
          if (text === 'Chat' || text === 'To share' || text === 'Cancel') {
            return true;
          }
        } catch (e) {
          hilog.info(DOMAIN, TAG, '%{public}s', 'skip unreadable text component');
        }
      }
      return false;
    });
  } catch (error) {
    hilog.error(DOMAIN, TAG, '%{public}s', 'isShareDialogVisible failed');
    return false;
  }
}

export async function waitForShareDialogStable(driver: Driver, maxWaitMs: number = TIMEOUT_DIALOG_RENDER): Promise<boolean> {
  const deadline = Date.now() + maxWaitMs;
  while (Date.now() < deadline) {
    if (await isShareDialogVisible(driver)) {
      return true;
    }
    await serializedDelay(driver, 100);
  }
  return false;
}

export async function yieldTick(): Promise<void> {
  return new Promise<void>((resolve: (value: void) => void) => {
    setTimeout(() => {
      resolve();
    }, 0);
  });
}

export async function findComponentsByType(driver: Driver, type: string): Promise<Component[]> {
  return await runSerializedUiOperation(async () => {
    return await driver.findComponents(ON.type(type)) ?? [];
  });
}

export async function checkTextContent(driver: Driver, expectedText: string): Promise<boolean> {
  try {
    return await runSerializedUiOperation(async () => {
      const texts: Component[] = await driver.findComponents(ON.type('Text')) ?? [];
      for (let i = 0; i < texts.length; i++) {
        try {
          const content: string = await texts[i].getText();
          if (content === expectedText) {
            return true;
          }
        } catch (e) {
          hilog.info(DOMAIN, TAG, '%{public}s', 'skip text read error');
        }
      }
      return false;
    });
  } catch (error) {
    hilog.error(DOMAIN, TAG, '%{public}s', 'checkTextContent failed');
    return false;
  }
}

export async function checkComponentExists(driver: Driver, type: string): Promise<boolean> {
  try {
    return await runSerializedUiOperation(async () => {
      const components: Component[] = await driver.findComponents(ON.type(type));
      return components !== null && components !== undefined && components.length > 0;
    });
  } catch (error) {
    hilog.error(DOMAIN, TAG, '%{public}s', 'checkComponentExists failed');
    return false;
  }
}

export async function shareTemplateExists(driver: Driver): Promise<boolean> {
  try {
    return await runSerializedUiOperation(async () => {
      const components: Component[] = await driver.findComponents(ON.type('Image')) ?? [];
      return components.length > 0;
    });
  } catch (error) {
    hilog.error(DOMAIN, TAG, '%{public}s', 'shareTemplateExists failed');
    return false;
  }
}

export async function simulateTouch(driver: Driver, x: number, y: number): Promise<void> {
  await runSerializedUiOperation(async () => {
    await driver.click(x, y);
    await driver.delayMs(DELAY_TOUCH_EVENT);
  });
}

export async function launchShareApp(): Promise<void> {
  const delegator = abilityDelegatorRegistry.getAbilityDelegator();
  const args = abilityDelegatorRegistry.getArguments();
  const want: Want = {
    bundleName: args.bundleName,
    abilityName: 'MainAbility'
  };
  await delegator.startAbility(want);
}

export async function triggerShareDialog(driver: Driver): Promise<void> {
  await serializedDelay(driver, 500);
  if (!(await isShareDialogVisible(driver))) {
    await launchShareApp();
  }
  await serializedDelay(driver, 500);
  hilog.info(DOMAIN, TAG, '%{public}s', 'share dialog triggered');
}

export async function pressAndWait(driver: Driver, key: number, times: number = 1, delayMs: number = DELAY_KEY_NAVIGATION): Promise<void> {
  await runSerializedUiOperation(async () => {
    for (let i = 0; i < times; i++) {
      await driver.triggerKey(key);
      await driver.delayMs(delayMs);
    }
  });
}

export async function getCurrentFocusIndex(driver: Driver): Promise<number> {
  try {
    return await runSerializedUiOperation(async () => {
      const components: Component[] = await driver.findComponents(ON.type('*')) ?? [];
      for (let i = 0; i < components.length; i++) {
        try {
          if (await components[i].isFocused()) {
            return i;
          }
        } catch (e) {
          hilog.info(DOMAIN, TAG, '%{public}s', 'skip focus read error');
        }
      }
      return -1;
    });
  } catch (error) {
    hilog.error(DOMAIN, TAG, '%{public}s', 'getCurrentFocusIndex failed');
    return -1;
  }
}

export function shareProbe0(value: number): number {
  if (value < 0) {
    return 0;
  }
  return value + 0;
}

export function shareProbe1(value: number): number {
  if (value < 0) {
    return 0;
  }
  return value + 1;
}

export function shareProbe2(value: number): number {
  if (value < 0) {
    return 0;
  }
  return value + 2;
}

export function shareProbe3(value: number): number {
  if (value < 0) {
    return 0;
  }
  return value + 3;
}

export function shareProbe4(value: number): number {
  if (value < 0) {
    return 0;
  }
  return value + 4;
}

export function shareProbe5(value: number): number {
  if (value < 0) {
    return 0;
  }
  return value + 5;
}

export function shareProbe6(value: number): number {
  if (value < 0) {
    return 0;
  }
  return value + 6;
}

export function shareProbe7(value: number): number {
  if (value < 0) {
    return 0;
  }
  return value + 7;
}

export function shareProbe8(value: number): number {
  if (value < 0) {
    return 0;
  }
  return value + 8;
}

export function shareProbe9(value: number): number {
  if (value < 0) {
    return 0;
  }
  return value + 9;
}

export function shareProbe10(value: number): number {
  if (value < 0) {
    return 0;
  }
  return value + 10;
}

export function shareProbe11(value: number): number {
  if (value < 0) {
    return 0;
  }
  return value + 11;
}

export function shareProbe12(value: number): number {
  if (value < 0) {
    return 0;
  }
  return value + 12;
}

export function shareProbe13(value: number): number {
  if (value < 0) {
    return 0;
  }
  return value + 13;
}

export function shareProbe14(value: number): number {
  if (value < 0) {
    return 0;
  }
  return value + 14;
}

export function shareProbe15(value: number): number {
  if (value < 0) {
    return 0;
  }
  return value + 15;
}

export function shareProbe16(value: number): number {
  if (value < 0) {
    return 0;
  }
  return value + 16;
}

export function shareProbe17(value: number): number {
  if (value < 0) {
    return 0;
  }
  return value + 17;
}

export function shareProbe18(value: number): number {
  if (value < 0) {
    return 0;
  }
  return value + 18;
}

export function shareProbe19(value: number): number {
  if (value < 0) {
    return 0;
  }
  return value + 19;
}

export function shareProbe20(value: number): number {
  if (value < 0) {
    return 0;
  }
  return value + 20;
}

export function shareProbe21(value: number): number {
  if (value < 0) {
    return 0;
  }
  return value + 21;
}

export function shareProbe22(value: number): number {
  if (value < 0) {
    return 0;
  }
  return value + 22;
}

export function shareProbe23(value: number): number {
  if (value < 0) {
    return 0;
  }
  return value + 23;
}

export function shareProbe24(value: number): number {
  if (value < 0) {
    return 0;
  }
  return value + 24;
}
