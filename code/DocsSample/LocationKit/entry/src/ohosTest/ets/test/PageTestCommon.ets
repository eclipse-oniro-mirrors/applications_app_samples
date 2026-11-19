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

import { Driver, ON } from '@kit.TestKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { Want } from '@kit.AbilityKit';

// Start the entry ability and return a UiDriver.
export async function startApp(): Promise<Driver> {
  let delegator = abilityDelegatorRegistry.getAbilityDelegator();
  let bundleName: string = abilityDelegatorRegistry.getArguments().bundleName;
  let want: Want = {
    bundleName: bundleName,
    abilityName: 'EntryAbility',
    moduleName: 'entry'
  };
  await delegator.startAbility(want);
  let driver = Driver.create();
  await driver.delayMs(2000);
  return driver;
}

// If the current screen is a sub page, go back to the main page first.
export async function backToMainIfSubPage(driver: Driver): Promise<void> {
  try {
    let backBtn = await driver.findComponent(ON.id('btn_nav_back'));
    if (backBtn !== null) {
      await driver.pressBack();
      await driver.delayMs(1000);
    }
  } catch (e) {
    // Already on the main page.
  }
}

// Navigate from the main page to the page identified by menuId.
export async function enterPage(driver: Driver, menuId: string): Promise<void> {
  await backToMainIfSubPage(driver);
  let menu = await driver.findComponent(ON.id(menuId));
  await menu.click();
  await driver.delayMs(1000);
}

// Check whether a component with the given id exists on the current page.
export async function componentExists(driver: Driver, componentId: string): Promise<boolean> {
  let exist: boolean = false;
  try {
    await driver.findComponent(ON.id(componentId));
    exist = true;
  } catch (e) {
    exist = false;
  }
  return exist;
}
