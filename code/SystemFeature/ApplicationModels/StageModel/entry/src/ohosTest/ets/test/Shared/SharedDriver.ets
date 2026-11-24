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
let _queueLock: boolean = false;

export const BUNDLE_NAME: string = 'ohos.samples.stagemodel';
export const ABILITY_MAIN: string = 'MainAbility';
export const ABILITY_JUMP: string = 'JumpAbility';
export const ABILITY_SERVICE: string = 'ServiceExtAbility';
export const ABILITY_FORM: string = 'FormAbility';
export const ABILITY_DATA_SHARE: string = 'DataShareExtAbility';
export const ABILITY_TEST: string = 'TestAbility';
export const MODULE_ENTRY: string = 'entry';
export const DATA_SHARE_URI: string = 'datashare:///ohos.samples.stagemodel.DataShare';
export const DATA_SHARE_COLUMNS: string[] = ['*'];
export const ACCOUNT_ID: number = 100;
export const RESULT_CODE: number = 100;
export const CONNECTION_NUMBER: number = 0;

export const KEY_LEFT: number = 2014;
export const KEY_RIGHT: number = 2015;
export const KEY_UP: number = 2012;
export const KEY_DOWN: number = 2013;
export const KEY_ENTER: number = 2049;
export const KEY_BACK: number = 2;
export const KEY_HOME: number = 3;
export const KEY_TAB: number = 4;
export const KEY_SPACE: number = 57;

export const TIMEOUT_PAGE_RENDER: number = 1000;
export const TIMEOUT_ABILITY_OPERATION: number = 2000;
export const TIMEOUT_TOAST_VISIBLE: number = 2000;
export const TIMEOUT_FOCUS_CHANGE: number = 500;

export const DELAY_KEY_NAVIGATION: number = 50;
export const DELAY_TOUCH_EVENT: number = 100;
export const DELAY_AFTER_OPERATION: number = 500;

export const TOLERANCE_COMPONENT_COUNT: number = 3;
export const TOLERANCE_FOCUS_CHANGE: number = 2;
export const STABLE_ROUNDS: number = 1;
export const STABLE_TOLERANCE: number = 3;

export const STRESS_ROUNDS_NAVIGATION: number = 20;
export const STRESS_ROUNDS_LIFECYCLE: number = 10;

