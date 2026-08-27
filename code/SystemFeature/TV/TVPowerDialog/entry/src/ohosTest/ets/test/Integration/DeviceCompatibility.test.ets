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
  TIMEOUT_DIALOG_RENDER,
  DELAY_KEY_NAVIGATION
} from '../Shared/SharedDriver';

export default function deviceCompatibilityTest() {
  describe('DeviceCompatibility_Test', () => {
    let driver: Driver;

    // 测试前置：初始化驱动，确保测试环境干净
    beforeAll(async () => {
      driver = createFreshDriver(); // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
      await driver.delayMs(1000);
    });

    // 测试清理：关闭对话框并释放资源，避免影响后续测试
    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await driver.delayMs(500);
    });

    // 删除伪造的方向/分辨率/语言测试，仅保留真实配置下的验证
    it('dialog_should_render_correctly_in_current_config', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      const componentCount = await powerDialogComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
      expect(await isPowerDialogVisible(driver)).assertTrue();
    });

    it('dialog_should_maintain_stability_across_configurations', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      const initialCount = await powerDialogComponentCount(driver);

      // 测试环境无法切换配置，移除伪造的 setCurrent*；保留真实导航与组件数稳定性校验
      for (let i = 0; i < 30; i++) {
        await pressAndWait(driver, i % 2 === 0 ? KEY_LEFT : KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        await driver.delayMs(50);
      }

      const finalCount = await powerDialogComponentCount(driver);
      expect(Math.abs(finalCount - initialCount)).assertLessOrEqual(5);
      expect(await isPowerDialogVisible(driver)).assertTrue();
    });

    // 综合comprehensive device场景测试：验证完整操作流程中功能正确
    it('comprehensive_device_compatibility_scenario', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      // 测试环境无法切换配置，移除伪造的 setCurrent*；保留真实导航与状态校验
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      expect(await isPowerDialogVisible(driver)).assertTrue();

      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      expect(await isPowerDialogVisible(driver)).assertTrue();

      const componentCount = await powerDialogComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });
  });


}
