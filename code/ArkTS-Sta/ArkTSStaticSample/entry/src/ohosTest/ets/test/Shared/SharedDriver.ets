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

import { Driver, ON, Component, Rect } from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import Want from '@ohos.app.ability.Want';
import hilog from '@ohos.hilog';

export const KEY_LEFT: number = 2014;
export const KEY_RIGHT: number = 2015;
export const KEY_UP: number = 2012;
export const KEY_DOWN: number = 2013;
export const KEY_ENTER: number = 2049;
export const KEY_BACK: number = 2;
export const TIMEOUT_PAGE_RENDER: number = 60000;
export const TIMEOUT_FOCUS_CHANGE: number = 1000;
export const DELAY_KEY_NAVIGATION: number = 50;
export const DELAY_TOUCH_EVENT: number = 100;
export const SAMPLE_TITLES: string[] = ['\u5361\u7247 1', '\u5361\u7247 2', '\u5361\u7247 3'];

let driverInstance: Driver | undefined = undefined;
let operationQueue: Promise<void> = Promise.resolve();
let pendingOperations: number = 0;
let completedOperations: number = 0;
let failedOperations: number = 0;
let backgroundedSample: UIAbility | undefined = undefined;

export interface QueueSnapshot {
  pending: number;
  completed: number;
  failed: number;
}

export interface TextSnapshot {
  text: string;
  bounds: Rect;
  enabled: boolean;
  focused: boolean;
}

export interface PageSnapshot {
  titles: string[];
  cards: number;
  hasList: boolean;
  hasHeading: boolean;
}

// Preserve the reference queue while allowing later operations after rejection.
// Actions inside the queue call UiTest directly; re-entering this queue would deadlock.
export function runSerializedUiOperation<T>(action: () => Promise<T>): Promise<T> {
  pendingOperations++;
  const result = operationQueue.then(action);
  operationQueue = result.then(() => {
    pendingOperations--;
    completedOperations++;
  }, (error: Error) => {
    pendingOperations--;
    failedOperations++;
    hilog.error(0x0000, 'ArkTSStaticTest', 'UI operation failed: %{public}s', error.message);
  });
  return result;
}

export function getDriver(): Driver {
  if (driverInstance === undefined) {
    driverInstance = Driver.create();
  }
  return driverInstance;
}

export function queueSnapshot(): QueueSnapshot {
  return {
    pending: pendingOperations,
    completed: completedOperations,
    failed: failedOperations
  };
}

export async function drainUiOperations(): Promise<void> {
  await operationQueue;
}

export async function resetDriver(): Promise<void> {
  await drainUiOperations();
  driverInstance = undefined;
  completedOperations = 0;
  failedOperations = 0;
}

export async function serializedDelay(driver: Driver, delayMs: number): Promise<void> {
  if (delayMs < 0) {
    throw new Error('Delay must be non-negative');
  }
  await runSerializedUiOperation(async () => {
    await driver.delayMs(delayMs);
  });
}

export async function triggerSerializedKey(driver: Driver, key: number): Promise<void> {
  await runSerializedUiOperation(async () => {
    await driver.triggerKey(key);
  });
}

export async function pressAndWait(
  driver: Driver,
  key: number,
  times: number = 1,
  delayMs: number = DELAY_KEY_NAVIGATION
): Promise<void> {
  if (times < 0 || delayMs < 0) {
    throw new Error('Repeat count and delay must be non-negative');
  }
  await runSerializedUiOperation(async () => {
    for (let index = 0; index < times; index++) {
      await driver.triggerKey(key);
      await driver.delayMs(delayMs);
    }
  });
}

export async function findComponentsByType(driver: Driver, type: string): Promise<Component[]> {
  return runSerializedUiOperation(async () => {
    return await driver.findComponents(ON.type(type)) ?? [];
  });
}

export async function checkComponentExists(driver: Driver, type: string): Promise<boolean> {
  const components = await findComponentsByType(driver, type);
  return components.length > 0;
}

export async function requireText(driver: Driver, text: string): Promise<Component> {
  return runSerializedUiOperation(async () => {
    const component = await driver.findComponent(ON.text(text));
    if (component === undefined || component === null) {
      throw new Error('Expected text component is missing');
    }
    return component;
  });
}

