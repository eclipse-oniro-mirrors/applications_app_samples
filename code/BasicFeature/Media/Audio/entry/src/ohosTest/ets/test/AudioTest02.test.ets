/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { Driver, ON } from '@kit.TestKit';
import type { Component } from '@kit.TestKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import hilog from '@ohos.hilog';
import { ensureHomeReady } from './shared/AudioDriver';

const DOMAIN: number = 0xF811;
const TAG = 'Audio02Test';
const WAIT_FOR_RECORD_LENGTH: number = 6000;

export default function audioTest02() {
  describe('Audio02Test', () => {
    let driver: Driver = Driver.create();
    beforeAll(async () => {
      await ensureHomeReady(driver);
    });

    /**
     * @tc.number SUB_AUDIOTEST02_TEST_0100
     * @tc.name testAudio02Chapter0001
     * @tc.desc Verify testAudio02Chapter0001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAudio02Chapter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio02Chapter0001 start');
      const capturerCard: Component | null = await driver.waitForComponent(ON.id('audio_capturer_card'), 8000);
      hilog.info(DOMAIN, TAG, 'audio_capturer_card exists: %{public}s', String(capturerCard !== null));
      expect(capturerCard !== null).assertTrue();
      await capturerCard!.click();
      await driver.delayMs(1000);
      const resMgr = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().resourceManager;
      const normalText: Component | null = await driver.findComponent(ON.text(await resMgr.getStringValue({
        "id": 33554482,
        "type": 10003,
        params: [],
        "bundleName": "com.samples.audio",
        "moduleName": "entry_test"
      })));
      hilog.info(DOMAIN, TAG, 'normal capturer entry exists: %{public}s', String(normalText !== null));
      expect(normalText !== null).assertTrue();
      const parallelText: Component | null = await driver.findComponent(ON.text(await resMgr.getStringValue({
        "id": 33554484,
        "type": 10003,
        params: [],
        "bundleName": "com.samples.audio",
        "moduleName": "entry_test"
      })));
      hilog.info(DOMAIN, TAG, 'parallel capturer entry exists: %{public}s', String(parallelText !== null));
      expect(parallelText !== null).assertTrue();
      const liveText: Component | null = await driver.findComponent(ON.text(await resMgr.getStringValue({
        "id": 33554480,
        "type": 10003,
        params: [],
        "bundleName": "com.samples.audio",
        "moduleName": "entry_test"
      })));
      hilog.info(DOMAIN, TAG, 'live capturer entry exists: %{public}s', String(liveText !== null));
      expect(liveText !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio02Chapter0001 end');
      done();
    });

    /**
     * @tc.number SUB_AUDIOTEST02_TEST_0200
     * @tc.name testAudio02Chapter0002
     * @tc.desc Verify testAudio02Chapter0002
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAudio02Chapter0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio02Chapter0002 start');
      const startBtn: Component | null = await driver.waitForComponent(ON.id('normal_start_record_btn'), 8000);
      hilog.info(DOMAIN, TAG, 'normal_start_record_btn exists: %{public}s', String(startBtn !== null));
      expect(startBtn !== null).assertTrue();
      await startBtn!.click();
      await driver.delayMs(3000);
      const timeTxt: Component | null = await driver.findComponent(ON.id('normal_show_time_txt'));
      hilog.info(DOMAIN, TAG, 'normal_show_time_txt exists: %{public}s', String(timeTxt !== null));
      expect(timeTxt !== null).assertTrue();
      const stopBtn: Component | null = await driver.findComponent(ON.id('normal_stop_record_btn'));
      hilog.info(DOMAIN, TAG, 'normal_stop_record_btn exists: %{public}s', String(stopBtn !== null));
      expect(stopBtn !== null).assertTrue();
      const pauseBtn: Component | null = await driver.findComponent(ON.id('normal_pause_record_btn'));
      hilog.info(DOMAIN, TAG, 'normal_pause_record_btn exists: %{public}s', String(pauseBtn !== null));
      expect(pauseBtn !== null).assertTrue();
      const startBtnAfter: Component | null = await driver.findComponent(ON.id('normal_start_record_btn'));
      hilog.info(DOMAIN, TAG, 'normal_start_record_btn gone: %{public}s', String(startBtnAfter === null));
      expect(startBtnAfter === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio02Chapter0002 end');
      done();
    });

    /**
     * @tc.number SUB_AUDIOTEST02_TEST_0300
     * @tc.name testAudio02Chapter0003
     * @tc.desc Verify testAudio02Chapter0003
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAudio02Chapter0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio02Chapter0003 start');
      const pauseBtn: Component | null = await driver.waitForComponent(ON.id('normal_pause_record_btn'), 8000);
      hilog.info(DOMAIN, TAG, 'normal_pause_record_btn exists: %{public}s', String(pauseBtn !== null));
      expect(pauseBtn !== null).assertTrue();
      await pauseBtn!.click();
      await driver.delayMs(1000);
      const continueBtn: Component | null = await driver.findComponent(ON.id('normal_continue_record_btn'));
      hilog.info(DOMAIN, TAG, 'normal_continue_record_btn exists: %{public}s', String(continueBtn !== null));
      expect(continueBtn !== null).assertTrue();
      const pauseBtnAfter: Component | null = await driver.findComponent(ON.id('normal_pause_record_btn'));
      hilog.info(DOMAIN, TAG, 'normal_pause_record_btn gone: %{public}s', String(pauseBtnAfter === null));
      expect(pauseBtnAfter === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio02Chapter0003 end');
      done();
    });

    /**
     * @tc.number SUB_AUDIOTEST02_TEST_0400
     * @tc.name testAudio02Chapter0004
     * @tc.desc Verify testAudio02Chapter0004
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAudio02Chapter0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio02Chapter0004 start');
      const continueBtn: Component | null = await driver.waitForComponent(ON.id('normal_continue_record_btn'), 8000);
      hilog.info(DOMAIN, TAG, 'normal_continue_record_btn exists: %{public}s', String(continueBtn !== null));
      expect(continueBtn !== null).assertTrue();
      await continueBtn!.click();
      await driver.delayMs(1000);
      const pauseBtn: Component | null = await driver.findComponent(ON.id('normal_pause_record_btn'));
      hilog.info(DOMAIN, TAG, 'normal_pause_record_btn exists: %{public}s', String(pauseBtn !== null));
      expect(pauseBtn !== null).assertTrue();
      const continueBtnAfter: Component | null = await driver.findComponent(ON.id('normal_continue_record_btn'));
      hilog.info(DOMAIN, TAG, 'normal_continue_record_btn gone: %{public}s', String(continueBtnAfter === null));
      expect(continueBtnAfter === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio02Chapter0004 end');
      done();
    });

    /**
     * @tc.number SUB_AUDIOTEST02_TEST_0500
     * @tc.name testAudio02Chapter0005
     * @tc.desc Verify testAudio02Chapter0005
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAudio02Chapter0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio02Chapter0005 start');
      await driver.delayMs(2000);
      const stopBtn: Component | null = await driver.waitForComponent(ON.id('normal_stop_record_btn'), 8000);
      hilog.info(DOMAIN, TAG, 'normal_stop_record_btn exists: %{public}s', String(stopBtn !== null));
      expect(stopBtn !== null).assertTrue();
      await stopBtn!.click();
      await driver.delayMs(1000);
      const player: Component | null = await driver.findComponent(ON.id('normal_player'));
      hilog.info(DOMAIN, TAG, 'normal_player exists: %{public}s', String(player !== null));
      expect(player !== null).assertTrue();
      const disableBtn: Component | null = await driver.findComponent(ON.id('disalbe_btn'));
      hilog.info(DOMAIN, TAG, 'disalbe_btn exists: %{public}s', String(disableBtn !== null));
      expect(disableBtn !== null).assertTrue();
      const stopAfter: Component | null = await driver.findComponent(ON.id('normal_stop_record_btn'));
      hilog.info(DOMAIN, TAG, 'normal_stop_record_btn gone: %{public}s', String(stopAfter === null));
      expect(stopAfter === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio02Chapter0005 end');
      done();
    });

    /**
     * @tc.number SUB_AUDIOTEST02_TEST_0600
     * @tc.name testAudio02Chapter0006
     * @tc.desc Verify testAudio02Chapter0006
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAudio02Chapter0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio02Chapter0006 start');
      const player: Component | null = await driver.waitForComponent(ON.id('normal_player'), 8000);
      hilog.info(DOMAIN, TAG, 'normal_player exists: %{public}s', String(player !== null));
      expect(player !== null).assertTrue();
      await player!.click();
      const playingState: Component | null = await driver.waitForComponent(ON.id('playing_state'), 5000);
      hilog.info(DOMAIN, TAG, 'playing_state exists: %{public}s', String(playingState !== null));
      expect(playingState !== null).assertTrue();
      await driver.delayMs(2000);
      const pausedBefore: Component | null = await driver.findComponent(ON.id('paused_state'));
      const playerAgain: Component | null = await driver.waitForComponent(ON.id('normal_player'), 3000);
      hilog.info(DOMAIN, TAG, 'normal_player exists again: %{public}s', String(playerAgain !== null));
      expect(playerAgain !== null).assertTrue();
      await playerAgain!.click();
      if (pausedBefore !== null) {
        const playingAgain: Component | null = await driver.waitForComponent(ON.id('playing_state'), 5000);
        hilog.info(DOMAIN, TAG, 'playing_state again: %{public}s', String(playingAgain !== null));
        expect(playingAgain !== null).assertTrue();
        await playerAgain!.click();
      }
      const pausedState: Component | null = await driver.waitForComponent(ON.id('paused_state'), 5000);
      hilog.info(DOMAIN, TAG, 'paused_state exists: %{public}s', String(pausedState !== null));
      expect(pausedState !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio02Chapter0006 end');
      done();
    });

    /**
     * @tc.number SUB_AUDIOTEST02_TEST_0700
     * @tc.name testAudio02Chapter0007
     * @tc.desc Verify testAudio02Chapter0007
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAudio02Chapter0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio02Chapter0007 start');
      const liveTab: Component | null = await driver.waitForComponent(ON.id('btn_live_capturer'), 8000);
      hilog.info(DOMAIN, TAG, 'btn_live_capturer exists: %{public}s', String(liveTab !== null));
      expect(liveTab !== null).assertTrue();
      await liveTab!.click();
      await driver.delayMs(1000);
      const startBtn: Component | null = await driver.findComponent(ON.id('live_start_record_btn'));
      hilog.info(DOMAIN, TAG, 'live_start_record_btn exists: %{public}s', String(startBtn !== null));
      expect(startBtn !== null).assertTrue();
      await startBtn!.click();
      await driver.delayMs(3000);
      const timeTxt: Component | null = await driver.findComponent(ON.id('live_show_time_txt'));
      hilog.info(DOMAIN, TAG, 'live_show_time_txt exists: %{public}s', String(timeTxt !== null));
      expect(timeTxt !== null).assertTrue();
      const stopBtn: Component | null = await driver.findComponent(ON.id('live_stop_record_btn'));
      hilog.info(DOMAIN, TAG, 'live_stop_record_btn exists: %{public}s', String(stopBtn !== null));
      expect(stopBtn !== null).assertTrue();
      const pauseBtn: Component | null = await driver.findComponent(ON.id('live_pause_record_btn'));
      hilog.info(DOMAIN, TAG, 'live_pause_record_btn exists: %{public}s', String(pauseBtn !== null));
      expect(pauseBtn !== null).assertTrue();
      const startAfter: Component | null = await driver.findComponent(ON.id('live_start_record_btn'));
      hilog.info(DOMAIN, TAG, 'live_start_record_btn gone: %{public}s', String(startAfter === null));
      expect(startAfter === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio02Chapter0007 end');
      done();
    });

    /**
     * @tc.number SUB_AUDIOTEST02_TEST_0800
     * @tc.name testAudio02Chapter0008
     * @tc.desc Verify testAudio02Chapter0008
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAudio02Chapter0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio02Chapter0008 start');
      const pauseBtn: Component | null = await driver.waitForComponent(ON.id('live_pause_record_btn'), 8000);
      hilog.info(DOMAIN, TAG, 'live_pause_record_btn exists: %{public}s', String(pauseBtn !== null));
      expect(pauseBtn !== null).assertTrue();
      await pauseBtn!.click();
      await driver.delayMs(1000);
      const continueBtn: Component | null = await driver.findComponent(ON.id('live_continue_record_btn'));
      hilog.info(DOMAIN, TAG, 'live_continue_record_btn exists: %{public}s', String(continueBtn !== null));
      expect(continueBtn !== null).assertTrue();
      const pauseAfter: Component | null = await driver.findComponent(ON.id('live_pause_record_btn'));
      hilog.info(DOMAIN, TAG, 'live_pause_record_btn gone: %{public}s', String(pauseAfter === null));
      expect(pauseAfter === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio02Chapter0008 end');
      done();
    });

    /**
     * @tc.number SUB_AUDIOTEST02_TEST_0900
     * @tc.name testAudio02Chapter0009
     * @tc.desc Verify testAudio02Chapter0009
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAudio02Chapter0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio02Chapter0009 start');
      const continueBtn: Component | null = await driver.waitForComponent(ON.id('live_continue_record_btn'), 8000);
      hilog.info(DOMAIN, TAG, 'live_continue_record_btn exists: %{public}s', String(continueBtn !== null));
      expect(continueBtn !== null).assertTrue();
      await continueBtn!.click();
      await driver.delayMs(1000);
      const pauseBtn: Component | null = await driver.findComponent(ON.id('live_pause_record_btn'));
      hilog.info(DOMAIN, TAG, 'live_pause_record_btn exists: %{public}s', String(pauseBtn !== null));
      expect(pauseBtn !== null).assertTrue();
      const continueAfter: Component | null = await driver.findComponent(ON.id('live_continue_record_btn'));
      hilog.info(DOMAIN, TAG, 'live_continue_record_btn gone: %{public}s', String(continueAfter === null));
      expect(continueAfter === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio02Chapter0009 end');
      done();
    });

    /**
     * @tc.number SUB_AUDIOTEST02_TEST_1000
     * @tc.name testAudio02Chapter0010
     * @tc.desc Verify testAudio02Chapter0010
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAudio02Chapter0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio02Chapter0010 start');
      await driver.delayMs(2000);
      const stopBtn: Component | null = await driver.waitForComponent(ON.id('live_stop_record_btn'), 8000);
      hilog.info(DOMAIN, TAG, 'live_stop_record_btn exists: %{public}s', String(stopBtn !== null));
      expect(stopBtn !== null).assertTrue();
      await stopBtn!.click();
      await driver.delayMs(1000);
      const player: Component | null = await driver.findComponent(ON.id('live_player'));
      hilog.info(DOMAIN, TAG, 'live_player exists: %{public}s', String(player !== null));
      expect(player !== null).assertTrue();
      const disableBtn: Component | null = await driver.findComponent(ON.id('disalbe_btn'));
      hilog.info(DOMAIN, TAG, 'disalbe_btn exists: %{public}s', String(disableBtn !== null));
      expect(disableBtn !== null).assertTrue();
      const stopAfter: Component | null = await driver.findComponent(ON.id('live_stop_record_btn'));
      hilog.info(DOMAIN, TAG, 'live_stop_record_btn gone: %{public}s', String(stopAfter === null));
      expect(stopAfter === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio02Chapter0010 end');
      done();
    });

    /**
     * @tc.number SUB_AUDIOTEST02_TEST_1100
     * @tc.name testAudio02Chapter0011
     * @tc.desc Verify testAudio02Chapter0011
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAudio02Chapter0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio02Chapter0011 start');
      const player: Component | null = await driver.waitForComponent(ON.id('live_player'), 8000);
      hilog.info(DOMAIN, TAG, 'live_player exists: %{public}s', String(player !== null));
      expect(player !== null).assertTrue();
      await player!.click();
      const playingState: Component | null = await driver.waitForComponent(ON.id('playing_state'), 5000);
      hilog.info(DOMAIN, TAG, 'playing_state exists: %{public}s', String(playingState !== null));
      expect(playingState !== null).assertTrue();
      await driver.delayMs(2000);
      const pausedBefore: Component | null = await driver.findComponent(ON.id('paused_state'));
      const playerAgain: Component | null = await driver.waitForComponent(ON.id('live_player'), 3000);
      hilog.info(DOMAIN, TAG, 'live_player exists again: %{public}s', String(playerAgain !== null));
      expect(playerAgain !== null).assertTrue();
      await playerAgain!.click();
      if (pausedBefore !== null) {
        const playingAgain: Component | null = await driver.waitForComponent(ON.id('playing_state'), 5000);
        hilog.info(DOMAIN, TAG, 'playing_state again: %{public}s', String(playingAgain !== null));
        expect(playingAgain !== null).assertTrue();
        await playerAgain!.click();
      }
      const pausedState: Component | null = await driver.waitForComponent(ON.id('paused_state'), 5000);
      hilog.info(DOMAIN, TAG, 'paused_state exists: %{public}s', String(pausedState !== null));
      expect(pausedState !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio02Chapter0011 end');
      done();
    });

    /**
     * @tc.number SUB_AUDIOTEST02_TEST_1200
     * @tc.name testAudio02Chapter0012
     * @tc.desc Verify testAudio02Chapter0012
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAudio02Chapter0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio02Chapter0012 start');
      const parallelTab: Component | null = await driver.waitForComponent(ON.id('btn_parallel_capturer'), 8000);
      hilog.info(DOMAIN, TAG, 'btn_parallel_capturer exists: %{public}s', String(parallelTab !== null));
      expect(parallelTab !== null).assertTrue();
      await parallelTab!.click();
      await driver.delayMs(1000);
      const musicCard: Component | null = await driver.findComponent(ON.id('music_player_card'));
      hilog.info(DOMAIN, TAG, 'music_player_card exists: %{public}s', String(musicCard !== null));
      expect(musicCard !== null).assertTrue();
      const startBtn: Component | null = await driver.findComponent(ON.id('parallel_start_btn'));
      hilog.info(DOMAIN, TAG, 'parallel_start_btn exists: %{public}s', String(startBtn !== null));
      expect(startBtn !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio02Chapter0012 end');
      done();
    });

    /**
     * @tc.number SUB_AUDIOTEST02_TEST_1300
     * @tc.name testAudio02Chapter0013
     * @tc.desc Verify testAudio02Chapter0013
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAudio02Chapter0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio02Chapter0013 start');
      const musicCard: Component | null = await driver.waitForComponent(ON.id('music_player_card'), 8000);
      hilog.info(DOMAIN, TAG, 'music_player_card exists: %{public}s', String(musicCard !== null));
      expect(musicCard !== null).assertTrue();
      await musicCard!.click();
      await driver.delayMs(1000);
      const startBtn: Component | null = await driver.findComponent(ON.id('parallel_start_btn'));
      hilog.info(DOMAIN, TAG, 'parallel_start_btn exists: %{public}s', String(startBtn !== null));
      expect(startBtn !== null).assertTrue();
      await startBtn!.click();
      await driver.delayMs(WAIT_FOR_RECORD_LENGTH);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio02Chapter0013 end');
      done();
    });

    /**
     * @tc.number SUB_AUDIOTEST02_TEST_1400
     * @tc.name testAudio02Chapter0014
     * @tc.desc Verify testAudio02Chapter0014
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAudio02Chapter0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio02Chapter0014 start');
      const stopBtn: Component | null = await driver.waitForComponent(ON.id('parallel_stop_btn'), 8000);
      hilog.info(DOMAIN, TAG, 'parallel_stop_btn exists: %{public}s', String(stopBtn !== null));
      expect(stopBtn !== null).assertTrue();
      await stopBtn!.click();
      await driver.delayMs(500);
      const result: Component | null = await driver.findComponent(ON.id('record_result'));
      hilog.info(DOMAIN, TAG, 'record_result exists: %{public}s', String(result !== null));
      expect(result !== null).assertTrue();
      const player0: Component | null = await driver.findComponent(ON.id('record_player0'));
      hilog.info(DOMAIN, TAG, 'record_player0 exists: %{public}s', String(player0 !== null));
      expect(player0 !== null).assertTrue();
      const player1: Component | null = await driver.findComponent(ON.id('record_player1'));
      hilog.info(DOMAIN, TAG, 'record_player1 exists: %{public}s', String(player1 !== null));
      expect(player1 !== null).assertTrue();
      await driver.delayMs(1000);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio02Chapter0014 end');
      done();
    });

    /**
     * @tc.number SUB_AUDIOTEST02_TEST_1500
     * @tc.name testAudio02Chapter0015
     * @tc.desc Verify testAudio02Chapter0015
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAudio02Chapter0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio02Chapter0015 start');
      const player0: Component | null = await driver.waitForComponent(ON.id('record_player0'), 8000);
      const player1: Component | null = await driver.findComponent(ON.id('record_player1'));
      await player0!.click();
      await player1!.click();
      await driver.delayMs(500);
      const playing0: Component | null = await driver.findComponent(ON.id('playing_state0'));
      hilog.info(DOMAIN, TAG, 'playing_state0 exists: %{public}s', String(playing0 !== null));
      expect(playing0 !== null).assertTrue();
      const playing1: Component | null = await driver.findComponent(ON.id('playing_state1'));
      hilog.info(DOMAIN, TAG, 'playing_state1 exists: %{public}s', String(playing1 !== null));
      expect(playing1 !== null).assertTrue();
      await player0!.click();
      await player1!.click();
      await driver.delayMs(500);
      const paused0: Component | null = await driver.findComponent(ON.id('paused_state0'));
      hilog.info(DOMAIN, TAG, 'paused_state0 exists: %{public}s', String(paused0 !== null));
      expect(paused0 !== null).assertTrue();
      const paused1: Component | null = await driver.findComponent(ON.id('paused_state1'));
      hilog.info(DOMAIN, TAG, 'paused_state1 exists: %{public}s', String(paused1 !== null));
      expect(paused1 !== null).assertTrue();
      const backBtn: Component | null = await driver.findComponent(ON.id('parallel_capturer_back_btn'));
      await driver.pressBack();
      await driver.delayMs(1000);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio02Chapter0015 end');
      done();
    });

    /**
     * @tc.number SUB_AUDIOTEST02_TEST_1600
     * @tc.name testAudio02Chapter0016
     * @tc.desc Verify testAudio02Chapter0016
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAudio02Chapter0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio02Chapter0016 start');
      await driver.delayMs(500);
      const spatialCard: Component | null = await driver.waitForComponent(ON.id('spatial_audio_card'), 8000);
      hilog.info(DOMAIN, TAG, 'spatial_audio_card exists: %{public}s', String(spatialCard !== null));
      expect(spatialCard !== null).assertTrue();
      await spatialCard!.click();
      await driver.delayMs(1000);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio02Chapter0016 end');
      done();
    });

    /**
     * @tc.number SUB_AUDIOTEST02_TEST_1700
     * @tc.name testAudio02Chapter0017
     * @tc.desc Verify testAudio02Chapter0017
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAudio02Chapter0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio02Chapter0017 start');
      await driver.delayMs(1000);
      const playBtn: Component | null = await driver.waitForComponent(ON.id('2P0_play_btn'), 8000);
      hilog.info(DOMAIN, TAG, '2P0_play_btn exists: %{public}s', String(playBtn !== null));
      expect(playBtn !== null).assertTrue();
      await playBtn!.click();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio02Chapter0017 end');
      done();
    });

    /**
     * @tc.number SUB_AUDIOTEST02_TEST_1800
     * @tc.name testAudio02Chapter0018
     * @tc.desc Verify testAudio02Chapter0018
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAudio02Chapter0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio02Chapter0018 start');
      await driver.delayMs(1000);
      const pauseBtn: Component | null = await driver.waitForComponent(ON.id('2P0_pause_btn'), 8000);
      hilog.info(DOMAIN, TAG, '2P0_pause_btn exists: %{public}s', String(pauseBtn !== null));
      expect(pauseBtn !== null).assertTrue();
      await driver.delayMs(500);
      await pauseBtn!.click();
      await driver.delayMs(500);
      const playBtn: Component | null = await driver.findComponent(ON.id('2P0_play_btn'));
      hilog.info(DOMAIN, TAG, '2P0_play_btn exists after pause: %{public}s', String(playBtn !== null));
      expect(playBtn !== null).assertTrue();
      await driver.delayMs(500);
      const backBtn: Component | null = await driver.findComponent(ON.id('spatial_audio_back_btn'));
      await driver.pressBack();
      await driver.delayMs(500);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio02Chapter0018 end');
      done();
    });

    /**
     * @tc.number SUB_AUDIOTEST02_TEST_1900
     * @tc.name testAudio02Chapter0019
     * @tc.desc Verify testAudio02Chapter0019
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAudio02Chapter0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio02Chapter0019 start');
      await driver.delayMs(500);
      const karaokeCard: Component | null = await driver.waitForComponent(ON.id('karaoke_card'), 8000);
      hilog.info(DOMAIN, TAG, 'karaoke_card exists: %{public}s', String(karaokeCard !== null));
      expect(karaokeCard !== null).assertTrue();
      await karaokeCard!.click();
      await driver.delayMs(1000);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio02Chapter0019 end');
      done();
    });

    /**
     * @tc.number SUB_AUDIOTEST02_TEST_2000
     * @tc.name testAudio02Chapter0020
     * @tc.desc Verify testAudio02Chapter0020
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAudio02Chapter0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio02Chapter0020 start');
      await driver.delayMs(1000);
      const statusText: Component | null = await driver.waitForComponent(ON.id('karaoke_status_text'), 8000);
      hilog.info(DOMAIN, TAG, 'karaoke_status_text exists: %{public}s', String(statusText !== null));
      expect(statusText !== null).assertTrue();
      const initBtn: Component | null = await driver.findComponent(ON.id('karaoke_init_btn'));
      hilog.info(DOMAIN, TAG, 'karaoke_init_btn exists: %{public}s', String(initBtn !== null));
      expect(initBtn !== null).assertTrue();
      const enableBtn: Component | null = await driver.findComponent(ON.id('karaoke_enable_btn'));
      hilog.info(DOMAIN, TAG, 'karaoke_enable_btn exists: %{public}s', String(enableBtn !== null));
      expect(enableBtn !== null).assertTrue();
      const disableBtn: Component | null = await driver.findComponent(ON.id('karaoke_disable_btn'));
      hilog.info(DOMAIN, TAG, 'karaoke_disable_btn exists: %{public}s', String(disableBtn !== null));
      expect(disableBtn !== null).assertTrue();
      const volumeSlider: Component | null = await driver.findComponent(ON.id('karaoke_volume_slider'));
      hilog.info(DOMAIN, TAG, 'karaoke_volume_slider exists: %{public}s', String(volumeSlider !== null));
      expect(volumeSlider !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio02Chapter0020 end');
      done();
    });

    /**
     * @tc.number SUB_AUDIOTEST02_TEST_2100
     * @tc.name testAudio02Chapter0021
     * @tc.desc Verify testAudio02Chapter0021
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAudio02Chapter0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio02Chapter0021 start');
      const initBtn: Component | null = await driver.waitForComponent(ON.id('karaoke_init_btn'), 8000);
      hilog.info(DOMAIN, TAG, 'karaoke_init_btn exists: %{public}s', String(initBtn !== null));
      expect(initBtn !== null).assertTrue();
      await initBtn!.click();
      await driver.delayMs(1000);
      const statusText: Component | null = await driver.findComponent(ON.id('karaoke_status_text'));
      hilog.info(DOMAIN, TAG, 'karaoke_status_text exists: %{public}s', String(statusText !== null));
      expect(statusText !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio02Chapter0021 end');
      done();
    });

    /**
     * @tc.number SUB_AUDIOTEST02_TEST_2200
     * @tc.name testAudio02Chapter0022
     * @tc.desc Verify testAudio02Chapter0022
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAudio02Chapter0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio02Chapter0022 start');
      const enableBtn: Component | null = await driver.waitForComponent(ON.id('karaoke_enable_btn'), 8000);
      hilog.info(DOMAIN, TAG, 'karaoke_enable_btn exists: %{public}s', String(enableBtn !== null));
      expect(enableBtn !== null).assertTrue();
      await enableBtn!.click();
      await driver.delayMs(1500);
      const statusText: Component | null = await driver.findComponent(ON.id('karaoke_status_text'));
      hilog.info(DOMAIN, TAG, 'karaoke_status_text exists: %{public}s', String(statusText !== null));
      expect(statusText !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio02Chapter0022 end');
      done();
    });

    /**
     * @tc.number SUB_AUDIOTEST02_TEST_2300
     * @tc.name testAudio02Chapter0023
     * @tc.desc Verify testAudio02Chapter0023
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAudio02Chapter0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio02Chapter0023 start');
      const disableBtn: Component | null = await driver.waitForComponent(ON.id('karaoke_disable_btn'), 8000);
      hilog.info(DOMAIN, TAG, 'karaoke_disable_btn exists: %{public}s', String(disableBtn !== null));
      expect(disableBtn !== null).assertTrue();
      await disableBtn!.click();
      await driver.delayMs(1000);
      const statusText: Component | null = await driver.findComponent(ON.id('karaoke_status_text'));
      hilog.info(DOMAIN, TAG, 'karaoke_status_text exists: %{public}s', String(statusText !== null));
      expect(statusText !== null).assertTrue();
      const backBtn: Component | null = await driver.findComponent(ON.id('karaoke_back_btn'));
      await driver.pressBack();
      await driver.delayMs(500);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio02Chapter0023 end');
      done();
    });
  });
}
