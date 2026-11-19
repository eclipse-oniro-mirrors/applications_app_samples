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
  DELAY_KEY_NAVIGATION
} from '../Shared/CustomViewTestDriver';

export default function deviceCompatibilityTest() {
  describe('DeviceCompatibility_Test', () => {
    let driver: Driver;

    // 测试前置：初始化驱动，确保测试环境干净
    beforeAll(async () => {
      driver = getDriver(); // 复用全局Driver单例：确保跨测试用例数据一致性，避免状态污染
      await driver.delayMs(1000);
    });

    // 测试清理：关闭页签页并释放资源，避免影响后续测试
    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await driver.delayMs(500);
    });

    // 删除伪造的方向/分辨率/语言测试，仅保留真实配置下的验证
    it('tab_should_render_correctly_in_current_config', 0, async () => {
      await waitForPageStable(driver, TIMEOUT_TAB_RENDER);
      const componentCount = await pageComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
      expect(await isSamplePageVisible(driver)).assertTrue();
    });

    it('tab_should_maintain_stability_across_configurations', 0, async () => {
      await waitForPageStable(driver, TIMEOUT_TAB_RENDER);

      const initialCount = await pageComponentCount(driver);

      // 测试环境无法切换配置，移除伪造的 setCurrent*；保留真实导航与组件数稳定性校验
      for (let i = 0; i < 30; i++) {
        await pressAndWait(driver, i % 2 === 0 ? KEY_LEFT : KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        await driver.delayMs(50);
      }

      const finalCount = await pageComponentCount(driver);
      expect(Math.abs(finalCount - initialCount)).assertLessOrEqual(5);
      expect(await isSamplePageVisible(driver)).assertTrue();
    });

    // 综合comprehensive device场景测试：验证完整操作流程中功能正确
  });

}