export async function checkTextContent(driver: Driver, expectedText: string): Promise<boolean> {
  return runSerializedUiOperation(async () => {
    const component = await driver.findComponent(ON.text(expectedText));
    return component !== undefined && component !== null;
  });
}

export async function readText(component: Component): Promise<string> {
  return runSerializedUiOperation(async () => {
    return component.getText();
  });
}

export async function componentEnabled(component: Component): Promise<boolean> {
  return runSerializedUiOperation(async () => {
    return component.isEnabled();
  });
}

export async function componentFocused(component: Component): Promise<boolean> {
  return runSerializedUiOperation(async () => {
    return component.isFocused();
  });
}

export async function componentBounds(component: Component): Promise<Rect> {
  return runSerializedUiOperation(async () => {
    return component.getBounds();
  });
}

export async function textBounds(driver: Driver, text: string): Promise<Rect> {
  const component = await requireText(driver, text);
  return componentBounds(component);
}

export async function interactWithComponent(component: Component, action: string): Promise<void> {
  await runSerializedUiOperation(async () => {
    switch (action) {
      case 'click':
        await component.click();
        break;
      case 'doubleClick':
        await component.doubleClick();
        break;
      case 'longClick':
        await component.longClick();
        break;
      default:
        throw new Error('Unsupported component action: ' + action);
    }
  });
}

export async function simulateTouch(driver: Driver, x: number, y: number): Promise<void> {
  await runSerializedUiOperation(async () => {
    await driver.click(x, y);
    await driver.delayMs(DELAY_TOUCH_EVENT);
  });
}

export async function touchTextCenter(driver: Driver, text: string): Promise<void> {
  const bounds = await textBounds(driver, text);
  const centerX = Math.floor((bounds.left + bounds.right) / 2);
  const centerY = Math.floor((bounds.top + bounds.bottom) / 2);
  await simulateTouch(driver, centerX, centerY);
}

export async function sampleCardCount(driver: Driver): Promise<number> {
  const components = await findComponentsByType(driver, 'ListItem');
  return components.length;
}

export async function readVisibleTexts(driver: Driver): Promise<string[]> {
  return runSerializedUiOperation(async () => {
    const texts = await driver.findComponents(ON.type('Text')) ?? [];
    const contents: string[] = [];
    for (const component of texts) {
      contents.push(await component.getText());
    }
    return contents;
  });
}

export async function readSampleTitles(driver: Driver): Promise<string[]> {
  const visible = await readVisibleTexts(driver);
  return visible.filter((text: string) => SAMPLE_TITLES.indexOf(text) >= 0);
}

export async function isSampleVisible(driver: Driver): Promise<boolean> {
  const titles = await readSampleTitles(driver);
  if (titles.length !== SAMPLE_TITLES.length) {
    return false;
  }
  for (let index = 0; index < SAMPLE_TITLES.length; index++) {
    if (titles[index] !== SAMPLE_TITLES[index]) {
      return false;
    }
  }
  return checkTextContent(driver, 'Hello 0');
}

export async function waitForSampleStable(
  driver: Driver,
  maxWaitMs: number = TIMEOUT_PAGE_RENDER
): Promise<boolean> {
  const deadline = Date.now() + maxWaitMs;
  let stableReads: number = 0;
  while (Date.now() <= deadline) {
    try {
      stableReads = await isSampleVisible(driver) ? stableReads + 1 : 0;
      if (stableReads >= 3) {
        return true;
      }
    } catch (error) {
      // A transition can invalidate UiTest handles between lookup and getText.
      if ((error as BusinessError).code !== 17000004) {
        throw error as Error;
      }
      stableReads = 0;
      hilog.debug(0x0000, 'ArkTSStaticTest', 'Retrying UI lookup after a transition');
    }
    await serializedDelay(driver, 100);
  }
  return false;
}

export async function launchSampleApp(): Promise<void> {
  const delegator = abilityDelegatorRegistry.getAbilityDelegator();
  const args = abilityDelegatorRegistry.getArguments();
  const want: Want = {
    bundleName: args.bundleName,
    abilityName: 'EntryAbility'
  };
  await delegator.startAbility(want);
}

