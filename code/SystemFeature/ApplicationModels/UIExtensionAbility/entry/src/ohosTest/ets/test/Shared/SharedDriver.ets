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

const DEFAULT_DOMAIN: number = 0xFF00;
const TAG: string = 'UIExtensionSharedDriver';

export const KEY_ENTER: number = 2049;
export const KEY_BACK: number = 2;
export const KEY_HOME: number = 3;
export const KEY_UP: number = 2012;
export const KEY_DOWN: number = 2013;
export const KEY_LEFT: number = 2014;
export const KEY_RIGHT: number = 2015;

export const KEYCODE_MIN: number = 1;
export const KEYCODE_MAX: number = 3000;

export const TIMEOUT_SESSION_CREATE: number = 1000;
export const TIMEOUT_EXTENSION_RENDER: number = 1000;
export const TIMEOUT_FOCUS_CHANGE: number = 500;
export const TIMEOUT_PROXY_READY: number = 2000;

export const DELAY_KEY_NAVIGATION: number = 50;
export const DELAY_TOUCH_EVENT: number = 100;
export const DELAY_AFTER_LAUNCH: number = 500;

export const TOLERANCE_COMPONENT_COUNT: number = 3;
export const TOLERANCE_FOCUS_CHANGE: number = 2;

export const STRESS_ROUNDS_NAVIGATION: number = 20;
export const STRESS_ROUNDS_LIFECYCLE: number = 10;

export const PROVIDER_BUNDLE: string = 'com.samples.uiextensionability';
export const PROVIDER_ABILITY: string = 'UIExtensionProvider';
export const PROVIDER_MODULE: string = 'entry';
export const PROVIDER_TYPE: string = 'sys/commonUI';
export const PROVIDER_LABEL: string = 'UIExtension provider';
export const PAGE_SHOW_EVENT: string = 'page_show';

let _driver: Driver | null = null;
let _uiOperationQueue: Promise<void> = Promise.resolve();

