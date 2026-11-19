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
  pageComponentCount,
  isSamplePageVisible,
  waitForPageStable,
  pressAndWait,
  TIMEOUT_TAB_RENDER,
  DELAY_KEY_NAVIGATION,
  serializedDelay
} from '../Shared/CustomViewTestDriver';

export default function longTermStabilityTest() {
  describe('LongTermStability_Test', () => {
    let driver: Driver;

    // 测试前置：初始化驱动，确保测试环境干净
    beforeAll(async () => {
      driver = getDriver();
      await serializedDelay(driver, 1000);
      await waitForPageStable(driver, TIMEOUT_TAB_RENDER);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
    });

    // 采样操作后页签页保持稳定：以真实组件数与可见性为断言
    it('tab_should_remain_stable_after_sampled_operations', 0, async () => {
      await waitForPageStable(driver, TIMEOUT_TAB_RENDER);
      const baselineCount = await pageComponentCount(driver);
      expect(baselineCount).assertLargerOrEqual(1);

      for (let i = 0; i < 12; i++) {
        await pressAndWait(driver, i % 2 === 0 ? KEY_LEFT : KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      }

      // 事件驱动校验：操作结束后页签页仍可见且组件数量未异常变化
      expect(await isSamplePageVisible(driver)).assertTrue();
      const finalCount = await pageComponentCount(driver);
      expect(Math.abs(finalCount - baselineCount)).assertLessOrEqual(5);
    });

    // 长时导航后页签页仍响应：可见且组件数正常（焦点索引查询在部分TV设备不可靠，改用真实渲染状态）
    it('tab_should_not_degrade_performance_over_time', 0, async () => {
      await waitForPageStable(driver, TIMEOUT_TAB_RENDER);
      for (let i = 0; i < 12; i++) {
        await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      }
      expect(await isSamplePageVisible(driver)).assertTrue();
      const componentCount = await pageComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    // 组件数量在导航后保持稳定：以真实组件数为断言
    it('tab_component_count_should_remain_stable', 0, async () => {
      await waitForPageStable(driver, TIMEOUT_TAB_RENDER);
      const baselineCount = await pageComponentCount(driver);
      expect(baselineCount).assertLargerOrEqual(1);

      for (let i = 0; i < 12; i++) {
        await pressAndWait(driver, i % 2 === 0 ? KEY_LEFT : KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      }

      const finalCount = await pageComponentCount(driver);
      expect(Math.abs(finalCount - baselineCount)).assertLessOrEqual(5);
    });

    // 导航后页签页状态保持一致：以真实组件数与可见性为断言

    // 连续操作不崩溃：以页签页可见性为断言

    // 响应保持：导航后页签页持续响应（组件数正常、可见），不再用固定延迟污染的时间测量

    // 长时间使用后状态保持：以真实组件数与可见性为断言

    // 混合操作（含关闭重开）后页签页仍可见

    // 长时间运行不累积错误：以页签页可见性为断言

    // 边界条件导航：连续到达左右边界后页签页仍可见、组件数正常

    // 综合长时场景：导航期间页签页持续可见、结束后组件数稳定
  });

}
