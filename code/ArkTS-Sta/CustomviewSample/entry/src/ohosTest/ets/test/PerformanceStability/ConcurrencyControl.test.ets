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
  serializedDelay,
  TIMEOUT_TAB_RENDER,
  DELAY_KEY_NAVIGATION
} from '../Shared/CustomViewTestDriver';
import hilog from '@ohos.hilog';

export default function concurrencyControlTest() {
  describe('ConcurrencyControl_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      await serializedDelay(driver, 1000);
      await waitForPageStable(driver, TIMEOUT_TAB_RENDER);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
    });

    // 多次按键操作后页签页状态稳定：以真实组件数与可见性为断言
    it('tab_should_handle_concurrent_key_presses', 0, async () => {
      await waitForPageStable(driver, TIMEOUT_TAB_RENDER);
      for (let i = 0; i < 5; i++) {
        await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
        await serializedDelay(driver, 50);
      }
      const componentCount = await pageComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
      expect(await isSamplePageVisible(driver)).assertTrue();
    });

    // 并发操作后状态维持：以真实组件数稳定性为断言
    it('tab_should_maintain_state_during_concurrent_operations', 0, async () => {
      await waitForPageStable(driver, TIMEOUT_TAB_RENDER);
      const initialCount = await pageComponentCount(driver);
      expect(initialCount).assertLargerOrEqual(1);

      for (let i = 0; i < 10; i++) {
        await pressAndWait(driver, i % 2 === 0 ? KEY_LEFT : KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        await serializedDelay(driver, 30);
      }

      const finalCount = await pageComponentCount(driver);
      expect(Math.abs(finalCount - initialCount)).assertLessOrEqual(5);
      expect(await isSamplePageVisible(driver)).assertTrue();
    });

    // 快速切换后页签页仍可见、组件数正常（焦点索引查询在部分TV设备不可靠，改用真实渲染状态）

    // 并发状态更新后页签页可见

    // 混合类型操作后页签页可见、组件数正常

    // 高频操作性能：20 次串行化操作后页签页未崩溃

    // 错误恢复：操作异常后页签页仍可见

    // 边界条件：30 次高频操作后页签页可见、组件数正常

    // 综合并发场景：完整操作流程后页签页可见、组件数稳定
  });

}
