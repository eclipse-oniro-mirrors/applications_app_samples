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
import { Component, DisplayRotation, Driver, ON, abilityDelegatorRegistry } from '@kit.TestKit';

const driver: Driver = Driver.create();
const abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const bundleName = abilityDelegatorRegistry.getArguments().bundleName;



export default function uiRotationBehaviorTest() {
  describe('uiRotationBehaviorTest', () => {
  beforeAll(async () => {
    await abilityDelegator.startAbility({ bundleName: bundleName, abilityName: 'EntryAbility' });
    await driver.delayMs(2000);
  });

    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_FINAL_ROT_0001
     * @tc.name      testFinalRotation0001
     * @tc.desc      Playback controls survive display rotation 1 case 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFinalRotation0001', 0, async () => {
      await driver.delayMs(200);
      await driver.setDisplayRotation(DisplayRotation.ROTATION_90);
      await driver.delayMs(400);
      const actual: DisplayRotation = await driver.getDisplayRotation();
      expect(actual).assertEqual(DisplayRotation.ROTATION_90);
      await driver.assertComponentExist(ON.id('Slider'));
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
      await driver.setDisplayRotation(DisplayRotation.ROTATION_0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_FINAL_ROT_0002
     * @tc.name      testFinalRotation0002
     * @tc.desc      Playback controls survive display rotation 1 case 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFinalRotation0002', 0, async () => {
      await driver.delayMs(200);
      await driver.setDisplayRotation(DisplayRotation.ROTATION_90);
      await driver.delayMs(400);
      const actual: DisplayRotation = await driver.getDisplayRotation();
      expect(actual).assertEqual(DisplayRotation.ROTATION_90);
      await driver.assertComponentExist(ON.id('Slider'));
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
      await driver.setDisplayRotation(DisplayRotation.ROTATION_0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_FINAL_ROT_0003
     * @tc.name      testFinalRotation0003
     * @tc.desc      Playback controls survive display rotation 3 case 3.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFinalRotation0003', 0, async () => {
      await driver.delayMs(200);
      await driver.setDisplayRotation(DisplayRotation.ROTATION_270);
      await driver.delayMs(400);
      const actual: DisplayRotation = await driver.getDisplayRotation();
      expect(actual).assertEqual(DisplayRotation.ROTATION_270);
      await driver.assertComponentExist(ON.id('Slider'));
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
      await driver.setDisplayRotation(DisplayRotation.ROTATION_0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_FINAL_ROT_0004
     * @tc.name      testFinalRotation0004
     * @tc.desc      Playback controls survive display rotation 3 case 4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFinalRotation0004', 0, async () => {
      await driver.delayMs(200);
      await driver.setDisplayRotation(DisplayRotation.ROTATION_270);
      await driver.delayMs(400);
      const actual: DisplayRotation = await driver.getDisplayRotation();
      expect(actual).assertEqual(DisplayRotation.ROTATION_270);
      await driver.assertComponentExist(ON.id('Slider'));
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
      await driver.setDisplayRotation(DisplayRotation.ROTATION_0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_FINAL_ROT_0005
     * @tc.name      testFinalRotation0005
     * @tc.desc      Playback controls survive display rotation 1 case 5.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFinalRotation0005', 0, async () => {
      await driver.delayMs(200);
      await driver.setDisplayRotation(DisplayRotation.ROTATION_90);
      await driver.delayMs(400);
      const actual: DisplayRotation = await driver.getDisplayRotation();
      expect(actual).assertEqual(DisplayRotation.ROTATION_90);
      await driver.assertComponentExist(ON.id('Slider'));
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
      await driver.setDisplayRotation(DisplayRotation.ROTATION_0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_FINAL_ROT_0006
     * @tc.name      testFinalRotation0006
     * @tc.desc      Playback controls survive display rotation 1 case 6.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFinalRotation0006', 0, async () => {
      await driver.delayMs(200);
      await driver.setDisplayRotation(DisplayRotation.ROTATION_90);
      await driver.delayMs(400);
      const actual: DisplayRotation = await driver.getDisplayRotation();
      expect(actual).assertEqual(DisplayRotation.ROTATION_90);
      await driver.assertComponentExist(ON.id('Slider'));
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
      await driver.setDisplayRotation(DisplayRotation.ROTATION_0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_FINAL_ROT_0007
     * @tc.name      testFinalRotation0007
     * @tc.desc      Playback controls survive display rotation 3 case 7.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFinalRotation0007', 0, async () => {
      await driver.delayMs(200);
      await driver.setDisplayRotation(DisplayRotation.ROTATION_270);
      await driver.delayMs(400);
      const actual: DisplayRotation = await driver.getDisplayRotation();
      expect(actual).assertEqual(DisplayRotation.ROTATION_270);
      await driver.assertComponentExist(ON.id('Slider'));
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
      await driver.setDisplayRotation(DisplayRotation.ROTATION_0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_FINAL_ROT_0008
     * @tc.name      testFinalRotation0008
     * @tc.desc      Playback controls survive display rotation 3 case 8.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFinalRotation0008', 0, async () => {
      await driver.delayMs(200);
      await driver.setDisplayRotation(DisplayRotation.ROTATION_270);
      await driver.delayMs(400);
      const actual: DisplayRotation = await driver.getDisplayRotation();
      expect(actual).assertEqual(DisplayRotation.ROTATION_270);
      await driver.assertComponentExist(ON.id('Slider'));
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
      await driver.setDisplayRotation(DisplayRotation.ROTATION_0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_FINAL_ROT_0009
     * @tc.name      testFinalRotation0009
     * @tc.desc      Playback controls survive display rotation 1 case 9.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFinalRotation0009', 0, async () => {
      await driver.delayMs(200);
      await driver.setDisplayRotation(DisplayRotation.ROTATION_90);
      await driver.delayMs(400);
      const actual: DisplayRotation = await driver.getDisplayRotation();
      expect(actual).assertEqual(DisplayRotation.ROTATION_90);
      await driver.assertComponentExist(ON.id('Slider'));
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
      await driver.setDisplayRotation(DisplayRotation.ROTATION_0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_FINAL_ROT_0010
     * @tc.name      testFinalRotation0010
     * @tc.desc      Playback controls survive display rotation 1 case 10.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFinalRotation0010', 0, async () => {
      await driver.delayMs(200);
      await driver.setDisplayRotation(DisplayRotation.ROTATION_90);
      await driver.delayMs(400);
      const actual: DisplayRotation = await driver.getDisplayRotation();
      expect(actual).assertEqual(DisplayRotation.ROTATION_90);
      await driver.assertComponentExist(ON.id('Slider'));
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
      await driver.setDisplayRotation(DisplayRotation.ROTATION_0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_FINAL_ROT_0011
     * @tc.name      testFinalRotation0011
     * @tc.desc      Playback controls survive display rotation 3 case 11.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFinalRotation0011', 0, async () => {
      await driver.delayMs(200);
      await driver.setDisplayRotation(DisplayRotation.ROTATION_270);
      await driver.delayMs(400);
      const actual: DisplayRotation = await driver.getDisplayRotation();
      expect(actual).assertEqual(DisplayRotation.ROTATION_270);
      await driver.assertComponentExist(ON.id('Slider'));
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
      await driver.setDisplayRotation(DisplayRotation.ROTATION_0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_FINAL_ROT_0012
     * @tc.name      testFinalRotation0012
     * @tc.desc      Playback controls survive display rotation 3 case 12.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFinalRotation0012', 0, async () => {
      await driver.delayMs(200);
      await driver.setDisplayRotation(DisplayRotation.ROTATION_270);
      await driver.delayMs(400);
      const actual: DisplayRotation = await driver.getDisplayRotation();
      expect(actual).assertEqual(DisplayRotation.ROTATION_270);
      await driver.assertComponentExist(ON.id('Slider'));
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
      await driver.setDisplayRotation(DisplayRotation.ROTATION_0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_FINAL_ROT_0013
     * @tc.name      testFinalRotation0013
     * @tc.desc      Playback controls survive display rotation 1 case 13.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFinalRotation0013', 0, async () => {
      await driver.delayMs(200);
      await driver.setDisplayRotation(DisplayRotation.ROTATION_90);
      await driver.delayMs(400);
      const actual: DisplayRotation = await driver.getDisplayRotation();
      expect(actual).assertEqual(DisplayRotation.ROTATION_90);
      await driver.assertComponentExist(ON.id('Slider'));
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
      await driver.setDisplayRotation(DisplayRotation.ROTATION_0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_FINAL_ROT_0014
     * @tc.name      testFinalRotation0014
     * @tc.desc      Playback controls survive display rotation 1 case 14.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFinalRotation0014', 0, async () => {
      await driver.delayMs(200);
      await driver.setDisplayRotation(DisplayRotation.ROTATION_90);
      await driver.delayMs(400);
      const actual: DisplayRotation = await driver.getDisplayRotation();
      expect(actual).assertEqual(DisplayRotation.ROTATION_90);
      await driver.assertComponentExist(ON.id('Slider'));
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
      await driver.setDisplayRotation(DisplayRotation.ROTATION_0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_FINAL_ROT_0015
     * @tc.name      testFinalRotation0015
     * @tc.desc      Playback controls survive display rotation 3 case 15.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFinalRotation0015', 0, async () => {
      await driver.delayMs(200);
      await driver.setDisplayRotation(DisplayRotation.ROTATION_270);
      await driver.delayMs(400);
      const actual: DisplayRotation = await driver.getDisplayRotation();
      expect(actual).assertEqual(DisplayRotation.ROTATION_270);
      await driver.assertComponentExist(ON.id('Slider'));
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
      await driver.setDisplayRotation(DisplayRotation.ROTATION_0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_FINAL_ROT_0016
     * @tc.name      testFinalRotation0016
     * @tc.desc      Playback controls survive display rotation 3 case 16.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFinalRotation0016', 0, async () => {
      await driver.delayMs(200);
      await driver.setDisplayRotation(DisplayRotation.ROTATION_270);
      await driver.delayMs(400);
      const actual: DisplayRotation = await driver.getDisplayRotation();
      expect(actual).assertEqual(DisplayRotation.ROTATION_270);
      await driver.assertComponentExist(ON.id('Slider'));
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
      await driver.setDisplayRotation(DisplayRotation.ROTATION_0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_FINAL_ROT_0017
     * @tc.name      testFinalRotation0017
     * @tc.desc      Playback controls survive display rotation 1 case 17.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFinalRotation0017', 0, async () => {
      await driver.delayMs(200);
      await driver.setDisplayRotation(DisplayRotation.ROTATION_90);
      await driver.delayMs(400);
      const actual: DisplayRotation = await driver.getDisplayRotation();
      expect(actual).assertEqual(DisplayRotation.ROTATION_90);
      await driver.assertComponentExist(ON.id('Slider'));
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
      await driver.setDisplayRotation(DisplayRotation.ROTATION_0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_FINAL_ROT_0018
     * @tc.name      testFinalRotation0018
     * @tc.desc      Playback controls survive display rotation 1 case 18.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFinalRotation0018', 0, async () => {
      await driver.delayMs(200);
      await driver.setDisplayRotation(DisplayRotation.ROTATION_90);
      await driver.delayMs(400);
      const actual: DisplayRotation = await driver.getDisplayRotation();
      expect(actual).assertEqual(DisplayRotation.ROTATION_90);
      await driver.assertComponentExist(ON.id('Slider'));
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
      await driver.setDisplayRotation(DisplayRotation.ROTATION_0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_FINAL_ROT_0019
     * @tc.name      testFinalRotation0019
     * @tc.desc      Playback controls survive display rotation 3 case 19.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFinalRotation0019', 0, async () => {
      await driver.delayMs(200);
      await driver.setDisplayRotation(DisplayRotation.ROTATION_270);
      await driver.delayMs(400);
      const actual: DisplayRotation = await driver.getDisplayRotation();
      expect(actual).assertEqual(DisplayRotation.ROTATION_270);
      await driver.assertComponentExist(ON.id('Slider'));
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
      await driver.setDisplayRotation(DisplayRotation.ROTATION_0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_FINAL_ROT_0020
     * @tc.name      testFinalRotation0020
     * @tc.desc      Playback controls survive display rotation 3 case 20.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFinalRotation0020', 0, async () => {
      await driver.delayMs(200);
      await driver.setDisplayRotation(DisplayRotation.ROTATION_270);
      await driver.delayMs(400);
      const actual: DisplayRotation = await driver.getDisplayRotation();
      expect(actual).assertEqual(DisplayRotation.ROTATION_270);
      await driver.assertComponentExist(ON.id('Slider'));
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
      await driver.setDisplayRotation(DisplayRotation.ROTATION_0);
    })
  })
}