/**
 * Serializes UI operations through a promise chain. The device UI thread is
 * effectively single threaded, so every driver call that touches the UI must be
 * queued to avoid focus races and lost key events.
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
  _uiOperationQueue = Promise.resolve();
  _queueLock = false;
}

export function isQueueBusy(): boolean {
  return _queueLock;
}

export async function findComponentsByType(driver: Driver, type: string): Promise<Component[]> {
  return await runSerializedUiOperation(async () => {
    const components = await driver.findComponents(ON.type(type));
    return components ?? [];
  });
}

export async function componentCount(driver: Driver): Promise<number> {
  try {
    return await runSerializedUiOperation(async () => {
      const allComponents = await driver.findComponents(ON.type('*'));
      const count = allComponents ? allComponents.length : 0;
      hilog.info(0x0000, 'testTag', '%{public}s', `componentCount: ${count}`);
      return count;
    });
  } catch (error) {
    hilog.error(0x0000, 'testTag', '%{public}s', `componentCount error: ${error}`);
    return 0;
  }
}

export async function checkComponentExists(driver: Driver, type: string): Promise<boolean> {
  try {
    return await runSerializedUiOperation(async () => {
      const components = await driver.findComponents(ON.type(type));
      const exists = components !== null && components !== undefined && components.length > 0;
      hilog.info(0x0000, 'testTag', '%{public}s',
        `checkComponentExists: type=${type} exists=${exists}`);
      return exists;
    });
  } catch (error) {
    hilog.error(0x0000, 'testTag', '%{public}s', `checkComponentExists error: ${error}`);
    return false;
  }
}

export async function checkTextContent(driver: Driver, expectedText: string): Promise<boolean> {
  try {
    return await runSerializedUiOperation(async () => {
      const texts = await driver.findComponents(ON.type('Text')) ?? [];
      if (texts.length === 0) {
        hilog.info(0x0000, 'testTag', '%{public}s', `checkTextContent: no text components`);
        return false;
      }
      for (const text of texts) {
        try {
          const content = await text.getText();
          if (content === expectedText) {
            return true;
          }
        } catch (e) {
          hilog.info(0x0000, 'testTag', '%{public}s', `checkTextContent: getText skipped`);
        }
      }
      return false;
    });
  } catch (error) {
    hilog.error(0x0000, 'testTag', '%{public}s', `checkTextContent error: ${error}`);
    return false;
  }
}

export async function checkTextContains(driver: Driver, expectedText: string): Promise<boolean> {
  try {
    return await runSerializedUiOperation(async () => {
      const texts = await driver.findComponents(ON.type('Text')) ?? [];
      for (const text of texts) {
        try {
          const content = await text.getText();
          if (content !== undefined && content !== null && content.indexOf(expectedText) >= 0) {
            return true;
          }
        } catch (e) {
          hilog.info(0x0000, 'testTag', '%{public}s', `checkTextContains: getText skipped`);
        }
      }
      return false;
    });
  } catch (error) {
    hilog.error(0x0000, 'testTag', '%{public}s', `checkTextContains error: ${error}`);
    return false;
  }
}

export async function waitForComponentByType(driver: Driver, type: string,
  maxWaitMs: number = TIMEOUT_PAGE_RENDER): Promise<boolean> {
  const deadline = Date.now() + maxWaitMs;
  while (Date.now() < deadline) {
    const exists = await checkComponentExists(driver, type);
    if (exists) {
      return true;
    }
    await serializedDelay(driver, 100);
  }
  return false;
}

export async function waitForText(driver: Driver, expectedText: string,
  maxWaitMs: number = TIMEOUT_PAGE_RENDER): Promise<boolean> {
  const deadline = Date.now() + maxWaitMs;
  while (Date.now() < deadline) {
    const found = await checkTextContains(driver, expectedText);
    if (found) {
      return true;
    }
    await serializedDelay(driver, 100);
  }
  return false;
}

export function allowedIndex(index: number, length: number): boolean {
  return index >= 0 && index < length;
}

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
            return i;
          }
        } catch (e) {
          hilog.info(0x0000, 'testTag', '%{public}s', `focus scan skipped index ${i}`);
        }
      }
      return -1;
    });
  } catch (error) {
    hilog.error(0x0000, 'testTag', '%{public}s', `getCurrentFocusIndex error: ${error}`);
    return -1;
  }
}

export async function checkFocusState(driver: Driver, expectedFocusedIndex: number): Promise<boolean> {
  const retryIntervalMs = 100;
  const deadline = Date.now() + TIMEOUT_FOCUS_CHANGE;
  while (Date.now() < deadline) {
    try {
      const result = await runSerializedUiOperation(async () => {
        const allComponents: Component[] = await driver.findComponents(ON.type('*')) ?? [];
        if (expectedFocusedIndex === -1) {
          if (allComponents.length === 0) {
            return false;
          }
          for (const component of allComponents) {
            try {
              if (await component.isFocused()) {
                return true;
              }
            } catch (e) {
              hilog.info(0x0000, 'testTag', '%{public}s', `checkFocusState skip`);
            }
          }
          return false;
        }
        if (allowedIndex(expectedFocusedIndex, allComponents.length)) {
          try {
            return await allComponents[expectedFocusedIndex].isFocused();
          } catch (e) {
            return false;
          }
        }
        return false;
      });
      if (result) {
        return true;
      }
    } catch (error) {
      hilog.error(0x0000, 'testTag', '%{public}s', `checkFocusState error: ${error}`);
    }
    await serializedDelay(driver, retryIntervalMs);
  }
  return false;
}

export async function simulateTouch(driver: Driver, x: number, y: number): Promise<void> {
  await runSerializedUiOperation(async () => {
    await driver.click(x, y);
    await driver.delayMs(DELAY_TOUCH_EVENT);
  });
}

export async function pressAndWait(driver: Driver, key: number, times: number = 1,
  delayMs: number = DELAY_KEY_NAVIGATION): Promise<void> {
  await runSerializedUiOperation(async () => {
    for (let i = 0; i < times; i++) {
      await driver.triggerKey(key);
      await driver.delayMs(delayMs);
    }
  });
}

export async function scrollToBottom(driver: Driver, duration: number = 2000): Promise<void> {
  try {
    await runSerializedUiOperation(async () => {
      const scroll = await driver.findComponent(ON.type('Scroll'));
      if (scroll !== null && scroll !== undefined) {
        await scroll.scrollToBottom(duration);
      }
    });
  } catch (error) {
    hilog.error(0x0000, 'testTag', '%{public}s', `scrollToBottom error: ${error}`);
  }
}

export async function launchMainAbility(): Promise<void> {
  const delegator = abilityDelegatorRegistry.getAbilityDelegator();
  const aWant: Want = {
    bundleName: BUNDLE_NAME,
    abilityName: ABILITY_MAIN
  };
  await delegator.startAbility(aWant);
  hilog.info(0x0000, 'testTag', '%{public}s', `launchMainAbility done`);
}

export async function launchNamedAbility(abilityName: string): Promise<void> {
  const delegator = abilityDelegatorRegistry.getAbilityDelegator();
  const aWant: Want = {
    bundleName: BUNDLE_NAME,
    abilityName: abilityName,
    moduleName: MODULE_ENTRY
  };
  await delegator.startAbility(aWant);
  hilog.info(0x0000, 'testTag', '%{public}s', `launchNamedAbility ${abilityName}`);
}

export async function ensureAppReady(driver: Driver): Promise<boolean> {
  await serializedDelay(driver, DELAY_AFTER_OPERATION);
  const ready = await checkComponentExists(driver, 'Scroll');
  if (!ready) {
    await launchMainAbility();
    await serializedDelay(driver, TIMEOUT_PAGE_RENDER);
  }
  return true;
}

export function buildDataShareUri(table: string): string {
  if (table === undefined || table === null || table.length === 0) {
    return DATA_SHARE_URI;
  }
  return `${DATA_SHARE_URI}/${table}`;
}

export function normalizeDataShareUri(uri: string): string {
  if (uri === undefined || uri === null) {
    return '';
  }
  let normalized = uri.trim();
  while (normalized.length > 1 && normalized.endsWith('/')) {
    normalized = normalized.substring(0, normalized.length - 1);
  }
  return normalized;
}

export function isSampleDataShareUri(uri: string): boolean {
  return normalizeDataShareUri(uri).indexOf('ohos.samples.stagemodel.DataShare') >= 0;
}

export function deepEqualScalar(left: string | number | boolean | null | undefined,
  right: string | number | boolean | null | undefined): boolean {
  if (left === undefined || left === null) {
    return right === undefined || right === null;
  }
  return left === right;
}

export function minNumber(a: number, b: number): number {
  return a < b ? a : b;
}

export function maxNumber(a: number, b: number): number {
  return a > b ? a : b;
}

export function clampNumber(value: number, low: number, high: number): number {
  if (value < low) {
    return low;
  }
  if (value > high) {
    return high;
  }
  return value;
}

export function isNonEmptyString(value: string): boolean {
  return value !== undefined && value !== null && value.trim().length > 0;
}

export function isValidBookId(id: number): boolean {
  return Number.isInteger(id) && id > 0;
}

export function safeDiv(numerator: number, denominator: number): number {
  if (denominator === 0) {
    return 0;
  }
  return numerator / denominator;
}

export function formatPercent(value: number, total: number): string {
  const ratio = safeDiv(value, total) * 100;
  return `${Math.round(ratio)}%`;
}

export function containsIgnoreCase(source: string, target: string): boolean {
  if (source === undefined || source === null || target === undefined || target === null) {
    return false;
  }
  return source.toLowerCase().indexOf(target.toLowerCase()) >= 0;
}

export function joinPath(base: string, segment: string): string {
  if (base === undefined || base === null || base.length === 0) {
    return segment ?? '';
  }
  if (segment === undefined || segment === null || segment.length === 0) {
    return base;
  }
  if (base.endsWith('/')) {
    return `${base}${segment}`;
  }
  return `${base}/${segment}`;
}

export function parseTableFromUri(uri: string): string {
  const normalized = normalizeDataShareUri(uri);
  if (normalized.length === 0) {
    return '';
  }
  const index = normalized.lastIndexOf('/');
  if (index < 0 || index === normalized.length - 1) {
    return '';
  }
  return normalized.substring(index + 1);
}

export function isValidUriScheme(uri: string): boolean {
  if (uri === undefined || uri === null) {
    return false;
  }
  return uri.startsWith('datashare://') || uri.startsWith('file://') || uri.startsWith('http://') ||
    uri.startsWith('https://');
}

export function sumNumbers(values: number[]): number {
  if (values === undefined || values === null) {
    return 0;
  }
  let total = 0;
  for (const value of values) {
    if (typeof value === 'number' && !Number.isNaN(value)) {
      total += value;
    }
  }
  return total;
}

export function averageNumbers(values: number[]): number {
  if (values === undefined || values === null || values.length === 0) {
    return 0;
  }
  return safeDiv(sumNumbers(values), values.length);
}

export function uniqueStrings(values: string[]): string[] {
  const result: string[] = [];
  if (values === undefined || values === null) {
    return result;
  }
  for (const value of values) {
    if (value !== undefined && value !== null && result.indexOf(value) < 0) {
      result.push(value);
    }
  }
  return result;
}

export function truncate(value: string, maxLength: number): string {
  if (value === undefined || value === null) {
    return '';
  }
  if (maxLength <= 0 || value.length <= maxLength) {
    return value;
  }
  return value.substring(0, maxLength);
}

export function repeatString(value: string, times: number): string {
  if (value === undefined || value === null || times <= 0) {
    return '';
  }
  let result = '';
  for (let i = 0; i < times; i++) {
    result += value;
  }
  return result;
}
