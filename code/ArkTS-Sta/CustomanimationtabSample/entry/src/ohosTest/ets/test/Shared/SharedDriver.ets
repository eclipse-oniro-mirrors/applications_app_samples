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
import Want from '@ohos.app.ability.Want';
import UIAbility from '@ohos.app.ability.UIAbility';
import { expect } from '@ohos/hypium';
import hilog from '@ohos.hilog';

/**
 * Shared driver utilities for the custom animation tab sample UI suite.
 *
 * The production page exposes stable identifiers so UiTest drives the real
 * application instead of a copy of the UI:
 *   tabBar               horizontal tab scroller
 *   tabContent           non-looping Swiper that hosts every page
 *   0 .. 4               selectable tab items
 *   page-title-0 .. 4    heading rendered inside each page
 *   indicator-gray       gray indicator state
 *   indicator-yellow     yellow indicator state
 *   toggleIndicatorColor button that flips the indicator color
 */
export const TAB_TITLES: Array<string> = [
  '\u5168\u90e8',
  'UI\u5e03\u5c40',
  '\u52a8\u6548',
  '\u4e09\u65b9\u5e93',
  '\u5176\u4ed6',
];

export const TAB_COUNT: number = 5;
export const TAB_WIDTH: number = 95;
export const LIST_ROW_COUNT: number = 8;
export const TAB_SCROLL_OFFSET: number = 90;

export const ID_TAB_BAR: string = 'tabBar';
export const ID_TAB_CONTENT: string = 'tabContent';
export const ID_TOGGLE_COLOR: string = 'toggleIndicatorColor';
export const ID_INDICATOR_GRAY: string = 'indicator-gray';
export const ID_INDICATOR_YELLOW: string = 'indicator-yellow';

export const TIMEOUT_COMPONENT: number = 8000;
export const TIMEOUT_PAGE_SETTLE: number = 2500;
export const TIMEOUT_STATE_SETTLE: number = 1500;
export const SWIPE_DURATION: number = 600;
export const SWIPE_RATIO_START: number = 0.15;
export const SWIPE_RATIO_END: number = 0.85;
export const DELAY_AFTER_CLICK: number = 500;
export const DELAY_AFTER_SWIPE: number = 500;
export const DELAY_POLL_INTERVAL: number = 100;
export const MAX_CLICK_LATENCY: number = 2500;
export const MAX_PAGE_SETTLE: number = 2500;

export function logInfo(message: string): void {
  hilog.info(0x0000, 'CustomTabTest', '%{public}s', message);
}

export function logError(message: string): void {
  hilog.error(0x0000, 'CustomTabTest', '%{public}s', message);
}

let sharedDriver: Driver | null = null;

export function getDriver(): Driver {
  if (sharedDriver === null) {
    sharedDriver = Driver.create();
  }
  return sharedDriver;
}

export function tabId(index: number): string {
  return String(index);
}

export function pageTitleId(index: number): string {
  return 'page-title-' + String(index);
}

export function containsIndex(values: Array<number>, value: number): boolean {
  for (let i: number = 0; i < values.length; i++) {
    if (values[i] === value) {
      return true;
    }
  }
  return false;
}

export function clamp(value: number, minimum: number, maximum: number): number {
  if (value < minimum) {
    return minimum;
  }
  if (value > maximum) {
    return maximum;
  }
  return value;
}

export async function findOptional(
  driver: Driver,
  id: string,
): Promise<Component | null> {
  return await driver.findComponent(ON.id(id));
}

export async function required(driver: Driver, id: string): Promise<Component> {
  const component: Component | null = await driver.waitForComponent(
    ON.id(id),
    TIMEOUT_COMPONENT,
  );
  if (component === null) {
    throw new Error('Missing application component: ' + id);
  }
  return component;
}

export async function boundsOf(component: Component): Promise<Rect> {
  return await component.getBounds();
}

export async function idOf(component: Component): Promise<string> {
  return await component.getId();
}

export async function textOf(component: Component): Promise<string> {
  return await component.getText();
}

