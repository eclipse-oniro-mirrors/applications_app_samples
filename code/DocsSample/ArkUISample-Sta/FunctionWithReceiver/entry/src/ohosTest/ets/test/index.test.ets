'use static'

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

import { describe, it, expect, beforeAll, Level } from '@ohos/hypium';
import { abilityDelegatorRegistry, Driver, ON, MatchPattern, On, Component } from '@kit.TestKit';
import { UIAbility, Want } from '@kit.AbilityKit';
import hilog from '@ohos.hilog';
import router from '@ohos.router';

const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const bundleName = abilityDelegatorRegistry.getArguments().bundleName;
let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
let want: Want;
let driver: Driver;
const TAG = '[Sample_FunctionWithReceiver]'
const DOMAIN = 0xF811
const BUNDLE = 'FunctionWithReceiver'

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
     * @tc.number UiTest_001
     * @tc.name ReceiverParam
     * @tc.desc Function-with-Receiver支持参数
     * @tc.level: Level 1
     */

    it('ReceiverParam', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: ReceiverParam begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/ReceiverParam' });
      await driver.delayMs(1000);
      let text = await driver.findComponent(ON.text('Fancy', MatchPattern.CONTAINS));
      expect(text).not.toBeNull();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_002
     * @tc.name ReceiverChain
     * @tc.desc 链式调用Function-with-Receiver
     * @tc.level: Level 1
     */

    it('ReceiverChain', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: ReceiverChain begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/ReceiverChain' });
      await driver.delayMs(1000);
      let text = await driver.findComponent(ON.text('Fancy', MatchPattern.CONTAINS));
      expect(text).not.toBeNull();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_003
     * @tc.name ReceiverEvent
     * @tc.desc 参数为function作为Event事件句柄
     * @tc.level: Level 1
     */

    it('ReceiverEvent', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: ReceiverEvent begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/ReceiverEvent' });
      await driver.delayMs(1000);
      let text = await driver.findComponent(ON.text('Hello World', MatchPattern.CONTAINS));
      expect(text).not.toBeNull();
      await text.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_004
     * @tc.name ReceiverState
     * @tc.desc 参数为状态变量
     * @tc.level: Level 1
     */

    it('ReceiverState', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: ReceiverState begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/ReceiverState' });
      await driver.delayMs(1000);
      let text = await driver.findComponent(ON.text('Fancy', MatchPattern.CONTAINS));
      await text.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_005
     * @tc.name ReceiverScenarioBefore
     * @tc.desc 使用场景(不使用Function-with-Receiver)
     * @tc.level: Level 1
     */

    it('ReceiverScenarioBefore', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: ReceiverScenarioBefore begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/ReceiverScenarioBefore' });
      await driver.delayMs(1000);
      let text = await driver.findComponent(ON.text('Hello World', MatchPattern.CONTAINS));
      expect(text).not.toBeNull();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_006
     * @tc.name ReceiverScenarioAfter
     * @tc.desc 使用场景(使用Function-with-Receiver)
     * @tc.level: Level 1
     */

    it('ReceiverScenarioAfter', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: ReceiverScenarioAfter begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/ReceiverScenarioAfter' });
      await driver.delayMs(1000);
      let text = await driver.findComponent(ON.text('Hello World', MatchPattern.CONTAINS));
      expect(text).not.toBeNull();
      await driver.delayMs(1000);
      done();
    });
  })
}
