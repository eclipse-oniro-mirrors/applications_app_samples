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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { abilityDelegatorRegistry, Driver, ON, MatchPattern } from '@kit.TestKit';
import { UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const bundleName = abilityDelegatorRegistry.getArguments().bundleName;
let want: Want;
let driver: Driver;
const TAG = '[Sample_UiInfoCollectionAndInjection]';
const DOMAIN = 0xF811;
const BUNDLE = 'uiinfocollectionandinjection_';

export default function IndexTest() {
  describe('IndexTest', () => {
    beforeAll(async () => {
      want = {
        bundleName: bundleName,
        abilityName: 'EntryAbility'
      };
      await delegator.startAbility(want);
      driver = Driver.create();
      await driver.delayMs(2000);
      const ability: UIAbility = await delegator.getCurrentTopAbility();
      hilog.info(DOMAIN, TAG, BUNDLE + 'get top ability');
      expect(ability.context.abilityInfo.name).assertEqual('EntryAbility');
    })

    /**
     * @tc.number uiinfocollectionandinjection_IndexTree_001
     * @tc.name IndexTree_001
     * @tc.desc 测试从主页进入控件树采集页面
     */
    it(BUNDLE + 'IndexTree_001', 0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'IndexTree_001, begin');
      let targetElement = await driver.findComponent(ON.id('navTreeButton'));
      hilog.info(DOMAIN, TAG, BUNDLE + 'IndexTree_001, navButton: ' + (targetElement !== null));
      expect(targetElement === null).assertFalse();
      await targetElement!.click();
      await driver.delayMs(2000);
      // 采集按钮出现说明页面加载成功
      let syncButton = await driver.findComponent(ON.id('treeSyncButton'));
      hilog.info(DOMAIN, TAG, BUNDLE + 'IndexTree_001, syncButton: ' + (syncButton !== null));
      expect(syncButton === null).assertFalse();
      await driver.pressBack();
      hilog.info(DOMAIN, TAG, BUNDLE + 'IndexTree_001, end');
      done();
    });

    /**
     * @tc.number uiinfocollectionandinjection_TreeSync_001
     * @tc.name TreeSync_001
     * @tc.desc 测试同步采集控件树并显示解析结果
     */
    it(BUNDLE + 'TreeSync_001', 0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'TreeSync_001, begin');
      let navButton = await driver.findComponent(ON.id('navTreeButton'));
      await navButton!.click();
      await driver.delayMs(2000);
      let syncButton = await driver.findComponent(ON.id('treeSyncButton'));
      await syncButton!.click();
      await driver.delayMs(2000);
      // 状态行包含schema=说明采集与解析成功
      let statusElement = await driver.findComponent(ON.text('schema=', MatchPattern.CONTAINS));
      hilog.info(DOMAIN, TAG, BUNDLE + 'TreeSync_001, status: ' + (statusElement !== null));
      expect(statusElement === null).assertFalse();
      await driver.pressBack();
      hilog.info(DOMAIN, TAG, BUNDLE + 'TreeSync_001, end');
      done();
    });

    /**
     * @tc.number uiinfocollectionandinjection_TreeAsync_001
     * @tc.name TreeAsync_001
     * @tc.desc 测试异步采集控件树并通过回调显示结果
     */
    it(BUNDLE + 'TreeAsync_001', 0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'TreeAsync_001, begin');
      let navButton = await driver.findComponent(ON.id('navTreeButton'));
      await navButton!.click();
      await driver.delayMs(2000);
      let asyncButton = await driver.findComponent(ON.id('treeAsyncButton'));
      await asyncButton!.click();
      await driver.delayMs(3000);
      let statusElement = await driver.findComponent(ON.text('schema=', MatchPattern.CONTAINS));
      hilog.info(DOMAIN, TAG, BUNDLE + 'TreeAsync_001, status: ' + (statusElement !== null));
      expect(statusElement === null).assertFalse();
      await driver.pressBack();
      hilog.info(DOMAIN, TAG, BUNDLE + 'TreeAsync_001, end');
      done();
    });

    /**
     * @tc.number uiinfocollectionandinjection_TreeOptions_001
     * @tc.name TreeOptions_001
     * @tc.desc 测试组合采集选项后同步采集
     */
    it(BUNDLE + 'TreeOptions_001', 0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'TreeOptions_001, begin');
      let navButton = await driver.findComponent(ON.id('navTreeButton'));
      await navButton!.click();
      await driver.delayMs(2000);
      let visibleToggle = await driver.findComponent(ON.id('toggleVisibleOnly'));
      await visibleToggle!.click();
      let layoutToggle = await driver.findComponent(ON.id('toggleFilterLayout'));
      await layoutToggle!.click();
      let syncButton = await driver.findComponent(ON.id('treeSyncButton'));
      await syncButton!.click();
      await driver.delayMs(2000);
      let statusElement = await driver.findComponent(ON.text('schema=', MatchPattern.CONTAINS));
      hilog.info(DOMAIN, TAG, BUNDLE + 'TreeOptions_001, status: ' + (statusElement !== null));
      expect(statusElement === null).assertFalse();
      await driver.pressBack();
      hilog.info(DOMAIN, TAG, BUNDLE + 'TreeOptions_001, end');
      done();
    });

    /**
     * @tc.number uiinfocollectionandinjection_CommandSetText_001
     * @tc.name CommandSetText_001
     * @tc.desc 测试向输入框目标提交setText指令并显示执行结果
     */
    it(BUNDLE + 'CommandSetText_001', 0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'CommandSetText_001, begin');
      let navButton = await driver.findComponent(ON.id('navCommandButton'));
      await navButton!.click();
      await driver.delayMs(2000);
      let presetButton = await driver.findComponent(ON.id('presetSetText'));
      await presetButton!.click();
      let submitButton = await driver.findComponent(ON.id('commandSubmitButton'));
      await submitButton!.click();
      await driver.delayMs(3000);
      // 状态行包含result=说明注入完成回调已返回
      let statusElement = await driver.findComponent(ON.text('result=', MatchPattern.CONTAINS));
      hilog.info(DOMAIN, TAG, BUNDLE + 'CommandSetText_001, status: ' + (statusElement !== null));
      expect(statusElement === null).assertFalse();
      await driver.pressBack();
      hilog.info(DOMAIN, TAG, BUNDLE + 'CommandSetText_001, end');
      done();
    });

    /**
     * @tc.number uiinfocollectionandinjection_CommandSwiper_001
     * @tc.name CommandSwiper_001
     * @tc.desc 测试切换目标为Swiper并提交swiperSwitch指令
     */
    it(BUNDLE + 'CommandSwiper_001', 0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'CommandSwiper_001, begin');
      let navButton = await driver.findComponent(ON.id('navCommandButton'));
      await navButton!.click();
      await driver.delayMs(2000);
      let swiperRadio = await driver.findComponent(ON.id('targetRadioSwiper'));
      await swiperRadio!.click();
      let presetButton = await driver.findComponent(ON.id('presetSwiperSwitch'));
      await presetButton!.click();
      let submitButton = await driver.findComponent(ON.id('commandSubmitButton'));
      await submitButton!.click();
      await driver.delayMs(3000);
      let statusElement = await driver.findComponent(ON.text('result=', MatchPattern.CONTAINS));
      hilog.info(DOMAIN, TAG, BUNDLE + 'CommandSwiper_001, status: ' + (statusElement !== null));
      expect(statusElement === null).assertFalse();
      await driver.pressBack();
      hilog.info(DOMAIN, TAG, BUNDLE + 'CommandSwiper_001, end');
      done();
    });

    /**
     * @tc.number uiinfocollectionandinjection_CommandTabs_001
     * @tc.name CommandTabs_001
     * @tc.desc 测试切换目标为Tabs并提交tabsSwitch指令
     */
    it(BUNDLE + 'CommandTabs_001', 0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'CommandTabs_001, begin');
      let navButton = await driver.findComponent(ON.id('navCommandButton'));
      await navButton!.click();
      await driver.delayMs(2000);
      let tabsRadio = await driver.findComponent(ON.id('targetRadioTabs'));
      await tabsRadio!.click();
      let presetButton = await driver.findComponent(ON.id('presetTabsSwitch'));
      await presetButton!.click();
      let submitButton = await driver.findComponent(ON.id('commandSubmitButton'));
      await submitButton!.click();
      await driver.delayMs(3000);
      let statusElement = await driver.findComponent(ON.text('result=', MatchPattern.CONTAINS));
      hilog.info(DOMAIN, TAG, BUNDLE + 'CommandTabs_001, status: ' + (statusElement !== null));
      expect(statusElement === null).assertFalse();
      await driver.pressBack();
      hilog.info(DOMAIN, TAG, BUNDLE + 'CommandTabs_001, end');
      done();
    });
  })
}
