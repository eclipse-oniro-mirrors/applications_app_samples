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
const TAG: string = '[Sample_MovingPhotoView_LongMatrix]';
const BUNDLE_NAME: string = 'com.example.movingphotoviewsample';
const ENTRY_ABILITY: string = 'EntryAbility';
const PLAY_TEXT: string = 'PLAY';
const STOP_TEXT: string = 'STOP';
const PLAYING_TEXT: string = '\u5f00\u59cb\u64ad\u653e';
const STOPPED_TEXT: string = '\u505c\u6b62\u64ad\u653e';
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

export default function movingPhotoMuteLongMatrixTest() {
  describe('MovingPhotoMuteLongMatrixTest', () => {
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
     * @tc.name   testMuteLong0001
     * @tc.number MOVING_PHOTO_VIEW_MUTE_LONG_0001
     * @tc.desc   Test mute state toggle, long matrix case 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteLong0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testMuteLong0001 begin');
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) {
        await mute.click();
      } else {
        await unmute.click();
      }
      await delay(400);
      const toggledMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const toggledUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(toggledMute !== null || toggledUnmute !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testMuteLong0001 end');
    })

    /**
     * @tc.name   testMuteLong0002
     * @tc.number MOVING_PHOTO_VIEW_MUTE_LONG_0002
     * @tc.desc   Test mute state toggle, long matrix case 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteLong0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testMuteLong0002 begin');
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) {
        await mute.click();
      } else {
        await unmute.click();
      }
      await delay(400);
      const toggledMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const toggledUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(toggledMute !== null || toggledUnmute !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testMuteLong0002 end');
    })

    /**
     * @tc.name   testMuteLong0003
     * @tc.number MOVING_PHOTO_VIEW_MUTE_LONG_0003
     * @tc.desc   Test mute state toggle, long matrix case 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteLong0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testMuteLong0003 begin');
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) {
        await mute.click();
      } else {
        await unmute.click();
      }
      await delay(400);
      const toggledMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const toggledUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(toggledMute !== null || toggledUnmute !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testMuteLong0003 end');
    })

    /**
     * @tc.name   testMuteLong0004
     * @tc.number MOVING_PHOTO_VIEW_MUTE_LONG_0004
     * @tc.desc   Test mute state toggle, long matrix case 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteLong0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testMuteLong0004 begin');
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) {
        await mute.click();
      } else {
        await unmute.click();
      }
      await delay(400);
      const toggledMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const toggledUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(toggledMute !== null || toggledUnmute !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testMuteLong0004 end');
    })

    /**
     * @tc.name   testMuteLong0005
     * @tc.number MOVING_PHOTO_VIEW_MUTE_LONG_0005
     * @tc.desc   Test mute state toggle, long matrix case 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteLong0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testMuteLong0005 begin');
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) {
        await mute.click();
      } else {
        await unmute.click();
      }
      await delay(400);
      const toggledMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const toggledUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(toggledMute !== null || toggledUnmute !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testMuteLong0005 end');
    })

    /**
     * @tc.name   testMuteLong0006
     * @tc.number MOVING_PHOTO_VIEW_MUTE_LONG_0006
     * @tc.desc   Test mute state toggle, long matrix case 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteLong0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testMuteLong0006 begin');
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) {
        await mute.click();
      } else {
        await unmute.click();
      }
      await delay(400);
      const toggledMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const toggledUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(toggledMute !== null || toggledUnmute !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testMuteLong0006 end');
    })

    /**
     * @tc.name   testMuteLong0007
     * @tc.number MOVING_PHOTO_VIEW_MUTE_LONG_0007
     * @tc.desc   Test mute state toggle, long matrix case 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteLong0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testMuteLong0007 begin');
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) {
        await mute.click();
      } else {
        await unmute.click();
      }
      await delay(400);
      const toggledMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const toggledUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(toggledMute !== null || toggledUnmute !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testMuteLong0007 end');
    })

    /**
     * @tc.name   testMuteLong0008
     * @tc.number MOVING_PHOTO_VIEW_MUTE_LONG_0008
     * @tc.desc   Test mute state toggle, long matrix case 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteLong0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testMuteLong0008 begin');
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) {
        await mute.click();
      } else {
        await unmute.click();
      }
      await delay(400);
      const toggledMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const toggledUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(toggledMute !== null || toggledUnmute !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testMuteLong0008 end');
    })

    /**
     * @tc.name   testMuteLong0009
     * @tc.number MOVING_PHOTO_VIEW_MUTE_LONG_0009
     * @tc.desc   Test mute state toggle, long matrix case 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteLong0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testMuteLong0009 begin');
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) {
        await mute.click();
      } else {
        await unmute.click();
      }
      await delay(400);
      const toggledMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const toggledUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(toggledMute !== null || toggledUnmute !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testMuteLong0009 end');
    })

    /**
     * @tc.name   testMuteLong0010
     * @tc.number MOVING_PHOTO_VIEW_MUTE_LONG_0010
     * @tc.desc   Test mute state toggle, long matrix case 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteLong0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testMuteLong0010 begin');
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) {
        await mute.click();
      } else {
        await unmute.click();
      }
      await delay(400);
      const toggledMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const toggledUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(toggledMute !== null || toggledUnmute !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testMuteLong0010 end');
    })

    /**
     * @tc.name   testMuteLong0011
     * @tc.number MOVING_PHOTO_VIEW_MUTE_LONG_0011
     * @tc.desc   Test mute state toggle, long matrix case 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteLong0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testMuteLong0011 begin');
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) {
        await mute.click();
      } else {
        await unmute.click();
      }
      await delay(400);
      const toggledMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const toggledUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(toggledMute !== null || toggledUnmute !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testMuteLong0011 end');
    })

    /**
     * @tc.name   testMuteLong0012
     * @tc.number MOVING_PHOTO_VIEW_MUTE_LONG_0012
     * @tc.desc   Test mute state toggle, long matrix case 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteLong0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testMuteLong0012 begin');
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) {
        await mute.click();
      } else {
        await unmute.click();
      }
      await delay(400);
      const toggledMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const toggledUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(toggledMute !== null || toggledUnmute !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testMuteLong0012 end');
    })

    /**
     * @tc.name   testMuteLong0013
     * @tc.number MOVING_PHOTO_VIEW_MUTE_LONG_0013
     * @tc.desc   Test mute state toggle, long matrix case 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteLong0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testMuteLong0013 begin');
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) {
        await mute.click();
      } else {
        await unmute.click();
      }
      await delay(400);
      const toggledMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const toggledUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(toggledMute !== null || toggledUnmute !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testMuteLong0013 end');
    })

    /**
     * @tc.name   testMuteLong0014
     * @tc.number MOVING_PHOTO_VIEW_MUTE_LONG_0014
     * @tc.desc   Test mute state toggle, long matrix case 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteLong0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testMuteLong0014 begin');
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) {
        await mute.click();
      } else {
        await unmute.click();
      }
      await delay(400);
      const toggledMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const toggledUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(toggledMute !== null || toggledUnmute !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testMuteLong0014 end');
    })

    /**
     * @tc.name   testMuteLong0015
     * @tc.number MOVING_PHOTO_VIEW_MUTE_LONG_0015
     * @tc.desc   Test mute state toggle, long matrix case 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteLong0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testMuteLong0015 begin');
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) {
        await mute.click();
      } else {
        await unmute.click();
      }
      await delay(400);
      const toggledMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const toggledUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(toggledMute !== null || toggledUnmute !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testMuteLong0015 end');
    })

    /**
     * @tc.name   testMuteLong0016
     * @tc.number MOVING_PHOTO_VIEW_MUTE_LONG_0016
     * @tc.desc   Test mute state toggle, long matrix case 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteLong0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testMuteLong0016 begin');
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) {
        await mute.click();
      } else {
        await unmute.click();
      }
      await delay(400);
      const toggledMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const toggledUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(toggledMute !== null || toggledUnmute !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testMuteLong0016 end');
    })

    /**
     * @tc.name   testMuteLong0017
     * @tc.number MOVING_PHOTO_VIEW_MUTE_LONG_0017
     * @tc.desc   Test mute state toggle, long matrix case 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteLong0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testMuteLong0017 begin');
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) {
        await mute.click();
      } else {
        await unmute.click();
      }
      await delay(400);
      const toggledMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const toggledUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(toggledMute !== null || toggledUnmute !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testMuteLong0017 end');
    })

    /**
     * @tc.name   testMuteLong0018
     * @tc.number MOVING_PHOTO_VIEW_MUTE_LONG_0018
     * @tc.desc   Test mute state toggle, long matrix case 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteLong0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testMuteLong0018 begin');
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) {
        await mute.click();
      } else {
        await unmute.click();
      }
      await delay(400);
      const toggledMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const toggledUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(toggledMute !== null || toggledUnmute !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testMuteLong0018 end');
    })

    /**
     * @tc.name   testMuteLong0019
     * @tc.number MOVING_PHOTO_VIEW_MUTE_LONG_0019
     * @tc.desc   Test mute state toggle, long matrix case 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteLong0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testMuteLong0019 begin');
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) {
        await mute.click();
      } else {
        await unmute.click();
      }
      await delay(400);
      const toggledMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const toggledUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(toggledMute !== null || toggledUnmute !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testMuteLong0019 end');
    })

    /**
     * @tc.name   testMuteLong0020
     * @tc.number MOVING_PHOTO_VIEW_MUTE_LONG_0020
     * @tc.desc   Test mute state toggle, long matrix case 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteLong0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testMuteLong0020 begin');
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) {
        await mute.click();
      } else {
        await unmute.click();
      }
      await delay(400);
      const toggledMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const toggledUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(toggledMute !== null || toggledUnmute !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testMuteLong0020 end');
    })

    /**
     * @tc.name   testMuteLong0021
     * @tc.number MOVING_PHOTO_VIEW_MUTE_LONG_0021
     * @tc.desc   Test mute state toggle, long matrix case 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteLong0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testMuteLong0021 begin');
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) {
        await mute.click();
      } else {
        await unmute.click();
      }
      await delay(400);
      const toggledMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const toggledUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(toggledMute !== null || toggledUnmute !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testMuteLong0021 end');
    })

    /**
     * @tc.name   testMuteLong0022
     * @tc.number MOVING_PHOTO_VIEW_MUTE_LONG_0022
     * @tc.desc   Test mute state toggle, long matrix case 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteLong0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testMuteLong0022 begin');
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) {
        await mute.click();
      } else {
        await unmute.click();
      }
      await delay(400);
      const toggledMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const toggledUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(toggledMute !== null || toggledUnmute !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testMuteLong0022 end');
    })

    /**
     * @tc.name   testMuteLong0023
     * @tc.number MOVING_PHOTO_VIEW_MUTE_LONG_0023
     * @tc.desc   Test mute state toggle, long matrix case 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteLong0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testMuteLong0023 begin');
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) {
        await mute.click();
      } else {
        await unmute.click();
      }
      await delay(400);
      const toggledMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const toggledUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(toggledMute !== null || toggledUnmute !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testMuteLong0023 end');
    })

    /**
     * @tc.name   testMuteLong0024
     * @tc.number MOVING_PHOTO_VIEW_MUTE_LONG_0024
     * @tc.desc   Test mute state toggle, long matrix case 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteLong0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testMuteLong0024 begin');
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) {
        await mute.click();
      } else {
        await unmute.click();
      }
      await delay(400);
      const toggledMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const toggledUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(toggledMute !== null || toggledUnmute !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testMuteLong0024 end');
    })

    /**
     * @tc.name   testMuteLong0025
     * @tc.number MOVING_PHOTO_VIEW_MUTE_LONG_0025
     * @tc.desc   Test mute state toggle, long matrix case 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteLong0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testMuteLong0025 begin');
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) {
        await mute.click();
      } else {
        await unmute.click();
      }
      await delay(400);
      const toggledMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const toggledUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(toggledMute !== null || toggledUnmute !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testMuteLong0025 end');
    })

    /**
     * @tc.name   testMuteLong0026
     * @tc.number MOVING_PHOTO_VIEW_MUTE_LONG_0026
     * @tc.desc   Test mute state toggle, long matrix case 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteLong0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testMuteLong0026 begin');
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) {
        await mute.click();
      } else {
        await unmute.click();
      }
      await delay(400);
      const toggledMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const toggledUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(toggledMute !== null || toggledUnmute !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testMuteLong0026 end');
    })

    /**
     * @tc.name   testMuteLong0027
     * @tc.number MOVING_PHOTO_VIEW_MUTE_LONG_0027
     * @tc.desc   Test mute state toggle, long matrix case 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteLong0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testMuteLong0027 begin');
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) {
        await mute.click();
      } else {
        await unmute.click();
      }
      await delay(400);
      const toggledMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const toggledUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(toggledMute !== null || toggledUnmute !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testMuteLong0027 end');
    })

    /**
     * @tc.name   testMuteLong0028
     * @tc.number MOVING_PHOTO_VIEW_MUTE_LONG_0028
     * @tc.desc   Test mute state toggle, long matrix case 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteLong0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testMuteLong0028 begin');
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) {
        await mute.click();
      } else {
        await unmute.click();
      }
      await delay(400);
      const toggledMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const toggledUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(toggledMute !== null || toggledUnmute !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testMuteLong0028 end');
    })

    /**
     * @tc.name   testMuteLong0029
     * @tc.number MOVING_PHOTO_VIEW_MUTE_LONG_0029
     * @tc.desc   Test mute state toggle, long matrix case 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteLong0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testMuteLong0029 begin');
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) {
        await mute.click();
      } else {
        await unmute.click();
      }
      await delay(400);
      const toggledMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const toggledUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(toggledMute !== null || toggledUnmute !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testMuteLong0029 end');
    })

    /**
     * @tc.name   testMuteLong0030
     * @tc.number MOVING_PHOTO_VIEW_MUTE_LONG_0030
     * @tc.desc   Test mute state toggle, long matrix case 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteLong0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testMuteLong0030 begin');
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) {
        await mute.click();
      } else {
        await unmute.click();
      }
      await delay(400);
      const toggledMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const toggledUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(toggledMute !== null || toggledUnmute !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testMuteLong0030 end');
    })

    /**
     * @tc.name   testMuteLong0031
     * @tc.number MOVING_PHOTO_VIEW_MUTE_LONG_0031
     * @tc.desc   Test mute state toggle, long matrix case 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteLong0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testMuteLong0031 begin');
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) {
        await mute.click();
      } else {
        await unmute.click();
      }
      await delay(400);
      const toggledMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const toggledUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(toggledMute !== null || toggledUnmute !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testMuteLong0031 end');
    })

    /**
     * @tc.name   testMuteLong0032
     * @tc.number MOVING_PHOTO_VIEW_MUTE_LONG_0032
     * @tc.desc   Test mute state toggle, long matrix case 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteLong0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testMuteLong0032 begin');
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) {
        await mute.click();
      } else {
        await unmute.click();
      }
      await delay(400);
      const toggledMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const toggledUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(toggledMute !== null || toggledUnmute !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testMuteLong0032 end');
    })

    /**
     * @tc.name   testMuteLong0033
     * @tc.number MOVING_PHOTO_VIEW_MUTE_LONG_0033
     * @tc.desc   Test mute state toggle, long matrix case 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteLong0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testMuteLong0033 begin');
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) {
        await mute.click();
      } else {
        await unmute.click();
      }
      await delay(400);
      const toggledMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const toggledUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(toggledMute !== null || toggledUnmute !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testMuteLong0033 end');
    })

    /**
     * @tc.name   testMuteLong0034
     * @tc.number MOVING_PHOTO_VIEW_MUTE_LONG_0034
     * @tc.desc   Test mute state toggle, long matrix case 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteLong0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testMuteLong0034 begin');
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) {
        await mute.click();
      } else {
        await unmute.click();
      }
      await delay(400);
      const toggledMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const toggledUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(toggledMute !== null || toggledUnmute !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testMuteLong0034 end');
    })

    /**
     * @tc.name   testMuteLong0035
     * @tc.number MOVING_PHOTO_VIEW_MUTE_LONG_0035
     * @tc.desc   Test mute state toggle, long matrix case 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteLong0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testMuteLong0035 begin');
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) {
        await mute.click();
      } else {
        await unmute.click();
      }
      await delay(400);
      const toggledMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const toggledUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(toggledMute !== null || toggledUnmute !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testMuteLong0035 end');
    })

    /**
     * @tc.name   testMuteLong0036
     * @tc.number MOVING_PHOTO_VIEW_MUTE_LONG_0036
     * @tc.desc   Test mute state toggle, long matrix case 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteLong0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testMuteLong0036 begin');
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) {
        await mute.click();
      } else {
        await unmute.click();
      }
      await delay(400);
      const toggledMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const toggledUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(toggledMute !== null || toggledUnmute !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testMuteLong0036 end');
    })

    /**
     * @tc.name   testMuteLong0037
     * @tc.number MOVING_PHOTO_VIEW_MUTE_LONG_0037
     * @tc.desc   Test mute state toggle, long matrix case 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteLong0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testMuteLong0037 begin');
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) {
        await mute.click();
      } else {
        await unmute.click();
      }
      await delay(400);
      const toggledMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const toggledUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(toggledMute !== null || toggledUnmute !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testMuteLong0037 end');
    })

    /**
     * @tc.name   testMuteLong0038
     * @tc.number MOVING_PHOTO_VIEW_MUTE_LONG_0038
     * @tc.desc   Test mute state toggle, long matrix case 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteLong0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testMuteLong0038 begin');
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) {
        await mute.click();
      } else {
        await unmute.click();
      }
      await delay(400);
      const toggledMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const toggledUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(toggledMute !== null || toggledUnmute !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testMuteLong0038 end');
    })

    /**
     * @tc.name   testMuteLong0039
     * @tc.number MOVING_PHOTO_VIEW_MUTE_LONG_0039
     * @tc.desc   Test mute state toggle, long matrix case 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteLong0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testMuteLong0039 begin');
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) {
        await mute.click();
      } else {
        await unmute.click();
      }
      await delay(400);
      const toggledMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const toggledUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(toggledMute !== null || toggledUnmute !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testMuteLong0039 end');
    })

    /**
     * @tc.name   testMuteLong0040
     * @tc.number MOVING_PHOTO_VIEW_MUTE_LONG_0040
     * @tc.desc   Test mute state toggle, long matrix case 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuteLong0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testMuteLong0040 begin');
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) {
        await mute.click();
      } else {
        await unmute.click();
      }
      await delay(400);
      const toggledMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const toggledUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(toggledMute !== null || toggledUnmute !== null).assertTrue();
      hilog.info(DOMAIN, TAG, 'testMuteLong0040 end');
    })
  })
}
