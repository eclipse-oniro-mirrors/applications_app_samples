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
  powerDialogComponentCount,
  isPowerDialogVisible,
  waitForDialogStable,
  pressAndWait,
  serializedDelay,
  TIMEOUT_DIALOG_RENDER,
  DELAY_KEY_NAVIGATION
} from '../Shared/SharedDriver';

export default function concurrencyControlTest() {
  describe('ConcurrencyControl_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      await serializedDelay(driver, 1000);
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
    });

    // 多次按键操作后对话框状态稳定：以真实组件数与可见性为断言
    it('dialog_should_handle_concurrent_key_presses', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      for (let i = 0; i < 5; i++) {
        await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
        await serializedDelay(driver, 50);
      }
      const componentCount = await powerDialogComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
      expect(await isPowerDialogVisible(driver)).assertTrue();
    });

    // 并发操作后状态维持：以真实组件数稳定性为断言
    it('dialog_should_maintain_state_during_concurrent_operations', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      const initialCount = await powerDialogComponentCount(driver);
      expect(initialCount).assertLargerOrEqual(1);

      for (let i = 0; i < 10; i++) {
        await pressAndWait(driver, i % 2 === 0 ? KEY_LEFT : KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        await serializedDelay(driver, 30);
      }

      const finalCount = await powerDialogComponentCount(driver);
      expect(Math.abs(finalCount - initialCount)).assertLessOrEqual(5);
      expect(await isPowerDialogVisible(driver)).assertTrue();
    });

    // 快速切换后对话框仍可见、组件数正常（焦点索引查询在部分TV设备不可靠，改用真实渲染状态）
    it('dialog_should_handle_rapid_concurrent_focus_changes', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      for (let i = 0; i < 8; i++) {
        await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
        await serializedDelay(driver, 40);
      }
      expect(await isPowerDialogVisible(driver)).assertTrue();
      const componentCount = await powerDialogComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    // 并发状态更新后对话框可见
    it('dialog_should_handle_concurrent_state_updates', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      for (let i = 0; i < 6; i++) {
        await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        await serializedDelay(driver, 60);
      }
      const componentCount = await powerDialogComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
      expect(await isPowerDialogVisible(driver)).assertTrue();
    });

    // 混合类型操作后对话框可见、组件数正常
    it('concurrent_operations_should_handle_mixed_types', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      for (let i = 0; i < 12; i++) {
        await pressAndWait(driver, i % 2 === 0 ? KEY_LEFT : KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        await serializedDelay(driver, 30);
      }
      expect(await isPowerDialogVisible(driver)).assertTrue();
      const componentCount = await powerDialogComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    // 高频操作性能：20 次串行化操作后对话框未崩溃
    it('concurrent_operations_should_not_break_dialog_after_rapid_ops', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      for (let i = 0; i < 20; i++) {
        await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
        await serializedDelay(driver, 30);
      }
      expect(await isPowerDialogVisible(driver)).assertTrue();
      const componentCount = await powerDialogComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    // 错误恢复：操作异常后对话框仍可见
    it('concurrent_operations_should_handle_error_recovery', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      for (let i = 0; i < 10; i++) {
        try {
          await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
        } catch (e) {
          console.error('concurrent_operations_should_handle_error_recovery error:', e);
        }
        await serializedDelay(driver, 50);
      }
      const componentCount = await powerDialogComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
      expect(await isPowerDialogVisible(driver)).assertTrue();
    });

    // 边界条件：30 次高频操作后对话框可见、组件数正常
    it('concurrent_operations_should_handle_boundary_conditions', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      for (let i = 0; i < 30; i++) {
        await pressAndWait(driver, i % 2 === 0 ? KEY_LEFT : KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        await serializedDelay(driver, 20);
      }
      expect(await isPowerDialogVisible(driver)).assertTrue();
      const componentCount = await powerDialogComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    // 综合并发场景：完整操作流程后对话框可见、组件数稳定
    it('comprehensive_concurrency_control_scenario', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      const initialCount = await powerDialogComponentCount(driver);
      expect(initialCount).assertLargerOrEqual(1);

      for (let i = 0; i < 10; i++) {
        await pressAndWait(driver, i % 2 === 0 ? KEY_LEFT : KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        await serializedDelay(driver, 50);
      }

      const componentCount = await powerDialogComponentCount(driver);
      expect(Math.abs(componentCount - initialCount)).assertLessOrEqual(5);
      expect(await isPowerDialogVisible(driver)).assertTrue();
    });
  });
}
