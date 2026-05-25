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

const TAG = '[Sample_AppStorageV2]'
const DOMAIN = 0xF811
const BUNDLE = 'AppStorageV2'

export default function IndexTest() {
  describe('IndexTest', () => {
    beforeAll(async () => {
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator =
        abilityDelegatorRegistry.getAbilityDelegator();
      let ability: UIAbility = await abilityDelegator.getCurrentTopAbility();
      let driver: Driver = Driver.create();
    })

    /**
     * @tc.number UiTest_001
     * @tc.name AppStorageV2Basic示例测试
     * @tc.desc 测试AppStorageV2基本使用
     * @tc.level: Level 1
     */
    it('AppStorageV2BasicTest', Level.LEVEL1, async (done: Function) => {
      await router.pushUrl({ url: 'pages/AppStorageV2Basic' });
      let btn = await driver.findComponent(ON.text('Index userID', MatchPattern.CONTAINS));
      await btn.click();
      done();
    });

    /**
     * @tc.number UiTest_002
     * @tc.name AppStorageV2RemoveTest
     * @tc.desc 测试AppStorageV2 remove功能
     * @tc.level: Level 1
     */
    it('AppStorageV2RemoveTest', Level.LEVEL1, async (done: Function) => {
      await router.pushUrl({ url: 'pages/AppStorageV2Basic' });
      let btn = await driver.findComponent(ON.text('remove keyOrType', MatchPattern.CONTAINS));
      await btn.click();
      done();
    });

    /**
     * @tc.number UiTest_003
     * @tc.name AppStorageV2ConnectTest
     * @tc.desc 测试AppStorageV2 connect功能
     * @tc.level: Level 1
     */
    it('AppStorageV2ConnectTest', Level.LEVEL1, async (done: Function) => {
      await router.pushUrl({ url: 'pages/AppStorageV2Basic' });
      let btn = await driver.findComponent(ON.text('connect ttype', MatchPattern.CONTAINS));
      await btn.click();
      done();
    });

    /**
     * @tc.number UiTest_004
     * @tc.name AppStorageV2TwoPages示例测试
     * @tc.desc 测试AppStorageV2两页面场景
     * @tc.level: Level 1
     */
    it('AppStorageV2TwoPagesTest', Level.LEVEL1, async (done: Function) => {
      await router.pushUrl({ url: 'pages/AppStorageV2TwoPages' });
      let btn = await driver.findComponent(ON.text('Go to page2', MatchPattern.CONTAINS));
      await btn.click();
      done();
    });
  })
}