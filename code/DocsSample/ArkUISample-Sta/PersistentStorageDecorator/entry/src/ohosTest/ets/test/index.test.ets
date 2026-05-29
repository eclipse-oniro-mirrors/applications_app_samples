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
import { abilityDelegatorRegistry, Driver, ON, MatchPattern } from '@kit.TestKit';
import { UIAbility, Want } from '@kit.AbilityKit';
import hilog from '@ohos.hilog';
import router from '@ohos.router';

const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const bundleName = abilityDelegatorRegistry.getArguments().bundleName;
let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
let want: Want;
let driver: Driver;
const TAG = '[Sample_PersistentStorageDecorator]'
const DOMAIN = 0xF811
const BUNDLE = 'PersistentStorageDecorator'

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
     * @tc.name PersistentStorageBasic
     * @tc.desc 从AppStorage中访问PersistentStorage初始化的属性
     * @tc.level: Level 1
     */

    it('PersistentStorageBasic', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: PersistentStorageBasic begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/PersistentStorageBasic' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('Hello World', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_002
     * @tc.name PersistentStorageUnionType
     * @tc.desc 支持联合类型
     * @tc.level: Level 1
     */

    it('PersistentStorageUnionType', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: PersistentStorageUnionType begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/PersistentStorageUnionType' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('union change', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_003
     * @tc.name PersistentStorageDate
     * @tc.desc 装饰Date类型变量
     * @tc.level: Level 1
     */

    it('PersistentStorageDate', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: PersistentStorageDate begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/PersistentStorageDate' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('change update', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_004
     * @tc.name PersistentStorageMap
     * @tc.desc 装饰Map类型变量
     * @tc.level: Level 1
     */

    it('PersistentStorageMap', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: PersistentStorageMap begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/PersistentStorageMap' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('map add', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_005
     * @tc.name PersistentStorageSet
     * @tc.desc 装饰Set类型变量
     * @tc.level: Level 1
     */

    it('PersistentStorageSet', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: PersistentStorageSet begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/PersistentStorageSet' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('set add', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_006
     * @tc.name PersistentStorageClass
     * @tc.desc 装饰class
     * @tc.level: Level 1
     */

    it('PersistentStorageClass', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: PersistentStorageClass begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/PersistentStorageClass' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('user Id', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });
  })
}