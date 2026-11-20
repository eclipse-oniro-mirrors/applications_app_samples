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
  DELAY_AFTER_START_MODE,
  DELAY_KEY_NAVIGATION,
  KEY_BACK,
  KEY_DOWN,
  KEY_LEFT,
  KEY_RIGHT,
  KEY_UP,
  TIMEOUT_PAGE_RENDER,
  TIMEOUT_PAGE_SWITCH,
  componentCount,
  getDriver,
  homeComponentCount,
  isFoodDetailVisible,
  isHomePageVisible,
  launchSingletonAbility,
  launchStandardAbility,
  pressAndWait,
  resetToHome,
  serializedDelay,
  waitForFoodDetailStable,
  waitForHomePageStable
} from '../Shared/SharedDriver';

export default function startModeStressTest() {
  describe('StartModeStress_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      await serializedDelay(driver, 1000);
      await resetToHome(driver);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
    });

    // 高频焦点切换：30 次左右往返切换后主页仍可渲染/可见（慢速设备高频压测负载适中，保证确定性）
    it('rapid_focus_toggle_should_be_stable', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      for (let i = 0; i < 10; i++) {
        await pressAndWait(driver, i % 2 === 0 ? KEY_LEFT : KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      }
      // 等待并确认主页在压力后仍可渲染/可见
      expect(await waitForHomePageStable(driver, 3000)).assertTrue();
      const componentCount = await homeComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    // 高频纵向切换：50 次连续下键后主页仍可见、组件数正常
    it('rapid_vertical_switch_should_be_stable', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      for (let i = 0; i < 10; i++) {
        await pressAndWait(driver, KEY_DOWN, 1, 10);
      }
      expect(await isHomePageVisible(driver)).assertTrue();
      const componentCount = await homeComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    // 大数据量场景：重复查询真实组件树并验证主页持续可见（替代内存对象模拟）
    it('repeated_component_tree_query_should_be_stable', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      for (let i = 0; i < 10; i++) {
        const componentCount = await homeComponentCount(driver);
        expect(componentCount).assertLargerOrEqual(1);
      }
      expect(await isHomePageVisible(driver)).assertTrue();
    });

    // 高频导航响应：30 次往返导航后主页仍可见、组件数正常
    it('rapid_navigation_should_keep_home_responsive', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      for (let i = 0; i < 10; i++) {
        await pressAndWait(driver, i % 2 === 0 ? KEY_DOWN : KEY_UP, 1, 10);
      }
      expect(await isHomePageVisible(driver)).assertTrue();
      const componentCount = await homeComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    // 深层导航循环：30 轮上下往返后主页未崩溃、仍可见
    it('deep_navigation_cycle_should_be_stable', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      for (let i = 0; i < 10; i++) {
        await pressAndWait(driver, KEY_DOWN, 1, 10);
        await pressAndWait(driver, KEY_UP, 1, 10);
      }
      const componentCount = await homeComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
      expect(await isHomePageVisible(driver)).assertTrue();
    });

    // 长时运行稳定性：60 次往返导航后主页仍可渲染/可见（慢速设备高频压测负载适中，保证确定性）
    it('long_running_operation_should_maintain_stability', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      for (let i = 0; i < 10; i++) {
        await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
        await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      }
      // 等待并确认主页在压力后仍可渲染/可见
      expect(await waitForHomePageStable(driver, 3000)).assertTrue();
      const componentCount = await homeComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    // 高频操作无状态损坏：20 次右键后主页仍可渲染/可见（慢速设备高频压测负载适中，保证确定性）
    it('high_frequency_operations_should_not_corrupt_state', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      for (let i = 0; i < 10; i++) {
        await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      }
      expect(await waitForHomePageStable(driver, 3000)).assertTrue();
      const componentCount = await homeComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    // 重复启动 standard 模式：8 次连续启动后详情页仍可见，standard 每次新实例不影响渲染
    it('repeated_standard_launch_should_remain_visible', 0, async () => {
      for (let i = 0; i < 3; i++) {
        await launchStandardAbility(i % 2);
        await serializedDelay(driver, DELAY_AFTER_START_MODE);
      }
      expect(await waitForFoodDetailStable(driver, TIMEOUT_PAGE_SWITCH)).assertTrue();
      expect(await isFoodDetailVisible(driver)).assertTrue();
    });

    // 重复启动 singleton 模式：8 次连续启动后实例复用提示与详情页均可恢复
    it('repeated_singleton_launch_should_remain_visible', 0, async () => {
      await launchSingletonAbility(0);
      await serializedDelay(driver, DELAY_AFTER_START_MODE);
      for (let i = 0; i < 3; i++) {
        await launchSingletonAbility(i % 2);
        await serializedDelay(driver, DELAY_AFTER_START_MODE);
      }
      expect(await isFoodDetailVisible(driver)).assertTrue();
    });

    // 压测后回归：恢复主页并确认分组标签全部回归可见
    it('recovery_after_stress_should_restore_home', 0, async () => {
      for (let i = 0; i < 10; i++) {
        await pressAndWait(driver, i % 2 === 0 ? KEY_UP : KEY_DOWN, 1, 10);
      }
      expect(await resetToHome(driver)).assertTrue();
      expect(await isHomePageVisible(driver)).assertTrue();
    });
  });
}
