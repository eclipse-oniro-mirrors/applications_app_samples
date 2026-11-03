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

import { Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { abilityDelegatorRegistry, Component, Driver, ON } from '@kit.TestKit';
import { expect } from '@ohos/hypium';

const DOMAIN = 0xF811;
const TAG = '[Sample_PluginAndSkill]';
const COMPONENT_WAIT_TIMEOUT = 5000;
const TEXT_WAIT_TIMEOUT = 9000;
const UI_IDLE_TIME = 200;
const UI_IDLE_TIMEOUT = 2000;
const EMPTY_OPTION_TEXT = 'Not set (empty value)';
const SELECT_COMPONENT_TYPE = 'Select';

const delegator = abilityDelegatorRegistry.getAbilityDelegator();
let driver: Driver | undefined = undefined;

export function getDriver(): Driver {
  if (driver === undefined) {
    driver = Driver.create();
  }
  return driver;
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
  await getDriver().waitForIdle(UI_IDLE_TIME, UI_IDLE_TIMEOUT);
}

export async function waitId(id: string, timeout: number = COMPONENT_WAIT_TIMEOUT): Promise<Component> {
  return getDriver().waitForComponent(ON.id(id), timeout);
}

export async function waitText(text: string, timeout: number = COMPONENT_WAIT_TIMEOUT): Promise<Component> {
  return getDriver().waitForComponent(ON.text(text), timeout);
}

export async function clickId(id: string): Promise<void> {
  hilog.info(DOMAIN, TAG, 'UI step: wait for id %{public}s', id);
  const component: Component = await waitId(id);
  await component.click();
  await getDriver().waitForIdle(UI_IDLE_TIME, UI_IDLE_TIMEOUT);
  hilog.info(DOMAIN, TAG, 'UI step: clicked id %{public}s', id);
}

export async function clickText(text: string): Promise<void> {
  hilog.info(DOMAIN, TAG, 'UI step: wait for text %{public}s', text);
  const component: Component = await waitText(text);
  hilog.info(DOMAIN, TAG, 'UI step: click text %{public}s', text);
  await component.click();
  await getDriver().waitForIdle(UI_IDLE_TIME, UI_IDLE_TIMEOUT);
  hilog.info(DOMAIN, TAG, 'UI step: clicked text %{public}s', text);
}

export async function textOfId(id: string): Promise<string> {
  const component: Component = await waitId(id);
  return component.getText();
}

export async function textOfText(text: string): Promise<string> {
  const component: Component = await waitText(text);
  return component.getText();
}

export async function existsId(id: string): Promise<boolean> {
  try {
    await getDriver().assertComponentExist(ON.id(id));
    return true;
  } catch (error) {
    return false;
  }
}

async function selectOption(selectId: string, optionText: string): Promise<void> {
  const select: Component = await getDriver().waitForComponent(ON.id(selectId), COMPONENT_WAIT_TIMEOUT);
  const currentText: string = await select.getText();
  hilog.info(DOMAIN, TAG, 'UI step: Select %{public}s current=%{public}s target=%{public}s',
    selectId, currentText, optionText);
  if (currentText === optionText) {
    return;
  }
  await select.click();
  await getDriver().waitForIdle(UI_IDLE_TIME, UI_IDLE_TIMEOUT);
  const options: Array<Component> = await getDriver().findComponents(ON.text(optionText));
  for (const option of options) {
    const componentType: string = await option.getType();
    const clickable: boolean = await option.isClickable();
    if (componentType !== SELECT_COMPONENT_TYPE && clickable) {
      await option.click();
      await getDriver().waitForIdle(UI_IDLE_TIME, UI_IDLE_TIMEOUT);
      hilog.info(DOMAIN, TAG, 'UI step: selected %{public}s', optionText);
      return;
    }
  }
  throw new Error(`Option not found: ${optionText}`);
}

export async function selectValue(selectId: string, value: string): Promise<void> {
  const optionText: string = value.length === 0 ? EMPTY_OPTION_TEXT : value;
  await selectOption(selectId, optionText);
}

export async function assertTextExists(testName: string, expected: string): Promise<void> {
  hilog.info(DOMAIN, TAG, '%{public}s expects text: %{public}s', testName, expected);
  const scroll: Component = await getDriver().findComponent(ON.type('Scroll'));
  await scroll.scrollSearch(ON.text(expected));
  await getDriver().assertComponentExist(ON.text(expected));
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

export async function pressBack(): Promise<void> {
  await getDriver().pressBack();
  await getDriver().waitForIdle(UI_IDLE_TIME, UI_IDLE_TIMEOUT);
}

export async function scrollToId(id: string): Promise<void> {
  const scroll: Component = await getDriver().findComponent(ON.type('Scroll'));
  await scroll.scrollSearch(ON.id(id));
  await getDriver().waitForIdle(UI_IDLE_TIME, UI_IDLE_TIMEOUT);
}

export async function scrollToText(expected: string): Promise<void> {
  const scroll: Component = await getDriver().findComponent(ON.type('Scroll'));
  await scroll.scrollSearch(ON.text(expected));
  await getDriver().waitForIdle(UI_IDLE_TIME, UI_IDLE_TIMEOUT);
}

export async function waitIdContains(id: string, expected: string,
  timeout: number = TEXT_WAIT_TIMEOUT): Promise<void> {
  const start: number = Date.now();
  while (Date.now() - start < timeout) {
    const content: string = await textOfId(id);
    if (content.includes(expected)) {
      return;
    }
    await getDriver().waitForIdle(UI_IDLE_TIME, UI_IDLE_TIMEOUT);
  }
  throw new Error(`${id} does not contain ${expected}`);
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
export async function addLog(format: string,...args: string[]): Promise<void> {
  hilog.info(DOMAIN, TAG, format, ...args);
}
