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

import { Want, common } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { abilityDelegatorRegistry, Component, Driver, ON } from '@kit.TestKit';
import { expect } from '@ohos/hypium';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SendableDataStore]';
const COMPONENT_WAIT_TIMEOUT: number = 10000;
const TEXT_WAIT_TIMEOUT: number = 12000;
const UI_IDLE_TIME: number = 300;
const UI_IDLE_TIMEOUT: number = 3000;

const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
let driver: Driver | undefined = undefined;
let testUIAbilityContext: common.UIAbilityContext | undefined = undefined;

export function setTestContext(context: common.UIAbilityContext): void {
  testUIAbilityContext = context;
}

export function getTestContext(): common.UIAbilityContext {
  if (testUIAbilityContext !== undefined) {
    return testUIAbilityContext;
  }
  const appContext = delegator.getAppContext();
  return appContext as common.UIAbilityContext;
}

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
  const component: Component = await getDriver().waitForComponent(ON.id(id), timeout);
  if (component === null || component === undefined) {
    throw new Error(`Component with id '${id}' not found within ${timeout}ms`);
  }
  return component;
}

export async function waitText(text: string, timeout: number = COMPONENT_WAIT_TIMEOUT): Promise<Component> {
  const component: Component = await getDriver().waitForComponent(ON.text(text), timeout);
  if (component === null || component === undefined) {
    throw new Error(`Component with text '${text}' not found within ${timeout}ms`);
  }
  return component;
}

export async function clickId(id: string): Promise<void> {
  hilog.info(DOMAIN, TAG, 'UI step: wait for id %{public}s', id);
  const component: Component = await waitId(id, 10000);
  hilog.info(DOMAIN, TAG, 'UI step: clicking id %{public}s', id);
  await component.click();
  await getDriver().waitForIdle(UI_IDLE_TIME, UI_IDLE_TIMEOUT);
  hilog.info(DOMAIN, TAG, 'UI step: clicked id %{public}s', id);
}

export async function clickText(text: string): Promise<void> {
  hilog.info(DOMAIN, TAG, 'UI step: wait for text %{public}s', text);
  const component: Component = await waitText(text);
  hilog.info(DOMAIN, TAG, 'UI step: clicking text %{public}s', text);
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
    await getDriver().waitForIdle(100, 500);
    await getDriver().assertComponentExist(ON.id(id));
    return true;
  } catch (error) {
    return false;
  }
}

export async function existsText(text: string): Promise<boolean> {
  try {
    await getDriver().waitForIdle(100, 500);
    await getDriver().assertComponentExist(ON.text(text));
    return true;
  } catch (error) {
    return false;
  }
}

export async function assertTextExists(testName: string, expected: string): Promise<void> {
  hilog.info(DOMAIN, TAG, '%{public}s expects text: %{public}s', testName, expected);
  const scroll: Component = await getDriver().findComponent(ON.type('Scroll'));
  await scroll.scrollSearch(ON.text(expected));
  await getDriver().assertComponentExist(ON.text(expected));
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
  await getDriver().waitForIdle(UI_IDLE_TIME, UI_IDLE_TIMEOUT);
  const scroll: Component = await getDriver().findComponent(ON.type('Scroll'));
  await scroll.scrollSearch(ON.text(expected));
  await getDriver().waitForIdle(UI_IDLE_TIME, UI_IDLE_TIMEOUT);
}

// Swipe up to scroll the page content (for pages with List/Scroll)
export async function swipeUp(): Promise<void> {
  // Use fixed coordinates for a typical device screen
  const centerX: number = 540;
  const startY: number = 1400;
  const endY: number = 600;
  await getDriver().swipe(centerX, startY, centerX, endY, 500);
  await getDriver().waitForIdle(UI_IDLE_TIME, UI_IDLE_TIMEOUT);
}

export async function runCase(name: string, action: () => Promise<void>, done: Function): Promise<void> {
  hilog.info(DOMAIN, TAG, '%{public}s begin', name);
  try {
    await action();
  } catch (error) {
    const err = error as Error;
    hilog.error(DOMAIN, TAG, '%{public}s failed: %{public}s', name, err.message ?? String(err));
    throw err;
  } finally {
    try {
      await getDriver().waitForIdle(100, 1000);
    } catch (_e) {
      // Ignore idle wait errors in cleanup
    }
    hilog.info(DOMAIN, TAG, '%{public}s end', name);
    done();
  }
}

export async function addLog(format: string, ...args: (string | number)[]): Promise<void> {
  hilog.info(DOMAIN, TAG, format, ...args);
}

export async function assertTextContains(id: string, expected: string, testName: string): Promise<void> {
  hilog.info(DOMAIN, TAG, '%{public}s asserts id %{public}s contains: %{public}s', testName, id, expected);
  const actual: string = await textOfId(id);
  if (!actual.includes(expected)) {
    throw new Error(`Expected text of '${id}' to contain '${expected}' but got '${actual}'`);
  }
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

export async function navigateToPreferencesHome(): Promise<void> {
  await clickId('preferencesButton');
  await waitId('preferences_page_title');
}

export async function navigateToRdbHome(): Promise<void> {
  await clickId('rdbButton');
  await waitId('rdb_page_title');
}

export async function navigateToArrayHome(): Promise<void> {
  await clickId('arrayButton');
  await waitId('array_page_title');
}

export async function navigateToMapHome(): Promise<void> {
  await clickId('mapButton');
  await waitId('map_page_title');
}

export async function navigateToQueueHome(): Promise<void> {
  await clickId('queueButton');
  await waitId('queue_page_title');
}

export async function navigateToRecordHome(): Promise<void> {
  await clickId('recordButton');
  await waitId('record_page_title');
}

export async function navigateToMigrationHome(): Promise<void> {
  await clickId('migrationButton');
  await waitId('migration_page_title');
}

export async function navigateToBackupHome(): Promise<void> {
  await clickId('backupButton');
  await waitId('backup_page_title');
}

export async function navigateToEncryptionHome(): Promise<void> {
  await clickId('encryptionButton');
  await waitId('encryption_page_title');
}

export async function navigateToDistributedHome(): Promise<void> {
  await clickId('distributedButton');
  await waitId('distributed_page_title');
}

export async function resetToIndex(): Promise<void> {
  hilog.info(DOMAIN, TAG, 'resetToIndex: starting navigation reset');
  let attempts: number = 0;
  const maxAttempts: number = 10;
  while (attempts < maxAttempts && (await existsId('preferences_page_title') || await existsId('rdb_page_title') ||
    await existsId('array_page_title') || await existsId('map_page_title') ||
    await existsId('queue_page_title') || await existsId('record_page_title') ||
    await existsId('migration_page_title') || await existsId('backup_page_title') ||
    await existsId('encryption_page_title') || await existsId('distributed_page_title'))) {
    hilog.info(DOMAIN, TAG, 'resetToIndex: pressing back, attempt %{public}d', attempts + 1);
    await pressBack();
    await getDriver().waitForIdle(200, 1000);
    attempts++;
  }
  hilog.info(DOMAIN, TAG, 'resetToIndex: waiting for preferencesButton');
  await waitId('preferencesButton', 10000);
  hilog.info(DOMAIN, TAG, 'resetToIndex: reset complete');
}