export function hasPositiveArea(bounds: Rect): boolean {
  return bounds.right > bounds.left && bounds.bottom > bounds.top;
}

export function isWithinViewport(bounds: Rect, viewport: Rect): boolean {
  return (
    bounds.left >= viewport.left &&
    bounds.right <= viewport.right &&
    bounds.top >= viewport.top &&
    bounds.bottom <= viewport.bottom
  );
}

export function isHorizontallyWithin(bounds: Rect, viewport: Rect): boolean {
  return (
    bounds.right > bounds.left &&
    bounds.left >= viewport.left &&
    bounds.right <= viewport.right
  );
}

export function horizontalCenter(bounds: Rect): number {
  return Math.trunc((bounds.left + bounds.right) / 2);
}

export function verticalCenter(bounds: Rect): number {
  return Math.trunc((bounds.top + bounds.bottom) / 2);
}

export function boundsWidth(bounds: Rect): number {
  return bounds.right - bounds.left;
}

export function boundsHeight(bounds: Rect): number {
  return bounds.bottom - bounds.top;
}

export async function viewportOf(driver: Driver, id: string): Promise<Rect> {
  const component: Component = await required(driver, id);
  return await component.getBounds();
}

export async function waitUntil(
  driver: Driver,
  predicate: () => Promise<boolean>,
  timeoutMs: number,
  intervalMs: number,
): Promise<boolean> {
  const deadline: number = Date.now() + timeoutMs;
  while (Date.now() < deadline) {
    if (await predicate()) {
      return true;
    }
    await driver.delayMs(intervalMs);
  }
  return await predicate();
}

async function waitMilliseconds(milliseconds: number): Promise<void> {
  await new Promise<void>((resolve: () => void): void => {
    setTimeout(resolve, milliseconds);
  });
}

export async function launchEntryAbility(): Promise<UIAbility | null> {
  const delegator = abilityDelegatorRegistry.getAbilityDelegator();
  const want: Want = {
    bundleName: abilityDelegatorRegistry.getArguments().bundleName,
    abilityName: 'EntryAbility',
  };
  let lastError: Error | null = null;
  for (let attempt: number = 0; attempt < 6; attempt++) {
    try {
      await delegator.startAbility(want);
      try {
        const ability: UIAbility | null = await delegator.getCurrentTopAbility();
        if (ability !== null) {
          logInfo('EntryAbility launched');
          return ability;
        }
      } catch (error) {
      }
      logInfo('EntryAbility started');
      return null;
    } catch (error) {
      lastError = error as Error;
    }
    await waitMilliseconds(600);
  }
  if (lastError !== null) {
    throw new Error('startAbility failed: ' + lastError.message);
  }
  throw new Error('startAbility failed');
}

export async function terminateEntryAbility(
  ability: UIAbility | null,
  driver: Driver,
): Promise<void> {
  await driver.delayMs(300);
}

export async function awaitAppReady(driver: Driver): Promise<void> {
  await required(driver, ID_TOGGLE_COLOR);
  await required(driver, ID_TAB_CONTENT);
  await required(driver, ID_TAB_BAR);
  const ready: boolean = await waitUntil(
    driver,
    async (): Promise<boolean> => {
      const tab: Component | null = await findOptional(driver, tabId(0));
      return tab !== null;
    },
    TIMEOUT_PAGE_SETTLE,
    DELAY_POLL_INTERVAL,
  );
  if (!ready) {
    throw new Error('Tab bar was not ready after launch');
  }
}

/**
 * Swipe horizontally inside a component. forward=true moves the finger from
 * right to left, which advances to the next page or reveals later tabs.
 */
export async function swipe(
  driver: Driver,
  id: string,
  forward: boolean,
): Promise<void> {
  const component: Component = await required(driver, id);
  const bounds: Rect = await component.getBounds();
  const left: number = Math.trunc(
    bounds.left +
    (bounds.right - bounds.left) * SWIPE_RATIO_START
  );
  const right: number = Math.trunc(
    bounds.left +
    (bounds.right - bounds.left) * SWIPE_RATIO_END
  );
  const y: number = verticalCenter(bounds);
  await driver.swipe(
    forward ? right : left,
    y,
    forward ? left : right,
    y,
    SWIPE_DURATION,
  );
  await driver.delayMs(DELAY_AFTER_SWIPE);
}

