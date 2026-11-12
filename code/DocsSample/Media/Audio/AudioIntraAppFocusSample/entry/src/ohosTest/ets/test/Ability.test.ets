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

import { afterEach, beforeAll, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { Component, Driver, ON, abilityDelegatorRegistry as AbilityDelegatorRegistry } from '@kit.TestKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { AudioStreamController } from '../../../main/ets/common/utils/AudioStreamController';
import {
  AudioStreamState,
  InterruptMode,
  StreamUsageType
} from '../../../main/ets/common/constants/AudioConstants';

const BUNDLE_NAME: string = 'com.samples.intraappfocus';
const ABILITY_NAME: string = 'EntryAbility';
const TAG: string = 'AudioFocusTest';
const DOMAIN: number = 0xF811;

const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const appContext = delegator.getAppContext();

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

function sleep(duration: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(() => {
      resolve();
    }, duration);
  });
}

async function getString(resource: Resource): Promise<string> {
  return await appContext.resourceManager.getStringValue(resource);
}

async function clickId(driver: Driver, id: string, timeout: number): Promise<boolean> {
  if (!await waitForId(driver, id, Math.max(1, Math.floor(timeout / 300)))) {
    return false;
  }
  const component: Component = await driver.findComponent(ON.id(id));
  if (!component) {
    return false;
  }
  await component.click();
  return true;
}

// findComponent returns null when the component is missing,
// so existence must be checked with assertComponentExist, which throws 17000003 on absence.
async function existsById(driver: Driver, id: string): Promise<boolean> {
  try {
    await driver.assertComponentExist(ON.id(id));
    return true;
  } catch (err) {
    return false;
  }
}

async function waitForId(driver: Driver, id: string, attempts: number): Promise<boolean> {
  for (let i = 0; i < attempts; i++) {
    if (await existsById(driver, id)) {
      return true;
    }
    await sleep(300);
  }
  return false;
}

async function getTextById(driver: Driver, id: string): Promise<string> {
  if (!await existsById(driver, id)) {
    return '';
  }
  const component: Component = await driver.findComponent(ON.id(id));
  if (!component) {
    return '';
  }
  return await component.getText();
}

async function ensureIndex(driver: Driver): Promise<boolean> {
  for (let i = 0; i < 4; i++) {
    if (await waitForId(driver, 'enter_musicVsMusic', 2)) {
      return true;
    }
    await driver.pressBack();
    await sleep(800);
  }
  return false;
}

async function openScenario(driver: Driver, enterId: string): Promise<boolean> {
  const ready: boolean = await ensureIndex(driver);
  if (!ready) {
    return false;
  }
  const opened: boolean = await clickId(driver, enterId, 3000);
  if (!opened) {
    return false;
  }
  await sleep(1200);
  return true;
}

