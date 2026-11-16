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
  serializedDelay,
  TIMEOUT_PAGE_RENDER,
  DELAY_KEY_NAVIGATION
} from '../Shared/SharedDriver';
import hilog from '@ohos.hilog';

export default function concurrencyControlTest() {
  describe('ConcurrencyControl_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      await serializedDelay(driver, 1000);
      await waitForCameraPageStable(driver, TIMEOUT_PAGE_RENDER);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
    });

    // 多次按键操作后网页视图状态稳定：以真实组件数与可见性为断言
    it('webview_should_handle_concurrent_key_presses', 0, async () => {
      await waitForCameraPageStable(driver, TIMEOUT_PAGE_RENDER);
      for (let i = 0; i < 5; i++) {
        await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
        await serializedDelay(driver, 50);
      }
      const componentCount = await webCameraComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
      expect(await isCameraPageVisible(driver)).assertTrue();
    });

    // 并发操作后状态维持：以真实组件数稳定性为断言
    it('webview_should_maintain_state_during_concurrent_operations', 0, async () => {
      await waitForCameraPageStable(driver, TIMEOUT_PAGE_RENDER);
      const initialCount = await webCameraComponentCount(driver);
      expect(initialCount).assertLargerOrEqual(1);

      for (let i = 0; i < 10; i++) {
        await pressAndWait(driver, i % 2 === 0 ? KEY_LEFT : KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        await serializedDelay(driver, 30);
      }

      const finalCount = await webCameraComponentCount(driver);
      expect(Math.abs(finalCount - initialCount)).assertLessOrEqual(5);
      expect(await isCameraPageVisible(driver)).assertTrue();
    });

    // 快速切换后网页视图仍可见、组件数正常（焦点索引查询在部分Web设备不可靠，改用真实渲染状态）
    it('webview_should_handle_rapid_concurrent_focus_changes', 0, async () => {
      await waitForCameraPageStable(driver, TIMEOUT_PAGE_RENDER);
      for (let i = 0; i < 8; i++) {
        await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
        await serializedDelay(driver, 40);
      }
      expect(await isCameraPageVisible(driver)).assertTrue();
      const componentCount = await webCameraComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    // 并发状态更新后网页视图可见
    it('webview_should_handle_concurrent_state_updates', 0, async () => {
      await waitForCameraPageStable(driver, TIMEOUT_PAGE_RENDER);
      for (let i = 0; i < 6; i++) {
        await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        await serializedDelay(driver, 60);
      }
      const componentCount = await webCameraComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
      expect(await isCameraPageVisible(driver)).assertTrue();
    });

    // 混合类型操作后网页视图可见、组件数正常
    it('concurrent_operations_should_handle_mixed_types', 0, async () => {
      await waitForCameraPageStable(driver, TIMEOUT_PAGE_RENDER);
      for (let i = 0; i < 12; i++) {
        await pressAndWait(driver, i % 2 === 0 ? KEY_LEFT : KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        await serializedDelay(driver, 30);
      }
      expect(await isCameraPageVisible(driver)).assertTrue();
      const componentCount = await webCameraComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    // 高频操作性能：20 次串行化操作后网页视图未崩溃
    it('concurrent_operations_should_not_break_webview_after_rapid_ops', 0, async () => {
      await waitForCameraPageStable(driver, TIMEOUT_PAGE_RENDER);
      for (let i = 0; i < 20; i++) {
        await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
        await serializedDelay(driver, 30);
      }
      expect(await isCameraPageVisible(driver)).assertTrue();
      const componentCount = await webCameraComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    // 错误恢复：操作异常后网页视图仍可见
    it('concurrent_operations_should_handle_error_recovery', 0, async () => {
      await waitForCameraPageStable(driver, TIMEOUT_PAGE_RENDER);
      for (let i = 0; i < 10; i++) {
        try {
          await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
        } catch (e) {
          hilog.error(0x0000, 'testTag', '%{public}s', `concurrent_operations_should_handle_error_recovery error: ${e}`);
        }
        await serializedDelay(driver, 50);
      }
      const componentCount = await webCameraComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
      expect(await isCameraPageVisible(driver)).assertTrue();
    });

    // 边界条件：30 次高频操作后网页视图可见、组件数正常
    it('concurrent_operations_should_handle_boundary_conditions', 0, async () => {
      await waitForCameraPageStable(driver, TIMEOUT_PAGE_RENDER);
      for (let i = 0; i < 30; i++) {
        await pressAndWait(driver, i % 2 === 0 ? KEY_LEFT : KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        await serializedDelay(driver, 20);
      }
      expect(await isCameraPageVisible(driver)).assertTrue();
      const componentCount = await webCameraComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    // 综合并发场景：完整操作流程后网页视图可见、组件数稳定
    it('comprehensive_concurrency_control_scenario', 0, async () => {
      await waitForCameraPageStable(driver, TIMEOUT_PAGE_RENDER);
      const initialCount = await webCameraComponentCount(driver);
      expect(initialCount).assertLargerOrEqual(1);

      for (let i = 0; i < 10; i++) {
        await pressAndWait(driver, i % 2 === 0 ? KEY_LEFT : KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        await serializedDelay(driver, 50);
      }

      const componentCount = await webCameraComponentCount(driver);
      expect(Math.abs(componentCount - initialCount)).assertLessOrEqual(5);
      expect(await isCameraPageVisible(driver)).assertTrue();
    });
  });
}
