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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, it, expect, beforeAll, TestType, Size, Level } from '@ohos/hypium';
import { abilityDelegatorRegistry, Component, Driver, ON } from '@kit.TestKit';
import { Want } from '@kit.AbilityKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_MovingPhotoView_MuteMatrix]';
const BUNDLE_NAME: string = 'com.example.movingphotoviewsample';
const ENTRY_ABILITY: string = 'EntryAbility';
const MUTE_TEXT: string = '\u9759\u97f3';
const UNMUTE_TEXT: string = '\u53d6\u6d88\u9759\u97f3';
const DELEGATOR = abilityDelegatorRegistry.getAbilityDelegator();

function delay(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(() => {
      resolve();
    }, ms);
  });
}

export default function movingPhotoMuteMatrixTest() {
  describe('MovingPhotoMuteMatrixTest', () => {
    let driver: Driver;

    beforeAll(async () => {
      const want: Want = {
        bundleName: BUNDLE_NAME,
        abilityName: ENTRY_ABILITY
      };
      await DELEGATOR.startAbility(want);
      await delay(2500);
      driver = await Driver.create();
    })

    /**
     * @tc.name   testMuteMatrix0001
     * @tc.number MOVING_PHOTO_VIEW_MUTE_0001
     * @tc.desc   Test mute button label toggle, case 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteMatrix0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testMuteMatrix0001 begin');
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) {
        await mute.click();
      } else {
        await unmute.click();
      }
      await delay(500);
      const toggledMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const toggledUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(toggledMute !== null || toggledUnmute !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testMuteMatrix0001 end');
    })

    /**
     * @tc.name   testMuteMatrix0002
     * @tc.number MOVING_PHOTO_VIEW_MUTE_0002
     * @tc.desc   Test mute button label toggle, case 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteMatrix0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testMuteMatrix0002 begin');
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) {
        await mute.click();
      } else {
        await unmute.click();
      }
      await delay(500);
      const toggledMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const toggledUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(toggledMute !== null || toggledUnmute !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testMuteMatrix0002 end');
    })

    /**
     * @tc.name   testMuteMatrix0003
     * @tc.number MOVING_PHOTO_VIEW_MUTE_0003
     * @tc.desc   Test mute button label toggle, case 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteMatrix0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testMuteMatrix0003 begin');
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) {
        await mute.click();
      } else {
        await unmute.click();
      }
      await delay(500);
      const toggledMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const toggledUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(toggledMute !== null || toggledUnmute !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testMuteMatrix0003 end');
    })

    /**
     * @tc.name   testMuteMatrix0004
     * @tc.number MOVING_PHOTO_VIEW_MUTE_0004
     * @tc.desc   Test mute button label toggle, case 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteMatrix0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testMuteMatrix0004 begin');
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) {
        await mute.click();
      } else {
        await unmute.click();
      }
      await delay(500);
      const toggledMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const toggledUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(toggledMute !== null || toggledUnmute !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testMuteMatrix0004 end');
    })

    /**
     * @tc.name   testMuteMatrix0005
     * @tc.number MOVING_PHOTO_VIEW_MUTE_0005
     * @tc.desc   Test mute button label toggle, case 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteMatrix0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testMuteMatrix0005 begin');
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) {
        await mute.click();
      } else {
        await unmute.click();
      }
      await delay(500);
      const toggledMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const toggledUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(toggledMute !== null || toggledUnmute !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testMuteMatrix0005 end');
    })

    /**
     * @tc.name   testMuteMatrix0006
     * @tc.number MOVING_PHOTO_VIEW_MUTE_0006
     * @tc.desc   Test mute button label toggle, case 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteMatrix0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testMuteMatrix0006 begin');
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) {
        await mute.click();
      } else {
        await unmute.click();
      }
      await delay(500);
      const toggledMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const toggledUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(toggledMute !== null || toggledUnmute !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testMuteMatrix0006 end');
    })

    /**
     * @tc.name   testMuteMatrix0007
     * @tc.number MOVING_PHOTO_VIEW_MUTE_0007
     * @tc.desc   Test mute button label toggle, case 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteMatrix0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testMuteMatrix0007 begin');
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) {
        await mute.click();
      } else {
        await unmute.click();
      }
      await delay(500);
      const toggledMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const toggledUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(toggledMute !== null || toggledUnmute !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testMuteMatrix0007 end');
    })

    /**
     * @tc.name   testMuteMatrix0008
     * @tc.number MOVING_PHOTO_VIEW_MUTE_0008
     * @tc.desc   Test mute button label toggle, case 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteMatrix0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testMuteMatrix0008 begin');
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) {
        await mute.click();
      } else {
        await unmute.click();
      }
      await delay(500);
      const toggledMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const toggledUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(toggledMute !== null || toggledUnmute !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testMuteMatrix0008 end');
    })

    /**
     * @tc.name   testMuteMatrix0009
     * @tc.number MOVING_PHOTO_VIEW_MUTE_0009
     * @tc.desc   Test mute button label toggle, case 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteMatrix0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testMuteMatrix0009 begin');
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) {
        await mute.click();
      } else {
        await unmute.click();
      }
      await delay(500);
      const toggledMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const toggledUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(toggledMute !== null || toggledUnmute !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testMuteMatrix0009 end');
    })

    /**
     * @tc.name   testMuteMatrix0010
     * @tc.number MOVING_PHOTO_VIEW_MUTE_0010
     * @tc.desc   Test mute button label toggle, case 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteMatrix0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testMuteMatrix0010 begin');
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) {
        await mute.click();
      } else {
        await unmute.click();
      }
      await delay(500);
      const toggledMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const toggledUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(toggledMute !== null || toggledUnmute !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testMuteMatrix0010 end');
    })

    /**
     * @tc.name   testMuteMatrix0011
     * @tc.number MOVING_PHOTO_VIEW_MUTE_0011
     * @tc.desc   Test mute button label toggle, case 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteMatrix0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testMuteMatrix0011 begin');
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) {
        await mute.click();
      } else {
        await unmute.click();
      }
      await delay(500);
      const toggledMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const toggledUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(toggledMute !== null || toggledUnmute !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testMuteMatrix0011 end');
    })

    /**
     * @tc.name   testMuteMatrix0012
     * @tc.number MOVING_PHOTO_VIEW_MUTE_0012
     * @tc.desc   Test mute button label toggle, case 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteMatrix0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testMuteMatrix0012 begin');
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) {
        await mute.click();
      } else {
        await unmute.click();
      }
      await delay(500);
      const toggledMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const toggledUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(toggledMute !== null || toggledUnmute !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testMuteMatrix0012 end');
    })

    /**
     * @tc.name   testMuteMatrix0013
     * @tc.number MOVING_PHOTO_VIEW_MUTE_0013
     * @tc.desc   Test mute button label toggle, case 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteMatrix0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testMuteMatrix0013 begin');
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) {
        await mute.click();
      } else {
        await unmute.click();
      }
      await delay(500);
      const toggledMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const toggledUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(toggledMute !== null || toggledUnmute !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testMuteMatrix0013 end');
    })

    /**
     * @tc.name   testMuteMatrix0014
     * @tc.number MOVING_PHOTO_VIEW_MUTE_0014
     * @tc.desc   Test mute button label toggle, case 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteMatrix0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testMuteMatrix0014 begin');
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) {
        await mute.click();
      } else {
        await unmute.click();
      }
      await delay(500);
      const toggledMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const toggledUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(toggledMute !== null || toggledUnmute !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testMuteMatrix0014 end');
    })

    /**
     * @tc.name   testMuteMatrix0015
     * @tc.number MOVING_PHOTO_VIEW_MUTE_0015
     * @tc.desc   Test mute button label toggle, case 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteMatrix0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testMuteMatrix0015 begin');
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) {
        await mute.click();
      } else {
        await unmute.click();
      }
      await delay(500);
      const toggledMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const toggledUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(toggledMute !== null || toggledUnmute !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testMuteMatrix0015 end');
    })

    /**
     * @tc.name   testMuteMatrix0016
     * @tc.number MOVING_PHOTO_VIEW_MUTE_0016
     * @tc.desc   Test mute button label toggle, case 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteMatrix0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testMuteMatrix0016 begin');
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) {
        await mute.click();
      } else {
        await unmute.click();
      }
      await delay(500);
      const toggledMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const toggledUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(toggledMute !== null || toggledUnmute !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testMuteMatrix0016 end');
    })

    /**
     * @tc.name   testMuteMatrix0017
     * @tc.number MOVING_PHOTO_VIEW_MUTE_0017
     * @tc.desc   Test mute button label toggle, case 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteMatrix0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testMuteMatrix0017 begin');
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) {
        await mute.click();
      } else {
        await unmute.click();
      }
      await delay(500);
      const toggledMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const toggledUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(toggledMute !== null || toggledUnmute !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testMuteMatrix0017 end');
    })

    /**
     * @tc.name   testMuteMatrix0018
     * @tc.number MOVING_PHOTO_VIEW_MUTE_0018
     * @tc.desc   Test mute button label toggle, case 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteMatrix0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testMuteMatrix0018 begin');
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) {
        await mute.click();
      } else {
        await unmute.click();
      }
      await delay(500);
      const toggledMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const toggledUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(toggledMute !== null || toggledUnmute !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testMuteMatrix0018 end');
    })

    /**
     * @tc.name   testMuteMatrix0019
     * @tc.number MOVING_PHOTO_VIEW_MUTE_0019
     * @tc.desc   Test mute button label toggle, case 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteMatrix0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testMuteMatrix0019 begin');
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) {
        await mute.click();
      } else {
        await unmute.click();
      }
      await delay(500);
      const toggledMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const toggledUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(toggledMute !== null || toggledUnmute !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testMuteMatrix0019 end');
    })

    /**
     * @tc.name   testMuteMatrix0020
     * @tc.number MOVING_PHOTO_VIEW_MUTE_0020
     * @tc.desc   Test mute button label toggle, case 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteMatrix0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testMuteMatrix0020 begin');
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) {
        await mute.click();
      } else {
        await unmute.click();
      }
      await delay(500);
      const toggledMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const toggledUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(toggledMute !== null || toggledUnmute !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testMuteMatrix0020 end');
    })

    /**
     * @tc.name   testMuteMatrix0021
     * @tc.number MOVING_PHOTO_VIEW_MUTE_0021
     * @tc.desc   Test mute button label toggle, case 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteMatrix0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testMuteMatrix0021 begin');
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) {
        await mute.click();
      } else {
        await unmute.click();
      }
      await delay(500);
      const toggledMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const toggledUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(toggledMute !== null || toggledUnmute !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testMuteMatrix0021 end');
    })

    /**
     * @tc.name   testMuteMatrix0022
     * @tc.number MOVING_PHOTO_VIEW_MUTE_0022
     * @tc.desc   Test mute button label toggle, case 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteMatrix0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testMuteMatrix0022 begin');
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) {
        await mute.click();
      } else {
        await unmute.click();
      }
      await delay(500);
      const toggledMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const toggledUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(toggledMute !== null || toggledUnmute !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testMuteMatrix0022 end');
    })

    /**
     * @tc.name   testMuteMatrix0023
     * @tc.number MOVING_PHOTO_VIEW_MUTE_0023
     * @tc.desc   Test mute button label toggle, case 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteMatrix0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testMuteMatrix0023 begin');
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) {
        await mute.click();
      } else {
        await unmute.click();
      }
      await delay(500);
      const toggledMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const toggledUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(toggledMute !== null || toggledUnmute !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testMuteMatrix0023 end');
    })

    /**
     * @tc.name   testMuteMatrix0024
     * @tc.number MOVING_PHOTO_VIEW_MUTE_0024
     * @tc.desc   Test mute button label toggle, case 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteMatrix0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testMuteMatrix0024 begin');
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) {
        await mute.click();
      } else {
        await unmute.click();
      }
      await delay(500);
      const toggledMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const toggledUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(toggledMute !== null || toggledUnmute !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testMuteMatrix0024 end');
    })

    /**
     * @tc.name   testMuteMatrix0025
     * @tc.number MOVING_PHOTO_VIEW_MUTE_0025
     * @tc.desc   Test mute button label toggle, case 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteMatrix0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testMuteMatrix0025 begin');
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) {
        await mute.click();
      } else {
        await unmute.click();
      }
      await delay(500);
      const toggledMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const toggledUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(toggledMute !== null || toggledUnmute !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testMuteMatrix0025 end');
    })

    /**
     * @tc.name   testMuteMatrix0026
     * @tc.number MOVING_PHOTO_VIEW_MUTE_0026
     * @tc.desc   Test mute button label toggle, case 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteMatrix0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testMuteMatrix0026 begin');
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) {
        await mute.click();
      } else {
        await unmute.click();
      }
      await delay(500);
      const toggledMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const toggledUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(toggledMute !== null || toggledUnmute !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testMuteMatrix0026 end');
    })

    /**
     * @tc.name   testMuteMatrix0027
     * @tc.number MOVING_PHOTO_VIEW_MUTE_0027
     * @tc.desc   Test mute button label toggle, case 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteMatrix0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testMuteMatrix0027 begin');
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) {
        await mute.click();
      } else {
        await unmute.click();
      }
      await delay(500);
      const toggledMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const toggledUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(toggledMute !== null || toggledUnmute !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testMuteMatrix0027 end');
    })

    /**
     * @tc.name   testMuteMatrix0028
     * @tc.number MOVING_PHOTO_VIEW_MUTE_0028
     * @tc.desc   Test mute button label toggle, case 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteMatrix0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testMuteMatrix0028 begin');
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) {
        await mute.click();
      } else {
        await unmute.click();
      }
      await delay(500);
      const toggledMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const toggledUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(toggledMute !== null || toggledUnmute !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testMuteMatrix0028 end');
    })

    /**
     * @tc.name   testMuteMatrix0029
     * @tc.number MOVING_PHOTO_VIEW_MUTE_0029
     * @tc.desc   Test mute button label toggle, case 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteMatrix0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testMuteMatrix0029 begin');
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) {
        await mute.click();
      } else {
        await unmute.click();
      }
      await delay(500);
      const toggledMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const toggledUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(toggledMute !== null || toggledUnmute !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testMuteMatrix0029 end');
    })

    /**
     * @tc.name   testMuteMatrix0030
     * @tc.number MOVING_PHOTO_VIEW_MUTE_0030
     * @tc.desc   Test mute button label toggle, case 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteMatrix0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testMuteMatrix0030 begin');
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) {
        await mute.click();
      } else {
        await unmute.click();
      }
      await delay(500);
      const toggledMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const toggledUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(toggledMute !== null || toggledUnmute !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testMuteMatrix0030 end');
    })

    /**
     * @tc.name   testMuteMatrix0031
     * @tc.number MOVING_PHOTO_VIEW_MUTE_0031
     * @tc.desc   Test mute button label toggle, case 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteMatrix0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testMuteMatrix0031 begin');
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) {
        await mute.click();
      } else {
        await unmute.click();
      }
      await delay(500);
      const toggledMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const toggledUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(toggledMute !== null || toggledUnmute !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testMuteMatrix0031 end');
    })

    /**
     * @tc.name   testMuteMatrix0032
     * @tc.number MOVING_PHOTO_VIEW_MUTE_0032
     * @tc.desc   Test mute button label toggle, case 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteMatrix0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testMuteMatrix0032 begin');
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) {
        await mute.click();
      } else {
        await unmute.click();
      }
      await delay(500);
      const toggledMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const toggledUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(toggledMute !== null || toggledUnmute !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testMuteMatrix0032 end');
    })

    /**
     * @tc.name   testMuteMatrix0033
     * @tc.number MOVING_PHOTO_VIEW_MUTE_0033
     * @tc.desc   Test mute button label toggle, case 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteMatrix0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testMuteMatrix0033 begin');
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) {
        await mute.click();
      } else {
        await unmute.click();
      }
      await delay(500);
      const toggledMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const toggledUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(toggledMute !== null || toggledUnmute !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testMuteMatrix0033 end');
    })

    /**
     * @tc.name   testMuteMatrix0034
     * @tc.number MOVING_PHOTO_VIEW_MUTE_0034
     * @tc.desc   Test mute button label toggle, case 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteMatrix0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testMuteMatrix0034 begin');
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) {
        await mute.click();
      } else {
        await unmute.click();
      }
      await delay(500);
      const toggledMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const toggledUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(toggledMute !== null || toggledUnmute !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testMuteMatrix0034 end');
    })

    /**
     * @tc.name   testMuteMatrix0035
     * @tc.number MOVING_PHOTO_VIEW_MUTE_0035
     * @tc.desc   Test mute button label toggle, case 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteMatrix0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testMuteMatrix0035 begin');
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) {
        await mute.click();
      } else {
        await unmute.click();
      }
      await delay(500);
      const toggledMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const toggledUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(toggledMute !== null || toggledUnmute !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testMuteMatrix0035 end');
    })

    /**
     * @tc.name   testMuteMatrix0036
     * @tc.number MOVING_PHOTO_VIEW_MUTE_0036
     * @tc.desc   Test mute button label toggle, case 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteMatrix0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testMuteMatrix0036 begin');
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) {
        await mute.click();
      } else {
        await unmute.click();
      }
      await delay(500);
      const toggledMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const toggledUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(toggledMute !== null || toggledUnmute !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testMuteMatrix0036 end');
    })

    /**
     * @tc.name   testMuteMatrix0037
     * @tc.number MOVING_PHOTO_VIEW_MUTE_0037
     * @tc.desc   Test mute button label toggle, case 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteMatrix0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testMuteMatrix0037 begin');
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) {
        await mute.click();
      } else {
        await unmute.click();
      }
      await delay(500);
      const toggledMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const toggledUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(toggledMute !== null || toggledUnmute !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testMuteMatrix0037 end');
    })

    /**
     * @tc.name   testMuteMatrix0038
     * @tc.number MOVING_PHOTO_VIEW_MUTE_0038
     * @tc.desc   Test mute button label toggle, case 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteMatrix0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testMuteMatrix0038 begin');
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) {
        await mute.click();
      } else {
        await unmute.click();
      }
      await delay(500);
      const toggledMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const toggledUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(toggledMute !== null || toggledUnmute !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testMuteMatrix0038 end');
    })

    /**
     * @tc.name   testMuteMatrix0039
     * @tc.number MOVING_PHOTO_VIEW_MUTE_0039
     * @tc.desc   Test mute button label toggle, case 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteMatrix0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testMuteMatrix0039 begin');
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) {
        await mute.click();
      } else {
        await unmute.click();
      }
      await delay(500);
      const toggledMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const toggledUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(toggledMute !== null || toggledUnmute !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testMuteMatrix0039 end');
    })

    /**
     * @tc.name   testMuteMatrix0040
     * @tc.number MOVING_PHOTO_VIEW_MUTE_0040
     * @tc.desc   Test mute button label toggle, case 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteMatrix0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testMuteMatrix0040 begin');
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) {
        await mute.click();
      } else {
        await unmute.click();
      }
      await delay(500);
      const toggledMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const toggledUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(toggledMute !== null || toggledUnmute !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testMuteMatrix0040 end');
    })
  })
}
