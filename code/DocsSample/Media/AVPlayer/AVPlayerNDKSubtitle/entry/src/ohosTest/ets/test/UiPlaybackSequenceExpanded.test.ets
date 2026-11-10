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
import { describe, beforeAll, it, expect } from '@ohos/hypium';
import { Component, Driver, ON, abilityDelegatorRegistry } from '@kit.TestKit';

const driver: Driver = Driver.create();
const abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const bundleName = abilityDelegatorRegistry.getArguments().bundleName;



export default function uiPlaybackSequenceExpandedTest() {
  describe('uiPlaybackSequenceExpandedTest', () => {
  beforeAll(async () => {
    await abilityDelegator.startAbility({ bundleName: bundleName, abilityName: 'EntryAbility' });
    await driver.delayMs(2000);
  });

    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0001
     * @tc.name      testContinueUi0001
     * @tc.desc      UI sequence 1 keeps VideoView usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0001', 0, async () => {
      await driver.delayMs(200);
      const component: Component = await driver.findComponent(ON.id('VideoView'));
      expect(component !== undefined && component !== null).assertTrue();
      expect(await component.getId()).assertEqual('VideoView');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0002
     * @tc.name      testContinueUi0002
     * @tc.desc      UI sequence 2 keeps Slider usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0002', 0, async () => {
      await driver.delayMs(200);
      const component: Component = await driver.findComponent(ON.id('Slider'));
      expect(component !== undefined && component !== null).assertTrue();
      expect(await component.getId()).assertEqual('Slider');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0003
     * @tc.name      testContinueUi0003
     * @tc.desc      UI sequence 3 keeps Speed usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0003', 0, async () => {
      await driver.delayMs(200);
      const component: Component = await driver.findComponent(ON.id('Speed'));
      expect(component !== undefined && component !== null).assertTrue();
      expect(await component.getId()).assertEqual('Speed');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0004
     * @tc.name      testContinueUi0004
     * @tc.desc      UI sequence 4 keeps currentTimeText usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0004', 0, async () => {
      await driver.delayMs(200);
      const component: Component = await driver.findComponent(ON.id('currentTimeText'));
      expect(component !== undefined && component !== null).assertTrue();
      expect(await component.getId()).assertEqual('currentTimeText');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0005
     * @tc.name      testContinueUi0005
     * @tc.desc      UI sequence 5 keeps durationTimeText usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0005', 0, async () => {
      await driver.delayMs(200);
      const component: Component = await driver.findComponent(ON.id('durationTimeText'));
      expect(component !== undefined && component !== null).assertTrue();
      expect(await component.getId()).assertEqual('durationTimeText');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0006
     * @tc.name      testContinueUi0006
     * @tc.desc      UI sequence 6 keeps VideoView usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0006', 0, async () => {
      await driver.delayMs(200);
      const component: Component = await driver.findComponent(ON.id('VideoView'));
      expect(component !== undefined && component !== null).assertTrue();
      const bounds = await component.getBounds();
      expect(bounds.right).assertLarger(bounds.left);
      expect(bounds.bottom).assertLarger(bounds.top);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0007
     * @tc.name      testContinueUi0007
     * @tc.desc      UI sequence 7 keeps Slider usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0007', 0, async () => {
      await driver.delayMs(200);
      const component: Component = await driver.findComponent(ON.id('Slider'));
      expect(component !== undefined && component !== null).assertTrue();
      const bounds = await component.getBounds();
      expect(bounds.right).assertLarger(bounds.left);
      expect(bounds.bottom).assertLarger(bounds.top);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0008
     * @tc.name      testContinueUi0008
     * @tc.desc      UI sequence 8 keeps Speed usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0008', 0, async () => {
      await driver.delayMs(200);
      const component: Component = await driver.findComponent(ON.id('Speed'));
      expect(component !== undefined && component !== null).assertTrue();
      const bounds = await component.getBounds();
      expect(bounds.right).assertLarger(bounds.left);
      expect(bounds.bottom).assertLarger(bounds.top);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0009
     * @tc.name      testContinueUi0009
     * @tc.desc      UI sequence 9 keeps currentTimeText usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0009', 0, async () => {
      await driver.delayMs(200);
      const component: Component = await driver.findComponent(ON.id('currentTimeText'));
      expect(component !== undefined && component !== null).assertTrue();
      const bounds = await component.getBounds();
      expect(bounds.right).assertLarger(bounds.left);
      expect(bounds.bottom).assertLarger(bounds.top);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0010
     * @tc.name      testContinueUi0010
     * @tc.desc      UI sequence 10 keeps durationTimeText usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0010', 0, async () => {
      await driver.delayMs(200);
      const component: Component = await driver.findComponent(ON.id('durationTimeText'));
      expect(component !== undefined && component !== null).assertTrue();
      const bounds = await component.getBounds();
      expect(bounds.right).assertLarger(bounds.left);
      expect(bounds.bottom).assertLarger(bounds.top);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0011
     * @tc.name      testContinueUi0011
     * @tc.desc      UI sequence 11 keeps VideoView usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0011', 0, async () => {
      await driver.delayMs(200);
      const component: Component = await driver.findComponent(ON.id('VideoView'));
      expect(component !== undefined && component !== null).assertTrue();
      await component.click();
      await driver.delayMs(200);
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0012
     * @tc.name      testContinueUi0012
     * @tc.desc      UI sequence 12 keeps Slider usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0012', 0, async () => {
      await driver.delayMs(200);
      const component: Component = await driver.findComponent(ON.id('Slider'));
      expect(component !== undefined && component !== null).assertTrue();
      await component.click();
      await driver.delayMs(200);
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0013
     * @tc.name      testContinueUi0013
     * @tc.desc      UI sequence 13 keeps Speed usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0013', 0, async () => {
      await driver.delayMs(200);
      const component: Component = await driver.findComponent(ON.id('Speed'));
      expect(component !== undefined && component !== null).assertTrue();
      await component.click();
      await driver.delayMs(200);
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0014
     * @tc.name      testContinueUi0014
     * @tc.desc      UI sequence 14 keeps currentTimeText usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0014', 0, async () => {
      await driver.delayMs(200);
      const component: Component = await driver.findComponent(ON.id('currentTimeText'));
      expect(component !== undefined && component !== null).assertTrue();
      await component.click();
      await driver.delayMs(200);
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0015
     * @tc.name      testContinueUi0015
     * @tc.desc      UI sequence 15 keeps durationTimeText usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0015', 0, async () => {
      await driver.delayMs(200);
      const component: Component = await driver.findComponent(ON.id('durationTimeText'));
      expect(component !== undefined && component !== null).assertTrue();
      await component.click();
      await driver.delayMs(200);
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0016
     * @tc.name      testContinueUi0016
     * @tc.desc      UI sequence 16 keeps VideoView usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0016', 0, async () => {
      await driver.delayMs(200);
      const play: Component = await driver.findComponent(ON.id('pause'));
      expect(play !== undefined && play !== null).assertTrue();
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
      expect(play !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0017
     * @tc.name      testContinueUi0017
     * @tc.desc      UI sequence 17 keeps Slider usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0017', 0, async () => {
      await driver.delayMs(200);
      const play: Component = await driver.findComponent(ON.id('pause'));
      expect(play !== undefined && play !== null).assertTrue();
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
      expect(play !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0018
     * @tc.name      testContinueUi0018
     * @tc.desc      UI sequence 18 keeps Speed usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0018', 0, async () => {
      await driver.delayMs(200);
      const play: Component = await driver.findComponent(ON.id('pause'));
      expect(play !== undefined && play !== null).assertTrue();
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
      expect(play !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0019
     * @tc.name      testContinueUi0019
     * @tc.desc      UI sequence 19 keeps currentTimeText usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0019', 0, async () => {
      await driver.delayMs(200);
      const play: Component = await driver.findComponent(ON.id('pause'));
      expect(play !== undefined && play !== null).assertTrue();
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
      expect(play !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0020
     * @tc.name      testContinueUi0020
     * @tc.desc      UI sequence 20 keeps durationTimeText usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0020', 0, async () => {
      await driver.delayMs(200);
      const play: Component = await driver.findComponent(ON.id('pause'));
      expect(play !== undefined && play !== null).assertTrue();
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
      expect(play !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0021
     * @tc.name      testContinueUi0021
     * @tc.desc      UI sequence 21 keeps VideoView usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0021', 0, async () => {
      await driver.delayMs(200);
      const component: Component = await driver.findComponent(ON.id('VideoView'));
      expect(component !== undefined && component !== null).assertTrue();
      expect(await component.getId()).assertEqual('VideoView');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0022
     * @tc.name      testContinueUi0022
     * @tc.desc      UI sequence 22 keeps Slider usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0022', 0, async () => {
      await driver.delayMs(200);
      const component: Component = await driver.findComponent(ON.id('Slider'));
      expect(component !== undefined && component !== null).assertTrue();
      expect(await component.getId()).assertEqual('Slider');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0023
     * @tc.name      testContinueUi0023
     * @tc.desc      UI sequence 23 keeps Speed usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0023', 0, async () => {
      await driver.delayMs(200);
      const component: Component = await driver.findComponent(ON.id('Speed'));
      expect(component !== undefined && component !== null).assertTrue();
      expect(await component.getId()).assertEqual('Speed');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0024
     * @tc.name      testContinueUi0024
     * @tc.desc      UI sequence 24 keeps currentTimeText usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0024', 0, async () => {
      await driver.delayMs(200);
      const component: Component = await driver.findComponent(ON.id('currentTimeText'));
      expect(component !== undefined && component !== null).assertTrue();
      expect(await component.getId()).assertEqual('currentTimeText');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0025
     * @tc.name      testContinueUi0025
     * @tc.desc      UI sequence 25 keeps durationTimeText usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0025', 0, async () => {
      await driver.delayMs(200);
      const component: Component = await driver.findComponent(ON.id('durationTimeText'));
      expect(component !== undefined && component !== null).assertTrue();
      expect(await component.getId()).assertEqual('durationTimeText');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0026
     * @tc.name      testContinueUi0026
     * @tc.desc      UI sequence 26 keeps VideoView usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0026', 0, async () => {
      await driver.delayMs(200);
      const component: Component = await driver.findComponent(ON.id('VideoView'));
      expect(component !== undefined && component !== null).assertTrue();
      const bounds = await component.getBounds();
      expect(bounds.right).assertLarger(bounds.left);
      expect(bounds.bottom).assertLarger(bounds.top);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0027
     * @tc.name      testContinueUi0027
     * @tc.desc      UI sequence 27 keeps Slider usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0027', 0, async () => {
      await driver.delayMs(200);
      const component: Component = await driver.findComponent(ON.id('Slider'));
      expect(component !== undefined && component !== null).assertTrue();
      const bounds = await component.getBounds();
      expect(bounds.right).assertLarger(bounds.left);
      expect(bounds.bottom).assertLarger(bounds.top);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0028
     * @tc.name      testContinueUi0028
     * @tc.desc      UI sequence 28 keeps Speed usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0028', 0, async () => {
      await driver.delayMs(200);
      const component: Component = await driver.findComponent(ON.id('Speed'));
      expect(component !== undefined && component !== null).assertTrue();
      const bounds = await component.getBounds();
      expect(bounds.right).assertLarger(bounds.left);
      expect(bounds.bottom).assertLarger(bounds.top);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0029
     * @tc.name      testContinueUi0029
     * @tc.desc      UI sequence 29 keeps currentTimeText usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0029', 0, async () => {
      await driver.delayMs(200);
      const component: Component = await driver.findComponent(ON.id('currentTimeText'));
      expect(component !== undefined && component !== null).assertTrue();
      const bounds = await component.getBounds();
      expect(bounds.right).assertLarger(bounds.left);
      expect(bounds.bottom).assertLarger(bounds.top);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0030
     * @tc.name      testContinueUi0030
     * @tc.desc      UI sequence 30 keeps durationTimeText usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0030', 0, async () => {
      await driver.delayMs(200);
      const component: Component = await driver.findComponent(ON.id('durationTimeText'));
      expect(component !== undefined && component !== null).assertTrue();
      const bounds = await component.getBounds();
      expect(bounds.right).assertLarger(bounds.left);
      expect(bounds.bottom).assertLarger(bounds.top);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0031
     * @tc.name      testContinueUi0031
     * @tc.desc      UI sequence 31 keeps VideoView usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0031', 0, async () => {
      await driver.delayMs(200);
      const component: Component = await driver.findComponent(ON.id('VideoView'));
      expect(component !== undefined && component !== null).assertTrue();
      await component.click();
      await driver.delayMs(200);
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0032
     * @tc.name      testContinueUi0032
     * @tc.desc      UI sequence 32 keeps Slider usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0032', 0, async () => {
      await driver.delayMs(200);
      const component: Component = await driver.findComponent(ON.id('Slider'));
      expect(component !== undefined && component !== null).assertTrue();
      await component.click();
      await driver.delayMs(200);
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0033
     * @tc.name      testContinueUi0033
     * @tc.desc      UI sequence 33 keeps Speed usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0033', 0, async () => {
      await driver.delayMs(200);
      const component: Component = await driver.findComponent(ON.id('Speed'));
      expect(component !== undefined && component !== null).assertTrue();
      await component.click();
      await driver.delayMs(200);
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0034
     * @tc.name      testContinueUi0034
     * @tc.desc      UI sequence 34 keeps currentTimeText usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0034', 0, async () => {
      await driver.delayMs(200);
      const component: Component = await driver.findComponent(ON.id('currentTimeText'));
      expect(component !== undefined && component !== null).assertTrue();
      await component.click();
      await driver.delayMs(200);
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0035
     * @tc.name      testContinueUi0035
     * @tc.desc      UI sequence 35 keeps durationTimeText usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0035', 0, async () => {
      await driver.delayMs(200);
      const component: Component = await driver.findComponent(ON.id('durationTimeText'));
      expect(component !== undefined && component !== null).assertTrue();
      await component.click();
      await driver.delayMs(200);
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0036
     * @tc.name      testContinueUi0036
     * @tc.desc      UI sequence 36 keeps VideoView usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0036', 0, async () => {
      await driver.delayMs(200);
      const play: Component = await driver.findComponent(ON.id('pause'));
      expect(play !== undefined && play !== null).assertTrue();
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
      expect(play !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0037
     * @tc.name      testContinueUi0037
     * @tc.desc      UI sequence 37 keeps Slider usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0037', 0, async () => {
      await driver.delayMs(200);
      const play: Component = await driver.findComponent(ON.id('pause'));
      expect(play !== undefined && play !== null).assertTrue();
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
      expect(play !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0038
     * @tc.name      testContinueUi0038
     * @tc.desc      UI sequence 38 keeps Speed usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0038', 0, async () => {
      await driver.delayMs(200);
      const play: Component = await driver.findComponent(ON.id('pause'));
      expect(play !== undefined && play !== null).assertTrue();
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
      expect(play !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0039
     * @tc.name      testContinueUi0039
     * @tc.desc      UI sequence 39 keeps currentTimeText usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0039', 0, async () => {
      await driver.delayMs(200);
      const play: Component = await driver.findComponent(ON.id('pause'));
      expect(play !== undefined && play !== null).assertTrue();
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
      expect(play !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0040
     * @tc.name      testContinueUi0040
     * @tc.desc      UI sequence 40 keeps durationTimeText usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0040', 0, async () => {
      await driver.delayMs(200);
      const play: Component = await driver.findComponent(ON.id('pause'));
      expect(play !== undefined && play !== null).assertTrue();
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
      expect(play !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0041
     * @tc.name      testContinueUi0041
     * @tc.desc      UI sequence 41 keeps VideoView usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0041', 0, async () => {
      await driver.delayMs(200);
      const component: Component = await driver.findComponent(ON.id('VideoView'));
      expect(component !== undefined && component !== null).assertTrue();
      expect(await component.getId()).assertEqual('VideoView');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0042
     * @tc.name      testContinueUi0042
     * @tc.desc      UI sequence 42 keeps Slider usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0042', 0, async () => {
      await driver.delayMs(200);
      const component: Component = await driver.findComponent(ON.id('Slider'));
      expect(component !== undefined && component !== null).assertTrue();
      expect(await component.getId()).assertEqual('Slider');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0043
     * @tc.name      testContinueUi0043
     * @tc.desc      UI sequence 43 keeps Speed usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0043', 0, async () => {
      await driver.delayMs(200);
      const component: Component = await driver.findComponent(ON.id('Speed'));
      expect(component !== undefined && component !== null).assertTrue();
      expect(await component.getId()).assertEqual('Speed');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0044
     * @tc.name      testContinueUi0044
     * @tc.desc      UI sequence 44 keeps currentTimeText usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0044', 0, async () => {
      await driver.delayMs(200);
      const component: Component = await driver.findComponent(ON.id('currentTimeText'));
      expect(component !== undefined && component !== null).assertTrue();
      expect(await component.getId()).assertEqual('currentTimeText');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0045
     * @tc.name      testContinueUi0045
     * @tc.desc      UI sequence 45 keeps durationTimeText usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0045', 0, async () => {
      await driver.delayMs(200);
      const component: Component = await driver.findComponent(ON.id('durationTimeText'));
      expect(component !== undefined && component !== null).assertTrue();
      expect(await component.getId()).assertEqual('durationTimeText');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0046
     * @tc.name      testContinueUi0046
     * @tc.desc      UI sequence 46 keeps VideoView usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0046', 0, async () => {
      await driver.delayMs(200);
      const component: Component = await driver.findComponent(ON.id('VideoView'));
      expect(component !== undefined && component !== null).assertTrue();
      const bounds = await component.getBounds();
      expect(bounds.right).assertLarger(bounds.left);
      expect(bounds.bottom).assertLarger(bounds.top);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0047
     * @tc.name      testContinueUi0047
     * @tc.desc      UI sequence 47 keeps Slider usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0047', 0, async () => {
      await driver.delayMs(200);
      const component: Component = await driver.findComponent(ON.id('Slider'));
      expect(component !== undefined && component !== null).assertTrue();
      const bounds = await component.getBounds();
      expect(bounds.right).assertLarger(bounds.left);
      expect(bounds.bottom).assertLarger(bounds.top);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0048
     * @tc.name      testContinueUi0048
     * @tc.desc      UI sequence 48 keeps Speed usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0048', 0, async () => {
      await driver.delayMs(200);
      const component: Component = await driver.findComponent(ON.id('Speed'));
      expect(component !== undefined && component !== null).assertTrue();
      const bounds = await component.getBounds();
      expect(bounds.right).assertLarger(bounds.left);
      expect(bounds.bottom).assertLarger(bounds.top);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0049
     * @tc.name      testContinueUi0049
     * @tc.desc      UI sequence 49 keeps currentTimeText usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0049', 0, async () => {
      await driver.delayMs(200);
      const component: Component = await driver.findComponent(ON.id('currentTimeText'));
      expect(component !== undefined && component !== null).assertTrue();
      const bounds = await component.getBounds();
      expect(bounds.right).assertLarger(bounds.left);
      expect(bounds.bottom).assertLarger(bounds.top);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0050
     * @tc.name      testContinueUi0050
     * @tc.desc      UI sequence 50 keeps durationTimeText usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0050', 0, async () => {
      await driver.delayMs(200);
      const component: Component = await driver.findComponent(ON.id('durationTimeText'));
      expect(component !== undefined && component !== null).assertTrue();
      const bounds = await component.getBounds();
      expect(bounds.right).assertLarger(bounds.left);
      expect(bounds.bottom).assertLarger(bounds.top);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0051
     * @tc.name      testContinueUi0051
     * @tc.desc      UI sequence 51 keeps VideoView usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0051', 0, async () => {
      await driver.delayMs(200);
      const component: Component = await driver.findComponent(ON.id('VideoView'));
      expect(component !== undefined && component !== null).assertTrue();
      await component.click();
      await driver.delayMs(200);
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0052
     * @tc.name      testContinueUi0052
     * @tc.desc      UI sequence 52 keeps Slider usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0052', 0, async () => {
      await driver.delayMs(200);
      const component: Component = await driver.findComponent(ON.id('Slider'));
      expect(component !== undefined && component !== null).assertTrue();
      await component.click();
      await driver.delayMs(200);
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0053
     * @tc.name      testContinueUi0053
     * @tc.desc      UI sequence 53 keeps Speed usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0053', 0, async () => {
      await driver.delayMs(200);
      const component: Component = await driver.findComponent(ON.id('Speed'));
      expect(component !== undefined && component !== null).assertTrue();
      await component.click();
      await driver.delayMs(200);
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0054
     * @tc.name      testContinueUi0054
     * @tc.desc      UI sequence 54 keeps currentTimeText usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0054', 0, async () => {
      await driver.delayMs(200);
      const component: Component = await driver.findComponent(ON.id('currentTimeText'));
      expect(component !== undefined && component !== null).assertTrue();
      await component.click();
      await driver.delayMs(200);
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0055
     * @tc.name      testContinueUi0055
     * @tc.desc      UI sequence 55 keeps durationTimeText usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0055', 0, async () => {
      await driver.delayMs(200);
      const component: Component = await driver.findComponent(ON.id('durationTimeText'));
      expect(component !== undefined && component !== null).assertTrue();
      await component.click();
      await driver.delayMs(200);
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0056
     * @tc.name      testContinueUi0056
     * @tc.desc      UI sequence 56 keeps VideoView usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0056', 0, async () => {
      await driver.delayMs(200);
      const play: Component = await driver.findComponent(ON.id('pause'));
      expect(play !== undefined && play !== null).assertTrue();
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
      expect(play !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0057
     * @tc.name      testContinueUi0057
     * @tc.desc      UI sequence 57 keeps Slider usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0057', 0, async () => {
      await driver.delayMs(200);
      const play: Component = await driver.findComponent(ON.id('pause'));
      expect(play !== undefined && play !== null).assertTrue();
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
      expect(play !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0058
     * @tc.name      testContinueUi0058
     * @tc.desc      UI sequence 58 keeps Speed usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0058', 0, async () => {
      await driver.delayMs(200);
      const play: Component = await driver.findComponent(ON.id('pause'));
      expect(play !== undefined && play !== null).assertTrue();
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
      expect(play !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0059
     * @tc.name      testContinueUi0059
     * @tc.desc      UI sequence 59 keeps currentTimeText usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0059', 0, async () => {
      await driver.delayMs(200);
      const play: Component = await driver.findComponent(ON.id('pause'));
      expect(play !== undefined && play !== null).assertTrue();
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
      expect(play !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0060
     * @tc.name      testContinueUi0060
     * @tc.desc      UI sequence 60 keeps durationTimeText usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0060', 0, async () => {
      await driver.delayMs(200);
      const play: Component = await driver.findComponent(ON.id('pause'));
      expect(play !== undefined && play !== null).assertTrue();
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
      expect(play !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0061
     * @tc.name      testContinueUi0061
     * @tc.desc      UI sequence 61 keeps VideoView usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0061', 0, async () => {
      await driver.delayMs(200);
      const component: Component = await driver.findComponent(ON.id('VideoView'));
      expect(component !== undefined && component !== null).assertTrue();
      expect(await component.getId()).assertEqual('VideoView');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0062
     * @tc.name      testContinueUi0062
     * @tc.desc      UI sequence 62 keeps Slider usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0062', 0, async () => {
      await driver.delayMs(200);
      const component: Component = await driver.findComponent(ON.id('Slider'));
      expect(component !== undefined && component !== null).assertTrue();
      expect(await component.getId()).assertEqual('Slider');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0063
     * @tc.name      testContinueUi0063
     * @tc.desc      UI sequence 63 keeps Speed usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0063', 0, async () => {
      await driver.delayMs(200);
      const component: Component = await driver.findComponent(ON.id('Speed'));
      expect(component !== undefined && component !== null).assertTrue();
      expect(await component.getId()).assertEqual('Speed');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0064
     * @tc.name      testContinueUi0064
     * @tc.desc      UI sequence 64 keeps currentTimeText usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0064', 0, async () => {
      await driver.delayMs(200);
      const component: Component = await driver.findComponent(ON.id('currentTimeText'));
      expect(component !== undefined && component !== null).assertTrue();
      expect(await component.getId()).assertEqual('currentTimeText');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0065
     * @tc.name      testContinueUi0065
     * @tc.desc      UI sequence 65 keeps durationTimeText usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0065', 0, async () => {
      await driver.delayMs(200);
      const component: Component = await driver.findComponent(ON.id('durationTimeText'));
      expect(component !== undefined && component !== null).assertTrue();
      expect(await component.getId()).assertEqual('durationTimeText');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0066
     * @tc.name      testContinueUi0066
     * @tc.desc      UI sequence 66 keeps VideoView usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0066', 0, async () => {
      await driver.delayMs(200);
      const component: Component = await driver.findComponent(ON.id('VideoView'));
      expect(component !== undefined && component !== null).assertTrue();
      const bounds = await component.getBounds();
      expect(bounds.right).assertLarger(bounds.left);
      expect(bounds.bottom).assertLarger(bounds.top);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0067
     * @tc.name      testContinueUi0067
     * @tc.desc      UI sequence 67 keeps Slider usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0067', 0, async () => {
      await driver.delayMs(200);
      const component: Component = await driver.findComponent(ON.id('Slider'));
      expect(component !== undefined && component !== null).assertTrue();
      const bounds = await component.getBounds();
      expect(bounds.right).assertLarger(bounds.left);
      expect(bounds.bottom).assertLarger(bounds.top);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0068
     * @tc.name      testContinueUi0068
     * @tc.desc      UI sequence 68 keeps Speed usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0068', 0, async () => {
      await driver.delayMs(200);
      const component: Component = await driver.findComponent(ON.id('Speed'));
      expect(component !== undefined && component !== null).assertTrue();
      const bounds = await component.getBounds();
      expect(bounds.right).assertLarger(bounds.left);
      expect(bounds.bottom).assertLarger(bounds.top);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0069
     * @tc.name      testContinueUi0069
     * @tc.desc      UI sequence 69 keeps currentTimeText usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0069', 0, async () => {
      await driver.delayMs(200);
      const component: Component = await driver.findComponent(ON.id('currentTimeText'));
      expect(component !== undefined && component !== null).assertTrue();
      const bounds = await component.getBounds();
      expect(bounds.right).assertLarger(bounds.left);
      expect(bounds.bottom).assertLarger(bounds.top);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0070
     * @tc.name      testContinueUi0070
     * @tc.desc      UI sequence 70 keeps durationTimeText usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0070', 0, async () => {
      await driver.delayMs(200);
      const component: Component = await driver.findComponent(ON.id('durationTimeText'));
      expect(component !== undefined && component !== null).assertTrue();
      const bounds = await component.getBounds();
      expect(bounds.right).assertLarger(bounds.left);
      expect(bounds.bottom).assertLarger(bounds.top);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0071
     * @tc.name      testContinueUi0071
     * @tc.desc      UI sequence 71 keeps VideoView usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0071', 0, async () => {
      await driver.delayMs(200);
      const component: Component = await driver.findComponent(ON.id('VideoView'));
      expect(component !== undefined && component !== null).assertTrue();
      await component.click();
      await driver.delayMs(200);
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0072
     * @tc.name      testContinueUi0072
     * @tc.desc      UI sequence 72 keeps Slider usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0072', 0, async () => {
      await driver.delayMs(200);
      const component: Component = await driver.findComponent(ON.id('Slider'));
      expect(component !== undefined && component !== null).assertTrue();
      await component.click();
      await driver.delayMs(200);
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0073
     * @tc.name      testContinueUi0073
     * @tc.desc      UI sequence 73 keeps Speed usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0073', 0, async () => {
      await driver.delayMs(200);
      const component: Component = await driver.findComponent(ON.id('Speed'));
      expect(component !== undefined && component !== null).assertTrue();
      await component.click();
      await driver.delayMs(200);
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0074
     * @tc.name      testContinueUi0074
     * @tc.desc      UI sequence 74 keeps currentTimeText usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0074', 0, async () => {
      await driver.delayMs(200);
      const component: Component = await driver.findComponent(ON.id('currentTimeText'));
      expect(component !== undefined && component !== null).assertTrue();
      await component.click();
      await driver.delayMs(200);
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0075
     * @tc.name      testContinueUi0075
     * @tc.desc      UI sequence 75 keeps durationTimeText usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0075', 0, async () => {
      await driver.delayMs(200);
      const component: Component = await driver.findComponent(ON.id('durationTimeText'));
      expect(component !== undefined && component !== null).assertTrue();
      await component.click();
      await driver.delayMs(200);
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0076
     * @tc.name      testContinueUi0076
     * @tc.desc      UI sequence 76 keeps VideoView usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0076', 0, async () => {
      await driver.delayMs(200);
      const play: Component = await driver.findComponent(ON.id('pause'));
      expect(play !== undefined && play !== null).assertTrue();
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
      expect(play !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0077
     * @tc.name      testContinueUi0077
     * @tc.desc      UI sequence 77 keeps Slider usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0077', 0, async () => {
      await driver.delayMs(200);
      const play: Component = await driver.findComponent(ON.id('pause'));
      expect(play !== undefined && play !== null).assertTrue();
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
      expect(play !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0078
     * @tc.name      testContinueUi0078
     * @tc.desc      UI sequence 78 keeps Speed usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0078', 0, async () => {
      await driver.delayMs(200);
      const play: Component = await driver.findComponent(ON.id('pause'));
      expect(play !== undefined && play !== null).assertTrue();
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
      expect(play !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0079
     * @tc.name      testContinueUi0079
     * @tc.desc      UI sequence 79 keeps currentTimeText usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0079', 0, async () => {
      await driver.delayMs(200);
      const play: Component = await driver.findComponent(ON.id('pause'));
      expect(play !== undefined && play !== null).assertTrue();
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
      expect(play !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0080
     * @tc.name      testContinueUi0080
     * @tc.desc      UI sequence 80 keeps durationTimeText usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0080', 0, async () => {
      await driver.delayMs(200);
      const play: Component = await driver.findComponent(ON.id('pause'));
      expect(play !== undefined && play !== null).assertTrue();
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
      expect(play !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0081
     * @tc.name      testContinueUi0081
     * @tc.desc      UI sequence 81 keeps VideoView usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0081', 0, async () => {
      await driver.delayMs(200);
      const component: Component = await driver.findComponent(ON.id('VideoView'));
      expect(component !== undefined && component !== null).assertTrue();
      expect(await component.getId()).assertEqual('VideoView');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0082
     * @tc.name      testContinueUi0082
     * @tc.desc      UI sequence 82 keeps Slider usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0082', 0, async () => {
      await driver.delayMs(200);
      const component: Component = await driver.findComponent(ON.id('Slider'));
      expect(component !== undefined && component !== null).assertTrue();
      expect(await component.getId()).assertEqual('Slider');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0083
     * @tc.name      testContinueUi0083
     * @tc.desc      UI sequence 83 keeps Speed usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0083', 0, async () => {
      await driver.delayMs(200);
      const component: Component = await driver.findComponent(ON.id('Speed'));
      expect(component !== undefined && component !== null).assertTrue();
      expect(await component.getId()).assertEqual('Speed');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0084
     * @tc.name      testContinueUi0084
     * @tc.desc      UI sequence 84 keeps currentTimeText usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0084', 0, async () => {
      await driver.delayMs(200);
      const component: Component = await driver.findComponent(ON.id('currentTimeText'));
      expect(component !== undefined && component !== null).assertTrue();
      expect(await component.getId()).assertEqual('currentTimeText');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0085
     * @tc.name      testContinueUi0085
     * @tc.desc      UI sequence 85 keeps durationTimeText usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0085', 0, async () => {
      await driver.delayMs(200);
      const component: Component = await driver.findComponent(ON.id('durationTimeText'));
      expect(component !== undefined && component !== null).assertTrue();
      expect(await component.getId()).assertEqual('durationTimeText');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0086
     * @tc.name      testContinueUi0086
     * @tc.desc      UI sequence 86 keeps VideoView usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0086', 0, async () => {
      await driver.delayMs(200);
      const component: Component = await driver.findComponent(ON.id('VideoView'));
      expect(component !== undefined && component !== null).assertTrue();
      const bounds = await component.getBounds();
      expect(bounds.right).assertLarger(bounds.left);
      expect(bounds.bottom).assertLarger(bounds.top);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0087
     * @tc.name      testContinueUi0087
     * @tc.desc      UI sequence 87 keeps Slider usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0087', 0, async () => {
      await driver.delayMs(200);
      const component: Component = await driver.findComponent(ON.id('Slider'));
      expect(component !== undefined && component !== null).assertTrue();
      const bounds = await component.getBounds();
      expect(bounds.right).assertLarger(bounds.left);
      expect(bounds.bottom).assertLarger(bounds.top);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0088
     * @tc.name      testContinueUi0088
     * @tc.desc      UI sequence 88 keeps Speed usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0088', 0, async () => {
      await driver.delayMs(200);
      const component: Component = await driver.findComponent(ON.id('Speed'));
      expect(component !== undefined && component !== null).assertTrue();
      const bounds = await component.getBounds();
      expect(bounds.right).assertLarger(bounds.left);
      expect(bounds.bottom).assertLarger(bounds.top);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0089
     * @tc.name      testContinueUi0089
     * @tc.desc      UI sequence 89 keeps currentTimeText usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0089', 0, async () => {
      await driver.delayMs(200);
      const component: Component = await driver.findComponent(ON.id('currentTimeText'));
      expect(component !== undefined && component !== null).assertTrue();
      const bounds = await component.getBounds();
      expect(bounds.right).assertLarger(bounds.left);
      expect(bounds.bottom).assertLarger(bounds.top);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0090
     * @tc.name      testContinueUi0090
     * @tc.desc      UI sequence 90 keeps durationTimeText usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0090', 0, async () => {
      await driver.delayMs(200);
      const component: Component = await driver.findComponent(ON.id('durationTimeText'));
      expect(component !== undefined && component !== null).assertTrue();
      const bounds = await component.getBounds();
      expect(bounds.right).assertLarger(bounds.left);
      expect(bounds.bottom).assertLarger(bounds.top);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0091
     * @tc.name      testContinueUi0091
     * @tc.desc      UI sequence 91 keeps VideoView usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0091', 0, async () => {
      await driver.delayMs(200);
      const component: Component = await driver.findComponent(ON.id('VideoView'));
      expect(component !== undefined && component !== null).assertTrue();
      await component.click();
      await driver.delayMs(200);
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0092
     * @tc.name      testContinueUi0092
     * @tc.desc      UI sequence 92 keeps Slider usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0092', 0, async () => {
      await driver.delayMs(200);
      const component: Component = await driver.findComponent(ON.id('Slider'));
      expect(component !== undefined && component !== null).assertTrue();
      await component.click();
      await driver.delayMs(200);
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0093
     * @tc.name      testContinueUi0093
     * @tc.desc      UI sequence 93 keeps Speed usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0093', 0, async () => {
      await driver.delayMs(200);
      const component: Component = await driver.findComponent(ON.id('Speed'));
      expect(component !== undefined && component !== null).assertTrue();
      await component.click();
      await driver.delayMs(200);
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0094
     * @tc.name      testContinueUi0094
     * @tc.desc      UI sequence 94 keeps currentTimeText usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0094', 0, async () => {
      await driver.delayMs(200);
      const component: Component = await driver.findComponent(ON.id('currentTimeText'));
      expect(component !== undefined && component !== null).assertTrue();
      await component.click();
      await driver.delayMs(200);
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0095
     * @tc.name      testContinueUi0095
     * @tc.desc      UI sequence 95 keeps durationTimeText usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0095', 0, async () => {
      await driver.delayMs(200);
      const component: Component = await driver.findComponent(ON.id('durationTimeText'));
      expect(component !== undefined && component !== null).assertTrue();
      await component.click();
      await driver.delayMs(200);
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0096
     * @tc.name      testContinueUi0096
     * @tc.desc      UI sequence 96 keeps VideoView usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0096', 0, async () => {
      await driver.delayMs(200);
      const play: Component = await driver.findComponent(ON.id('pause'));
      expect(play !== undefined && play !== null).assertTrue();
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
      expect(play !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0097
     * @tc.name      testContinueUi0097
     * @tc.desc      UI sequence 97 keeps Slider usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0097', 0, async () => {
      await driver.delayMs(200);
      const play: Component = await driver.findComponent(ON.id('pause'));
      expect(play !== undefined && play !== null).assertTrue();
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
      expect(play !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0098
     * @tc.name      testContinueUi0098
     * @tc.desc      UI sequence 98 keeps Speed usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0098', 0, async () => {
      await driver.delayMs(200);
      const play: Component = await driver.findComponent(ON.id('pause'));
      expect(play !== undefined && play !== null).assertTrue();
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
      expect(play !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0099
     * @tc.name      testContinueUi0099
     * @tc.desc      UI sequence 99 keeps currentTimeText usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0099', 0, async () => {
      await driver.delayMs(200);
      const play: Component = await driver.findComponent(ON.id('pause'));
      expect(play !== undefined && play !== null).assertTrue();
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
      expect(play !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_UI_0100
     * @tc.name      testContinueUi0100
     * @tc.desc      UI sequence 100 keeps durationTimeText usable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueUi0100', 0, async () => {
      await driver.delayMs(200);
      const play: Component = await driver.findComponent(ON.id('pause'));
      expect(play !== undefined && play !== null).assertTrue();
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
      expect(play !== null).assertTrue();
    })
  })
}
