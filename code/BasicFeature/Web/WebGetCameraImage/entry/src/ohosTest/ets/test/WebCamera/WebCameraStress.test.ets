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

export default function webCameraStressTest() {
  describe('WebCameraStress_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      await serializedDelay(driver, 1000);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
    });

    // 高频焦点切换：30 次左右切换后网页视图仍可渲染/可见（慢速Web设备高频压测负载适中，保证确定性）
    it('rapid_focus_toggle_should_be_stable', 0, async () => {
      await waitForCameraPageStable(driver, TIMEOUT_PAGE_RENDER);
      for (let i = 0; i < 30; i++) {
        await pressAndWait(driver, i % 2 === 0 ? KEY_LEFT : KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      }
      // 等待并确认网页视图在压力后仍可渲染/可见
      expect(await waitForCameraPageStable(driver, 3000)).assertTrue();
      const componentCount = await webCameraComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    // 高频设备切换：50 次连续右键后网页视图仍可见、组件数正常
    it('rapid_device_switch_should_be_stable', 0, async () => {
      await waitForCameraPageStable(driver, TIMEOUT_PAGE_RENDER);
      for (let i = 0; i < 50; i++) {
        await pressAndWait(driver, KEY_RIGHT, 1, 10);
      }
      expect(await isCameraPageVisible(driver)).assertTrue();
      const componentCount = await webCameraComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    // 大数据量场景：重复查询真实组件树并验证网页视图持续可见（替代内存对象模拟）
    it('repeated_component_tree_query_should_be_stable', 0, async () => {
      await waitForCameraPageStable(driver, TIMEOUT_PAGE_RENDER);
      for (let i = 0; i < 50; i++) {
        const componentCount = await webCameraComponentCount(driver);
        expect(componentCount).assertLargerOrEqual(1);
      }
      expect(await isCameraPageVisible(driver)).assertTrue();
    });

    // 高频导航响应：30 次往返导航后网页视图仍可见、组件数正常
    it('rapid_navigation_should_keep_webview_responsive', 0, async () => {
      await waitForCameraPageStable(driver, TIMEOUT_PAGE_RENDER);
      for (let i = 0; i < 30; i++) {
        await pressAndWait(driver, i % 2 === 0 ? KEY_RIGHT : KEY_LEFT, 1, 10);
      }
      expect(await isCameraPageVisible(driver)).assertTrue();
      const componentCount = await webCameraComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    // 深层导航循环：30 轮左右往返后网页视图未崩溃、仍可见
    it('deep_navigation_cycle_should_be_stable', 0, async () => {
      await waitForCameraPageStable(driver, TIMEOUT_PAGE_RENDER);
      for (let i = 0; i < 30; i++) {
        await pressAndWait(driver, KEY_RIGHT, 1, 10);
        await pressAndWait(driver, KEY_LEFT, 1, 10);
      }
      const componentCount = await webCameraComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
      expect(await isCameraPageVisible(driver)).assertTrue();
    });

    // 长时运行稳定性：60 次往返导航后网页视图仍可渲染/可见（慢速Web设备高频压测负载适中，保证确定性）
    it('long_running_operation_should_maintain_stability', 0, async () => {
      await waitForCameraPageStable(driver, TIMEOUT_PAGE_RENDER);
      for (let i = 0; i < 30; i++) {
        await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
        await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      }
      // 等待并确认网页视图在压力后仍可渲染/可见
      expect(await waitForCameraPageStable(driver, 3000)).assertTrue();
      const componentCount = await webCameraComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    // 高频操作无状态损坏：20 次右键后网页视图仍可渲染/可见（慢速Web设备高频压测负载适中，保证确定性）
    it('high_frequency_operations_should_not_corrupt_state', 0, async () => {
      await waitForCameraPageStable(driver, TIMEOUT_PAGE_RENDER);
      for (let i = 0; i < 20; i++) {
        await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      }
      expect(await waitForCameraPageStable(driver, 3000)).assertTrue();
      const componentCount = await webCameraComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });
  });
}
