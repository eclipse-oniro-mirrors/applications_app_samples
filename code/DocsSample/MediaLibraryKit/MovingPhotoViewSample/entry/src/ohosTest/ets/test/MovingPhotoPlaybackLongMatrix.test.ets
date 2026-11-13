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
const PLAYING_TEXT: string = '开始播放';
const STOPPED_TEXT: string = '停止播放';
const MUTE_TEXT: string = 'Mute';
const UNMUTE_TEXT: string = 'Unmute';
const DELEGATOR = abilityDelegatorRegistry.getAbilityDelegator();

function delay(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(() => {
      resolve();
    }, ms);
  });
}

export default function movingPhotoPlaybackLongMatrixTest() {
  describe('MovingPhotoPlaybackLongMatrixTest', () => {
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
     * @tc.name   testPlaybackLong0001
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_LONG_0001
     * @tc.desc   Test playback start matrix. Long matrix case 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackLong0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0001 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(300);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click();
      await delay(700);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0001 end');
    })

    /**
     * @tc.name   testPlaybackLong0002
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_LONG_0002
     * @tc.desc   Test playback stop matrix. Long matrix case 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackLong0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0002 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(700);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0002 end');
    })

    /**
     * @tc.name   testPlaybackLong0003
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_LONG_0003
     * @tc.desc   Test playback start matrix. Long matrix case 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackLong0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0003 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(300);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click();
      await delay(700);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0003 end');
    })

    /**
     * @tc.name   testPlaybackLong0004
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_LONG_0004
     * @tc.desc   Test playback stop matrix. Long matrix case 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackLong0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0004 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(700);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0004 end');
    })

    /**
     * @tc.name   testPlaybackLong0005
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_LONG_0005
     * @tc.desc   Test playback start matrix. Long matrix case 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackLong0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0005 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(300);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click();
      await delay(700);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0005 end');
    })

    /**
     * @tc.name   testPlaybackLong0006
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_LONG_0006
     * @tc.desc   Test playback stop matrix. Long matrix case 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackLong0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0006 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(700);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0006 end');
    })

    /**
     * @tc.name   testPlaybackLong0007
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_LONG_0007
     * @tc.desc   Test playback start matrix. Long matrix case 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackLong0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0007 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(300);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click();
      await delay(700);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0007 end');
    })

    /**
     * @tc.name   testPlaybackLong0008
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_LONG_0008
     * @tc.desc   Test playback stop matrix. Long matrix case 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackLong0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0008 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(700);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0008 end');
    })

    /**
     * @tc.name   testPlaybackLong0009
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_LONG_0009
     * @tc.desc   Test playback start matrix. Long matrix case 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackLong0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0009 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(300);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click();
      await delay(700);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0009 end');
    })

    /**
     * @tc.name   testPlaybackLong0010
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_LONG_0010
     * @tc.desc   Test playback stop matrix. Long matrix case 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackLong0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0010 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(700);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0010 end');
    })

    /**
     * @tc.name   testPlaybackLong0011
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_LONG_0011
     * @tc.desc   Test playback start matrix. Long matrix case 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackLong0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0011 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(300);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click();
      await delay(700);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0011 end');
    })

    /**
     * @tc.name   testPlaybackLong0012
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_LONG_0012
     * @tc.desc   Test playback stop matrix. Long matrix case 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackLong0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0012 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(700);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0012 end');
    })

    /**
     * @tc.name   testPlaybackLong0013
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_LONG_0013
     * @tc.desc   Test playback start matrix. Long matrix case 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackLong0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0013 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(300);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click();
      await delay(700);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0013 end');
    })

    /**
     * @tc.name   testPlaybackLong0014
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_LONG_0014
     * @tc.desc   Test playback stop matrix. Long matrix case 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackLong0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0014 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(700);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0014 end');
    })

    /**
     * @tc.name   testPlaybackLong0015
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_LONG_0015
     * @tc.desc   Test playback start matrix. Long matrix case 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackLong0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0015 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(300);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click();
      await delay(700);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0015 end');
    })

    /**
     * @tc.name   testPlaybackLong0016
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_LONG_0016
     * @tc.desc   Test playback stop matrix. Long matrix case 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackLong0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0016 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(700);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0016 end');
    })

    /**
     * @tc.name   testPlaybackLong0017
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_LONG_0017
     * @tc.desc   Test playback start matrix. Long matrix case 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackLong0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0017 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(300);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click();
      await delay(700);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0017 end');
    })

    /**
     * @tc.name   testPlaybackLong0018
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_LONG_0018
     * @tc.desc   Test playback stop matrix. Long matrix case 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackLong0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0018 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(700);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0018 end');
    })

    /**
     * @tc.name   testPlaybackLong0019
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_LONG_0019
     * @tc.desc   Test playback start matrix. Long matrix case 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackLong0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0019 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(300);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click();
      await delay(700);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0019 end');
    })

    /**
     * @tc.name   testPlaybackLong0020
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_LONG_0020
     * @tc.desc   Test playback stop matrix. Long matrix case 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackLong0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0020 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(700);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0020 end');
    })

    /**
     * @tc.name   testPlaybackLong0021
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_LONG_0021
     * @tc.desc   Test playback start matrix. Long matrix case 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackLong0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0021 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(300);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click();
      await delay(700);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0021 end');
    })

    /**
     * @tc.name   testPlaybackLong0022
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_LONG_0022
     * @tc.desc   Test playback stop matrix. Long matrix case 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackLong0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0022 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(700);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0022 end');
    })

    /**
     * @tc.name   testPlaybackLong0023
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_LONG_0023
     * @tc.desc   Test playback start matrix. Long matrix case 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackLong0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0023 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(300);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click();
      await delay(700);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0023 end');
    })

    /**
     * @tc.name   testPlaybackLong0024
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_LONG_0024
     * @tc.desc   Test playback stop matrix. Long matrix case 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackLong0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0024 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(700);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0024 end');
    })

    /**
     * @tc.name   testPlaybackLong0025
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_LONG_0025
     * @tc.desc   Test playback start matrix. Long matrix case 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackLong0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0025 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(300);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click();
      await delay(700);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0025 end');
    })

    /**
     * @tc.name   testPlaybackLong0026
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_LONG_0026
     * @tc.desc   Test playback stop matrix. Long matrix case 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackLong0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0026 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(700);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0026 end');
    })

    /**
     * @tc.name   testPlaybackLong0027
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_LONG_0027
     * @tc.desc   Test playback start matrix. Long matrix case 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackLong0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0027 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(300);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click();
      await delay(700);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0027 end');
    })

    /**
     * @tc.name   testPlaybackLong0028
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_LONG_0028
     * @tc.desc   Test playback stop matrix. Long matrix case 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackLong0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0028 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(700);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0028 end');
    })

    /**
     * @tc.name   testPlaybackLong0029
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_LONG_0029
     * @tc.desc   Test playback start matrix. Long matrix case 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackLong0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0029 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(300);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click();
      await delay(700);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0029 end');
    })

    /**
     * @tc.name   testPlaybackLong0030
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_LONG_0030
     * @tc.desc   Test playback stop matrix. Long matrix case 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackLong0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0030 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(700);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0030 end');
    })

    /**
     * @tc.name   testPlaybackLong0031
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_LONG_0031
     * @tc.desc   Test playback start matrix. Long matrix case 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackLong0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0031 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(300);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click();
      await delay(700);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0031 end');
    })

    /**
     * @tc.name   testPlaybackLong0032
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_LONG_0032
     * @tc.desc   Test playback stop matrix. Long matrix case 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackLong0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0032 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(700);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0032 end');
    })

    /**
     * @tc.name   testPlaybackLong0033
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_LONG_0033
     * @tc.desc   Test playback start matrix. Long matrix case 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackLong0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0033 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(300);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click();
      await delay(700);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0033 end');
    })

    /**
     * @tc.name   testPlaybackLong0034
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_LONG_0034
     * @tc.desc   Test playback stop matrix. Long matrix case 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackLong0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0034 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(700);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0034 end');
    })

    /**
     * @tc.name   testPlaybackLong0035
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_LONG_0035
     * @tc.desc   Test playback start matrix. Long matrix case 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackLong0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0035 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(300);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click();
      await delay(700);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0035 end');
    })

    /**
     * @tc.name   testPlaybackLong0036
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_LONG_0036
     * @tc.desc   Test playback stop matrix. Long matrix case 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackLong0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0036 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(700);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0036 end');
    })

    /**
     * @tc.name   testPlaybackLong0037
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_LONG_0037
     * @tc.desc   Test playback start matrix. Long matrix case 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackLong0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0037 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(300);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click();
      await delay(700);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0037 end');
    })

    /**
     * @tc.name   testPlaybackLong0038
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_LONG_0038
     * @tc.desc   Test playback stop matrix. Long matrix case 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackLong0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0038 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(700);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0038 end');
    })

    /**
     * @tc.name   testPlaybackLong0039
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_LONG_0039
     * @tc.desc   Test playback start matrix. Long matrix case 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackLong0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0039 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(300);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click();
      await delay(700);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0039 end');
    })

    /**
     * @tc.name   testPlaybackLong0040
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_LONG_0040
     * @tc.desc   Test playback stop matrix. Long matrix case 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackLong0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0040 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(700);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0040 end');
    })

    /**
     * @tc.name   testPlaybackLong0041
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_LONG_0041
     * @tc.desc   Test playback start matrix. Long matrix case 41.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackLong0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0041 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(300);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click();
      await delay(700);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0041 end');
    })

    /**
     * @tc.name   testPlaybackLong0042
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_LONG_0042
     * @tc.desc   Test playback stop matrix. Long matrix case 42.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackLong0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0042 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(700);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0042 end');
    })

    /**
     * @tc.name   testPlaybackLong0043
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_LONG_0043
     * @tc.desc   Test playback start matrix. Long matrix case 43.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackLong0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0043 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(300);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click();
      await delay(700);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0043 end');
    })

    /**
     * @tc.name   testPlaybackLong0044
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_LONG_0044
     * @tc.desc   Test playback stop matrix. Long matrix case 44.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackLong0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0044 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(700);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0044 end');
    })

    /**
     * @tc.name   testPlaybackLong0045
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_LONG_0045
     * @tc.desc   Test playback start matrix. Long matrix case 45.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackLong0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0045 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(300);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click();
      await delay(700);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0045 end');
    })

    /**
     * @tc.name   testPlaybackLong0046
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_LONG_0046
     * @tc.desc   Test playback stop matrix. Long matrix case 46.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackLong0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0046 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(700);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0046 end');
    })

    /**
     * @tc.name   testPlaybackLong0047
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_LONG_0047
     * @tc.desc   Test playback start matrix. Long matrix case 47.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackLong0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0047 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(300);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click();
      await delay(700);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0047 end');
    })

    /**
     * @tc.name   testPlaybackLong0048
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_LONG_0048
     * @tc.desc   Test playback stop matrix. Long matrix case 48.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackLong0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0048 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(700);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0048 end');
    })

    /**
     * @tc.name   testPlaybackLong0049
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_LONG_0049
     * @tc.desc   Test playback start matrix. Long matrix case 49.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackLong0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0049 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(300);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click();
      await delay(700);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0049 end');
    })

    /**
     * @tc.name   testPlaybackLong0050
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_LONG_0050
     * @tc.desc   Test playback stop matrix. Long matrix case 50.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackLong0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0050 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(700);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0050 end');
    })

    /**
     * @tc.name   testPlaybackLong0051
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_LONG_0051
     * @tc.desc   Test playback start matrix. Long matrix case 51.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackLong0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0051 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(300);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click();
      await delay(700);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0051 end');
    })

    /**
     * @tc.name   testPlaybackLong0052
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_LONG_0052
     * @tc.desc   Test playback stop matrix. Long matrix case 52.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackLong0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0052 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(700);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0052 end');
    })

    /**
     * @tc.name   testPlaybackLong0053
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_LONG_0053
     * @tc.desc   Test playback start matrix. Long matrix case 53.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackLong0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0053 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(300);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click();
      await delay(700);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0053 end');
    })

    /**
     * @tc.name   testPlaybackLong0054
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_LONG_0054
     * @tc.desc   Test playback stop matrix. Long matrix case 54.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackLong0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0054 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(700);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0054 end');
    })

    /**
     * @tc.name   testPlaybackLong0055
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_LONG_0055
     * @tc.desc   Test playback start matrix. Long matrix case 55.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackLong0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0055 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(300);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click();
      await delay(700);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0055 end');
    })

    /**
     * @tc.name   testPlaybackLong0056
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_LONG_0056
     * @tc.desc   Test playback stop matrix. Long matrix case 56.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackLong0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0056 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(700);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0056 end');
    })

    /**
     * @tc.name   testPlaybackLong0057
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_LONG_0057
     * @tc.desc   Test playback start matrix. Long matrix case 57.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackLong0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0057 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(300);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click();
      await delay(700);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0057 end');
    })

    /**
     * @tc.name   testPlaybackLong0058
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_LONG_0058
     * @tc.desc   Test playback stop matrix. Long matrix case 58.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackLong0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0058 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(700);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0058 end');
    })

    /**
     * @tc.name   testPlaybackLong0059
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_LONG_0059
     * @tc.desc   Test playback start matrix. Long matrix case 59.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackLong0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0059 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(300);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click();
      await delay(700);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0059 end');
    })

    /**
     * @tc.name   testPlaybackLong0060
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_LONG_0060
     * @tc.desc   Test playback stop matrix. Long matrix case 60.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackLong0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0060 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(700);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackLong0060 end');
    })
  })
}
