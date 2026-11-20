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

import { describe, it, expect, beforeAll, TestType, Size, Level } from '@ohos/hypium';
import { abilityDelegatorRegistry, Driver, ON } from '@kit.TestKit';
import { Want, common } from '@kit.AbilityKit';
const MOVING_PHOTO_BUNDLE: string = 'com.example.movingphotoviewsample';
const MOVING_PHOTO_DELEGATOR = abilityDelegatorRegistry.getAbilityDelegator();
function waitMs(ms: number): Promise<void> { return new Promise<void>((resolve: () => void) => { setTimeout(() => { resolve(); }, ms); }); }

export default function movingPhotoPlusUiTest() {
  describe('MovingPhotoPlusUiTest', () => {
    let driver: Driver;
    let appContext: common.Context;
    beforeAll(async () => { const want: Want = { bundleName: MOVING_PHOTO_BUNDLE, abilityName: 'EntryAbility' }; await MOVING_PHOTO_DELEGATOR.startAbility(want); await waitMs(2500); driver = await Driver.create(); appContext = MOVING_PHOTO_DELEGATOR.getAppContext(); })

    /**
     * @tc.name   testMpPlusUi0001
     * @tc.number MOVING_PHOTO_PLUS_UI_0001
     * @tc.desc   Check moving photo UI text play_button case 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusUi0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const expected: string = appContext.resourceManager.getStringByNameSync('play_button');
      expect(expected.length > 0).assertTrue();
      await driver.assertComponentExist(ON.text(expected));
      expect(expected === expected.trim()).assertTrue();
    })

    /**
     * @tc.name   testMpPlusUi0002
     * @tc.number MOVING_PHOTO_PLUS_UI_0002
     * @tc.desc   Check moving photo UI text stop_button case 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusUi0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const expected: string = appContext.resourceManager.getStringByNameSync('stop_button');
      expect(expected.length > 0).assertTrue();
      await driver.assertComponentExist(ON.text(expected));
      expect(expected === expected.trim()).assertTrue();
    })

    /**
     * @tc.name   testMpPlusUi0003
     * @tc.number MOVING_PHOTO_PLUS_UI_0003
     * @tc.desc   Check moving photo UI text mute_button case 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusUi0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const expected: string = appContext.resourceManager.getStringByNameSync('mute_button');
      expect(expected.length > 0).assertTrue();
      await driver.assertComponentExist(ON.text(expected));
      expect(expected === expected.trim()).assertTrue();
    })

    /**
     * @tc.name   testMpPlusUi0004
     * @tc.number MOVING_PHOTO_PLUS_UI_0004
     * @tc.desc   Check moving photo UI text unmute_button case 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusUi0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const expected: string = appContext.resourceManager.getStringByNameSync('unmute_button');
      expect(expected.length > 0).assertTrue();
      await driver.assertComponentExist(ON.text(expected));
      expect(expected === expected.trim()).assertTrue();
    })

    /**
     * @tc.name   testMpPlusUi0005
     * @tc.number MOVING_PHOTO_PLUS_UI_0005
     * @tc.desc   Check moving photo UI text moving_photo_loaded case 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusUi0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const expected: string = appContext.resourceManager.getStringByNameSync('moving_photo_loaded');
      expect(expected.length > 0).assertTrue();
      await driver.assertComponentExist(ON.text(expected));
      expect(expected === expected.trim()).assertTrue();
    })

    /**
     * @tc.name   testMpPlusUi0006
     * @tc.number MOVING_PHOTO_PLUS_UI_0006
     * @tc.desc   Check moving photo UI text play_button case 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusUi0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const expected: string = appContext.resourceManager.getStringByNameSync('play_button');
      expect(expected.length > 0).assertTrue();
      await driver.assertComponentExist(ON.text(expected));
      expect(expected === expected.trim()).assertTrue();
    })

    /**
     * @tc.name   testMpPlusUi0007
     * @tc.number MOVING_PHOTO_PLUS_UI_0007
     * @tc.desc   Check moving photo UI text stop_button case 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusUi0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const expected: string = appContext.resourceManager.getStringByNameSync('stop_button');
      expect(expected.length > 0).assertTrue();
      await driver.assertComponentExist(ON.text(expected));
      expect(expected === expected.trim()).assertTrue();
    })

    /**
     * @tc.name   testMpPlusUi0008
     * @tc.number MOVING_PHOTO_PLUS_UI_0008
     * @tc.desc   Check moving photo UI text mute_button case 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusUi0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const expected: string = appContext.resourceManager.getStringByNameSync('mute_button');
      expect(expected.length > 0).assertTrue();
      await driver.assertComponentExist(ON.text(expected));
      expect(expected === expected.trim()).assertTrue();
    })

    /**
     * @tc.name   testMpPlusUi0009
     * @tc.number MOVING_PHOTO_PLUS_UI_0009
     * @tc.desc   Check moving photo UI text unmute_button case 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusUi0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const expected: string = appContext.resourceManager.getStringByNameSync('unmute_button');
      expect(expected.length > 0).assertTrue();
      await driver.assertComponentExist(ON.text(expected));
      expect(expected === expected.trim()).assertTrue();
    })

    /**
     * @tc.name   testMpPlusUi0010
     * @tc.number MOVING_PHOTO_PLUS_UI_0010
     * @tc.desc   Check moving photo UI text moving_photo_loaded case 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusUi0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const expected: string = appContext.resourceManager.getStringByNameSync('moving_photo_loaded');
      expect(expected.length > 0).assertTrue();
      await driver.assertComponentExist(ON.text(expected));
      expect(expected === expected.trim()).assertTrue();
    })

    /**
     * @tc.name   testMpPlusUi0011
     * @tc.number MOVING_PHOTO_PLUS_UI_0011
     * @tc.desc   Check moving photo UI text play_button case 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusUi0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const expected: string = appContext.resourceManager.getStringByNameSync('play_button');
      expect(expected.length > 0).assertTrue();
      await driver.assertComponentExist(ON.text(expected));
      expect(expected === expected.trim()).assertTrue();
    })

    /**
     * @tc.name   testMpPlusUi0012
     * @tc.number MOVING_PHOTO_PLUS_UI_0012
     * @tc.desc   Check moving photo UI text stop_button case 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusUi0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const expected: string = appContext.resourceManager.getStringByNameSync('stop_button');
      expect(expected.length > 0).assertTrue();
      await driver.assertComponentExist(ON.text(expected));
      expect(expected === expected.trim()).assertTrue();
    })

    /**
     * @tc.name   testMpPlusUi0013
     * @tc.number MOVING_PHOTO_PLUS_UI_0013
     * @tc.desc   Check moving photo UI text mute_button case 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusUi0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const expected: string = appContext.resourceManager.getStringByNameSync('mute_button');
      expect(expected.length > 0).assertTrue();
      await driver.assertComponentExist(ON.text(expected));
      expect(expected === expected.trim()).assertTrue();
    })

    /**
     * @tc.name   testMpPlusUi0014
     * @tc.number MOVING_PHOTO_PLUS_UI_0014
     * @tc.desc   Check moving photo UI text unmute_button case 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusUi0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const expected: string = appContext.resourceManager.getStringByNameSync('unmute_button');
      expect(expected.length > 0).assertTrue();
      await driver.assertComponentExist(ON.text(expected));
      expect(expected === expected.trim()).assertTrue();
    })

    /**
     * @tc.name   testMpPlusUi0015
     * @tc.number MOVING_PHOTO_PLUS_UI_0015
     * @tc.desc   Check moving photo UI text moving_photo_loaded case 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusUi0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const expected: string = appContext.resourceManager.getStringByNameSync('moving_photo_loaded');
      expect(expected.length > 0).assertTrue();
      await driver.assertComponentExist(ON.text(expected));
      expect(expected === expected.trim()).assertTrue();
    })

    /**
     * @tc.name   testMpPlusUi0016
     * @tc.number MOVING_PHOTO_PLUS_UI_0016
     * @tc.desc   Check moving photo UI text play_button case 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusUi0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const expected: string = appContext.resourceManager.getStringByNameSync('play_button');
      expect(expected.length > 0).assertTrue();
      await driver.assertComponentExist(ON.text(expected));
      expect(expected === expected.trim()).assertTrue();
    })

    /**
     * @tc.name   testMpPlusUi0017
     * @tc.number MOVING_PHOTO_PLUS_UI_0017
     * @tc.desc   Check moving photo UI text stop_button case 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusUi0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const expected: string = appContext.resourceManager.getStringByNameSync('stop_button');
      expect(expected.length > 0).assertTrue();
      await driver.assertComponentExist(ON.text(expected));
      expect(expected === expected.trim()).assertTrue();
    })

    /**
     * @tc.name   testMpPlusUi0018
     * @tc.number MOVING_PHOTO_PLUS_UI_0018
     * @tc.desc   Check moving photo UI text mute_button case 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusUi0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const expected: string = appContext.resourceManager.getStringByNameSync('mute_button');
      expect(expected.length > 0).assertTrue();
      await driver.assertComponentExist(ON.text(expected));
      expect(expected === expected.trim()).assertTrue();
    })

    /**
     * @tc.name   testMpPlusUi0019
     * @tc.number MOVING_PHOTO_PLUS_UI_0019
     * @tc.desc   Check moving photo UI text unmute_button case 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusUi0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const expected: string = appContext.resourceManager.getStringByNameSync('unmute_button');
      expect(expected.length > 0).assertTrue();
      await driver.assertComponentExist(ON.text(expected));
      expect(expected === expected.trim()).assertTrue();
    })

    /**
     * @tc.name   testMpPlusUi0020
     * @tc.number MOVING_PHOTO_PLUS_UI_0020
     * @tc.desc   Check moving photo UI text moving_photo_loaded case 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusUi0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const expected: string = appContext.resourceManager.getStringByNameSync('moving_photo_loaded');
      expect(expected.length > 0).assertTrue();
      await driver.assertComponentExist(ON.text(expected));
      expect(expected === expected.trim()).assertTrue();
    })

    /**
     * @tc.name   testMpPlusUi0021
     * @tc.number MOVING_PHOTO_PLUS_UI_0021
     * @tc.desc   Check moving photo UI text play_button case 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusUi0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const expected: string = appContext.resourceManager.getStringByNameSync('play_button');
      expect(expected.length > 0).assertTrue();
      await driver.assertComponentExist(ON.text(expected));
      expect(expected === expected.trim()).assertTrue();
    })

    /**
     * @tc.name   testMpPlusUi0022
     * @tc.number MOVING_PHOTO_PLUS_UI_0022
     * @tc.desc   Check moving photo UI text stop_button case 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusUi0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const expected: string = appContext.resourceManager.getStringByNameSync('stop_button');
      expect(expected.length > 0).assertTrue();
      await driver.assertComponentExist(ON.text(expected));
      expect(expected === expected.trim()).assertTrue();
    })

    /**
     * @tc.name   testMpPlusUi0023
     * @tc.number MOVING_PHOTO_PLUS_UI_0023
     * @tc.desc   Check moving photo UI text mute_button case 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusUi0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const expected: string = appContext.resourceManager.getStringByNameSync('mute_button');
      expect(expected.length > 0).assertTrue();
      await driver.assertComponentExist(ON.text(expected));
      expect(expected === expected.trim()).assertTrue();
    })

    /**
     * @tc.name   testMpPlusUi0024
     * @tc.number MOVING_PHOTO_PLUS_UI_0024
     * @tc.desc   Check moving photo UI text unmute_button case 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusUi0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const expected: string = appContext.resourceManager.getStringByNameSync('unmute_button');
      expect(expected.length > 0).assertTrue();
      await driver.assertComponentExist(ON.text(expected));
      expect(expected === expected.trim()).assertTrue();
    })

    /**
     * @tc.name   testMpPlusUi0025
     * @tc.number MOVING_PHOTO_PLUS_UI_0025
     * @tc.desc   Check moving photo UI text moving_photo_loaded case 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusUi0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const expected: string = appContext.resourceManager.getStringByNameSync('moving_photo_loaded');
      expect(expected.length > 0).assertTrue();
      await driver.assertComponentExist(ON.text(expected));
      expect(expected === expected.trim()).assertTrue();
    })

    /**
     * @tc.name   testMpPlusUi0026
     * @tc.number MOVING_PHOTO_PLUS_UI_0026
     * @tc.desc   Check moving photo UI text play_button case 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusUi0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const expected: string = appContext.resourceManager.getStringByNameSync('play_button');
      expect(expected.length > 0).assertTrue();
      await driver.assertComponentExist(ON.text(expected));
      expect(expected === expected.trim()).assertTrue();
    })

    /**
     * @tc.name   testMpPlusUi0027
     * @tc.number MOVING_PHOTO_PLUS_UI_0027
     * @tc.desc   Check moving photo UI text stop_button case 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusUi0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const expected: string = appContext.resourceManager.getStringByNameSync('stop_button');
      expect(expected.length > 0).assertTrue();
      await driver.assertComponentExist(ON.text(expected));
      expect(expected === expected.trim()).assertTrue();
    })

    /**
     * @tc.name   testMpPlusUi0028
     * @tc.number MOVING_PHOTO_PLUS_UI_0028
     * @tc.desc   Check moving photo UI text mute_button case 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusUi0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const expected: string = appContext.resourceManager.getStringByNameSync('mute_button');
      expect(expected.length > 0).assertTrue();
      await driver.assertComponentExist(ON.text(expected));
      expect(expected === expected.trim()).assertTrue();
    })

    /**
     * @tc.name   testMpPlusUi0029
     * @tc.number MOVING_PHOTO_PLUS_UI_0029
     * @tc.desc   Check moving photo UI text unmute_button case 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusUi0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const expected: string = appContext.resourceManager.getStringByNameSync('unmute_button');
      expect(expected.length > 0).assertTrue();
      await driver.assertComponentExist(ON.text(expected));
      expect(expected === expected.trim()).assertTrue();
    })

    /**
     * @tc.name   testMpPlusUi0030
     * @tc.number MOVING_PHOTO_PLUS_UI_0030
     * @tc.desc   Check moving photo UI text moving_photo_loaded case 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusUi0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const expected: string = appContext.resourceManager.getStringByNameSync('moving_photo_loaded');
      expect(expected.length > 0).assertTrue();
      await driver.assertComponentExist(ON.text(expected));
      expect(expected === expected.trim()).assertTrue();
    })

    /**
     * @tc.name   testMpPlusUi0031
     * @tc.number MOVING_PHOTO_PLUS_UI_0031
     * @tc.desc   Check moving photo UI text play_button case 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusUi0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const expected: string = appContext.resourceManager.getStringByNameSync('play_button');
      expect(expected.length > 0).assertTrue();
      await driver.assertComponentExist(ON.text(expected));
      expect(expected === expected.trim()).assertTrue();
    })

    /**
     * @tc.name   testMpPlusUi0032
     * @tc.number MOVING_PHOTO_PLUS_UI_0032
     * @tc.desc   Check moving photo UI text stop_button case 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusUi0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const expected: string = appContext.resourceManager.getStringByNameSync('stop_button');
      expect(expected.length > 0).assertTrue();
      await driver.assertComponentExist(ON.text(expected));
      expect(expected === expected.trim()).assertTrue();
    })

    /**
     * @tc.name   testMpPlusUi0033
     * @tc.number MOVING_PHOTO_PLUS_UI_0033
     * @tc.desc   Check moving photo UI text mute_button case 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusUi0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const expected: string = appContext.resourceManager.getStringByNameSync('mute_button');
      expect(expected.length > 0).assertTrue();
      await driver.assertComponentExist(ON.text(expected));
      expect(expected === expected.trim()).assertTrue();
    })

    /**
     * @tc.name   testMpPlusUi0034
     * @tc.number MOVING_PHOTO_PLUS_UI_0034
     * @tc.desc   Check moving photo UI text unmute_button case 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusUi0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const expected: string = appContext.resourceManager.getStringByNameSync('unmute_button');
      expect(expected.length > 0).assertTrue();
      await driver.assertComponentExist(ON.text(expected));
      expect(expected === expected.trim()).assertTrue();
    })

    /**
     * @tc.name   testMpPlusUi0035
     * @tc.number MOVING_PHOTO_PLUS_UI_0035
     * @tc.desc   Check moving photo UI text moving_photo_loaded case 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusUi0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const expected: string = appContext.resourceManager.getStringByNameSync('moving_photo_loaded');
      expect(expected.length > 0).assertTrue();
      await driver.assertComponentExist(ON.text(expected));
      expect(expected === expected.trim()).assertTrue();
    })

    /**
     * @tc.name   testMpPlusUi0036
     * @tc.number MOVING_PHOTO_PLUS_UI_0036
     * @tc.desc   Check moving photo UI text play_button case 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusUi0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const expected: string = appContext.resourceManager.getStringByNameSync('play_button');
      expect(expected.length > 0).assertTrue();
      await driver.assertComponentExist(ON.text(expected));
      expect(expected === expected.trim()).assertTrue();
    })

    /**
     * @tc.name   testMpPlusUi0037
     * @tc.number MOVING_PHOTO_PLUS_UI_0037
     * @tc.desc   Check moving photo UI text stop_button case 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusUi0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const expected: string = appContext.resourceManager.getStringByNameSync('stop_button');
      expect(expected.length > 0).assertTrue();
      await driver.assertComponentExist(ON.text(expected));
      expect(expected === expected.trim()).assertTrue();
    })

    /**
     * @tc.name   testMpPlusUi0038
     * @tc.number MOVING_PHOTO_PLUS_UI_0038
     * @tc.desc   Check moving photo UI text mute_button case 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusUi0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const expected: string = appContext.resourceManager.getStringByNameSync('mute_button');
      expect(expected.length > 0).assertTrue();
      await driver.assertComponentExist(ON.text(expected));
      expect(expected === expected.trim()).assertTrue();
    })

    /**
     * @tc.name   testMpPlusUi0039
     * @tc.number MOVING_PHOTO_PLUS_UI_0039
     * @tc.desc   Check moving photo UI text unmute_button case 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusUi0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const expected: string = appContext.resourceManager.getStringByNameSync('unmute_button');
      expect(expected.length > 0).assertTrue();
      await driver.assertComponentExist(ON.text(expected));
      expect(expected === expected.trim()).assertTrue();
    })

    /**
     * @tc.name   testMpPlusUi0040
     * @tc.number MOVING_PHOTO_PLUS_UI_0040
     * @tc.desc   Check moving photo UI text moving_photo_loaded case 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusUi0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const expected: string = appContext.resourceManager.getStringByNameSync('moving_photo_loaded');
      expect(expected.length > 0).assertTrue();
      await driver.assertComponentExist(ON.text(expected));
      expect(expected === expected.trim()).assertTrue();
    })

    /**
     * @tc.name   testMpPlusUi0041
     * @tc.number MOVING_PHOTO_PLUS_UI_0041
     * @tc.desc   Check moving photo UI text play_button case 41.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusUi0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const expected: string = appContext.resourceManager.getStringByNameSync('play_button');
      expect(expected.length > 0).assertTrue();
      await driver.assertComponentExist(ON.text(expected));
      expect(expected === expected.trim()).assertTrue();
    })

    /**
     * @tc.name   testMpPlusUi0042
     * @tc.number MOVING_PHOTO_PLUS_UI_0042
     * @tc.desc   Check moving photo UI text stop_button case 42.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusUi0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const expected: string = appContext.resourceManager.getStringByNameSync('stop_button');
      expect(expected.length > 0).assertTrue();
      await driver.assertComponentExist(ON.text(expected));
      expect(expected === expected.trim()).assertTrue();
    })

    /**
     * @tc.name   testMpPlusUi0043
     * @tc.number MOVING_PHOTO_PLUS_UI_0043
     * @tc.desc   Check moving photo UI text mute_button case 43.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusUi0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const expected: string = appContext.resourceManager.getStringByNameSync('mute_button');
      expect(expected.length > 0).assertTrue();
      await driver.assertComponentExist(ON.text(expected));
      expect(expected === expected.trim()).assertTrue();
    })

    /**
     * @tc.name   testMpPlusUi0044
     * @tc.number MOVING_PHOTO_PLUS_UI_0044
     * @tc.desc   Check moving photo UI text unmute_button case 44.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusUi0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const expected: string = appContext.resourceManager.getStringByNameSync('unmute_button');
      expect(expected.length > 0).assertTrue();
      await driver.assertComponentExist(ON.text(expected));
      expect(expected === expected.trim()).assertTrue();
    })

    /**
     * @tc.name   testMpPlusUi0045
     * @tc.number MOVING_PHOTO_PLUS_UI_0045
     * @tc.desc   Check moving photo UI text moving_photo_loaded case 45.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusUi0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const expected: string = appContext.resourceManager.getStringByNameSync('moving_photo_loaded');
      expect(expected.length > 0).assertTrue();
      await driver.assertComponentExist(ON.text(expected));
      expect(expected === expected.trim()).assertTrue();
    })

    /**
     * @tc.name   testMpPlusUi0046
     * @tc.number MOVING_PHOTO_PLUS_UI_0046
     * @tc.desc   Check moving photo UI text play_button case 46.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusUi0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const expected: string = appContext.resourceManager.getStringByNameSync('play_button');
      expect(expected.length > 0).assertTrue();
      await driver.assertComponentExist(ON.text(expected));
      expect(expected === expected.trim()).assertTrue();
    })

    /**
     * @tc.name   testMpPlusUi0047
     * @tc.number MOVING_PHOTO_PLUS_UI_0047
     * @tc.desc   Check moving photo UI text stop_button case 47.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusUi0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const expected: string = appContext.resourceManager.getStringByNameSync('stop_button');
      expect(expected.length > 0).assertTrue();
      await driver.assertComponentExist(ON.text(expected));
      expect(expected === expected.trim()).assertTrue();
    })

    /**
     * @tc.name   testMpPlusUi0048
     * @tc.number MOVING_PHOTO_PLUS_UI_0048
     * @tc.desc   Check moving photo UI text mute_button case 48.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusUi0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const expected: string = appContext.resourceManager.getStringByNameSync('mute_button');
      expect(expected.length > 0).assertTrue();
      await driver.assertComponentExist(ON.text(expected));
      expect(expected === expected.trim()).assertTrue();
    })

    /**
     * @tc.name   testMpPlusUi0049
     * @tc.number MOVING_PHOTO_PLUS_UI_0049
     * @tc.desc   Check moving photo UI text unmute_button case 49.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusUi0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const expected: string = appContext.resourceManager.getStringByNameSync('unmute_button');
      expect(expected.length > 0).assertTrue();
      await driver.assertComponentExist(ON.text(expected));
      expect(expected === expected.trim()).assertTrue();
    })

    /**
     * @tc.name   testMpPlusUi0050
     * @tc.number MOVING_PHOTO_PLUS_UI_0050
     * @tc.desc   Check moving photo UI text moving_photo_loaded case 50.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusUi0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const expected: string = appContext.resourceManager.getStringByNameSync('moving_photo_loaded');
      expect(expected.length > 0).assertTrue();
      await driver.assertComponentExist(ON.text(expected));
      expect(expected === expected.trim()).assertTrue();
    })

    /**
     * @tc.name   testMpPlusUi0051
     * @tc.number MOVING_PHOTO_PLUS_UI_0051
     * @tc.desc   Check moving photo UI text play_button case 51.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusUi0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const expected: string = appContext.resourceManager.getStringByNameSync('play_button');
      expect(expected.length > 0).assertTrue();
      await driver.assertComponentExist(ON.text(expected));
      expect(expected === expected.trim()).assertTrue();
    })

    /**
     * @tc.name   testMpPlusUi0052
     * @tc.number MOVING_PHOTO_PLUS_UI_0052
     * @tc.desc   Check moving photo UI text stop_button case 52.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusUi0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const expected: string = appContext.resourceManager.getStringByNameSync('stop_button');
      expect(expected.length > 0).assertTrue();
      await driver.assertComponentExist(ON.text(expected));
      expect(expected === expected.trim()).assertTrue();
    })

    /**
     * @tc.name   testMpPlusUi0053
     * @tc.number MOVING_PHOTO_PLUS_UI_0053
     * @tc.desc   Check moving photo UI text mute_button case 53.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusUi0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const expected: string = appContext.resourceManager.getStringByNameSync('mute_button');
      expect(expected.length > 0).assertTrue();
      await driver.assertComponentExist(ON.text(expected));
      expect(expected === expected.trim()).assertTrue();
    })

    /**
     * @tc.name   testMpPlusUi0054
     * @tc.number MOVING_PHOTO_PLUS_UI_0054
     * @tc.desc   Check moving photo UI text unmute_button case 54.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusUi0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const expected: string = appContext.resourceManager.getStringByNameSync('unmute_button');
      expect(expected.length > 0).assertTrue();
      await driver.assertComponentExist(ON.text(expected));
      expect(expected === expected.trim()).assertTrue();
    })

    /**
     * @tc.name   testMpPlusUi0055
     * @tc.number MOVING_PHOTO_PLUS_UI_0055
     * @tc.desc   Check moving photo UI text moving_photo_loaded case 55.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusUi0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const expected: string = appContext.resourceManager.getStringByNameSync('moving_photo_loaded');
      expect(expected.length > 0).assertTrue();
      await driver.assertComponentExist(ON.text(expected));
      expect(expected === expected.trim()).assertTrue();
    })

    /**
     * @tc.name   testMpPlusUi0056
     * @tc.number MOVING_PHOTO_PLUS_UI_0056
     * @tc.desc   Check moving photo UI text play_button case 56.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusUi0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const expected: string = appContext.resourceManager.getStringByNameSync('play_button');
      expect(expected.length > 0).assertTrue();
      await driver.assertComponentExist(ON.text(expected));
      expect(expected === expected.trim()).assertTrue();
    })

    /**
     * @tc.name   testMpPlusUi0057
     * @tc.number MOVING_PHOTO_PLUS_UI_0057
     * @tc.desc   Check moving photo UI text stop_button case 57.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusUi0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const expected: string = appContext.resourceManager.getStringByNameSync('stop_button');
      expect(expected.length > 0).assertTrue();
      await driver.assertComponentExist(ON.text(expected));
      expect(expected === expected.trim()).assertTrue();
    })

    /**
     * @tc.name   testMpPlusUi0058
     * @tc.number MOVING_PHOTO_PLUS_UI_0058
     * @tc.desc   Check moving photo UI text mute_button case 58.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusUi0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const expected: string = appContext.resourceManager.getStringByNameSync('mute_button');
      expect(expected.length > 0).assertTrue();
      await driver.assertComponentExist(ON.text(expected));
      expect(expected === expected.trim()).assertTrue();
    })

    /**
     * @tc.name   testMpPlusUi0059
     * @tc.number MOVING_PHOTO_PLUS_UI_0059
     * @tc.desc   Check moving photo UI text unmute_button case 59.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusUi0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const expected: string = appContext.resourceManager.getStringByNameSync('unmute_button');
      expect(expected.length > 0).assertTrue();
      await driver.assertComponentExist(ON.text(expected));
      expect(expected === expected.trim()).assertTrue();
    })

    /**
     * @tc.name   testMpPlusUi0060
     * @tc.number MOVING_PHOTO_PLUS_UI_0060
     * @tc.desc   Check moving photo UI text moving_photo_loaded case 60.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusUi0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const expected: string = appContext.resourceManager.getStringByNameSync('moving_photo_loaded');
      expect(expected.length > 0).assertTrue();
      await driver.assertComponentExist(ON.text(expected));
      expect(expected === expected.trim()).assertTrue();
    })
  })
}
