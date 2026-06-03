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
const TAG = '[Sample_PersistenceV2]'
const DOMAIN = 0xF811
const BUNDLE = 'PersistenceV2'

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
     * @tc.name PersistenceV2Array
     * @tc.desc PersistenceV2装饰Array类型
     * @tc.level: Level 1
     */

    it('PersistenceV2Array', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: PersistenceV2Array begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/PersistenceV2Array' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('push', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_002
     * @tc.name PersistenceV2Map
     * @tc.desc PersistenceV2装饰Map类型
     * @tc.level: Level 1
     */

    it('PersistenceV2Map', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: PersistenceV2Map begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/PersistenceV2Map' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('add', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('delete last', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_003
     * @tc.name PersistenceV2Set
     * @tc.desc PersistenceV2装饰Set类型
     * @tc.level: Level 1
     */

    it('PersistenceV2Set', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: PersistenceV2Set begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/PersistenceV2Set' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('add', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('remove last', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_004
     * @tc.name PersistenceV2Date
     * @tc.desc PersistenceV2装饰Date类型
     * @tc.level: Level 1
     */

    it('PersistenceV2Date', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: PersistenceV2Date begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/PersistenceV2Date' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('update', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_005
     * @tc.name PersistenceV2NestedClass
     * @tc.desc PersistenceV2装饰嵌套类
     * @tc.level: Level 1
     */

    it('PersistenceV2NestedClass', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: PersistenceV2NestedClass begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/PersistenceV2NestedClass' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('init', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('modify', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_006
     * @tc.name PersistenceV2CircularRef
     * @tc.desc PersistenceV2处理循环引用
     * @tc.level: Level 1
     */

    it('PersistenceV2CircularRef', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: PersistenceV2CircularRef begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/PersistenceV2CircularRef' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('set self-ref', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('clear ref', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_007
     * @tc.name PersistenceV2MixedCollection
     * @tc.desc PersistenceV2装饰混合集合类型
     * @tc.level: Level 1
     */

    it('PersistenceV2MixedCollection', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: PersistenceV2MixedCollection begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/PersistenceV2MixedCollection' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('init all', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('add tag', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      let btn3 = await driver.findComponent(ON.text('add person to map', MatchPattern.CONTAINS));
      await btn3.click();
      await driver.delayMs(1000);
      let btn4 = await driver.findComponent(ON.text('add person to set', MatchPattern.CONTAINS));
      await btn4.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_008
     * @tc.name PersistenceV2ConnectGlobalConnect
     * @tc.desc PersistenceV2 connect与globalConnect使用
     * @tc.level: Level 1
     */

    it('PersistenceV2ConnectGlobalConnect', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: PersistenceV2ConnectGlobalConnect begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/PersistenceV2ConnectGlobalConnect' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('Change cp1 userId userName userInfo', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('Change cp2 userId userName userInfo', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_009
     * @tc.name PersistenceV2NotifyOnError
     * @tc.desc PersistenceV2错误回调通知
     * @tc.level: Level 1
     */

    it('PersistenceV2NotifyOnError', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: PersistenceV2NotifyOnError begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/PersistenceV2NotifyOnError' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('save key connect3', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_010
     * @tc.name PersistenceV2ConnectMigration
     * @tc.desc PersistenceV2数据迁移
     * @tc.level: Level 1
     */

    it('PersistenceV2ConnectMigration', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: PersistenceV2ConnectMigration begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/PersistenceV2ConnectMigration' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('Change userId userName userInfo', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_011
     * @tc.name PersistenceV2ContainerElementChange
     * @tc.desc PersistenceV2容器元素类型变更
     * @tc.level: Level 1
     */

    it('PersistenceV2ContainerElementChange', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: PersistenceV2ContainerElementChange begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/PersistenceV2ContainerElementChange' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('add Person', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_012
     * @tc.name PersistenceV2ConnectUsage
     * @tc.desc PersistenceV2使用connect存储数据
     * @tc.level: Level 1
     */

    it('PersistenceV2ConnectUsage', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: PersistenceV2ConnectUsage begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/PersistenceV2ConnectUsage' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('Change userId userName userInfo', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_013
     * @tc.name PersistenceV2ContainerTypeError
     * @tc.desc PersistenceV2容器元素类型变更数据异常
     * @tc.level: Level 1
     */

    it('PersistenceV2ContainerTypeError', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: PersistenceV2ContainerTypeError begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/PersistenceV2ContainerTypeError' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('add Person', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });
  })
}