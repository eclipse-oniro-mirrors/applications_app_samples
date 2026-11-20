'use static'


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

import {
  Driver,
  ON,
  On,
  Component
} from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import hilog from '@ohos.hilog';

const LOG_DOMAIN: int = 0xF001;
const LOG_TAG: string = 'HandleTabsTest';
const TARGET_ABILITY: string = 'EntryAbility';
const TEXT_TYPE: string = 'Text';
const TABS_TYPE: string = 'Tabs';
const TAB_CONTENT_TYPE: string = 'TabContent';

let uiChain: Promise<void> = Promise.resolve();
let driverSlot: Driver | null = null;

export const TAB_PREFIX: string = '页面';

export const TAB_ADD_LABEL: string = '+';

export const TAB_CLOSE_LABEL: string = 'X';

export const INITIAL_TAB_COUNT: int = 2;

export const MAX_TAB_COUNT: int = 4;

export const MIN_REMOVABLE_TAB_COUNT: int = 2;

export const DEFAULT_NEW_PAGE_INDEX: int = 2;

export const FIRST_TAB_TITLE: string = '页面1';

export const SECOND_TAB_TITLE: string = '页面2';

export const THIRD_TAB_TITLE: string = '页面3';

export const FOURTH_TAB_TITLE: string = '页面4';

export const TAB_BAR_WIDTH: int = 360;

export const TAB_BAR_HEIGHT: int = 56;

export const TAB_CONTENT_HEIGHT: int = 296;

export const TAB_ANIMATION_DURATION: int = 400;

export const TAB_DIVIDER_STROKE: int = 2;

export const TAB_ADD_WIDTH_PERCENT: int = 50;

export const TAB_FONT_SIZE: int = 16;

export const TAB_FONT_WEIGHT_SELECTED: int = 500;

export const TAB_FONT_WEIGHT_NORMAL: int = 400;

export const TAB_LINE_HEIGHT: int = 22;

export const TAB_MARGIN_SIDE: int = 13;

export const TAB_MARGIN_TOP: int = 17;

export const TAB_MARGIN_BOTTOM: int = 7;

export const TAB_CLOSE_MARGIN_LEFT: int = 10;

export const TAB_ADD_MARGIN_TOP: int = 18;

export const TAB_BAR_DIVIDER_HEIGHT: int = 1;

export const DEFAULT_FONT_COLOR: string = '#182431';

export const SELECTED_FONT_COLOR: string = '#007DFF';

export const TAB_CONTENT_BACKGROUND: string = '#007DFF';

export const TABS_BACKGROUND: string = '#F1F3F5';

export const ADD_BUTTON_FONT_COLOR: string = '#707070';

export const CLOSE_BUTTON_COLOR: string = 'red';

export const ADD_BUTTON_FONT_SIZE: int = 30;

export const KEY_DPAD_LEFT: int = 2014;

export const KEY_DPAD_RIGHT: int = 2015;

export const KEY_DPAD_UP: int = 2012;

export const KEY_DPAD_DOWN: int = 2013;

export const KEY_ENTER: int = 2049;

export const KEY_BACK: int = 2;

export const KEY_HOME: int = 3;

export const KEY_TAB: int = 4;

export const KEY_SPACE: int = 57;

export const KEY_ESCAPE: int = 1;

export const KEY_MENU: int = 18;

export const TIMEOUT_PANEL_RENDER: int = 1000;

export const RESET_TIMEOUT: int = 5000;

export const RESET_SETTLE: int = 800;

export const RESET_POLL_INTERVAL: int = 250;

export const TIMEOUT_STATE_SETTLE: int = 500;

export const TIMEOUT_TAB_SWITCH: int = 400;

export const TIMEOUT_FOCUS_CHANGE: int = 300;

export const TIMEOUT_COMPONENT_QUERY: int = 800;

export const DELAY_KEY_NAVIGATION: int = 50;

export const DELAY_TOUCH_EVENT: int = 100;

export const DELAY_AFTER_TAB_OPERATION: int = 300;

export const TOLERANCE_TAB_COUNT: int = 1;

export const TOLERANCE_COMPONENT_COUNT: int = 3;

export const STABLE_ROUNDS: int = 1;

export const STABLE_TOLERANCE: int = 3;

export const STRESS_ROUNDS_ADD_REMOVE: int = 10;

export const STRESS_ROUNDS_NAVIGATION: int = 20;

export const STRESS_ROUNDS_COMPONENT_QUERY: int = 30;

export function logInfo(message: string): void {
  hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', message);
}

export function logWarn(message: string): void {
  hilog.warn(LOG_DOMAIN, LOG_TAG, '%{public}s', message);
}

export function logError(message: string): void {
  hilog.error(LOG_DOMAIN, LOG_TAG, '%{public}s', message);
}

