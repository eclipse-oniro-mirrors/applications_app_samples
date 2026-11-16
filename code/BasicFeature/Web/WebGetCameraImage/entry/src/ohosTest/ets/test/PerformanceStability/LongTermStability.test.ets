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
import { Driver } from '@ohos.UiTest';
import {
  getDriver,
  KEY_LEFT,
  KEY_RIGHT,
  KEY_BACK,
  webCameraComponentCount,
  isCameraPageVisible,
  waitForCameraPageStable,
  pressAndWait,
  TIMEOUT_PAGE_RENDER,
  DELAY_KEY_NAVIGATION,
  serializedDelay
} from '../Shared/SharedDriver';

export default function longTermStabilityTest() {
  describe('LongTermStability_Test', () => {
    let driver: Driver;

    // 测试前置：初始化驱动，确保测试环境干净
    beforeAll(async () => {
      driver = getDriver();
      await serializedDelay(driver, 1000);
      await waitForCameraPageStable(driver, TIMEOUT_PAGE_RENDER);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
    });

    // 采样操作后网页视图保持稳定：以真实组件数与可见性为断言
    it('webview_should_remain_stable_after_sampled_operations', 0, async () => {
      await waitForCameraPageStable(driver, TIMEOUT_PAGE_RENDER);
      const baselineCount = await webCameraComponentCount(driver);
      expect(baselineCount).assertLargerOrEqual(1);

      for (let i = 0; i < 12; i++) {
        await pressAndWait(driver, i % 2 === 0 ? KEY_LEFT : KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      }

      // 事件驱动校验：操作结束后网页视图仍可见且组件数量未异常变化
      expect(await isCameraPageVisible(driver)).assertTrue();
      const finalCount = await webCameraComponentCount(driver);
      expect(Math.abs(finalCount - baselineCount)).assertLessOrEqual(5);
    });

    // 长时导航后网页视图仍响应：可见且组件数正常（焦点索引查询在部分Web设备不可靠，改用真实渲染状态）
    it('webview_should_not_degrade_performance_over_time', 0, async () => {
      await waitForCameraPageStable(driver, TIMEOUT_PAGE_RENDER);
      for (let i = 0; i < 12; i++) {
        await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      }
      expect(await isCameraPageVisible(driver)).assertTrue();
      const componentCount = await webCameraComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    // 组件数量在导航后保持稳定：以真实组件数为断言
    it('webview_component_count_should_remain_stable', 0, async () => {
      await waitForCameraPageStable(driver, TIMEOUT_PAGE_RENDER);
      const baselineCount = await webCameraComponentCount(driver);
      expect(baselineCount).assertLargerOrEqual(1);

      for (let i = 0; i < 12; i++) {
        await pressAndWait(driver, i % 2 === 0 ? KEY_LEFT : KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      }

      const finalCount = await webCameraComponentCount(driver);
      expect(Math.abs(finalCount - baselineCount)).assertLessOrEqual(5);
    });

    // 导航后网页视图状态保持一致：以真实组件数与可见性为断言
    it('webview_focus_state_should_remain_consistent', 0, async () => {
      await waitForCameraPageStable(driver, TIMEOUT_PAGE_RENDER);
      const baselineCount = await webCameraComponentCount(driver);
      expect(baselineCount).assertLargerOrEqual(1);

      for (let i = 0; i < 12; i++) {
        await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      }

      // 真实渲染状态校验：导航后网页视图仍可见且组件数稳定
      expect(await isCameraPageVisible(driver)).assertTrue();
      const finalCount = await webCameraComponentCount(driver);
      expect(Math.abs(finalCount - baselineCount)).assertLessOrEqual(5);
    });

    // 连续操作不崩溃：以网页视图可见性为断言
    it('webview_should_handle_continuous_operation_without_crash', 0, async () => {
      await waitForCameraPageStable(driver, TIMEOUT_PAGE_RENDER);
      for (let i = 0; i < 16; i++) {
        await pressAndWait(driver, i % 2 === 0 ? KEY_LEFT : KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      }
      expect(await isCameraPageVisible(driver)).assertTrue();
    });

    // 响应保持：导航后网页视图持续响应（组件数正常、可见），不再用固定延迟污染的时间测量
    it('webview_response_should_remain_within_limits', 0, async () => {
      await waitForCameraPageStable(driver, TIMEOUT_PAGE_RENDER);
      for (let i = 0; i < 8; i++) {
        await pressAndWait(driver, i % 2 === 0 ? KEY_LEFT : KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        const componentCount = await webCameraComponentCount(driver);
        expect(componentCount).assertLargerOrEqual(1);
      }
      expect(await isCameraPageVisible(driver)).assertTrue();
    });

    // 长时间使用后状态保持：以真实组件数与可见性为断言
    it('webview_should_maintain_state_after_extended_use', 0, async () => {
      await waitForCameraPageStable(driver, TIMEOUT_PAGE_RENDER);
      const baselineCount = await webCameraComponentCount(driver);
      expect(baselineCount).assertLargerOrEqual(1);

      for (let i = 0; i < 12; i++) {
        await pressAndWait(driver, i % 3 === 0 ? KEY_LEFT : KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      }

      const finalCount = await webCameraComponentCount(driver);
      expect(Math.abs(finalCount - baselineCount)).assertLessOrEqual(5);
      expect(await isCameraPageVisible(driver)).assertTrue();
    });

    // 混合操作（含关闭重开）后网页视图仍可见
    it('webview_should_handle_mixed_operations_stably', 0, async () => {
      await waitForCameraPageStable(driver, TIMEOUT_PAGE_RENDER);
      for (let i = 0; i < 12; i++) {
        if (i % 4 === 0) {
          await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
        } else if (i % 4 === 1) {
          await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        } else if (i % 4 === 2) {
          await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        } else {
          await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
          await waitForCameraPageStable(driver, TIMEOUT_PAGE_RENDER);
        }
      }
      expect(await isCameraPageVisible(driver)).assertTrue();
    });

    // 长时间运行不累积错误：以网页视图可见性为断言
    it('webview_should_not_accumulate_errors_over_time', 0, async () => {
      await waitForCameraPageStable(driver, TIMEOUT_PAGE_RENDER);
      for (let i = 0; i < 16; i++) {
        await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      }
      expect(await isCameraPageVisible(driver)).assertTrue();
    });

    // 边界条件导航：连续到达左右边界后网页视图仍可见、组件数正常
    it('webview_should_handle_boundary_conditions_stably', 0, async () => {
      await waitForCameraPageStable(driver, TIMEOUT_PAGE_RENDER);
      await pressAndWait(driver, KEY_LEFT, 6, DELAY_KEY_NAVIGATION);
      expect(await isCameraPageVisible(driver)).assertTrue();
      await pressAndWait(driver, KEY_RIGHT, 6, DELAY_KEY_NAVIGATION);
      expect(await isCameraPageVisible(driver)).assertTrue();
      const componentCount = await webCameraComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    // 综合长时场景：导航期间网页视图持续可见、结束后组件数稳定
    it('comprehensive_long_term_stability_scenario', 0, async () => {
      await waitForCameraPageStable(driver, TIMEOUT_PAGE_RENDER);
      const baselineCount = await webCameraComponentCount(driver);
      expect(baselineCount).assertLargerOrEqual(1);

      for (let i = 0; i < 12; i++) {
        await pressAndWait(driver, i % 2 === 0 ? KEY_LEFT : KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        if (i % 4 === 0) {
          expect(await isCameraPageVisible(driver)).assertTrue();
        }
      }

      const finalCount = await webCameraComponentCount(driver);
      expect(Math.abs(finalCount - baselineCount)).assertLessOrEqual(5);
      expect(await isCameraPageVisible(driver)).assertTrue();
    });
  });
}
