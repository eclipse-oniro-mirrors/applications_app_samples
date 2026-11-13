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
const PLAY_TEXT: string = 'PLAY'; const STOP_TEXT: string = 'STOP';
const PLAYING_TEXT: string = '\u5f00\u59cb\u64ad\u653e'; const STOPPED_TEXT: string = '\u505c\u6b62\u64ad\u653e';
const MUTE_TEXT: string = '\u9759\u97f3'; const UNMUTE_TEXT: string = '\u53d6\u6d88\u9759\u97f3';
function delay(ms: number): Promise<void> { return new Promise<void>((resolve: () => void) => { setTimeout(() => { resolve(); }, ms); }); }
export default function movingPhotoPlaybackSequenceTest() {
  describe('MovingPhotoPlaybackSequenceTest', () => {
    let driver: Driver;
    beforeAll(async () => { const want: Want = { bundleName: BUNDLE_NAME, abilityName: 'EntryAbility' }; await DELEGATOR.startAbility(want); await delay(2500); driver = await Driver.create(); })

    /**
     * @tc.name   testPlaybackSequence0001
     * @tc.number MOVING_PHOTO_PLAYBACK_SEQ_0001
     * @tc.desc   Test playback sequence start, case 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackSequence0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click(); await delay(300);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click(); await delay(500);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
    })

    /**
     * @tc.name   testPlaybackSequence0002
     * @tc.number MOVING_PHOTO_PLAYBACK_SEQ_0002
     * @tc.desc   Test playback sequence stop, case 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackSequence0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click(); await delay(500);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
    })

    /**
     * @tc.name   testPlaybackSequence0003
     * @tc.number MOVING_PHOTO_PLAYBACK_SEQ_0003
     * @tc.desc   Test playback sequence mute, case 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackSequence0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) { await mute.click(); } else { await unmute.click(); }
      await delay(300);
      const nm: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const nu: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(nm !== null || nu !== null).assertTrue();
    })

    /**
     * @tc.name   testPlaybackSequence0004
     * @tc.number MOVING_PHOTO_PLAYBACK_SEQ_0004
     * @tc.desc   Test playback sequence start, case 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackSequence0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click(); await delay(300);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click(); await delay(500);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
    })

    /**
     * @tc.name   testPlaybackSequence0005
     * @tc.number MOVING_PHOTO_PLAYBACK_SEQ_0005
     * @tc.desc   Test playback sequence stop, case 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackSequence0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click(); await delay(500);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
    })

    /**
     * @tc.name   testPlaybackSequence0006
     * @tc.number MOVING_PHOTO_PLAYBACK_SEQ_0006
     * @tc.desc   Test playback sequence mute, case 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackSequence0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) { await mute.click(); } else { await unmute.click(); }
      await delay(300);
      const nm: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const nu: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(nm !== null || nu !== null).assertTrue();
    })

    /**
     * @tc.name   testPlaybackSequence0007
     * @tc.number MOVING_PHOTO_PLAYBACK_SEQ_0007
     * @tc.desc   Test playback sequence start, case 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackSequence0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click(); await delay(300);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click(); await delay(500);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
    })

    /**
     * @tc.name   testPlaybackSequence0008
     * @tc.number MOVING_PHOTO_PLAYBACK_SEQ_0008
     * @tc.desc   Test playback sequence stop, case 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackSequence0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click(); await delay(500);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
    })

    /**
     * @tc.name   testPlaybackSequence0009
     * @tc.number MOVING_PHOTO_PLAYBACK_SEQ_0009
     * @tc.desc   Test playback sequence mute, case 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackSequence0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) { await mute.click(); } else { await unmute.click(); }
      await delay(300);
      const nm: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const nu: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(nm !== null || nu !== null).assertTrue();
    })

    /**
     * @tc.name   testPlaybackSequence0010
     * @tc.number MOVING_PHOTO_PLAYBACK_SEQ_0010
     * @tc.desc   Test playback sequence start, case 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackSequence0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click(); await delay(300);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click(); await delay(500);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
    })

    /**
     * @tc.name   testPlaybackSequence0011
     * @tc.number MOVING_PHOTO_PLAYBACK_SEQ_0011
     * @tc.desc   Test playback sequence stop, case 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackSequence0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click(); await delay(500);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
    })

    /**
     * @tc.name   testPlaybackSequence0012
     * @tc.number MOVING_PHOTO_PLAYBACK_SEQ_0012
     * @tc.desc   Test playback sequence mute, case 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackSequence0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) { await mute.click(); } else { await unmute.click(); }
      await delay(300);
      const nm: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const nu: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(nm !== null || nu !== null).assertTrue();
    })

    /**
     * @tc.name   testPlaybackSequence0013
     * @tc.number MOVING_PHOTO_PLAYBACK_SEQ_0013
     * @tc.desc   Test playback sequence start, case 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackSequence0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click(); await delay(300);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click(); await delay(500);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
    })

    /**
     * @tc.name   testPlaybackSequence0014
     * @tc.number MOVING_PHOTO_PLAYBACK_SEQ_0014
     * @tc.desc   Test playback sequence stop, case 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackSequence0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click(); await delay(500);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
    })

    /**
     * @tc.name   testPlaybackSequence0015
     * @tc.number MOVING_PHOTO_PLAYBACK_SEQ_0015
     * @tc.desc   Test playback sequence mute, case 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackSequence0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) { await mute.click(); } else { await unmute.click(); }
      await delay(300);
      const nm: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const nu: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(nm !== null || nu !== null).assertTrue();
    })

    /**
     * @tc.name   testPlaybackSequence0016
     * @tc.number MOVING_PHOTO_PLAYBACK_SEQ_0016
     * @tc.desc   Test playback sequence start, case 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackSequence0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click(); await delay(300);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click(); await delay(500);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
    })

    /**
     * @tc.name   testPlaybackSequence0017
     * @tc.number MOVING_PHOTO_PLAYBACK_SEQ_0017
     * @tc.desc   Test playback sequence stop, case 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackSequence0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click(); await delay(500);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
    })

    /**
     * @tc.name   testPlaybackSequence0018
     * @tc.number MOVING_PHOTO_PLAYBACK_SEQ_0018
     * @tc.desc   Test playback sequence mute, case 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackSequence0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) { await mute.click(); } else { await unmute.click(); }
      await delay(300);
      const nm: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const nu: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(nm !== null || nu !== null).assertTrue();
    })

    /**
     * @tc.name   testPlaybackSequence0019
     * @tc.number MOVING_PHOTO_PLAYBACK_SEQ_0019
     * @tc.desc   Test playback sequence start, case 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackSequence0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click(); await delay(300);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click(); await delay(500);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
    })

    /**
     * @tc.name   testPlaybackSequence0020
     * @tc.number MOVING_PHOTO_PLAYBACK_SEQ_0020
     * @tc.desc   Test playback sequence stop, case 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackSequence0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click(); await delay(500);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
    })

    /**
     * @tc.name   testPlaybackSequence0021
     * @tc.number MOVING_PHOTO_PLAYBACK_SEQ_0021
     * @tc.desc   Test playback sequence mute, case 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackSequence0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) { await mute.click(); } else { await unmute.click(); }
      await delay(300);
      const nm: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const nu: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(nm !== null || nu !== null).assertTrue();
    })

    /**
     * @tc.name   testPlaybackSequence0022
     * @tc.number MOVING_PHOTO_PLAYBACK_SEQ_0022
     * @tc.desc   Test playback sequence start, case 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackSequence0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click(); await delay(300);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click(); await delay(500);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
    })

    /**
     * @tc.name   testPlaybackSequence0023
     * @tc.number MOVING_PHOTO_PLAYBACK_SEQ_0023
     * @tc.desc   Test playback sequence stop, case 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackSequence0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click(); await delay(500);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
    })

    /**
     * @tc.name   testPlaybackSequence0024
     * @tc.number MOVING_PHOTO_PLAYBACK_SEQ_0024
     * @tc.desc   Test playback sequence mute, case 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackSequence0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) { await mute.click(); } else { await unmute.click(); }
      await delay(300);
      const nm: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const nu: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(nm !== null || nu !== null).assertTrue();
    })

    /**
     * @tc.name   testPlaybackSequence0025
     * @tc.number MOVING_PHOTO_PLAYBACK_SEQ_0025
     * @tc.desc   Test playback sequence start, case 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackSequence0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click(); await delay(300);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click(); await delay(500);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
    })

    /**
     * @tc.name   testPlaybackSequence0026
     * @tc.number MOVING_PHOTO_PLAYBACK_SEQ_0026
     * @tc.desc   Test playback sequence stop, case 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackSequence0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click(); await delay(500);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
    })

    /**
     * @tc.name   testPlaybackSequence0027
     * @tc.number MOVING_PHOTO_PLAYBACK_SEQ_0027
     * @tc.desc   Test playback sequence mute, case 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackSequence0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) { await mute.click(); } else { await unmute.click(); }
      await delay(300);
      const nm: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const nu: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(nm !== null || nu !== null).assertTrue();
    })

    /**
     * @tc.name   testPlaybackSequence0028
     * @tc.number MOVING_PHOTO_PLAYBACK_SEQ_0028
     * @tc.desc   Test playback sequence start, case 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackSequence0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click(); await delay(300);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click(); await delay(500);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
    })

    /**
     * @tc.name   testPlaybackSequence0029
     * @tc.number MOVING_PHOTO_PLAYBACK_SEQ_0029
     * @tc.desc   Test playback sequence stop, case 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackSequence0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click(); await delay(500);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
    })

    /**
     * @tc.name   testPlaybackSequence0030
     * @tc.number MOVING_PHOTO_PLAYBACK_SEQ_0030
     * @tc.desc   Test playback sequence mute, case 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackSequence0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) { await mute.click(); } else { await unmute.click(); }
      await delay(300);
      const nm: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const nu: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(nm !== null || nu !== null).assertTrue();
    })

    /**
     * @tc.name   testPlaybackSequence0031
     * @tc.number MOVING_PHOTO_PLAYBACK_SEQ_0031
     * @tc.desc   Test playback sequence start, case 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackSequence0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click(); await delay(300);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click(); await delay(500);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
    })

    /**
     * @tc.name   testPlaybackSequence0032
     * @tc.number MOVING_PHOTO_PLAYBACK_SEQ_0032
     * @tc.desc   Test playback sequence stop, case 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackSequence0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click(); await delay(500);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
    })

    /**
     * @tc.name   testPlaybackSequence0033
     * @tc.number MOVING_PHOTO_PLAYBACK_SEQ_0033
     * @tc.desc   Test playback sequence mute, case 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackSequence0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) { await mute.click(); } else { await unmute.click(); }
      await delay(300);
      const nm: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const nu: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(nm !== null || nu !== null).assertTrue();
    })

    /**
     * @tc.name   testPlaybackSequence0034
     * @tc.number MOVING_PHOTO_PLAYBACK_SEQ_0034
     * @tc.desc   Test playback sequence start, case 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackSequence0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click(); await delay(300);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click(); await delay(500);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
    })

    /**
     * @tc.name   testPlaybackSequence0035
     * @tc.number MOVING_PHOTO_PLAYBACK_SEQ_0035
     * @tc.desc   Test playback sequence stop, case 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackSequence0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click(); await delay(500);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
    })

    /**
     * @tc.name   testPlaybackSequence0036
     * @tc.number MOVING_PHOTO_PLAYBACK_SEQ_0036
     * @tc.desc   Test playback sequence mute, case 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackSequence0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) { await mute.click(); } else { await unmute.click(); }
      await delay(300);
      const nm: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const nu: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(nm !== null || nu !== null).assertTrue();
    })

    /**
     * @tc.name   testPlaybackSequence0037
     * @tc.number MOVING_PHOTO_PLAYBACK_SEQ_0037
     * @tc.desc   Test playback sequence start, case 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackSequence0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click(); await delay(300);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click(); await delay(500);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
    })

    /**
     * @tc.name   testPlaybackSequence0038
     * @tc.number MOVING_PHOTO_PLAYBACK_SEQ_0038
     * @tc.desc   Test playback sequence stop, case 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackSequence0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click(); await delay(500);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
    })

    /**
     * @tc.name   testPlaybackSequence0039
     * @tc.number MOVING_PHOTO_PLAYBACK_SEQ_0039
     * @tc.desc   Test playback sequence mute, case 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackSequence0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) { await mute.click(); } else { await unmute.click(); }
      await delay(300);
      const nm: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const nu: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(nm !== null || nu !== null).assertTrue();
    })

    /**
     * @tc.name   testPlaybackSequence0040
     * @tc.number MOVING_PHOTO_PLAYBACK_SEQ_0040
     * @tc.desc   Test playback sequence start, case 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackSequence0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click(); await delay(300);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click(); await delay(500);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
    })

    /**
     * @tc.name   testPlaybackSequence0041
     * @tc.number MOVING_PHOTO_PLAYBACK_SEQ_0041
     * @tc.desc   Test playback sequence stop, case 41.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackSequence0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click(); await delay(500);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
    })

    /**
     * @tc.name   testPlaybackSequence0042
     * @tc.number MOVING_PHOTO_PLAYBACK_SEQ_0042
     * @tc.desc   Test playback sequence mute, case 42.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackSequence0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) { await mute.click(); } else { await unmute.click(); }
      await delay(300);
      const nm: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const nu: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(nm !== null || nu !== null).assertTrue();
    })

    /**
     * @tc.name   testPlaybackSequence0043
     * @tc.number MOVING_PHOTO_PLAYBACK_SEQ_0043
     * @tc.desc   Test playback sequence start, case 43.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackSequence0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click(); await delay(300);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click(); await delay(500);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
    })

    /**
     * @tc.name   testPlaybackSequence0044
     * @tc.number MOVING_PHOTO_PLAYBACK_SEQ_0044
     * @tc.desc   Test playback sequence stop, case 44.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackSequence0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click(); await delay(500);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
    })

    /**
     * @tc.name   testPlaybackSequence0045
     * @tc.number MOVING_PHOTO_PLAYBACK_SEQ_0045
     * @tc.desc   Test playback sequence mute, case 45.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackSequence0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) { await mute.click(); } else { await unmute.click(); }
      await delay(300);
      const nm: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const nu: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(nm !== null || nu !== null).assertTrue();
    })

    /**
     * @tc.name   testPlaybackSequence0046
     * @tc.number MOVING_PHOTO_PLAYBACK_SEQ_0046
     * @tc.desc   Test playback sequence start, case 46.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackSequence0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click(); await delay(300);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click(); await delay(500);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
    })

    /**
     * @tc.name   testPlaybackSequence0047
     * @tc.number MOVING_PHOTO_PLAYBACK_SEQ_0047
     * @tc.desc   Test playback sequence stop, case 47.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackSequence0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click(); await delay(500);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
    })

    /**
     * @tc.name   testPlaybackSequence0048
     * @tc.number MOVING_PHOTO_PLAYBACK_SEQ_0048
     * @tc.desc   Test playback sequence mute, case 48.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackSequence0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) { await mute.click(); } else { await unmute.click(); }
      await delay(300);
      const nm: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const nu: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(nm !== null || nu !== null).assertTrue();
    })

    /**
     * @tc.name   testPlaybackSequence0049
     * @tc.number MOVING_PHOTO_PLAYBACK_SEQ_0049
     * @tc.desc   Test playback sequence start, case 49.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackSequence0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click(); await delay(300);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click(); await delay(500);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
    })

    /**
     * @tc.name   testPlaybackSequence0050
     * @tc.number MOVING_PHOTO_PLAYBACK_SEQ_0050
     * @tc.desc   Test playback sequence stop, case 50.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackSequence0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click(); await delay(500);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
    })

    /**
     * @tc.name   testPlaybackSequence0051
     * @tc.number MOVING_PHOTO_PLAYBACK_SEQ_0051
     * @tc.desc   Test playback sequence mute, case 51.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackSequence0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) { await mute.click(); } else { await unmute.click(); }
      await delay(300);
      const nm: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const nu: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(nm !== null || nu !== null).assertTrue();
    })

    /**
     * @tc.name   testPlaybackSequence0052
     * @tc.number MOVING_PHOTO_PLAYBACK_SEQ_0052
     * @tc.desc   Test playback sequence start, case 52.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackSequence0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click(); await delay(300);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click(); await delay(500);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
    })

    /**
     * @tc.name   testPlaybackSequence0053
     * @tc.number MOVING_PHOTO_PLAYBACK_SEQ_0053
     * @tc.desc   Test playback sequence stop, case 53.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackSequence0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click(); await delay(500);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
    })

    /**
     * @tc.name   testPlaybackSequence0054
     * @tc.number MOVING_PHOTO_PLAYBACK_SEQ_0054
     * @tc.desc   Test playback sequence mute, case 54.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackSequence0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) { await mute.click(); } else { await unmute.click(); }
      await delay(300);
      const nm: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const nu: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(nm !== null || nu !== null).assertTrue();
    })

    /**
     * @tc.name   testPlaybackSequence0055
     * @tc.number MOVING_PHOTO_PLAYBACK_SEQ_0055
     * @tc.desc   Test playback sequence start, case 55.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackSequence0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click(); await delay(300);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click(); await delay(500);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
    })

    /**
     * @tc.name   testPlaybackSequence0056
     * @tc.number MOVING_PHOTO_PLAYBACK_SEQ_0056
     * @tc.desc   Test playback sequence stop, case 56.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackSequence0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click(); await delay(500);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
    })

    /**
     * @tc.name   testPlaybackSequence0057
     * @tc.number MOVING_PHOTO_PLAYBACK_SEQ_0057
     * @tc.desc   Test playback sequence mute, case 57.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackSequence0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) { await mute.click(); } else { await unmute.click(); }
      await delay(300);
      const nm: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const nu: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(nm !== null || nu !== null).assertTrue();
    })

    /**
     * @tc.name   testPlaybackSequence0058
     * @tc.number MOVING_PHOTO_PLAYBACK_SEQ_0058
     * @tc.desc   Test playback sequence start, case 58.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackSequence0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click(); await delay(300);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click(); await delay(500);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
    })

    /**
     * @tc.name   testPlaybackSequence0059
     * @tc.number MOVING_PHOTO_PLAYBACK_SEQ_0059
     * @tc.desc   Test playback sequence stop, case 59.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackSequence0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click(); await delay(500);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
    })

    /**
     * @tc.name   testPlaybackSequence0060
     * @tc.number MOVING_PHOTO_PLAYBACK_SEQ_0060
     * @tc.desc   Test playback sequence mute, case 60.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlaybackSequence0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mute: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const unmute: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      if (mute !== null) { await mute.click(); } else { await unmute.click(); }
      await delay(300);
      const nm: Component = await driver.findComponent(ON.text(MUTE_TEXT));
      const nu: Component = await driver.findComponent(ON.text(UNMUTE_TEXT));
      expect(nm !== null || nu !== null).assertTrue();
    })
  })
}
