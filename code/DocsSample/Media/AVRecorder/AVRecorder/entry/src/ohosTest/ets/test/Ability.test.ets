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
import { Component, Driver, ON } from '@ohos.UiTest';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import fileIo from '@ohos.file.fs';
import { hilog } from '@kit.PerformanceAnalysisKit';
import DateTimeUtil, { dateTime, getShownTimer } from '../../../main/ets/utils/DateTimeUtil';

const BUNDLE_NAME: string = 'com.demo.avrecorder01';
const ABILITY_NAME: string = 'EntryAbility';
const TAG: string = 'AVRecorderTest';
const DOMAIN: number = 0xF811;
const DELAY_SHORT: number = 1000;
const DELAY_MEDIUM: number = 2500;
const AUDIO_FILE: string = 'audio_example.m4a';
const VIDEO_FILE: string = 'video_example.mp4';

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

async function grantPermissions(driver: Driver): Promise<number> {
  let granted: number = 0;
  for (let i = 0; i < 6; i++) {
    const allow: Component = await driver.waitForComponent(ON.text('允许'), 1500);
    if (!allow) {
      break;
    }
    await allow.click();
    granted++;
    await sleep(800);
  }
  return granted;
}

async function ensureIndex(driver: Driver): Promise<boolean> {
  for (let i = 0; i < 4; i++) {
    if (await waitForId(driver, 'videoRecorderPage', 2)) {
      return true;
    }
    await driver.pressBack();
    await sleep(800);
  }
  return false;
}

