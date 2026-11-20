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