export async function swipeContent(
  driver: Driver,
  forward: boolean,
): Promise<void> {
  await swipe(driver, ID_TAB_CONTENT, forward);
}

export async function swipeTabBar(
  driver: Driver,
  forward: boolean,
): Promise<void> {
  await swipe(driver, ID_TAB_BAR, forward);
}

export async function visibleTabIndexes(driver: Driver): Promise<Array<number>> {
  const result: Array<number> = new Array<number>();
  const viewport: Rect = await viewportOf(driver, ID_TAB_BAR);
  for (let index: number = 0; index < TAB_COUNT; index++) {
    const tab: Component | null = await findOptional(driver, tabId(index));
    if (tab !== null) {
      const bounds: Rect = await tab.getBounds();
      if (isHorizontallyWithin(bounds, viewport)) {
        result.push(index);
      }
    }
  }
  return result;
}

export async function isTabFullyVisible(
  driver: Driver,
  index: number,
): Promise<boolean> {
  const viewport: Rect = await viewportOf(driver, ID_TAB_BAR);
  const tab: Component | null = await findOptional(driver, tabId(index));
  if (tab === null) {
    return false;
  }
  const bounds: Rect = await tab.getBounds();
  return isHorizontallyWithin(bounds, viewport);
}

export async function revealTab(driver: Driver, index: number): Promise<void> {
  for (let attempt: number = 0; attempt < 8; attempt++) {
    if (await isTabFullyVisible(driver, index)) {
      return;
    }
    const visible: Array<number> = await visibleTabIndexes(driver);
    let forward: boolean = index > 2;
    if (visible.length > 0) {
      const first: number = visible[0];
      const last: number = visible[visible.length - 1];
      if (index > last) {
        forward = true;
      } else if (index < first) {
        forward = false;
      }
    }
    await swipeTabBar(driver, forward);
  }
  if (!(await isTabFullyVisible(driver, index))) {
    throw new Error('Tab could not be revealed: ' + String(index));
  }
}

export async function selectTab(driver: Driver, index: number): Promise<void> {
  await revealTab(driver, index);
  const tab: Component = await required(driver, tabId(index));
  await tab.click();
  await driver.delayMs(DELAY_AFTER_CLICK);
  logInfo('Tab selected: ' + String(index));
}

export async function currentSelectedTab(driver: Driver): Promise<number> {
  let selected: number = -1;
  for (let index: number = 0; index < TAB_COUNT; index++) {
    const tab: Component | null = await findOptional(driver, tabId(index));
    if (tab !== null) {
      const selectedState: boolean = await tab.isSelected();
      if (selectedState) {
        if (selected === -1) {
          selected = index;
        } else {
          return -2;
        }
      }
    }
  }
  return selected;
}

export async function selectedTabCount(driver: Driver): Promise<number> {
  let count: number = 0;
  for (let index: number = 0; index < TAB_COUNT; index++) {
    const tab: Component | null = await findOptional(driver, tabId(index));
    if (tab !== null) {
      const selectedState: boolean = await tab.isSelected();
      if (selectedState) {
        count++;
      }
    }
  }
  return count;
}

export async function assertSelectedTab(
  driver: Driver,
  expected: number,
): Promise<void> {
  const actual: number = await currentSelectedTab(driver);
  expect(actual).assertEqual(expected);
}

export async function isPageVisible(
  driver: Driver,
  index: number,
): Promise<boolean> {
  const viewport: Rect = await viewportOf(driver, ID_TAB_CONTENT);
  const heading: Component | null = await findOptional(
    driver,
    pageTitleId(index),
  );
  if (heading === null) {
    return false;
  }
  const bounds: Rect = await heading.getBounds();
  return isWithinViewport(bounds, viewport);
}

