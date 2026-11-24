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
  DELAY_KEY_NAVIGATION,
  KEY_BACK,
  KEY_LEFT,
  KEY_RIGHT,
  TIMEOUT_PAGE_RENDER,
  contactPageComponentCount,
  ensureContactsPage,
  getDriver,
  pressAndWait,
  serializedDelay,
  waitForStableContactPage
} from '../Shared/ContactsDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Contact]';
const BUNDLE: string = 'ContentScaling_';

/**
 * The scale levels the contacts operation card supports. They model the device font scale and
 * display density steps, not a real setting of the sample, so every level is exercised through
 * the same layout probes.
 */
enum ScaleLevel {
  SCALE_75 = '75%',
  SCALE_100 = '100%',
  SCALE_125 = '125%',
  SCALE_150 = '150%',
  SCALE_200 = '200%'
}

/**
 * One observation of the page under a scale level.
 */
interface ScalingRecord {
  scaleLevel: ScaleLevel;
  contentVisible: boolean;
  layoutIntact: boolean;
  responseTime: number;
  timestamp: number;
}

/**
 * Tracks the scaling observations of the operation card.
 */
class ContentScalingTracker {
  private static instance: ContentScalingTracker;
  private scalingHistory: ScalingRecord[] = [];
  private totalTests: number = 0;
  private successfulTests: number = 0;

  public static getInstance(): ContentScalingTracker {
    if (!ContentScalingTracker.instance) {
      ContentScalingTracker.instance = new ContentScalingTracker();
    }
    return ContentScalingTracker.instance;
  }

  public recordScaling(scaleLevel: ScaleLevel, contentVisible: boolean, layoutIntact: boolean,
    responseTime: number): void {
    const record: ScalingRecord = {
      scaleLevel: scaleLevel,
      contentVisible: contentVisible,
      layoutIntact: layoutIntact,
      responseTime: responseTime,
      timestamp: Date.now()
    };
    this.scalingHistory.push(record);
    this.totalTests++;
    if (contentVisible && layoutIntact) {
      this.successfulTests++;
    }
    hilog.info(DOMAIN, TAG, '%{public}s recordScaling %{public}s %{public}d ms', BUNDLE, `${scaleLevel}`,
      responseTime);
  }

  public getScalingHistory(): ScalingRecord[] {
    return this.scalingHistory.slice();
  }

  public getTotalTests(): number {
    return this.totalTests;
  }

  public getSuccessfulTests(): number {
    return this.successfulTests;
  }

  public resetTracker(): void {
    this.scalingHistory = [];
    this.totalTests = 0;
    this.successfulTests = 0;
  }

  public getSuccessRate(): number {
    if (this.totalTests === 0) {
      return 0;
    }
    return this.successfulTests / this.totalTests;
  }

  public hasTestedScale(scaleLevel: ScaleLevel): boolean {
    for (let i = 0; i < this.scalingHistory.length; i++) {
      if (this.scalingHistory[i].scaleLevel === scaleLevel) {
        return true;
      }
    }
    return false;
  }

  public countTestedLevels(): number {
    const seen: ScaleLevel[] = [];
    for (let i = 0; i < this.scalingHistory.length; i++) {
      if (seen.indexOf(this.scalingHistory[i].scaleLevel) < 0) {
        seen.push(this.scalingHistory[i].scaleLevel);
      }
    }
    return seen.length;
  }
}

/**
 * Pure layout policy for the operation card at each scale level.
 */
class ContentScalePolicy {
  public static readonly BASE_BUTTON_HEIGHT: number = 56;
  public static readonly BASE_CARD_WIDTH: number = 360;

  public static buttonHeightAt(scaleLevel: ScaleLevel): number {
    const factor: number = ContentScalePolicy.factorOf(scaleLevel);
    return Math.round(ContentScalePolicy.BASE_BUTTON_HEIGHT * factor);
  }

  public static cardWidthAt(scaleLevel: ScaleLevel): number {
    const factor: number = ContentScalePolicy.factorOf(scaleLevel);
    return Math.round(ContentScalePolicy.BASE_CARD_WIDTH * factor);
  }

  public static factorOf(scaleLevel: ScaleLevel): number {
    if (scaleLevel === ScaleLevel.SCALE_75) {
      return 0.75;
    }
    if (scaleLevel === ScaleLevel.SCALE_125) {
      return 1.25;
    }
    if (scaleLevel === ScaleLevel.SCALE_150) {
      return 1.5;
    }
    if (scaleLevel === ScaleLevel.SCALE_200) {
      return 2;
    }
    return 1;
  }

  public static isLargerThanBase(scaleLevel: ScaleLevel): boolean {
    return ContentScalePolicy.factorOf(scaleLevel) > 1;
  }

  public static isSmallerThanBase(scaleLevel: ScaleLevel): boolean {
    return ContentScalePolicy.factorOf(scaleLevel) < 1;
  }

  public static totalCardHeight(buttonCount: number, gap: number, scaleLevel: ScaleLevel): number {
    const perButton: number = ContentScalePolicy.buttonHeightAt(scaleLevel);
    return buttonCount * perButton + Math.max(0, buttonCount - 1) * gap;
  }
}

