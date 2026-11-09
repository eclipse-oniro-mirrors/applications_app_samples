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
import { abilityDelegatorRegistry, Component, Driver, ON, Rect } from '@kit.TestKit';
import { expect } from '@ohos/hypium';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PluginAndSkill]';
const COMPONENT_WAIT_TIMEOUT: number = 5000;
const TEXT_WAIT_TIMEOUT: number = 9000;
const UI_IDLE_TIME: number = 200;
const UI_IDLE_TIMEOUT: number = 2000;
const EMPTY_OPTION_TEXT: string = 'Not set (empty value)';
const SELECT_COMPONENT_TYPE: string = 'Select';

const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
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
  const component: Component = await waitId(id, 10000);
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
  const options: Component[] = await getDriver().findComponents(ON.text(optionText));
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

export async function scrollToTop(): Promise<void> {
  const scroll: Component = await getDriver().findComponent(ON.type('Scroll'));
  await scroll.scrollToTop()
  await getDriver().waitForIdle(UI_IDLE_TIME, 1000);
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
  const bounds: Rect = await component.getBounds();
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

export async function addLog(format: string, ...args: string[]): Promise<void> {
  hilog.info(DOMAIN, TAG, format, ...args);
}

export async function addLogNumber(format: string, ...args: number[]): Promise<void> {
  hilog.info(DOMAIN, TAG, format, ...args);
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

export async function navigateToSkillManagerHome(): Promise<void> {
  await clickId('skillButton');
  await waitId('skill_page_title');
}

export async function navigateToSelfSkillQuery(): Promise<void> {
  await navigateToSkillManagerHome();
  await clickId('self_skill_query_button');
  await waitId('self_skill_page_title');
}

export async function navigateToBundleSkillQuery(): Promise<void> {
  await navigateToSkillManagerHome();
  await clickId('bundle_skill_query_button');
  await waitId('bundle_skill_page_title');
}

export async function navigateToAllSkillsQuery(): Promise<void> {
  await navigateToSkillManagerHome();
  await clickId('all_skills_query_button');
  await waitId('all_skills_page_title');
}

export async function resetToIndex(): Promise<void> {
  hilog.info(DOMAIN, TAG, 'resetToIndex: starting navigation reset');
  let attempts: number = 0;
  const maxAttempts: number = 10;
  while (attempts < maxAttempts && (await existsId('skill_page_title') || await existsId('self_skill_page_title') ||
    await existsId('bundle_skill_page_title') || await existsId('all_skills_page_title') ||
    await existsId('skill_execution_page_title') || await existsId('plugin_detail_page_title') ||
    await existsId('skill_compare_page_title') || await existsId('plugin_compare_page_title') ||
    await existsId('skill_history_page_title') || await existsId('plugin_search_page_title') ||
    await existsId('skill_batch_page_title') || await existsId('plugin_manager_page_title'))) {
    hilog.info(DOMAIN, TAG, 'resetToIndex: pressing back, attempt %{public}d', attempts + 1);
    await pressBack();
    attempts++;
  }
  hilog.info(DOMAIN, TAG, 'resetToIndex: waiting for skillButton');
  await waitId('skillButton', 10000);
  hilog.info(DOMAIN, TAG, 'resetToIndex: skillButton found, reset complete');
}

export async function getComponentBounds(id: string): Promise<Record<string, number>> {
  const component: Component = await waitId(id);
  const bounds: Rect = await component.getBounds();
  const result: Record<string, number> = {};
  result['left'] = bounds.left;
  result['top'] = bounds.top;
  result['right'] = bounds.right;
  result['bottom'] = bounds.bottom;
  result['width'] = bounds.right - bounds.left;
  result['height'] = bounds.bottom - bounds.top;
  return result;
}

export async function assertTextEquals(id: string, expected: string, testName: string): Promise<void> {
  hilog.info(DOMAIN, TAG, '%{public}s asserts id %{public}s equals: %{public}s', testName, id, expected);
  const actual: string = await textOfId(id);
  if (actual !== expected) {
    throw new Error(`Expected text of '${id}' to equal '${expected}' but got '${actual}'`);
  }
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

export async function navigateToSkillExecution(): Promise<void> {
  await navigateToSkillManagerHome();
  await clickId('skill_execution_button');
  await waitId('skill_execution_page_title');
}

export async function navigateToSkillCompare(): Promise<void> {
  await navigateToSkillManagerHome();
  await clickId('skill_compare_button');
  await waitId('skill_compare_page_title');
}

export async function navigateToPluginCompare(): Promise<void> {
  await navigateToPluginManagerHome();
  await clickId('plugin_compare_nav_button');
  await waitId('plugin_compare_page_title');
}

export async function navigateToSkillHistory(): Promise<void> {
  await navigateToSkillManagerHome();
  await clickId('skill_history_button');
  await waitId('skill_history_page_title');
}

export async function navigateToPluginSearch(): Promise<void> {
  await navigateToPluginManagerHome();
  await clickId('plugin_search_nav_button');
  await waitId('plugin_search_page_title');
}

export async function navigateToSkillBatch(): Promise<void> {
  await navigateToSkillManagerHome();
  await clickId('skill_batch_button');
  await waitId('skill_batch_page_title');
}

export async function navigateToPluginManagerHome(): Promise<void> {
  await clickId('pluginButton');
  await waitId('plugin_manager_page_title');
}
