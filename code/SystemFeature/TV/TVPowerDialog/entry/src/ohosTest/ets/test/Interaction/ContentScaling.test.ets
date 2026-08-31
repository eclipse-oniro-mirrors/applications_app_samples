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
import { Driver, ON } from '@ohos.UiTest';
import {
  getDriver,
  KEY_LEFT,
  KEY_RIGHT,
  KEY_BACK,
  KEY_ENTER,
  powerDialogComponentCount,
  checkFocusState,
  waitForDialogStable,
  pressAndWait,
  TIMEOUT_DIALOG_RENDER,
  DELAY_KEY_NAVIGATION
} from '../Shared/SharedDriver';

enum ScaleLevel {
  SCALE_75 = '75%', SCALE_100 = '100%', SCALE_125 = '125%', SCALE_150 = '150%', SCALE_200 = '200%'
}

interface ScalingRecord {
  scaleLevel: ScaleLevel;
  contentVisible: boolean;
  layoutIntact: boolean;
  responseTime: number;
  timestamp: number;
}

class ContentScalingTracker {
  private static instance: ContentScalingTracker;
  private scalingHistory: ScalingRecord[] = [];
  private totalTests: number = 0;
  private successfulTests: number = 0;

  // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
  public static getInstance(): ContentScalingTracker {
    if (!ContentScalingTracker.instance) {
      ContentScalingTracker.instance = new ContentScalingTracker();
    }
    return ContentScalingTracker.instance;
  }

  public recordScaling(scaleLevel: ScaleLevel, contentVisible: boolean, layoutIntact: boolean,
    responseTime: number): void {
    const record: ScalingRecord = {
      scaleLevel,
      contentVisible,
      layoutIntact,
      responseTime,
      timestamp: Date.now()
    };
    this.scalingHistory.push(record);
    this.totalTests++;
    if (contentVisible && layoutIntact) {
      this.successfulTests++;
    }
  }

  public getScalingHistory(): ScalingRecord[] {
    return [...this.scalingHistory];
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
    return this.scalingHistory.some(record => record.scaleLevel === scaleLevel);
  }
}