export async function ensureSampleVisible(driver: Driver): Promise<void> {
  if (await isSampleVisible(driver)) {
    return;
  }
  await launchSampleApp();
  const ready = await waitForSampleStable(driver);
  if (!ready) {
    const texts = await readVisibleTexts(driver);
    hilog.error(0x0000, 'ArkTSStaticTest', 'Sample rendering timed out; text count: %{public}d', texts.length);
    throw new Error('EntryAbility did not render the expected sample cards');
  }
}

export async function captureTextSnapshot(driver: Driver, text: string): Promise<TextSnapshot> {
  const component = await requireText(driver, text);
  return runSerializedUiOperation(async () => {
    const snapshot: TextSnapshot = {
      text: await component.getText(),
      bounds: await component.getBounds(),
      enabled: await component.isEnabled(),
      focused: await component.isFocused()
    };
    return snapshot;
  });
}

export async function capturePageSnapshot(driver: Driver): Promise<PageSnapshot> {
  return {
    titles: await readSampleTitles(driver),
    cards: await sampleCardCount(driver),
    hasList: await checkComponentExists(driver, 'List'),
    hasHeading: await checkTextContent(driver, 'Hello 0')
  };
}

export function sameTitles(first: string[], second: string[]): boolean {
  if (first.length !== second.length) {
    return false;
  }
  for (let index = 0; index < first.length; index++) {
    if (first[index] !== second[index]) {
      return false;
    }
  }
  return true;
}

export function samePageContent(first: PageSnapshot, second: PageSnapshot): boolean {
  return first.cards === second.cards &&
    first.hasList === second.hasList &&
    first.hasHeading === second.hasHeading &&
    sameTitles(first.titles, second.titles);
}

export async function checkFocusState(driver: Driver, expectedFocusedIndex: number): Promise<boolean> {
  const deadline = Date.now() + TIMEOUT_FOCUS_CHANGE;
  while (Date.now() <= deadline) {
    const index = await getCurrentFocusIndex(driver);
    if (expectedFocusedIndex < 0 ? index >= 0 : index === expectedFocusedIndex) {
      return true;
    }
    await serializedDelay(driver, 50);
  }
  return false;
}

export async function getCurrentFocusIndex(driver: Driver): Promise<number> {
  return runSerializedUiOperation(async () => {
    const texts = await driver.findComponents(ON.type('Text')) ?? [];
    for (let index = 0; index < texts.length; index++) {
      if (await texts[index].isFocused()) {
        return index;
      }
    }
    return -1;
  });
}

export async function waitForText(
  driver: Driver,
  text: string,
  maxWaitMs: number = TIMEOUT_PAGE_RENDER
): Promise<Component> {
  const deadline = Date.now() + maxWaitMs;
  while (Date.now() <= deadline) {
    if (await checkTextContent(driver, text)) {
      return requireText(driver, text);
    }
    await serializedDelay(driver, 100);
  }
  throw new Error('Text did not appear before the deadline');
}

export async function waitForTextAbsent(
  driver: Driver,
  text: string,
  maxWaitMs: number = TIMEOUT_PAGE_RENDER
): Promise<boolean> {
  const deadline = Date.now() + maxWaitMs;
  while (Date.now() <= deadline) {
    if (!await checkTextContent(driver, text)) {
      return true;
    }
    await serializedDelay(driver, 100);
  }
  return false;
}

export async function inspectSampleCards(driver: Driver): Promise<TextSnapshot[]> {
  const snapshots: TextSnapshot[] = [];
  for (const title of SAMPLE_TITLES) {
    snapshots.push(await captureTextSnapshot(driver, title));
  }
  return snapshots;
}

export function hasPositiveBounds(snapshot: TextSnapshot): boolean {
  return snapshot.bounds.right > snapshot.bounds.left &&
    snapshot.bounds.bottom > snapshot.bounds.top;
}

export function isVerticallyOrdered(snapshots: TextSnapshot[]): boolean {
  for (let index = 1; index < snapshots.length; index++) {
    if (snapshots[index].bounds.top < snapshots[index - 1].bounds.top) {
      return false;
    }
  }
  return true;
}