export async function runUiTask(action: () => Promise<void>): Promise<void> {
  const previous: Promise<void> = uiChain;
  const next: Promise<void> = previous.then(async (previousValue: void): Promise<void> => {
    await action();
  }, async (previousError: Error): Promise<void> => {
    logWarn('previous ui task failed: ' + previousError.message);
    await action();
  });
  uiChain = next;
  await next;
}

export async function serializedDelay(driver: Driver, durationMs: int): Promise<void> {
  await runUiTask(async (): Promise<void> => {
    await driver.delayMs(durationMs);
  });
}

export async function triggerSerializedKey(driver: Driver, keyCode: int): Promise<void> {
  await runUiTask(async (): Promise<void> => {
    await driver.triggerKey(keyCode);
  });
}

export function getDriver(): Driver {
  if (driverSlot === null) {
    driverSlot = Driver.create();
  }
  const slot: Driver | null = driverSlot;
  if (slot === null) {
    throw new Error('driver unavailable');
  }
  return slot;
}

export function resetDriver(): void {
  driverSlot = null;
}

export function resetUiChain(): void {
  uiChain = Promise.resolve();
}

export async function launchTargetAbility(): Promise<void> {
  const delegator: abilityDelegatorRegistry.AbilityDelegator =
    abilityDelegatorRegistry.getAbilityDelegator();
  const args: abilityDelegatorRegistry.AbilityDelegatorArgs = abilityDelegatorRegistry.getArguments();
  const want: Want = {
    bundleName: args.bundleName,
    abilityName: TARGET_ABILITY
  };
  try {
    await delegator.startAbility(want);
    logInfo('target ability launched');
  } catch (error) {
    logError('failed to launch target ability: ' + error.message);
  }
}

export async function pressAndWait(driver: Driver, keyCode: int, times: int, waitMs: int): Promise<void> {
  for (let round: int = 0; round < times; round++) {
    await triggerSerializedKey(driver, keyCode);
    await serializedDelay(driver, waitMs);
  }
}

export async function safePressKey(driver: Driver, keyCode: int): Promise<boolean> {
  let succeeded: boolean = true;
  try {
    await triggerSerializedKey(driver, keyCode);
    await serializedDelay(driver, DELAY_KEY_NAVIGATION);
  } catch (error) {
    logError('key press failed: ' + error.message);
    succeeded = false;
  }
  return succeeded;
}

export async function clickTextComponent(driver: Driver, label: string, timeoutMs: int): Promise<boolean> {
  let clicked: boolean = false;
  await runUiTask(async (): Promise<void> => {
    const labelOn: On = ON.text(label);
    const target: Component | null = await driver.waitForComponent(labelOn, timeoutMs);
    if (target !== null) {
      await target.click();
      clicked = true;
    }
  });
  return clicked;
}

export async function clickFirstTextComponent(driver: Driver, label: string): Promise<boolean> {
  let clicked: boolean = false;
  await runUiTask(async (): Promise<void> => {
    const labelOn: On = ON.text(label);
    const targets: Component[] | null = await driver.findComponents(labelOn);
    if (targets !== null && targets.length > 0) {
      const first: Component = targets[0];
      await first.click();
      clicked = true;
    }
  });
  return clicked;
}

export async function clickAddButton(driver: Driver): Promise<boolean> {
  const clicked: boolean = await clickFirstTextComponent(driver, TAB_ADD_LABEL);
  await serializedDelay(driver, DELAY_AFTER_TAB_OPERATION);
  return clicked;
}

export async function clickCloseButton(driver: Driver): Promise<boolean> {
  const clicked: boolean = await clickFirstTextComponent(driver, TAB_CLOSE_LABEL);
  await serializedDelay(driver, DELAY_AFTER_TAB_OPERATION);
  return clicked;
}

export async function clickTabTitle(driver: Driver, title: string): Promise<boolean> {
  const clicked: boolean = await clickFirstTextComponent(driver, title);
  await serializedDelay(driver, DELAY_AFTER_TAB_OPERATION);
  return clicked;
}

export async function countComponentsByType(driver: Driver, typeName: string): Promise<int> {
  let total: int = 0;
  await runUiTask(async (): Promise<void> => {
    const typeOn: On = ON.type(typeName);
    const found: Component[] | null = await driver.findComponents(typeOn);
    if (found !== null) {
      total = found.length;
    }
  });
  return total;
}

export async function tabsCount(driver: Driver): Promise<int> {
  return await countComponentsByType(driver, TABS_TYPE);
}

export async function tabContentCount(driver: Driver): Promise<int> {
  return await countComponentsByType(driver, TAB_CONTENT_TYPE);
}

export async function textCount(driver: Driver): Promise<int> {
  return await countComponentsByType(driver, TEXT_TYPE);
}