export async function runSerializedUiOperation<T>(action: () => Promise<T>): Promise<T> {
  const currentQueue: Promise<void> = _uiOperationQueue;
  const result: T = await new Promise<T>((resolve: (value: T) => void, reject: (reason: Error) => void) => {
    _uiOperationQueue = currentQueue.then(async () => {
      try {
        const actionResult: T = await action();
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
}

export function clampValue(value: number, min: number, max: number): number {
  if (value < min) {
    return min;
  }
  if (value > max) {
    return max;
  }
  return value;
}

export function safeDivide(a: number, b: number): number {
  if (b === 0) {
    return 0;
  }
  return a / b;
}

export function averageOf(values: number[]): number {
  if (values.length === 0) {
    return 0;
  }
  let sum: number = 0;
  for (let i = 0; i < values.length; i++) {
    sum += values[i];
  }
  return sum / values.length;
}

export function maxOf(values: number[]): number {
  if (values.length === 0) {
    return 0;
  }
  let max: number = values[0];
  for (let i = 1; i < values.length; i++) {
    if (values[i] > max) {
      max = values[i];
    }
  }
  return max;
}

export function minOf(values: number[]): number {
  if (values.length === 0) {
    return 0;
  }
  let min: number = values[0];
  for (let i = 1; i < values.length; i++) {
    if (values[i] < min) {
      min = values[i];
    }
  }
  return min;
}

export function computeSuccessRate(success: number, total: number): number {
  if (total <= 0) {
    return 0;
  }
  return success / total;
}

export function isValidKeyCode(key: number): boolean {
  return key >= KEYCODE_MIN && key <= KEYCODE_MAX;
}

export function isNonEmptyText(text: string): boolean {
  return text.length > 0;
}

export function isWithinRange(value: number, min: number, max: number): boolean {
  return value >= min && value <= max;
}

export function normalizeText(text: string): string {
  return text.trim();
}

export function formatTag(prefix: string, suffix: string): string {
  return '[' + prefix + '] ' + suffix;
}

export function hashString(text: string): number {
  let hash: number = 0;
  for (let i = 0; i < text.length; i++) {
    hash = ((hash << 5) - hash) + text.charCodeAt(i);
    hash = hash | 0;
  }
  return hash;
}

export function countOccurrences(text: string, target: string): number {
  if (target.length === 0) {
    return 0;
  }
  let count: number = 0;
  let index: number = text.indexOf(target);
  while (index >= 0) {
    count++;
    index = text.indexOf(target, index + target.length);
  }
  return count;
}

export function uniqueValues(values: string[]): string[] {
  const result: string[] = [];
  for (let i = 0; i < values.length; i++) {
    if (result.indexOf(values[i]) < 0) {
      result.push(values[i]);
    }
  }
  return result;
}

export function percentOf(part: number, total: number): number {
  return clampValue(safeDivide(part, total) * 100, 0, 100);
}

export function logInfo(message: string): void {
  hilog.info(DEFAULT_DOMAIN, TAG, '%{public}s', message);
}

export function logError(message: string): void {
  hilog.error(DEFAULT_DOMAIN, TAG, '%{public}s', message);
}

export function describeError(error: Error): string {
  return error.message.length === 0 ? 'unknown error' : error.message;
}

export async function findComponentsByType(driver: Driver, type: string): Promise<Component[]> {
  return await runSerializedUiOperation(async (): Promise<Component[]> => {
    const components: Component[] = await driver.findComponents(ON.type(type));
    return components === undefined || components === null ? [] : components;
  });
}

export async function checkComponentExists(driver: Driver, type: string): Promise<boolean> {
  try {
    const components: Component[] = await findComponentsByType(driver, type);
    return components.length > 0;
  } catch (error) {
    logError('checkComponentExists failed: ' + String(error));
    return false;
  }
}

export async function extensionComponentCount(driver: Driver): Promise<number> {
  try {
    return await runSerializedUiOperation(async (): Promise<number> => {
      const allComponents: Component[] = await driver.findComponents(ON.type('*'));
      const count: number = allComponents === undefined || allComponents === null ? 0 : allComponents.length;
      logInfo('extensionComponentCount observed: ' + count);
      return count;
    });
  } catch (error) {
    logError('extensionComponentCount failed: ' + String(error));
    return 0;
  }
}

export async function checkTextContent(driver: Driver, expectedText: string): Promise<boolean> {
  try {
    return await runSerializedUiOperation(async (): Promise<boolean> => {
      const texts: Component[] = await driver.findComponents(ON.type('Text'));
      if (texts === undefined || texts === null || texts.length === 0) {
        return false;
      }
      for (let i = 0; i < texts.length; i++) {
        try {
          const content: string = await texts[i].getText();
          if (content === expectedText) {
            return true;
          }
        } catch (error) {
          logInfo('checkTextContent skip component ' + i);
        }
      }
      return false;
    });
  } catch (error) {
    logError('checkTextContent failed: ' + String(error));
    return false;
  }
}

export async function findTextByLabel(driver: Driver, label: string): Promise<Component | null> {
  try {
    return await runSerializedUiOperation(async (): Promise<Component | null> => {
      const texts: Component[] = await driver.findComponents(ON.type('Text'));
      if (texts === undefined || texts === null) {
        return null;
      }
      for (let i = 0; i < texts.length; i++) {
        try {
          const content: string = await texts[i].getText();
          if (content === label) {
            return texts[i];
          }
        } catch (error) {
          logInfo('findTextByLabel skip component ' + i);
        }
      }
      return null;
    });
  } catch (error) {
    logError('findTextByLabel failed: ' + String(error));
    return null;
  }
}

export async function isExtensionVisible(driver: Driver): Promise<boolean> {
  return await checkTextContent(driver, PROVIDER_LABEL);
}

export async function waitForExtensionStable(driver: Driver,
  maxWaitMs: number = TIMEOUT_EXTENSION_RENDER): Promise<boolean> {
  const deadline: number = Date.now() + maxWaitMs;
  while (Date.now() < deadline) {
    const visible: boolean = await isExtensionVisible(driver);
    if (visible) {
      logInfo('extension render event observed');
      return true;
    }
    await serializedDelay(driver, 100);
  }
  logInfo('extension render event timeout: ' + maxWaitMs);
  return false;
}

export async function launchProviderApp(): Promise<void> {
  const delegator = abilityDelegatorRegistry.getAbilityDelegator();
  const args = abilityDelegatorRegistry.getArguments();
  const want: Want = {
    bundleName: args.bundleName,
    abilityName: 'EntryAbility'
  };
  await delegator.startAbility(want);
}

export async function triggerExtension(driver: Driver): Promise<void> {
  await serializedDelay(driver, DELAY_AFTER_LAUNCH);
  const visible: boolean = await isExtensionVisible(driver);
  if (!visible) {
    await launchProviderApp();
  }
  await serializedDelay(driver, DELAY_AFTER_LAUNCH);
  logInfo('extension provider triggered');
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

export async function simulateTouch(driver: Driver, x: number, y: number): Promise<void> {
  await runSerializedUiOperation(async () => {
    await driver.click(x, y);
    await driver.delayMs(DELAY_TOUCH_EVENT);
  });
}

export async function getCurrentFocusIndex(driver: Driver): Promise<number> {
  try {
    return await runSerializedUiOperation(async (): Promise<number> => {
      const allComponents: Component[] = await driver.findComponents(ON.type('*'));
      if (allComponents === undefined || allComponents === null) {
        return -1;
      }
      for (let i = 0; i < allComponents.length; i++) {
        try {
          const focused: boolean = await allComponents[i].isFocused();
          if (focused) {
            return i;
          }
        } catch (error) {
          logInfo('getCurrentFocusIndex skip component ' + i);
        }
      }
      return -1;
    });
  } catch (error) {
    logError('getCurrentFocusIndex failed: ' + String(error));
    return -1;
  }
}

export async function checkFocusState(driver: Driver, expectedIndex: number): Promise<boolean> {
  const deadline: number = Date.now() + TIMEOUT_FOCUS_CHANGE;
  while (Date.now() < deadline) {
    if (expectedIndex < 0) {
      const index: number = await getCurrentFocusIndex(driver);
      if (index >= 0) {
        return true;
      }
    } else {
      const index: number = await getCurrentFocusIndex(driver);
      if (index === expectedIndex) {
        return true;
      }
    }
    await serializedDelay(driver, 100);
  }
  return false;
}

export async function logComponentSummary(driver: Driver): Promise<void> {
  const texts: Component[] = await findComponentsByType(driver, 'Text');
  const images: Component[] = await findComponentsByType(driver, 'Image');
  const buttons: Component[] = await findComponentsByType(driver, 'Button');
  logInfo('texts=' + texts.length + ' images=' + images.length + ' buttons=' + buttons.length);
}

export function sumOf(values: number[]): number {
  let sum: number = 0;
  for (let i = 0; i < values.length; i++) {
    sum += values[i];
  }
  return sum;
}

export function medianOf(values: number[]): number {
  if (values.length === 0) {
    return 0;
  }
  const sorted: number[] = values.slice().sort((a: number, b: number) => a - b);
  const middle: number = Math.floor(sorted.length / 2);
  if (sorted.length % 2 === 0) {
    return (sorted[middle - 1] + sorted[middle]) / 2;
  }
  return sorted[middle];
}

export function varianceOf(values: number[]): number {
  if (values.length === 0) {
    return 0;
  }
  const mean: number = averageOf(values);
  let total: number = 0;
  for (let i = 0; i < values.length; i++) {
    const diff: number = values[i] - mean;
    total += diff * diff;
  }
  return total / values.length;
}

export function stdDevOf(values: number[]): number {
  return Math.sqrt(varianceOf(values));
}

export function repeatText(text: string, times: number): string {
  let result: string = '';
  for (let i = 0; i < times; i++) {
    result += text;
  }
  return result;
}

export function splitLines(text: string): string[] {
  if (text.length === 0) {
    return [];
  }
  return text.split('\n');
}

export function joinValues(values: string[], separator: string): string {
  let result: string = '';
  for (let i = 0; i < values.length; i++) {
    if (i > 0) {
      result += separator;
    }
    result += values[i];
  }
  return result;
}

export function safeJsonStringify(value: string): string {
  return '{"value":"' + value + '"}';
}

export function buildWantParameters(type: string, moduleName: string): Map<string, string> {
  const map: Map<string, string> = new Map<string, string>();
  map.set('ability.want.params.uiExtensionType', type);
  map.set('ability.want.params.uiExtensionModuleName', moduleName);
  return map;
}

export function buildSessionId(prefix: string, index: number): string {
  return prefix + '_' + String(index);
}

export function parseReleaseCode(payload: string): number {
  const value: number = Number(payload);
  if (Number.isNaN(value)) {
    return -1;
  }
  return value;
}

export function isValidBundleName(name: string): boolean {
  return name.length > 0 && name.indexOf('.') > 0;
}

export function isValidModuleName(name: string): boolean {
  return name.length > 0 && name.indexOf(' ') < 0;
}

export function formatPercent(value: number): string {
  return String(clampValue(value, 0, 100)) + '%';
}

export function indexOfValue(values: string[], target: string): number {
  return values.indexOf(target);
}

export function removeAt(values: string[], index: number): string[] {
  const result: string[] = [];
  for (let i = 0; i < values.length; i++) {
    if (i !== index) {
      result.push(values[i]);
    }
  }
  return result;
}

export function truncate(text: string, maxLength: number): string {
  if (text.length <= maxLength) {
    return text;
  }
  return text.substring(0, maxLength);
}

export async function waitUntil(predicate: () => boolean, maxWaitMs: number): Promise<boolean> {
  const deadline: number = Date.now() + maxWaitMs;
  while (Date.now() < deadline) {
    if (predicate()) {
      return true;
    }
    await new Promise<void>((resolve: () => void) => {
      setTimeout(resolve, 50);
    });
  }
  return predicate();
}

export function compareInts(a: number, b: number): number {
  if (a < b) {
    return -1;
  }
  if (a > b) {
    return 1;
  }
  return 0;
}

export function describeSessionCount(active: number, total: number): string {
  return 'active=' + active + ' total=' + total;
}

export function isSessionHealthy(active: number, total: number): boolean {
  return total >= 0 && active >= 0 && active <= total;
}

export function extensionPhaseLabel(phase: string): string {
  if (phase.length === 0) {
    return 'unknown';
  }
  return 'phase:' + phase;
}

export function toSafeNumber(value: string, fallback: number): number {
  const parsed: number = Number(value);
  if (Number.isNaN(parsed)) {
    return fallback;
  }
  return parsed;
}

let _yieldCounter: number = 0;

export async function maybeYield(interval: number = 50): Promise<void> {
  _yieldCounter++;
  if (_yieldCounter % interval === 0) {
    await new Promise<void>((resolve: () => void) => {
      setTimeout(() => {
        resolve();
      }, 0);
    });
  }
}


