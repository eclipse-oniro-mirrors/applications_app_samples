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
const TAG: string = '[Sample_MovingPhotoView_PlaybackMatrix]';
const BUNDLE_NAME: string = 'com.example.movingphotoviewsample';
const ENTRY_ABILITY: string = 'EntryAbility';
const PLAY_TEXT: string = 'PLAY';
const STOP_TEXT: string = 'STOP';
const PLAYING_TEXT: string = '开始播放';
const STOPPED_TEXT: string = '停止播放';
const DELEGATOR = abilityDelegatorRegistry.getAbilityDelegator();

function delay(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(() => {
      resolve();
    }, ms);
  });
}

export default function movingPhotoPlaybackMatrixTest() {
  describe('MovingPhotoPlaybackMatrixTest', () => {
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
     * @tc.name   testPlaybackMatrix0001
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_0001
     * @tc.desc   Test that the PLAY action reports the started message. Matrix case 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackMatrix0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackMatrix0001 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(300);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click();
      await delay(700);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackMatrix0001 end');
    })

    /**
     * @tc.name   testPlaybackMatrix0002
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_0002
     * @tc.desc   Test that the STOP action reports the stopped message. Matrix case 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackMatrix0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackMatrix0002 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(700);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackMatrix0002 end');
    })

    /**
     * @tc.name   testPlaybackMatrix0003
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_0003
     * @tc.desc   Test that the PLAY action reports the started message. Matrix case 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackMatrix0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackMatrix0003 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(300);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click();
      await delay(700);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackMatrix0003 end');
    })

    /**
     * @tc.name   testPlaybackMatrix0004
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_0004
     * @tc.desc   Test that the STOP action reports the stopped message. Matrix case 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackMatrix0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackMatrix0004 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(700);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackMatrix0004 end');
    })

    /**
     * @tc.name   testPlaybackMatrix0005
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_0005
     * @tc.desc   Test that the PLAY action reports the started message. Matrix case 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackMatrix0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackMatrix0005 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(300);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click();
      await delay(700);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackMatrix0005 end');
    })

    /**
     * @tc.name   testPlaybackMatrix0006
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_0006
     * @tc.desc   Test that the STOP action reports the stopped message. Matrix case 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackMatrix0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackMatrix0006 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(700);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackMatrix0006 end');
    })

    /**
     * @tc.name   testPlaybackMatrix0007
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_0007
     * @tc.desc   Test that the PLAY action reports the started message. Matrix case 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackMatrix0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackMatrix0007 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(300);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click();
      await delay(700);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackMatrix0007 end');
    })

    /**
     * @tc.name   testPlaybackMatrix0008
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_0008
     * @tc.desc   Test that the STOP action reports the stopped message. Matrix case 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackMatrix0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackMatrix0008 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(700);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackMatrix0008 end');
    })

    /**
     * @tc.name   testPlaybackMatrix0009
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_0009
     * @tc.desc   Test that the PLAY action reports the started message. Matrix case 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackMatrix0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackMatrix0009 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(300);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click();
      await delay(700);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackMatrix0009 end');
    })

    /**
     * @tc.name   testPlaybackMatrix0010
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_0010
     * @tc.desc   Test that the STOP action reports the stopped message. Matrix case 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackMatrix0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackMatrix0010 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(700);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackMatrix0010 end');
    })

    /**
     * @tc.name   testPlaybackMatrix0011
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_0011
     * @tc.desc   Test that the PLAY action reports the started message. Matrix case 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackMatrix0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackMatrix0011 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(300);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click();
      await delay(700);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackMatrix0011 end');
    })

    /**
     * @tc.name   testPlaybackMatrix0012
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_0012
     * @tc.desc   Test that the STOP action reports the stopped message. Matrix case 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackMatrix0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackMatrix0012 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(700);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackMatrix0012 end');
    })

    /**
     * @tc.name   testPlaybackMatrix0013
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_0013
     * @tc.desc   Test that the PLAY action reports the started message. Matrix case 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackMatrix0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackMatrix0013 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(300);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click();
      await delay(700);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackMatrix0013 end');
    })

    /**
     * @tc.name   testPlaybackMatrix0014
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_0014
     * @tc.desc   Test that the STOP action reports the stopped message. Matrix case 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackMatrix0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackMatrix0014 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(700);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackMatrix0014 end');
    })

    /**
     * @tc.name   testPlaybackMatrix0015
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_0015
     * @tc.desc   Test that the PLAY action reports the started message. Matrix case 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackMatrix0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackMatrix0015 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(300);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click();
      await delay(700);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackMatrix0015 end');
    })

    /**
     * @tc.name   testPlaybackMatrix0016
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_0016
     * @tc.desc   Test that the STOP action reports the stopped message. Matrix case 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackMatrix0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackMatrix0016 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(700);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackMatrix0016 end');
    })

    /**
     * @tc.name   testPlaybackMatrix0017
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_0017
     * @tc.desc   Test that the PLAY action reports the started message. Matrix case 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackMatrix0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackMatrix0017 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(300);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click();
      await delay(700);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackMatrix0017 end');
    })

    /**
     * @tc.name   testPlaybackMatrix0018
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_0018
     * @tc.desc   Test that the STOP action reports the stopped message. Matrix case 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackMatrix0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackMatrix0018 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(700);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackMatrix0018 end');
    })

    /**
     * @tc.name   testPlaybackMatrix0019
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_0019
     * @tc.desc   Test that the PLAY action reports the started message. Matrix case 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackMatrix0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackMatrix0019 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(300);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click();
      await delay(700);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackMatrix0019 end');
    })

    /**
     * @tc.name   testPlaybackMatrix0020
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_0020
     * @tc.desc   Test that the STOP action reports the stopped message. Matrix case 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackMatrix0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackMatrix0020 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(700);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackMatrix0020 end');
    })

    /**
     * @tc.name   testPlaybackMatrix0021
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_0021
     * @tc.desc   Test that the PLAY action reports the started message. Matrix case 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackMatrix0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackMatrix0021 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(300);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click();
      await delay(700);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackMatrix0021 end');
    })

    /**
     * @tc.name   testPlaybackMatrix0022
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_0022
     * @tc.desc   Test that the STOP action reports the stopped message. Matrix case 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackMatrix0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackMatrix0022 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(700);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackMatrix0022 end');
    })

    /**
     * @tc.name   testPlaybackMatrix0023
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_0023
     * @tc.desc   Test that the PLAY action reports the started message. Matrix case 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackMatrix0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackMatrix0023 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(300);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click();
      await delay(700);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackMatrix0023 end');
    })

    /**
     * @tc.name   testPlaybackMatrix0024
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_0024
     * @tc.desc   Test that the STOP action reports the stopped message. Matrix case 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackMatrix0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackMatrix0024 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(700);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackMatrix0024 end');
    })

    /**
     * @tc.name   testPlaybackMatrix0025
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_0025
     * @tc.desc   Test that the PLAY action reports the started message. Matrix case 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackMatrix0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackMatrix0025 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(300);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click();
      await delay(700);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackMatrix0025 end');
    })

    /**
     * @tc.name   testPlaybackMatrix0026
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_0026
     * @tc.desc   Test that the STOP action reports the stopped message. Matrix case 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackMatrix0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackMatrix0026 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(700);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackMatrix0026 end');
    })

    /**
     * @tc.name   testPlaybackMatrix0027
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_0027
     * @tc.desc   Test that the PLAY action reports the started message. Matrix case 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackMatrix0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackMatrix0027 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(300);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click();
      await delay(700);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackMatrix0027 end');
    })

    /**
     * @tc.name   testPlaybackMatrix0028
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_0028
     * @tc.desc   Test that the STOP action reports the stopped message. Matrix case 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackMatrix0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackMatrix0028 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(700);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackMatrix0028 end');
    })

    /**
     * @tc.name   testPlaybackMatrix0029
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_0029
     * @tc.desc   Test that the PLAY action reports the started message. Matrix case 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackMatrix0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackMatrix0029 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(300);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click();
      await delay(700);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackMatrix0029 end');
    })

    /**
     * @tc.name   testPlaybackMatrix0030
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_0030
     * @tc.desc   Test that the STOP action reports the stopped message. Matrix case 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackMatrix0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackMatrix0030 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(700);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackMatrix0030 end');
    })

    /**
     * @tc.name   testPlaybackMatrix0031
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_0031
     * @tc.desc   Test that the PLAY action reports the started message. Matrix case 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackMatrix0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackMatrix0031 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(300);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click();
      await delay(700);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackMatrix0031 end');
    })

    /**
     * @tc.name   testPlaybackMatrix0032
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_0032
     * @tc.desc   Test that the STOP action reports the stopped message. Matrix case 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackMatrix0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackMatrix0032 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(700);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackMatrix0032 end');
    })

    /**
     * @tc.name   testPlaybackMatrix0033
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_0033
     * @tc.desc   Test that the PLAY action reports the started message. Matrix case 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackMatrix0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackMatrix0033 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(300);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click();
      await delay(700);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackMatrix0033 end');
    })

    /**
     * @tc.name   testPlaybackMatrix0034
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_0034
     * @tc.desc   Test that the STOP action reports the stopped message. Matrix case 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackMatrix0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackMatrix0034 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(700);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackMatrix0034 end');
    })

    /**
     * @tc.name   testPlaybackMatrix0035
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_0035
     * @tc.desc   Test that the PLAY action reports the started message. Matrix case 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackMatrix0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackMatrix0035 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(300);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click();
      await delay(700);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackMatrix0035 end');
    })

    /**
     * @tc.name   testPlaybackMatrix0036
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_0036
     * @tc.desc   Test that the STOP action reports the stopped message. Matrix case 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackMatrix0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackMatrix0036 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(700);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackMatrix0036 end');
    })

    /**
     * @tc.name   testPlaybackMatrix0037
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_0037
     * @tc.desc   Test that the PLAY action reports the started message. Matrix case 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackMatrix0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackMatrix0037 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(300);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click();
      await delay(700);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackMatrix0037 end');
    })

    /**
     * @tc.name   testPlaybackMatrix0038
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_0038
     * @tc.desc   Test that the STOP action reports the stopped message. Matrix case 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackMatrix0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackMatrix0038 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(700);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackMatrix0038 end');
    })

    /**
     * @tc.name   testPlaybackMatrix0039
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_0039
     * @tc.desc   Test that the PLAY action reports the started message. Matrix case 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackMatrix0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackMatrix0039 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(300);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click();
      await delay(700);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackMatrix0039 end');
    })

    /**
     * @tc.name   testPlaybackMatrix0040
     * @tc.number MOVING_PHOTO_VIEW_PLAYBACK_0040
     * @tc.desc   Test that the STOP action reports the stopped message. Matrix case 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackMatrix0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testPlaybackMatrix0040 begin');
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(700);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
      hilog.info(DOMAIN, TAG, 'testPlaybackMatrix0040 end');
    })
  })
}