async function openPage(driver: Driver, pageId: string): Promise<boolean> {
  const ready: boolean = await ensureIndex(driver);
  if (!ready) {
    return false;
  }
  if (!await waitForId(driver, pageId, 10)) {
    return false;
  }
  const entry: Component = await driver.findComponent(ON.id(pageId));
  if (!entry) {
    return false;
  }
  await entry.click();
  await sleep(1200);
  return true;
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

async function stopIfRecording(driver: Driver): Promise<void> {
  const stopIds: string[] = ['audioStop', 'audioStopNative', 'videoStop', 'videoStopNative'];
  for (let i = 0; i < stopIds.length; i++) {
    const stopButton: Component = await driver.findComponent(ON.id(stopIds[i]).clickable(true));
    if (stopButton) {
      await stopButton.click();
      await sleep(1000);
    }
  }
}

function recordDirCandidates(): string[] {
  const dirs: string[] = [];
  dirs.push(appContext.filesDir.replace('entry_test', 'entry'));
  dirs.push('/data/storage/el2/base/haps/entry/files');
  return dirs;
}

function recordFileSize(name: string): number {
  const dirs: string[] = recordDirCandidates();
  for (let i = 0; i < dirs.length; i++) {
    try {
      const stat = fileIo.statSync(dirs[i] + '/' + name);
      return stat.size;
    } catch (err) {
    }
  }
  return -1;
}

function deleteRecordFile(name: string): void {
  const dirs: string[] = recordDirCandidates();
  for (let i = 0; i < dirs.length; i++) {
    try {
      fileIo.unlinkSync(dirs[i] + '/' + name);
    } catch (err) {
    }
  }
}

export default function abilityTest() {
  describe('AVRecorderTest', () => {
    beforeAll(async () => {
      log('beforeAll start');
      await delegator.startAbility({
        bundleName: BUNDLE_NAME,
        abilityName: ABILITY_NAME
      });
      await sleep(DELAY_MEDIUM);
      const driver: Driver = Driver.create();
      const granted: number = await grantPermissions(driver);
      log(`permission dialogs granted: ${granted}`);
      await sleep(DELAY_SHORT);
      const ready: boolean = await ensureIndex(driver);
      expect(ready).assertTrue();
      log('beforeAll end');
    });

    afterEach(async () => {
      const driver: Driver = Driver.create();
      await stopIfRecording(driver);
      const ready: boolean = await ensureIndex(driver);
      expect(ready).assertTrue();
    });

    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_0100
     * @tc.name      testAVRecorderLaunch0001
     * @tc.desc      Start the application and verify all four recorder entries are displayed.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testAVRecorderLaunch0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          const ready: boolean = await ensureIndex(driver);
          expect(ready).assertTrue();
          const pageIds: string[] = ['videoRecorderPage', 'audioRecorderPage',
            'videoRecorderNativePage', 'audioRecorderNativePage'];
          for (let i = 0; i < pageIds.length; i++) {
            expect(await waitForId(driver, pageIds[i], 5)).assertTrue();
          }
        } catch (err) {
          log(`testAVRecorderLaunch0001 failed: ${String(err)}`);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_0200
     * @tc.name      testAVRecorderAudioRecord0002
     * @tc.desc      Record and stop audio with ArkTS, verify the timer changes and the file is created.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testAVRecorderAudioRecord0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          const opened: boolean = await openPage(driver, 'audioRecorderPage');
          log(`audio 0102 opened: ${opened}`);
          expect(opened).assertTrue();
          const start: Component = await driver.waitForComponent(ON.id('audioStart'), 3000);
          const startReady: boolean = await existsById(driver, 'audioStart');
          const settingReady: boolean = await existsById(driver, 'audioSetting');
          log(`audio 0102 start=${startReady}, setting=${settingReady}`);
          expect(startReady).assertTrue();
          expect(settingReady).assertTrue();
          deleteRecordFile(AUDIO_FILE);
          await start.click();
          await sleep(DELAY_MEDIUM);
          const stop: Component = await driver.waitForComponent(ON.id('audioStop'), 3000);
          expect(await existsById(driver, 'audioStop')).assertTrue();
          expect(await existsById(driver, 'audioPause')).assertTrue();
          const runningText: string = await getTextById(driver, 'audioTime');
          expect(runningText === '00:00').assertFalse();
          await stop.click();
          await sleep(1500);
          await await driver.waitForComponent(ON.id('audioStart'), 3000);
          expect(await existsById(driver, 'audioStart')).assertTrue();
          const resetText: string = await getTextById(driver, 'audioTime');
          expect(resetText).assertEqual('00:00');
          const size: number = recordFileSize(AUDIO_FILE);
          log(`audio file size: ${size}`);
          expect(size).assertLarger(1000);
        } catch (err) {
          log(`testAVRecorderAudioRecord0002 failed: ${String(err)}`);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_0300
     * @tc.name      testAVRecorderAudioPauseResume0003
     * @tc.desc      Pause audio recording, verify the timer freezes, then resume and stop.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testAVRecorderAudioPauseResume0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          expect(await openPage(driver, 'audioRecorderPage')).assertTrue();
          expect(await clickId(driver, 'audioStart', 3000)).assertTrue();
          await sleep(DELAY_MEDIUM);
          expect(await clickId(driver, 'audioPause', 3000)).assertTrue();
          await sleep(800);
          const pausedText: string = await getTextById(driver, 'audioTime');
          await sleep(1500);
          const pausedAgain: string = await getTextById(driver, 'audioTime');
          expect(pausedAgain).assertEqual(pausedText);
          const resume: Component = await driver.waitForComponent(ON.id('audioResume'), 3000);
          expect(await existsById(driver, 'audioResume')).assertTrue();
          await resume.click();
          await sleep(1800);
          const resumedText: string = await getTextById(driver, 'audioTime');
          expect(resumedText === pausedText).assertFalse();
          expect(await clickId(driver, 'audioStop', 3000)).assertTrue();
          await sleep(DELAY_SHORT);
          expect(await existsById(driver, 'audioStart')).assertTrue();
        } catch (err) {
          log(`testAVRecorderAudioPauseResume0003 failed: ${String(err)}`);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_0400
     * @tc.name      testAVRecorderAudioSettings0004
     * @tc.desc      Open the audio parameter dialog, cancel it, then select 96000 Hz and confirm.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testAVRecorderAudioSettings0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          expect(await openPage(driver, 'audioRecorderPage')).assertTrue();
          expect(await clickId(driver, 'audioSetting', 3000)).assertTrue();
          await sleep(800);
          const cancel: Component = await driver.findComponent(ON.id('audioCancel'));
          expect(await existsById(driver, 'audioCancel')).assertTrue();
          expect(await existsById(driver, 'audioConfirm')).assertTrue();
          await cancel.click();
          await sleep(800);
          expect(await existsById(driver, 'audioStart')).assertTrue();
          expect(await clickId(driver, 'audioSetting', 3000)).assertTrue();
          await sleep(800);
          const found = await driver.findComponents(ON.type('Radio'));
          const radios: Array<Component> = found ? found : [];
          expect(radios.length).assertLarger(1);
          await radios[radios.length - 1].click();
          await sleep(500);
          expect(await clickId(driver, 'audioConfirm', 3000)).assertTrue();
          await sleep(800);
          const start: Component = await driver.findComponent(ON.id('audioStart'));
          expect(await existsById(driver, 'audioStart')).assertTrue();
          deleteRecordFile(AUDIO_FILE);
          await start.click();
          await sleep(DELAY_MEDIUM);
          expect(await clickId(driver, 'audioStop', 3000)).assertTrue();
          await sleep(1500);
          const size: number = recordFileSize(AUDIO_FILE);
          log(`audio 96000 file size: ${size}`);
          expect(size).assertLarger(1000);
        } catch (err) {
          log(`testAVRecorderAudioSettings0004 failed: ${String(err)}`);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_0500
     * @tc.name      testAVRecorderAudioNativeRecord0005
     * @tc.desc      Record and stop audio with the Native page, verify the timer and output file.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testAVRecorderAudioNativeRecord0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          expect(await openPage(driver, 'audioRecorderNativePage')).assertTrue();
          const start: Component = await driver.waitForComponent(ON.id('audioStartNative'), 3000);
          expect(await existsById(driver, 'audioStartNative')).assertTrue();
          deleteRecordFile(AUDIO_FILE);
          await start.click();
          await sleep(DELAY_MEDIUM);
          const stop: Component = await driver.waitForComponent(ON.id('audioStopNative'), 3000);
          expect(await existsById(driver, 'audioStopNative')).assertTrue();
          expect(await existsById(driver, 'audioPauseNative')).assertTrue();
          const runningText: string = await getTextById(driver, 'audioTimeNative');
          expect(runningText === '00:00').assertFalse();
          await stop.click();
          await sleep(1500);
          await await driver.waitForComponent(ON.id('audioStartNative'), 3000);
          expect(await existsById(driver, 'audioStartNative')).assertTrue();
          const size: number = recordFileSize(AUDIO_FILE);
          log(`audio Native file size: ${size}`);
          expect(size).assertLarger(1000);
        } catch (err) {
          log(`testAVRecorderAudioNativeRecord0005 failed: ${String(err)}`);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_0600
     * @tc.name      testAVRecorderAudioNativePauseResume0006
     * @tc.desc      Pause and resume audio recording on the Native page, then stop it.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testAVRecorderAudioNativePauseResume0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          expect(await openPage(driver, 'audioRecorderNativePage')).assertTrue();
          expect(await clickId(driver, 'audioStartNative', 3000)).assertTrue();
          await sleep(DELAY_MEDIUM);
          expect(await clickId(driver, 'audioPauseNative', 3000)).assertTrue();
          await sleep(800);
          const pausedText: string = await getTextById(driver, 'audioTimeNative');
          await sleep(1500);
          const pausedAgain: string = await getTextById(driver, 'audioTimeNative');
          expect(pausedAgain).assertEqual(pausedText);
          expect(await clickId(driver, 'audioResumeNative', 3000)).assertTrue();
          await sleep(1800);
          const resumedText: string = await getTextById(driver, 'audioTimeNative');
          expect(resumedText === pausedText).assertFalse();
          expect(await clickId(driver, 'audioStopNative', 3000)).assertTrue();
          await sleep(DELAY_SHORT);
          expect(await existsById(driver, 'audioStartNative')).assertTrue();
        } catch (err) {
          log(`testAVRecorderAudioNativePauseResume0006 failed: ${String(err)}`);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_0700
     * @tc.name      testAVRecorderVideoRecord0007
     * @tc.desc      Record and stop video with ArkTS, verify the timer changes and the file is created.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testAVRecorderVideoRecord0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          expect(await openPage(driver, 'videoRecorderPage')).assertTrue();
          const start: Component = await driver.waitForComponent(ON.id('videoStart'), 5000);
          expect(await existsById(driver, 'videoStart')).assertTrue();
          expect(await existsById(driver, 'videoSetting')).assertTrue();
          deleteRecordFile(VIDEO_FILE);
          await start.click();
          await sleep(3000);
          const stop: Component = await driver.waitForComponent(ON.id('videoStop'), 3000);
          expect(await existsById(driver, 'videoStop')).assertTrue();
          expect(await existsById(driver, 'videoPause')).assertTrue();
          const runningText: string = await getTextById(driver, 'videoTime');
          expect(runningText === '00:00').assertFalse();
          await stop.click();
          await sleep(DELAY_MEDIUM);
          await await driver.waitForComponent(ON.id('videoStart'), 3000);
          expect(await existsById(driver, 'videoStart')).assertTrue();
          const resetText: string = await getTextById(driver, 'videoTime');
          expect(resetText).assertEqual('00:00');
          const size: number = recordFileSize(VIDEO_FILE);
          log(`video file size: ${size}`);
          expect(size).assertLarger(10000);
        } catch (err) {
          log(`testAVRecorderVideoRecord0007 failed: ${String(err)}`);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_0800
     * @tc.name      testAVRecorderVideoPauseResume0008
     * @tc.desc      Pause video recording, verify the timer freezes, then resume and stop.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testAVRecorderVideoPauseResume0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          expect(await openPage(driver, 'videoRecorderPage')).assertTrue();
          expect(await clickId(driver, 'videoStart', 5000)).assertTrue();
          await sleep(3000);
          expect(await clickId(driver, 'videoPause', 3000)).assertTrue();
          await sleep(800);
          const pausedText: string = await getTextById(driver, 'videoTime');
          await sleep(1500);
          const pausedAgain: string = await getTextById(driver, 'videoTime');
          expect(pausedAgain).assertEqual(pausedText);
          expect(await clickId(driver, 'videoResume', 3000)).assertTrue();
          await sleep(1800);
          const resumedText: string = await getTextById(driver, 'videoTime');
          expect(resumedText === pausedText).assertFalse();
          expect(await clickId(driver, 'videoStop', 3000)).assertTrue();
          await sleep(DELAY_MEDIUM);
          expect(await existsById(driver, 'videoStart')).assertTrue();
        } catch (err) {
          log(`testAVRecorderVideoPauseResume0008 failed: ${String(err)}`);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_0900
     * @tc.name      testAVRecorderVideoSettings0009
     * @tc.desc      Open the video parameter dialog, cancel it, select 720p, confirm and record.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testAVRecorderVideoSettings0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          expect(await openPage(driver, 'videoRecorderPage')).assertTrue();
          expect(await clickId(driver, 'videoSetting', 3000)).assertTrue();
          await sleep(800);
          const cancel: Component = await driver.findComponent(ON.id('videoCancel'));
          expect(await existsById(driver, 'videoCancel')).assertTrue();
          expect(await existsById(driver, 'videoConfirm')).assertTrue();
          await cancel.click();
          await sleep(800);
          expect(await existsById(driver, 'videoStart')).assertTrue();
          expect(await clickId(driver, 'videoSetting', 3000)).assertTrue();
          await sleep(800);
          const found = await driver.findComponents(ON.type('Radio'));
          const radios: Array<Component> = found ? found : [];
          expect(radios.length).assertLarger(1);
          await radios[0].click();
          await sleep(500);
          expect(await clickId(driver, 'videoConfirm', 3000)).assertTrue();
          await sleep(800);
          deleteRecordFile(VIDEO_FILE);
          expect(await clickId(driver, 'videoStart', 5000)).assertTrue();
          await sleep(3000);
          expect(await clickId(driver, 'videoStop', 3000)).assertTrue();
          await sleep(DELAY_MEDIUM);
          const size: number = recordFileSize(VIDEO_FILE);
          log(`video 720p file size: ${size}`);
          expect(size).assertLarger(10000);
        } catch (err) {
          log(`testAVRecorderVideoSettings0009 failed: ${String(err)}`);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_1000
     * @tc.name      testAVRecorderVideoNativeRecord0010
     * @tc.desc      Record and stop video with the Native page, verify the timer and output file.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testAVRecorderVideoNativeRecord0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          expect(await openPage(driver, 'videoRecorderNativePage')).assertTrue();
          const start: Component = await driver.waitForComponent(ON.id('videoStartNative'), 5000);
          expect(await existsById(driver, 'videoStartNative')).assertTrue();
          deleteRecordFile(VIDEO_FILE);
          await start.click();
          await sleep(3000);
          const stop: Component = await driver.waitForComponent(ON.id('videoStopNative'), 3000);
          expect(await existsById(driver, 'videoStopNative')).assertTrue();
          expect(await existsById(driver, 'videoPauseNative')).assertTrue();
          const runningText: string = await getTextById(driver, 'videoTimeNative');
          expect(runningText === '00:00').assertFalse();
          await stop.click();
          await sleep(DELAY_MEDIUM);
          await await driver.waitForComponent(ON.id('videoStartNative'), 3000);
          expect(await existsById(driver, 'videoStartNative')).assertTrue();
          const size: number = recordFileSize(VIDEO_FILE);
          log(`video Native file size: ${size}`);
          expect(size).assertLarger(0);
        } catch (err) {
          log(`testAVRecorderVideoNativeRecord0010 failed: ${String(err)}`);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_1100
     * @tc.name      testAVRecorderVideoNativePauseResume0011
     * @tc.desc      Pause and resume video recording on the Native page, then stop it.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testAVRecorderVideoNativePauseResume0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          expect(await openPage(driver, 'videoRecorderNativePage')).assertTrue();
          expect(await clickId(driver, 'videoStartNative', 5000)).assertTrue();
          await sleep(3000);
          expect(await clickId(driver, 'videoPauseNative', 3000)).assertTrue();
          await sleep(800);
          const pausedText: string = await getTextById(driver, 'videoTimeNative');
          await sleep(1500);
          const pausedAgain: string = await getTextById(driver, 'videoTimeNative');
          expect(pausedAgain).assertEqual(pausedText);
          expect(await clickId(driver, 'videoResumeNative', 3000)).assertTrue();
          await sleep(1800);
          const resumedText: string = await getTextById(driver, 'videoTimeNative');
          expect(resumedText === pausedText).assertFalse();
          expect(await clickId(driver, 'videoStopNative', 3000)).assertTrue();
          await sleep(DELAY_MEDIUM);
          expect(await existsById(driver, 'videoStartNative')).assertTrue();
        } catch (err) {
          log(`testAVRecorderVideoNativePauseResume0011 failed: ${String(err)}`);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_1200
     * @tc.name      testAVRecorderDateTimeUtil0012
     * @tc.desc      Verify the date and time formatting utilities at boundary values.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testAVRecorderDateTimeUtil0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const util: DateTimeUtil = new DateTimeUtil();
          expect(util.fill(9)).assertEqual('09');
          expect(util.fill(10)).assertEqual('10');
          expect(util.concatDate(2026, 10, 27)).assertEqual('20261027');
          expect(util.concatTime(9, 5, 0)).assertEqual('090500');
          expect(getShownTimer(0)).assertEqual('0:0');
          expect(getShownTimer(59000)).assertEqual('0:59');
          expect(getShownTimer(60000)).assertEqual('1:0');
          expect(getShownTimer(61000)).assertEqual('1:1');
          expect(dateTime(0)).assertEqual('00:00');
          expect(dateTime(59)).assertEqual('00:59');
          expect(dateTime(60)).assertEqual('01:00');
          expect(dateTime(61)).assertEqual('01:01');
          expect(dateTime(3599)).assertEqual('59:59');
          expect(dateTime(3600)).assertEqual('00:00');
        } catch (err) {
          log(`testAVRecorderDateTimeUtil0012 failed: ${String(err)}`);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_1300
     * @tc.name      testAVRecorderFileOutput0013
     * @tc.desc      Verify both the audio and video output files exist and are not empty.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testAVRecorderFileOutput0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const audioSize: number = recordFileSize(AUDIO_FILE);
          const videoSize: number = recordFileSize(VIDEO_FILE);
          log(`final file sizes: audio=${audioSize}, video=${videoSize}`);
          expect(audioSize).assertLarger(1000);
          expect(videoSize).assertLarger(0);
        } catch (err) {
          log(`testAVRecorderFileOutput0013 failed: ${String(err)}`);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_1400
     * @tc.name      testAVRecorderAudioSampleRates0014
     * @tc.desc      Record audio at 8000 and 22050 Hz and verify both output files are valid.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testAVRecorderAudioSampleRates0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          expect(await openPage(driver, 'audioRecorderPage')).assertTrue();
          const rates: number[] = [8000, 22050];
          const indexes: number[] = [0, 1];
          for (let i = 0; i < indexes.length; i++) {
            expect(await clickId(driver, 'audioSetting', 3000)).assertTrue();
            await sleep(300);
            const found = await driver.findComponents(ON.type('Radio'));
            const radios: Array<Component> = found ? found : [];
            expect(radios.length).assertLarger(indexes[i]);
            await radios[indexes[i]].click();
            await sleep(200);
            expect(await clickId(driver, 'audioConfirm', 3000)).assertTrue();
            await sleep(300);
            deleteRecordFile(AUDIO_FILE);
            const start: Component = await driver.waitForComponent(ON.id('audioStart').clickable(true), 3000);
            expect(await existsById(driver, 'audioStart')).assertTrue();
            await start.click();
            await sleep(800);
            const stop: Component = await driver.waitForComponent(ON.id('audioStop').clickable(true), 3000);
            expect(await existsById(driver, 'audioStop')).assertTrue();
            await stop.click();
            await sleep(600);
            const size: number = recordFileSize(AUDIO_FILE);
            log(`audio ${rates[i]} file size: ${size}`);
            expect(size).assertLarger(1000);
          }
        } catch (err) {
          log(`testAVRecorderAudioSampleRates0014 failed: ${String(err)}`);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_1500
     * @tc.name      testAVRecorderAudioSampleRatePersist0015
     * @tc.desc      Select 44100 Hz, record audio, then verify the selected rate persists in the settings dialog.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testAVRecorderAudioSampleRatePersist0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          expect(await openPage(driver, 'audioRecorderPage')).assertTrue();
          expect(await clickId(driver, 'audioSetting', 3000)).assertTrue();
          await sleep(300);
          let found = await driver.findComponents(ON.type('Radio'));
          let radios: Array<Component> = found ? found : [];
          expect(radios.length).assertLarger(3);
          await radios[3].click();
          await sleep(200);
          expect(await clickId(driver, 'audioConfirm', 3000)).assertTrue();
          await sleep(300);
          deleteRecordFile(AUDIO_FILE);
          expect(await clickId(driver, 'audioStart', 3000)).assertTrue();
          await sleep(800);
          expect(await clickId(driver, 'audioStop', 3000)).assertTrue();
          await sleep(600);
          const size: number = recordFileSize(AUDIO_FILE);
          log(`audio 44100 file size: ${size}`);
          expect(size).assertLarger(1000);
          expect(await clickId(driver, 'audioSetting', 3000)).assertTrue();
          await sleep(500);
          found = await driver.findComponents(ON.type('Radio'));
          radios = found ? found : [];
          expect(radios.length).assertLarger(3);
          const persisted: boolean = await radios[3].isChecked();
          log(`audio 44100 persisted=${persisted}`);
          expect(persisted).assertTrue();
          expect(await clickId(driver, 'audioCancel', 3000)).assertTrue();
        } catch (err) {
          log(`testAVRecorderAudioSampleRatePersist0015 failed: ${String(err)}`);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_1600
     * @tc.name      testAVRecorderRepeatedRecord0016
     * @tc.desc      Record audio twice in a row and verify the recorder can be reused after stopping.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testAVRecorderRepeatedRecord0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          expect(await openPage(driver, 'audioRecorderPage')).assertTrue();
          for (let i = 0; i < 2; i++) {
            deleteRecordFile(AUDIO_FILE);
            const start: Component = await driver.waitForComponent(ON.id('audioStart').clickable(true), 3000);
            expect(await existsById(driver, 'audioStart')).assertTrue();
            await start.click();
            await sleep(1200);
            const timer: string = await getTextById(driver, 'audioTime');
            log(`repeated record ${i} timer=${timer}`);
            expect(timer === '00:00').assertFalse();
            const stop: Component = await driver.waitForComponent(ON.id('audioStop').clickable(true), 3000);
            expect(await existsById(driver, 'audioStop')).assertTrue();
            await stop.click();
            await sleep(1000);
            const size: number = recordFileSize(AUDIO_FILE);
            log(`repeated record ${i} file size: ${size}`);
            expect(size).assertLarger(1000);
            await await driver.waitForComponent(ON.id('audioStart').clickable(true), 3000);
            expect(await existsById(driver, 'audioStart')).assertTrue();
          }
        } catch (err) {
          log(`testAVRecorderRepeatedRecord0016 failed: ${String(err)}`);
          expect().assertFail();
        } finally {
          done();
        }
      });
  });
}