export async function assertPage(
  driver: Driver,
  index: number,
  title: string,
): Promise<void> {
  let visible: boolean = false;
  for (let attempt: number = 0; attempt < 25; attempt++) {
    if (await isPageVisible(driver, index)) {
      visible = true;
      break;
    }
    await driver.delayMs(DELAY_POLL_INTERVAL);
  }
  expect(visible).assertTrue();
  const heading: Component = await required(driver, pageTitleId(index));
  const text: string = await heading.getText();
  expect(text).assertEqual(title);
  await assertSelectedTab(driver, index);
}

export async function assertPageTitle(
  driver: Driver,
  index: number,
  title: string,
): Promise<void> {
  const heading: Component = await required(driver, pageTitleId(index));
  const text: string = await heading.getText();
  expect(text).assertEqual(title);
}

export async function assertTitleHidden(
  driver: Driver,
  index: number,
): Promise<void> {
  const viewport: Rect = await viewportOf(driver, ID_TAB_CONTENT);
  const heading: Component | null = await findOptional(
    driver,
    pageTitleId(index),
  );
  if (heading === null) {
    expect(true).assertTrue();
    return;
  }
  const bounds: Rect = await heading.getBounds();
  if (!hasPositiveArea(bounds)) {
    expect(true).assertTrue();
    return;
  }
  expect(isWithinViewport(bounds, viewport)).assertFalse();
}

export async function assertIndicator(
  driver: Driver,
  yellow: boolean,
): Promise<void> {
  const expectedId: string = yellow ? ID_INDICATOR_YELLOW : ID_INDICATOR_GRAY;
  const component: Component = await required(driver, expectedId);
  const id: string = await component.getId();
  expect(id).assertEqual(expectedId);
}

export async function indicatorIsYellow(driver: Driver): Promise<boolean> {
  const yellow: Component | null = await findOptional(
    driver,
    ID_INDICATOR_YELLOW,
  );
  return yellow !== null;
}

export async function toggleIndicator(driver: Driver): Promise<void> {
  const button: Component = await required(driver, ID_TOGGLE_COLOR);
  await button.click();
  await driver.delayMs(DELAY_AFTER_CLICK);
}

export async function ensureIndicator(
  driver: Driver,
  yellow: boolean,
): Promise<void> {
  for (let attempt: number = 0; attempt < 3; attempt++) {
    if ((await indicatorIsYellow(driver)) === yellow) {
      return;
    }
    await toggleIndicator(driver);
  }
  if ((await indicatorIsYellow(driver)) !== yellow) {
    throw new Error(
      'Indicator state could not be set to yellow=' + String(yellow),
    );
  }
}

export async function measureClickLatency(
  driver: Driver,
  id: string,
): Promise<number> {
  const component: Component = await required(driver, id);
  const start: number = Date.now();
  await component.click();
  const end: number = Date.now();
  await driver.delayMs(DELAY_AFTER_CLICK);
  return Math.trunc(end - start);
}

export async function assertComponentExists(
  driver: Driver,
  id: string,
): Promise<void> {
  const component: Component | null = await findOptional(driver, id);
  expect(component !== null).assertTrue();
}

export async function assertComponentAbsent(
  driver: Driver,
  id: string,
): Promise<void> {
  const component: Component | null = await findOptional(driver, id);
  expect(component === null).assertTrue();
}

export async function assertTabBarVisible(driver: Driver): Promise<void> {
  const bounds: Rect = await viewportOf(driver, ID_TAB_BAR);
  expect(hasPositiveArea(bounds)).assertTrue();
}

export async function assertContentVisible(driver: Driver): Promise<void> {
  const bounds: Rect = await viewportOf(driver, ID_TAB_CONTENT);
  expect(hasPositiveArea(bounds)).assertTrue();
}

/**
 * Verify that the tab strip is rendered above the swiper content, matching the
 * production layout where the 60vp strip sits on top of tabContent.
 */
export async function assertTabBarAboveContent(driver: Driver): Promise<void> {
  const bar: Rect = await viewportOf(driver, ID_TAB_BAR);
  const content: Rect = await viewportOf(driver, ID_TAB_CONTENT);
  expect(bar.top < content.top).assertTrue();
}

