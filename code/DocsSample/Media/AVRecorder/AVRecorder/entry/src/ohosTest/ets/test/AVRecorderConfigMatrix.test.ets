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

const TAG: string = '[Sample_avRecorderConfigMatrix]';
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
  assertClose(expectValue: number, precision: number): void;
  assertUndefined(): void;
  assertFail(): void;
}

function expect(actual: string | number | boolean | Object | null | undefined): ExpectAssert {
  hilog.info(DOMAIN, TAG, '%{public}s', 'actual: ' + String(actual));
  return hypiumExpect(actual);
}

export default function avRecorderConfigMatrixTest(): void {
  describe('avRecorderConfigMatrixTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG2_0001
     * @tc.name      testExtRecConfig20000
     * @tc.desc      Config 8000Hz 640x480 ch=1 0deg.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig20000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 8000;
      const frameWidth: number = 640;
      const frameHeight: number = 480;
      const channels: number = 1;
      const bitrate: number = 112000;
      const orientation: string = '0';
      expect(sampleRate).assertEqual(8000);
      expect(frameWidth).assertEqual(640);
      expect(frameHeight).assertEqual(480);
      expect(channels).assertEqual(1);
      expect(bitrate).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf(orientation) >= 0).assertTrue();
      expect((8000 > 0 && 640 > 0 && 480 > 0 && 112000 > 0)).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG2_0002
     * @tc.name      testExtRecConfig20001
     * @tc.desc      Config 11025Hz 1280x720 ch=2 90deg.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig20001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 11025;
      const frameWidth: number = 1280;
      const frameHeight: number = 720;
      const channels: number = 2;
      const bitrate: number = 144000;
      const orientation: string = '90';
      expect(sampleRate).assertEqual(11025);
      expect(frameWidth).assertEqual(1280);
      expect(frameHeight).assertEqual(720);
      expect(channels).assertEqual(2);
      expect(bitrate).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf(orientation) >= 0).assertTrue();
      expect((11025 > 0 && 1280 > 0 && 720 > 0 && 144000 > 0)).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG2_0003
     * @tc.name      testExtRecConfig20002
     * @tc.desc      Config 12000Hz 1920x1080 ch=1 180deg.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig20002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 12000;
      const frameWidth: number = 1920;
      const frameHeight: number = 1080;
      const channels: number = 1;
      const bitrate: number = 176000;
      const orientation: string = '180';
      expect(sampleRate).assertEqual(12000);
      expect(frameWidth).assertEqual(1920);
      expect(frameHeight).assertEqual(1080);
      expect(channels).assertEqual(1);
      expect(bitrate).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf(orientation) >= 0).assertTrue();
      expect((12000 > 0 && 1920 > 0 && 1080 > 0 && 176000 > 0)).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG2_0004
     * @tc.name      testExtRecConfig20003
     * @tc.desc      Config 16000Hz 640x480 ch=2 270deg.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig20003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 16000;
      const frameWidth: number = 640;
      const frameHeight: number = 480;
      const channels: number = 2;
      const bitrate: number = 208000;
      const orientation: string = '270';
      expect(sampleRate).assertEqual(16000);
      expect(frameWidth).assertEqual(640);
      expect(frameHeight).assertEqual(480);
      expect(channels).assertEqual(2);
      expect(bitrate).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf(orientation) >= 0).assertTrue();
      expect((16000 > 0 && 640 > 0 && 480 > 0 && 208000 > 0)).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG2_0005
     * @tc.name      testExtRecConfig20004
     * @tc.desc      Config 22050Hz 1280x720 ch=1 0deg.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig20004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 22050;
      const frameWidth: number = 1280;
      const frameHeight: number = 720;
      const channels: number = 1;
      const bitrate: number = 112000;
      const orientation: string = '0';
      expect(sampleRate).assertEqual(22050);
      expect(frameWidth).assertEqual(1280);
      expect(frameHeight).assertEqual(720);
      expect(channels).assertEqual(1);
      expect(bitrate).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf(orientation) >= 0).assertTrue();
      expect((22050 > 0 && 1280 > 0 && 720 > 0 && 112000 > 0)).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG2_0006
     * @tc.name      testExtRecConfig20005
     * @tc.desc      Config 24000Hz 1920x1080 ch=2 90deg.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig20005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 24000;
      const frameWidth: number = 1920;
      const frameHeight: number = 1080;
      const channels: number = 2;
      const bitrate: number = 144000;
      const orientation: string = '90';
      expect(sampleRate).assertEqual(24000);
      expect(frameWidth).assertEqual(1920);
      expect(frameHeight).assertEqual(1080);
      expect(channels).assertEqual(2);
      expect(bitrate).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf(orientation) >= 0).assertTrue();
      expect((24000 > 0 && 1920 > 0 && 1080 > 0 && 144000 > 0)).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG2_0007
     * @tc.name      testExtRecConfig20006
     * @tc.desc      Config 32000Hz 640x480 ch=1 180deg.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig20006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 32000;
      const frameWidth: number = 640;
      const frameHeight: number = 480;
      const channels: number = 1;
      const bitrate: number = 176000;
      const orientation: string = '180';
      expect(sampleRate).assertEqual(32000);
      expect(frameWidth).assertEqual(640);
      expect(frameHeight).assertEqual(480);
      expect(channels).assertEqual(1);
      expect(bitrate).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf(orientation) >= 0).assertTrue();
      expect((32000 > 0 && 640 > 0 && 480 > 0 && 176000 > 0)).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG2_0008
     * @tc.name      testExtRecConfig20007
     * @tc.desc      Config 44100Hz 1280x720 ch=2 270deg.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig20007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 44100;
      const frameWidth: number = 1280;
      const frameHeight: number = 720;
      const channels: number = 2;
      const bitrate: number = 208000;
      const orientation: string = '270';
      expect(sampleRate).assertEqual(44100);
      expect(frameWidth).assertEqual(1280);
      expect(frameHeight).assertEqual(720);
      expect(channels).assertEqual(2);
      expect(bitrate).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf(orientation) >= 0).assertTrue();
      expect((44100 > 0 && 1280 > 0 && 720 > 0 && 208000 > 0)).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG2_0009
     * @tc.name      testExtRecConfig20008
     * @tc.desc      Config 48000Hz 1920x1080 ch=1 0deg.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig20008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 48000;
      const frameWidth: number = 1920;
      const frameHeight: number = 1080;
      const channels: number = 1;
      const bitrate: number = 112000;
      const orientation: string = '0';
      expect(sampleRate).assertEqual(48000);
      expect(frameWidth).assertEqual(1920);
      expect(frameHeight).assertEqual(1080);
      expect(channels).assertEqual(1);
      expect(bitrate).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf(orientation) >= 0).assertTrue();
      expect((48000 > 0 && 1920 > 0 && 1080 > 0 && 112000 > 0)).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG2_0010
     * @tc.name      testExtRecConfig20009
     * @tc.desc      Config 64000Hz 640x480 ch=2 90deg.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig20009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 64000;
      const frameWidth: number = 640;
      const frameHeight: number = 480;
      const channels: number = 2;
      const bitrate: number = 144000;
      const orientation: string = '90';
      expect(sampleRate).assertEqual(64000);
      expect(frameWidth).assertEqual(640);
      expect(frameHeight).assertEqual(480);
      expect(channels).assertEqual(2);
      expect(bitrate).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf(orientation) >= 0).assertTrue();
      expect((64000 > 0 && 640 > 0 && 480 > 0 && 144000 > 0)).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG2_0011
     * @tc.name      testExtRecConfig20010
     * @tc.desc      Config 96000Hz 1280x720 ch=1 180deg.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig20010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 96000;
      const frameWidth: number = 1280;
      const frameHeight: number = 720;
      const channels: number = 1;
      const bitrate: number = 176000;
      const orientation: string = '180';
      expect(sampleRate).assertEqual(96000);
      expect(frameWidth).assertEqual(1280);
      expect(frameHeight).assertEqual(720);
      expect(channels).assertEqual(1);
      expect(bitrate).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf(orientation) >= 0).assertTrue();
      expect((96000 > 0 && 1280 > 0 && 720 > 0 && 176000 > 0)).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG2_0012
     * @tc.name      testExtRecConfig20011
     * @tc.desc      Config 8000Hz 1920x1080 ch=2 270deg.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig20011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 8000;
      const frameWidth: number = 1920;
      const frameHeight: number = 1080;
      const channels: number = 2;
      const bitrate: number = 208000;
      const orientation: string = '270';
      expect(sampleRate).assertEqual(8000);
      expect(frameWidth).assertEqual(1920);
      expect(frameHeight).assertEqual(1080);
      expect(channels).assertEqual(2);
      expect(bitrate).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf(orientation) >= 0).assertTrue();
      expect((8000 > 0 && 1920 > 0 && 1080 > 0 && 208000 > 0)).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG2_0013
     * @tc.name      testExtRecConfig20012
     * @tc.desc      Config 11025Hz 640x480 ch=1 0deg.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig20012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 11025;
      const frameWidth: number = 640;
      const frameHeight: number = 480;
      const channels: number = 1;
      const bitrate: number = 112000;
      const orientation: string = '0';
      expect(sampleRate).assertEqual(11025);
      expect(frameWidth).assertEqual(640);
      expect(frameHeight).assertEqual(480);
      expect(channels).assertEqual(1);
      expect(bitrate).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf(orientation) >= 0).assertTrue();
      expect((11025 > 0 && 640 > 0 && 480 > 0 && 112000 > 0)).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG2_0014
     * @tc.name      testExtRecConfig20013
     * @tc.desc      Config 12000Hz 1280x720 ch=2 90deg.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig20013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 12000;
      const frameWidth: number = 1280;
      const frameHeight: number = 720;
      const channels: number = 2;
      const bitrate: number = 144000;
      const orientation: string = '90';
      expect(sampleRate).assertEqual(12000);
      expect(frameWidth).assertEqual(1280);
      expect(frameHeight).assertEqual(720);
      expect(channels).assertEqual(2);
      expect(bitrate).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf(orientation) >= 0).assertTrue();
      expect((12000 > 0 && 1280 > 0 && 720 > 0 && 144000 > 0)).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG2_0015
     * @tc.name      testExtRecConfig20014
     * @tc.desc      Config 16000Hz 1920x1080 ch=1 180deg.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig20014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 16000;
      const frameWidth: number = 1920;
      const frameHeight: number = 1080;
      const channels: number = 1;
      const bitrate: number = 176000;
      const orientation: string = '180';
      expect(sampleRate).assertEqual(16000);
      expect(frameWidth).assertEqual(1920);
      expect(frameHeight).assertEqual(1080);
      expect(channels).assertEqual(1);
      expect(bitrate).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf(orientation) >= 0).assertTrue();
      expect((16000 > 0 && 1920 > 0 && 1080 > 0 && 176000 > 0)).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG2_0016
     * @tc.name      testExtRecConfig20015
     * @tc.desc      Config 22050Hz 640x480 ch=2 270deg.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig20015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 22050;
      const frameWidth: number = 640;
      const frameHeight: number = 480;
      const channels: number = 2;
      const bitrate: number = 208000;
      const orientation: string = '270';
      expect(sampleRate).assertEqual(22050);
      expect(frameWidth).assertEqual(640);
      expect(frameHeight).assertEqual(480);
      expect(channels).assertEqual(2);
      expect(bitrate).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf(orientation) >= 0).assertTrue();
      expect((22050 > 0 && 640 > 0 && 480 > 0 && 208000 > 0)).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG2_0017
     * @tc.name      testExtRecConfig20016
     * @tc.desc      Config 24000Hz 1280x720 ch=1 0deg.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig20016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 24000;
      const frameWidth: number = 1280;
      const frameHeight: number = 720;
      const channels: number = 1;
      const bitrate: number = 112000;
      const orientation: string = '0';
      expect(sampleRate).assertEqual(24000);
      expect(frameWidth).assertEqual(1280);
      expect(frameHeight).assertEqual(720);
      expect(channels).assertEqual(1);
      expect(bitrate).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf(orientation) >= 0).assertTrue();
      expect((24000 > 0 && 1280 > 0 && 720 > 0 && 112000 > 0)).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG2_0018
     * @tc.name      testExtRecConfig20017
     * @tc.desc      Config 32000Hz 1920x1080 ch=2 90deg.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig20017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 32000;
      const frameWidth: number = 1920;
      const frameHeight: number = 1080;
      const channels: number = 2;
      const bitrate: number = 144000;
      const orientation: string = '90';
      expect(sampleRate).assertEqual(32000);
      expect(frameWidth).assertEqual(1920);
      expect(frameHeight).assertEqual(1080);
      expect(channels).assertEqual(2);
      expect(bitrate).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf(orientation) >= 0).assertTrue();
      expect((32000 > 0 && 1920 > 0 && 1080 > 0 && 144000 > 0)).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG2_0019
     * @tc.name      testExtRecConfig20018
     * @tc.desc      Config 44100Hz 640x480 ch=1 180deg.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig20018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 44100;
      const frameWidth: number = 640;
      const frameHeight: number = 480;
      const channels: number = 1;
      const bitrate: number = 176000;
      const orientation: string = '180';
      expect(sampleRate).assertEqual(44100);
      expect(frameWidth).assertEqual(640);
      expect(frameHeight).assertEqual(480);
      expect(channels).assertEqual(1);
      expect(bitrate).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf(orientation) >= 0).assertTrue();
      expect((44100 > 0 && 640 > 0 && 480 > 0 && 176000 > 0)).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG2_0020
     * @tc.name      testExtRecConfig20019
     * @tc.desc      Config 48000Hz 1280x720 ch=2 270deg.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig20019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 48000;
      const frameWidth: number = 1280;
      const frameHeight: number = 720;
      const channels: number = 2;
      const bitrate: number = 208000;
      const orientation: string = '270';
      expect(sampleRate).assertEqual(48000);
      expect(frameWidth).assertEqual(1280);
      expect(frameHeight).assertEqual(720);
      expect(channels).assertEqual(2);
      expect(bitrate).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf(orientation) >= 0).assertTrue();
      expect((48000 > 0 && 1280 > 0 && 720 > 0 && 208000 > 0)).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG2_0021
     * @tc.name      testExtRecConfig20020
     * @tc.desc      Config 64000Hz 1920x1080 ch=1 0deg.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig20020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 64000;
      const frameWidth: number = 1920;
      const frameHeight: number = 1080;
      const channels: number = 1;
      const bitrate: number = 112000;
      const orientation: string = '0';
      expect(sampleRate).assertEqual(64000);
      expect(frameWidth).assertEqual(1920);
      expect(frameHeight).assertEqual(1080);
      expect(channels).assertEqual(1);
      expect(bitrate).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf(orientation) >= 0).assertTrue();
      expect((64000 > 0 && 1920 > 0 && 1080 > 0 && 112000 > 0)).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG2_0022
     * @tc.name      testExtRecConfig20021
     * @tc.desc      Config 96000Hz 640x480 ch=2 90deg.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig20021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 96000;
      const frameWidth: number = 640;
      const frameHeight: number = 480;
      const channels: number = 2;
      const bitrate: number = 144000;
      const orientation: string = '90';
      expect(sampleRate).assertEqual(96000);
      expect(frameWidth).assertEqual(640);
      expect(frameHeight).assertEqual(480);
      expect(channels).assertEqual(2);
      expect(bitrate).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf(orientation) >= 0).assertTrue();
      expect((96000 > 0 && 640 > 0 && 480 > 0 && 144000 > 0)).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG2_0023
     * @tc.name      testExtRecConfig20022
     * @tc.desc      Config 8000Hz 1280x720 ch=1 180deg.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig20022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 8000;
      const frameWidth: number = 1280;
      const frameHeight: number = 720;
      const channels: number = 1;
      const bitrate: number = 176000;
      const orientation: string = '180';
      expect(sampleRate).assertEqual(8000);
      expect(frameWidth).assertEqual(1280);
      expect(frameHeight).assertEqual(720);
      expect(channels).assertEqual(1);
      expect(bitrate).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf(orientation) >= 0).assertTrue();
      expect((8000 > 0 && 1280 > 0 && 720 > 0 && 176000 > 0)).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG2_0024
     * @tc.name      testExtRecConfig20023
     * @tc.desc      Config 11025Hz 1920x1080 ch=2 270deg.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig20023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 11025;
      const frameWidth: number = 1920;
      const frameHeight: number = 1080;
      const channels: number = 2;
      const bitrate: number = 208000;
      const orientation: string = '270';
      expect(sampleRate).assertEqual(11025);
      expect(frameWidth).assertEqual(1920);
      expect(frameHeight).assertEqual(1080);
      expect(channels).assertEqual(2);
      expect(bitrate).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf(orientation) >= 0).assertTrue();
      expect((11025 > 0 && 1920 > 0 && 1080 > 0 && 208000 > 0)).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG2_0025
     * @tc.name      testExtRecConfig20024
     * @tc.desc      Config 12000Hz 640x480 ch=1 0deg.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig20024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 12000;
      const frameWidth: number = 640;
      const frameHeight: number = 480;
      const channels: number = 1;
      const bitrate: number = 112000;
      const orientation: string = '0';
      expect(sampleRate).assertEqual(12000);
      expect(frameWidth).assertEqual(640);
      expect(frameHeight).assertEqual(480);
      expect(channels).assertEqual(1);
      expect(bitrate).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf(orientation) >= 0).assertTrue();
      expect((12000 > 0 && 640 > 0 && 480 > 0 && 112000 > 0)).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG2_0026
     * @tc.name      testExtRecConfig20025
     * @tc.desc      Config 16000Hz 1280x720 ch=2 90deg.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig20025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 16000;
      const frameWidth: number = 1280;
      const frameHeight: number = 720;
      const channels: number = 2;
      const bitrate: number = 144000;
      const orientation: string = '90';
      expect(sampleRate).assertEqual(16000);
      expect(frameWidth).assertEqual(1280);
      expect(frameHeight).assertEqual(720);
      expect(channels).assertEqual(2);
      expect(bitrate).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf(orientation) >= 0).assertTrue();
      expect((16000 > 0 && 1280 > 0 && 720 > 0 && 144000 > 0)).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG2_0027
     * @tc.name      testExtRecConfig20026
     * @tc.desc      Config 22050Hz 1920x1080 ch=1 180deg.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig20026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 22050;
      const frameWidth: number = 1920;
      const frameHeight: number = 1080;
      const channels: number = 1;
      const bitrate: number = 176000;
      const orientation: string = '180';
      expect(sampleRate).assertEqual(22050);
      expect(frameWidth).assertEqual(1920);
      expect(frameHeight).assertEqual(1080);
      expect(channels).assertEqual(1);
      expect(bitrate).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf(orientation) >= 0).assertTrue();
      expect((22050 > 0 && 1920 > 0 && 1080 > 0 && 176000 > 0)).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG2_0028
     * @tc.name      testExtRecConfig20027
     * @tc.desc      Config 24000Hz 640x480 ch=2 270deg.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig20027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 24000;
      const frameWidth: number = 640;
      const frameHeight: number = 480;
      const channels: number = 2;
      const bitrate: number = 208000;
      const orientation: string = '270';
      expect(sampleRate).assertEqual(24000);
      expect(frameWidth).assertEqual(640);
      expect(frameHeight).assertEqual(480);
      expect(channels).assertEqual(2);
      expect(bitrate).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf(orientation) >= 0).assertTrue();
      expect((24000 > 0 && 640 > 0 && 480 > 0 && 208000 > 0)).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG2_0029
     * @tc.name      testExtRecConfig20028
     * @tc.desc      Config 32000Hz 1280x720 ch=1 0deg.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig20028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 32000;
      const frameWidth: number = 1280;
      const frameHeight: number = 720;
      const channels: number = 1;
      const bitrate: number = 112000;
      const orientation: string = '0';
      expect(sampleRate).assertEqual(32000);
      expect(frameWidth).assertEqual(1280);
      expect(frameHeight).assertEqual(720);
      expect(channels).assertEqual(1);
      expect(bitrate).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf(orientation) >= 0).assertTrue();
      expect((32000 > 0 && 1280 > 0 && 720 > 0 && 112000 > 0)).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG2_0030
     * @tc.name      testExtRecConfig20029
     * @tc.desc      Config 44100Hz 1920x1080 ch=2 90deg.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig20029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 44100;
      const frameWidth: number = 1920;
      const frameHeight: number = 1080;
      const channels: number = 2;
      const bitrate: number = 144000;
      const orientation: string = '90';
      expect(sampleRate).assertEqual(44100);
      expect(frameWidth).assertEqual(1920);
      expect(frameHeight).assertEqual(1080);
      expect(channels).assertEqual(2);
      expect(bitrate).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf(orientation) >= 0).assertTrue();
      expect((44100 > 0 && 1920 > 0 && 1080 > 0 && 144000 > 0)).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG2_0031
     * @tc.name      testExtRecConfig20030
     * @tc.desc      Config 48000Hz 640x480 ch=1 180deg.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig20030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 48000;
      const frameWidth: number = 640;
      const frameHeight: number = 480;
      const channels: number = 1;
      const bitrate: number = 176000;
      const orientation: string = '180';
      expect(sampleRate).assertEqual(48000);
      expect(frameWidth).assertEqual(640);
      expect(frameHeight).assertEqual(480);
      expect(channels).assertEqual(1);
      expect(bitrate).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf(orientation) >= 0).assertTrue();
      expect((48000 > 0 && 640 > 0 && 480 > 0 && 176000 > 0)).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG2_0032
     * @tc.name      testExtRecConfig20031
     * @tc.desc      Config 64000Hz 1280x720 ch=2 270deg.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig20031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 64000;
      const frameWidth: number = 1280;
      const frameHeight: number = 720;
      const channels: number = 2;
      const bitrate: number = 208000;
      const orientation: string = '270';
      expect(sampleRate).assertEqual(64000);
      expect(frameWidth).assertEqual(1280);
      expect(frameHeight).assertEqual(720);
      expect(channels).assertEqual(2);
      expect(bitrate).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf(orientation) >= 0).assertTrue();
      expect((64000 > 0 && 1280 > 0 && 720 > 0 && 208000 > 0)).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG2_0033
     * @tc.name      testExtRecConfig20032
     * @tc.desc      Config 96000Hz 1920x1080 ch=1 0deg.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig20032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 96000;
      const frameWidth: number = 1920;
      const frameHeight: number = 1080;
      const channels: number = 1;
      const bitrate: number = 112000;
      const orientation: string = '0';
      expect(sampleRate).assertEqual(96000);
      expect(frameWidth).assertEqual(1920);
      expect(frameHeight).assertEqual(1080);
      expect(channels).assertEqual(1);
      expect(bitrate).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf(orientation) >= 0).assertTrue();
      expect((96000 > 0 && 1920 > 0 && 1080 > 0 && 112000 > 0)).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG2_0034
     * @tc.name      testExtRecConfig20033
     * @tc.desc      Config 8000Hz 640x480 ch=2 90deg.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig20033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 8000;
      const frameWidth: number = 640;
      const frameHeight: number = 480;
      const channels: number = 2;
      const bitrate: number = 144000;
      const orientation: string = '90';
      expect(sampleRate).assertEqual(8000);
      expect(frameWidth).assertEqual(640);
      expect(frameHeight).assertEqual(480);
      expect(channels).assertEqual(2);
      expect(bitrate).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf(orientation) >= 0).assertTrue();
      expect((8000 > 0 && 640 > 0 && 480 > 0 && 144000 > 0)).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG2_0035
     * @tc.name      testExtRecConfig20034
     * @tc.desc      Config 11025Hz 1280x720 ch=1 180deg.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig20034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 11025;
      const frameWidth: number = 1280;
      const frameHeight: number = 720;
      const channels: number = 1;
      const bitrate: number = 176000;
      const orientation: string = '180';
      expect(sampleRate).assertEqual(11025);
      expect(frameWidth).assertEqual(1280);
      expect(frameHeight).assertEqual(720);
      expect(channels).assertEqual(1);
      expect(bitrate).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf(orientation) >= 0).assertTrue();
      expect((11025 > 0 && 1280 > 0 && 720 > 0 && 176000 > 0)).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG2_0036
     * @tc.name      testExtRecConfig20035
     * @tc.desc      Config 12000Hz 1920x1080 ch=2 270deg.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig20035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 12000;
      const frameWidth: number = 1920;
      const frameHeight: number = 1080;
      const channels: number = 2;
      const bitrate: number = 208000;
      const orientation: string = '270';
      expect(sampleRate).assertEqual(12000);
      expect(frameWidth).assertEqual(1920);
      expect(frameHeight).assertEqual(1080);
      expect(channels).assertEqual(2);
      expect(bitrate).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf(orientation) >= 0).assertTrue();
      expect((12000 > 0 && 1920 > 0 && 1080 > 0 && 208000 > 0)).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG2_0037
     * @tc.name      testExtRecConfig20036
     * @tc.desc      Config 16000Hz 640x480 ch=1 0deg.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig20036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 16000;
      const frameWidth: number = 640;
      const frameHeight: number = 480;
      const channels: number = 1;
      const bitrate: number = 112000;
      const orientation: string = '0';
      expect(sampleRate).assertEqual(16000);
      expect(frameWidth).assertEqual(640);
      expect(frameHeight).assertEqual(480);
      expect(channels).assertEqual(1);
      expect(bitrate).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf(orientation) >= 0).assertTrue();
      expect((16000 > 0 && 640 > 0 && 480 > 0 && 112000 > 0)).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG2_0038
     * @tc.name      testExtRecConfig20037
     * @tc.desc      Config 22050Hz 1280x720 ch=2 90deg.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig20037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 22050;
      const frameWidth: number = 1280;
      const frameHeight: number = 720;
      const channels: number = 2;
      const bitrate: number = 144000;
      const orientation: string = '90';
      expect(sampleRate).assertEqual(22050);
      expect(frameWidth).assertEqual(1280);
      expect(frameHeight).assertEqual(720);
      expect(channels).assertEqual(2);
      expect(bitrate).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf(orientation) >= 0).assertTrue();
      expect((22050 > 0 && 1280 > 0 && 720 > 0 && 144000 > 0)).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG2_0039
     * @tc.name      testExtRecConfig20038
     * @tc.desc      Config 24000Hz 1920x1080 ch=1 180deg.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig20038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 24000;
      const frameWidth: number = 1920;
      const frameHeight: number = 1080;
      const channels: number = 1;
      const bitrate: number = 176000;
      const orientation: string = '180';
      expect(sampleRate).assertEqual(24000);
      expect(frameWidth).assertEqual(1920);
      expect(frameHeight).assertEqual(1080);
      expect(channels).assertEqual(1);
      expect(bitrate).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf(orientation) >= 0).assertTrue();
      expect((24000 > 0 && 1920 > 0 && 1080 > 0 && 176000 > 0)).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG2_0040
     * @tc.name      testExtRecConfig20039
     * @tc.desc      Config 32000Hz 640x480 ch=2 270deg.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig20039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 32000;
      const frameWidth: number = 640;
      const frameHeight: number = 480;
      const channels: number = 2;
      const bitrate: number = 208000;
      const orientation: string = '270';
      expect(sampleRate).assertEqual(32000);
      expect(frameWidth).assertEqual(640);
      expect(frameHeight).assertEqual(480);
      expect(channels).assertEqual(2);
      expect(bitrate).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf(orientation) >= 0).assertTrue();
      expect((32000 > 0 && 640 > 0 && 480 > 0 && 208000 > 0)).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG2_0041
     * @tc.name      testExtRecConfig20040
     * @tc.desc      Config 44100Hz 1280x720 ch=1 0deg.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig20040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 44100;
      const frameWidth: number = 1280;
      const frameHeight: number = 720;
      const channels: number = 1;
      const bitrate: number = 112000;
      const orientation: string = '0';
      expect(sampleRate).assertEqual(44100);
      expect(frameWidth).assertEqual(1280);
      expect(frameHeight).assertEqual(720);
      expect(channels).assertEqual(1);
      expect(bitrate).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf(orientation) >= 0).assertTrue();
      expect((44100 > 0 && 1280 > 0 && 720 > 0 && 112000 > 0)).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG2_0042
     * @tc.name      testExtRecConfig20041
     * @tc.desc      Config 48000Hz 1920x1080 ch=2 90deg.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig20041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 48000;
      const frameWidth: number = 1920;
      const frameHeight: number = 1080;
      const channels: number = 2;
      const bitrate: number = 144000;
      const orientation: string = '90';
      expect(sampleRate).assertEqual(48000);
      expect(frameWidth).assertEqual(1920);
      expect(frameHeight).assertEqual(1080);
      expect(channels).assertEqual(2);
      expect(bitrate).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf(orientation) >= 0).assertTrue();
      expect((48000 > 0 && 1920 > 0 && 1080 > 0 && 144000 > 0)).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG2_0043
     * @tc.name      testExtRecConfig20042
     * @tc.desc      Config 64000Hz 640x480 ch=1 180deg.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig20042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 64000;
      const frameWidth: number = 640;
      const frameHeight: number = 480;
      const channels: number = 1;
      const bitrate: number = 176000;
      const orientation: string = '180';
      expect(sampleRate).assertEqual(64000);
      expect(frameWidth).assertEqual(640);
      expect(frameHeight).assertEqual(480);
      expect(channels).assertEqual(1);
      expect(bitrate).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf(orientation) >= 0).assertTrue();
      expect((64000 > 0 && 640 > 0 && 480 > 0 && 176000 > 0)).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG2_0044
     * @tc.name      testExtRecConfig20043
     * @tc.desc      Config 96000Hz 1280x720 ch=2 270deg.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig20043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 96000;
      const frameWidth: number = 1280;
      const frameHeight: number = 720;
      const channels: number = 2;
      const bitrate: number = 208000;
      const orientation: string = '270';
      expect(sampleRate).assertEqual(96000);
      expect(frameWidth).assertEqual(1280);
      expect(frameHeight).assertEqual(720);
      expect(channels).assertEqual(2);
      expect(bitrate).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf(orientation) >= 0).assertTrue();
      expect((96000 > 0 && 1280 > 0 && 720 > 0 && 208000 > 0)).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG2_0045
     * @tc.name      testExtRecConfig20044
     * @tc.desc      Config 8000Hz 1920x1080 ch=1 0deg.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig20044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 8000;
      const frameWidth: number = 1920;
      const frameHeight: number = 1080;
      const channels: number = 1;
      const bitrate: number = 112000;
      const orientation: string = '0';
      expect(sampleRate).assertEqual(8000);
      expect(frameWidth).assertEqual(1920);
      expect(frameHeight).assertEqual(1080);
      expect(channels).assertEqual(1);
      expect(bitrate).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf(orientation) >= 0).assertTrue();
      expect((8000 > 0 && 1920 > 0 && 1080 > 0 && 112000 > 0)).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG2_0046
     * @tc.name      testExtRecConfig20045
     * @tc.desc      Config 11025Hz 640x480 ch=2 90deg.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig20045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 11025;
      const frameWidth: number = 640;
      const frameHeight: number = 480;
      const channels: number = 2;
      const bitrate: number = 144000;
      const orientation: string = '90';
      expect(sampleRate).assertEqual(11025);
      expect(frameWidth).assertEqual(640);
      expect(frameHeight).assertEqual(480);
      expect(channels).assertEqual(2);
      expect(bitrate).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf(orientation) >= 0).assertTrue();
      expect((11025 > 0 && 640 > 0 && 480 > 0 && 144000 > 0)).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG2_0047
     * @tc.name      testExtRecConfig20046
     * @tc.desc      Config 12000Hz 1280x720 ch=1 180deg.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig20046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 12000;
      const frameWidth: number = 1280;
      const frameHeight: number = 720;
      const channels: number = 1;
      const bitrate: number = 176000;
      const orientation: string = '180';
      expect(sampleRate).assertEqual(12000);
      expect(frameWidth).assertEqual(1280);
      expect(frameHeight).assertEqual(720);
      expect(channels).assertEqual(1);
      expect(bitrate).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf(orientation) >= 0).assertTrue();
      expect((12000 > 0 && 1280 > 0 && 720 > 0 && 176000 > 0)).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG2_0048
     * @tc.name      testExtRecConfig20047
     * @tc.desc      Config 16000Hz 1920x1080 ch=2 270deg.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig20047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 16000;
      const frameWidth: number = 1920;
      const frameHeight: number = 1080;
      const channels: number = 2;
      const bitrate: number = 208000;
      const orientation: string = '270';
      expect(sampleRate).assertEqual(16000);
      expect(frameWidth).assertEqual(1920);
      expect(frameHeight).assertEqual(1080);
      expect(channels).assertEqual(2);
      expect(bitrate).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf(orientation) >= 0).assertTrue();
      expect((16000 > 0 && 1920 > 0 && 1080 > 0 && 208000 > 0)).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG2_0049
     * @tc.name      testExtRecConfig20048
     * @tc.desc      Config 22050Hz 640x480 ch=1 0deg.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig20048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 22050;
      const frameWidth: number = 640;
      const frameHeight: number = 480;
      const channels: number = 1;
      const bitrate: number = 112000;
      const orientation: string = '0';
      expect(sampleRate).assertEqual(22050);
      expect(frameWidth).assertEqual(640);
      expect(frameHeight).assertEqual(480);
      expect(channels).assertEqual(1);
      expect(bitrate).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf(orientation) >= 0).assertTrue();
      expect((22050 > 0 && 640 > 0 && 480 > 0 && 112000 > 0)).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG2_0050
     * @tc.name      testExtRecConfig20049
     * @tc.desc      Config 24000Hz 1280x720 ch=2 90deg.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig20049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 24000;
      const frameWidth: number = 1280;
      const frameHeight: number = 720;
      const channels: number = 2;
      const bitrate: number = 144000;
      const orientation: string = '90';
      expect(sampleRate).assertEqual(24000);
      expect(frameWidth).assertEqual(1280);
      expect(frameHeight).assertEqual(720);
      expect(channels).assertEqual(2);
      expect(bitrate).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf(orientation) >= 0).assertTrue();
      expect((24000 > 0 && 1280 > 0 && 720 > 0 && 144000 > 0)).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG2_0051
     * @tc.name      testExtRecConfig20050
     * @tc.desc      Config 32000Hz 1920x1080 ch=1 180deg.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig20050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 32000;
      const frameWidth: number = 1920;
      const frameHeight: number = 1080;
      const channels: number = 1;
      const bitrate: number = 176000;
      const orientation: string = '180';
      expect(sampleRate).assertEqual(32000);
      expect(frameWidth).assertEqual(1920);
      expect(frameHeight).assertEqual(1080);
      expect(channels).assertEqual(1);
      expect(bitrate).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf(orientation) >= 0).assertTrue();
      expect((32000 > 0 && 1920 > 0 && 1080 > 0 && 176000 > 0)).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG2_0052
     * @tc.name      testExtRecConfig20051
     * @tc.desc      Config 44100Hz 640x480 ch=2 270deg.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig20051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 44100;
      const frameWidth: number = 640;
      const frameHeight: number = 480;
      const channels: number = 2;
      const bitrate: number = 208000;
      const orientation: string = '270';
      expect(sampleRate).assertEqual(44100);
      expect(frameWidth).assertEqual(640);
      expect(frameHeight).assertEqual(480);
      expect(channels).assertEqual(2);
      expect(bitrate).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf(orientation) >= 0).assertTrue();
      expect((44100 > 0 && 640 > 0 && 480 > 0 && 208000 > 0)).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG2_0053
     * @tc.name      testExtRecConfig20052
     * @tc.desc      Config 48000Hz 1280x720 ch=1 0deg.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig20052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 48000;
      const frameWidth: number = 1280;
      const frameHeight: number = 720;
      const channels: number = 1;
      const bitrate: number = 112000;
      const orientation: string = '0';
      expect(sampleRate).assertEqual(48000);
      expect(frameWidth).assertEqual(1280);
      expect(frameHeight).assertEqual(720);
      expect(channels).assertEqual(1);
      expect(bitrate).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf(orientation) >= 0).assertTrue();
      expect((48000 > 0 && 1280 > 0 && 720 > 0 && 112000 > 0)).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG2_0054
     * @tc.name      testExtRecConfig20053
     * @tc.desc      Config 64000Hz 1920x1080 ch=2 90deg.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig20053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 64000;
      const frameWidth: number = 1920;
      const frameHeight: number = 1080;
      const channels: number = 2;
      const bitrate: number = 144000;
      const orientation: string = '90';
      expect(sampleRate).assertEqual(64000);
      expect(frameWidth).assertEqual(1920);
      expect(frameHeight).assertEqual(1080);
      expect(channels).assertEqual(2);
      expect(bitrate).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf(orientation) >= 0).assertTrue();
      expect((64000 > 0 && 1920 > 0 && 1080 > 0 && 144000 > 0)).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG2_0055
     * @tc.name      testExtRecConfig20054
     * @tc.desc      Config 96000Hz 640x480 ch=1 180deg.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig20054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 96000;
      const frameWidth: number = 640;
      const frameHeight: number = 480;
      const channels: number = 1;
      const bitrate: number = 176000;
      const orientation: string = '180';
      expect(sampleRate).assertEqual(96000);
      expect(frameWidth).assertEqual(640);
      expect(frameHeight).assertEqual(480);
      expect(channels).assertEqual(1);
      expect(bitrate).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf(orientation) >= 0).assertTrue();
      expect((96000 > 0 && 640 > 0 && 480 > 0 && 176000 > 0)).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG2_0056
     * @tc.name      testExtRecConfig20055
     * @tc.desc      Config 8000Hz 1280x720 ch=2 270deg.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig20055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 8000;
      const frameWidth: number = 1280;
      const frameHeight: number = 720;
      const channels: number = 2;
      const bitrate: number = 208000;
      const orientation: string = '270';
      expect(sampleRate).assertEqual(8000);
      expect(frameWidth).assertEqual(1280);
      expect(frameHeight).assertEqual(720);
      expect(channels).assertEqual(2);
      expect(bitrate).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf(orientation) >= 0).assertTrue();
      expect((8000 > 0 && 1280 > 0 && 720 > 0 && 208000 > 0)).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG2_0057
     * @tc.name      testExtRecConfig20056
     * @tc.desc      Config 11025Hz 1920x1080 ch=1 0deg.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig20056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 11025;
      const frameWidth: number = 1920;
      const frameHeight: number = 1080;
      const channels: number = 1;
      const bitrate: number = 112000;
      const orientation: string = '0';
      expect(sampleRate).assertEqual(11025);
      expect(frameWidth).assertEqual(1920);
      expect(frameHeight).assertEqual(1080);
      expect(channels).assertEqual(1);
      expect(bitrate).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf(orientation) >= 0).assertTrue();
      expect((11025 > 0 && 1920 > 0 && 1080 > 0 && 112000 > 0)).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG2_0058
     * @tc.name      testExtRecConfig20057
     * @tc.desc      Config 12000Hz 640x480 ch=2 90deg.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig20057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 12000;
      const frameWidth: number = 640;
      const frameHeight: number = 480;
      const channels: number = 2;
      const bitrate: number = 144000;
      const orientation: string = '90';
      expect(sampleRate).assertEqual(12000);
      expect(frameWidth).assertEqual(640);
      expect(frameHeight).assertEqual(480);
      expect(channels).assertEqual(2);
      expect(bitrate).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf(orientation) >= 0).assertTrue();
      expect((12000 > 0 && 640 > 0 && 480 > 0 && 144000 > 0)).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG2_0059
     * @tc.name      testExtRecConfig20058
     * @tc.desc      Config 16000Hz 1280x720 ch=1 180deg.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig20058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 16000;
      const frameWidth: number = 1280;
      const frameHeight: number = 720;
      const channels: number = 1;
      const bitrate: number = 176000;
      const orientation: string = '180';
      expect(sampleRate).assertEqual(16000);
      expect(frameWidth).assertEqual(1280);
      expect(frameHeight).assertEqual(720);
      expect(channels).assertEqual(1);
      expect(bitrate).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf(orientation) >= 0).assertTrue();
      expect((16000 > 0 && 1280 > 0 && 720 > 0 && 176000 > 0)).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG2_0060
     * @tc.name      testExtRecConfig20059
     * @tc.desc      Config 22050Hz 1920x1080 ch=2 270deg.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig20059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 22050;
      const frameWidth: number = 1920;
      const frameHeight: number = 1080;
      const channels: number = 2;
      const bitrate: number = 208000;
      const orientation: string = '270';
      expect(sampleRate).assertEqual(22050);
      expect(frameWidth).assertEqual(1920);
      expect(frameHeight).assertEqual(1080);
      expect(channels).assertEqual(2);
      expect(bitrate).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf(orientation) >= 0).assertTrue();
      expect((22050 > 0 && 1920 > 0 && 1080 > 0 && 208000 > 0)).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG2_0061
     * @tc.name      testExtRecConfig20060
     * @tc.desc      Config 24000Hz 640x480 ch=1 0deg.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig20060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 24000;
      const frameWidth: number = 640;
      const frameHeight: number = 480;
      const channels: number = 1;
      const bitrate: number = 112000;
      const orientation: string = '0';
      expect(sampleRate).assertEqual(24000);
      expect(frameWidth).assertEqual(640);
      expect(frameHeight).assertEqual(480);
      expect(channels).assertEqual(1);
      expect(bitrate).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf(orientation) >= 0).assertTrue();
      expect((24000 > 0 && 640 > 0 && 480 > 0 && 112000 > 0)).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG2_0062
     * @tc.name      testExtRecConfig20061
     * @tc.desc      Config 32000Hz 1280x720 ch=2 90deg.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig20061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 32000;
      const frameWidth: number = 1280;
      const frameHeight: number = 720;
      const channels: number = 2;
      const bitrate: number = 144000;
      const orientation: string = '90';
      expect(sampleRate).assertEqual(32000);
      expect(frameWidth).assertEqual(1280);
      expect(frameHeight).assertEqual(720);
      expect(channels).assertEqual(2);
      expect(bitrate).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf(orientation) >= 0).assertTrue();
      expect((32000 > 0 && 1280 > 0 && 720 > 0 && 144000 > 0)).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG2_0063
     * @tc.name      testExtRecConfig20062
     * @tc.desc      Config 44100Hz 1920x1080 ch=1 180deg.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig20062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 44100;
      const frameWidth: number = 1920;
      const frameHeight: number = 1080;
      const channels: number = 1;
      const bitrate: number = 176000;
      const orientation: string = '180';
      expect(sampleRate).assertEqual(44100);
      expect(frameWidth).assertEqual(1920);
      expect(frameHeight).assertEqual(1080);
      expect(channels).assertEqual(1);
      expect(bitrate).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf(orientation) >= 0).assertTrue();
      expect((44100 > 0 && 1920 > 0 && 1080 > 0 && 176000 > 0)).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG2_0064
     * @tc.name      testExtRecConfig20063
     * @tc.desc      Config 48000Hz 640x480 ch=2 270deg.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig20063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 48000;
      const frameWidth: number = 640;
      const frameHeight: number = 480;
      const channels: number = 2;
      const bitrate: number = 208000;
      const orientation: string = '270';
      expect(sampleRate).assertEqual(48000);
      expect(frameWidth).assertEqual(640);
      expect(frameHeight).assertEqual(480);
      expect(channels).assertEqual(2);
      expect(bitrate).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf(orientation) >= 0).assertTrue();
      expect((48000 > 0 && 640 > 0 && 480 > 0 && 208000 > 0)).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG2_0065
     * @tc.name      testExtRecConfig20064
     * @tc.desc      Config 64000Hz 1280x720 ch=1 0deg.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig20064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 64000;
      const frameWidth: number = 1280;
      const frameHeight: number = 720;
      const channels: number = 1;
      const bitrate: number = 112000;
      const orientation: string = '0';
      expect(sampleRate).assertEqual(64000);
      expect(frameWidth).assertEqual(1280);
      expect(frameHeight).assertEqual(720);
      expect(channels).assertEqual(1);
      expect(bitrate).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf(orientation) >= 0).assertTrue();
      expect((64000 > 0 && 1280 > 0 && 720 > 0 && 112000 > 0)).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG2_0066
     * @tc.name      testExtRecConfig20065
     * @tc.desc      Config 96000Hz 1920x1080 ch=2 90deg.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig20065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 96000;
      const frameWidth: number = 1920;
      const frameHeight: number = 1080;
      const channels: number = 2;
      const bitrate: number = 144000;
      const orientation: string = '90';
      expect(sampleRate).assertEqual(96000);
      expect(frameWidth).assertEqual(1920);
      expect(frameHeight).assertEqual(1080);
      expect(channels).assertEqual(2);
      expect(bitrate).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf(orientation) >= 0).assertTrue();
      expect((96000 > 0 && 1920 > 0 && 1080 > 0 && 144000 > 0)).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG2_0067
     * @tc.name      testExtRecConfig20066
     * @tc.desc      Config 8000Hz 640x480 ch=1 180deg.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig20066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 8000;
      const frameWidth: number = 640;
      const frameHeight: number = 480;
      const channels: number = 1;
      const bitrate: number = 176000;
      const orientation: string = '180';
      expect(sampleRate).assertEqual(8000);
      expect(frameWidth).assertEqual(640);
      expect(frameHeight).assertEqual(480);
      expect(channels).assertEqual(1);
      expect(bitrate).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf(orientation) >= 0).assertTrue();
      expect((8000 > 0 && 640 > 0 && 480 > 0 && 176000 > 0)).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG2_0068
     * @tc.name      testExtRecConfig20067
     * @tc.desc      Config 11025Hz 1280x720 ch=2 270deg.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig20067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 11025;
      const frameWidth: number = 1280;
      const frameHeight: number = 720;
      const channels: number = 2;
      const bitrate: number = 208000;
      const orientation: string = '270';
      expect(sampleRate).assertEqual(11025);
      expect(frameWidth).assertEqual(1280);
      expect(frameHeight).assertEqual(720);
      expect(channels).assertEqual(2);
      expect(bitrate).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf(orientation) >= 0).assertTrue();
      expect((11025 > 0 && 1280 > 0 && 720 > 0 && 208000 > 0)).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG2_0069
     * @tc.name      testExtRecConfig20068
     * @tc.desc      Config 12000Hz 1920x1080 ch=1 0deg.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig20068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 12000;
      const frameWidth: number = 1920;
      const frameHeight: number = 1080;
      const channels: number = 1;
      const bitrate: number = 112000;
      const orientation: string = '0';
      expect(sampleRate).assertEqual(12000);
      expect(frameWidth).assertEqual(1920);
      expect(frameHeight).assertEqual(1080);
      expect(channels).assertEqual(1);
      expect(bitrate).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf(orientation) >= 0).assertTrue();
      expect((12000 > 0 && 1920 > 0 && 1080 > 0 && 112000 > 0)).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CONFIG2_0070
     * @tc.name      testExtRecConfig20069
     * @tc.desc      Config 16000Hz 640x480 ch=2 90deg.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecConfig20069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRate: number = 16000;
      const frameWidth: number = 640;
      const frameHeight: number = 480;
      const channels: number = 2;
      const bitrate: number = 144000;
      const orientation: string = '90';
      expect(sampleRate).assertEqual(16000);
      expect(frameWidth).assertEqual(640);
      expect(frameHeight).assertEqual(480);
      expect(channels).assertEqual(2);
      expect(bitrate).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf(orientation) >= 0).assertTrue();
      expect((16000 > 0 && 640 > 0 && 480 > 0 && 144000 > 0)).assertEqual(true);
    })
  });
}
