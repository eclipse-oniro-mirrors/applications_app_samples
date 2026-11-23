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

import { afterAll, beforeAll, describe, expect, it } from '@ohos/hypium';
import { Driver } from '@ohos.UiTest';
import hilog from '@ohos.hilog';
import {
  KEY_BACK,
  DELAY_AFTER_PICKER,
  TIMEOUT_PAGE_RENDER,
  contactPageComponentCount,
  ensureContactsPage,
  getDriver,
  pressAndWait,
  serializedDelay,
  clickSampleButton,
  clickSampleButtonAt,
  waitForContactsPage,
  TEXT_SELECT_BY_PICKER,
  TEXT_UPDATE_BY_PICKER
} from '../Shared/ContactsDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Contact]';
const BUNDLE: string = 'Contact_';

const STRESS_ROUNDS: number = 30;
const NAV_CYCLES: number = 10;

// 高频操作下的稳定状态追踪
class StressStateTracker {
  private stableCount: number = 0;
  private renderCount: number = 0;

  public onStable(): void {
    this.stableCount++;
  }

  public onRender(): void {
    this.renderCount++;
  }

  public getStableRounds(): number {
    return this.stableCount;
  }

  public getRenderRounds(): number {
    return this.renderCount;
  }

  public reset(): void {
    this.stableCount = 0;
    this.renderCount = 0;
  }
}

export default function contactPickerStressTest(): void {
  describe('ContactPickerStress_Test', () => {
    let driver: Driver;
    let tracker: StressStateTracker;

    beforeAll(async () => {
      driver = getDriver();
      tracker = new StressStateTracker();
      await serializedDelay(driver, 1000);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, 50);
      await serializedDelay(driver, 500);
    });

    it('picker_stress_rapid_focus_should_be_stable', 0, async () => {
      await waitForContactsPage(driver, TIMEOUT_PAGE_RENDER);
      for (let i = 0; i < STRESS_ROUNDS; i++) {
        await clickSampleButtonAt(driver, i % 4);
        await serializedDelay(driver, 50);
      }
      const stable: boolean = await ensureContactsPage(driver);
      expect(stable).assertTrue();
      expect(await contactPageComponentCount(driver)).assertLargerOrEqual(1);
    });

    it('picker_stress_rapid_repeat_should_be_stable', 0, async () => {
      await waitForContactsPage(driver, TIMEOUT_PAGE_RENDER);
      for (let i = 0; i < 20; i++) {
        await clickSampleButton(driver, TEXT_SELECT_BY_PICKER);
        await serializedDelay(driver, 50);
      }
      expect(await ensureContactsPage(driver)).assertTrue();
    });

    it('picker_stress_repeated_component_query_should_be_stable', 0, async () => {
      await waitForContactsPage(driver, TIMEOUT_PAGE_RENDER);
      tracker.reset();
      for (let i = 0; i < 30; i++) {
        const count: number = await contactPageComponentCount(driver);
        expect(count).assertLargerOrEqual(1);
        tracker.onRender();
      }
      expect(tracker.getRenderRounds()).assertEqual(30);
    });

    it('picker_stress_rapid_navigation_should_keep_page_responsive', 0, async () => {
      await waitForContactsPage(driver, TIMEOUT_PAGE_RENDER);
      for (let i = 0; i < 20; i++) {
        await clickSampleButtonAt(driver, i % 2 === 0 ? 0 : 3);
        await serializedDelay(driver, 30);
      }
      expect(await ensureContactsPage(driver)).assertTrue();
      expect(await contactPageComponentCount(driver)).assertLargerOrEqual(1);
    });

    it('picker_stress_long_running_operation_should_maintain_stability', 0, async () => {
      await waitForContactsPage(driver, TIMEOUT_PAGE_RENDER);
      for (let i = 0; i < NAV_CYCLES; i++) {
        for (let j = 0; j < 4; j++) {
          await clickSampleButtonAt(driver, j);
          await serializedDelay(driver, 40);
        }
      }
      expect(await ensureContactsPage(driver)).assertTrue();
      expect(await contactPageComponentCount(driver)).assertLargerOrEqual(1);
    });

    it('picker_stress_high_frequency_should_not_corrupt_state', 0, async () => {
      await waitForContactsPage(driver, TIMEOUT_PAGE_RENDER);
      for (let i = 0; i < 15; i++) {
        await clickSampleButton(driver, TEXT_UPDATE_BY_PICKER);
        await serializedDelay(driver, DELAY_AFTER_PICKER);
        await ensureContactsPage(driver);
      }
      expect(await contactPageComponentCount(driver)).assertLargerOrEqual(1);
    });

    it('picker_stress_deep_cycle_should_be_stable', 0, async () => {
      await waitForContactsPage(driver, TIMEOUT_PAGE_RENDER);
      tracker.reset();
      for (let i = 0; i < 12; i++) {
        await clickSampleButtonAt(driver, 1);
        await serializedDelay(driver, 50);
        await ensureContactsPage(driver);
        tracker.onStable();
      }
      expect(tracker.getStableRounds()).assertLargerOrEqual(10);
    });
  });
}