export async function focusedCount(driver: Driver): Promise<int> {
  let total: int = 0;
  await runUiTask(async (): Promise<void> => {
    const focusOn: On = ON.focused(true);
    const found: Component[] | null = await driver.findComponents(focusOn);
    if (found !== null) {
      total = found.length;
    }
  });
  return total;
}

export async function clickableCount(driver: Driver): Promise<int> {
  let total: int = 0;
  await runUiTask(async (): Promise<void> => {
    const clickableOn: On = ON.clickable(true);
    const found: Component[] | null = await driver.findComponents(clickableOn);
    if (found !== null) {
      total = found.length;
    }
  });
  return total;
}

export async function collectTexts(driver: Driver): Promise<string[]> {
  const collected: string[] = [];
  await runUiTask(async (): Promise<void> => {
    const textOn: On = ON.type(TEXT_TYPE);
    const found: Component[] | null = await driver.findComponents(textOn);
    if (found === null) {
      return;
    }
    for (let cursor: int = 0; cursor < found.length; cursor++) {
      const current: Component = found[cursor];
      const content: string = await current.getText();
      collected.push(content);
    }
  });
  return collected;
}

export function countTitles(texts: string[]): int {
  let counter: int = 0;
  for (let cursor: int = 0; cursor < texts.length; cursor++) {
    const current: string = texts[cursor];
    if (current.startsWith(TAB_PREFIX)) {
      counter = counter + 1;
    }
  }
  return counter;
}

export function countLabel(texts: string[], label: string): int {
  let counter: int = 0;
  for (let cursor: int = 0; cursor < texts.length; cursor++) {
    if (texts[cursor] === label) {
      counter = counter + 1;
    }
  }
  return counter;
}

export function containsLabel(texts: string[], label: string): boolean {
  for (let cursor: int = 0; cursor < texts.length; cursor++) {
    if (texts[cursor] === label) {
      return true;
    }
  }
  return false;
}

export async function tabTitleCount(driver: Driver): Promise<int> {
  const texts: string[] = await collectTexts(driver);
  return countTitles(texts);
}

export async function addButtonVisible(driver: Driver): Promise<boolean> {
  const texts: string[] = await collectTexts(driver);
  return containsLabel(texts, TAB_ADD_LABEL);
}

export async function closeButtonVisible(driver: Driver): Promise<boolean> {
  const texts: string[] = await collectTexts(driver);
  return containsLabel(texts, TAB_CLOSE_LABEL);
}

export async function titleVisible(driver: Driver, title: string): Promise<boolean> {
  const texts: string[] = await collectTexts(driver);
  return containsLabel(texts, title);
}

export async function waitForPanelStable(driver: Driver, timeoutMs: int): Promise<boolean> {
  let stable: boolean = false;
  const deadline: number = Date.now() + timeoutMs;
  while (Date.now() <= deadline) {
    const current: int = await tabsCount(driver);
    if (current >= 1) {
      stable = true;
      return stable;
    }
    await serializedDelay(driver, DELAY_KEY_NAVIGATION);
  }
  return stable;
}

export async function panelSnapshot(driver: Driver): Promise<PanelSnapshot> {
  const tabs: int = await tabsCount(driver);
  const contents: int = await tabContentCount(driver);
  const texts: int = await textCount(driver);
  const capturedAt: number = Date.now();
  logInfo('snapshot captured at ' + capturedAt.toString());
  return new PanelSnapshot(tabs, contents, texts, capturedAt);
}

export async function displayMetrics(driver: Driver): Promise<MetricPoint> {
  let width: int = 0;
  let height: int = 0;
  const worker = async (): Promise<void> => {
    const measured = await driver.getDisplaySize();
    width = measured.x;
    height = measured.y;
  };
  await runUiTask(worker);
  return new MetricPoint(width, height);
}

export async function rotationOf(driver: Driver): Promise<int> {
  let rotation: int = 0;
  const worker = async (): Promise<void> => {
    const current = await driver.getDisplayRotation();
    rotation = current.valueOf();
  };
  await runUiTask(worker);
  return rotation;
}

export async function settlePanel(driver: Driver): Promise<void> {
  await serializedDelay(driver, TIMEOUT_STATE_SETTLE);
}

export async function bringPanelToFront(driver: Driver): Promise<boolean> {
  await launchTargetAbility();
  await serializedDelay(driver, TIMEOUT_PANEL_RENDER);
  return await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
}

export async function resetPanelToInitial(driver: Driver): Promise<void> {
  await launchTargetAbility();
  await serializedDelay(driver, RESET_SETTLE);
}

export function buildTabTitle(pageIndex: int): string {
  return TAB_PREFIX + pageIndex.toString();
}

export function canAddTab(currentCount: int): boolean {
  return currentCount < MAX_TAB_COUNT;
}

export function canRemoveTab(currentCount: int): boolean {
  return currentCount > MIN_REMOVABLE_TAB_COUNT - 1;
}