export async function clickSampleCard(driver: Driver, index: number): Promise<void> {
  if (index < 0 || index >= SAMPLE_TITLES.length) {
    throw new Error('Sample card index is out of range');
  }
  const component = await requireText(driver, SAMPLE_TITLES[index]);
  await interactWithComponent(component, 'click');
}

export async function verifySampleContent(driver: Driver): Promise<void> {
  const page = await capturePageSnapshot(driver);
  if (!sameTitles(page.titles, SAMPLE_TITLES)) {
    throw new Error('Sample title order changed');
  }
  if (page.cards !== SAMPLE_TITLES.length) {
    throw new Error('Unexpected sample card count');
  }
  if (!page.hasList || !page.hasHeading) {
    throw new Error('Sample page structure is incomplete');
  }
}

export async function foregroundSampleAndVerify(driver: Driver): Promise<void> {
  if (backgroundedSample !== undefined) {
    const ability = backgroundedSample;
    const delegator = abilityDelegatorRegistry.getAbilityDelegator();
    await delegator.doAbilityForeground(ability);
    await waitForAbilityState(driver, ability, abilityDelegatorRegistry.AbilityLifecycleState.FOREGROUND);
    backgroundedSample = undefined;
  } else {
    await launchSampleApp();
  }
  if (!await waitForSampleStable(driver)) {
    throw new Error('Sample did not become visible after foregrounding');
  }
  await verifySampleContent(driver);
}

export async function backgroundSample(driver: Driver): Promise<void> {
  const delegator = abilityDelegatorRegistry.getAbilityDelegator();
  const ability = await delegator.getCurrentTopAbility();
  if (ability.context.abilityInfo.name !== 'EntryAbility') {
    throw new Error('Expected EntryAbility before backgrounding');
  }
  backgroundedSample = ability;
  await runSerializedUiOperation(async () => {
    await driver.pressHome();
  });
  await waitForAbilityState(driver, ability, abilityDelegatorRegistry.AbilityLifecycleState.BACKGROUND);
  if (!await waitForTextAbsent(driver, 'Hello 0')) {
    throw new Error('Sample remained visible after backgrounding');
  }
}

async function waitForAbilityState(
  driver: Driver,
  ability: UIAbility,
  expected: abilityDelegatorRegistry.AbilityLifecycleState
): Promise<void> {
  const delegator = abilityDelegatorRegistry.getAbilityDelegator();
  const deadline = Date.now() + TIMEOUT_PAGE_RENDER;
  while (Date.now() <= deadline) {
    if (delegator.getAbilityState(ability) === expected) {
      return;
    }
    await serializedDelay(driver, 50);
  }
  throw new Error('Ability lifecycle transition timed out: ' + expected);
}

export async function clickCardsInOrder(driver: Driver, indices: number[]): Promise<void> {
  for (const index of indices) {
    await clickSampleCard(driver, index);
  }
  await verifySampleContent(driver);
}

export async function readCardWidths(driver: Driver): Promise<number[]> {
  const snapshots = await inspectSampleCards(driver);
  const widths: number[] = [];
  for (const snapshot of snapshots) {
    widths.push(snapshot.bounds.right - snapshot.bounds.left);
  }
  return widths;
}

export async function readCardHeights(driver: Driver): Promise<number[]> {
  const snapshots = await inspectSampleCards(driver);
  const heights: number[] = [];
  for (const snapshot of snapshots) {
    heights.push(snapshot.bounds.bottom - snapshot.bounds.top);
  }
  return heights;
}

export function allPositive(values: number[]): boolean {
  if (values.length === 0) {
    return false;
  }
  return values.every((value: number) => value > 0);
}

export async function verifyCardGeometry(driver: Driver): Promise<void> {
  const snapshots = await inspectSampleCards(driver);
  for (const snapshot of snapshots) {
    if (!hasPositiveBounds(snapshot)) {
      throw new Error('Sample card has empty geometry');
    }
  }
  if (!isVerticallyOrdered(snapshots)) {
    throw new Error('Sample cards are not in vertical order');
  }
}