export default function abilityTest() {
  describe('AudioFocusTest', () => {
    beforeAll(async () => {
      log('beforeAll start');
      await delegator.startAbility({
        bundleName: BUNDLE_NAME,
        abilityName: ABILITY_NAME
      });
      await sleep(2500);
      const driver: Driver = Driver.create();
      const ready: boolean = await ensureIndex(driver);
      expect(ready).assertTrue();
      log('beforeAll end');
    });

    afterEach(async () => {
      const driver: Driver = Driver.create();
      const ready: boolean = await ensureIndex(driver);
      expect(ready).assertTrue();
    });

    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_0100
     * @tc.name      testAudioFocusStreamUsage0001
     * @tc.desc      Verify each stream usage type maps to the expected stream usage name.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testAudioFocusStreamUsage0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const usages: StreamUsageType[] = [StreamUsageType.MUSIC, StreamUsageType.MOVIE,
            StreamUsageType.GAME, StreamUsageType.AUDIOBOOK, StreamUsageType.NAVIGATION];
          const names: string[] = ['MUSIC', 'MOVIE', 'GAME', 'AUDIOBOOK', 'NAVIGATION'];
          for (let i = 0; i < usages.length; i++) {
            const controller: AudioStreamController = new AudioStreamController(usages[i]);
            expect(controller.getStreamUsageName()).assertEqual(names[i]);
          }
          const invalid: AudioStreamController =
            new AudioStreamController(StreamUsageType.INVALID);
          expect(invalid.getStreamUsageName()).assertEqual('MUSIC');
        } catch (err) {
          log(`testAudioFocusStreamUsage0001 failed: ${String(err)}`);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_0200
     * @tc.name      testAudioFocusShareMode0002
     * @tc.desc      Verify the share-mode audio stream starts, pauses, resumes, stops and releases.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testAudioFocusShareMode0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        const controller: AudioStreamController =
          new AudioStreamController(StreamUsageType.MUSIC);
        try {
          const states: AudioStreamState[] = [];
          controller.onStateChange((state: AudioStreamState) => {
            states.push(state);
          });
          const initialized: boolean = await controller.init(InterruptMode.SHARE_MODE);
          expect(initialized).assertTrue();
          await controller.startPlay();
          expect(controller.getIsPlaying()).assertTrue();
          expect(states.includes(AudioStreamState.RUNNING)).assertTrue();
          await controller.pausePlay();
          expect(controller.getIsPlaying()).assertFalse();
          expect(states.includes(AudioStreamState.PAUSED)).assertTrue();
          await controller.startPlay();
          expect(controller.getIsPlaying()).assertTrue();
          await controller.stopPlay();
          expect(controller.getIsPlaying()).assertFalse();
          expect(states.includes(AudioStreamState.STOPPED)).assertTrue();
          await controller.release();
          expect(states.includes(AudioStreamState.RELEASED)).assertTrue();
        } catch (err) {
          log(`testAudioFocusShareMode0002 failed: ${String(err)}`);
          expect().assertFail();
        } finally {
          await controller.release();
          done();
        }
      });

    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_0300
     * @tc.name      testAudioFocusIndependentMode0003
     * @tc.desc      Verify the independent-mode audio stream starts, stops and releases normally.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testAudioFocusIndependentMode0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        const controller: AudioStreamController =
          new AudioStreamController(StreamUsageType.MOVIE);
        try {
          const states: AudioStreamState[] = [];
          controller.onStateChange((state: AudioStreamState) => {
            states.push(state);
          });
          const initialized: boolean = await controller.init(InterruptMode.INDEPENDENT_MODE);
          expect(initialized).assertTrue();
          await controller.startPlay();
          expect(controller.getIsPlaying()).assertTrue();
          expect(states.includes(AudioStreamState.RUNNING)).assertTrue();
          await controller.stopPlay();
          expect(controller.getIsPlaying()).assertFalse();
          expect(states.includes(AudioStreamState.STOPPED)).assertTrue();
          await controller.release();
          expect(states.includes(AudioStreamState.RELEASED)).assertTrue();
        } catch (err) {
          log(`testAudioFocusIndependentMode0003 failed: ${String(err)}`);
          expect().assertFail();
        } finally {
          await controller.release();
          done();
        }
      });

    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_0400
     * @tc.name      testAudioFocusUninitialized0004
     * @tc.desc      Verify play, pause, stop and release calls are safe before initialization.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testAudioFocusUninitialized0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const controller: AudioStreamController =
            new AudioStreamController(StreamUsageType.MUSIC);
          await controller.startPlay();
          expect(controller.getIsPlaying()).assertFalse();
          await controller.pausePlay();
          expect(controller.getIsPlaying()).assertFalse();
          await controller.stopPlay();
          expect(controller.getIsPlaying()).assertFalse();
          expect(controller.getInterruptLog().length).assertEqual(0);
          controller.clearInterruptLog();
          await controller.release();
          expect(controller.getIsPlaying()).assertFalse();
        } catch (err) {
          log(`testAudioFocusUninitialized0004 failed: ${String(err)}`);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_0500
     * @tc.name      testAudioFocusIndependentFocus0005
     * @tc.desc      Verify that in independent mode a later stream stops the earlier one.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testAudioFocusIndependentFocus0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        const first: AudioStreamController =
          new AudioStreamController(StreamUsageType.MUSIC);
        const second: AudioStreamController =
          new AudioStreamController(StreamUsageType.MUSIC);
        try {
          const firstInit: boolean = await first.init(InterruptMode.INDEPENDENT_MODE);
          const secondInit: boolean = await second.init(InterruptMode.INDEPENDENT_MODE);
          expect(firstInit).assertTrue();
          expect(secondInit).assertTrue();
          await first.startPlay();
          await sleep(800);
          expect(first.getIsPlaying()).assertTrue();
          await second.startPlay();
          await sleep(1500);
          const stopped: boolean = !first.getIsPlaying();
          const interrupted: boolean = first.getInterruptLog().length > 0;
          log(`independent focus: stopped=${stopped}, interrupted=${interrupted}`);
          expect(stopped).assertTrue();
        } catch (err) {
          log(`testAudioFocusIndependentFocus0005 failed: ${String(err)}`);
          expect().assertFail();
        } finally {
          await second.release();
          await first.release();
          done();
        }
      });

    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_0600
     * @tc.name      testAudioFocusIndexUI0006
     * @tc.desc      Verify the index page shows both focus modes and all three scenarios.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testAudioFocusIndexUI0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          expect(await ensureIndex(driver)).assertTrue();
          const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc',
            'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame'];
          for (let i = 0; i < ids.length; i++) {
            expect(await waitForId(driver, ids[i], 5)).assertTrue();
          }
        } catch (err) {
          log(`testAudioFocusIndexUI0006 failed: ${String(err)}`);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_0700
     * @tc.name      testAudioFocusModeSwitch0007
     * @tc.desc      Verify switching between share mode and independent mode updates the description.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testAudioFocusModeSwitch0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          expect(await ensureIndex(driver)).assertTrue();
          expect(await clickId(driver, 'independentModeBtn', 3000)).assertTrue();
          await sleep(500);
          const independentDesc: string = await getTextById(driver, 'modeDesc');
          expect(independentDesc).assertEqual(await getString($r('app.string.independent_mode_desc')));
          expect(await clickId(driver, 'shareModeBtn', 3000)).assertTrue();
          await sleep(500);
          const shareDesc: string = await getTextById(driver, 'modeDesc');
          expect(shareDesc).assertEqual(await getString($r('app.string.share_mode_desc')));
        } catch (err) {
          log(`testAudioFocusModeSwitch0007 failed: ${String(err)}`);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_0800
     * @tc.name      testAudioFocusMusicVsMusic0008
     * @tc.desc      Verify app control pauses stream A when B starts and resumes A when B stops.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testAudioFocusMusicVsMusic0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          expect(await ensureIndex(driver)).assertTrue();
          expect(await clickId(driver, 'shareModeBtn', 3000)).assertTrue();
          await sleep(500);
          expect(await openScenario(driver, 'enter_musicVsMusic')).assertTrue();
          expect(await getTextById(driver, 'pageModeLabelMM')).assertEqual('SHARE_MODE');
          const playText: string = await getString($r('app.string.play_btn'));
          const stopText: string = await getString($r('app.string.stop_btn'));
          expect(await clickId(driver, 'appControlToggleMM', 3000)).assertTrue();
          await sleep(500);
          expect(await clickId(driver, 'playStopA', 3000)).assertTrue();
          await sleep(1500);
          expect(await getTextById(driver, 'playStopA')).assertEqual(stopText);
          expect(await clickId(driver, 'playStopB', 3000)).assertTrue();
          await sleep(1500);
          expect(await getTextById(driver, 'playStopA')).assertEqual(playText);
          expect(await getTextById(driver, 'playStopB')).assertEqual(stopText);
          expect(await clickId(driver, 'playStopB', 3000)).assertTrue();
          await sleep(1500);
          expect(await getTextById(driver, 'playStopA')).assertEqual(stopText);
          expect(await getTextById(driver, 'playStopB')).assertEqual(playText);
          expect(await clickId(driver, 'playStopA', 3000)).assertTrue();
          await sleep(500);
        } catch (err) {
          log(`testAudioFocusMusicVsMusic0008 failed: ${String(err)}`);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_0900
     * @tc.name      testAudioFocusMusicVsVideo0009
     * @tc.desc      Verify app control pauses music when video starts and resumes music when video stops.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testAudioFocusMusicVsVideo0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          expect(await ensureIndex(driver)).assertTrue();
          expect(await clickId(driver, 'shareModeBtn', 3000)).assertTrue();
          await sleep(500);
          expect(await openScenario(driver, 'enter_musicVsVideo')).assertTrue();
          expect(await getTextById(driver, 'pageModeLabelMV')).assertEqual('SHARE_MODE');
          const playText: string = await getString($r('app.string.play_btn'));
          const stopText: string = await getString($r('app.string.stop_btn'));
          expect(await clickId(driver, 'appControlToggleMV', 3000)).assertTrue();
          await sleep(500);
          expect(await clickId(driver, 'playStopmusicV', 3000)).assertTrue();
          await sleep(1500);
          expect(await getTextById(driver, 'playStopmusicV')).assertEqual(stopText);
          expect(await clickId(driver, 'playStopvideoV', 3000)).assertTrue();
          await sleep(1500);
          expect(await getTextById(driver, 'playStopmusicV')).assertEqual(playText);
          expect(await getTextById(driver, 'playStopvideoV')).assertEqual(stopText);
          expect(await clickId(driver, 'playStopvideoV', 3000)).assertTrue();
          await sleep(1500);
          expect(await getTextById(driver, 'playStopmusicV')).assertEqual(stopText);
          expect(await getTextById(driver, 'playStopvideoV')).assertEqual(playText);
          expect(await clickId(driver, 'playStopmusicV', 3000)).assertTrue();
          await sleep(500);
        } catch (err) {
          log(`testAudioFocusMusicVsVideo0009 failed: ${String(err)}`);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_1000
     * @tc.name      testAudioFocusMusicVsGame0010
     * @tc.desc      Verify music and game streams can play at the same time without interruption.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testAudioFocusMusicVsGame0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          expect(await ensureIndex(driver)).assertTrue();
          expect(await clickId(driver, 'shareModeBtn', 3000)).assertTrue();
          await sleep(500);
          expect(await openScenario(driver, 'enter_musicVsGame')).assertTrue();
          const stopText: string = await getString($r('app.string.stop_btn'));
          expect(await clickId(driver, 'playStopmusicG', 3000)).assertTrue();
          await sleep(1500);
          expect(await getTextById(driver, 'playStopmusicG')).assertEqual(stopText);
          expect(await clickId(driver, 'playStopgameG', 3000)).assertTrue();
          await sleep(1500);
          expect(await getTextById(driver, 'playStopmusicG')).assertEqual(stopText);
          expect(await getTextById(driver, 'playStopgameG')).assertEqual(stopText);
          expect(await clickId(driver, 'playStopgameG', 3000)).assertTrue();
          await sleep(500);
          expect(await clickId(driver, 'playStopmusicG', 3000)).assertTrue();
          await sleep(500);
        } catch (err) {
          log(`testAudioFocusMusicVsGame0010 failed: ${String(err)}`);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_1100
     * @tc.name      testAudioFocusIndependentUI0011
     * @tc.desc      Verify independent mode stops stream A when stream B starts.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testAudioFocusIndependentUI0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          expect(await ensureIndex(driver)).assertTrue();
          expect(await clickId(driver, 'independentModeBtn', 3000)).assertTrue();
          await sleep(500);
          expect(await openScenario(driver, 'enter_musicVsMusic')).assertTrue();
          expect(await getTextById(driver, 'pageModeLabelMM')).assertEqual('INDEPENDENT_MODE');
          const playText: string = await getString($r('app.string.play_btn'));
          const stopText: string = await getString($r('app.string.stop_btn'));
          expect(await clickId(driver, 'playStopA', 3000)).assertTrue();
          await sleep(1500);
          expect(await getTextById(driver, 'playStopA')).assertEqual(stopText);
          expect(await clickId(driver, 'playStopB', 3000)).assertTrue();
          await sleep(2000);
          expect(await getTextById(driver, 'playStopB')).assertEqual(stopText);
          expect(await getTextById(driver, 'playStopA')).assertEqual(playText);
        } catch (err) {
          log(`testAudioFocusIndependentUI0011 failed: ${String(err)}`);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_1200
     * @tc.name      testAudioFocusAppControlOff0012
     * @tc.desc      Verify both music streams play together when app control is off.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testAudioFocusAppControlOff0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          expect(await ensureIndex(driver)).assertTrue();
          expect(await clickId(driver, 'shareModeBtn', 3000)).assertTrue();
          await sleep(500);
          expect(await openScenario(driver, 'enter_musicVsMusic')).assertTrue();
          expect(await getTextById(driver, 'pageModeLabelMM')).assertEqual('SHARE_MODE');
          const playText: string = await getString($r('app.string.play_btn'));
          const stopText: string = await getString($r('app.string.stop_btn'));
          expect(await existsById(driver, 'appControlToggleMM')).assertTrue();
          const toggle: Component = await driver.findComponent(ON.id('appControlToggleMM'));
          expect(await toggle.isChecked()).assertFalse();
          expect(await clickId(driver, 'playStopA', 3000)).assertTrue();
          await sleep(1500);
          expect(await getTextById(driver, 'playStopA')).assertEqual(stopText);
          expect(await clickId(driver, 'playStopB', 3000)).assertTrue();
          await sleep(1500);
          expect(await getTextById(driver, 'playStopA')).assertEqual(stopText);
          expect(await getTextById(driver, 'playStopB')).assertEqual(stopText);
          expect(await clickId(driver, 'playStopB', 3000)).assertTrue();
          await sleep(1500);
          expect(await getTextById(driver, 'playStopA')).assertEqual(stopText);
          expect(await getTextById(driver, 'playStopB')).assertEqual(playText);
          expect(await clickId(driver, 'playStopA', 3000)).assertTrue();
          await sleep(500);
        } catch (err) {
          log(`testAudioFocusAppControlOff0012 failed: ${String(err)}`);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_1300
     * @tc.name      testAudioFocusAppControlOffVideo0013
     * @tc.desc      Verify music and video streams play together when app control is off.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testAudioFocusAppControlOffVideo0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          expect(await ensureIndex(driver)).assertTrue();
          expect(await clickId(driver, 'shareModeBtn', 3000)).assertTrue();
          await sleep(500);
          expect(await openScenario(driver, 'enter_musicVsVideo')).assertTrue();
          expect(await getTextById(driver, 'pageModeLabelMV')).assertEqual('SHARE_MODE');
          const playText: string = await getString($r('app.string.play_btn'));
          const stopText: string = await getString($r('app.string.stop_btn'));
          expect(await existsById(driver, 'appControlToggleMV')).assertTrue();
          const toggle: Component = await driver.findComponent(ON.id('appControlToggleMV'));
          expect(await toggle.isChecked()).assertFalse();
          expect(await clickId(driver, 'playStopmusicV', 3000)).assertTrue();
          await sleep(1500);
          expect(await getTextById(driver, 'playStopmusicV')).assertEqual(stopText);
          expect(await clickId(driver, 'playStopvideoV', 3000)).assertTrue();
          await sleep(1500);
          expect(await getTextById(driver, 'playStopmusicV')).assertEqual(stopText);
          expect(await getTextById(driver, 'playStopvideoV')).assertEqual(stopText);
          expect(await clickId(driver, 'playStopvideoV', 3000)).assertTrue();
          await sleep(1500);
          expect(await getTextById(driver, 'playStopmusicV')).assertEqual(stopText);
          expect(await getTextById(driver, 'playStopvideoV')).assertEqual(playText);
          expect(await clickId(driver, 'playStopmusicV', 3000)).assertTrue();
          await sleep(500);
        } catch (err) {
          log(`testAudioFocusAppControlOffVideo0013 failed: ${String(err)}`);
          expect().assertFail();
        } finally {
          done();
        }
      });
  });
}
