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

import { Driver, ON, Component } from '@kit.TestKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const TAG: string = 'SharedDriver';
const DOMAIN_NUMBER: number = 0xFF00;

export const SAMPLE_BUNDLE_NAME: string = 'com.samples.bundlemanagement';
export const ENTRY_ABILITY_NAME: string = 'EntryAbility';
export const NEW_ABILITY_NAME: string = 'NewAbility';
export const NEW_UI_EXT_ABILITY_NAME: string = 'NewUIExtAbility';
export const OVERLAY_MODULE_NAME: string = 'libraryOverlay';
export const RUNTIME_OVERLAY_MODULE_NAME: string = 'libraryRuntimeOverlay';
export const ENTRY_MODULE_NAME: string = 'entry';

export const KEY_LEFT: number = 2014;
export const KEY_RIGHT: number = 2015;
export const KEY_UP: number = 2012;
export const KEY_DOWN: number = 2013;
export const KEY_ENTER: number = 2049;
export const KEY_BACK: number = 2;
export const KEY_HOME: number = 3;

export const TIMEOUT_PAGE_RENDER: number = 1000;
export const TIMEOUT_OPERATION: number = 2000;
export const TIMEOUT_FOCUS_CHANGE: number = 500;
export const DELAY_KEY_NAVIGATION: number = 50;
export const DELAY_TOUCH_EVENT: number = 100;
export const DELAY_AFTER_CLICK: number = 400;
export const TOLERANCE_COMPONENT_COUNT: number = 3;
export const STRESS_ROUNDS_NAVIGATION: number = 20;
export const STRESS_ROUNDS_LIFECYCLE: number = 10;

let _driver: Driver | null = null;
let _uiOperationQueue: Promise<void> = Promise.resolve();

export async function runSerializedUiOperation<T>(action: () => Promise<T>): Promise<T> {
  const currentQueue = _uiOperationQueue;
  return await new Promise<T>((resolve, reject) => {
    _uiOperationQueue = currentQueue.then(async () => {
      try {
        resolve(await action());
      } catch (error) {
        reject(error instanceof Error ? error : new Error(String(error)));
      }
    }).catch((error: Error) => {
      reject(error);
    });
  });
}

export async function serializedDelay(driver: Driver, delayMs: number): Promise<void> {
  await runSerializedUiOperation(async () => {
    await driver.delayMs(delayMs);
  });
}

export function getDriver(): Driver {
  if (_driver === null) {
    _driver = Driver.create();
  }
  return _driver;
}

export async function resetDriver(): Promise<void> {
  _uiOperationQueue = Promise.resolve();
}

export async function findComponentsByType(driver: Driver, type: string): Promise<Component[]> {
  return await runSerializedUiOperation(async () => {
    const items = await driver.findComponents(ON.type(type));
    return items === null || items === undefined ? [] : items;
  });
}

export async function componentCountByType(driver: Driver, type: string): Promise<number> {
  const items = await findComponentsByType(driver, type);
  return items.length;
}

export async function totalComponentCount(driver: Driver): Promise<number> {
  const items = await findComponentsByType(driver, '*');
  return items.length;
}

export async function checkComponentExists(driver: Driver, type: string): Promise<boolean> {
  const items = await findComponentsByType(driver, type);
  return items.length > 0;
}

export async function checkTextContent(driver: Driver, expectedText: string): Promise<boolean> {
  return await runSerializedUiOperation(async () => {
    const texts = await driver.findComponents(ON.type('Text'));
    if (texts === null || texts === undefined) {
      return false;
    }
    for (const text of texts) {
      try {
        if (await text.getText() === expectedText) {
          return true;
        }
      } catch (error) {
        hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'read text failed');
      }
    }
    return false;
  });
}

export async function pressAndWait(driver: Driver, key: number, times: number = 1): Promise<void> {
  await runSerializedUiOperation(async () => {
    for (let i = 0; i < times; i++) {
      await driver.triggerKey(key);
      await driver.delayMs(DELAY_KEY_NAVIGATION);
    }
  });
}

export async function simulateTouch(driver: Driver, x: number, y: number): Promise<void> {
  await runSerializedUiOperation(async () => {
    await driver.click(x, y);
    await driver.delayMs(DELAY_TOUCH_EVENT);
  });
}

export async function swipeVertical(driver: Driver, fromY: number, toY: number): Promise<void> {
  await runSerializedUiOperation(async () => {
    await driver.swipe(360, fromY, 360, toY);
    await driver.delayMs(DELAY_TOUCH_EVENT);
  });
}

export async function getCurrentFocusIndex(driver: Driver): Promise<number> {
  return await runSerializedUiOperation(async () => {
    const all: Component[] = await driver.findComponents(ON.type('*'));
    if (all === null || all === undefined) {
      return -1;
    }
    for (let i = 0; i < all.length; i++) {
      try {
        if (await all[i].isFocused()) {
          return i;
        }
      } catch (error) {
        hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'focus probe failed');
      }
    }
    return -1;
  });
}

