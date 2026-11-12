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
import { describe, beforeAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { Component, Driver, ON, abilityDelegatorRegistry } from '@kit.TestKit';

const TAG: string = '[Sample_UiSmokeSafe]';
const DOMAIN: number = 0xF811;
const driver: Driver = Driver.create();
const abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const bundleName: string = abilityDelegatorRegistry.getArguments().bundleName;


export default function uiSmokeSafeTest(): void {
  describe('uiSmokeSafeTest', () => {
  beforeAll(async () => {
    await abilityDelegator.startAbility({ bundleName: bundleName, abilityName: 'EntryAbility' });
    await driver.delayMs(5000);
  });

    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_UI_0001
     * @tc.name      testSafeUiSmoke0001
     * @tc.desc      UI smoke check 1 finds VideoView.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeUiSmoke0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSafeUiSmoke0001 begin');
      await driver.delayMs(300);
      const component: Component | null = await driver.findComponent(ON.id('VideoView'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSafeUiSmoke0001 component present: ' + String(component !== null && component !== undefined));
      expect(component !== null && component !== undefined).assertTrue();
      const top = await abilityDelegator.getCurrentTopAbility();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSafeUiSmoke0001 top ability: ' + top.context.abilityInfo.name);
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSafeUiSmoke0001 end');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_UI_0002
     * @tc.name      testSafeUiSmoke0002
     * @tc.desc      UI smoke check 2 finds Slider.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeUiSmoke0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSafeUiSmoke0002 begin');
      await driver.delayMs(300);
      const component: Component | null = await driver.findComponent(ON.id('Slider'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSafeUiSmoke0002 component present: ' + String(component !== null && component !== undefined));
      expect(component !== null && component !== undefined).assertTrue();
      const top = await abilityDelegator.getCurrentTopAbility();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSafeUiSmoke0002 top ability: ' + top.context.abilityInfo.name);
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSafeUiSmoke0002 end');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_UI_0003
     * @tc.name      testSafeUiSmoke0003
     * @tc.desc      UI smoke check 3 finds Speed.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeUiSmoke0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSafeUiSmoke0003 begin');
      await driver.delayMs(300);
      const component: Component | null = await driver.findComponent(ON.id('Speed'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSafeUiSmoke0003 component present: ' + String(component !== null && component !== undefined));
      expect(component !== null && component !== undefined).assertTrue();
      const top = await abilityDelegator.getCurrentTopAbility();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSafeUiSmoke0003 top ability: ' + top.context.abilityInfo.name);
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSafeUiSmoke0003 end');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_UI_0004
     * @tc.name      testSafeUiSmoke0004
     * @tc.desc      UI smoke check 4 finds currentTimeText.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeUiSmoke0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSafeUiSmoke0004 begin');
      await driver.delayMs(300);
      const component: Component | null = await driver.findComponent(ON.id('currentTimeText'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSafeUiSmoke0004 component present: ' + String(component !== null && component !== undefined));
      expect(component !== null && component !== undefined).assertTrue();
      const top = await abilityDelegator.getCurrentTopAbility();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSafeUiSmoke0004 top ability: ' + top.context.abilityInfo.name);
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSafeUiSmoke0004 end');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_UI_0005
     * @tc.name      testSafeUiSmoke0005
     * @tc.desc      UI smoke check 5 finds durationTimeText.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeUiSmoke0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSafeUiSmoke0005 begin');
      await driver.delayMs(300);
      const component: Component | null = await driver.findComponent(ON.id('durationTimeText'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSafeUiSmoke0005 component present: ' + String(component !== null && component !== undefined));
      expect(component !== null && component !== undefined).assertTrue();
      const top = await abilityDelegator.getCurrentTopAbility();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSafeUiSmoke0005 top ability: ' + top.context.abilityInfo.name);
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSafeUiSmoke0005 end');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_UI_0006
     * @tc.name      testSafeUiSmoke0006
     * @tc.desc      UI smoke check 6 finds pause.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeUiSmoke0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSafeUiSmoke0006 begin');
      await driver.delayMs(300);
      const component: Component | null = await driver.findComponent(ON.id('pause'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSafeUiSmoke0006 component present: ' + String(component !== null && component !== undefined));
      expect(component !== null && component !== undefined).assertTrue();
      const top = await abilityDelegator.getCurrentTopAbility();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSafeUiSmoke0006 top ability: ' + top.context.abilityInfo.name);
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSafeUiSmoke0006 end');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_UI_0007
     * @tc.name      testSafeUiSmoke0007
     * @tc.desc      UI smoke check 7 rechecks VideoView later in the smoke sequence.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeUiSmoke0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSafeUiSmoke0007 begin');
      await driver.delayMs(300);
      const component: Component | null = await driver.findComponent(ON.id('VideoView'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSafeUiSmoke0007 component present: ' + String(component !== null && component !== undefined));
      expect(component !== null && component !== undefined).assertTrue();
      const top = await abilityDelegator.getCurrentTopAbility();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSafeUiSmoke0007 top ability: ' + top.context.abilityInfo.name);
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSafeUiSmoke0007 end');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_UI_0008
     * @tc.name      testSafeUiSmoke0008
     * @tc.desc      UI smoke check 8 rechecks Slider later in the smoke sequence.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeUiSmoke0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSafeUiSmoke0008 begin');
      await driver.delayMs(300);
      const component: Component | null = await driver.findComponent(ON.id('Slider'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSafeUiSmoke0008 component present: ' + String(component !== null && component !== undefined));
      expect(component !== null && component !== undefined).assertTrue();
      const top = await abilityDelegator.getCurrentTopAbility();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSafeUiSmoke0008 top ability: ' + top.context.abilityInfo.name);
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSafeUiSmoke0008 end');
    })
  })
}
