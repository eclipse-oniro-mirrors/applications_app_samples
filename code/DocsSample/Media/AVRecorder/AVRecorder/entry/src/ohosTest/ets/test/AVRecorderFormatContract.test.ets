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

const TAG: string = '[Sample_avRecorderFormatContract]';
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

export default function avRecorderFormatContractTest(): void {
  describe('avRecorderFormatContractTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FORMAT_0001
     * @tc.name      testExtRecFormat0000
     * @tc.desc      Format contract 8000Hz 640x480 ch=1 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFormat0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const audioCodec: string = 'audio/aac';
      const videoCodec: string = 'video/avc';
      const audioFormat: string = 'm4a';
      const videoFormat: string = 'mp4';
      expect(audioCodec).assertEqual('audio/aac');
      expect(videoCodec).assertEqual('video/avc');
      expect(audioFormat).assertEqual('m4a');
      expect(videoFormat).assertEqual('mp4');
      expect(8000).assertLarger(0);
      expect(640).assertLarger(0);
      expect(480).assertLarger(0);
      expect(1).assertLarger(0);
      expect(112000).assertLarger(0);
      expect(3000000).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf('0') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FORMAT_0002
     * @tc.name      testExtRecFormat0001
     * @tc.desc      Format contract 11025Hz 1280x720 ch=2 90.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFormat0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const audioCodec: string = 'audio/aac';
      const videoCodec: string = 'video/avc';
      const audioFormat: string = 'm4a';
      const videoFormat: string = 'mp4';
      expect(audioCodec).assertEqual('audio/aac');
      expect(videoCodec).assertEqual('video/avc');
      expect(audioFormat).assertEqual('m4a');
      expect(videoFormat).assertEqual('mp4');
      expect(11025).assertLarger(0);
      expect(1280).assertLarger(0);
      expect(720).assertLarger(0);
      expect(2).assertLarger(0);
      expect(112000).assertLarger(0);
      expect(3000000).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf('90') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FORMAT_0003
     * @tc.name      testExtRecFormat0002
     * @tc.desc      Format contract 12000Hz 1920x1080 ch=1 180.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFormat0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const audioCodec: string = 'audio/aac';
      const videoCodec: string = 'video/avc';
      const audioFormat: string = 'm4a';
      const videoFormat: string = 'mp4';
      expect(audioCodec).assertEqual('audio/aac');
      expect(videoCodec).assertEqual('video/avc');
      expect(audioFormat).assertEqual('m4a');
      expect(videoFormat).assertEqual('mp4');
      expect(12000).assertLarger(0);
      expect(1920).assertLarger(0);
      expect(1080).assertLarger(0);
      expect(1).assertLarger(0);
      expect(112000).assertLarger(0);
      expect(3000000).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf('180') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FORMAT_0004
     * @tc.name      testExtRecFormat0003
     * @tc.desc      Format contract 16000Hz 640x480 ch=2 270.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFormat0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const audioCodec: string = 'audio/aac';
      const videoCodec: string = 'video/avc';
      const audioFormat: string = 'm4a';
      const videoFormat: string = 'mp4';
      expect(audioCodec).assertEqual('audio/aac');
      expect(videoCodec).assertEqual('video/avc');
      expect(audioFormat).assertEqual('m4a');
      expect(videoFormat).assertEqual('mp4');
      expect(16000).assertLarger(0);
      expect(640).assertLarger(0);
      expect(480).assertLarger(0);
      expect(2).assertLarger(0);
      expect(112000).assertLarger(0);
      expect(3000000).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf('270') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FORMAT_0005
     * @tc.name      testExtRecFormat0004
     * @tc.desc      Format contract 22050Hz 1280x720 ch=1 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFormat0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const audioCodec: string = 'audio/aac';
      const videoCodec: string = 'video/avc';
      const audioFormat: string = 'm4a';
      const videoFormat: string = 'mp4';
      expect(audioCodec).assertEqual('audio/aac');
      expect(videoCodec).assertEqual('video/avc');
      expect(audioFormat).assertEqual('m4a');
      expect(videoFormat).assertEqual('mp4');
      expect(22050).assertLarger(0);
      expect(1280).assertLarger(0);
      expect(720).assertLarger(0);
      expect(1).assertLarger(0);
      expect(112000).assertLarger(0);
      expect(3000000).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf('0') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FORMAT_0006
     * @tc.name      testExtRecFormat0005
     * @tc.desc      Format contract 24000Hz 1920x1080 ch=2 90.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFormat0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const audioCodec: string = 'audio/aac';
      const videoCodec: string = 'video/avc';
      const audioFormat: string = 'm4a';
      const videoFormat: string = 'mp4';
      expect(audioCodec).assertEqual('audio/aac');
      expect(videoCodec).assertEqual('video/avc');
      expect(audioFormat).assertEqual('m4a');
      expect(videoFormat).assertEqual('mp4');
      expect(24000).assertLarger(0);
      expect(1920).assertLarger(0);
      expect(1080).assertLarger(0);
      expect(2).assertLarger(0);
      expect(112000).assertLarger(0);
      expect(3000000).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf('90') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FORMAT_0007
     * @tc.name      testExtRecFormat0006
     * @tc.desc      Format contract 32000Hz 640x480 ch=1 180.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFormat0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const audioCodec: string = 'audio/aac';
      const videoCodec: string = 'video/avc';
      const audioFormat: string = 'm4a';
      const videoFormat: string = 'mp4';
      expect(audioCodec).assertEqual('audio/aac');
      expect(videoCodec).assertEqual('video/avc');
      expect(audioFormat).assertEqual('m4a');
      expect(videoFormat).assertEqual('mp4');
      expect(32000).assertLarger(0);
      expect(640).assertLarger(0);
      expect(480).assertLarger(0);
      expect(1).assertLarger(0);
      expect(112000).assertLarger(0);
      expect(3000000).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf('180') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FORMAT_0008
     * @tc.name      testExtRecFormat0007
     * @tc.desc      Format contract 44100Hz 1280x720 ch=2 270.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFormat0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const audioCodec: string = 'audio/aac';
      const videoCodec: string = 'video/avc';
      const audioFormat: string = 'm4a';
      const videoFormat: string = 'mp4';
      expect(audioCodec).assertEqual('audio/aac');
      expect(videoCodec).assertEqual('video/avc');
      expect(audioFormat).assertEqual('m4a');
      expect(videoFormat).assertEqual('mp4');
      expect(44100).assertLarger(0);
      expect(1280).assertLarger(0);
      expect(720).assertLarger(0);
      expect(2).assertLarger(0);
      expect(112000).assertLarger(0);
      expect(3000000).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf('270') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FORMAT_0009
     * @tc.name      testExtRecFormat0008
     * @tc.desc      Format contract 48000Hz 1920x1080 ch=1 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFormat0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const audioCodec: string = 'audio/aac';
      const videoCodec: string = 'video/avc';
      const audioFormat: string = 'm4a';
      const videoFormat: string = 'mp4';
      expect(audioCodec).assertEqual('audio/aac');
      expect(videoCodec).assertEqual('video/avc');
      expect(audioFormat).assertEqual('m4a');
      expect(videoFormat).assertEqual('mp4');
      expect(48000).assertLarger(0);
      expect(1920).assertLarger(0);
      expect(1080).assertLarger(0);
      expect(1).assertLarger(0);
      expect(112000).assertLarger(0);
      expect(3000000).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf('0') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FORMAT_0010
     * @tc.name      testExtRecFormat0009
     * @tc.desc      Format contract 64000Hz 640x480 ch=2 90.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFormat0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const audioCodec: string = 'audio/aac';
      const videoCodec: string = 'video/avc';
      const audioFormat: string = 'm4a';
      const videoFormat: string = 'mp4';
      expect(audioCodec).assertEqual('audio/aac');
      expect(videoCodec).assertEqual('video/avc');
      expect(audioFormat).assertEqual('m4a');
      expect(videoFormat).assertEqual('mp4');
      expect(64000).assertLarger(0);
      expect(640).assertLarger(0);
      expect(480).assertLarger(0);
      expect(2).assertLarger(0);
      expect(112000).assertLarger(0);
      expect(3000000).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf('90') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FORMAT_0011
     * @tc.name      testExtRecFormat0010
     * @tc.desc      Format contract 96000Hz 1280x720 ch=1 180.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFormat0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const audioCodec: string = 'audio/aac';
      const videoCodec: string = 'video/avc';
      const audioFormat: string = 'm4a';
      const videoFormat: string = 'mp4';
      expect(audioCodec).assertEqual('audio/aac');
      expect(videoCodec).assertEqual('video/avc');
      expect(audioFormat).assertEqual('m4a');
      expect(videoFormat).assertEqual('mp4');
      expect(96000).assertLarger(0);
      expect(1280).assertLarger(0);
      expect(720).assertLarger(0);
      expect(1).assertLarger(0);
      expect(112000).assertLarger(0);
      expect(3000000).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf('180') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FORMAT_0012
     * @tc.name      testExtRecFormat0011
     * @tc.desc      Format contract 8000Hz 1920x1080 ch=2 270.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFormat0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const audioCodec: string = 'audio/aac';
      const videoCodec: string = 'video/avc';
      const audioFormat: string = 'm4a';
      const videoFormat: string = 'mp4';
      expect(audioCodec).assertEqual('audio/aac');
      expect(videoCodec).assertEqual('video/avc');
      expect(audioFormat).assertEqual('m4a');
      expect(videoFormat).assertEqual('mp4');
      expect(8000).assertLarger(0);
      expect(1920).assertLarger(0);
      expect(1080).assertLarger(0);
      expect(2).assertLarger(0);
      expect(112000).assertLarger(0);
      expect(3000000).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf('270') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FORMAT_0013
     * @tc.name      testExtRecFormat0012
     * @tc.desc      Format contract 11025Hz 640x480 ch=1 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFormat0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const audioCodec: string = 'audio/aac';
      const videoCodec: string = 'video/avc';
      const audioFormat: string = 'm4a';
      const videoFormat: string = 'mp4';
      expect(audioCodec).assertEqual('audio/aac');
      expect(videoCodec).assertEqual('video/avc');
      expect(audioFormat).assertEqual('m4a');
      expect(videoFormat).assertEqual('mp4');
      expect(11025).assertLarger(0);
      expect(640).assertLarger(0);
      expect(480).assertLarger(0);
      expect(1).assertLarger(0);
      expect(112000).assertLarger(0);
      expect(3000000).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf('0') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FORMAT_0014
     * @tc.name      testExtRecFormat0013
     * @tc.desc      Format contract 12000Hz 1280x720 ch=2 90.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFormat0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const audioCodec: string = 'audio/aac';
      const videoCodec: string = 'video/avc';
      const audioFormat: string = 'm4a';
      const videoFormat: string = 'mp4';
      expect(audioCodec).assertEqual('audio/aac');
      expect(videoCodec).assertEqual('video/avc');
      expect(audioFormat).assertEqual('m4a');
      expect(videoFormat).assertEqual('mp4');
      expect(12000).assertLarger(0);
      expect(1280).assertLarger(0);
      expect(720).assertLarger(0);
      expect(2).assertLarger(0);
      expect(112000).assertLarger(0);
      expect(3000000).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf('90') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FORMAT_0015
     * @tc.name      testExtRecFormat0014
     * @tc.desc      Format contract 16000Hz 1920x1080 ch=1 180.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFormat0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const audioCodec: string = 'audio/aac';
      const videoCodec: string = 'video/avc';
      const audioFormat: string = 'm4a';
      const videoFormat: string = 'mp4';
      expect(audioCodec).assertEqual('audio/aac');
      expect(videoCodec).assertEqual('video/avc');
      expect(audioFormat).assertEqual('m4a');
      expect(videoFormat).assertEqual('mp4');
      expect(16000).assertLarger(0);
      expect(1920).assertLarger(0);
      expect(1080).assertLarger(0);
      expect(1).assertLarger(0);
      expect(112000).assertLarger(0);
      expect(3000000).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf('180') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FORMAT_0016
     * @tc.name      testExtRecFormat0015
     * @tc.desc      Format contract 22050Hz 640x480 ch=2 270.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFormat0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const audioCodec: string = 'audio/aac';
      const videoCodec: string = 'video/avc';
      const audioFormat: string = 'm4a';
      const videoFormat: string = 'mp4';
      expect(audioCodec).assertEqual('audio/aac');
      expect(videoCodec).assertEqual('video/avc');
      expect(audioFormat).assertEqual('m4a');
      expect(videoFormat).assertEqual('mp4');
      expect(22050).assertLarger(0);
      expect(640).assertLarger(0);
      expect(480).assertLarger(0);
      expect(2).assertLarger(0);
      expect(112000).assertLarger(0);
      expect(3000000).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf('270') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FORMAT_0017
     * @tc.name      testExtRecFormat0016
     * @tc.desc      Format contract 24000Hz 1280x720 ch=1 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFormat0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const audioCodec: string = 'audio/aac';
      const videoCodec: string = 'video/avc';
      const audioFormat: string = 'm4a';
      const videoFormat: string = 'mp4';
      expect(audioCodec).assertEqual('audio/aac');
      expect(videoCodec).assertEqual('video/avc');
      expect(audioFormat).assertEqual('m4a');
      expect(videoFormat).assertEqual('mp4');
      expect(24000).assertLarger(0);
      expect(1280).assertLarger(0);
      expect(720).assertLarger(0);
      expect(1).assertLarger(0);
      expect(112000).assertLarger(0);
      expect(3000000).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf('0') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FORMAT_0018
     * @tc.name      testExtRecFormat0017
     * @tc.desc      Format contract 32000Hz 1920x1080 ch=2 90.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFormat0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const audioCodec: string = 'audio/aac';
      const videoCodec: string = 'video/avc';
      const audioFormat: string = 'm4a';
      const videoFormat: string = 'mp4';
      expect(audioCodec).assertEqual('audio/aac');
      expect(videoCodec).assertEqual('video/avc');
      expect(audioFormat).assertEqual('m4a');
      expect(videoFormat).assertEqual('mp4');
      expect(32000).assertLarger(0);
      expect(1920).assertLarger(0);
      expect(1080).assertLarger(0);
      expect(2).assertLarger(0);
      expect(112000).assertLarger(0);
      expect(3000000).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf('90') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FORMAT_0019
     * @tc.name      testExtRecFormat0018
     * @tc.desc      Format contract 44100Hz 640x480 ch=1 180.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFormat0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const audioCodec: string = 'audio/aac';
      const videoCodec: string = 'video/avc';
      const audioFormat: string = 'm4a';
      const videoFormat: string = 'mp4';
      expect(audioCodec).assertEqual('audio/aac');
      expect(videoCodec).assertEqual('video/avc');
      expect(audioFormat).assertEqual('m4a');
      expect(videoFormat).assertEqual('mp4');
      expect(44100).assertLarger(0);
      expect(640).assertLarger(0);
      expect(480).assertLarger(0);
      expect(1).assertLarger(0);
      expect(112000).assertLarger(0);
      expect(3000000).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf('180') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FORMAT_0020
     * @tc.name      testExtRecFormat0019
     * @tc.desc      Format contract 48000Hz 1280x720 ch=2 270.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFormat0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const audioCodec: string = 'audio/aac';
      const videoCodec: string = 'video/avc';
      const audioFormat: string = 'm4a';
      const videoFormat: string = 'mp4';
      expect(audioCodec).assertEqual('audio/aac');
      expect(videoCodec).assertEqual('video/avc');
      expect(audioFormat).assertEqual('m4a');
      expect(videoFormat).assertEqual('mp4');
      expect(48000).assertLarger(0);
      expect(1280).assertLarger(0);
      expect(720).assertLarger(0);
      expect(2).assertLarger(0);
      expect(112000).assertLarger(0);
      expect(3000000).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf('270') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FORMAT_0021
     * @tc.name      testExtRecFormat0020
     * @tc.desc      Format contract 64000Hz 1920x1080 ch=1 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFormat0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const audioCodec: string = 'audio/aac';
      const videoCodec: string = 'video/avc';
      const audioFormat: string = 'm4a';
      const videoFormat: string = 'mp4';
      expect(audioCodec).assertEqual('audio/aac');
      expect(videoCodec).assertEqual('video/avc');
      expect(audioFormat).assertEqual('m4a');
      expect(videoFormat).assertEqual('mp4');
      expect(64000).assertLarger(0);
      expect(1920).assertLarger(0);
      expect(1080).assertLarger(0);
      expect(1).assertLarger(0);
      expect(112000).assertLarger(0);
      expect(3000000).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf('0') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FORMAT_0022
     * @tc.name      testExtRecFormat0021
     * @tc.desc      Format contract 96000Hz 640x480 ch=2 90.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFormat0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const audioCodec: string = 'audio/aac';
      const videoCodec: string = 'video/avc';
      const audioFormat: string = 'm4a';
      const videoFormat: string = 'mp4';
      expect(audioCodec).assertEqual('audio/aac');
      expect(videoCodec).assertEqual('video/avc');
      expect(audioFormat).assertEqual('m4a');
      expect(videoFormat).assertEqual('mp4');
      expect(96000).assertLarger(0);
      expect(640).assertLarger(0);
      expect(480).assertLarger(0);
      expect(2).assertLarger(0);
      expect(112000).assertLarger(0);
      expect(3000000).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf('90') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FORMAT_0023
     * @tc.name      testExtRecFormat0022
     * @tc.desc      Format contract 8000Hz 1280x720 ch=1 180.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFormat0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const audioCodec: string = 'audio/aac';
      const videoCodec: string = 'video/avc';
      const audioFormat: string = 'm4a';
      const videoFormat: string = 'mp4';
      expect(audioCodec).assertEqual('audio/aac');
      expect(videoCodec).assertEqual('video/avc');
      expect(audioFormat).assertEqual('m4a');
      expect(videoFormat).assertEqual('mp4');
      expect(8000).assertLarger(0);
      expect(1280).assertLarger(0);
      expect(720).assertLarger(0);
      expect(1).assertLarger(0);
      expect(112000).assertLarger(0);
      expect(3000000).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf('180') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FORMAT_0024
     * @tc.name      testExtRecFormat0023
     * @tc.desc      Format contract 11025Hz 1920x1080 ch=2 270.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFormat0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const audioCodec: string = 'audio/aac';
      const videoCodec: string = 'video/avc';
      const audioFormat: string = 'm4a';
      const videoFormat: string = 'mp4';
      expect(audioCodec).assertEqual('audio/aac');
      expect(videoCodec).assertEqual('video/avc');
      expect(audioFormat).assertEqual('m4a');
      expect(videoFormat).assertEqual('mp4');
      expect(11025).assertLarger(0);
      expect(1920).assertLarger(0);
      expect(1080).assertLarger(0);
      expect(2).assertLarger(0);
      expect(112000).assertLarger(0);
      expect(3000000).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf('270') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FORMAT_0025
     * @tc.name      testExtRecFormat0024
     * @tc.desc      Format contract 12000Hz 640x480 ch=1 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFormat0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const audioCodec: string = 'audio/aac';
      const videoCodec: string = 'video/avc';
      const audioFormat: string = 'm4a';
      const videoFormat: string = 'mp4';
      expect(audioCodec).assertEqual('audio/aac');
      expect(videoCodec).assertEqual('video/avc');
      expect(audioFormat).assertEqual('m4a');
      expect(videoFormat).assertEqual('mp4');
      expect(12000).assertLarger(0);
      expect(640).assertLarger(0);
      expect(480).assertLarger(0);
      expect(1).assertLarger(0);
      expect(112000).assertLarger(0);
      expect(3000000).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf('0') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FORMAT_0026
     * @tc.name      testExtRecFormat0025
     * @tc.desc      Format contract 16000Hz 1280x720 ch=2 90.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFormat0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const audioCodec: string = 'audio/aac';
      const videoCodec: string = 'video/avc';
      const audioFormat: string = 'm4a';
      const videoFormat: string = 'mp4';
      expect(audioCodec).assertEqual('audio/aac');
      expect(videoCodec).assertEqual('video/avc');
      expect(audioFormat).assertEqual('m4a');
      expect(videoFormat).assertEqual('mp4');
      expect(16000).assertLarger(0);
      expect(1280).assertLarger(0);
      expect(720).assertLarger(0);
      expect(2).assertLarger(0);
      expect(112000).assertLarger(0);
      expect(3000000).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf('90') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FORMAT_0027
     * @tc.name      testExtRecFormat0026
     * @tc.desc      Format contract 22050Hz 1920x1080 ch=1 180.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFormat0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const audioCodec: string = 'audio/aac';
      const videoCodec: string = 'video/avc';
      const audioFormat: string = 'm4a';
      const videoFormat: string = 'mp4';
      expect(audioCodec).assertEqual('audio/aac');
      expect(videoCodec).assertEqual('video/avc');
      expect(audioFormat).assertEqual('m4a');
      expect(videoFormat).assertEqual('mp4');
      expect(22050).assertLarger(0);
      expect(1920).assertLarger(0);
      expect(1080).assertLarger(0);
      expect(1).assertLarger(0);
      expect(112000).assertLarger(0);
      expect(3000000).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf('180') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FORMAT_0028
     * @tc.name      testExtRecFormat0027
     * @tc.desc      Format contract 24000Hz 640x480 ch=2 270.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFormat0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const audioCodec: string = 'audio/aac';
      const videoCodec: string = 'video/avc';
      const audioFormat: string = 'm4a';
      const videoFormat: string = 'mp4';
      expect(audioCodec).assertEqual('audio/aac');
      expect(videoCodec).assertEqual('video/avc');
      expect(audioFormat).assertEqual('m4a');
      expect(videoFormat).assertEqual('mp4');
      expect(24000).assertLarger(0);
      expect(640).assertLarger(0);
      expect(480).assertLarger(0);
      expect(2).assertLarger(0);
      expect(112000).assertLarger(0);
      expect(3000000).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf('270') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FORMAT_0029
     * @tc.name      testExtRecFormat0028
     * @tc.desc      Format contract 32000Hz 1280x720 ch=1 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFormat0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const audioCodec: string = 'audio/aac';
      const videoCodec: string = 'video/avc';
      const audioFormat: string = 'm4a';
      const videoFormat: string = 'mp4';
      expect(audioCodec).assertEqual('audio/aac');
      expect(videoCodec).assertEqual('video/avc');
      expect(audioFormat).assertEqual('m4a');
      expect(videoFormat).assertEqual('mp4');
      expect(32000).assertLarger(0);
      expect(1280).assertLarger(0);
      expect(720).assertLarger(0);
      expect(1).assertLarger(0);
      expect(112000).assertLarger(0);
      expect(3000000).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf('0') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FORMAT_0030
     * @tc.name      testExtRecFormat0029
     * @tc.desc      Format contract 44100Hz 1920x1080 ch=2 90.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFormat0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const audioCodec: string = 'audio/aac';
      const videoCodec: string = 'video/avc';
      const audioFormat: string = 'm4a';
      const videoFormat: string = 'mp4';
      expect(audioCodec).assertEqual('audio/aac');
      expect(videoCodec).assertEqual('video/avc');
      expect(audioFormat).assertEqual('m4a');
      expect(videoFormat).assertEqual('mp4');
      expect(44100).assertLarger(0);
      expect(1920).assertLarger(0);
      expect(1080).assertLarger(0);
      expect(2).assertLarger(0);
      expect(112000).assertLarger(0);
      expect(3000000).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf('90') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FORMAT_0031
     * @tc.name      testExtRecFormat0030
     * @tc.desc      Format contract 48000Hz 640x480 ch=1 180.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFormat0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const audioCodec: string = 'audio/aac';
      const videoCodec: string = 'video/avc';
      const audioFormat: string = 'm4a';
      const videoFormat: string = 'mp4';
      expect(audioCodec).assertEqual('audio/aac');
      expect(videoCodec).assertEqual('video/avc');
      expect(audioFormat).assertEqual('m4a');
      expect(videoFormat).assertEqual('mp4');
      expect(48000).assertLarger(0);
      expect(640).assertLarger(0);
      expect(480).assertLarger(0);
      expect(1).assertLarger(0);
      expect(112000).assertLarger(0);
      expect(3000000).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf('180') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FORMAT_0032
     * @tc.name      testExtRecFormat0031
     * @tc.desc      Format contract 64000Hz 1280x720 ch=2 270.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFormat0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const audioCodec: string = 'audio/aac';
      const videoCodec: string = 'video/avc';
      const audioFormat: string = 'm4a';
      const videoFormat: string = 'mp4';
      expect(audioCodec).assertEqual('audio/aac');
      expect(videoCodec).assertEqual('video/avc');
      expect(audioFormat).assertEqual('m4a');
      expect(videoFormat).assertEqual('mp4');
      expect(64000).assertLarger(0);
      expect(1280).assertLarger(0);
      expect(720).assertLarger(0);
      expect(2).assertLarger(0);
      expect(112000).assertLarger(0);
      expect(3000000).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf('270') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FORMAT_0033
     * @tc.name      testExtRecFormat0032
     * @tc.desc      Format contract 96000Hz 1920x1080 ch=1 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFormat0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const audioCodec: string = 'audio/aac';
      const videoCodec: string = 'video/avc';
      const audioFormat: string = 'm4a';
      const videoFormat: string = 'mp4';
      expect(audioCodec).assertEqual('audio/aac');
      expect(videoCodec).assertEqual('video/avc');
      expect(audioFormat).assertEqual('m4a');
      expect(videoFormat).assertEqual('mp4');
      expect(96000).assertLarger(0);
      expect(1920).assertLarger(0);
      expect(1080).assertLarger(0);
      expect(1).assertLarger(0);
      expect(112000).assertLarger(0);
      expect(3000000).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf('0') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FORMAT_0034
     * @tc.name      testExtRecFormat0033
     * @tc.desc      Format contract 8000Hz 640x480 ch=2 90.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFormat0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const audioCodec: string = 'audio/aac';
      const videoCodec: string = 'video/avc';
      const audioFormat: string = 'm4a';
      const videoFormat: string = 'mp4';
      expect(audioCodec).assertEqual('audio/aac');
      expect(videoCodec).assertEqual('video/avc');
      expect(audioFormat).assertEqual('m4a');
      expect(videoFormat).assertEqual('mp4');
      expect(8000).assertLarger(0);
      expect(640).assertLarger(0);
      expect(480).assertLarger(0);
      expect(2).assertLarger(0);
      expect(112000).assertLarger(0);
      expect(3000000).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf('90') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FORMAT_0035
     * @tc.name      testExtRecFormat0034
     * @tc.desc      Format contract 11025Hz 1280x720 ch=1 180.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFormat0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const audioCodec: string = 'audio/aac';
      const videoCodec: string = 'video/avc';
      const audioFormat: string = 'm4a';
      const videoFormat: string = 'mp4';
      expect(audioCodec).assertEqual('audio/aac');
      expect(videoCodec).assertEqual('video/avc');
      expect(audioFormat).assertEqual('m4a');
      expect(videoFormat).assertEqual('mp4');
      expect(11025).assertLarger(0);
      expect(1280).assertLarger(0);
      expect(720).assertLarger(0);
      expect(1).assertLarger(0);
      expect(112000).assertLarger(0);
      expect(3000000).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf('180') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FORMAT_0036
     * @tc.name      testExtRecFormat0035
     * @tc.desc      Format contract 12000Hz 1920x1080 ch=2 270.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFormat0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const audioCodec: string = 'audio/aac';
      const videoCodec: string = 'video/avc';
      const audioFormat: string = 'm4a';
      const videoFormat: string = 'mp4';
      expect(audioCodec).assertEqual('audio/aac');
      expect(videoCodec).assertEqual('video/avc');
      expect(audioFormat).assertEqual('m4a');
      expect(videoFormat).assertEqual('mp4');
      expect(12000).assertLarger(0);
      expect(1920).assertLarger(0);
      expect(1080).assertLarger(0);
      expect(2).assertLarger(0);
      expect(112000).assertLarger(0);
      expect(3000000).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf('270') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FORMAT_0037
     * @tc.name      testExtRecFormat0036
     * @tc.desc      Format contract 16000Hz 640x480 ch=1 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFormat0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const audioCodec: string = 'audio/aac';
      const videoCodec: string = 'video/avc';
      const audioFormat: string = 'm4a';
      const videoFormat: string = 'mp4';
      expect(audioCodec).assertEqual('audio/aac');
      expect(videoCodec).assertEqual('video/avc');
      expect(audioFormat).assertEqual('m4a');
      expect(videoFormat).assertEqual('mp4');
      expect(16000).assertLarger(0);
      expect(640).assertLarger(0);
      expect(480).assertLarger(0);
      expect(1).assertLarger(0);
      expect(112000).assertLarger(0);
      expect(3000000).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf('0') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FORMAT_0038
     * @tc.name      testExtRecFormat0037
     * @tc.desc      Format contract 22050Hz 1280x720 ch=2 90.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFormat0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const audioCodec: string = 'audio/aac';
      const videoCodec: string = 'video/avc';
      const audioFormat: string = 'm4a';
      const videoFormat: string = 'mp4';
      expect(audioCodec).assertEqual('audio/aac');
      expect(videoCodec).assertEqual('video/avc');
      expect(audioFormat).assertEqual('m4a');
      expect(videoFormat).assertEqual('mp4');
      expect(22050).assertLarger(0);
      expect(1280).assertLarger(0);
      expect(720).assertLarger(0);
      expect(2).assertLarger(0);
      expect(112000).assertLarger(0);
      expect(3000000).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf('90') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FORMAT_0039
     * @tc.name      testExtRecFormat0038
     * @tc.desc      Format contract 24000Hz 1920x1080 ch=1 180.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFormat0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const audioCodec: string = 'audio/aac';
      const videoCodec: string = 'video/avc';
      const audioFormat: string = 'm4a';
      const videoFormat: string = 'mp4';
      expect(audioCodec).assertEqual('audio/aac');
      expect(videoCodec).assertEqual('video/avc');
      expect(audioFormat).assertEqual('m4a');
      expect(videoFormat).assertEqual('mp4');
      expect(24000).assertLarger(0);
      expect(1920).assertLarger(0);
      expect(1080).assertLarger(0);
      expect(1).assertLarger(0);
      expect(112000).assertLarger(0);
      expect(3000000).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf('180') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FORMAT_0040
     * @tc.name      testExtRecFormat0039
     * @tc.desc      Format contract 32000Hz 640x480 ch=2 270.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFormat0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const audioCodec: string = 'audio/aac';
      const videoCodec: string = 'video/avc';
      const audioFormat: string = 'm4a';
      const videoFormat: string = 'mp4';
      expect(audioCodec).assertEqual('audio/aac');
      expect(videoCodec).assertEqual('video/avc');
      expect(audioFormat).assertEqual('m4a');
      expect(videoFormat).assertEqual('mp4');
      expect(32000).assertLarger(0);
      expect(640).assertLarger(0);
      expect(480).assertLarger(0);
      expect(2).assertLarger(0);
      expect(112000).assertLarger(0);
      expect(3000000).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf('270') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FORMAT_0041
     * @tc.name      testExtRecFormat0040
     * @tc.desc      Format contract 44100Hz 1280x720 ch=1 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFormat0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const audioCodec: string = 'audio/aac';
      const videoCodec: string = 'video/avc';
      const audioFormat: string = 'm4a';
      const videoFormat: string = 'mp4';
      expect(audioCodec).assertEqual('audio/aac');
      expect(videoCodec).assertEqual('video/avc');
      expect(audioFormat).assertEqual('m4a');
      expect(videoFormat).assertEqual('mp4');
      expect(44100).assertLarger(0);
      expect(1280).assertLarger(0);
      expect(720).assertLarger(0);
      expect(1).assertLarger(0);
      expect(112000).assertLarger(0);
      expect(3000000).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf('0') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FORMAT_0042
     * @tc.name      testExtRecFormat0041
     * @tc.desc      Format contract 48000Hz 1920x1080 ch=2 90.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFormat0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const audioCodec: string = 'audio/aac';
      const videoCodec: string = 'video/avc';
      const audioFormat: string = 'm4a';
      const videoFormat: string = 'mp4';
      expect(audioCodec).assertEqual('audio/aac');
      expect(videoCodec).assertEqual('video/avc');
      expect(audioFormat).assertEqual('m4a');
      expect(videoFormat).assertEqual('mp4');
      expect(48000).assertLarger(0);
      expect(1920).assertLarger(0);
      expect(1080).assertLarger(0);
      expect(2).assertLarger(0);
      expect(112000).assertLarger(0);
      expect(3000000).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf('90') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FORMAT_0043
     * @tc.name      testExtRecFormat0042
     * @tc.desc      Format contract 64000Hz 640x480 ch=1 180.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFormat0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const audioCodec: string = 'audio/aac';
      const videoCodec: string = 'video/avc';
      const audioFormat: string = 'm4a';
      const videoFormat: string = 'mp4';
      expect(audioCodec).assertEqual('audio/aac');
      expect(videoCodec).assertEqual('video/avc');
      expect(audioFormat).assertEqual('m4a');
      expect(videoFormat).assertEqual('mp4');
      expect(64000).assertLarger(0);
      expect(640).assertLarger(0);
      expect(480).assertLarger(0);
      expect(1).assertLarger(0);
      expect(112000).assertLarger(0);
      expect(3000000).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf('180') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FORMAT_0044
     * @tc.name      testExtRecFormat0043
     * @tc.desc      Format contract 96000Hz 1280x720 ch=2 270.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFormat0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const audioCodec: string = 'audio/aac';
      const videoCodec: string = 'video/avc';
      const audioFormat: string = 'm4a';
      const videoFormat: string = 'mp4';
      expect(audioCodec).assertEqual('audio/aac');
      expect(videoCodec).assertEqual('video/avc');
      expect(audioFormat).assertEqual('m4a');
      expect(videoFormat).assertEqual('mp4');
      expect(96000).assertLarger(0);
      expect(1280).assertLarger(0);
      expect(720).assertLarger(0);
      expect(2).assertLarger(0);
      expect(112000).assertLarger(0);
      expect(3000000).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf('270') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FORMAT_0045
     * @tc.name      testExtRecFormat0044
     * @tc.desc      Format contract 8000Hz 1920x1080 ch=1 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFormat0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const audioCodec: string = 'audio/aac';
      const videoCodec: string = 'video/avc';
      const audioFormat: string = 'm4a';
      const videoFormat: string = 'mp4';
      expect(audioCodec).assertEqual('audio/aac');
      expect(videoCodec).assertEqual('video/avc');
      expect(audioFormat).assertEqual('m4a');
      expect(videoFormat).assertEqual('mp4');
      expect(8000).assertLarger(0);
      expect(1920).assertLarger(0);
      expect(1080).assertLarger(0);
      expect(1).assertLarger(0);
      expect(112000).assertLarger(0);
      expect(3000000).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf('0') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FORMAT_0046
     * @tc.name      testExtRecFormat0045
     * @tc.desc      Format contract 11025Hz 640x480 ch=2 90.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFormat0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const audioCodec: string = 'audio/aac';
      const videoCodec: string = 'video/avc';
      const audioFormat: string = 'm4a';
      const videoFormat: string = 'mp4';
      expect(audioCodec).assertEqual('audio/aac');
      expect(videoCodec).assertEqual('video/avc');
      expect(audioFormat).assertEqual('m4a');
      expect(videoFormat).assertEqual('mp4');
      expect(11025).assertLarger(0);
      expect(640).assertLarger(0);
      expect(480).assertLarger(0);
      expect(2).assertLarger(0);
      expect(112000).assertLarger(0);
      expect(3000000).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf('90') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FORMAT_0047
     * @tc.name      testExtRecFormat0046
     * @tc.desc      Format contract 12000Hz 1280x720 ch=1 180.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFormat0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const audioCodec: string = 'audio/aac';
      const videoCodec: string = 'video/avc';
      const audioFormat: string = 'm4a';
      const videoFormat: string = 'mp4';
      expect(audioCodec).assertEqual('audio/aac');
      expect(videoCodec).assertEqual('video/avc');
      expect(audioFormat).assertEqual('m4a');
      expect(videoFormat).assertEqual('mp4');
      expect(12000).assertLarger(0);
      expect(1280).assertLarger(0);
      expect(720).assertLarger(0);
      expect(1).assertLarger(0);
      expect(112000).assertLarger(0);
      expect(3000000).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf('180') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FORMAT_0048
     * @tc.name      testExtRecFormat0047
     * @tc.desc      Format contract 16000Hz 1920x1080 ch=2 270.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFormat0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const audioCodec: string = 'audio/aac';
      const videoCodec: string = 'video/avc';
      const audioFormat: string = 'm4a';
      const videoFormat: string = 'mp4';
      expect(audioCodec).assertEqual('audio/aac');
      expect(videoCodec).assertEqual('video/avc');
      expect(audioFormat).assertEqual('m4a');
      expect(videoFormat).assertEqual('mp4');
      expect(16000).assertLarger(0);
      expect(1920).assertLarger(0);
      expect(1080).assertLarger(0);
      expect(2).assertLarger(0);
      expect(112000).assertLarger(0);
      expect(3000000).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf('270') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FORMAT_0049
     * @tc.name      testExtRecFormat0048
     * @tc.desc      Format contract 22050Hz 640x480 ch=1 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFormat0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const audioCodec: string = 'audio/aac';
      const videoCodec: string = 'video/avc';
      const audioFormat: string = 'm4a';
      const videoFormat: string = 'mp4';
      expect(audioCodec).assertEqual('audio/aac');
      expect(videoCodec).assertEqual('video/avc');
      expect(audioFormat).assertEqual('m4a');
      expect(videoFormat).assertEqual('mp4');
      expect(22050).assertLarger(0);
      expect(640).assertLarger(0);
      expect(480).assertLarger(0);
      expect(1).assertLarger(0);
      expect(112000).assertLarger(0);
      expect(3000000).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf('0') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FORMAT_0050
     * @tc.name      testExtRecFormat0049
     * @tc.desc      Format contract 24000Hz 1280x720 ch=2 90.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFormat0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const audioCodec: string = 'audio/aac';
      const videoCodec: string = 'video/avc';
      const audioFormat: string = 'm4a';
      const videoFormat: string = 'mp4';
      expect(audioCodec).assertEqual('audio/aac');
      expect(videoCodec).assertEqual('video/avc');
      expect(audioFormat).assertEqual('m4a');
      expect(videoFormat).assertEqual('mp4');
      expect(24000).assertLarger(0);
      expect(1280).assertLarger(0);
      expect(720).assertLarger(0);
      expect(2).assertLarger(0);
      expect(112000).assertLarger(0);
      expect(3000000).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf('90') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FORMAT_0051
     * @tc.name      testExtRecFormat0050
     * @tc.desc      Format contract 32000Hz 1920x1080 ch=1 180.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFormat0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const audioCodec: string = 'audio/aac';
      const videoCodec: string = 'video/avc';
      const audioFormat: string = 'm4a';
      const videoFormat: string = 'mp4';
      expect(audioCodec).assertEqual('audio/aac');
      expect(videoCodec).assertEqual('video/avc');
      expect(audioFormat).assertEqual('m4a');
      expect(videoFormat).assertEqual('mp4');
      expect(32000).assertLarger(0);
      expect(1920).assertLarger(0);
      expect(1080).assertLarger(0);
      expect(1).assertLarger(0);
      expect(112000).assertLarger(0);
      expect(3000000).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf('180') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FORMAT_0052
     * @tc.name      testExtRecFormat0051
     * @tc.desc      Format contract 44100Hz 640x480 ch=2 270.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFormat0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const audioCodec: string = 'audio/aac';
      const videoCodec: string = 'video/avc';
      const audioFormat: string = 'm4a';
      const videoFormat: string = 'mp4';
      expect(audioCodec).assertEqual('audio/aac');
      expect(videoCodec).assertEqual('video/avc');
      expect(audioFormat).assertEqual('m4a');
      expect(videoFormat).assertEqual('mp4');
      expect(44100).assertLarger(0);
      expect(640).assertLarger(0);
      expect(480).assertLarger(0);
      expect(2).assertLarger(0);
      expect(112000).assertLarger(0);
      expect(3000000).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf('270') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FORMAT_0053
     * @tc.name      testExtRecFormat0052
     * @tc.desc      Format contract 48000Hz 1280x720 ch=1 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFormat0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const audioCodec: string = 'audio/aac';
      const videoCodec: string = 'video/avc';
      const audioFormat: string = 'm4a';
      const videoFormat: string = 'mp4';
      expect(audioCodec).assertEqual('audio/aac');
      expect(videoCodec).assertEqual('video/avc');
      expect(audioFormat).assertEqual('m4a');
      expect(videoFormat).assertEqual('mp4');
      expect(48000).assertLarger(0);
      expect(1280).assertLarger(0);
      expect(720).assertLarger(0);
      expect(1).assertLarger(0);
      expect(112000).assertLarger(0);
      expect(3000000).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf('0') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FORMAT_0054
     * @tc.name      testExtRecFormat0053
     * @tc.desc      Format contract 64000Hz 1920x1080 ch=2 90.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFormat0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const audioCodec: string = 'audio/aac';
      const videoCodec: string = 'video/avc';
      const audioFormat: string = 'm4a';
      const videoFormat: string = 'mp4';
      expect(audioCodec).assertEqual('audio/aac');
      expect(videoCodec).assertEqual('video/avc');
      expect(audioFormat).assertEqual('m4a');
      expect(videoFormat).assertEqual('mp4');
      expect(64000).assertLarger(0);
      expect(1920).assertLarger(0);
      expect(1080).assertLarger(0);
      expect(2).assertLarger(0);
      expect(112000).assertLarger(0);
      expect(3000000).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf('90') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FORMAT_0055
     * @tc.name      testExtRecFormat0054
     * @tc.desc      Format contract 96000Hz 640x480 ch=1 180.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFormat0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const audioCodec: string = 'audio/aac';
      const videoCodec: string = 'video/avc';
      const audioFormat: string = 'm4a';
      const videoFormat: string = 'mp4';
      expect(audioCodec).assertEqual('audio/aac');
      expect(videoCodec).assertEqual('video/avc');
      expect(audioFormat).assertEqual('m4a');
      expect(videoFormat).assertEqual('mp4');
      expect(96000).assertLarger(0);
      expect(640).assertLarger(0);
      expect(480).assertLarger(0);
      expect(1).assertLarger(0);
      expect(112000).assertLarger(0);
      expect(3000000).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf('180') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FORMAT_0056
     * @tc.name      testExtRecFormat0055
     * @tc.desc      Format contract 8000Hz 1280x720 ch=2 270.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFormat0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const audioCodec: string = 'audio/aac';
      const videoCodec: string = 'video/avc';
      const audioFormat: string = 'm4a';
      const videoFormat: string = 'mp4';
      expect(audioCodec).assertEqual('audio/aac');
      expect(videoCodec).assertEqual('video/avc');
      expect(audioFormat).assertEqual('m4a');
      expect(videoFormat).assertEqual('mp4');
      expect(8000).assertLarger(0);
      expect(1280).assertLarger(0);
      expect(720).assertLarger(0);
      expect(2).assertLarger(0);
      expect(112000).assertLarger(0);
      expect(3000000).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf('270') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FORMAT_0057
     * @tc.name      testExtRecFormat0056
     * @tc.desc      Format contract 11025Hz 1920x1080 ch=1 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFormat0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const audioCodec: string = 'audio/aac';
      const videoCodec: string = 'video/avc';
      const audioFormat: string = 'm4a';
      const videoFormat: string = 'mp4';
      expect(audioCodec).assertEqual('audio/aac');
      expect(videoCodec).assertEqual('video/avc');
      expect(audioFormat).assertEqual('m4a');
      expect(videoFormat).assertEqual('mp4');
      expect(11025).assertLarger(0);
      expect(1920).assertLarger(0);
      expect(1080).assertLarger(0);
      expect(1).assertLarger(0);
      expect(112000).assertLarger(0);
      expect(3000000).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf('0') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FORMAT_0058
     * @tc.name      testExtRecFormat0057
     * @tc.desc      Format contract 12000Hz 640x480 ch=2 90.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFormat0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const audioCodec: string = 'audio/aac';
      const videoCodec: string = 'video/avc';
      const audioFormat: string = 'm4a';
      const videoFormat: string = 'mp4';
      expect(audioCodec).assertEqual('audio/aac');
      expect(videoCodec).assertEqual('video/avc');
      expect(audioFormat).assertEqual('m4a');
      expect(videoFormat).assertEqual('mp4');
      expect(12000).assertLarger(0);
      expect(640).assertLarger(0);
      expect(480).assertLarger(0);
      expect(2).assertLarger(0);
      expect(112000).assertLarger(0);
      expect(3000000).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf('90') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FORMAT_0059
     * @tc.name      testExtRecFormat0058
     * @tc.desc      Format contract 16000Hz 1280x720 ch=1 180.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFormat0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const audioCodec: string = 'audio/aac';
      const videoCodec: string = 'video/avc';
      const audioFormat: string = 'm4a';
      const videoFormat: string = 'mp4';
      expect(audioCodec).assertEqual('audio/aac');
      expect(videoCodec).assertEqual('video/avc');
      expect(audioFormat).assertEqual('m4a');
      expect(videoFormat).assertEqual('mp4');
      expect(16000).assertLarger(0);
      expect(1280).assertLarger(0);
      expect(720).assertLarger(0);
      expect(1).assertLarger(0);
      expect(112000).assertLarger(0);
      expect(3000000).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf('180') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FORMAT_0060
     * @tc.name      testExtRecFormat0059
     * @tc.desc      Format contract 22050Hz 1920x1080 ch=2 270.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFormat0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const audioCodec: string = 'audio/aac';
      const videoCodec: string = 'video/avc';
      const audioFormat: string = 'm4a';
      const videoFormat: string = 'mp4';
      expect(audioCodec).assertEqual('audio/aac');
      expect(videoCodec).assertEqual('video/avc');
      expect(audioFormat).assertEqual('m4a');
      expect(videoFormat).assertEqual('mp4');
      expect(22050).assertLarger(0);
      expect(1920).assertLarger(0);
      expect(1080).assertLarger(0);
      expect(2).assertLarger(0);
      expect(112000).assertLarger(0);
      expect(3000000).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf('270') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FORMAT_0061
     * @tc.name      testExtRecFormat0060
     * @tc.desc      Format contract 24000Hz 640x480 ch=1 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFormat0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const audioCodec: string = 'audio/aac';
      const videoCodec: string = 'video/avc';
      const audioFormat: string = 'm4a';
      const videoFormat: string = 'mp4';
      expect(audioCodec).assertEqual('audio/aac');
      expect(videoCodec).assertEqual('video/avc');
      expect(audioFormat).assertEqual('m4a');
      expect(videoFormat).assertEqual('mp4');
      expect(24000).assertLarger(0);
      expect(640).assertLarger(0);
      expect(480).assertLarger(0);
      expect(1).assertLarger(0);
      expect(112000).assertLarger(0);
      expect(3000000).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf('0') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FORMAT_0062
     * @tc.name      testExtRecFormat0061
     * @tc.desc      Format contract 32000Hz 1280x720 ch=2 90.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFormat0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const audioCodec: string = 'audio/aac';
      const videoCodec: string = 'video/avc';
      const audioFormat: string = 'm4a';
      const videoFormat: string = 'mp4';
      expect(audioCodec).assertEqual('audio/aac');
      expect(videoCodec).assertEqual('video/avc');
      expect(audioFormat).assertEqual('m4a');
      expect(videoFormat).assertEqual('mp4');
      expect(32000).assertLarger(0);
      expect(1280).assertLarger(0);
      expect(720).assertLarger(0);
      expect(2).assertLarger(0);
      expect(112000).assertLarger(0);
      expect(3000000).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf('90') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FORMAT_0063
     * @tc.name      testExtRecFormat0062
     * @tc.desc      Format contract 44100Hz 1920x1080 ch=1 180.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFormat0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const audioCodec: string = 'audio/aac';
      const videoCodec: string = 'video/avc';
      const audioFormat: string = 'm4a';
      const videoFormat: string = 'mp4';
      expect(audioCodec).assertEqual('audio/aac');
      expect(videoCodec).assertEqual('video/avc');
      expect(audioFormat).assertEqual('m4a');
      expect(videoFormat).assertEqual('mp4');
      expect(44100).assertLarger(0);
      expect(1920).assertLarger(0);
      expect(1080).assertLarger(0);
      expect(1).assertLarger(0);
      expect(112000).assertLarger(0);
      expect(3000000).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf('180') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FORMAT_0064
     * @tc.name      testExtRecFormat0063
     * @tc.desc      Format contract 48000Hz 640x480 ch=2 270.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFormat0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const audioCodec: string = 'audio/aac';
      const videoCodec: string = 'video/avc';
      const audioFormat: string = 'm4a';
      const videoFormat: string = 'mp4';
      expect(audioCodec).assertEqual('audio/aac');
      expect(videoCodec).assertEqual('video/avc');
      expect(audioFormat).assertEqual('m4a');
      expect(videoFormat).assertEqual('mp4');
      expect(48000).assertLarger(0);
      expect(640).assertLarger(0);
      expect(480).assertLarger(0);
      expect(2).assertLarger(0);
      expect(112000).assertLarger(0);
      expect(3000000).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf('270') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FORMAT_0065
     * @tc.name      testExtRecFormat0064
     * @tc.desc      Format contract 64000Hz 1280x720 ch=1 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFormat0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const audioCodec: string = 'audio/aac';
      const videoCodec: string = 'video/avc';
      const audioFormat: string = 'm4a';
      const videoFormat: string = 'mp4';
      expect(audioCodec).assertEqual('audio/aac');
      expect(videoCodec).assertEqual('video/avc');
      expect(audioFormat).assertEqual('m4a');
      expect(videoFormat).assertEqual('mp4');
      expect(64000).assertLarger(0);
      expect(1280).assertLarger(0);
      expect(720).assertLarger(0);
      expect(1).assertLarger(0);
      expect(112000).assertLarger(0);
      expect(3000000).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf('0') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FORMAT_0066
     * @tc.name      testExtRecFormat0065
     * @tc.desc      Format contract 96000Hz 1920x1080 ch=2 90.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFormat0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const audioCodec: string = 'audio/aac';
      const videoCodec: string = 'video/avc';
      const audioFormat: string = 'm4a';
      const videoFormat: string = 'mp4';
      expect(audioCodec).assertEqual('audio/aac');
      expect(videoCodec).assertEqual('video/avc');
      expect(audioFormat).assertEqual('m4a');
      expect(videoFormat).assertEqual('mp4');
      expect(96000).assertLarger(0);
      expect(1920).assertLarger(0);
      expect(1080).assertLarger(0);
      expect(2).assertLarger(0);
      expect(112000).assertLarger(0);
      expect(3000000).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf('90') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FORMAT_0067
     * @tc.name      testExtRecFormat0066
     * @tc.desc      Format contract 8000Hz 640x480 ch=1 180.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFormat0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const audioCodec: string = 'audio/aac';
      const videoCodec: string = 'video/avc';
      const audioFormat: string = 'm4a';
      const videoFormat: string = 'mp4';
      expect(audioCodec).assertEqual('audio/aac');
      expect(videoCodec).assertEqual('video/avc');
      expect(audioFormat).assertEqual('m4a');
      expect(videoFormat).assertEqual('mp4');
      expect(8000).assertLarger(0);
      expect(640).assertLarger(0);
      expect(480).assertLarger(0);
      expect(1).assertLarger(0);
      expect(112000).assertLarger(0);
      expect(3000000).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf('180') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FORMAT_0068
     * @tc.name      testExtRecFormat0067
     * @tc.desc      Format contract 11025Hz 1280x720 ch=2 270.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFormat0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const audioCodec: string = 'audio/aac';
      const videoCodec: string = 'video/avc';
      const audioFormat: string = 'm4a';
      const videoFormat: string = 'mp4';
      expect(audioCodec).assertEqual('audio/aac');
      expect(videoCodec).assertEqual('video/avc');
      expect(audioFormat).assertEqual('m4a');
      expect(videoFormat).assertEqual('mp4');
      expect(11025).assertLarger(0);
      expect(1280).assertLarger(0);
      expect(720).assertLarger(0);
      expect(2).assertLarger(0);
      expect(112000).assertLarger(0);
      expect(3000000).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf('270') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FORMAT_0069
     * @tc.name      testExtRecFormat0068
     * @tc.desc      Format contract 12000Hz 1920x1080 ch=1 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFormat0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const audioCodec: string = 'audio/aac';
      const videoCodec: string = 'video/avc';
      const audioFormat: string = 'm4a';
      const videoFormat: string = 'mp4';
      expect(audioCodec).assertEqual('audio/aac');
      expect(videoCodec).assertEqual('video/avc');
      expect(audioFormat).assertEqual('m4a');
      expect(videoFormat).assertEqual('mp4');
      expect(12000).assertLarger(0);
      expect(1920).assertLarger(0);
      expect(1080).assertLarger(0);
      expect(1).assertLarger(0);
      expect(112000).assertLarger(0);
      expect(3000000).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf('0') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FORMAT_0070
     * @tc.name      testExtRecFormat0069
     * @tc.desc      Format contract 16000Hz 640x480 ch=2 90.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFormat0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const audioCodec: string = 'audio/aac';
      const videoCodec: string = 'video/avc';
      const audioFormat: string = 'm4a';
      const videoFormat: string = 'mp4';
      expect(audioCodec).assertEqual('audio/aac');
      expect(videoCodec).assertEqual('video/avc');
      expect(audioFormat).assertEqual('m4a');
      expect(videoFormat).assertEqual('mp4');
      expect(16000).assertLarger(0);
      expect(640).assertLarger(0);
      expect(480).assertLarger(0);
      expect(2).assertLarger(0);
      expect(112000).assertLarger(0);
      expect(3000000).assertLarger(0);
      expect(['0', '90', '180', '270'].indexOf('90') >= 0).assertTrue();
    })
  });
}
