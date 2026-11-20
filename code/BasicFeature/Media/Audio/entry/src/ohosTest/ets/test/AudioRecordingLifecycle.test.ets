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
import { Driver } from '@kit.TestKit';
import {
  ensureHomeReady,
  HOME_ID,
  tapId,
  exists,
  openCapturePage,
  CaptureMode,
  startButtonOf
} from './shared/AudioDriver';

const STOP_ID: string = 'normal_stop_record_btn';
const TIME_ID: string = 'normal_show_time_txt';
const PLAYER_ID: string = 'normal_player';

export default function audioRecordingLifecycle() {
  describe('AudioRecordingLifecycle', () => {
    const driver: Driver = Driver.create();

    beforeAll(async () => {
      await ensureHomeReady(driver);
    });

    /**
     * @tc.number SUB_AUDIO_RECORDING_LIFE_0100
     * @tc.name testRecordLifecycle0002
     * @tc.desc Verify reopening the capturer page after leaving recording starts from a clean idle state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testRecordLifecycle0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await openCapturePage(driver, CaptureMode.NORMAL)).assertTrue();
      expect(await exists(driver, startButtonOf(CaptureMode.NORMAL))).assertTrue();
      expect(await exists(driver, STOP_ID)).assertFalse();
      expect(await exists(driver, TIME_ID)).assertFalse();
      expect(await exists(driver, PLAYER_ID)).assertFalse();
    });

    /**
     * @tc.number SUB_AUDIO_RECORDING_LIFE_0200
     * @tc.name testRecordLifecycle0003
     * @tc.desc Verify entering and leaving the capturer page twice keeps the home page reachable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRecordLifecycle0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(await openCapturePage(driver, CaptureMode.NORMAL)).assertTrue();
      await driver.pressBack();
      await driver.delayMs(1000);
      expect(await exists(driver, HOME_ID)).assertTrue();
      expect(await openCapturePage(driver, CaptureMode.NORMAL)).assertTrue();
      await driver.pressBack();
      await driver.delayMs(1000);
      expect(await exists(driver, HOME_ID)).assertTrue();
    });
  });
}
