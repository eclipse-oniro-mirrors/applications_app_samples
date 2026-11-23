/*
* Copyright (c) 2023 Hunan OpenValley Digital Industry Development Co., Ltd.
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

import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Component, Driver, ON } from '@ohos.UiTest';

const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const MAX_PERMISSION_DIALOGS: number = 3;

export function getString(resourceData: Resource): string {
  let manage = delegator.getAppContext().resourceManager
  return manage.getStringSync(resourceData)
}

function waitForPermissionChange(): Promise<void> {
  return new Promise<void>((resolve) => {
    setTimeout(resolve, 500);
  });
}

export async function ensureIndexPage(driver: Driver): Promise<void> {
  for (let step: number = 0; step < 3; step++) {
    try {
      await driver.assertComponentExist(ON.id('picture_operate'));
      return;
    } catch (error) {
      await driver.pressBack();
      await driver.delayMs(500);
    }
  }
  await driver.assertComponentExist(ON.id('picture_operate'));
}

export async function dismissPermissionDialog(driver: Driver): Promise<void> {
  const allowTexts: string[] = [getString($r('app.string.allow')), 'Allow'];
  for (let dialogIndex: number = 0; dialogIndex < MAX_PERMISSION_DIALOGS; dialogIndex++) {
    let clicked: boolean = false;
    for (let textIndex: number = 0; textIndex < allowTexts.length; textIndex++) {
      let component: Component | null = null;
      try {
        component = await driver.findComponent(ON.text(allowTexts[textIndex]));
      } catch (error) {
        continue;
      }
      if (component === undefined || component === null) {
        continue;
      }
      await component.click();
      clicked = true;
      await waitForPermissionChange();
      break;
    }
    if (!clicked) {
      return;
    }
  }
}