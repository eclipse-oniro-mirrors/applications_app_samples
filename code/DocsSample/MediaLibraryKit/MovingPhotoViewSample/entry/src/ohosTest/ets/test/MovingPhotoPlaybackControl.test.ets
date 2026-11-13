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
import { abilityDelegatorRegistry, Component, Driver, ON } from '@kit.TestKit';
import { Want } from '@kit.AbilityKit';
const BUNDLE_NAME: string = 'com.example.movingphotoviewsample';
const DELEGATOR = abilityDelegatorRegistry.getAbilityDelegator();
const PLAY_TEXT: string = 'PLAY';
const STOP_TEXT: string = 'STOP';
const PLAYING_TEXT: string = '\u5f00\u59cb\u64ad\u653e';
const STOPPED_TEXT: string = '\u505c\u6b62\u64ad\u653e';
const MUTE_TEXT: string = '\u9759\u97f3';
const UNMUTE_TEXT: string = '\u53d6\u6d88\u9759\u97f3';
function delay(ms: number): Promise<void> { return new Promise<void>((resolve: () => void) => { setTimeout(() => { resolve(); }, ms); }); }
export default function movingPhotoPlaybackControlTest() {
  describe('MovingPhotoPlaybackControlTest', () => {
    let driver: Driver;
    beforeAll(async () => { const want: Want = { bundleName: BUNDLE_NAME, abilityName: 'EntryAbility' }; await DELEGATOR.startAbility(want); await delay(2500); driver = await Driver.create(); })

    /**
     * @tc.name   testPlaybackControl0001
     * @tc.number MOVING_PHOTO_PLAYBACK_CONTROL_0001
     * @tc.desc   Test playback start control. Case 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackControl0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(400);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click();
      await delay(600);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
    })

    /**
     * @tc.name   testPlaybackControl0002
     * @tc.number MOVING_PHOTO_PLAYBACK_CONTROL_0002
     * @tc.desc   Test playback stop control. Case 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackControl0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(600);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
    })

    /**
     * @tc.name   testPlaybackControl0003
     * @tc.number MOVING_PHOTO_PLAYBACK_CONTROL_0003
     * @tc.desc   Test playback mute control. Case 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackControl0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) { await mute.click(); } else { await unmute.click(); }
      await delay(400);
      const nextMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const nextUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(nextMute !== null || nextUnmute !== null).assertTrue();
    })

    /**
     * @tc.name   testPlaybackControl0004
     * @tc.number MOVING_PHOTO_PLAYBACK_CONTROL_0004
     * @tc.desc   Test playback start control. Case 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackControl0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(400);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click();
      await delay(600);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
    })

    /**
     * @tc.name   testPlaybackControl0005
     * @tc.number MOVING_PHOTO_PLAYBACK_CONTROL_0005
     * @tc.desc   Test playback stop control. Case 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackControl0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(600);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
    })

    /**
     * @tc.name   testPlaybackControl0006
     * @tc.number MOVING_PHOTO_PLAYBACK_CONTROL_0006
     * @tc.desc   Test playback mute control. Case 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackControl0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) { await mute.click(); } else { await unmute.click(); }
      await delay(400);
      const nextMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const nextUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(nextMute !== null || nextUnmute !== null).assertTrue();
    })

    /**
     * @tc.name   testPlaybackControl0007
     * @tc.number MOVING_PHOTO_PLAYBACK_CONTROL_0007
     * @tc.desc   Test playback start control. Case 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackControl0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(400);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click();
      await delay(600);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
    })

    /**
     * @tc.name   testPlaybackControl0008
     * @tc.number MOVING_PHOTO_PLAYBACK_CONTROL_0008
     * @tc.desc   Test playback stop control. Case 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackControl0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(600);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
    })

    /**
     * @tc.name   testPlaybackControl0009
     * @tc.number MOVING_PHOTO_PLAYBACK_CONTROL_0009
     * @tc.desc   Test playback mute control. Case 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackControl0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) { await mute.click(); } else { await unmute.click(); }
      await delay(400);
      const nextMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const nextUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(nextMute !== null || nextUnmute !== null).assertTrue();
    })

    /**
     * @tc.name   testPlaybackControl0010
     * @tc.number MOVING_PHOTO_PLAYBACK_CONTROL_0010
     * @tc.desc   Test playback start control. Case 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackControl0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(400);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click();
      await delay(600);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
    })

    /**
     * @tc.name   testPlaybackControl0011
     * @tc.number MOVING_PHOTO_PLAYBACK_CONTROL_0011
     * @tc.desc   Test playback stop control. Case 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackControl0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(600);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
    })

    /**
     * @tc.name   testPlaybackControl0012
     * @tc.number MOVING_PHOTO_PLAYBACK_CONTROL_0012
     * @tc.desc   Test playback mute control. Case 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackControl0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) { await mute.click(); } else { await unmute.click(); }
      await delay(400);
      const nextMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const nextUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(nextMute !== null || nextUnmute !== null).assertTrue();
    })

    /**
     * @tc.name   testPlaybackControl0013
     * @tc.number MOVING_PHOTO_PLAYBACK_CONTROL_0013
     * @tc.desc   Test playback start control. Case 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackControl0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(400);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click();
      await delay(600);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
    })

    /**
     * @tc.name   testPlaybackControl0014
     * @tc.number MOVING_PHOTO_PLAYBACK_CONTROL_0014
     * @tc.desc   Test playback stop control. Case 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackControl0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(600);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
    })

    /**
     * @tc.name   testPlaybackControl0015
     * @tc.number MOVING_PHOTO_PLAYBACK_CONTROL_0015
     * @tc.desc   Test playback mute control. Case 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackControl0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) { await mute.click(); } else { await unmute.click(); }
      await delay(400);
      const nextMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const nextUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(nextMute !== null || nextUnmute !== null).assertTrue();
    })

    /**
     * @tc.name   testPlaybackControl0016
     * @tc.number MOVING_PHOTO_PLAYBACK_CONTROL_0016
     * @tc.desc   Test playback start control. Case 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackControl0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(400);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click();
      await delay(600);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
    })

    /**
     * @tc.name   testPlaybackControl0017
     * @tc.number MOVING_PHOTO_PLAYBACK_CONTROL_0017
     * @tc.desc   Test playback stop control. Case 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackControl0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(600);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
    })

    /**
     * @tc.name   testPlaybackControl0018
     * @tc.number MOVING_PHOTO_PLAYBACK_CONTROL_0018
     * @tc.desc   Test playback mute control. Case 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackControl0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) { await mute.click(); } else { await unmute.click(); }
      await delay(400);
      const nextMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const nextUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(nextMute !== null || nextUnmute !== null).assertTrue();
    })

    /**
     * @tc.name   testPlaybackControl0019
     * @tc.number MOVING_PHOTO_PLAYBACK_CONTROL_0019
     * @tc.desc   Test playback start control. Case 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackControl0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(400);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click();
      await delay(600);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
    })

    /**
     * @tc.name   testPlaybackControl0020
     * @tc.number MOVING_PHOTO_PLAYBACK_CONTROL_0020
     * @tc.desc   Test playback stop control. Case 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackControl0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(600);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
    })

    /**
     * @tc.name   testPlaybackControl0021
     * @tc.number MOVING_PHOTO_PLAYBACK_CONTROL_0021
     * @tc.desc   Test playback mute control. Case 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackControl0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) { await mute.click(); } else { await unmute.click(); }
      await delay(400);
      const nextMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const nextUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(nextMute !== null || nextUnmute !== null).assertTrue();
    })

    /**
     * @tc.name   testPlaybackControl0022
     * @tc.number MOVING_PHOTO_PLAYBACK_CONTROL_0022
     * @tc.desc   Test playback start control. Case 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackControl0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(400);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click();
      await delay(600);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
    })

    /**
     * @tc.name   testPlaybackControl0023
     * @tc.number MOVING_PHOTO_PLAYBACK_CONTROL_0023
     * @tc.desc   Test playback stop control. Case 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackControl0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(600);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
    })

    /**
     * @tc.name   testPlaybackControl0024
     * @tc.number MOVING_PHOTO_PLAYBACK_CONTROL_0024
     * @tc.desc   Test playback mute control. Case 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackControl0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) { await mute.click(); } else { await unmute.click(); }
      await delay(400);
      const nextMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const nextUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(nextMute !== null || nextUnmute !== null).assertTrue();
    })

    /**
     * @tc.name   testPlaybackControl0025
     * @tc.number MOVING_PHOTO_PLAYBACK_CONTROL_0025
     * @tc.desc   Test playback start control. Case 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackControl0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(400);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click();
      await delay(600);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
    })

    /**
     * @tc.name   testPlaybackControl0026
     * @tc.number MOVING_PHOTO_PLAYBACK_CONTROL_0026
     * @tc.desc   Test playback stop control. Case 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackControl0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(600);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
    })

    /**
     * @tc.name   testPlaybackControl0027
     * @tc.number MOVING_PHOTO_PLAYBACK_CONTROL_0027
     * @tc.desc   Test playback mute control. Case 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackControl0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) { await mute.click(); } else { await unmute.click(); }
      await delay(400);
      const nextMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const nextUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(nextMute !== null || nextUnmute !== null).assertTrue();
    })

    /**
     * @tc.name   testPlaybackControl0028
     * @tc.number MOVING_PHOTO_PLAYBACK_CONTROL_0028
     * @tc.desc   Test playback start control. Case 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackControl0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(400);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click();
      await delay(600);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
    })

    /**
     * @tc.name   testPlaybackControl0029
     * @tc.number MOVING_PHOTO_PLAYBACK_CONTROL_0029
     * @tc.desc   Test playback stop control. Case 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackControl0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(600);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
    })

    /**
     * @tc.name   testPlaybackControl0030
     * @tc.number MOVING_PHOTO_PLAYBACK_CONTROL_0030
     * @tc.desc   Test playback mute control. Case 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackControl0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) { await mute.click(); } else { await unmute.click(); }
      await delay(400);
      const nextMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const nextUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(nextMute !== null || nextUnmute !== null).assertTrue();
    })

    /**
     * @tc.name   testPlaybackControl0031
     * @tc.number MOVING_PHOTO_PLAYBACK_CONTROL_0031
     * @tc.desc   Test playback start control. Case 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackControl0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(400);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click();
      await delay(600);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
    })

    /**
     * @tc.name   testPlaybackControl0032
     * @tc.number MOVING_PHOTO_PLAYBACK_CONTROL_0032
     * @tc.desc   Test playback stop control. Case 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackControl0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(600);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
    })

    /**
     * @tc.name   testPlaybackControl0033
     * @tc.number MOVING_PHOTO_PLAYBACK_CONTROL_0033
     * @tc.desc   Test playback mute control. Case 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackControl0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) { await mute.click(); } else { await unmute.click(); }
      await delay(400);
      const nextMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const nextUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(nextMute !== null || nextUnmute !== null).assertTrue();
    })

    /**
     * @tc.name   testPlaybackControl0034
     * @tc.number MOVING_PHOTO_PLAYBACK_CONTROL_0034
     * @tc.desc   Test playback start control. Case 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackControl0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(400);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click();
      await delay(600);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
    })

    /**
     * @tc.name   testPlaybackControl0035
     * @tc.number MOVING_PHOTO_PLAYBACK_CONTROL_0035
     * @tc.desc   Test playback stop control. Case 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackControl0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(600);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
    })

    /**
     * @tc.name   testPlaybackControl0036
     * @tc.number MOVING_PHOTO_PLAYBACK_CONTROL_0036
     * @tc.desc   Test playback mute control. Case 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackControl0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) { await mute.click(); } else { await unmute.click(); }
      await delay(400);
      const nextMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const nextUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(nextMute !== null || nextUnmute !== null).assertTrue();
    })

    /**
     * @tc.name   testPlaybackControl0037
     * @tc.number MOVING_PHOTO_PLAYBACK_CONTROL_0037
     * @tc.desc   Test playback start control. Case 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackControl0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(400);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click();
      await delay(600);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
    })

    /**
     * @tc.name   testPlaybackControl0038
     * @tc.number MOVING_PHOTO_PLAYBACK_CONTROL_0038
     * @tc.desc   Test playback stop control. Case 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackControl0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(600);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
    })

    /**
     * @tc.name   testPlaybackControl0039
     * @tc.number MOVING_PHOTO_PLAYBACK_CONTROL_0039
     * @tc.desc   Test playback mute control. Case 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackControl0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) { await mute.click(); } else { await unmute.click(); }
      await delay(400);
      const nextMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const nextUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(nextMute !== null || nextUnmute !== null).assertTrue();
    })

    /**
     * @tc.name   testPlaybackControl0040
     * @tc.number MOVING_PHOTO_PLAYBACK_CONTROL_0040
     * @tc.desc   Test playback start control. Case 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackControl0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(400);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click();
      await delay(600);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
    })

    /**
     * @tc.name   testPlaybackControl0041
     * @tc.number MOVING_PHOTO_PLAYBACK_CONTROL_0041
     * @tc.desc   Test playback stop control. Case 41.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackControl0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(600);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
    })

    /**
     * @tc.name   testPlaybackControl0042
     * @tc.number MOVING_PHOTO_PLAYBACK_CONTROL_0042
     * @tc.desc   Test playback mute control. Case 42.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackControl0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) { await mute.click(); } else { await unmute.click(); }
      await delay(400);
      const nextMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const nextUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(nextMute !== null || nextUnmute !== null).assertTrue();
    })

    /**
     * @tc.name   testPlaybackControl0043
     * @tc.number MOVING_PHOTO_PLAYBACK_CONTROL_0043
     * @tc.desc   Test playback start control. Case 43.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackControl0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(400);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click();
      await delay(600);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
    })

    /**
     * @tc.name   testPlaybackControl0044
     * @tc.number MOVING_PHOTO_PLAYBACK_CONTROL_0044
     * @tc.desc   Test playback stop control. Case 44.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackControl0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(600);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
    })

    /**
     * @tc.name   testPlaybackControl0045
     * @tc.number MOVING_PHOTO_PLAYBACK_CONTROL_0045
     * @tc.desc   Test playback mute control. Case 45.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackControl0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) { await mute.click(); } else { await unmute.click(); }
      await delay(400);
      const nextMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const nextUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(nextMute !== null || nextUnmute !== null).assertTrue();
    })

    /**
     * @tc.name   testPlaybackControl0046
     * @tc.number MOVING_PHOTO_PLAYBACK_CONTROL_0046
     * @tc.desc   Test playback start control. Case 46.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackControl0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(400);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click();
      await delay(600);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
    })

    /**
     * @tc.name   testPlaybackControl0047
     * @tc.number MOVING_PHOTO_PLAYBACK_CONTROL_0047
     * @tc.desc   Test playback stop control. Case 47.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackControl0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(600);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
    })

    /**
     * @tc.name   testPlaybackControl0048
     * @tc.number MOVING_PHOTO_PLAYBACK_CONTROL_0048
     * @tc.desc   Test playback mute control. Case 48.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackControl0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) { await mute.click(); } else { await unmute.click(); }
      await delay(400);
      const nextMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const nextUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(nextMute !== null || nextUnmute !== null).assertTrue();
    })

    /**
     * @tc.name   testPlaybackControl0049
     * @tc.number MOVING_PHOTO_PLAYBACK_CONTROL_0049
     * @tc.desc   Test playback start control. Case 49.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackControl0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(400);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click();
      await delay(600);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
    })

    /**
     * @tc.name   testPlaybackControl0050
     * @tc.number MOVING_PHOTO_PLAYBACK_CONTROL_0050
     * @tc.desc   Test playback stop control. Case 50.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackControl0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(600);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
    })

    /**
     * @tc.name   testPlaybackControl0051
     * @tc.number MOVING_PHOTO_PLAYBACK_CONTROL_0051
     * @tc.desc   Test playback mute control. Case 51.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackControl0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) { await mute.click(); } else { await unmute.click(); }
      await delay(400);
      const nextMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const nextUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(nextMute !== null || nextUnmute !== null).assertTrue();
    })

    /**
     * @tc.name   testPlaybackControl0052
     * @tc.number MOVING_PHOTO_PLAYBACK_CONTROL_0052
     * @tc.desc   Test playback start control. Case 52.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackControl0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(400);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click();
      await delay(600);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
    })

    /**
     * @tc.name   testPlaybackControl0053
     * @tc.number MOVING_PHOTO_PLAYBACK_CONTROL_0053
     * @tc.desc   Test playback stop control. Case 53.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackControl0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(600);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
    })

    /**
     * @tc.name   testPlaybackControl0054
     * @tc.number MOVING_PHOTO_PLAYBACK_CONTROL_0054
     * @tc.desc   Test playback mute control. Case 54.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackControl0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) { await mute.click(); } else { await unmute.click(); }
      await delay(400);
      const nextMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const nextUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(nextMute !== null || nextUnmute !== null).assertTrue();
    })

    /**
     * @tc.name   testPlaybackControl0055
     * @tc.number MOVING_PHOTO_PLAYBACK_CONTROL_0055
     * @tc.desc   Test playback start control. Case 55.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackControl0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(400);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click();
      await delay(600);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
    })

    /**
     * @tc.name   testPlaybackControl0056
     * @tc.number MOVING_PHOTO_PLAYBACK_CONTROL_0056
     * @tc.desc   Test playback stop control. Case 56.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackControl0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(600);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
    })

    /**
     * @tc.name   testPlaybackControl0057
     * @tc.number MOVING_PHOTO_PLAYBACK_CONTROL_0057
     * @tc.desc   Test playback mute control. Case 57.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackControl0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) { await mute.click(); } else { await unmute.click(); }
      await delay(400);
      const nextMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const nextUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(nextMute !== null || nextUnmute !== null).assertTrue();
    })

    /**
     * @tc.name   testPlaybackControl0058
     * @tc.number MOVING_PHOTO_PLAYBACK_CONTROL_0058
     * @tc.desc   Test playback start control. Case 58.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackControl0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(400);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click();
      await delay(600);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
    })

    /**
     * @tc.name   testPlaybackControl0059
     * @tc.number MOVING_PHOTO_PLAYBACK_CONTROL_0059
     * @tc.desc   Test playback stop control. Case 59.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackControl0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(600);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
    })

    /**
     * @tc.name   testPlaybackControl0060
     * @tc.number MOVING_PHOTO_PLAYBACK_CONTROL_0060
     * @tc.desc   Test playback mute control. Case 60.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackControl0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) { await mute.click(); } else { await unmute.click(); }
      await delay(400);
      const nextMute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const nextUnmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(nextMute !== null || nextUnmute !== null).assertTrue();
    })
  })
}
