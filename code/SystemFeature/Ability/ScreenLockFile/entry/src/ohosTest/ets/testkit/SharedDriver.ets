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

/**
 * SharedDriver - Common UI testing utilities for ohosTest.
 * Provides both function-based API and class-based API for test suites.
 */

import { Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { abilityDelegatorRegistry, Component, Driver, ON } from '@kit.TestKit';
import { expect } from '@ohos/hypium';

const DOMAIN: number = 0xF811;
const TAG: string = '[SharedDriver]';
const UI_IDLE_TIME: number = 200;
const UI_IDLE_TIMEOUT: number = 2000;
const COMPONENT_WAIT_TIMEOUT: number = 5000;
const TEXT_WAIT_TIMEOUT: number = 9000;

const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
let driver: Driver | undefined = undefined;

// ==================== Driver Access ====================

export function getDriver(): Driver {
  if (driver === undefined) {
    driver = Driver.create();
  }
  return driver;
}

// ==================== Lifecycle Functions ====================

export async function startAbility(bundleName: string, abilityName: string): Promise<void> {
  const want: Want = {
    bundleName: bundleName,
    abilityName: abilityName
  };
  await delegator.startAbility(want);
}

export async function startApp(bundleName: string, abilityName: string): Promise<void> {
  await startAbility(bundleName, abilityName);
  await getDriver().waitForIdle(UI_IDLE_TIME, UI_IDLE_TIMEOUT);
}

// ==================== Wait Functions ====================

export async function waitForIdle(): Promise<void> {
  await getDriver().waitForIdle(UI_IDLE_TIME, UI_IDLE_TIMEOUT);
}

export async function waitForTimeout(): Promise<void> {
  await getDriver().waitForIdle(UI_IDLE_TIMEOUT, UI_IDLE_TIMEOUT);
}

export async function waitId(id: string, timeout: number = COMPONENT_WAIT_TIMEOUT): Promise<Component> {
  return getDriver().waitForComponent(ON.id(id), timeout);
}

export async function waitText(text: string, timeout: number = COMPONENT_WAIT_TIMEOUT): Promise<Component> {
  return getDriver().waitForComponent(ON.text(text), timeout);
}

export async function waitIdContains(id: string, expected: string,
  timeout: number = TEXT_WAIT_TIMEOUT): Promise<void> {
  const start: number = Date.now();
  while (Date.now() - start < timeout) {
    const component: Component = await waitId(id);
    const content: string = await component.getText();
    if (content.includes(expected)) {
      return;
    }
    await getDriver().waitForIdle(UI_IDLE_TIME, UI_IDLE_TIMEOUT);
  }
  throw new Error(`${id} does not contain ${expected}`);
}

// ==================== Click Functions ====================

export async function clickById(id: string): Promise<void> {
  hilog.info(DOMAIN, TAG, 'clickById: %{public}s', id);
  const scroll: Component = await getDriver().waitForComponent(ON.type('Scroll'), COMPONENT_WAIT_TIMEOUT);
  await scroll.scrollSearch(ON.id(id));
  const component: Component = await getDriver().findComponent(ON.id(id));
  await component.click();
  await getDriver().waitForIdle(UI_IDLE_TIME, UI_IDLE_TIMEOUT);
}

export async function clickByText(text: string): Promise<void> {
  hilog.info(DOMAIN, TAG, 'clickByText: %{public}s', text);
  const component: Component = await waitText(text);
  await component.click();
  await getDriver().waitForIdle(UI_IDLE_TIME, UI_IDLE_TIMEOUT);
}

// ==================== Text Functions ====================

export async function textOfId(id: string): Promise<string> {
  const scroll: Component = await getDriver().waitForComponent(ON.type('Scroll'), COMPONENT_WAIT_TIMEOUT);
  await scroll.scrollSearch(ON.id(id));
  const component: Component = await waitId(id);
  return component.getText();
}

export async function textOfText(text: string): Promise<string> {
  const component: Component = await waitText(text);
  return component.getText();
}

// ==================== Existence Functions ====================

export async function existsId(id: string): Promise<boolean> {
  try {
    await getDriver().assertComponentExist(ON.id(id));
    return true;
  } catch (error) {
    return false;
  }
}

export async function existsText(text: string): Promise<boolean> {
  try {
    await getDriver().assertComponentExist(ON.text(text));
    return true;
  } catch (error) {
    return false;
  }
}

// ==================== Navigation Functions ====================

export async function pressBack(): Promise<void> {
  await getDriver().pressBack();
  await getDriver().waitForIdle(UI_IDLE_TIME, UI_IDLE_TIMEOUT);
}

export async function scrollToId(id: string): Promise<void> {
  const scroll: Component = await getDriver().waitForComponent(ON.type('Scroll'), COMPONENT_WAIT_TIMEOUT);
  await scroll.scrollSearch(ON.id(id));
  await getDriver().waitForIdle(UI_IDLE_TIME, UI_IDLE_TIMEOUT);
}

export async function scrollToText(expected: string): Promise<void> {
  const scroll: Component = await getDriver().waitForComponent(ON.type('Scroll'), COMPONENT_WAIT_TIMEOUT);
  await scroll.scrollSearch(ON.text(expected));
  await getDriver().waitForIdle(UI_IDLE_TIME, UI_IDLE_TIMEOUT);
}

export async function scrollToTop(): Promise<void> {
  const scroll: Component = await getDriver().waitForComponent(ON.type('Scroll'), COMPONENT_WAIT_TIMEOUT);
  await scroll.scrollToTop();
  await getDriver().waitForIdle(UI_IDLE_TIME, 1000);
}

export async function swipeOnId(id: string, fromRatio: number = 0.75, toRatio: number = 0.25): Promise<void> {
  const component: Component = await waitId(id);
  const bounds = await component.getBounds();
  const centerX: number = (bounds.left + bounds.right) / 2;
  const fromY: number = bounds.top + (bounds.bottom - bounds.top) * fromRatio;
  const toY: number = bounds.top + (bounds.bottom - bounds.top) * toRatio;
  await getDriver().swipe(centerX, fromY, centerX, toY);
  await getDriver().waitForIdle(UI_IDLE_TIME, UI_IDLE_TIMEOUT);
}

// ==================== Assertion Functions ====================

export async function assertTextExists(testName: string, expected: string): Promise<void> {
  hilog.info(DOMAIN, TAG, '%{public}s expects text: %{public}s', testName, expected);
  const scroll: Component = await getDriver().waitForComponent(ON.type('Scroll'), COMPONENT_WAIT_TIMEOUT);
  await scroll.scrollSearch(ON.text(expected));
  await getDriver().assertComponentExist(ON.text(expected));
}

// 快速点击，不使用scroll搜索，但会等待组件出现
export async function quickClick(id: string): Promise<void> {
  // 先等待组件存在，避免点击null
  await waitId(id);
  const component = await getDriver().findComponent(ON.id(id));
  await component.click();
}

export async function assertIdExists(testName: string, id: string): Promise<void> {
  hilog.info(DOMAIN, TAG, '%{public}s expects id: %{public}s', testName, id);
  await getDriver().assertComponentExist(ON.id(id));
}

export async function assertIdText(testName: string, id: string, expected: string): Promise<void> {
  hilog.info(DOMAIN, TAG, '%{public}s expects id %{public}s text: %{public}s', testName, id, expected);
  const actual: string = await textOfId(id);
  if (actual !== expected) {
    throw new Error(`Expected text '${expected}' but got '${actual}' for id ${id}`);
  }
}

export async function assertComponentExists(id: string, testName: string): Promise<void> {
  hilog.info(DOMAIN, TAG, '%{public}s asserts component exists: %{public}s', testName, id);
  const exists: boolean = await existsId(id);
  if (!exists) {
    throw new Error(`Expected component '${id}' to exist but it was not found`);
  }
}

export async function assertComponentNotExists(id: string, testName: string): Promise<void> {
  hilog.info(DOMAIN, TAG, '%{public}s asserts component not exists: %{public}s', testName, id);
  const exists: boolean = await existsId(id);
  if (exists) {
    throw new Error(`Expected component '${id}' to not exist but it was found`);
  }
}

export async function assertTextContains(id: string, expected: string, testName: string): Promise<void> {
  hilog.info(DOMAIN, TAG, '%{public}s asserts id %{public}s contains: %{public}s', testName, id, expected);
  const actual: string = await textOfId(id);
  if (!actual.includes(expected)) {
    throw new Error(`Expected text of '${id}' to contain '${expected}' but got '${actual}'`);
  }
}

export async function assertTextNotEmpty(id: string, testName: string): Promise<void> {
  hilog.info(DOMAIN, TAG, '%{public}s asserts id %{public}s text not empty', testName, id);
  const actual: string = await textOfId(id);
  if (actual.length === 0 || actual === '-') {
    throw new Error(`Expected text of '${id}' to be non-empty but got '${actual}'`);
  }
}

export async function assertTextEquals(id: string, expected: string, testName: string): Promise<void> {
  hilog.info(DOMAIN, TAG, '%{public}s asserts id %{public}s equals: %{public}s', testName, id, expected);
  const actual: string = await textOfId(id);
  if (actual !== expected) {
    throw new Error(`Expected text of '${id}' to equal '${expected}' but got '${actual}'`);
  }
}

// ==================== Utility Functions ====================

export async function getComponentBounds(id: string): Promise<Record<string, number>> {
  const component: Component = await waitId(id);
  const bounds = await component.getBounds();
  const result: Record<string, number> = {};
  result['left'] = bounds.left;
  result['top'] = bounds.top;
  result['right'] = bounds.right;
  result['bottom'] = bounds.bottom;
  result['width'] = bounds.right - bounds.left;
  result['height'] = bounds.bottom - bounds.top;
  return result;
}

export async function waitForTextDisappear(text: string,
  timeout: number = TEXT_WAIT_TIMEOUT): Promise<void> {
  const start: number = Date.now();
  while (Date.now() - start < timeout) {
    try {
      await getDriver().assertComponentExist(ON.text(text));
      await getDriver().waitForIdle(UI_IDLE_TIME, UI_IDLE_TIMEOUT);
    } catch (error) {
      return;
    }
  }
  throw new Error(`Text '${text}' did not disappear within ${timeout}ms`);
}

export async function countComponentsById(id: string): Promise<number> {
  await getDriver().waitForIdle(UI_IDLE_TIME, UI_IDLE_TIMEOUT);
  const components: Component[] = await getDriver().findComponents(ON.id(id));
  return components.length;
}

export async function runCase(name: string, action: () => Promise<void>, done: Function): Promise<void> {
  hilog.info(DOMAIN, TAG, '%{public}s begin', name);
  try {
    await action();
  } catch (error) {
    hilog.error(DOMAIN, TAG, '%{public}s failed: %{public}s', name, JSON.stringify(error));
    expect().assertFail();
  } finally {
    hilog.info(DOMAIN, TAG, '%{public}s end', name);
    done();
  }
}

export async function addLog(format: string, ...args: string[]): Promise<void> {
  hilog.info(DOMAIN, TAG, format, ...args);
}

export async function addLogNumber(format: string, ...args: number[]): Promise<void> {
  hilog.info(DOMAIN, TAG, format, ...args);
}


// ==================== Class-based API (backward compatible) ====================

export class SharedDriver {
  async waitUiIdle(): Promise<void> {
    await waitForIdle();
  }

  async waitTimeout(): Promise<void> {
    await waitForTimeout();
  }

  async clickId(id: string): Promise<void> {
    await clickById(id);
  }

  async getTextById(id: string): Promise<string> {
    return await textOfId(id);
  }

  async existsId(id: string): Promise<boolean> {
    return await existsId(id);
  }

  async scrollToId(id: string): Promise<void> {
    await scrollToId(id);
  }

  async assertComponentExist(id: string): Promise<void> {
    await getDriver().assertComponentExist(ON.id(id));
  }

  async clickAndGetResult(buttonId: string, resultId: string): Promise<string> {
    await clickById(buttonId);
    await waitForIdle();
    return await textOfId(resultId);
  }

  hilogBegin(testName: string): void {
    hilog.info(DOMAIN, TAG, '%{public}s begin', testName);
  }

  hilogEnd(testName: string): void {
    hilog.info(DOMAIN, TAG, '%{public}s end', testName);
  }

  hilogAssert(testName: string, description: string, actual: string): void {
    hilog.info(DOMAIN, TAG, '%{public}s: %{public}s, actual: %{public}s', testName, description, actual);
  }
}