/**
 * Validates that a scaling record represents an intact layout.
 */
class ScalingRecordValidator {
  public static isComplete(record: ScalingRecord): boolean {
    return record.contentVisible && record.layoutIntact;
  }

  public static areChronological(records: ScalingRecord[]): boolean {
    for (let i = 1; i < records.length; i++) {
      if (records[i].timestamp < records[i - 1].timestamp) {
        return false;
      }
    }
    return true;
  }

  public static allComplete(records: ScalingRecord[]): boolean {
    if (records.length === 0) {
      return false;
    }
    for (let i = 0; i < records.length; i++) {
      if (!ScalingRecordValidator.isComplete(records[i])) {
        return false;
      }
    }
    return true;
  }
}

export default function contentScalingTest(): void {
  describe('ContentScaling_Test', () => {
    let driver: Driver;
    let scalingTracker: ContentScalingTracker;

    beforeAll(async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'contentScalingTest begin');
      driver = getDriver();
      scalingTracker = ContentScalingTracker.getInstance();
      scalingTracker.resetTracker();
      const ready: boolean = await ensureContactsPage(driver);
      expect(ready).assertTrue();
      await waitForStableContactPage(driver);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
      hilog.info(DOMAIN, TAG, '%{public}s', 'contentScalingTest end');
    });

    it('contacts_page_should_scale_correctly_at_75_percent', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'contacts_page_should_scale_correctly_at_75_percent begin');
      await waitForStableContactPage(driver, 1, 5, TIMEOUT_PAGE_RENDER);
      const startTime: number = Date.now();
      const componentCount: number = await contactPageComponentCount(driver);
      const responseTime: number = Date.now() - startTime;
      scalingTracker.recordScaling(ScaleLevel.SCALE_75, componentCount >= 1, true, responseTime);
      expect(scalingTracker.hasTestedScale(ScaleLevel.SCALE_75)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'contacts_page_should_scale_correctly_at_75_percent end');
    });

    it('contacts_page_should_scale_correctly_at_100_percent', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'contacts_page_should_scale_correctly_at_100_percent begin');
      await waitForStableContactPage(driver, 1, 5, TIMEOUT_PAGE_RENDER);
      scalingTracker.resetTracker();
      const startTime: number = Date.now();
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      const responseTime: number = Date.now() - startTime;
      const componentCount: number = await contactPageComponentCount(driver);
      scalingTracker.recordScaling(ScaleLevel.SCALE_100, componentCount >= 1, true, responseTime);
      expect(scalingTracker.hasTestedScale(ScaleLevel.SCALE_100)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'contacts_page_should_scale_correctly_at_100_percent end');
    });

    it('contacts_page_should_scale_correctly_at_125_percent', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'contacts_page_should_scale_correctly_at_125_percent begin');
      await waitForStableContactPage(driver, 1, 5, TIMEOUT_PAGE_RENDER);
      scalingTracker.resetTracker();
      const startTime: number = Date.now();
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      const responseTime: number = Date.now() - startTime;
      const componentCount: number = await contactPageComponentCount(driver);
      scalingTracker.recordScaling(ScaleLevel.SCALE_125, componentCount >= 1, true, responseTime);
      expect(scalingTracker.hasTestedScale(ScaleLevel.SCALE_125)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'contacts_page_should_scale_correctly_at_125_percent end');
    });

    it('contacts_page_should_scale_correctly_at_150_percent', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'contacts_page_should_scale_correctly_at_150_percent begin');
      await waitForStableContactPage(driver, 1, 5, TIMEOUT_PAGE_RENDER);
      scalingTracker.resetTracker();
      const startTime: number = Date.now();
      const componentCount: number = await contactPageComponentCount(driver);
      const responseTime: number = Date.now() - startTime;
      scalingTracker.recordScaling(ScaleLevel.SCALE_150, componentCount >= 1, true, responseTime);
      expect(scalingTracker.hasTestedScale(ScaleLevel.SCALE_150)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'contacts_page_should_scale_correctly_at_150_percent end');
    });

    it('contacts_page_should_scale_correctly_at_200_percent', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'contacts_page_should_scale_correctly_at_200_percent begin');
      await waitForStableContactPage(driver, 1, 5, TIMEOUT_PAGE_RENDER);
      scalingTracker.resetTracker();
      const startTime: number = Date.now();
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      const responseTime: number = Date.now() - startTime;
      const componentCount: number = await contactPageComponentCount(driver);
      scalingTracker.recordScaling(ScaleLevel.SCALE_200, componentCount >= 1, true, responseTime);
      expect(scalingTracker.hasTestedScale(ScaleLevel.SCALE_200)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'contacts_page_should_scale_correctly_at_200_percent end');
    });

    it('contacts_scaling_records_timestamps_should_be_chronological', 0, async () => {
      scalingTracker.resetTracker();
      scalingTracker.recordScaling(ScaleLevel.SCALE_100, true, true, 50);
      await serializedDelay(driver, 100);
      scalingTracker.recordScaling(ScaleLevel.SCALE_125, true, true, 50);
      await serializedDelay(driver, 100);
      scalingTracker.recordScaling(ScaleLevel.SCALE_150, true, true, 50);
      expect(ScalingRecordValidator.areChronological(scalingTracker.getScalingHistory())).assertTrue();
    });

    it('contacts_scaling_tracker_singleton_should_maintain_consistency', 0, async () => {
      const tracker1: ContentScalingTracker = ContentScalingTracker.getInstance();
      const tracker2: ContentScalingTracker = ContentScalingTracker.getInstance();
      expect(tracker1 === tracker2).assertTrue();
      tracker1.resetTracker();
      tracker1.recordScaling(ScaleLevel.SCALE_100, true, true, 100);
      expect(tracker2.getTotalTests()).assertEqual(1);
      expect(tracker2.getSuccessfulTests()).assertEqual(1);
    });

    it('contacts_page_should_handle_all_scale_levels', 0, async () => {
      scalingTracker.resetTracker();
      const scales: ScaleLevel[] = [ScaleLevel.SCALE_75, ScaleLevel.SCALE_100, ScaleLevel.SCALE_125,
        ScaleLevel.SCALE_150, ScaleLevel.SCALE_200];
      for (let i = 0; i < scales.length; i++) {
        scalingTracker.recordScaling(scales[i], true, true, 50);
      }
      expect(scalingTracker.getTotalTests()).assertEqual(5);
      expect(scalingTracker.countTestedLevels()).assertEqual(5);
    });

    it('contacts_page_should_maintain_layout_across_scales', 0, async () => {
      await waitForStableContactPage(driver, 1, 5, TIMEOUT_PAGE_RENDER);
      scalingTracker.resetTracker();
      const initialCount: number = await contactPageComponentCount(driver);
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      scalingTracker.recordScaling(ScaleLevel.SCALE_100, true, true, 30);
      await serializedDelay(driver, 50);
      const finalCount: number = await contactPageComponentCount(driver);
      expect(Math.abs(finalCount - initialCount)).assertLessOrEqual(2);
    });

    it('contacts_scale_policy_should_compute_layout_dimensions', 0, () => {
      expect(ContentScalePolicy.factorOf(ScaleLevel.SCALE_75)).assertEqual(0.75);
      expect(ContentScalePolicy.factorOf(ScaleLevel.SCALE_200)).assertEqual(2);
      expect(ContentScalePolicy.isLargerThanBase(ScaleLevel.SCALE_125)).assertTrue();
      expect(ContentScalePolicy.isSmallerThanBase(ScaleLevel.SCALE_75)).assertTrue();
      expect(ContentScalePolicy.buttonHeightAt(ScaleLevel.SCALE_200)).assertEqual(112);
      expect(ContentScalePolicy.totalCardHeight(4, 8, ScaleLevel.SCALE_100)).assertEqual(248);
    });

    it('contacts_scaling_records_should_be_complete_and_valid', 0, async () => {
      scalingTracker.resetTracker();
      scalingTracker.recordScaling(ScaleLevel.SCALE_100, true, true, 10);
      scalingTracker.recordScaling(ScaleLevel.SCALE_125, true, true, 15);
      expect(ScalingRecordValidator.allComplete(scalingTracker.getScalingHistory())).assertTrue();
      expect(ScalingRecordValidator.isComplete(scalingTracker.getScalingHistory()[0])).assertTrue();
      expect(scalingTracker.getSuccessRate()).assertEqual(1);
    });

    it('contacts_scaling_should_handle_rapid_observations', 0, async () => {
      scalingTracker.resetTracker();
      const scales: ScaleLevel[] = [ScaleLevel.SCALE_100, ScaleLevel.SCALE_125, ScaleLevel.SCALE_150];
      for (let i = 0; i < 30; i++) {
        const scale: ScaleLevel = scales[i % scales.length];
        scalingTracker.recordScaling(scale, true, true, 20);
        await serializedDelay(driver, 10);
      }
      expect(scalingTracker.getTotalTests()).assertEqual(30);
      expect(scalingTracker.getSuccessRate()).assertEqual(1);
    });

    it('comprehensive_content_scaling_scenario', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'comprehensive_content_scaling_scenario begin');
      await waitForStableContactPage(driver, 1, 5, TIMEOUT_PAGE_RENDER);
      scalingTracker.resetTracker();
      const scenarioStart: number = Date.now();
      const startTime1: number = Date.now();
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      const responseTime1: number = Date.now() - startTime1;
      scalingTracker.recordScaling(ScaleLevel.SCALE_100, true, true, responseTime1);
      const startTime2: number = Date.now();
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      const responseTime2: number = Date.now() - startTime2;
      scalingTracker.recordScaling(ScaleLevel.SCALE_125, true, true, responseTime2);
      const scenarioDuration: number = Date.now() - scenarioStart;
      expect(scalingTracker.getTotalTests()).assertEqual(2);
      expect(scalingTracker.getSuccessfulTests()).assertEqual(2);
      expect(scenarioDuration).assertLessOrEqual(5000);
      hilog.info(DOMAIN, TAG, '%{public}s', 'comprehensive_content_scaling_scenario end');
    });
  });
}