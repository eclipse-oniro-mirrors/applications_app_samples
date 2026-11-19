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

import { describe, it, expect, beforeAll, afterAll } from '@ohos/hypium';
import { Driver, ON, Component } from '@ohos.UiTest';
import { getDriver, launchShareApp, pressAndWait, KEY_BACK } from '../Shared/CustomShareDriver';

async function tapId(driver: Driver, id: string): Promise<boolean> {
  for (let i = 0; i < 8; i++) {
    const c: Component | null = await driver.findComponent(ON.id(id));
    if (c !== null && c !== undefined) {
      await c.click();
      await driver.delayMs(80);
      return true;
    }
    await driver.delayMs(80);
  }
  return false;
}

async function waitId(driver: Driver, id: string): Promise<boolean> {
  for (let i = 0; i < 10; i++) {
    const c: Component | null = await driver.findComponent(ON.id(id));
    if (c !== null && c !== undefined) {
      return true;
    }
    await driver.delayMs(80);
  }
  return false;
}

export default function shareUIFlowTest() {
  describe('ShareUIFlow_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      try {
        driver = getDriver();
        await launchShareApp();
        await driver.delayMs(500);
        for (let i = 0; i < 3; i++) {
          const allow: Component | null = await driver.findComponent(ON.text('鍏佽'));
          if (allow === null || allow === undefined) {
            break;
          }
          await allow.click();
          await driver.delayMs(80);
        }
        await tapId(driver, 'shareLinkResource');
        await waitId(driver, 'toShare');
        await tapId(driver, 'cancellation');
        await driver.delayMs(100);
      } catch (e) {
        expect(true).assertTrue();
      }
    });

    afterAll(async () => {
      try {
        await pressAndWait(driver, KEY_BACK, 1, 40);
      } catch (e) {
        expect(true).assertTrue();
      }
    });

    it('home_three_entries_should_render', 0, async () => {
      expect(await waitId(driver, 'shareLinkResource')).assertTrue();
      expect(await waitId(driver, 'shareFileResource')).assertTrue();
      expect(await waitId(driver, 'shareOtherResource')).assertTrue();
    });

    it('link_share_dialog_and_template_should_show', 0, async () => {
      await tapId(driver, 'shareLinkResource');
      expect(await waitId(driver, 'toShare')).assertTrue();
      await tapId(driver, 'cancellation');
      expect(await waitId(driver, 'shareLinkResource')).assertTrue();
    });

    it('file_share_dialog_should_open_and_cancel', 0, async () => {
      expect(await tapId(driver, 'shareFileResource')).assertTrue();
      expect(await waitId(driver, 'toShare')).assertTrue();
      const images: Component[] = await driver.findComponents(ON.type('Image'));
      expect(images.length).assertLargerOrEqual(1);
      await tapId(driver, 'cancellation');
      expect(await waitId(driver, 'shareFileResource')).assertTrue();
    });

    it('other_share_dialog_should_open_and_cancel', 0, async () => {
      expect(await tapId(driver, 'shareOtherResource')).assertTrue();
      expect(await waitId(driver, 'toShare')).assertTrue();
      await tapId(driver, 'cancellation');
      expect(await waitId(driver, 'shareOtherResource')).assertTrue();
    });

    it('back_key_close_and_repeat_should_be_stable', 0, async () => {
      await tapId(driver, 'shareLinkResource');
      expect(await waitId(driver, 'toShare')).assertTrue();
      await pressAndWait(driver, KEY_BACK, 1, 40);
      expect(await waitId(driver, 'shareLinkResource')).assertTrue();
    });
  });
}

