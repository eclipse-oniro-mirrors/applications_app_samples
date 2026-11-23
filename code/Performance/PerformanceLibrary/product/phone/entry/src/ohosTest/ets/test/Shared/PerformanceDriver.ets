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

import registry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Component, Driver, ON, On } from '@ohos.UiTest';
import hilog from '@ohos.hilog';

const UI_TIMEOUT: number = 5000;
const POLL_MS: number = 100;
const MAX_BACK_STEPS: number = 5;
const HOME: string = 'performanceHome';
let sharedDriver: Driver | undefined;
let mainStarted: boolean = false;
let queue: Promise<void> = Promise.resolve();

export function getDriver(): Driver {
  if (sharedDriver === undefined) {
    sharedDriver = Driver.create();
  }
  return sharedDriver;
}

// Serialize whole scenarios, including their cleanup. A rejected case must not poison the queue.
export function runSerialized<T>(action: () => Promise<T>): Promise<T> {
  const result: Promise<T> = queue.then(() => action());
  queue = result.then((): void => {}, (): void => {});
  return result;
}

export async function eventually(check: () => Promise<boolean>, label: string,
  timeout: number = UI_TIMEOUT): Promise<void> {
  const deadline: number = Date.now() + timeout;
  do {
    if (await check()) {
      return;
    }
    await getDriver().delayMs(POLL_MS);
  } while (Date.now() < deadline);
  throw new Error(`Timed out waiting for ${label}`);
}

export async function requireComponent(selector: On, timeout: number = UI_TIMEOUT): Promise<Component> {
  selector = selector.inWindow(registry.getArguments().bundleName);
  const component = await getDriver().waitForComponent(selector, timeout);
  if (!component) {
    await getDriver().assertComponentExist(selector);
    throw new Error('Required component was not found');
  }
  return component;
}

export async function click(selector: On): Promise<void> {
  await (await requireComponent(selector)).click();
}

export async function backTo(selector: On): Promise<void> {
  await getDriver().pressBack();
  await requireComponent(selector);
}

export async function readText(selector: On): Promise<string> {
  return await (await requireComponent(selector)).getText();
}

export function resourceText(name: string): string {
  return registry.getAbilityDelegator().getAppContext().resourceManager.getStringByNameSync(name);
}

export async function expectPresence(selector: On, present: boolean, label: string): Promise<void> {
  selector = selector.inWindow(registry.getArguments().bundleName);
  await eventually(async () => {
    const found = await getDriver().findComponent(selector);
    return Boolean(found) === present;
  }, label);
}

export async function ensureHome(): Promise<void> {
  const driver = getDriver();
  if (await driver.findComponent(ON.id(HOME))) {
    mainStarted = true;
    return;
  }
  if (!mainStarted) {
    await registry.getAbilityDelegator().startAbility({
      bundleName: registry.getArguments().bundleName,
      moduleName: 'entry',
      abilityName: 'EntryAbility'
    });
    mainStarted = true;
    if (await driver.waitForComponent(ON.id(HOME), 1500)) {
      return;
    }
  }
  for (let step = 0; step < MAX_BACK_STEPS; step++) {
    await driver.pressBack();
    if (await driver.waitForComponent(ON.id(HOME), 400)) {
      return;
    }
  }
  await requireComponent(ON.id(HOME));
}

export async function openFeature(name: string): Promise<void> {
  hilog.info(0x0000, "PerformanceTest", "Opening feature %{public}s", name);
  const home = await requireComponent(ON.id(HOME));
  const selector = ON.text(name).type('Text');
  const driver = getDriver();
  let item = await driver.findComponent(selector);
  if (!item) {
    await home.scrollToTop(40000);
    item = await driver.findComponent(selector);
  }
  if (!item) {
    const bounds = await home.getBounds();
    const center = Math.floor((bounds.left + bounds.right) / 2);
    const top = Math.floor(bounds.top + (bounds.bottom - bounds.top) * 0.2);
    const bottom = Math.floor(bounds.top + (bounds.bottom - bounds.top) * 0.8);
    for (let attempt = 0; attempt < 8 && !item; attempt++) {
      await driver.swipe(center, bottom, center, top, 3000);
      item = await driver.findComponent(selector);
    }
  }
  if (!item) {
    throw new Error(`Home entry not found: ${name}`);
  }
  hilog.info(0x0000, "PerformanceTest", "Located feature %{public}s", name);
  await item.click();
  await eventually(async () => !await getDriver().findComponent(ON.id(HOME)), `leaving home for ${name}`);
  hilog.info(0x0000, "PerformanceTest", "Opened feature %{public}s", name);
}

export function withHome(action: () => Promise<void>): Promise<void> {
  return runSerialized(async () => {
    await ensureHome();
    try {
      await action();
    } catch (error) {
      hilog.error(0x0000, "PerformanceTest", "Scenario failed: %{public}s", String(error));
      try {
        await ensureHome();
      } catch (cleanupError) {
        hilog.warn(0x0000, 'PerformanceTest', 'Could not restore the home page after failure');
      }
      throw error instanceof Error ? error : new Error(String(error));
    }
    await ensureHome();
  });
}
