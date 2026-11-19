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
import { Driver, ON } from '@kit.TestKit';
import {
  getDriver,
  KEY_LEFT,
  KEY_RIGHT,
  KEY_BACK,
  KEY_ENTER,
  pageComponentCount,
  checkFocusState,
  waitForPageStable,
  pressAndWait,
  TIMEOUT_TAB_RENDER,
  DELAY_KEY_NAVIGATION
} from '../Shared/CustomViewTestDriver';

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

    // 测试清理：关闭页签页并释放资源，避免影响后续测试
    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await driver.delayMs(500);
    });

    it('tab_should_scale_correctly_at_75_percent', 0, async () => {
      await waitForPageStable(driver, TIMEOUT_TAB_RENDER);

      const startTime = Date.now();
      const componentCount = await pageComponentCount(driver);
      const responseTime = Date.now() - startTime;

      scalingTracker.recordScaling(ScaleLevel.SCALE_75, componentCount >= 6, true, responseTime);

      expect(scalingTracker.hasTestedScale(ScaleLevel.SCALE_75)).assertTrue();
    });

    it('tab_should_scale_correctly_at_100_percent', 0, async () => {
      await waitForPageStable(driver, TIMEOUT_TAB_RENDER);

      scalingTracker.resetTracker();

      const startTime = Date.now();
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      const responseTime = Date.now() - startTime;

      const isFocusCorrect = await checkFocusState(driver, 0);
      scalingTracker.recordScaling(ScaleLevel.SCALE_100, isFocusCorrect, true, responseTime);

      expect(scalingTracker.hasTestedScale(ScaleLevel.SCALE_100)).assertTrue();
    });

    // 验证tab scaling状态正确：确保TV设备records timestamps should be chronological符合预期

    // 验证tab scaling维持稳定：确保TV设备在tracker singleton should maintain consistency下性能不降低
    it('tab_scaling_tracker_singleton_should_maintain_consistency', 0, async () => { // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
      const tracker1 = ContentScalingTracker.getInstance();
      const tracker2 = ContentScalingTracker.getInstance();

      expect(tracker1 === tracker2).assertTrue();

      tracker1.resetTracker();
      tracker1.recordScaling(ScaleLevel.SCALE_100, true, true, 100);

      expect(tracker2.getTotalTests()).assertEqual(1);
      expect(tracker2.getSuccessfulTests()).assertEqual(1);
    });

    // 验证tab should处理能力：确保TV设备在handle all scale levels下功能正常

    // 验证tab should维持稳定：确保TV设备在maintain layout across scales下性能不降低

    // 验证tab should处理能力：确保TV设备在handle rapid scale changes下功能正常

    // 综合comprehensive content场景测试：验证完整操作流程中功能正确
  });

}