export async function launchBundleManagerApp(): Promise<void> {
  const delegator = abilityDelegatorRegistry.getAbilityDelegator();
  const args = abilityDelegatorRegistry.getArguments();
  const want: Want = { bundleName: args.bundleName, abilityName: ENTRY_ABILITY_NAME };
  await delegator.startAbility(want);
}

export async function launchNewAbility(): Promise<void> {
  const delegator = abilityDelegatorRegistry.getAbilityDelegator();
  const args = abilityDelegatorRegistry.getArguments();
  const want: Want = { bundleName: args.bundleName, abilityName: NEW_ABILITY_NAME };
  await delegator.startAbility(want);
}

export async function countText(driver: Driver): Promise<number> {
  return await componentCountByType(driver, 'Text');
}

export async function countButton(driver: Driver): Promise<number> {
  return await componentCountByType(driver, 'Button');
}

export async function countImage(driver: Driver): Promise<number> {
  return await componentCountByType(driver, 'Image');
}

export async function countList(driver: Driver): Promise<number> {
  return await componentCountByType(driver, 'List');
}

export async function countListItem(driver: Driver): Promise<number> {
  return await componentCountByType(driver, 'ListItem');
}

export async function countRow(driver: Driver): Promise<number> {
  return await componentCountByType(driver, 'Row');
}

export async function countColumn(driver: Driver): Promise<number> {
  return await componentCountByType(driver, 'Column');
}

export async function countFlex(driver: Driver): Promise<number> {
  return await componentCountByType(driver, 'Flex');
}

export async function countScroll(driver: Driver): Promise<number> {
  return await componentCountByType(driver, 'Scroll');
}

export async function countStack(driver: Driver): Promise<number> {
  return await componentCountByType(driver, 'Stack');
}

export async function countDivider(driver: Driver): Promise<number> {
  return await componentCountByType(driver, 'Divider');
}

export async function countTextInput(driver: Driver): Promise<number> {
  return await componentCountByType(driver, 'TextInput');
}

export async function countGrid(driver: Driver): Promise<number> {
  return await componentCountByType(driver, 'Grid');
}

export async function countSwiper(driver: Driver): Promise<number> {
  return await componentCountByType(driver, 'Swiper');
}

export async function countTabs(driver: Driver): Promise<number> {
  return await componentCountByType(driver, 'Tabs');
}

export async function countNavigation(driver: Driver): Promise<number> {
  return await componentCountByType(driver, 'Navigation');
}

export async function countSearch(driver: Driver): Promise<number> {
  return await componentCountByType(driver, 'Search');
}

export async function countCheckbox(driver: Driver): Promise<number> {
  return await componentCountByType(driver, 'Checkbox');
}

export async function countSlider(driver: Driver): Promise<number> {
  return await componentCountByType(driver, 'Slider');
}

export async function countProgress(driver: Driver): Promise<number> {
  return await componentCountByType(driver, 'Progress');
}

export async function countBadge(driver: Driver): Promise<number> {
  return await componentCountByType(driver, 'Badge');
}

export async function countSpan(driver: Driver): Promise<number> {
  return await componentCountByType(driver, 'Span');
}

export async function countBlank(driver: Driver): Promise<number> {
  return await componentCountByType(driver, 'Blank');
}

export async function countMenu(driver: Driver): Promise<number> {
  return await componentCountByType(driver, 'Menu');
}

export async function countSelect(driver: Driver): Promise<number> {
  return await componentCountByType(driver, 'Select');
}

export async function countRadio(driver: Driver): Promise<number> {
  return await componentCountByType(driver, 'Radio');
}

export async function hasText(driver: Driver): Promise<boolean> {
  return await checkComponentExists(driver, 'Text');
}

export async function hasButton(driver: Driver): Promise<boolean> {
  return await checkComponentExists(driver, 'Button');
}

export async function hasImage(driver: Driver): Promise<boolean> {
  return await checkComponentExists(driver, 'Image');
}

export async function hasList(driver: Driver): Promise<boolean> {
  return await checkComponentExists(driver, 'List');
}

export async function hasListItem(driver: Driver): Promise<boolean> {
  return await checkComponentExists(driver, 'ListItem');
}

export async function hasRow(driver: Driver): Promise<boolean> {
  return await checkComponentExists(driver, 'Row');
}

export async function hasColumn(driver: Driver): Promise<boolean> {
  return await checkComponentExists(driver, 'Column');
}

export async function hasFlex(driver: Driver): Promise<boolean> {
  return await checkComponentExists(driver, 'Flex');
}

export async function hasScroll(driver: Driver): Promise<boolean> {
  return await checkComponentExists(driver, 'Scroll');
}

export async function hasStack(driver: Driver): Promise<boolean> {
  return await checkComponentExists(driver, 'Stack');
}

