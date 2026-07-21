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
import { describe, it, expect, beforeAll } from '@ohos/hypium';
import { abilityDelegatorRegistry, Driver, ON, MatchPattern } from '@kit.TestKit';
import { UIAbility, Want } from '@kit.AbilityKit';
import hilog from '@ohos.hilog';

const TAG = '[Sample_TroubleshootingStateManage]';
const DOMAIN = 0xF811;
const BUNDLE = 'TroubleshootingStateManage_';
const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const bundleName = abilityDelegatorRegistry.getArguments().bundleName;
let want: Want;

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    beforeAll(async () => {
      want = {
        bundleName: bundleName,
        abilityName: 'EntryAbility'
      };
      await delegator.startAbility(want);
      let driver = Driver.create();
      await driver.delayMs(1000);
      const ability: UIAbility = await delegator.getCurrentTopAbility();
      expect(ability.context.abilityInfo.name).assertEqual('EntryAbility');
    })

    /**
     * @tc.number TroubleshootingStateManage_StateValueChange_001
     * @tc.name testStateValueChange
     * @tc.desc 测试进入状态变量改变页面，点击Text后message发生变化
     */
    it(BUNDLE + 'StateValueChange_001', 0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, `${BUNDLE}StateValueChange_001 begin`);
      let driver = Driver.create();
      let entryButton = await driver.findComponent(ON.text('Step 2', MatchPattern.CONTAINS));
      await entryButton.click();
      await driver.delayMs(1000);
      let text = await driver.findComponent(ON.text('Hello World', MatchPattern.CONTAINS));
      hilog.info(DOMAIN, TAG, `${BUNDLE}StateValueChange_001 text found`);
      await text.click();
      await driver.delayMs(1000);
      await driver.pressBack();
      hilog.info(DOMAIN, TAG, `${BUNDLE}StateValueChange_001 end`);
      done();
    })

    /**
     * @tc.number TroubleshootingStateManage_ObservabilityV2_001
     * @tc.name testObservabilityV2
     * @tc.desc 测试进入V2可观察性页面，点击按钮修改属性触发刷新
     */
    it(BUNDLE + 'ObservabilityV2_001', 0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, `${BUNDLE}ObservabilityV2_001 begin`);
      let driver = Driver.create();
      let entryButton = await driver.findComponent(ON.text('Step 3 (V2)', MatchPattern.CONTAINS));
      await entryButton.click();
      await driver.delayMs(1000);
      let button = await driver.findComponent(ON.text('change info property', MatchPattern.CONTAINS));
      hilog.info(DOMAIN, TAG, `${BUNDLE}ObservabilityV2_001 button found`);
      await button.click();
      await driver.delayMs(1000);
      await driver.pressBack();
      hilog.info(DOMAIN, TAG, `${BUNDLE}ObservabilityV2_001 end`);
      done();
    })

    /**
     * @tc.number TroubleshootingStateManage_ForEachSync_001
     * @tc.name testForEachSync
     * @tc.desc 测试进入ForEach同步页面，点击按钮触发列表项刷新
     */
    it(BUNDLE + 'ForEachSync_001', 0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, `${BUNDLE}ForEachSync_001 begin`);
      let driver = Driver.create();
      let entryButton = await driver.findComponent(ON.text('Step 4', MatchPattern.CONTAINS));
      await entryButton.click();
      await driver.delayMs(1000);
      let button = await driver.findComponent(ON.text('change first item value', MatchPattern.CONTAINS));
      hilog.info(DOMAIN, TAG, `${BUNDLE}ForEachSync_001 button found`);
      await button.click();
      await driver.delayMs(1000);
      await button.click();
      await driver.delayMs(1000);
      await driver.pressBack();
      hilog.info(DOMAIN, TAG, `${BUNDLE}ForEachSync_001 end`);
      done();
    })

    /**
     * @tc.number TroubleshootingStateManage_RenderUpdate_001
     * @tc.name testRenderUpdate
     * @tc.desc 测试进入渲染更新页面，点击按钮切换Image资源并修改宽度
     */
    it(BUNDLE + 'RenderUpdate_001', 0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, `${BUNDLE}RenderUpdate_001 begin`);
      let driver = Driver.create();
      let entryButton = await driver.findComponent(ON.text('Step 5', MatchPattern.CONTAINS));
      await entryButton.click();
      await driver.delayMs(1000);
      let changeResource = await driver.findComponent(ON.text('change resource', MatchPattern.CONTAINS));
      hilog.info(DOMAIN, TAG, `${BUNDLE}RenderUpdate_001 change resource found`);
      await changeResource.click();
      await driver.delayMs(1000);
      let changeWidth = await driver.findComponent(ON.text('change widthValue', MatchPattern.CONTAINS));
      await changeWidth.click();
      await driver.delayMs(1000);
      await driver.pressBack();
      hilog.info(DOMAIN, TAG, `${BUNDLE}RenderUpdate_001 end`);
      done();
    })
  })
}
