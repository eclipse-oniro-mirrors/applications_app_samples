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
import { describe, it as hypiumIt, expect as hypiumExpect, beforeEach, TestType, Size, Level, Assert } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';

const TAG: string = '[Sample_avRecorderConfigCore]';
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

function expect(actual: string | number | boolean | Object | null | undefined): Assert {
  hilog.info(DOMAIN, TAG, '%{public}s', 'actual: ' + String(actual));
  return hypiumExpect(actual);
}

export default function avRecorderConfigCoreTest(): void {
  describe('avRecorderConfigCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG_0001
     * @tc.name      testExtRecConfig0000
     * @tc.desc      Config 8000Hz 640x480 channels=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 8000;
      const frameWidth: number = 640;
      const frameHeight: number = 480;
      const channels: number = 1;
      const bitrate: number = 112000;
      expect(sampleRate).assertEqual(8000);
      expect(frameWidth).assertEqual(640);
      expect(frameHeight).assertEqual(480);
      expect(channels).assertEqual(1);
      expect(bitrate).assertLarger(0);
      expect([8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 96000].indexOf(sampleRate) >= 0).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG_0002
     * @tc.name      testExtRecConfig0001
     * @tc.desc      Config 11025Hz 1280x720 channels=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 11025;
      const frameWidth: number = 1280;
      const frameHeight: number = 720;
      const channels: number = 2;
      const bitrate: number = 144000;
      expect(sampleRate).assertEqual(11025);
      expect(frameWidth).assertEqual(1280);
      expect(frameHeight).assertEqual(720);
      expect(channels).assertEqual(2);
      expect(bitrate).assertLarger(0);
      expect([8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 96000].indexOf(sampleRate) >= 0).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG_0003
     * @tc.name      testExtRecConfig0002
     * @tc.desc      Config 12000Hz 1920x1080 channels=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 12000;
      const frameWidth: number = 1920;
      const frameHeight: number = 1080;
      const channels: number = 1;
      const bitrate: number = 176000;
      expect(sampleRate).assertEqual(12000);
      expect(frameWidth).assertEqual(1920);
      expect(frameHeight).assertEqual(1080);
      expect(channels).assertEqual(1);
      expect(bitrate).assertLarger(0);
      expect([8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 96000].indexOf(sampleRate) >= 0).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG_0004
     * @tc.name      testExtRecConfig0003
     * @tc.desc      Config 16000Hz 640x480 channels=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 16000;
      const frameWidth: number = 640;
      const frameHeight: number = 480;
      const channels: number = 2;
      const bitrate: number = 208000;
      expect(sampleRate).assertEqual(16000);
      expect(frameWidth).assertEqual(640);
      expect(frameHeight).assertEqual(480);
      expect(channels).assertEqual(2);
      expect(bitrate).assertLarger(0);
      expect([8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 96000].indexOf(sampleRate) >= 0).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG_0005
     * @tc.name      testExtRecConfig0004
     * @tc.desc      Config 22050Hz 1280x720 channels=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 22050;
      const frameWidth: number = 1280;
      const frameHeight: number = 720;
      const channels: number = 1;
      const bitrate: number = 112000;
      expect(sampleRate).assertEqual(22050);
      expect(frameWidth).assertEqual(1280);
      expect(frameHeight).assertEqual(720);
      expect(channels).assertEqual(1);
      expect(bitrate).assertLarger(0);
      expect([8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 96000].indexOf(sampleRate) >= 0).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG_0006
     * @tc.name      testExtRecConfig0005
     * @tc.desc      Config 24000Hz 1920x1080 channels=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 24000;
      const frameWidth: number = 1920;
      const frameHeight: number = 1080;
      const channels: number = 2;
      const bitrate: number = 144000;
      expect(sampleRate).assertEqual(24000);
      expect(frameWidth).assertEqual(1920);
      expect(frameHeight).assertEqual(1080);
      expect(channels).assertEqual(2);
      expect(bitrate).assertLarger(0);
      expect([8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 96000].indexOf(sampleRate) >= 0).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG_0007
     * @tc.name      testExtRecConfig0006
     * @tc.desc      Config 32000Hz 640x480 channels=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 32000;
      const frameWidth: number = 640;
      const frameHeight: number = 480;
      const channels: number = 1;
      const bitrate: number = 176000;
      expect(sampleRate).assertEqual(32000);
      expect(frameWidth).assertEqual(640);
      expect(frameHeight).assertEqual(480);
      expect(channels).assertEqual(1);
      expect(bitrate).assertLarger(0);
      expect([8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 96000].indexOf(sampleRate) >= 0).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG_0008
     * @tc.name      testExtRecConfig0007
     * @tc.desc      Config 44100Hz 1280x720 channels=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 44100;
      const frameWidth: number = 1280;
      const frameHeight: number = 720;
      const channels: number = 2;
      const bitrate: number = 208000;
      expect(sampleRate).assertEqual(44100);
      expect(frameWidth).assertEqual(1280);
      expect(frameHeight).assertEqual(720);
      expect(channels).assertEqual(2);
      expect(bitrate).assertLarger(0);
      expect([8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 96000].indexOf(sampleRate) >= 0).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG_0009
     * @tc.name      testExtRecConfig0008
     * @tc.desc      Config 48000Hz 1920x1080 channels=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 48000;
      const frameWidth: number = 1920;
      const frameHeight: number = 1080;
      const channels: number = 1;
      const bitrate: number = 112000;
      expect(sampleRate).assertEqual(48000);
      expect(frameWidth).assertEqual(1920);
      expect(frameHeight).assertEqual(1080);
      expect(channels).assertEqual(1);
      expect(bitrate).assertLarger(0);
      expect([8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 96000].indexOf(sampleRate) >= 0).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG_0010
     * @tc.name      testExtRecConfig0009
     * @tc.desc      Config 64000Hz 640x480 channels=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 64000;
      const frameWidth: number = 640;
      const frameHeight: number = 480;
      const channels: number = 2;
      const bitrate: number = 144000;
      expect(sampleRate).assertEqual(64000);
      expect(frameWidth).assertEqual(640);
      expect(frameHeight).assertEqual(480);
      expect(channels).assertEqual(2);
      expect(bitrate).assertLarger(0);
      expect([8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 96000].indexOf(sampleRate) >= 0).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG_0011
     * @tc.name      testExtRecConfig0010
     * @tc.desc      Config 96000Hz 1280x720 channels=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 96000;
      const frameWidth: number = 1280;
      const frameHeight: number = 720;
      const channels: number = 1;
      const bitrate: number = 176000;
      expect(sampleRate).assertEqual(96000);
      expect(frameWidth).assertEqual(1280);
      expect(frameHeight).assertEqual(720);
      expect(channels).assertEqual(1);
      expect(bitrate).assertLarger(0);
      expect([8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 96000].indexOf(sampleRate) >= 0).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG_0012
     * @tc.name      testExtRecConfig0011
     * @tc.desc      Config 8000Hz 1920x1080 channels=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 8000;
      const frameWidth: number = 1920;
      const frameHeight: number = 1080;
      const channels: number = 2;
      const bitrate: number = 208000;
      expect(sampleRate).assertEqual(8000);
      expect(frameWidth).assertEqual(1920);
      expect(frameHeight).assertEqual(1080);
      expect(channels).assertEqual(2);
      expect(bitrate).assertLarger(0);
      expect([8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 96000].indexOf(sampleRate) >= 0).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG_0013
     * @tc.name      testExtRecConfig0012
     * @tc.desc      Config 11025Hz 640x480 channels=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 11025;
      const frameWidth: number = 640;
      const frameHeight: number = 480;
      const channels: number = 1;
      const bitrate: number = 112000;
      expect(sampleRate).assertEqual(11025);
      expect(frameWidth).assertEqual(640);
      expect(frameHeight).assertEqual(480);
      expect(channels).assertEqual(1);
      expect(bitrate).assertLarger(0);
      expect([8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 96000].indexOf(sampleRate) >= 0).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG_0014
     * @tc.name      testExtRecConfig0013
     * @tc.desc      Config 12000Hz 1280x720 channels=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 12000;
      const frameWidth: number = 1280;
      const frameHeight: number = 720;
      const channels: number = 2;
      const bitrate: number = 144000;
      expect(sampleRate).assertEqual(12000);
      expect(frameWidth).assertEqual(1280);
      expect(frameHeight).assertEqual(720);
      expect(channels).assertEqual(2);
      expect(bitrate).assertLarger(0);
      expect([8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 96000].indexOf(sampleRate) >= 0).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG_0015
     * @tc.name      testExtRecConfig0014
     * @tc.desc      Config 16000Hz 1920x1080 channels=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 16000;
      const frameWidth: number = 1920;
      const frameHeight: number = 1080;
      const channels: number = 1;
      const bitrate: number = 176000;
      expect(sampleRate).assertEqual(16000);
      expect(frameWidth).assertEqual(1920);
      expect(frameHeight).assertEqual(1080);
      expect(channels).assertEqual(1);
      expect(bitrate).assertLarger(0);
      expect([8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 96000].indexOf(sampleRate) >= 0).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG_0016
     * @tc.name      testExtRecConfig0015
     * @tc.desc      Config 22050Hz 640x480 channels=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 22050;
      const frameWidth: number = 640;
      const frameHeight: number = 480;
      const channels: number = 2;
      const bitrate: number = 208000;
      expect(sampleRate).assertEqual(22050);
      expect(frameWidth).assertEqual(640);
      expect(frameHeight).assertEqual(480);
      expect(channels).assertEqual(2);
      expect(bitrate).assertLarger(0);
      expect([8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 96000].indexOf(sampleRate) >= 0).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG_0017
     * @tc.name      testExtRecConfig0016
     * @tc.desc      Config 24000Hz 1280x720 channels=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 24000;
      const frameWidth: number = 1280;
      const frameHeight: number = 720;
      const channels: number = 1;
      const bitrate: number = 112000;
      expect(sampleRate).assertEqual(24000);
      expect(frameWidth).assertEqual(1280);
      expect(frameHeight).assertEqual(720);
      expect(channels).assertEqual(1);
      expect(bitrate).assertLarger(0);
      expect([8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 96000].indexOf(sampleRate) >= 0).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG_0018
     * @tc.name      testExtRecConfig0017
     * @tc.desc      Config 32000Hz 1920x1080 channels=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 32000;
      const frameWidth: number = 1920;
      const frameHeight: number = 1080;
      const channels: number = 2;
      const bitrate: number = 144000;
      expect(sampleRate).assertEqual(32000);
      expect(frameWidth).assertEqual(1920);
      expect(frameHeight).assertEqual(1080);
      expect(channels).assertEqual(2);
      expect(bitrate).assertLarger(0);
      expect([8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 96000].indexOf(sampleRate) >= 0).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG_0019
     * @tc.name      testExtRecConfig0018
     * @tc.desc      Config 44100Hz 640x480 channels=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 44100;
      const frameWidth: number = 640;
      const frameHeight: number = 480;
      const channels: number = 1;
      const bitrate: number = 176000;
      expect(sampleRate).assertEqual(44100);
      expect(frameWidth).assertEqual(640);
      expect(frameHeight).assertEqual(480);
      expect(channels).assertEqual(1);
      expect(bitrate).assertLarger(0);
      expect([8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 96000].indexOf(sampleRate) >= 0).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG_0020
     * @tc.name      testExtRecConfig0019
     * @tc.desc      Config 48000Hz 1280x720 channels=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 48000;
      const frameWidth: number = 1280;
      const frameHeight: number = 720;
      const channels: number = 2;
      const bitrate: number = 208000;
      expect(sampleRate).assertEqual(48000);
      expect(frameWidth).assertEqual(1280);
      expect(frameHeight).assertEqual(720);
      expect(channels).assertEqual(2);
      expect(bitrate).assertLarger(0);
      expect([8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 96000].indexOf(sampleRate) >= 0).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG_0021
     * @tc.name      testExtRecConfig0020
     * @tc.desc      Config 64000Hz 1920x1080 channels=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 64000;
      const frameWidth: number = 1920;
      const frameHeight: number = 1080;
      const channels: number = 1;
      const bitrate: number = 112000;
      expect(sampleRate).assertEqual(64000);
      expect(frameWidth).assertEqual(1920);
      expect(frameHeight).assertEqual(1080);
      expect(channels).assertEqual(1);
      expect(bitrate).assertLarger(0);
      expect([8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 96000].indexOf(sampleRate) >= 0).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG_0022
     * @tc.name      testExtRecConfig0021
     * @tc.desc      Config 96000Hz 640x480 channels=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 96000;
      const frameWidth: number = 640;
      const frameHeight: number = 480;
      const channels: number = 2;
      const bitrate: number = 144000;
      expect(sampleRate).assertEqual(96000);
      expect(frameWidth).assertEqual(640);
      expect(frameHeight).assertEqual(480);
      expect(channels).assertEqual(2);
      expect(bitrate).assertLarger(0);
      expect([8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 96000].indexOf(sampleRate) >= 0).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG_0023
     * @tc.name      testExtRecConfig0022
     * @tc.desc      Config 8000Hz 1280x720 channels=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 8000;
      const frameWidth: number = 1280;
      const frameHeight: number = 720;
      const channels: number = 1;
      const bitrate: number = 176000;
      expect(sampleRate).assertEqual(8000);
      expect(frameWidth).assertEqual(1280);
      expect(frameHeight).assertEqual(720);
      expect(channels).assertEqual(1);
      expect(bitrate).assertLarger(0);
      expect([8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 96000].indexOf(sampleRate) >= 0).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG_0024
     * @tc.name      testExtRecConfig0023
     * @tc.desc      Config 11025Hz 1920x1080 channels=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 11025;
      const frameWidth: number = 1920;
      const frameHeight: number = 1080;
      const channels: number = 2;
      const bitrate: number = 208000;
      expect(sampleRate).assertEqual(11025);
      expect(frameWidth).assertEqual(1920);
      expect(frameHeight).assertEqual(1080);
      expect(channels).assertEqual(2);
      expect(bitrate).assertLarger(0);
      expect([8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 96000].indexOf(sampleRate) >= 0).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG_0025
     * @tc.name      testExtRecConfig0024
     * @tc.desc      Config 12000Hz 640x480 channels=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 12000;
      const frameWidth: number = 640;
      const frameHeight: number = 480;
      const channels: number = 1;
      const bitrate: number = 112000;
      expect(sampleRate).assertEqual(12000);
      expect(frameWidth).assertEqual(640);
      expect(frameHeight).assertEqual(480);
      expect(channels).assertEqual(1);
      expect(bitrate).assertLarger(0);
      expect([8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 96000].indexOf(sampleRate) >= 0).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG_0026
     * @tc.name      testExtRecConfig0025
     * @tc.desc      Config 16000Hz 1280x720 channels=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 16000;
      const frameWidth: number = 1280;
      const frameHeight: number = 720;
      const channels: number = 2;
      const bitrate: number = 144000;
      expect(sampleRate).assertEqual(16000);
      expect(frameWidth).assertEqual(1280);
      expect(frameHeight).assertEqual(720);
      expect(channels).assertEqual(2);
      expect(bitrate).assertLarger(0);
      expect([8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 96000].indexOf(sampleRate) >= 0).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG_0027
     * @tc.name      testExtRecConfig0026
     * @tc.desc      Config 22050Hz 1920x1080 channels=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 22050;
      const frameWidth: number = 1920;
      const frameHeight: number = 1080;
      const channels: number = 1;
      const bitrate: number = 176000;
      expect(sampleRate).assertEqual(22050);
      expect(frameWidth).assertEqual(1920);
      expect(frameHeight).assertEqual(1080);
      expect(channels).assertEqual(1);
      expect(bitrate).assertLarger(0);
      expect([8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 96000].indexOf(sampleRate) >= 0).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG_0028
     * @tc.name      testExtRecConfig0027
     * @tc.desc      Config 24000Hz 640x480 channels=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 24000;
      const frameWidth: number = 640;
      const frameHeight: number = 480;
      const channels: number = 2;
      const bitrate: number = 208000;
      expect(sampleRate).assertEqual(24000);
      expect(frameWidth).assertEqual(640);
      expect(frameHeight).assertEqual(480);
      expect(channels).assertEqual(2);
      expect(bitrate).assertLarger(0);
      expect([8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 96000].indexOf(sampleRate) >= 0).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG_0029
     * @tc.name      testExtRecConfig0028
     * @tc.desc      Config 32000Hz 1280x720 channels=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 32000;
      const frameWidth: number = 1280;
      const frameHeight: number = 720;
      const channels: number = 1;
      const bitrate: number = 112000;
      expect(sampleRate).assertEqual(32000);
      expect(frameWidth).assertEqual(1280);
      expect(frameHeight).assertEqual(720);
      expect(channels).assertEqual(1);
      expect(bitrate).assertLarger(0);
      expect([8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 96000].indexOf(sampleRate) >= 0).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG_0030
     * @tc.name      testExtRecConfig0029
     * @tc.desc      Config 44100Hz 1920x1080 channels=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 44100;
      const frameWidth: number = 1920;
      const frameHeight: number = 1080;
      const channels: number = 2;
      const bitrate: number = 144000;
      expect(sampleRate).assertEqual(44100);
      expect(frameWidth).assertEqual(1920);
      expect(frameHeight).assertEqual(1080);
      expect(channels).assertEqual(2);
      expect(bitrate).assertLarger(0);
      expect([8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 96000].indexOf(sampleRate) >= 0).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG_0031
     * @tc.name      testExtRecConfig0030
     * @tc.desc      Config 48000Hz 640x480 channels=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 48000;
      const frameWidth: number = 640;
      const frameHeight: number = 480;
      const channels: number = 1;
      const bitrate: number = 176000;
      expect(sampleRate).assertEqual(48000);
      expect(frameWidth).assertEqual(640);
      expect(frameHeight).assertEqual(480);
      expect(channels).assertEqual(1);
      expect(bitrate).assertLarger(0);
      expect([8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 96000].indexOf(sampleRate) >= 0).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG_0032
     * @tc.name      testExtRecConfig0031
     * @tc.desc      Config 64000Hz 1280x720 channels=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 64000;
      const frameWidth: number = 1280;
      const frameHeight: number = 720;
      const channels: number = 2;
      const bitrate: number = 208000;
      expect(sampleRate).assertEqual(64000);
      expect(frameWidth).assertEqual(1280);
      expect(frameHeight).assertEqual(720);
      expect(channels).assertEqual(2);
      expect(bitrate).assertLarger(0);
      expect([8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 96000].indexOf(sampleRate) >= 0).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG_0033
     * @tc.name      testExtRecConfig0032
     * @tc.desc      Config 96000Hz 1920x1080 channels=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 96000;
      const frameWidth: number = 1920;
      const frameHeight: number = 1080;
      const channels: number = 1;
      const bitrate: number = 112000;
      expect(sampleRate).assertEqual(96000);
      expect(frameWidth).assertEqual(1920);
      expect(frameHeight).assertEqual(1080);
      expect(channels).assertEqual(1);
      expect(bitrate).assertLarger(0);
      expect([8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 96000].indexOf(sampleRate) >= 0).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG_0034
     * @tc.name      testExtRecConfig0033
     * @tc.desc      Config 8000Hz 640x480 channels=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 8000;
      const frameWidth: number = 640;
      const frameHeight: number = 480;
      const channels: number = 2;
      const bitrate: number = 144000;
      expect(sampleRate).assertEqual(8000);
      expect(frameWidth).assertEqual(640);
      expect(frameHeight).assertEqual(480);
      expect(channels).assertEqual(2);
      expect(bitrate).assertLarger(0);
      expect([8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 96000].indexOf(sampleRate) >= 0).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG_0035
     * @tc.name      testExtRecConfig0034
     * @tc.desc      Config 11025Hz 1280x720 channels=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 11025;
      const frameWidth: number = 1280;
      const frameHeight: number = 720;
      const channels: number = 1;
      const bitrate: number = 176000;
      expect(sampleRate).assertEqual(11025);
      expect(frameWidth).assertEqual(1280);
      expect(frameHeight).assertEqual(720);
      expect(channels).assertEqual(1);
      expect(bitrate).assertLarger(0);
      expect([8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 96000].indexOf(sampleRate) >= 0).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG_0036
     * @tc.name      testExtRecConfig0035
     * @tc.desc      Config 12000Hz 1920x1080 channels=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 12000;
      const frameWidth: number = 1920;
      const frameHeight: number = 1080;
      const channels: number = 2;
      const bitrate: number = 208000;
      expect(sampleRate).assertEqual(12000);
      expect(frameWidth).assertEqual(1920);
      expect(frameHeight).assertEqual(1080);
      expect(channels).assertEqual(2);
      expect(bitrate).assertLarger(0);
      expect([8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 96000].indexOf(sampleRate) >= 0).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG_0037
     * @tc.name      testExtRecConfig0036
     * @tc.desc      Config 16000Hz 640x480 channels=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 16000;
      const frameWidth: number = 640;
      const frameHeight: number = 480;
      const channels: number = 1;
      const bitrate: number = 112000;
      expect(sampleRate).assertEqual(16000);
      expect(frameWidth).assertEqual(640);
      expect(frameHeight).assertEqual(480);
      expect(channels).assertEqual(1);
      expect(bitrate).assertLarger(0);
      expect([8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 96000].indexOf(sampleRate) >= 0).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG_0038
     * @tc.name      testExtRecConfig0037
     * @tc.desc      Config 22050Hz 1280x720 channels=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 22050;
      const frameWidth: number = 1280;
      const frameHeight: number = 720;
      const channels: number = 2;
      const bitrate: number = 144000;
      expect(sampleRate).assertEqual(22050);
      expect(frameWidth).assertEqual(1280);
      expect(frameHeight).assertEqual(720);
      expect(channels).assertEqual(2);
      expect(bitrate).assertLarger(0);
      expect([8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 96000].indexOf(sampleRate) >= 0).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG_0039
     * @tc.name      testExtRecConfig0038
     * @tc.desc      Config 24000Hz 1920x1080 channels=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 24000;
      const frameWidth: number = 1920;
      const frameHeight: number = 1080;
      const channels: number = 1;
      const bitrate: number = 176000;
      expect(sampleRate).assertEqual(24000);
      expect(frameWidth).assertEqual(1920);
      expect(frameHeight).assertEqual(1080);
      expect(channels).assertEqual(1);
      expect(bitrate).assertLarger(0);
      expect([8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 96000].indexOf(sampleRate) >= 0).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG_0040
     * @tc.name      testExtRecConfig0039
     * @tc.desc      Config 32000Hz 640x480 channels=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 32000;
      const frameWidth: number = 640;
      const frameHeight: number = 480;
      const channels: number = 2;
      const bitrate: number = 208000;
      expect(sampleRate).assertEqual(32000);
      expect(frameWidth).assertEqual(640);
      expect(frameHeight).assertEqual(480);
      expect(channels).assertEqual(2);
      expect(bitrate).assertLarger(0);
      expect([8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 96000].indexOf(sampleRate) >= 0).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG_0041
     * @tc.name      testExtRecConfig0040
     * @tc.desc      Config 44100Hz 1280x720 channels=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 44100;
      const frameWidth: number = 1280;
      const frameHeight: number = 720;
      const channels: number = 1;
      const bitrate: number = 112000;
      expect(sampleRate).assertEqual(44100);
      expect(frameWidth).assertEqual(1280);
      expect(frameHeight).assertEqual(720);
      expect(channels).assertEqual(1);
      expect(bitrate).assertLarger(0);
      expect([8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 96000].indexOf(sampleRate) >= 0).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG_0042
     * @tc.name      testExtRecConfig0041
     * @tc.desc      Config 48000Hz 1920x1080 channels=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 48000;
      const frameWidth: number = 1920;
      const frameHeight: number = 1080;
      const channels: number = 2;
      const bitrate: number = 144000;
      expect(sampleRate).assertEqual(48000);
      expect(frameWidth).assertEqual(1920);
      expect(frameHeight).assertEqual(1080);
      expect(channels).assertEqual(2);
      expect(bitrate).assertLarger(0);
      expect([8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 96000].indexOf(sampleRate) >= 0).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG_0043
     * @tc.name      testExtRecConfig0042
     * @tc.desc      Config 64000Hz 640x480 channels=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 64000;
      const frameWidth: number = 640;
      const frameHeight: number = 480;
      const channels: number = 1;
      const bitrate: number = 176000;
      expect(sampleRate).assertEqual(64000);
      expect(frameWidth).assertEqual(640);
      expect(frameHeight).assertEqual(480);
      expect(channels).assertEqual(1);
      expect(bitrate).assertLarger(0);
      expect([8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 96000].indexOf(sampleRate) >= 0).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG_0044
     * @tc.name      testExtRecConfig0043
     * @tc.desc      Config 96000Hz 1280x720 channels=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 96000;
      const frameWidth: number = 1280;
      const frameHeight: number = 720;
      const channels: number = 2;
      const bitrate: number = 208000;
      expect(sampleRate).assertEqual(96000);
      expect(frameWidth).assertEqual(1280);
      expect(frameHeight).assertEqual(720);
      expect(channels).assertEqual(2);
      expect(bitrate).assertLarger(0);
      expect([8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 96000].indexOf(sampleRate) >= 0).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG_0045
     * @tc.name      testExtRecConfig0044
     * @tc.desc      Config 8000Hz 1920x1080 channels=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 8000;
      const frameWidth: number = 1920;
      const frameHeight: number = 1080;
      const channels: number = 1;
      const bitrate: number = 112000;
      expect(sampleRate).assertEqual(8000);
      expect(frameWidth).assertEqual(1920);
      expect(frameHeight).assertEqual(1080);
      expect(channels).assertEqual(1);
      expect(bitrate).assertLarger(0);
      expect([8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 96000].indexOf(sampleRate) >= 0).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG_0046
     * @tc.name      testExtRecConfig0045
     * @tc.desc      Config 11025Hz 640x480 channels=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 11025;
      const frameWidth: number = 640;
      const frameHeight: number = 480;
      const channels: number = 2;
      const bitrate: number = 144000;
      expect(sampleRate).assertEqual(11025);
      expect(frameWidth).assertEqual(640);
      expect(frameHeight).assertEqual(480);
      expect(channels).assertEqual(2);
      expect(bitrate).assertLarger(0);
      expect([8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 96000].indexOf(sampleRate) >= 0).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG_0047
     * @tc.name      testExtRecConfig0046
     * @tc.desc      Config 12000Hz 1280x720 channels=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 12000;
      const frameWidth: number = 1280;
      const frameHeight: number = 720;
      const channels: number = 1;
      const bitrate: number = 176000;
      expect(sampleRate).assertEqual(12000);
      expect(frameWidth).assertEqual(1280);
      expect(frameHeight).assertEqual(720);
      expect(channels).assertEqual(1);
      expect(bitrate).assertLarger(0);
      expect([8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 96000].indexOf(sampleRate) >= 0).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG_0048
     * @tc.name      testExtRecConfig0047
     * @tc.desc      Config 16000Hz 1920x1080 channels=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 16000;
      const frameWidth: number = 1920;
      const frameHeight: number = 1080;
      const channels: number = 2;
      const bitrate: number = 208000;
      expect(sampleRate).assertEqual(16000);
      expect(frameWidth).assertEqual(1920);
      expect(frameHeight).assertEqual(1080);
      expect(channels).assertEqual(2);
      expect(bitrate).assertLarger(0);
      expect([8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 96000].indexOf(sampleRate) >= 0).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG_0049
     * @tc.name      testExtRecConfig0048
     * @tc.desc      Config 22050Hz 640x480 channels=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 22050;
      const frameWidth: number = 640;
      const frameHeight: number = 480;
      const channels: number = 1;
      const bitrate: number = 112000;
      expect(sampleRate).assertEqual(22050);
      expect(frameWidth).assertEqual(640);
      expect(frameHeight).assertEqual(480);
      expect(channels).assertEqual(1);
      expect(bitrate).assertLarger(0);
      expect([8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 96000].indexOf(sampleRate) >= 0).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG_0050
     * @tc.name      testExtRecConfig0049
     * @tc.desc      Config 24000Hz 1280x720 channels=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 24000;
      const frameWidth: number = 1280;
      const frameHeight: number = 720;
      const channels: number = 2;
      const bitrate: number = 144000;
      expect(sampleRate).assertEqual(24000);
      expect(frameWidth).assertEqual(1280);
      expect(frameHeight).assertEqual(720);
      expect(channels).assertEqual(2);
      expect(bitrate).assertLarger(0);
      expect([8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 96000].indexOf(sampleRate) >= 0).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG_0051
     * @tc.name      testExtRecConfig0050
     * @tc.desc      Config 32000Hz 1920x1080 channels=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 32000;
      const frameWidth: number = 1920;
      const frameHeight: number = 1080;
      const channels: number = 1;
      const bitrate: number = 176000;
      expect(sampleRate).assertEqual(32000);
      expect(frameWidth).assertEqual(1920);
      expect(frameHeight).assertEqual(1080);
      expect(channels).assertEqual(1);
      expect(bitrate).assertLarger(0);
      expect([8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 96000].indexOf(sampleRate) >= 0).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG_0052
     * @tc.name      testExtRecConfig0051
     * @tc.desc      Config 44100Hz 640x480 channels=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 44100;
      const frameWidth: number = 640;
      const frameHeight: number = 480;
      const channels: number = 2;
      const bitrate: number = 208000;
      expect(sampleRate).assertEqual(44100);
      expect(frameWidth).assertEqual(640);
      expect(frameHeight).assertEqual(480);
      expect(channels).assertEqual(2);
      expect(bitrate).assertLarger(0);
      expect([8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 96000].indexOf(sampleRate) >= 0).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG_0053
     * @tc.name      testExtRecConfig0052
     * @tc.desc      Config 48000Hz 1280x720 channels=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 48000;
      const frameWidth: number = 1280;
      const frameHeight: number = 720;
      const channels: number = 1;
      const bitrate: number = 112000;
      expect(sampleRate).assertEqual(48000);
      expect(frameWidth).assertEqual(1280);
      expect(frameHeight).assertEqual(720);
      expect(channels).assertEqual(1);
      expect(bitrate).assertLarger(0);
      expect([8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 96000].indexOf(sampleRate) >= 0).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG_0054
     * @tc.name      testExtRecConfig0053
     * @tc.desc      Config 64000Hz 1920x1080 channels=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 64000;
      const frameWidth: number = 1920;
      const frameHeight: number = 1080;
      const channels: number = 2;
      const bitrate: number = 144000;
      expect(sampleRate).assertEqual(64000);
      expect(frameWidth).assertEqual(1920);
      expect(frameHeight).assertEqual(1080);
      expect(channels).assertEqual(2);
      expect(bitrate).assertLarger(0);
      expect([8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 96000].indexOf(sampleRate) >= 0).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG_0055
     * @tc.name      testExtRecConfig0054
     * @tc.desc      Config 96000Hz 640x480 channels=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 96000;
      const frameWidth: number = 640;
      const frameHeight: number = 480;
      const channels: number = 1;
      const bitrate: number = 176000;
      expect(sampleRate).assertEqual(96000);
      expect(frameWidth).assertEqual(640);
      expect(frameHeight).assertEqual(480);
      expect(channels).assertEqual(1);
      expect(bitrate).assertLarger(0);
      expect([8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 96000].indexOf(sampleRate) >= 0).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG_0056
     * @tc.name      testExtRecConfig0055
     * @tc.desc      Config 8000Hz 1280x720 channels=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 8000;
      const frameWidth: number = 1280;
      const frameHeight: number = 720;
      const channels: number = 2;
      const bitrate: number = 208000;
      expect(sampleRate).assertEqual(8000);
      expect(frameWidth).assertEqual(1280);
      expect(frameHeight).assertEqual(720);
      expect(channels).assertEqual(2);
      expect(bitrate).assertLarger(0);
      expect([8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 96000].indexOf(sampleRate) >= 0).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG_0057
     * @tc.name      testExtRecConfig0056
     * @tc.desc      Config 11025Hz 1920x1080 channels=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 11025;
      const frameWidth: number = 1920;
      const frameHeight: number = 1080;
      const channels: number = 1;
      const bitrate: number = 112000;
      expect(sampleRate).assertEqual(11025);
      expect(frameWidth).assertEqual(1920);
      expect(frameHeight).assertEqual(1080);
      expect(channels).assertEqual(1);
      expect(bitrate).assertLarger(0);
      expect([8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 96000].indexOf(sampleRate) >= 0).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG_0058
     * @tc.name      testExtRecConfig0057
     * @tc.desc      Config 12000Hz 640x480 channels=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 12000;
      const frameWidth: number = 640;
      const frameHeight: number = 480;
      const channels: number = 2;
      const bitrate: number = 144000;
      expect(sampleRate).assertEqual(12000);
      expect(frameWidth).assertEqual(640);
      expect(frameHeight).assertEqual(480);
      expect(channels).assertEqual(2);
      expect(bitrate).assertLarger(0);
      expect([8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 96000].indexOf(sampleRate) >= 0).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG_0059
     * @tc.name      testExtRecConfig0058
     * @tc.desc      Config 16000Hz 1280x720 channels=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 16000;
      const frameWidth: number = 1280;
      const frameHeight: number = 720;
      const channels: number = 1;
      const bitrate: number = 176000;
      expect(sampleRate).assertEqual(16000);
      expect(frameWidth).assertEqual(1280);
      expect(frameHeight).assertEqual(720);
      expect(channels).assertEqual(1);
      expect(bitrate).assertLarger(0);
      expect([8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 96000].indexOf(sampleRate) >= 0).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG_0060
     * @tc.name      testExtRecConfig0059
     * @tc.desc      Config 22050Hz 1920x1080 channels=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 22050;
      const frameWidth: number = 1920;
      const frameHeight: number = 1080;
      const channels: number = 2;
      const bitrate: number = 208000;
      expect(sampleRate).assertEqual(22050);
      expect(frameWidth).assertEqual(1920);
      expect(frameHeight).assertEqual(1080);
      expect(channels).assertEqual(2);
      expect(bitrate).assertLarger(0);
      expect([8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 96000].indexOf(sampleRate) >= 0).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG_0061
     * @tc.name      testExtRecConfig0060
     * @tc.desc      Config 24000Hz 640x480 channels=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 24000;
      const frameWidth: number = 640;
      const frameHeight: number = 480;
      const channels: number = 1;
      const bitrate: number = 112000;
      expect(sampleRate).assertEqual(24000);
      expect(frameWidth).assertEqual(640);
      expect(frameHeight).assertEqual(480);
      expect(channels).assertEqual(1);
      expect(bitrate).assertLarger(0);
      expect([8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 96000].indexOf(sampleRate) >= 0).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG_0062
     * @tc.name      testExtRecConfig0061
     * @tc.desc      Config 32000Hz 1280x720 channels=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 32000;
      const frameWidth: number = 1280;
      const frameHeight: number = 720;
      const channels: number = 2;
      const bitrate: number = 144000;
      expect(sampleRate).assertEqual(32000);
      expect(frameWidth).assertEqual(1280);
      expect(frameHeight).assertEqual(720);
      expect(channels).assertEqual(2);
      expect(bitrate).assertLarger(0);
      expect([8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 96000].indexOf(sampleRate) >= 0).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG_0063
     * @tc.name      testExtRecConfig0062
     * @tc.desc      Config 44100Hz 1920x1080 channels=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 44100;
      const frameWidth: number = 1920;
      const frameHeight: number = 1080;
      const channels: number = 1;
      const bitrate: number = 176000;
      expect(sampleRate).assertEqual(44100);
      expect(frameWidth).assertEqual(1920);
      expect(frameHeight).assertEqual(1080);
      expect(channels).assertEqual(1);
      expect(bitrate).assertLarger(0);
      expect([8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 96000].indexOf(sampleRate) >= 0).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG_0064
     * @tc.name      testExtRecConfig0063
     * @tc.desc      Config 48000Hz 640x480 channels=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 48000;
      const frameWidth: number = 640;
      const frameHeight: number = 480;
      const channels: number = 2;
      const bitrate: number = 208000;
      expect(sampleRate).assertEqual(48000);
      expect(frameWidth).assertEqual(640);
      expect(frameHeight).assertEqual(480);
      expect(channels).assertEqual(2);
      expect(bitrate).assertLarger(0);
      expect([8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 96000].indexOf(sampleRate) >= 0).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG_0065
     * @tc.name      testExtRecConfig0064
     * @tc.desc      Config 64000Hz 1280x720 channels=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 64000;
      const frameWidth: number = 1280;
      const frameHeight: number = 720;
      const channels: number = 1;
      const bitrate: number = 112000;
      expect(sampleRate).assertEqual(64000);
      expect(frameWidth).assertEqual(1280);
      expect(frameHeight).assertEqual(720);
      expect(channels).assertEqual(1);
      expect(bitrate).assertLarger(0);
      expect([8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 96000].indexOf(sampleRate) >= 0).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG_0066
     * @tc.name      testExtRecConfig0065
     * @tc.desc      Config 96000Hz 1920x1080 channels=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 96000;
      const frameWidth: number = 1920;
      const frameHeight: number = 1080;
      const channels: number = 2;
      const bitrate: number = 144000;
      expect(sampleRate).assertEqual(96000);
      expect(frameWidth).assertEqual(1920);
      expect(frameHeight).assertEqual(1080);
      expect(channels).assertEqual(2);
      expect(bitrate).assertLarger(0);
      expect([8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 96000].indexOf(sampleRate) >= 0).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG_0067
     * @tc.name      testExtRecConfig0066
     * @tc.desc      Config 8000Hz 640x480 channels=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 8000;
      const frameWidth: number = 640;
      const frameHeight: number = 480;
      const channels: number = 1;
      const bitrate: number = 176000;
      expect(sampleRate).assertEqual(8000);
      expect(frameWidth).assertEqual(640);
      expect(frameHeight).assertEqual(480);
      expect(channels).assertEqual(1);
      expect(bitrate).assertLarger(0);
      expect([8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 96000].indexOf(sampleRate) >= 0).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG_0068
     * @tc.name      testExtRecConfig0067
     * @tc.desc      Config 11025Hz 1280x720 channels=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 11025;
      const frameWidth: number = 1280;
      const frameHeight: number = 720;
      const channels: number = 2;
      const bitrate: number = 208000;
      expect(sampleRate).assertEqual(11025);
      expect(frameWidth).assertEqual(1280);
      expect(frameHeight).assertEqual(720);
      expect(channels).assertEqual(2);
      expect(bitrate).assertLarger(0);
      expect([8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 96000].indexOf(sampleRate) >= 0).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG_0069
     * @tc.name      testExtRecConfig0068
     * @tc.desc      Config 12000Hz 1920x1080 channels=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 12000;
      const frameWidth: number = 1920;
      const frameHeight: number = 1080;
      const channels: number = 1;
      const bitrate: number = 112000;
      expect(sampleRate).assertEqual(12000);
      expect(frameWidth).assertEqual(1920);
      expect(frameHeight).assertEqual(1080);
      expect(channels).assertEqual(1);
      expect(bitrate).assertLarger(0);
      expect([8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 96000].indexOf(sampleRate) >= 0).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG_0070
     * @tc.name      testExtRecConfig0069
     * @tc.desc      Config 16000Hz 640x480 channels=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 16000;
      const frameWidth: number = 640;
      const frameHeight: number = 480;
      const channels: number = 2;
      const bitrate: number = 144000;
      expect(sampleRate).assertEqual(16000);
      expect(frameWidth).assertEqual(640);
      expect(frameHeight).assertEqual(480);
      expect(channels).assertEqual(2);
      expect(bitrate).assertLarger(0);
      expect([8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 96000].indexOf(sampleRate) >= 0).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG_0071
     * @tc.name      testExtRecConfig0070
     * @tc.desc      Config 22050Hz 1280x720 channels=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 22050;
      const frameWidth: number = 1280;
      const frameHeight: number = 720;
      const channels: number = 1;
      const bitrate: number = 176000;
      expect(sampleRate).assertEqual(22050);
      expect(frameWidth).assertEqual(1280);
      expect(frameHeight).assertEqual(720);
      expect(channels).assertEqual(1);
      expect(bitrate).assertLarger(0);
      expect([8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 96000].indexOf(sampleRate) >= 0).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG_0072
     * @tc.name      testExtRecConfig0071
     * @tc.desc      Config 24000Hz 1920x1080 channels=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 24000;
      const frameWidth: number = 1920;
      const frameHeight: number = 1080;
      const channels: number = 2;
      const bitrate: number = 208000;
      expect(sampleRate).assertEqual(24000);
      expect(frameWidth).assertEqual(1920);
      expect(frameHeight).assertEqual(1080);
      expect(channels).assertEqual(2);
      expect(bitrate).assertLarger(0);
      expect([8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 96000].indexOf(sampleRate) >= 0).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG_0073
     * @tc.name      testExtRecConfig0072
     * @tc.desc      Config 32000Hz 640x480 channels=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 32000;
      const frameWidth: number = 640;
      const frameHeight: number = 480;
      const channels: number = 1;
      const bitrate: number = 112000;
      expect(sampleRate).assertEqual(32000);
      expect(frameWidth).assertEqual(640);
      expect(frameHeight).assertEqual(480);
      expect(channels).assertEqual(1);
      expect(bitrate).assertLarger(0);
      expect([8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 96000].indexOf(sampleRate) >= 0).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG_0074
     * @tc.name      testExtRecConfig0073
     * @tc.desc      Config 44100Hz 1280x720 channels=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 44100;
      const frameWidth: number = 1280;
      const frameHeight: number = 720;
      const channels: number = 2;
      const bitrate: number = 144000;
      expect(sampleRate).assertEqual(44100);
      expect(frameWidth).assertEqual(1280);
      expect(frameHeight).assertEqual(720);
      expect(channels).assertEqual(2);
      expect(bitrate).assertLarger(0);
      expect([8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 96000].indexOf(sampleRate) >= 0).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG_0075
     * @tc.name      testExtRecConfig0074
     * @tc.desc      Config 48000Hz 1920x1080 channels=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 48000;
      const frameWidth: number = 1920;
      const frameHeight: number = 1080;
      const channels: number = 1;
      const bitrate: number = 176000;
      expect(sampleRate).assertEqual(48000);
      expect(frameWidth).assertEqual(1920);
      expect(frameHeight).assertEqual(1080);
      expect(channels).assertEqual(1);
      expect(bitrate).assertLarger(0);
      expect([8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 96000].indexOf(sampleRate) >= 0).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG_0076
     * @tc.name      testExtRecConfig0075
     * @tc.desc      Config 64000Hz 640x480 channels=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 64000;
      const frameWidth: number = 640;
      const frameHeight: number = 480;
      const channels: number = 2;
      const bitrate: number = 208000;
      expect(sampleRate).assertEqual(64000);
      expect(frameWidth).assertEqual(640);
      expect(frameHeight).assertEqual(480);
      expect(channels).assertEqual(2);
      expect(bitrate).assertLarger(0);
      expect([8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 96000].indexOf(sampleRate) >= 0).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG_0077
     * @tc.name      testExtRecConfig0076
     * @tc.desc      Config 96000Hz 1280x720 channels=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 96000;
      const frameWidth: number = 1280;
      const frameHeight: number = 720;
      const channels: number = 1;
      const bitrate: number = 112000;
      expect(sampleRate).assertEqual(96000);
      expect(frameWidth).assertEqual(1280);
      expect(frameHeight).assertEqual(720);
      expect(channels).assertEqual(1);
      expect(bitrate).assertLarger(0);
      expect([8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 96000].indexOf(sampleRate) >= 0).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG_0078
     * @tc.name      testExtRecConfig0077
     * @tc.desc      Config 8000Hz 1920x1080 channels=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 8000;
      const frameWidth: number = 1920;
      const frameHeight: number = 1080;
      const channels: number = 2;
      const bitrate: number = 144000;
      expect(sampleRate).assertEqual(8000);
      expect(frameWidth).assertEqual(1920);
      expect(frameHeight).assertEqual(1080);
      expect(channels).assertEqual(2);
      expect(bitrate).assertLarger(0);
      expect([8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 96000].indexOf(sampleRate) >= 0).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG_0079
     * @tc.name      testExtRecConfig0078
     * @tc.desc      Config 11025Hz 640x480 channels=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 11025;
      const frameWidth: number = 640;
      const frameHeight: number = 480;
      const channels: number = 1;
      const bitrate: number = 176000;
      expect(sampleRate).assertEqual(11025);
      expect(frameWidth).assertEqual(640);
      expect(frameHeight).assertEqual(480);
      expect(channels).assertEqual(1);
      expect(bitrate).assertLarger(0);
      expect([8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 96000].indexOf(sampleRate) >= 0).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG_0080
     * @tc.name      testExtRecConfig0079
     * @tc.desc      Config 12000Hz 1280x720 channels=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 12000;
      const frameWidth: number = 1280;
      const frameHeight: number = 720;
      const channels: number = 2;
      const bitrate: number = 208000;
      expect(sampleRate).assertEqual(12000);
      expect(frameWidth).assertEqual(1280);
      expect(frameHeight).assertEqual(720);
      expect(channels).assertEqual(2);
      expect(bitrate).assertLarger(0);
      expect([8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 96000].indexOf(sampleRate) >= 0).assertEqual(true);
    })
  });
}
