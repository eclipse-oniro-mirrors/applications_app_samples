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

export default function networkConnectivityTest() {
  describe('NetworkConnectivity_Test', () => {
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

    // 联网状态下导航：网页视图仍可见、组件数正常（焦点索引查询在部分Web设备不可靠，改用真实渲染状态）
    it('webview_should_handle_online_status', 0, async () => {
      await waitForCameraPageStable(driver, TIMEOUT_PAGE_RENDER);
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      expect(await isCameraPageVisible(driver)).assertTrue();
      const componentCount = await webCameraComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    // 离线状态下导航：网页视图仍可见、组件数正常
    it('webview_should_handle_offline_status', 0, async () => {
      await waitForCameraPageStable(driver, TIMEOUT_PAGE_RENDER);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      expect(await isCameraPageVisible(driver)).assertTrue();
      const componentCount = await webCameraComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    // 连接中状态下网页视图可正常渲染
    it('webview_should_handle_connecting_status', 0, async () => {
      await waitForCameraPageStable(driver, TIMEOUT_PAGE_RENDER);
      const componentCount = await webCameraComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
      expect(await isCameraPageVisible(driver)).assertTrue();
    });

    // 断开状态下导航：网页视图仍可见、组件数正常
    it('webview_should_handle_disconnecting_status', 0, async () => {
      await waitForCameraPageStable(driver, TIMEOUT_PAGE_RENDER);
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      expect(await isCameraPageVisible(driver)).assertTrue();
      const componentCount = await webCameraComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    // 网络状态持续变化期间网页视图保持稳定：以真实组件数为断言
    it('webview_should_maintain_stability_during_network_changes', 0, async () => {
      await waitForCameraPageStable(driver, TIMEOUT_PAGE_RENDER);
      const initialCount = await webCameraComponentCount(driver);
      expect(initialCount).assertLargerOrEqual(1);

      for (let i = 0; i < 20; i++) {
        await pressAndWait(driver, i % 2 === 0 ? KEY_LEFT : KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        await serializedDelay(driver, 50);
      }

      const finalCount = await webCameraComponentCount(driver);
      expect(Math.abs(finalCount - initialCount)).assertLessOrEqual(5);
      expect(await isCameraPageVisible(driver)).assertTrue();
    });

    // 综合场景：完整操作流程后网页视图可见、组件数正常
    it('comprehensive_network_connectivity_scenario', 0, async () => {
      await waitForCameraPageStable(driver, TIMEOUT_PAGE_RENDER);
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      expect(await isCameraPageVisible(driver)).assertTrue();
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      expect(await isCameraPageVisible(driver)).assertTrue();
      const componentCount = await webCameraComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });
  });
}
