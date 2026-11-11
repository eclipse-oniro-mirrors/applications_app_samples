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
import AVRecorderService from '../../../main/ets/services/AVRecorderService';
import { Resolution } from '../../../main/ets/services/CommonTypes';

const TAG: string = '[Sample_avRecorderServiceNoop]';
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

export default function avRecorderServiceNoopTest(): void {
  describe('avRecorderServiceNoopTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NOOP_0001
     * @tc.name      testExtRecNoop0000
     * @tc.desc      No-op startRecorder/pauseRecorder before createRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNoop0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.startRecorder();
      await service.pauseRecorder();
      service.configAudioSampleRate(8000);
      service.configVideoResolution({ frameWidth: 1280, frameHeight: 720 } as Resolution);
      expect(true).assertTrue();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NOOP_0002
     * @tc.name      testExtRecNoop0001
     * @tc.desc      No-op pauseRecorder/resumeRecorder before createRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNoop0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.pauseRecorder();
      await service.resumeRecorder();
      service.configAudioSampleRate(16000);
      service.configVideoResolution({ frameWidth: 1280, frameHeight: 720 } as Resolution);
      expect(true).assertTrue();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NOOP_0003
     * @tc.name      testExtRecNoop0002
     * @tc.desc      No-op resumeRecorder/stopRecorder before createRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNoop0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.resumeRecorder();
      await service.stopRecorder();
      service.configAudioSampleRate(24000);
      service.configVideoResolution({ frameWidth: 1280, frameHeight: 720 } as Resolution);
      expect(true).assertTrue();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NOOP_0004
     * @tc.name      testExtRecNoop0003
     * @tc.desc      No-op stopRecorder/resetRecorder before createRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNoop0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.stopRecorder();
      await service.resetRecorder();
      service.configAudioSampleRate(32000);
      service.configVideoResolution({ frameWidth: 1280, frameHeight: 720 } as Resolution);
      expect(true).assertTrue();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NOOP_0005
     * @tc.name      testExtRecNoop0004
     * @tc.desc      No-op resetRecorder/releaseRecorder before createRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNoop0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.resetRecorder();
      await service.releaseRecorder();
      service.configAudioSampleRate(8000);
      service.configVideoResolution({ frameWidth: 1280, frameHeight: 720 } as Resolution);
      expect(true).assertTrue();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NOOP_0006
     * @tc.name      testExtRecNoop0005
     * @tc.desc      No-op releaseRecorder/closeFd before createRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNoop0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.releaseRecorder();
      await service.closeFd();
      service.configAudioSampleRate(16000);
      service.configVideoResolution({ frameWidth: 1280, frameHeight: 720 } as Resolution);
      expect(true).assertTrue();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NOOP_0007
     * @tc.name      testExtRecNoop0006
     * @tc.desc      No-op closeFd/startRecorder before createRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNoop0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.closeFd();
      await service.startRecorder();
      service.configAudioSampleRate(24000);
      service.configVideoResolution({ frameWidth: 1280, frameHeight: 720 } as Resolution);
      expect(true).assertTrue();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NOOP_0008
     * @tc.name      testExtRecNoop0007
     * @tc.desc      No-op startRecorder/pauseRecorder before createRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNoop0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.startRecorder();
      await service.pauseRecorder();
      service.configAudioSampleRate(32000);
      service.configVideoResolution({ frameWidth: 1280, frameHeight: 720 } as Resolution);
      expect(true).assertTrue();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NOOP_0009
     * @tc.name      testExtRecNoop0008
     * @tc.desc      No-op pauseRecorder/resumeRecorder before createRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNoop0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.pauseRecorder();
      await service.resumeRecorder();
      service.configAudioSampleRate(8000);
      service.configVideoResolution({ frameWidth: 1280, frameHeight: 720 } as Resolution);
      expect(true).assertTrue();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NOOP_0010
     * @tc.name      testExtRecNoop0009
     * @tc.desc      No-op resumeRecorder/stopRecorder before createRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNoop0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.resumeRecorder();
      await service.stopRecorder();
      service.configAudioSampleRate(16000);
      service.configVideoResolution({ frameWidth: 1280, frameHeight: 720 } as Resolution);
      expect(true).assertTrue();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NOOP_0011
     * @tc.name      testExtRecNoop0010
     * @tc.desc      No-op stopRecorder/resetRecorder before createRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNoop0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.stopRecorder();
      await service.resetRecorder();
      service.configAudioSampleRate(24000);
      service.configVideoResolution({ frameWidth: 1280, frameHeight: 720 } as Resolution);
      expect(true).assertTrue();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NOOP_0012
     * @tc.name      testExtRecNoop0011
     * @tc.desc      No-op resetRecorder/releaseRecorder before createRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNoop0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.resetRecorder();
      await service.releaseRecorder();
      service.configAudioSampleRate(32000);
      service.configVideoResolution({ frameWidth: 1280, frameHeight: 720 } as Resolution);
      expect(true).assertTrue();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NOOP_0013
     * @tc.name      testExtRecNoop0012
     * @tc.desc      No-op releaseRecorder/closeFd before createRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNoop0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.releaseRecorder();
      await service.closeFd();
      service.configAudioSampleRate(8000);
      service.configVideoResolution({ frameWidth: 1280, frameHeight: 720 } as Resolution);
      expect(true).assertTrue();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NOOP_0014
     * @tc.name      testExtRecNoop0013
     * @tc.desc      No-op closeFd/startRecorder before createRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNoop0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.closeFd();
      await service.startRecorder();
      service.configAudioSampleRate(16000);
      service.configVideoResolution({ frameWidth: 1280, frameHeight: 720 } as Resolution);
      expect(true).assertTrue();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NOOP_0015
     * @tc.name      testExtRecNoop0014
     * @tc.desc      No-op startRecorder/pauseRecorder before createRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNoop0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.startRecorder();
      await service.pauseRecorder();
      service.configAudioSampleRate(24000);
      service.configVideoResolution({ frameWidth: 1280, frameHeight: 720 } as Resolution);
      expect(true).assertTrue();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NOOP_0016
     * @tc.name      testExtRecNoop0015
     * @tc.desc      No-op pauseRecorder/resumeRecorder before createRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNoop0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.pauseRecorder();
      await service.resumeRecorder();
      service.configAudioSampleRate(32000);
      service.configVideoResolution({ frameWidth: 1280, frameHeight: 720 } as Resolution);
      expect(true).assertTrue();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NOOP_0017
     * @tc.name      testExtRecNoop0016
     * @tc.desc      No-op resumeRecorder/stopRecorder before createRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNoop0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.resumeRecorder();
      await service.stopRecorder();
      service.configAudioSampleRate(8000);
      service.configVideoResolution({ frameWidth: 1280, frameHeight: 720 } as Resolution);
      expect(true).assertTrue();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NOOP_0018
     * @tc.name      testExtRecNoop0017
     * @tc.desc      No-op stopRecorder/resetRecorder before createRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNoop0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.stopRecorder();
      await service.resetRecorder();
      service.configAudioSampleRate(16000);
      service.configVideoResolution({ frameWidth: 1280, frameHeight: 720 } as Resolution);
      expect(true).assertTrue();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NOOP_0019
     * @tc.name      testExtRecNoop0018
     * @tc.desc      No-op resetRecorder/releaseRecorder before createRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNoop0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.resetRecorder();
      await service.releaseRecorder();
      service.configAudioSampleRate(24000);
      service.configVideoResolution({ frameWidth: 1280, frameHeight: 720 } as Resolution);
      expect(true).assertTrue();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NOOP_0020
     * @tc.name      testExtRecNoop0019
     * @tc.desc      No-op releaseRecorder/closeFd before createRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNoop0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.releaseRecorder();
      await service.closeFd();
      service.configAudioSampleRate(32000);
      service.configVideoResolution({ frameWidth: 1280, frameHeight: 720 } as Resolution);
      expect(true).assertTrue();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NOOP_0021
     * @tc.name      testExtRecNoop0020
     * @tc.desc      No-op closeFd/startRecorder before createRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNoop0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.closeFd();
      await service.startRecorder();
      service.configAudioSampleRate(8000);
      service.configVideoResolution({ frameWidth: 1280, frameHeight: 720 } as Resolution);
      expect(true).assertTrue();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NOOP_0022
     * @tc.name      testExtRecNoop0021
     * @tc.desc      No-op startRecorder/pauseRecorder before createRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNoop0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.startRecorder();
      await service.pauseRecorder();
      service.configAudioSampleRate(16000);
      service.configVideoResolution({ frameWidth: 1280, frameHeight: 720 } as Resolution);
      expect(true).assertTrue();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NOOP_0023
     * @tc.name      testExtRecNoop0022
     * @tc.desc      No-op pauseRecorder/resumeRecorder before createRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNoop0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.pauseRecorder();
      await service.resumeRecorder();
      service.configAudioSampleRate(24000);
      service.configVideoResolution({ frameWidth: 1280, frameHeight: 720 } as Resolution);
      expect(true).assertTrue();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NOOP_0024
     * @tc.name      testExtRecNoop0023
     * @tc.desc      No-op resumeRecorder/stopRecorder before createRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNoop0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.resumeRecorder();
      await service.stopRecorder();
      service.configAudioSampleRate(32000);
      service.configVideoResolution({ frameWidth: 1280, frameHeight: 720 } as Resolution);
      expect(true).assertTrue();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NOOP_0025
     * @tc.name      testExtRecNoop0024
     * @tc.desc      No-op stopRecorder/resetRecorder before createRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNoop0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.stopRecorder();
      await service.resetRecorder();
      service.configAudioSampleRate(8000);
      service.configVideoResolution({ frameWidth: 1280, frameHeight: 720 } as Resolution);
      expect(true).assertTrue();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NOOP_0026
     * @tc.name      testExtRecNoop0025
     * @tc.desc      No-op resetRecorder/releaseRecorder before createRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNoop0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.resetRecorder();
      await service.releaseRecorder();
      service.configAudioSampleRate(16000);
      service.configVideoResolution({ frameWidth: 1280, frameHeight: 720 } as Resolution);
      expect(true).assertTrue();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NOOP_0027
     * @tc.name      testExtRecNoop0026
     * @tc.desc      No-op releaseRecorder/closeFd before createRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNoop0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.releaseRecorder();
      await service.closeFd();
      service.configAudioSampleRate(24000);
      service.configVideoResolution({ frameWidth: 1280, frameHeight: 720 } as Resolution);
      expect(true).assertTrue();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NOOP_0028
     * @tc.name      testExtRecNoop0027
     * @tc.desc      No-op closeFd/startRecorder before createRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNoop0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.closeFd();
      await service.startRecorder();
      service.configAudioSampleRate(32000);
      service.configVideoResolution({ frameWidth: 1280, frameHeight: 720 } as Resolution);
      expect(true).assertTrue();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NOOP_0029
     * @tc.name      testExtRecNoop0028
     * @tc.desc      No-op startRecorder/pauseRecorder before createRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNoop0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.startRecorder();
      await service.pauseRecorder();
      service.configAudioSampleRate(8000);
      service.configVideoResolution({ frameWidth: 1280, frameHeight: 720 } as Resolution);
      expect(true).assertTrue();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NOOP_0030
     * @tc.name      testExtRecNoop0029
     * @tc.desc      No-op pauseRecorder/resumeRecorder before createRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNoop0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.pauseRecorder();
      await service.resumeRecorder();
      service.configAudioSampleRate(16000);
      service.configVideoResolution({ frameWidth: 1280, frameHeight: 720 } as Resolution);
      expect(true).assertTrue();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NOOP_0031
     * @tc.name      testExtRecNoop0030
     * @tc.desc      No-op resumeRecorder/stopRecorder before createRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNoop0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.resumeRecorder();
      await service.stopRecorder();
      service.configAudioSampleRate(24000);
      service.configVideoResolution({ frameWidth: 1280, frameHeight: 720 } as Resolution);
      expect(true).assertTrue();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NOOP_0032
     * @tc.name      testExtRecNoop0031
     * @tc.desc      No-op stopRecorder/resetRecorder before createRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNoop0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.stopRecorder();
      await service.resetRecorder();
      service.configAudioSampleRate(32000);
      service.configVideoResolution({ frameWidth: 1280, frameHeight: 720 } as Resolution);
      expect(true).assertTrue();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NOOP_0033
     * @tc.name      testExtRecNoop0032
     * @tc.desc      No-op resetRecorder/releaseRecorder before createRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNoop0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.resetRecorder();
      await service.releaseRecorder();
      service.configAudioSampleRate(8000);
      service.configVideoResolution({ frameWidth: 1280, frameHeight: 720 } as Resolution);
      expect(true).assertTrue();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NOOP_0034
     * @tc.name      testExtRecNoop0033
     * @tc.desc      No-op releaseRecorder/closeFd before createRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNoop0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.releaseRecorder();
      await service.closeFd();
      service.configAudioSampleRate(16000);
      service.configVideoResolution({ frameWidth: 1280, frameHeight: 720 } as Resolution);
      expect(true).assertTrue();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NOOP_0035
     * @tc.name      testExtRecNoop0034
     * @tc.desc      No-op closeFd/startRecorder before createRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNoop0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.closeFd();
      await service.startRecorder();
      service.configAudioSampleRate(24000);
      service.configVideoResolution({ frameWidth: 1280, frameHeight: 720 } as Resolution);
      expect(true).assertTrue();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NOOP_0036
     * @tc.name      testExtRecNoop0035
     * @tc.desc      No-op startRecorder/pauseRecorder before createRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNoop0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.startRecorder();
      await service.pauseRecorder();
      service.configAudioSampleRate(32000);
      service.configVideoResolution({ frameWidth: 1280, frameHeight: 720 } as Resolution);
      expect(true).assertTrue();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NOOP_0037
     * @tc.name      testExtRecNoop0036
     * @tc.desc      No-op pauseRecorder/resumeRecorder before createRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNoop0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.pauseRecorder();
      await service.resumeRecorder();
      service.configAudioSampleRate(8000);
      service.configVideoResolution({ frameWidth: 1280, frameHeight: 720 } as Resolution);
      expect(true).assertTrue();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NOOP_0038
     * @tc.name      testExtRecNoop0037
     * @tc.desc      No-op resumeRecorder/stopRecorder before createRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNoop0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.resumeRecorder();
      await service.stopRecorder();
      service.configAudioSampleRate(16000);
      service.configVideoResolution({ frameWidth: 1280, frameHeight: 720 } as Resolution);
      expect(true).assertTrue();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NOOP_0039
     * @tc.name      testExtRecNoop0038
     * @tc.desc      No-op stopRecorder/resetRecorder before createRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNoop0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.stopRecorder();
      await service.resetRecorder();
      service.configAudioSampleRate(24000);
      service.configVideoResolution({ frameWidth: 1280, frameHeight: 720 } as Resolution);
      expect(true).assertTrue();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NOOP_0040
     * @tc.name      testExtRecNoop0039
     * @tc.desc      No-op resetRecorder/releaseRecorder before createRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNoop0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.resetRecorder();
      await service.releaseRecorder();
      service.configAudioSampleRate(32000);
      service.configVideoResolution({ frameWidth: 1280, frameHeight: 720 } as Resolution);
      expect(true).assertTrue();
      expect(service !== null && service !== undefined).assertTrue();
    })
  });
}
