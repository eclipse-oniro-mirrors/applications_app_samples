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
import { abilityDelegatorRegistry, Component, Driver } from '@kit.TestKit';
import { afterEach, beforeAll, describe, expect, it } from '@ohos/hypium';
import { ON } from '@ohos.UiTest';
import { hilog } from '@kit.PerformanceAnalysisKit';

const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const driver = Driver.create();
const BUNDLE = 'DepthComponent_';
const TAG = '[Sample_DepthComponent_]';
const DOMAIN = 0xF811;
const BUNDLE_NAME = 'com.example.depthcomponentsample';
const ENTRY_LIST_ITEM = '2D 图片景深'; // Index 列表首项，用于判断是否回到主页

export function DepthComponentDepthTest() {
  describe('DepthComponent_DepthTest', () => {

    beforeAll(async () => {
      await delegator.startAbility({
        bundleName: BUNDLE_NAME,
        abilityName: 'EntryAbility'
      });
      await driver.delayMs(3000);
    })

    afterEach(async () => {
      // 返回主页：逐次返回直到重新看到 Index 列表首项，最多重试 3 次避免死循环
      let count = 0;
      let indexItem: Component | null = null;
      do {
        await driver.pressBack();
        await driver.delayMs(1000);
        indexItem = await driver.findComponent(ON.text(ENTRY_LIST_ITEM));
        count++;
      } while (indexItem == null && count < 3)
    })

    /*
     * @tc.number: DepthComponent_DepthTest_001
     * @tc.name: depthComponentDepthExample
     * @tc.desc: verify the depth-only (numeric position) depth component page can be loaded.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'DepthTest_001', 0, async () => {
      hilog.info(DOMAIN, TAG, 'DepthComponent_DepthTest_001_begin');
      const listItem = await driver.findComponent(ON.text('仅设置深度'));
      expect(listItem !== null).assertTrue();
      await listItem.click();
      await driver.delayMs(2000);

      const text = await driver.findComponent(ON.text('Spatial Effect'));
      expect(text !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'DepthComponent_DepthTest_001_end');
    })
  })
}
