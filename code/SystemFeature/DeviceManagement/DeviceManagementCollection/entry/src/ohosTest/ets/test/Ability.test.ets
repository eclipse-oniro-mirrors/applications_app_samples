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

import { describe, beforeAll, afterAll, it, expect } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { logger } from '../util/Logger';
import {
  getDriver,
  launchDeviceManagementApp,
  waitForMenuStable,
  pressBack,
  openCapability,
  componentCount,
  checkTextContent,
  serializedDelay,
  runSerializedUiOperation
} from './Shared/SharedDriver';

const TAG: string = '[Sample_AbilityTest]';
const BUNDLE: string = 'DeviceManagementSys_';
const MANAGE = AbilityDelegatorRegistry.getAbilityDelegator().getAppContext().resourceManager;
let loadedTitles: string[] = [];

/** Menu titles mirror app.strarray.device_management_list (zh_CN and en_US). */
const MENU_CANDIDATES: string[][] = [
  ['耗电统计', 'Battery Statistics'],
  ['屏幕亮度', 'Screen Brightness'],
  ['系统电源管理', 'System Power Management'],
  ['设置数据项名称', 'Data Item Settings'],
  ['系统能力', 'SystemCapability'],
  ['电量信息', 'Battery Information'],
  ['设备信息', 'Device Information'],
  ['组合按键', 'Input Consumer'],
  ['输入设备', 'Input Device'],
  ['输入事件', 'Input Event'],
  ['输入按键事件', 'Input Key Event'],
  ['鼠标指针', 'Mouse Pointer'],
  ['系统参数', 'System Parameter']
];

/** Dismiss the runtime permission dialog if it is present. */
async function clickAllowIfPresent(driver: Driver): Promise<boolean> {
  const labels: string[] = ['允许', 'Allow', 'ALLOW'];
  for (const label of labels) {
    const clicked: boolean = await runSerializedUiOperation(async () => {
      const buttons = await driver.findComponents(ON.text(label));
      if (buttons === null || buttons === undefined || buttons.length === 0) {
        return false;
      }
      await buttons[0].click();
      return true;
    });
    if (clicked) {
      logger.info(TAG, 'permission dialog allowed by label: ' + label);
      await serializedDelay(driver, 1000);
      return true;
    }
  }
  return false;
}

async function checkAny(driver: Driver, labels: string[]): Promise<boolean> {
  for (const label of labels) {
    const components = await runSerializedUiOperation(async () => {
      return await driver.findComponents(ON.text(label));
    });
    if (components !== null && components !== undefined && components.length > 0) {
      return true;
    }
  }
  return false;
}

async function openAny(driver: Driver, labels: string[]): Promise<boolean> {
  for (const label of labels) {
    if (await openCapability(driver, label)) {
      return true;
    }
  }
  return false;
}

async function ensureMenu(driver: Driver): Promise<void> {
  for (let i = 0; i < 12; i++) {
    if (await clickAllowIfPresent(driver)) {
      continue;
    }
    if (await checkAny(driver, titleAt(0))) {
      return;
    }
    await pressBack(driver);
    await serializedDelay(driver, 300);
  }
}

async function verifyCapability(driver: Driver, labels: string[]): Promise<void> {
  logger.info(TAG, 'verifyCapability begin: ' + labels[0]);
  await ensureMenu(driver);
  const opened: boolean = await openAny(driver, labels);
  expect(opened).assertTrue();
  await serializedDelay(driver, 400);
  const count: number = await componentCount(driver);
  expect(count > 0).assertTrue();
  await pressBack(driver);
  await serializedDelay(driver, 400);
  logger.info(TAG, 'verifyCapability end: ' + labels[0]);
}

async function loadMenuTitles(): Promise<string[]> {
  try {
    return await MANAGE.getStringArrayByName('device_management_list');
  } catch (error) {
    return [];
  }
}

function titleAt(index: number): string[] {
  if (loadedTitles.length > index) {
    return [loadedTitles[index]];
  }
  return MENU_CANDIDATES[index];
}
export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    let driver: Driver;

    beforeAll(async () => {
      logger.info(TAG, 'StartAbility_001 begin');
      driver = getDriver();
      await launchDeviceManagementApp();
      await serializedDelay(driver, 1000);
      await clickAllowIfPresent(driver);
      loadedTitles = await loadMenuTitles();
      const ready: boolean = await waitForMenuStable(driver);
      expect(ready).assertTrue();
      await ensureMenu(driver);
      logger.info(TAG, 'StartAbility_001 end');
    });

    afterAll(async () => {
      await pressBack(driver);
      await serializedDelay(driver, 300);
    });

    it(BUNDLE + 'Menu_001', 0, async (done: () => void) => {
      try {
        logger.info(TAG, 'Menu_001 begin');
        expect(await checkAny(driver, titleAt(0))).assertTrue();
        expect(await componentCount(driver) > 0).assertTrue();
        logger.info(TAG, 'Menu_001 end');
      } finally {
        done();
      }
    });
    it(BUNDLE + 'BatteryStats_001', 0, async (done: () => void) => {
      try {
        await verifyCapability(driver, titleAt(0));
      } finally {
        done();
      }
    });

    it(BUNDLE + 'Brightness_001', 0, async (done: () => void) => {
      try {
        await verifyCapability(driver, titleAt(1));
      } finally {
        done();
      }
    });

    it(BUNDLE + 'Power_001', 0, async (done: () => void) => {
      try {
        await verifyCapability(driver, titleAt(2));
      } finally {
        done();
      }
    });

    it(BUNDLE + 'Settings_001', 0, async (done: () => void) => {
      try {
        await verifyCapability(driver, titleAt(3));
      } finally {
        done();
      }
    });

    it(BUNDLE + 'SystemCapability_001', 0, async (done: () => void) => {
      try {
        await verifyCapability(driver, titleAt(4));
      } finally {
        done();
      }
    });

    it(BUNDLE + 'BatteryManager_001', 0, async (done: () => void) => {
      try {
        await verifyCapability(driver, titleAt(5));
      } finally {
        done();
      }
    });

    it(BUNDLE + 'DeviceInfo_001', 0, async (done: () => void) => {
      try {
        await verifyCapability(driver, titleAt(6));
      } finally {
        done();
      }
    });

    it(BUNDLE + 'InputConsumer_001', 0, async (done: () => void) => {
      try {
        await verifyCapability(driver, titleAt(7));
      } finally {
        done();
      }
    });

    it(BUNDLE + 'InputDeviceManager_001', 0, async (done: () => void) => {
      try {
        await verifyCapability(driver, titleAt(8));
      } finally {
        done();
      }
    });

    it(BUNDLE + 'InputEventManager_001', 0, async (done: () => void) => {
      try {
        await verifyCapability(driver, titleAt(9));
      } finally {
        done();
      }
    });

    it(BUNDLE + 'InputKeyEventManager_001', 0, async (done: () => void) => {
      try {
        await verifyCapability(driver, titleAt(10));
      } finally {
        done();
      }
    });

    it(BUNDLE + 'MouseManager_001', 0, async (done: () => void) => {
      try {
        await verifyCapability(driver, titleAt(11));
      } finally {
        done();
      }
    });

    it(BUNDLE + 'SystemParameter_001', 0, async (done: () => void) => {
      try {
        await verifyCapability(driver, titleAt(12));
      } finally {
        done();
      }
    });
  });
}
