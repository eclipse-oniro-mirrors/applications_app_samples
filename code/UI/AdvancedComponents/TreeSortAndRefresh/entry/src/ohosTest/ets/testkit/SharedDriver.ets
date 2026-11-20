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

import { abilityDelegatorRegistry, Component, Driver, ON } from '@kit.TestKit';
import { Want } from '@kit.AbilityKit';
import { expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_TestKit]';
const UI_DELAY: number = 400;
const START_DELAY: number = 1200;
const TIMEOUT: number = 6000;

const delegator = abilityDelegatorRegistry.getAbilityDelegator();
let driver: Driver | undefined = undefined;

export function getDriver(): Driver {
  if (driver === undefined) {
    driver = Driver.create();
  }
  return driver;
}

export async function delay(ms: number): Promise<void> {
  await getDriver().delayMs(ms);
}

export async function startAbility(bundleName: string, abilityName: string): Promise<void> {
  const want: Want = {
    bundleName: bundleName,
    abilityName: abilityName
  };
  await delegator.startAbility(want);
}

export async function startApp(bundleName: string, abilityName: string): Promise<void> {
  await startAbility(bundleName, abilityName);
  await delay(START_DELAY);
  for (let i = 0; i < 3; i++) {
    if (await existsId('pageTitle')) {
      return;
    }
    await pressBack();
  }
  await waitId('pageTitle', 8000);
}

export async function waitId(id: string, timeout: number = TIMEOUT): Promise<Component> {
  return await getDriver().waitForComponent(ON.id(id), timeout);
}

export async function waitText(text: string, timeout: number = TIMEOUT): Promise<Component> {
  return await getDriver().waitForComponent(ON.text(text), timeout);
}

export async function clickId(id: string): Promise<void> {
  const component = await waitId(id);
  await component.click();
  await delay(UI_DELAY);
}

export async function longClickId(id: string): Promise<void> {
  const component = await waitId(id);
  const bounds = await component.getBounds();
  await getDriver().longClick((bounds.left + bounds.right) / 2, (bounds.top + bounds.bottom) / 2);
  await delay(800);
}

export async function clickAnyText(texts: string[]): Promise<boolean> {
  for (let i = 0; i < texts.length; i++) {
    try {
      const component = await getDriver().waitForComponent(ON.text(texts[i]), 3000);
      await component.click();
      await delay(UI_DELAY);
      return true;
    } catch (error) {
      // Try the next localized label.
    }
  }
  return false;
}

export async function clickText(text: string): Promise<void> {
  const component = await waitText(text);
  await component.click();
  await delay(UI_DELAY);
}

export async function textOfId(id: string): Promise<string> {
  const component = await waitId(id);
  return await component.getText();
}

export async function existsId(id: string): Promise<boolean> {
  try {
    await getDriver().assertComponentExist(ON.id(id));
    return true;
  } catch (error) {
    return false;
  }
}

export async function pressBack(): Promise<void> {
  await getDriver().pressBack();
  await delay(UI_DELAY);
}

export async function runCase(name: string, action: () => Promise<void>, done: Function): Promise<void> {
  hilog.info(DOMAIN, TAG, '%{public}s', name + ' begin');
  try {
    await action();
  } catch (error) {
    hilog.error(DOMAIN, TAG, name + ' failed: %{public}s', JSON.stringify(error));
    expect().assertFail();
  } finally {
    hilog.info(DOMAIN, TAG, '%{public}s', name + ' end');
    done();
  }
}

export async function clickIdAt(id: string, xRatio: number, yRatio: number): Promise<void> {
  const component = await waitId(id);
  const bounds = await component.getBounds();
  await getDriver().click(bounds.left + (bounds.right - bounds.left) * xRatio,
    bounds.top + (bounds.bottom - bounds.top) * yRatio);
  await delay(UI_DELAY);
}

export async function clickChildButton(parentId: string, position: number): Promise<void> {
  const parent = await waitId(parentId);
  const parentBounds = await parent.getBounds();
  const buttons = await getDriver().findComponents(ON.type('Button'));
  const inside: Component[] = [];
  for (let i = 0; i < buttons.length; i++) {
    const bounds = await buttons[i].getBounds();
    if (bounds.top >= parentBounds.top && bounds.bottom <= parentBounds.bottom &&
      bounds.left >= parentBounds.left && bounds.right <= parentBounds.right) {
      inside.push(buttons[i]);
    }
  }
  for (let i = 0; i < inside.length; i++) {
    for (let j = i + 1; j < inside.length; j++) {
      const leftI = (await inside[i].getBounds()).left;
      const leftJ = (await inside[j].getBounds()).left;
      if (leftJ < leftI) {
        const temp = inside[i];
        inside[i] = inside[j];
        inside[j] = temp;
      }
    }
  }
  if (inside.length === 0) {
    throw new Error(`no child button in ${parentId}`);
  }
  const index = position < 0 ? inside.length - 1 : position;
  await inside[index].click();
  await delay(UI_DELAY);
}

export async function swipeUp(): Promise<void> {
  await getDriver().swipe(360, 1000, 360, 400);
  await delay(400);
}

export async function swipeDown(): Promise<void> {
  await getDriver().swipe(360, 400, 360, 1000);
  await delay(400);
}

export async function scrollToId(id: string, maxSwipes: number = 5): Promise<void> {
  for (let i = 0; i < maxSwipes; i++) {
    if (await existsId(id)) {
      return;
    }
    await swipeUp();
  }
}

export async function waitIdContains(id: string, expected: string, timeout: number = 9000): Promise<void> {
  const start = Date.now();
  while (Date.now() - start < timeout) {
    const content = await textOfId(id);
    if (content.includes(expected)) {
      return;
    }
    await delay(300);
  }
  throw new Error(`${id} does not contain ${expected}`);
}

export async function swipeOnId(id: string, fromRatio: number = 0.75, toRatio: number = 0.25): Promise<void> {
  const component = await waitId(id);
  const bounds = await component.getBounds();
  const centerX = (bounds.left + bounds.right) / 2;
  const fromY = bounds.top + (bounds.bottom - bounds.top) * fromRatio;
  const toY = bounds.top + (bounds.bottom - bounds.top) * toRatio;
  await getDriver().swipe(centerX, fromY, centerX, toY);
  await delay(600);
}