export function clampTabIndex(index: int, total: int): int {
  if (total <= 0) {
    return -1;
  }
  if (index < 0) {
    return 0;
  }
  if (index >= total) {
    return total - 1;
  }
  return index;
}

export function removeTitleAt(titles: string[], index: int): string[] {
  const copied: string[] = titles.slice(0);
  if (index < 0 || index >= copied.length) {
    return copied;
  }
  copied.splice(index, 1);
  return copied;
}

export function appendTitle(titles: string[], pageIndex: int): string[] {
  const copied: string[] = titles.slice(0);
  copied.push(buildTabTitle(pageIndex));
  return copied;
}

export function initialTitles(): string[] {
  const seeds: string[] = [FIRST_TAB_TITLE, SECOND_TAB_TITLE];
  return seeds;
}

export class MetricPoint {
  public x: int;
  public y: int;

  constructor(x: int, y: int) {
    this.x = x;
    this.y = y;
  }

  public area(): int {
    return this.x * this.y;
  }

  public isLandscape(): boolean {
    return this.x > this.y;
  }

  public shortSide(): int {
    if (this.x < this.y) {
      return this.x;
    }
    return this.y;
  }

  public describe(): string {
    return `metric{${this.x}x${this.y}}`;
  }
}

export class PanelSnapshot {
  public tabBarCount: int;
  public contentCount: int;
  public textCountValue: int;
  public capturedAt: number;

  constructor(tabBarCount: int, contentCount: int, textCountValue: int, capturedAt: number) {
    this.tabBarCount = tabBarCount;
    this.contentCount = contentCount;
    this.textCountValue = textCountValue;
    this.capturedAt = capturedAt;
  }

  public static empty(): PanelSnapshot {
    return new PanelSnapshot(0, 0, 0, Date.now());
  }

  public total(): int {
    return this.tabBarCount + this.contentCount + this.textCountValue;
  }

  public equals(other: PanelSnapshot): boolean {
    return this.tabBarCount === other.tabBarCount && this.contentCount === other.contentCount &&
      this.textCountValue === other.textCountValue;
  }

  public diffTotal(other: PanelSnapshot): int {
    const difference: int = this.total() - other.total();
    if (difference < 0) {
      return -difference;
    }
    return difference;
  }

  public describe(): string {
    return `snapshot{bar: ${this.tabBarCount}, content: ${this.contentCount}, text: ${this.textCountValue}}`;
  }
}

export class TabTitleBook {
  private titles: string[] = [];

  constructor(initial: string[]) {
    this.titles = initial.slice(0);
  }

  public static initial(): TabTitleBook {
    const seeds: string[] = initialTitles();
    return new TabTitleBook(seeds);
  }

  public getTitles(): string[] {
    return this.titles.slice(0);
  }

  public getCount(): int {
    return this.titles.length;
  }

  public addTitle(pageIndex: int): boolean {
    if (!canAddTab(this.titles.length)) {
      return false;
    }
    this.titles.push(buildTabTitle(pageIndex));
    return true;
  }

  public removeTitle(index: int): boolean {
    if (!canRemoveTab(this.titles.length)) {
      return false;
    }
    if (index < 0 || index >= this.titles.length) {
      return false;
    }
    this.titles.splice(index, 1);
    return true;
  }

  public indexOfTitle(title: string): int {
    return this.titles.indexOf(title);
  }

  public containsTitle(title: string): boolean {
    return this.titles.indexOf(title) >= 0;
  }

  public canAddMore(): boolean {
    return canAddTab(this.titles.length);
  }

  public canRemoveAny(): boolean {
    return canRemoveTab(this.titles.length);
  }

  public reset(): void {
    this.titles = initialTitles();
  }
}

export class PageCounter {
  private counter: int;

  constructor(start: int) {
    this.counter = start;
  }

  public static defaultCounter(): PageCounter {
    return new PageCounter(DEFAULT_NEW_PAGE_INDEX);
  }

  public peekNext(): int {
    return this.counter + 1;
  }

  public takeNext(): int {
    this.counter = this.counter + 1;
    return this.counter;
  }

  public getValue(): int {
    return this.counter;
  }

  public setValue(value: int): void {
    this.counter = value;
  }
}

export class OperationTimer {
  private startTime: number = 0;
  private stopTime: number = 0;

  public start(): void {
    this.startTime = Date.now();
    this.stopTime = 0;
  }

  public stop(): void {
    this.stopTime = Date.now();
  }

  public getElapsed(): number {
    if (this.stopTime === 0) {
      return Date.now() - this.startTime;
    }
    return this.stopTime - this.startTime;
  }

  public isRunning(): boolean {
    return this.startTime > 0 && this.stopTime === 0;
  }

  public reset(): void {
    this.startTime = 0;
    this.stopTime = 0;
  }
}
