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
import { describe, it, expect, beforeAll, TestType, Size, Level } from '@ohos/hypium';
import { Driver } from '@kit.TestKit';
import {
  CaptureMode,
  MIN_RECORD_SECOND,
  TIME_PATTERN,
  parseSeconds,
  openCapturePage,
  tapId,
  exists,
  getIdText,
  recordForSeconds,
  startButtonOf,
  ensureHomeReady
} from './shared/AudioDriver';

const SHOW_TIME_ID: string = 'normal_show_time_txt';
const STOP_ID: string = 'normal_stop_record_btn';
const PAUSE_ID: string = 'normal_pause_record_btn';
const CONTINUE_ID: string = 'normal_continue_record_btn';
const PLAYER_ID: string = 'normal_player';

interface TickSample {
  text: string;
  seconds: number;
  valid: boolean;
}

async function readShowTime(driver: Driver): Promise<string> {
  const text: string | null = await getIdText(driver, SHOW_TIME_ID);
  return text === null ? '' : text;
}

async function sampleTicks(driver: Driver, count: number): Promise<TickSample[]> {
  const samples: TickSample[] = [];
  for (let i = 0; i < count; i++) {
    await driver.delayMs(1000);
    const text: string = await readShowTime(driver);
    samples.push({ text: text, seconds: parseSeconds(text), valid: TIME_PATTERN.test(text) });
  }
  return samples;
}

export default function audioCaptureLifecycle() {
  describe('AudioCaptureLifecycle', () => {
    const driver: Driver = Driver.create();
    beforeAll(async () => {
      await ensureHomeReady(driver);
    });

    /**
     * @tc.number SUB_AUDIO_CAPTURE_LIFE_0100
     * @tc.name testCaptureLife0001
     * @tc.desc Verify a freshly opened capturer page shows a zeroed timer and only the start control
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testCaptureLife0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await openCapturePage(driver, CaptureMode.NORMAL)).assertTrue();
      expect(await exists(driver, SHOW_TIME_ID)).assertFalse();
      expect(parseSeconds('00:00:00')).assertEqual(0);
      expect(await exists(driver, STOP_ID)).assertFalse();
      expect(await exists(driver, startButtonOf(CaptureMode.NORMAL))).assertTrue();
      expect(await exists(driver, PAUSE_ID)).assertFalse();
    });

    /**
     * @tc.number SUB_AUDIO_CAPTURE_LIFE_0200
     * @tc.name testCaptureLife0002
     * @tc.desc Verify starting a recording swaps the start control for stop and pause controls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testCaptureLife0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await openCapturePage(driver, CaptureMode.NORMAL)).assertTrue();
      expect(await tapId(driver, startButtonOf(CaptureMode.NORMAL), 1500)).assertTrue();
      expect(await exists(driver, STOP_ID)).assertTrue();
      expect(await exists(driver, PAUSE_ID)).assertTrue();
      expect(await exists(driver, startButtonOf(CaptureMode.NORMAL))).assertFalse();
      expect(await exists(driver, CONTINUE_ID)).assertFalse();
    });

    /**
     * @tc.number SUB_AUDIO_CAPTURE_LIFE_0500
     * @tc.name testCaptureLife0006
     * @tc.desc Verify stopping below the minimum record length keeps the page recording and hides the player
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testCaptureLife0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await openCapturePage(driver, CaptureMode.NORMAL)).assertTrue();
      expect(await tapId(driver, startButtonOf(CaptureMode.NORMAL), 1500)).assertTrue();
      await recordForSeconds(driver, 2);
      expect(parseSeconds(await readShowTime(driver)) < MIN_RECORD_SECOND).assertTrue();
      expect(await tapId(driver, STOP_ID, 1200)).assertTrue();
      expect(await exists(driver, STOP_ID)).assertTrue();
      expect(await exists(driver, PLAYER_ID)).assertFalse();
      expect(await exists(driver, 'disalbe_btn')).assertFalse();
    });

    /**
     * @tc.number SUB_AUDIO_CAPTURE_LIFE_0700
     * @tc.name testCaptureLife0008
     * @tc.desc Verify tapping the finished recording card starts playback and marks it playing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testCaptureLife0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await openCapturePage(driver, CaptureMode.NORMAL)).assertTrue();
      expect(await tapId(driver, startButtonOf(CaptureMode.NORMAL), 1500)).assertTrue();
      await recordForSeconds(driver, MIN_RECORD_SECOND + 2);
      expect(await tapId(driver, STOP_ID, 2000)).assertTrue();
      expect(await exists(driver, 'paused_state')).assertTrue();
      expect(await tapId(driver, PLAYER_ID, 1500)).assertTrue();
      expect(await exists(driver, 'playing_state')).assertTrue();
      expect(await exists(driver, 'paused_state')).assertFalse();
    });

    /**
     * @tc.number SUB_AUDIO_CAPTURE_LIFE_0800
     * @tc.name testCaptureLife0010
     * @tc.desc Verify the live capturer page exposes its own idle controls and timer before recording
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testCaptureLife0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await openCapturePage(driver, CaptureMode.LIVE)).assertTrue();
      expect(await exists(driver, startButtonOf(CaptureMode.LIVE))).assertTrue();
      expect(await exists(driver, 'live_show_time_txt')).assertFalse();
      expect(await exists(driver, STOP_ID)).assertFalse();
      expect(await exists(driver, 'live_stop_record_btn')).assertFalse();
      expect(await exists(driver, 'btn_live_capturer')).assertTrue();
    });

  });
}