export async function hasDivider(driver: Driver): Promise<boolean> {
  return await checkComponentExists(driver, 'Divider');
}

export async function hasTextInput(driver: Driver): Promise<boolean> {
  return await checkComponentExists(driver, 'TextInput');
}

export async function hasGrid(driver: Driver): Promise<boolean> {
  return await checkComponentExists(driver, 'Grid');
}

export async function hasSwiper(driver: Driver): Promise<boolean> {
  return await checkComponentExists(driver, 'Swiper');
}

export async function hasTabs(driver: Driver): Promise<boolean> {
  return await checkComponentExists(driver, 'Tabs');
}

export async function hasNavigation(driver: Driver): Promise<boolean> {
  return await checkComponentExists(driver, 'Navigation');
}

export async function hasSearch(driver: Driver): Promise<boolean> {
  return await checkComponentExists(driver, 'Search');
}

export async function hasCheckbox(driver: Driver): Promise<boolean> {
  return await checkComponentExists(driver, 'Checkbox');
}

export async function hasSlider(driver: Driver): Promise<boolean> {
  return await checkComponentExists(driver, 'Slider');
}

export async function hasProgress(driver: Driver): Promise<boolean> {
  return await checkComponentExists(driver, 'Progress');
}

export async function hasBadge(driver: Driver): Promise<boolean> {
  return await checkComponentExists(driver, 'Badge');
}

export async function hasSpan(driver: Driver): Promise<boolean> {
  return await checkComponentExists(driver, 'Span');
}

export async function hasBlank(driver: Driver): Promise<boolean> {
  return await checkComponentExists(driver, 'Blank');
}

export async function hasMenu(driver: Driver): Promise<boolean> {
  return await checkComponentExists(driver, 'Menu');
}

export async function hasSelect(driver: Driver): Promise<boolean> {
  return await checkComponentExists(driver, 'Select');
}

export async function hasRadio(driver: Driver): Promise<boolean> {
  return await checkComponentExists(driver, 'Radio');
}

export async function pressLeft(driver: Driver, times: number = 1): Promise<void> {
  await pressAndWait(driver, KEY_LEFT, times);
}

export async function pressRight(driver: Driver, times: number = 1): Promise<void> {
  await pressAndWait(driver, KEY_RIGHT, times);
}

export async function pressUp(driver: Driver, times: number = 1): Promise<void> {
  await pressAndWait(driver, KEY_UP, times);
}

export async function pressDown(driver: Driver, times: number = 1): Promise<void> {
  await pressAndWait(driver, KEY_DOWN, times);
}

export async function pressEnter(driver: Driver, times: number = 1): Promise<void> {
  await pressAndWait(driver, KEY_ENTER, times);
}

export async function pressBack(driver: Driver, times: number = 1): Promise<void> {
  await pressAndWait(driver, KEY_BACK, times);
}

export async function pressHome(driver: Driver, times: number = 1): Promise<void> {
  await pressAndWait(driver, KEY_HOME, times);
}

export async function scrollProbe1(driver: Driver): Promise<number> {
  await swipeVertical(driver, 1100, 100);
  return await totalComponentCount(driver);
}

export async function scrollProbe2(driver: Driver): Promise<number> {
  await swipeVertical(driver, 1100, 100);
  return await totalComponentCount(driver);
}

export async function scrollProbe3(driver: Driver): Promise<number> {
  await swipeVertical(driver, 1100, 100);
  return await totalComponentCount(driver);
}

export async function scrollProbe4(driver: Driver): Promise<number> {
  await swipeVertical(driver, 1100, 100);
  return await totalComponentCount(driver);
}

export async function scrollProbe5(driver: Driver): Promise<number> {
  await swipeVertical(driver, 1100, 100);
  return await totalComponentCount(driver);
}

export async function scrollProbe6(driver: Driver): Promise<number> {
  await swipeVertical(driver, 1100, 100);
  return await totalComponentCount(driver);
}

export async function scrollProbe7(driver: Driver): Promise<number> {
  await swipeVertical(driver, 1100, 100);
  return await totalComponentCount(driver);
}

export async function scrollProbe8(driver: Driver): Promise<number> {
  await swipeVertical(driver, 1100, 100);
  return await totalComponentCount(driver);
}

export async function scrollProbe9(driver: Driver): Promise<number> {
  await swipeVertical(driver, 1100, 100);
  return await totalComponentCount(driver);
}

export async function scrollProbe10(driver: Driver): Promise<number> {
  await swipeVertical(driver, 1100, 100);
  return await totalComponentCount(driver);
}

export async function scrollProbe11(driver: Driver): Promise<number> {
  await swipeVertical(driver, 1100, 100);
  return await totalComponentCount(driver);
}

export async function scrollProbe12(driver: Driver): Promise<number> {
  await swipeVertical(driver, 1100, 100);
  return await totalComponentCount(driver);
}

