/*
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import { Component, Driver, ON, On } from '@ohos.UiTest';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { hilog } from '@kit.PerformanceAnalysisKit';

const BUNDLE: string = 'com.sample.dlpmanager';
const ABILITY: string = 'EntryAbility';
const DOMAIN: number = 0xF814;
const TAG: string = 'DlpUiCommon';

const delegator = AbilityDelegatorRegistry.getAbilityDelegator();

export function logUi(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

export function sleepUi(duration: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(() => {
      resolve();
    }, duration);
  });
}

async function findUi(driver: Driver, matcher: On, timeout: number): Promise<Component | null> {
  try {
    const component: Component = await driver.waitForComponent(matcher, timeout);
    if (component !== undefined && component !== null) {
      return component;
    }
    return null;
  } catch (error) {
    return null;
  }
}

export async function existsUi(driver: Driver, id: string): Promise<boolean> {
  const component: Component | null = await findUi(driver, ON.id(id), 500);
  return component !== null;
}

export async function clickIdUi(driver: Driver, id: string): Promise<boolean> {
  const component: Component | null = await findUi(driver, ON.id(id), 500);
  if (component === null) {
    return false;
  }
  try {
    await component.click();
    await sleepUi(250);
    return true;
  } catch (error) {
    logUi('clickId failed: ' + id + ' -> ' + String(error));
    return false;
  }
}

export async function inputIdUi(driver: Driver, id: string, text: string): Promise<boolean> {
  const component: Component | null = await findUi(driver, ON.id(id), 500);
  if (component === null) {
    return false;
  }
  try {
    await component.inputText(text);
    await sleepUi(300);
    return true;
  } catch (error) {
    logUi('inputId failed: ' + id + ' -> ' + String(error));
    return false;
  }
}

export async function inputUntilVisible(driver: Driver, id: string, text: string,
  targetId: string): Promise<boolean> {
  for (let attempt = 0; attempt < 2; attempt++) {
    await inputIdUi(driver, id, text);
    if (await existsUi(driver, targetId)) {
      return true;
    }
  }
  return await existsUi(driver, targetId);
}

export async function scrollTopUi(driver: Driver, id: string): Promise<boolean> {
  const component: Component | null = await findUi(driver, ON.id(id), 500);
  if (component === null) {
    return false;
  }
  try {
    await component.scrollToTop(300);
    await sleepUi(250);
    return true;
  } catch (error) {
    logUi('scrollTop failed: ' + id + ' -> ' + String(error));
    return false;
  }
}

export async function scrollBottomUi(driver: Driver, id: string): Promise<boolean> {
  const component: Component | null = await findUi(driver, ON.id(id), 500);
  if (component === null) {
    return false;
  }
  try {
    await component.scrollToBottom(300);
    await sleepUi(250);
    return true;
  } catch (error) {
    logUi('scrollBottom failed: ' + id + ' -> ' + String(error));
    return false;
  }
}

const ALLOW_TEXTS: Array<string> = ['允许', '允许本次使用', '仅使用期间允许', '始终允许', 'Allow'];

async function clickAllowIfPresent(driver: Driver): Promise<boolean> {
  for (let index = 0; index < ALLOW_TEXTS.length; index++) {
    try {
      const button: Component = await driver.waitForComponent(ON.text(ALLOW_TEXTS[index]), 150);
      if (button !== undefined && button !== null) {
        await button.click();
        await sleepUi(250);
        return true;
      }
    } catch (error) {
      continue;
    }
  }
  return false;
}

export async function allowPermissionDialogs(driver: Driver): Promise<void> {
  for (let attempt = 0; attempt < 2; attempt++) {
    if (!(await clickAllowIfPresent(driver))) {
      return;
    }
  }
}

async function closeMenuIfOpen(driver: Driver): Promise<void> {
  if (await existsUi(driver, 'index_menu_12')) {
    try {
      await driver.pressBack();
    } catch (error) {
      logUi('closeMenuIfOpen failed: ' + String(error));
    }
    await sleepUi(150);
  }
}

async function resetToHome(driver: Driver): Promise<boolean> {
  let probed: boolean = false;
  for (let attempt = 0; attempt < 4; attempt++) {
    if (await existsUi(driver, 'moreIcon')) {
      await closeMenuIfOpen(driver);
      return true;
    }
    if (!probed) {
      probed = true;
      if (await clickAllowIfPresent(driver)) {
        continue;
      }
    }
    try {
      await driver.pressBack();
    } catch (error) {
      logUi('resetToHome pressBack failed: ' + String(error));
    }
    await sleepUi(200);
  }
  return await existsUi(driver, 'moreIcon');
}

export async function launchAppUi(driver: Driver): Promise<void> {
  if (await existsUi(driver, 'moreIcon')) {
    await closeMenuIfOpen(driver);
    return;
  }
  if (await resetToHome(driver)) {
    return;
  }
  await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
  await sleepUi(900);
  if (await resetToHome(driver)) {
    return;
  }
  await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
  await sleepUi(1200);
  await resetToHome(driver);
}

export async function openMenuEntry(driver: Driver, entryId: string): Promise<boolean> {
  if (!(await existsUi(driver, 'moreIcon'))) {
    return false;
  }
  if (!(await existsUi(driver, 'index_menu_12'))) {
    await clickIdUi(driver, 'moreIcon');
    await sleepUi(200);
  }
  if (!(await existsUi(driver, entryId))) {
    await clickIdUi(driver, 'moreIcon');
    await sleepUi(200);
  }
  const clicked: boolean = await clickIdUi(driver, entryId);
  await sleepUi(500);
  return clicked;
}