export async function assertTabBarLeftOfContent(driver: Driver): Promise<void> {
  const bar: Rect = await viewportOf(driver, ID_TAB_BAR);
  const content: Rect = await viewportOf(driver, ID_TAB_CONTENT);
  expect(Math.abs(bar.left - content.left) <= 8).assertTrue();
}

export async function assertTabsOrderedLeftToRight(
  driver: Driver,
): Promise<void> {
  let previousRight: number = -1;
  for (let index: number = 0; index < TAB_COUNT; index++) {
    const tab: Component | null = await findOptional(driver, tabId(index));
    if (tab !== null) {
      const bounds: Rect = await tab.getBounds();
      if (hasPositiveArea(bounds)) {
        if (previousRight >= 0) {
          expect(bounds.left >= previousRight).assertTrue();
        }
        previousRight = bounds.right;
      }
    }
  }
}

export async function assertTabWidthsConsistent(driver: Driver): Promise<void> {
  const tolerance: number = 24;
  let reference: number = -1;
  for (let index: number = 0; index < TAB_COUNT; index++) {
    const tab: Component | null = await findOptional(driver, tabId(index));
    if (tab !== null) {
      const bounds: Rect = await tab.getBounds();
      if (hasPositiveArea(bounds)) {
        const width: number = boundsWidth(bounds);
        if (reference < 0) {
          reference = width;
        } else {
          expect(Math.abs(width - reference) <= tolerance).assertTrue();
        }
      }
    }
  }
}

export async function assertToggleButtonClickable(
  driver: Driver,
): Promise<void> {
  const button: Component = await required(driver, ID_TOGGLE_COLOR);
  const bounds: Rect = await button.getBounds();
  expect(hasPositiveArea(bounds)).assertTrue();
  const before: boolean = await indicatorIsYellow(driver);
  await button.click();
  await driver.delayMs(DELAY_AFTER_CLICK);
  const after: boolean = await indicatorIsYellow(driver);
  expect(after !== before).assertTrue();
}

export async function resetToInitialTab(driver: Driver): Promise<void> {
  await selectTab(driver, 0);
  await assertPage(driver, 0, TAB_TITLES[0]);
}

export async function navigateThroughAllForward(driver: Driver): Promise<void> {
  for (let index: number = 0; index < TAB_COUNT; index++) {
    await selectTab(driver, index);
    await assertPage(driver, index, TAB_TITLES[index]);
  }
}

export async function navigateThroughAllBackward(
  driver: Driver,
): Promise<void> {
  for (let index: number = TAB_COUNT - 1; index >= 0; index--) {
    await selectTab(driver, index);
    await assertPage(driver, index, TAB_TITLES[index]);
  }
}

export async function swipeThroughAllForward(driver: Driver): Promise<void> {
  for (let index: number = 1; index < TAB_COUNT; index++) {
    await swipeContent(driver, true);
    await assertPage(driver, index, TAB_TITLES[index]);
  }
}

export async function swipeThroughAllBackward(driver: Driver): Promise<void> {
  for (let index: number = TAB_COUNT - 2; index >= 0; index--) {
    await swipeContent(driver, false);
    await assertPage(driver, index, TAB_TITLES[index]);
  }
}

export async function assertAllPageTitlesBelongToTabs(
  driver: Driver,
): Promise<void> {
  for (let index: number = 0; index < TAB_COUNT; index++) {
    await assertPageTitle(driver, index, TAB_TITLES[index]);
  }
}

export async function countUiTextComponents(driver: Driver): Promise<number> {
  const components: Array<Component> | null = await driver.findComponents(
    ON.type('Text'),
  );
  if (components === null) {
    return 0;
  }
  return components.length;
}

export async function currentIndicatorId(driver: Driver): Promise<string> {
  const yellow: Component | null = await findOptional(
    driver,
    ID_INDICATOR_YELLOW,
  );
  if (yellow !== null) {
    return await yellow.getId();
  }
  const gray: Component | null = await findOptional(driver, ID_INDICATOR_GRAY);
  if (gray !== null) {
    return await gray.getId();
  }
  return '';
}

