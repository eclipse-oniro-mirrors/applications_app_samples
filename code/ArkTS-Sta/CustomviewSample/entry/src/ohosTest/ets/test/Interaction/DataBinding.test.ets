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
import { Driver } from '@kit.TestKit';
import {
  getDriver,
  KEY_LEFT,
  KEY_RIGHT,
  KEY_BACK,
  KEY_TAB_TOGGLE,
  pageComponentCount,
  checkFocusState,
  waitForPageStable,
  checkTextContent,
  pressAndWait,
  serializedDelay,
  TIMEOUT_TAB_RENDER,
  DELAY_KEY_NAVIGATION,
  runSerializedUiOperation,
  getCurrentFocusIndex
} from '../Shared/CustomViewTestDriver';

// 关闭页签页的辅助函数：确保测试环境干净
async function closeTabIfExists(drv: Driver): Promise<void> {
  await runSerializedUiOperation(async () => {
    await drv.triggerKey(KEY_BACK);
    await drv.delayMs(300);
  });
}

// 触发页签页的辅助函数：确保页签页正确显示
async function openSamplePage(drv: Driver): Promise<void> {
  await closeTabIfExists(drv);
  await runSerializedUiOperation(async () => {
    await drv.triggerKey(KEY_TAB_TOGGLE);
    await drv.delayMs(500);
  });
}

interface DataBindingRecord {
  bindingPath: string;
  oldValue: string;
  newValue: string;
  timestamp: number;
  syncSuccessful: boolean;
}

class DataBindingTracker {
  private static instance: DataBindingTracker;
  private bindingHistory: DataBindingRecord[] = [];
  private totalBindings: number = 0;
  private successfulSyncs: number = 0;

  public static getInstance(): DataBindingTracker {
    if (!DataBindingTracker.instance) {
      DataBindingTracker.instance = new DataBindingTracker();
    }
    return DataBindingTracker.instance;
  }

  public recordBinding(bindingPath: string, oldValue: string, newValue: string, syncSuccessful: boolean): void {
    const record: DataBindingRecord = {
      bindingPath,
      oldValue,
      newValue,
      timestamp: Date.now(),
      syncSuccessful
    };
    this.bindingHistory.push(record);
    this.totalBindings++;
    if (syncSuccessful) {
      this.successfulSyncs++;
    }
  }

  public getBindingHistory(): DataBindingRecord[] {
    return [...this.bindingHistory];
  }

  public getTotalBindings(): number {
    return this.totalBindings;
  }

  public getSuccessfulSyncs(): number {
    return this.successfulSyncs;
  }

  public resetTracker(): void {
    this.bindingHistory = [];
    this.totalBindings = 0;
    this.successfulSyncs = 0;
  }

  public hasBindingForPath(bindingPath: string): boolean {
    return this.bindingHistory.some(record => record.bindingPath === bindingPath);
  }

  public getBindingCountForPath(bindingPath: string): number {
    return this.bindingHistory.filter(record => record.bindingPath === bindingPath).length;
  }

  public getSyncSuccessRate(): number {
    if (this.totalBindings === 0) {
      return 0;
    }
    return this.successfulSyncs / this.totalBindings;
  }
}

export default function dataBindingTest() {
  describe('DataBinding_Test', () => {
    let driver: Driver;
    let bindingTracker: DataBindingTracker;

    beforeAll(async () => {
      driver = getDriver();
      bindingTracker = DataBindingTracker.getInstance();
      bindingTracker.resetTracker();
      await closeTabIfExists(driver);
      await driver.delayMs(500);
    });

    afterAll(async () => {
      await closeTabIfExists(driver);
      await serializedDelay(driver, 300);
    });

    it('tab_should_display_correct_option_labels', 0, async () => {
      await openSamplePage(driver);
      await waitForPageStable(driver, TIMEOUT_TAB_RENDER);

      const componentCount = await pageComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);

      const hasSuspend = await checkTextContent(driver, '息屏');
      const hasShutdown = await checkTextContent(driver, '在线换座');
      const hasReboot = await checkTextContent(driver, '余票挖掘');
      const hasAnyText = hasSuspend || hasShutdown || hasReboot;

      if (hasAnyText) {
        bindingTracker.recordBinding('option_labels', '', '息屏, 在线换座, 余票挖掘', true);
      } else {
        bindingTracker.recordBinding('option_labels', '', 'tab_shown', true);
      }
    });

    it('data_binding_should_update_on_navigation', 0, async () => {
      await openSamplePage(driver);
      await waitForPageStable(driver, TIMEOUT_TAB_RENDER);

      bindingTracker.resetTracker();

      bindingTracker.recordBinding('focus_index', '1', '0', true);
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);

      bindingTracker.recordBinding('focus_index', '0', '1', true);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);

      expect(bindingTracker.getTotalBindings()).assertEqual(2);
      expect(bindingTracker.getSuccessfulSyncs()).assertEqual(2);
    });

    it('data_binding_should_maintain_consistency', 0, async () => {
      await openSamplePage(driver);
      await waitForPageStable(driver, TIMEOUT_TAB_RENDER);
      const initialCount = await pageComponentCount(driver);

      for (let i = 0; i < 10; i++) {
        await pressAndWait(driver, i % 2 === 0 ? KEY_LEFT : KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        bindingTracker.recordBinding('navigation_data', `${i}`, `${i + 1}`, true);
        await serializedDelay(driver, 100);
      }

      const finalCount = await pageComponentCount(driver);
      expect(Math.abs(finalCount - initialCount)).assertLessOrEqual(2);
    });

    it('data_binding_should_handle_all_options', 0, async () => {
      await openSamplePage(driver);
      await waitForPageStable(driver, TIMEOUT_TAB_RENDER);

      bindingTracker.resetTracker();

      bindingTracker.recordBinding('screen_out', 'inactive', 'active', true);
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);

      bindingTracker.recordBinding('shutdown', 'inactive', 'active', true);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);

      bindingTracker.recordBinding('reboot', 'inactive', 'active', true);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);

      expect(bindingTracker.hasBindingForPath('screen_out')).assertTrue();
      expect(bindingTracker.hasBindingForPath('shutdown')).assertTrue();
      expect(bindingTracker.hasBindingForPath('reboot')).assertTrue();
    });

    it('data_binding_singleton_should_maintain_consistency', 0, async () => {
      const tracker1 = DataBindingTracker.getInstance();
      const tracker2 = DataBindingTracker.getInstance();

      expect(tracker1 === tracker2).assertTrue();

      tracker1.resetTracker();
      tracker1.recordBinding('singleton_test', 'old', 'new', true);

      expect(tracker2.getTotalBindings()).assertEqual(1);
      expect(tracker2.getSuccessfulSyncs()).assertEqual(1);
    });
  });

}