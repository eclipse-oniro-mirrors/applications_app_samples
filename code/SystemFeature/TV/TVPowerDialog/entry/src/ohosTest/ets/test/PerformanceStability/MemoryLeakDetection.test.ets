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
  createFreshDriver,
  KEY_LEFT,
  KEY_RIGHT,
  KEY_BACK,
  powerDialogComponentCount,
  isPowerDialogVisible,
  waitForDialogStable,
  pressAndWait,
  serializedDelay,
  TIMEOUT_DIALOG_RENDER,
  DELAY_KEY_NAVIGATION
} from '../Shared/SharedDriver';

export default function memoryLeakDetectionTest() {
  describe('MemoryLeakDetection_Test', () => {
    let driver: Driver;

    // 测试前置：初始化驱动，确保测试环境干净
    beforeAll(async () => {
      driver = createFreshDriver();
      await serializedDelay(driver, 1000);
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
    });

    // 测试清理：关闭对话框并释放资源，避免影响后续测试
    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
    });

    // 打开-关闭后组件数量不异常增长：以真实UI组件数为断言
    it('dialog_component_count_should_stay_bounded_after_open_close', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      const baselineCount = await powerDialogComponentCount(driver);
      expect(baselineCount).assertLargerOrEqual(1);

      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      const finalCount = await powerDialogComponentCount(driver);

      expect(Math.abs(finalCount - baselineCount)).assertLessOrEqual(5);
      expect(await isPowerDialogVisible(driver)).assertTrue();
    });

    // 导航后组件数量不异常增长：以真实UI组件数为断言
    it('dialog_component_count_should_stay_bounded_after_navigation', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      const baselineCount = await powerDialogComponentCount(driver);
      expect(baselineCount).assertLargerOrEqual(1);

      for (let i = 0; i < 8; i++) {
        await pressAndWait(driver, i % 2 === 0 ? KEY_LEFT : KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        await serializedDelay(driver, 100);
      }

      const finalCount = await powerDialogComponentCount(driver);
      expect(Math.abs(finalCount - baselineCount)).assertLessOrEqual(5);
      expect(await isPowerDialogVisible(driver)).assertTrue();
    });

    // 多次操作后组件数量趋于稳定
    it('dialog_component_count_should_stabilize', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      const baselineCount = await powerDialogComponentCount(driver);
      expect(baselineCount).assertLargerOrEqual(1);

      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 1000);
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      const finalCount = await powerDialogComponentCount(driver);

      expect(Math.abs(finalCount - baselineCount)).assertLessOrEqual(5);
    });

    // 销毁重开后组件数量不残留
    it('dialog_should_release_resources_after_destruction', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      const baselineCount = await powerDialogComponentCount(driver);
      expect(baselineCount).assertLargerOrEqual(1);

      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 1000);
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      const finalCount = await powerDialogComponentCount(driver);

      // 销毁重开后组件数不应超过基线容差
      expect(finalCount).assertLessOrEqual(baselineCount + 5);
    });

    // 多轮导航后组件不累积
    it('dialog_should_not_accumulate_components', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      const baselineCount = await powerDialogComponentCount(driver);
      expect(baselineCount).assertLargerOrEqual(1);

      for (let cycle = 0; cycle < 4; cycle++) {
        await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
        await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        await serializedDelay(driver, 200);
      }

      const finalCount = await powerDialogComponentCount(driver);
      expect(Math.abs(finalCount - baselineCount)).assertLessOrEqual(5);
      expect(await isPowerDialogVisible(driver)).assertTrue();
    });

    // 重复打开关闭循环后组件数量稳定
    it('dialog_should_handle_repeated_open_close_cycles', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      const baselineCount = await powerDialogComponentCount(driver);
      expect(baselineCount).assertLargerOrEqual(1);

      for (let cycle = 0; cycle < 3; cycle++) {
        await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
        await serializedDelay(driver, 500);
        await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      }

      const finalCount = await powerDialogComponentCount(driver);
      expect(Math.abs(finalCount - baselineCount)).assertLessOrEqual(5);
      expect(await isPowerDialogVisible(driver)).assertTrue();
    });

    // 焦点切换期间组件数量稳定
    it('dialog_component_count_should_stay_bounded_during_focus_changes', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      const baselineCount = await powerDialogComponentCount(driver);
      expect(baselineCount).assertLargerOrEqual(1);

      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);

      const finalCount = await powerDialogComponentCount(driver);
      expect(Math.abs(finalCount - baselineCount)).assertLessOrEqual(5);
      expect(await isPowerDialogVisible(driver)).assertTrue();
    });

    // 边界场景（长连按）后组件数量稳定
    it('dialog_should_handle_edge_case_component_scenarios', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      const baselineCount = await powerDialogComponentCount(driver);
      expect(baselineCount).assertLargerOrEqual(1);

      await pressAndWait(driver, KEY_LEFT, 12, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_RIGHT, 12, DELAY_KEY_NAVIGATION);

      const finalCount = await powerDialogComponentCount(driver);
      expect(Math.abs(finalCount - baselineCount)).assertLessOrEqual(5);
      expect(await isPowerDialogVisible(driver)).assertTrue();
    });

    // 平均组件数量围绕基线稳定
    it('dialog_average_component_count_should_be_stable', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      const baselineCount = await powerDialogComponentCount(driver);
      expect(baselineCount).assertLargerOrEqual(1);

      const samples = 5;
      let total = 0;
      for (let i = 0; i < samples; i++) {
        await pressAndWait(driver, i % 2 === 0 ? KEY_LEFT : KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        total += await powerDialogComponentCount(driver);
        await serializedDelay(driver, 50);
      }

      const avgCount = total / samples;
      expect(Math.abs(avgCount - baselineCount)).assertLessOrEqual(5);
    });

    // 综合场景：完整操作流程后组件数量稳定
    it('comprehensive_component_stability_scenario', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      const baselineCount = await powerDialogComponentCount(driver);
      expect(baselineCount).assertLargerOrEqual(1);

      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      const count1 = await powerDialogComponentCount(driver);
      expect(Math.abs(count1 - baselineCount)).assertLessOrEqual(5);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      const count2 = await powerDialogComponentCount(driver);
      expect(Math.abs(count2 - baselineCount)).assertLessOrEqual(5);
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      const finalCount = await powerDialogComponentCount(driver);
      expect(Math.abs(finalCount - baselineCount)).assertLessOrEqual(5);
      expect(await isPowerDialogVisible(driver)).assertTrue();
    });
  });
}