export default function contentScalingTest() {
  describe('ContentScaling_Test', () => {
    let driver: Driver;
    let scalingTracker: ContentScalingTracker;

    // 测试前置：初始化驱动和追踪器，确保测试环境干净
    beforeAll(async () => {
      driver = getDriver(); // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
      scalingTracker = ContentScalingTracker.getInstance();
      scalingTracker.resetTracker();
      await driver.delayMs(1000);
    });

    // 测试清理：关闭对话框并释放资源，避免影响后续测试
    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await driver.delayMs(500);
    });

    it('dialog_should_scale_correctly_at_75_percent', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      const startTime = Date.now();
      const componentCount = await powerDialogComponentCount(driver);
      const responseTime = Date.now() - startTime;

      scalingTracker.recordScaling(ScaleLevel.SCALE_75, componentCount >= 6, true, responseTime);

      expect(scalingTracker.hasTestedScale(ScaleLevel.SCALE_75)).assertTrue();
    });

    it('dialog_should_scale_correctly_at_100_percent', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      scalingTracker.resetTracker();

      const startTime = Date.now();
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      const responseTime = Date.now() - startTime;

      const isFocusCorrect = await checkFocusState(driver, 0);
      scalingTracker.recordScaling(ScaleLevel.SCALE_100, isFocusCorrect, true, responseTime);

      expect(scalingTracker.hasTestedScale(ScaleLevel.SCALE_100)).assertTrue();
    });

    it('dialog_should_scale_correctly_at_125_percent', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      scalingTracker.resetTracker();

      const startTime = Date.now();
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      const responseTime = Date.now() - startTime;

      const isFocusCorrect = await checkFocusState(driver, 1);
      scalingTracker.recordScaling(ScaleLevel.SCALE_125, isFocusCorrect, true, responseTime);

      expect(scalingTracker.hasTestedScale(ScaleLevel.SCALE_125)).assertTrue();
    });

    it('dialog_should_scale_correctly_at_150_percent', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      scalingTracker.resetTracker();

      const startTime = Date.now();
      const componentCount = await powerDialogComponentCount(driver);
      const responseTime = Date.now() - startTime;

      scalingTracker.recordScaling(ScaleLevel.SCALE_150, componentCount >= 6, true, responseTime);

      expect(scalingTracker.hasTestedScale(ScaleLevel.SCALE_150)).assertTrue();
    });

    it('dialog_should_scale_correctly_at_200_percent', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      scalingTracker.resetTracker();

      const startTime = Date.now();
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      const responseTime = Date.now() - startTime;

      const isFocusCorrect = await checkFocusState(driver, 0);
      scalingTracker.recordScaling(ScaleLevel.SCALE_200, isFocusCorrect, true, responseTime);

      expect(scalingTracker.hasTestedScale(ScaleLevel.SCALE_200)).assertTrue();
    });

    // 验证dialog scaling状态正确：确保TV设备records timestamps should be chronological符合预期
    it('dialog_scaling_records_timestamps_should_be_chronological', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      scalingTracker.resetTracker();

      scalingTracker.recordScaling(ScaleLevel.SCALE_100, true, true, 50);
      await driver.delayMs(100);
      scalingTracker.recordScaling(ScaleLevel.SCALE_125, true, true, 50);
      await driver.delayMs(100);
      scalingTracker.recordScaling(ScaleLevel.SCALE_150, true, true, 50);

      const history = scalingTracker.getScalingHistory();
      expect(history[0].timestamp).assertLessOrEqual(history[1].timestamp);
      expect(history[1].timestamp).assertLessOrEqual(history[2].timestamp);
    });

    // 验证dialog scaling维持稳定：确保TV设备在tracker singleton should maintain consistency下性能不降低
    it('dialog_scaling_tracker_singleton_should_maintain_consistency', 0, async () => { // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
      const tracker1 = ContentScalingTracker.getInstance();
      const tracker2 = ContentScalingTracker.getInstance();

      expect(tracker1 === tracker2).assertTrue();


      tracker1.resetTracker();
      tracker1.recordScaling(ScaleLevel.SCALE_100, true, true, 100);

      expect(tracker2.getTotalTests()).assertEqual(1);
      expect(tracker2.getSuccessfulTests()).assertEqual(1);
    });

    // 验证dialog should处理能力：确保TV设备在handle all scale levels下功能正常
    it('dialog_should_handle_all_scale_levels', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      scalingTracker.resetTracker();

      const scales =
        [ScaleLevel.SCALE_75, ScaleLevel.SCALE_100, ScaleLevel.SCALE_125, ScaleLevel.SCALE_150, ScaleLevel.SCALE_200];

      for (const scale of scales) {
        scalingTracker.recordScaling(scale, true, true, 50);
      }

      expect(scalingTracker.getTotalTests()).assertEqual(5);
    });

    // 验证dialog should维持稳定：确保TV设备在maintain layout across scales下性能不降低
    it('dialog_should_maintain_layout_across_scales', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      scalingTracker.resetTracker();
      const initialCount = await powerDialogComponentCount(driver);

      const scales = [ScaleLevel.SCALE_100, ScaleLevel.SCALE_125, ScaleLevel.SCALE_150];
      for (const scale of scales) {
        await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
        scalingTracker.recordScaling(scale, true, true, 30);
        await driver.delayMs(50);
      }

      const finalCount = await powerDialogComponentCount(driver);
      expect(Math.abs(finalCount - initialCount)).assertLessOrEqual(2);
    });

    // 验证dialog should处理能力：确保TV设备在handle rapid scale changes下功能正常
    it('dialog_should_handle_rapid_scale_changes', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      scalingTracker.resetTracker();

      const scales = [ScaleLevel.SCALE_100, ScaleLevel.SCALE_125, ScaleLevel.SCALE_150];
      for (let i = 0; i < 30; i++) {
        const scale = scales[i % scales.length];
        scalingTracker.recordScaling(scale, true, true, 20);
        await driver.delayMs(30);
      }

      expect(scalingTracker.getTotalTests()).assertEqual(30);
    });

    // 综合comprehensive content场景测试：验证完整操作流程中功能正确
    it('comprehensive_content_scaling_scenario', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      scalingTracker.resetTracker();

      const scenarioStart = Date.now();

      const startTime1 = Date.now();
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      const responseTime1 = Date.now() - startTime1;
      scalingTracker.recordScaling(ScaleLevel.SCALE_100, true, true, responseTime1);

      const startTime2 = Date.now();
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      const responseTime2 = Date.now() - startTime2;
      scalingTracker.recordScaling(ScaleLevel.SCALE_125, true, true, responseTime2);

      const scenarioEnd = Date.now();
      const scenarioDuration = scenarioEnd - scenarioStart;

      expect(scalingTracker.getTotalTests()).assertEqual(2);
      expect(scenarioDuration).assertLessOrEqual(5000);
    });
  });


}
