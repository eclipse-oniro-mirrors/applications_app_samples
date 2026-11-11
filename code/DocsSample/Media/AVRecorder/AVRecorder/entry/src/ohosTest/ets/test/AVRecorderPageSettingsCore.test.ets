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
import { describe, it as hypiumIt, expect as hypiumExpect, beforeEach, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';

const TAG: string = '[Sample_avRecorderPageSettingsCore]';
const DOMAIN: number = 0xF811;

function it(name: string, filter: number, func: () => void | Promise<void>): void {
  hypiumIt(name, filter, async () => {
    hilog.info(DOMAIN, TAG, '%{public}s', name + ' begin');
    try {
      await func();
    } finally {
      hilog.info(DOMAIN, TAG, '%{public}s', name + ' end');
    }
  });
}

interface ExpectAssert {
  assertEqual(expectValue: string | number | boolean | Object | null | undefined): void;
  assertTrue(): void;
  assertFalse(): void;
  assertLarger(expectValue: number): void;
  assertLargerOrEqual(expectValue: number): void;
  assertLess(expectValue: number): void;
  assertLessOrEqual(expectValue: number): void;
  assertUndefined(): void;
  assertFail(): void;
}

function expect(actual: string | number | boolean | Object | null | undefined): ExpectAssert {
  hilog.info(DOMAIN, TAG, '%{public}s', 'actual: ' + String(actual));
  return hypiumExpect(actual);
}

export default function avRecorderPageSettingsCoreTest(): void {
  describe('avRecorderPageSettingsCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESET_0001
     * @tc.name      testExtRecPageSet0000
     * @tc.desc      Page settings 8000Hz 640x480 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageSet0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 8000;
      const channels: number = 1;
      const width: number = 640;
      const height: number = 480;
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = true;
      expect([8000, 22050, 44100, 48000, 96000].indexOf(sampleRate) >= 0).assertTrue();
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      isStartRecording = true;
      isPauseRecording = false;
      expect(isStartRecording).assertTrue();
      expect(isPauseRecording).assertFalse();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESET_0002
     * @tc.name      testExtRecPageSet0001
     * @tc.desc      Page settings 22050Hz 1280x720 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageSet0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 22050;
      const channels: number = 2;
      const width: number = 1280;
      const height: number = 720;
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = false;
      expect([8000, 22050, 44100, 48000, 96000].indexOf(sampleRate) >= 0).assertTrue();
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      isStartRecording = true;
      isPauseRecording = false;
      expect(isStartRecording).assertTrue();
      expect(isPauseRecording).assertFalse();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESET_0003
     * @tc.name      testExtRecPageSet0002
     * @tc.desc      Page settings 44100Hz 1920x1080 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageSet0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 44100;
      const channels: number = 1;
      const width: number = 1920;
      const height: number = 1080;
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = false;
      expect([8000, 22050, 44100, 48000, 96000].indexOf(sampleRate) >= 0).assertTrue();
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      isStartRecording = true;
      isPauseRecording = false;
      expect(isStartRecording).assertTrue();
      expect(isPauseRecording).assertFalse();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESET_0004
     * @tc.name      testExtRecPageSet0003
     * @tc.desc      Page settings 48000Hz 640x480 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageSet0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 48000;
      const channels: number = 2;
      const width: number = 640;
      const height: number = 480;
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = true;
      expect([8000, 22050, 44100, 48000, 96000].indexOf(sampleRate) >= 0).assertTrue();
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      isStartRecording = true;
      isPauseRecording = false;
      expect(isStartRecording).assertTrue();
      expect(isPauseRecording).assertFalse();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESET_0005
     * @tc.name      testExtRecPageSet0004
     * @tc.desc      Page settings 96000Hz 1280x720 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageSet0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 96000;
      const channels: number = 1;
      const width: number = 1280;
      const height: number = 720;
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = false;
      expect([8000, 22050, 44100, 48000, 96000].indexOf(sampleRate) >= 0).assertTrue();
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      isStartRecording = true;
      isPauseRecording = false;
      expect(isStartRecording).assertTrue();
      expect(isPauseRecording).assertFalse();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESET_0006
     * @tc.name      testExtRecPageSet0005
     * @tc.desc      Page settings 8000Hz 1920x1080 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageSet0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 8000;
      const channels: number = 2;
      const width: number = 1920;
      const height: number = 1080;
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = false;
      expect([8000, 22050, 44100, 48000, 96000].indexOf(sampleRate) >= 0).assertTrue();
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      isStartRecording = true;
      isPauseRecording = false;
      expect(isStartRecording).assertTrue();
      expect(isPauseRecording).assertFalse();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESET_0007
     * @tc.name      testExtRecPageSet0006
     * @tc.desc      Page settings 22050Hz 640x480 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageSet0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 22050;
      const channels: number = 1;
      const width: number = 640;
      const height: number = 480;
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = true;
      expect([8000, 22050, 44100, 48000, 96000].indexOf(sampleRate) >= 0).assertTrue();
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      isStartRecording = true;
      isPauseRecording = false;
      expect(isStartRecording).assertTrue();
      expect(isPauseRecording).assertFalse();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESET_0008
     * @tc.name      testExtRecPageSet0007
     * @tc.desc      Page settings 44100Hz 1280x720 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageSet0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 44100;
      const channels: number = 2;
      const width: number = 1280;
      const height: number = 720;
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = false;
      expect([8000, 22050, 44100, 48000, 96000].indexOf(sampleRate) >= 0).assertTrue();
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      isStartRecording = true;
      isPauseRecording = false;
      expect(isStartRecording).assertTrue();
      expect(isPauseRecording).assertFalse();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESET_0009
     * @tc.name      testExtRecPageSet0008
     * @tc.desc      Page settings 48000Hz 1920x1080 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageSet0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 48000;
      const channels: number = 1;
      const width: number = 1920;
      const height: number = 1080;
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = false;
      expect([8000, 22050, 44100, 48000, 96000].indexOf(sampleRate) >= 0).assertTrue();
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      isStartRecording = true;
      isPauseRecording = false;
      expect(isStartRecording).assertTrue();
      expect(isPauseRecording).assertFalse();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESET_0010
     * @tc.name      testExtRecPageSet0009
     * @tc.desc      Page settings 96000Hz 640x480 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageSet0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 96000;
      const channels: number = 2;
      const width: number = 640;
      const height: number = 480;
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = true;
      expect([8000, 22050, 44100, 48000, 96000].indexOf(sampleRate) >= 0).assertTrue();
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      isStartRecording = true;
      isPauseRecording = false;
      expect(isStartRecording).assertTrue();
      expect(isPauseRecording).assertFalse();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESET_0011
     * @tc.name      testExtRecPageSet0010
     * @tc.desc      Page settings 8000Hz 1280x720 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageSet0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 8000;
      const channels: number = 1;
      const width: number = 1280;
      const height: number = 720;
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = false;
      expect([8000, 22050, 44100, 48000, 96000].indexOf(sampleRate) >= 0).assertTrue();
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      isStartRecording = true;
      isPauseRecording = false;
      expect(isStartRecording).assertTrue();
      expect(isPauseRecording).assertFalse();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESET_0012
     * @tc.name      testExtRecPageSet0011
     * @tc.desc      Page settings 22050Hz 1920x1080 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageSet0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 22050;
      const channels: number = 2;
      const width: number = 1920;
      const height: number = 1080;
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = false;
      expect([8000, 22050, 44100, 48000, 96000].indexOf(sampleRate) >= 0).assertTrue();
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      isStartRecording = true;
      isPauseRecording = false;
      expect(isStartRecording).assertTrue();
      expect(isPauseRecording).assertFalse();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESET_0013
     * @tc.name      testExtRecPageSet0012
     * @tc.desc      Page settings 44100Hz 640x480 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageSet0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 44100;
      const channels: number = 1;
      const width: number = 640;
      const height: number = 480;
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = true;
      expect([8000, 22050, 44100, 48000, 96000].indexOf(sampleRate) >= 0).assertTrue();
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      isStartRecording = true;
      isPauseRecording = false;
      expect(isStartRecording).assertTrue();
      expect(isPauseRecording).assertFalse();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESET_0014
     * @tc.name      testExtRecPageSet0013
     * @tc.desc      Page settings 48000Hz 1280x720 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageSet0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 48000;
      const channels: number = 2;
      const width: number = 1280;
      const height: number = 720;
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = false;
      expect([8000, 22050, 44100, 48000, 96000].indexOf(sampleRate) >= 0).assertTrue();
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      isStartRecording = true;
      isPauseRecording = false;
      expect(isStartRecording).assertTrue();
      expect(isPauseRecording).assertFalse();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESET_0015
     * @tc.name      testExtRecPageSet0014
     * @tc.desc      Page settings 96000Hz 1920x1080 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageSet0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 96000;
      const channels: number = 1;
      const width: number = 1920;
      const height: number = 1080;
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = false;
      expect([8000, 22050, 44100, 48000, 96000].indexOf(sampleRate) >= 0).assertTrue();
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      isStartRecording = true;
      isPauseRecording = false;
      expect(isStartRecording).assertTrue();
      expect(isPauseRecording).assertFalse();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESET_0016
     * @tc.name      testExtRecPageSet0015
     * @tc.desc      Page settings 8000Hz 640x480 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageSet0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 8000;
      const channels: number = 2;
      const width: number = 640;
      const height: number = 480;
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = true;
      expect([8000, 22050, 44100, 48000, 96000].indexOf(sampleRate) >= 0).assertTrue();
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      isStartRecording = true;
      isPauseRecording = false;
      expect(isStartRecording).assertTrue();
      expect(isPauseRecording).assertFalse();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESET_0017
     * @tc.name      testExtRecPageSet0016
     * @tc.desc      Page settings 22050Hz 1280x720 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageSet0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 22050;
      const channels: number = 1;
      const width: number = 1280;
      const height: number = 720;
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = false;
      expect([8000, 22050, 44100, 48000, 96000].indexOf(sampleRate) >= 0).assertTrue();
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      isStartRecording = true;
      isPauseRecording = false;
      expect(isStartRecording).assertTrue();
      expect(isPauseRecording).assertFalse();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESET_0018
     * @tc.name      testExtRecPageSet0017
     * @tc.desc      Page settings 44100Hz 1920x1080 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageSet0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 44100;
      const channels: number = 2;
      const width: number = 1920;
      const height: number = 1080;
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = false;
      expect([8000, 22050, 44100, 48000, 96000].indexOf(sampleRate) >= 0).assertTrue();
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      isStartRecording = true;
      isPauseRecording = false;
      expect(isStartRecording).assertTrue();
      expect(isPauseRecording).assertFalse();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESET_0019
     * @tc.name      testExtRecPageSet0018
     * @tc.desc      Page settings 48000Hz 640x480 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageSet0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 48000;
      const channels: number = 1;
      const width: number = 640;
      const height: number = 480;
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = true;
      expect([8000, 22050, 44100, 48000, 96000].indexOf(sampleRate) >= 0).assertTrue();
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      isStartRecording = true;
      isPauseRecording = false;
      expect(isStartRecording).assertTrue();
      expect(isPauseRecording).assertFalse();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESET_0020
     * @tc.name      testExtRecPageSet0019
     * @tc.desc      Page settings 96000Hz 1280x720 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageSet0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 96000;
      const channels: number = 2;
      const width: number = 1280;
      const height: number = 720;
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = false;
      expect([8000, 22050, 44100, 48000, 96000].indexOf(sampleRate) >= 0).assertTrue();
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      isStartRecording = true;
      isPauseRecording = false;
      expect(isStartRecording).assertTrue();
      expect(isPauseRecording).assertFalse();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESET_0021
     * @tc.name      testExtRecPageSet0020
     * @tc.desc      Page settings 8000Hz 1920x1080 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageSet0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 8000;
      const channels: number = 1;
      const width: number = 1920;
      const height: number = 1080;
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = false;
      expect([8000, 22050, 44100, 48000, 96000].indexOf(sampleRate) >= 0).assertTrue();
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      isStartRecording = true;
      isPauseRecording = false;
      expect(isStartRecording).assertTrue();
      expect(isPauseRecording).assertFalse();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESET_0022
     * @tc.name      testExtRecPageSet0021
     * @tc.desc      Page settings 22050Hz 640x480 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageSet0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 22050;
      const channels: number = 2;
      const width: number = 640;
      const height: number = 480;
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = true;
      expect([8000, 22050, 44100, 48000, 96000].indexOf(sampleRate) >= 0).assertTrue();
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      isStartRecording = true;
      isPauseRecording = false;
      expect(isStartRecording).assertTrue();
      expect(isPauseRecording).assertFalse();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESET_0023
     * @tc.name      testExtRecPageSet0022
     * @tc.desc      Page settings 44100Hz 1280x720 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageSet0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 44100;
      const channels: number = 1;
      const width: number = 1280;
      const height: number = 720;
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = false;
      expect([8000, 22050, 44100, 48000, 96000].indexOf(sampleRate) >= 0).assertTrue();
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      isStartRecording = true;
      isPauseRecording = false;
      expect(isStartRecording).assertTrue();
      expect(isPauseRecording).assertFalse();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESET_0024
     * @tc.name      testExtRecPageSet0023
     * @tc.desc      Page settings 48000Hz 1920x1080 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageSet0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 48000;
      const channels: number = 2;
      const width: number = 1920;
      const height: number = 1080;
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = false;
      expect([8000, 22050, 44100, 48000, 96000].indexOf(sampleRate) >= 0).assertTrue();
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      isStartRecording = true;
      isPauseRecording = false;
      expect(isStartRecording).assertTrue();
      expect(isPauseRecording).assertFalse();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESET_0025
     * @tc.name      testExtRecPageSet0024
     * @tc.desc      Page settings 96000Hz 640x480 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageSet0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 96000;
      const channels: number = 1;
      const width: number = 640;
      const height: number = 480;
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = true;
      expect([8000, 22050, 44100, 48000, 96000].indexOf(sampleRate) >= 0).assertTrue();
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      isStartRecording = true;
      isPauseRecording = false;
      expect(isStartRecording).assertTrue();
      expect(isPauseRecording).assertFalse();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESET_0026
     * @tc.name      testExtRecPageSet0025
     * @tc.desc      Page settings 8000Hz 1280x720 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageSet0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 8000;
      const channels: number = 2;
      const width: number = 1280;
      const height: number = 720;
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = false;
      expect([8000, 22050, 44100, 48000, 96000].indexOf(sampleRate) >= 0).assertTrue();
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      isStartRecording = true;
      isPauseRecording = false;
      expect(isStartRecording).assertTrue();
      expect(isPauseRecording).assertFalse();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESET_0027
     * @tc.name      testExtRecPageSet0026
     * @tc.desc      Page settings 22050Hz 1920x1080 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageSet0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 22050;
      const channels: number = 1;
      const width: number = 1920;
      const height: number = 1080;
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = false;
      expect([8000, 22050, 44100, 48000, 96000].indexOf(sampleRate) >= 0).assertTrue();
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      isStartRecording = true;
      isPauseRecording = false;
      expect(isStartRecording).assertTrue();
      expect(isPauseRecording).assertFalse();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESET_0028
     * @tc.name      testExtRecPageSet0027
     * @tc.desc      Page settings 44100Hz 640x480 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageSet0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 44100;
      const channels: number = 2;
      const width: number = 640;
      const height: number = 480;
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = true;
      expect([8000, 22050, 44100, 48000, 96000].indexOf(sampleRate) >= 0).assertTrue();
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      isStartRecording = true;
      isPauseRecording = false;
      expect(isStartRecording).assertTrue();
      expect(isPauseRecording).assertFalse();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESET_0029
     * @tc.name      testExtRecPageSet0028
     * @tc.desc      Page settings 48000Hz 1280x720 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageSet0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 48000;
      const channels: number = 1;
      const width: number = 1280;
      const height: number = 720;
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = false;
      expect([8000, 22050, 44100, 48000, 96000].indexOf(sampleRate) >= 0).assertTrue();
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      isStartRecording = true;
      isPauseRecording = false;
      expect(isStartRecording).assertTrue();
      expect(isPauseRecording).assertFalse();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESET_0030
     * @tc.name      testExtRecPageSet0029
     * @tc.desc      Page settings 96000Hz 1920x1080 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageSet0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 96000;
      const channels: number = 2;
      const width: number = 1920;
      const height: number = 1080;
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = false;
      expect([8000, 22050, 44100, 48000, 96000].indexOf(sampleRate) >= 0).assertTrue();
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      isStartRecording = true;
      isPauseRecording = false;
      expect(isStartRecording).assertTrue();
      expect(isPauseRecording).assertFalse();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESET_0031
     * @tc.name      testExtRecPageSet0030
     * @tc.desc      Page settings 8000Hz 640x480 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageSet0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 8000;
      const channels: number = 1;
      const width: number = 640;
      const height: number = 480;
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = true;
      expect([8000, 22050, 44100, 48000, 96000].indexOf(sampleRate) >= 0).assertTrue();
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      isStartRecording = true;
      isPauseRecording = false;
      expect(isStartRecording).assertTrue();
      expect(isPauseRecording).assertFalse();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESET_0032
     * @tc.name      testExtRecPageSet0031
     * @tc.desc      Page settings 22050Hz 1280x720 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageSet0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 22050;
      const channels: number = 2;
      const width: number = 1280;
      const height: number = 720;
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = false;
      expect([8000, 22050, 44100, 48000, 96000].indexOf(sampleRate) >= 0).assertTrue();
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      isStartRecording = true;
      isPauseRecording = false;
      expect(isStartRecording).assertTrue();
      expect(isPauseRecording).assertFalse();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESET_0033
     * @tc.name      testExtRecPageSet0032
     * @tc.desc      Page settings 44100Hz 1920x1080 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageSet0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 44100;
      const channels: number = 1;
      const width: number = 1920;
      const height: number = 1080;
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = false;
      expect([8000, 22050, 44100, 48000, 96000].indexOf(sampleRate) >= 0).assertTrue();
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      isStartRecording = true;
      isPauseRecording = false;
      expect(isStartRecording).assertTrue();
      expect(isPauseRecording).assertFalse();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESET_0034
     * @tc.name      testExtRecPageSet0033
     * @tc.desc      Page settings 48000Hz 640x480 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageSet0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 48000;
      const channels: number = 2;
      const width: number = 640;
      const height: number = 480;
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = true;
      expect([8000, 22050, 44100, 48000, 96000].indexOf(sampleRate) >= 0).assertTrue();
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      isStartRecording = true;
      isPauseRecording = false;
      expect(isStartRecording).assertTrue();
      expect(isPauseRecording).assertFalse();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESET_0035
     * @tc.name      testExtRecPageSet0034
     * @tc.desc      Page settings 96000Hz 1280x720 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageSet0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 96000;
      const channels: number = 1;
      const width: number = 1280;
      const height: number = 720;
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = false;
      expect([8000, 22050, 44100, 48000, 96000].indexOf(sampleRate) >= 0).assertTrue();
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      isStartRecording = true;
      isPauseRecording = false;
      expect(isStartRecording).assertTrue();
      expect(isPauseRecording).assertFalse();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESET_0036
     * @tc.name      testExtRecPageSet0035
     * @tc.desc      Page settings 8000Hz 1920x1080 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageSet0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 8000;
      const channels: number = 2;
      const width: number = 1920;
      const height: number = 1080;
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = false;
      expect([8000, 22050, 44100, 48000, 96000].indexOf(sampleRate) >= 0).assertTrue();
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      isStartRecording = true;
      isPauseRecording = false;
      expect(isStartRecording).assertTrue();
      expect(isPauseRecording).assertFalse();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESET_0037
     * @tc.name      testExtRecPageSet0036
     * @tc.desc      Page settings 22050Hz 640x480 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageSet0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 22050;
      const channels: number = 1;
      const width: number = 640;
      const height: number = 480;
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = true;
      expect([8000, 22050, 44100, 48000, 96000].indexOf(sampleRate) >= 0).assertTrue();
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      isStartRecording = true;
      isPauseRecording = false;
      expect(isStartRecording).assertTrue();
      expect(isPauseRecording).assertFalse();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESET_0038
     * @tc.name      testExtRecPageSet0037
     * @tc.desc      Page settings 44100Hz 1280x720 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageSet0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 44100;
      const channels: number = 2;
      const width: number = 1280;
      const height: number = 720;
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = false;
      expect([8000, 22050, 44100, 48000, 96000].indexOf(sampleRate) >= 0).assertTrue();
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      isStartRecording = true;
      isPauseRecording = false;
      expect(isStartRecording).assertTrue();
      expect(isPauseRecording).assertFalse();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESET_0039
     * @tc.name      testExtRecPageSet0038
     * @tc.desc      Page settings 48000Hz 1920x1080 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageSet0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 48000;
      const channels: number = 1;
      const width: number = 1920;
      const height: number = 1080;
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = false;
      expect([8000, 22050, 44100, 48000, 96000].indexOf(sampleRate) >= 0).assertTrue();
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      isStartRecording = true;
      isPauseRecording = false;
      expect(isStartRecording).assertTrue();
      expect(isPauseRecording).assertFalse();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESET_0040
     * @tc.name      testExtRecPageSet0039
     * @tc.desc      Page settings 96000Hz 640x480 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageSet0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 96000;
      const channels: number = 2;
      const width: number = 640;
      const height: number = 480;
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = true;
      expect([8000, 22050, 44100, 48000, 96000].indexOf(sampleRate) >= 0).assertTrue();
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      isStartRecording = true;
      isPauseRecording = false;
      expect(isStartRecording).assertTrue();
      expect(isPauseRecording).assertFalse();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESET_0041
     * @tc.name      testExtRecPageSet0040
     * @tc.desc      Page settings 8000Hz 1280x720 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageSet0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 8000;
      const channels: number = 1;
      const width: number = 1280;
      const height: number = 720;
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = false;
      expect([8000, 22050, 44100, 48000, 96000].indexOf(sampleRate) >= 0).assertTrue();
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      isStartRecording = true;
      isPauseRecording = false;
      expect(isStartRecording).assertTrue();
      expect(isPauseRecording).assertFalse();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESET_0042
     * @tc.name      testExtRecPageSet0041
     * @tc.desc      Page settings 22050Hz 1920x1080 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageSet0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 22050;
      const channels: number = 2;
      const width: number = 1920;
      const height: number = 1080;
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = false;
      expect([8000, 22050, 44100, 48000, 96000].indexOf(sampleRate) >= 0).assertTrue();
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      isStartRecording = true;
      isPauseRecording = false;
      expect(isStartRecording).assertTrue();
      expect(isPauseRecording).assertFalse();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESET_0043
     * @tc.name      testExtRecPageSet0042
     * @tc.desc      Page settings 44100Hz 640x480 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageSet0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 44100;
      const channels: number = 1;
      const width: number = 640;
      const height: number = 480;
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = true;
      expect([8000, 22050, 44100, 48000, 96000].indexOf(sampleRate) >= 0).assertTrue();
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      isStartRecording = true;
      isPauseRecording = false;
      expect(isStartRecording).assertTrue();
      expect(isPauseRecording).assertFalse();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESET_0044
     * @tc.name      testExtRecPageSet0043
     * @tc.desc      Page settings 48000Hz 1280x720 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageSet0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 48000;
      const channels: number = 2;
      const width: number = 1280;
      const height: number = 720;
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = false;
      expect([8000, 22050, 44100, 48000, 96000].indexOf(sampleRate) >= 0).assertTrue();
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      isStartRecording = true;
      isPauseRecording = false;
      expect(isStartRecording).assertTrue();
      expect(isPauseRecording).assertFalse();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESET_0045
     * @tc.name      testExtRecPageSet0044
     * @tc.desc      Page settings 96000Hz 1920x1080 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageSet0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 96000;
      const channels: number = 1;
      const width: number = 1920;
      const height: number = 1080;
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = false;
      expect([8000, 22050, 44100, 48000, 96000].indexOf(sampleRate) >= 0).assertTrue();
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      isStartRecording = true;
      isPauseRecording = false;
      expect(isStartRecording).assertTrue();
      expect(isPauseRecording).assertFalse();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESET_0046
     * @tc.name      testExtRecPageSet0045
     * @tc.desc      Page settings 8000Hz 640x480 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageSet0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 8000;
      const channels: number = 2;
      const width: number = 640;
      const height: number = 480;
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = true;
      expect([8000, 22050, 44100, 48000, 96000].indexOf(sampleRate) >= 0).assertTrue();
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      isStartRecording = true;
      isPauseRecording = false;
      expect(isStartRecording).assertTrue();
      expect(isPauseRecording).assertFalse();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESET_0047
     * @tc.name      testExtRecPageSet0046
     * @tc.desc      Page settings 22050Hz 1280x720 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageSet0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 22050;
      const channels: number = 1;
      const width: number = 1280;
      const height: number = 720;
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = false;
      expect([8000, 22050, 44100, 48000, 96000].indexOf(sampleRate) >= 0).assertTrue();
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      isStartRecording = true;
      isPauseRecording = false;
      expect(isStartRecording).assertTrue();
      expect(isPauseRecording).assertFalse();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESET_0048
     * @tc.name      testExtRecPageSet0047
     * @tc.desc      Page settings 44100Hz 1920x1080 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageSet0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 44100;
      const channels: number = 2;
      const width: number = 1920;
      const height: number = 1080;
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = false;
      expect([8000, 22050, 44100, 48000, 96000].indexOf(sampleRate) >= 0).assertTrue();
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      isStartRecording = true;
      isPauseRecording = false;
      expect(isStartRecording).assertTrue();
      expect(isPauseRecording).assertFalse();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESET_0049
     * @tc.name      testExtRecPageSet0048
     * @tc.desc      Page settings 48000Hz 640x480 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageSet0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 48000;
      const channels: number = 1;
      const width: number = 640;
      const height: number = 480;
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = true;
      expect([8000, 22050, 44100, 48000, 96000].indexOf(sampleRate) >= 0).assertTrue();
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      isStartRecording = true;
      isPauseRecording = false;
      expect(isStartRecording).assertTrue();
      expect(isPauseRecording).assertFalse();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESET_0050
     * @tc.name      testExtRecPageSet0049
     * @tc.desc      Page settings 96000Hz 1280x720 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageSet0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 96000;
      const channels: number = 2;
      const width: number = 1280;
      const height: number = 720;
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = false;
      expect([8000, 22050, 44100, 48000, 96000].indexOf(sampleRate) >= 0).assertTrue();
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      isStartRecording = true;
      isPauseRecording = false;
      expect(isStartRecording).assertTrue();
      expect(isPauseRecording).assertFalse();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESET_0051
     * @tc.name      testExtRecPageSet0050
     * @tc.desc      Page settings 8000Hz 1920x1080 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageSet0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 8000;
      const channels: number = 1;
      const width: number = 1920;
      const height: number = 1080;
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = false;
      expect([8000, 22050, 44100, 48000, 96000].indexOf(sampleRate) >= 0).assertTrue();
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      isStartRecording = true;
      isPauseRecording = false;
      expect(isStartRecording).assertTrue();
      expect(isPauseRecording).assertFalse();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESET_0052
     * @tc.name      testExtRecPageSet0051
     * @tc.desc      Page settings 22050Hz 640x480 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageSet0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 22050;
      const channels: number = 2;
      const width: number = 640;
      const height: number = 480;
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = true;
      expect([8000, 22050, 44100, 48000, 96000].indexOf(sampleRate) >= 0).assertTrue();
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      isStartRecording = true;
      isPauseRecording = false;
      expect(isStartRecording).assertTrue();
      expect(isPauseRecording).assertFalse();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESET_0053
     * @tc.name      testExtRecPageSet0052
     * @tc.desc      Page settings 44100Hz 1280x720 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageSet0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 44100;
      const channels: number = 1;
      const width: number = 1280;
      const height: number = 720;
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = false;
      expect([8000, 22050, 44100, 48000, 96000].indexOf(sampleRate) >= 0).assertTrue();
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      isStartRecording = true;
      isPauseRecording = false;
      expect(isStartRecording).assertTrue();
      expect(isPauseRecording).assertFalse();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESET_0054
     * @tc.name      testExtRecPageSet0053
     * @tc.desc      Page settings 48000Hz 1920x1080 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageSet0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 48000;
      const channels: number = 2;
      const width: number = 1920;
      const height: number = 1080;
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = false;
      expect([8000, 22050, 44100, 48000, 96000].indexOf(sampleRate) >= 0).assertTrue();
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      isStartRecording = true;
      isPauseRecording = false;
      expect(isStartRecording).assertTrue();
      expect(isPauseRecording).assertFalse();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESET_0055
     * @tc.name      testExtRecPageSet0054
     * @tc.desc      Page settings 96000Hz 640x480 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageSet0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 96000;
      const channels: number = 1;
      const width: number = 640;
      const height: number = 480;
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = true;
      expect([8000, 22050, 44100, 48000, 96000].indexOf(sampleRate) >= 0).assertTrue();
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      isStartRecording = true;
      isPauseRecording = false;
      expect(isStartRecording).assertTrue();
      expect(isPauseRecording).assertFalse();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESET_0056
     * @tc.name      testExtRecPageSet0055
     * @tc.desc      Page settings 8000Hz 1280x720 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageSet0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 8000;
      const channels: number = 2;
      const width: number = 1280;
      const height: number = 720;
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = false;
      expect([8000, 22050, 44100, 48000, 96000].indexOf(sampleRate) >= 0).assertTrue();
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      isStartRecording = true;
      isPauseRecording = false;
      expect(isStartRecording).assertTrue();
      expect(isPauseRecording).assertFalse();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESET_0057
     * @tc.name      testExtRecPageSet0056
     * @tc.desc      Page settings 22050Hz 1920x1080 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageSet0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 22050;
      const channels: number = 1;
      const width: number = 1920;
      const height: number = 1080;
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = false;
      expect([8000, 22050, 44100, 48000, 96000].indexOf(sampleRate) >= 0).assertTrue();
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      isStartRecording = true;
      isPauseRecording = false;
      expect(isStartRecording).assertTrue();
      expect(isPauseRecording).assertFalse();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESET_0058
     * @tc.name      testExtRecPageSet0057
     * @tc.desc      Page settings 44100Hz 640x480 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageSet0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 44100;
      const channels: number = 2;
      const width: number = 640;
      const height: number = 480;
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = true;
      expect([8000, 22050, 44100, 48000, 96000].indexOf(sampleRate) >= 0).assertTrue();
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      isStartRecording = true;
      isPauseRecording = false;
      expect(isStartRecording).assertTrue();
      expect(isPauseRecording).assertFalse();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESET_0059
     * @tc.name      testExtRecPageSet0058
     * @tc.desc      Page settings 48000Hz 1280x720 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageSet0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 48000;
      const channels: number = 1;
      const width: number = 1280;
      const height: number = 720;
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = false;
      expect([8000, 22050, 44100, 48000, 96000].indexOf(sampleRate) >= 0).assertTrue();
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      isStartRecording = true;
      isPauseRecording = false;
      expect(isStartRecording).assertTrue();
      expect(isPauseRecording).assertFalse();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESET_0060
     * @tc.name      testExtRecPageSet0059
     * @tc.desc      Page settings 96000Hz 1920x1080 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageSet0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 96000;
      const channels: number = 2;
      const width: number = 1920;
      const height: number = 1080;
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = false;
      expect([8000, 22050, 44100, 48000, 96000].indexOf(sampleRate) >= 0).assertTrue();
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      isStartRecording = true;
      isPauseRecording = false;
      expect(isStartRecording).assertTrue();
      expect(isPauseRecording).assertFalse();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESET_0061
     * @tc.name      testExtRecPageSet0060
     * @tc.desc      Page settings 8000Hz 640x480 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageSet0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 8000;
      const channels: number = 1;
      const width: number = 640;
      const height: number = 480;
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = true;
      expect([8000, 22050, 44100, 48000, 96000].indexOf(sampleRate) >= 0).assertTrue();
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      isStartRecording = true;
      isPauseRecording = false;
      expect(isStartRecording).assertTrue();
      expect(isPauseRecording).assertFalse();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESET_0062
     * @tc.name      testExtRecPageSet0061
     * @tc.desc      Page settings 22050Hz 1280x720 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageSet0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 22050;
      const channels: number = 2;
      const width: number = 1280;
      const height: number = 720;
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = false;
      expect([8000, 22050, 44100, 48000, 96000].indexOf(sampleRate) >= 0).assertTrue();
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      isStartRecording = true;
      isPauseRecording = false;
      expect(isStartRecording).assertTrue();
      expect(isPauseRecording).assertFalse();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESET_0063
     * @tc.name      testExtRecPageSet0062
     * @tc.desc      Page settings 44100Hz 1920x1080 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageSet0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 44100;
      const channels: number = 1;
      const width: number = 1920;
      const height: number = 1080;
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = false;
      expect([8000, 22050, 44100, 48000, 96000].indexOf(sampleRate) >= 0).assertTrue();
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      isStartRecording = true;
      isPauseRecording = false;
      expect(isStartRecording).assertTrue();
      expect(isPauseRecording).assertFalse();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESET_0064
     * @tc.name      testExtRecPageSet0063
     * @tc.desc      Page settings 48000Hz 640x480 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageSet0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 48000;
      const channels: number = 2;
      const width: number = 640;
      const height: number = 480;
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = true;
      expect([8000, 22050, 44100, 48000, 96000].indexOf(sampleRate) >= 0).assertTrue();
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      isStartRecording = true;
      isPauseRecording = false;
      expect(isStartRecording).assertTrue();
      expect(isPauseRecording).assertFalse();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESET_0065
     * @tc.name      testExtRecPageSet0064
     * @tc.desc      Page settings 96000Hz 1280x720 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageSet0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 96000;
      const channels: number = 1;
      const width: number = 1280;
      const height: number = 720;
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = false;
      expect([8000, 22050, 44100, 48000, 96000].indexOf(sampleRate) >= 0).assertTrue();
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      isStartRecording = true;
      isPauseRecording = false;
      expect(isStartRecording).assertTrue();
      expect(isPauseRecording).assertFalse();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESET_0066
     * @tc.name      testExtRecPageSet0065
     * @tc.desc      Page settings 8000Hz 1920x1080 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageSet0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 8000;
      const channels: number = 2;
      const width: number = 1920;
      const height: number = 1080;
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = false;
      expect([8000, 22050, 44100, 48000, 96000].indexOf(sampleRate) >= 0).assertTrue();
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      isStartRecording = true;
      isPauseRecording = false;
      expect(isStartRecording).assertTrue();
      expect(isPauseRecording).assertFalse();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESET_0067
     * @tc.name      testExtRecPageSet0066
     * @tc.desc      Page settings 22050Hz 640x480 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageSet0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 22050;
      const channels: number = 1;
      const width: number = 640;
      const height: number = 480;
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = true;
      expect([8000, 22050, 44100, 48000, 96000].indexOf(sampleRate) >= 0).assertTrue();
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      isStartRecording = true;
      isPauseRecording = false;
      expect(isStartRecording).assertTrue();
      expect(isPauseRecording).assertFalse();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESET_0068
     * @tc.name      testExtRecPageSet0067
     * @tc.desc      Page settings 44100Hz 1280x720 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageSet0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 44100;
      const channels: number = 2;
      const width: number = 1280;
      const height: number = 720;
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = false;
      expect([8000, 22050, 44100, 48000, 96000].indexOf(sampleRate) >= 0).assertTrue();
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      isStartRecording = true;
      isPauseRecording = false;
      expect(isStartRecording).assertTrue();
      expect(isPauseRecording).assertFalse();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESET_0069
     * @tc.name      testExtRecPageSet0068
     * @tc.desc      Page settings 48000Hz 1920x1080 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageSet0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 48000;
      const channels: number = 1;
      const width: number = 1920;
      const height: number = 1080;
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = false;
      expect([8000, 22050, 44100, 48000, 96000].indexOf(sampleRate) >= 0).assertTrue();
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      isStartRecording = true;
      isPauseRecording = false;
      expect(isStartRecording).assertTrue();
      expect(isPauseRecording).assertFalse();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESET_0070
     * @tc.name      testExtRecPageSet0069
     * @tc.desc      Page settings 96000Hz 640x480 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageSet0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 96000;
      const channels: number = 2;
      const width: number = 640;
      const height: number = 480;
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = true;
      expect([8000, 22050, 44100, 48000, 96000].indexOf(sampleRate) >= 0).assertTrue();
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      isStartRecording = true;
      isPauseRecording = false;
      expect(isStartRecording).assertTrue();
      expect(isPauseRecording).assertFalse();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESET_0071
     * @tc.name      testExtRecPageSet0070
     * @tc.desc      Page settings 8000Hz 1280x720 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageSet0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 8000;
      const channels: number = 1;
      const width: number = 1280;
      const height: number = 720;
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = false;
      expect([8000, 22050, 44100, 48000, 96000].indexOf(sampleRate) >= 0).assertTrue();
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      isStartRecording = true;
      isPauseRecording = false;
      expect(isStartRecording).assertTrue();
      expect(isPauseRecording).assertFalse();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESET_0072
     * @tc.name      testExtRecPageSet0071
     * @tc.desc      Page settings 22050Hz 1920x1080 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageSet0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 22050;
      const channels: number = 2;
      const width: number = 1920;
      const height: number = 1080;
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = false;
      expect([8000, 22050, 44100, 48000, 96000].indexOf(sampleRate) >= 0).assertTrue();
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      isStartRecording = true;
      isPauseRecording = false;
      expect(isStartRecording).assertTrue();
      expect(isPauseRecording).assertFalse();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESET_0073
     * @tc.name      testExtRecPageSet0072
     * @tc.desc      Page settings 44100Hz 640x480 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageSet0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 44100;
      const channels: number = 1;
      const width: number = 640;
      const height: number = 480;
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = true;
      expect([8000, 22050, 44100, 48000, 96000].indexOf(sampleRate) >= 0).assertTrue();
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      isStartRecording = true;
      isPauseRecording = false;
      expect(isStartRecording).assertTrue();
      expect(isPauseRecording).assertFalse();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESET_0074
     * @tc.name      testExtRecPageSet0073
     * @tc.desc      Page settings 48000Hz 1280x720 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageSet0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 48000;
      const channels: number = 2;
      const width: number = 1280;
      const height: number = 720;
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = false;
      expect([8000, 22050, 44100, 48000, 96000].indexOf(sampleRate) >= 0).assertTrue();
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      isStartRecording = true;
      isPauseRecording = false;
      expect(isStartRecording).assertTrue();
      expect(isPauseRecording).assertFalse();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESET_0075
     * @tc.name      testExtRecPageSet0074
     * @tc.desc      Page settings 96000Hz 1920x1080 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageSet0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 96000;
      const channels: number = 1;
      const width: number = 1920;
      const height: number = 1080;
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = false;
      expect([8000, 22050, 44100, 48000, 96000].indexOf(sampleRate) >= 0).assertTrue();
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      isStartRecording = true;
      isPauseRecording = false;
      expect(isStartRecording).assertTrue();
      expect(isPauseRecording).assertFalse();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESET_0076
     * @tc.name      testExtRecPageSet0075
     * @tc.desc      Page settings 8000Hz 640x480 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageSet0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 8000;
      const channels: number = 2;
      const width: number = 640;
      const height: number = 480;
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = true;
      expect([8000, 22050, 44100, 48000, 96000].indexOf(sampleRate) >= 0).assertTrue();
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      isStartRecording = true;
      isPauseRecording = false;
      expect(isStartRecording).assertTrue();
      expect(isPauseRecording).assertFalse();
    })
  });
}
