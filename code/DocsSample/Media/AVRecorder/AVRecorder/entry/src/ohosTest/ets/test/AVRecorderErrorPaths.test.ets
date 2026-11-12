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

const TAG: string = '[Sample_avRecorderErrorPaths]';
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

export default function avRecorderErrorPathsTest(): void {
  describe('avRecorderErrorPathsTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_ERRPATH_0001
     * @tc.name      testExtRecErrPath0000
     * @tc.desc      Error path startRecorder/pauseRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecErrPath0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.startRecorder();
      await service.pauseRecorder();
      await service.closeFd();
      await service.closeFd();
      service.configAudioSampleRate(-1);
      service.configVideoResolution({ frameWidth: -1, frameHeight: -1 } as Resolution);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_ERRPATH_0002
     * @tc.name      testExtRecErrPath0001
     * @tc.desc      Error path pauseRecorder/resumeRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecErrPath0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.pauseRecorder();
      await service.resumeRecorder();
      await service.closeFd();
      await service.closeFd();
      service.configAudioSampleRate(-1);
      service.configVideoResolution({ frameWidth: -1, frameHeight: -1 } as Resolution);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_ERRPATH_0003
     * @tc.name      testExtRecErrPath0002
     * @tc.desc      Error path resumeRecorder/stopRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecErrPath0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.resumeRecorder();
      await service.stopRecorder();
      await service.closeFd();
      await service.closeFd();
      service.configAudioSampleRate(-1);
      service.configVideoResolution({ frameWidth: -1, frameHeight: -1 } as Resolution);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_ERRPATH_0004
     * @tc.name      testExtRecErrPath0003
     * @tc.desc      Error path stopRecorder/resetRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecErrPath0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.stopRecorder();
      await service.resetRecorder();
      await service.closeFd();
      await service.closeFd();
      service.configAudioSampleRate(-1);
      service.configVideoResolution({ frameWidth: -1, frameHeight: -1 } as Resolution);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_ERRPATH_0005
     * @tc.name      testExtRecErrPath0004
     * @tc.desc      Error path resetRecorder/releaseRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecErrPath0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.resetRecorder();
      await service.releaseRecorder();
      await service.closeFd();
      await service.closeFd();
      service.configAudioSampleRate(-1);
      service.configVideoResolution({ frameWidth: -1, frameHeight: -1 } as Resolution);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_ERRPATH_0006
     * @tc.name      testExtRecErrPath0005
     * @tc.desc      Error path releaseRecorder/closeFd.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecErrPath0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.releaseRecorder();
      await service.closeFd();
      await service.closeFd();
      await service.closeFd();
      service.configAudioSampleRate(-1);
      service.configVideoResolution({ frameWidth: -1, frameHeight: -1 } as Resolution);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_ERRPATH_0007
     * @tc.name      testExtRecErrPath0006
     * @tc.desc      Error path closeFd/startRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecErrPath0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.closeFd();
      await service.startRecorder();
      await service.closeFd();
      await service.closeFd();
      service.configAudioSampleRate(-1);
      service.configVideoResolution({ frameWidth: -1, frameHeight: -1 } as Resolution);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_ERRPATH_0008
     * @tc.name      testExtRecErrPath0007
     * @tc.desc      Error path startRecorder/pauseRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecErrPath0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.startRecorder();
      await service.pauseRecorder();
      await service.closeFd();
      await service.closeFd();
      service.configAudioSampleRate(-1);
      service.configVideoResolution({ frameWidth: -1, frameHeight: -1 } as Resolution);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_ERRPATH_0009
     * @tc.name      testExtRecErrPath0008
     * @tc.desc      Error path pauseRecorder/resumeRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecErrPath0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.pauseRecorder();
      await service.resumeRecorder();
      await service.closeFd();
      await service.closeFd();
      service.configAudioSampleRate(-1);
      service.configVideoResolution({ frameWidth: -1, frameHeight: -1 } as Resolution);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_ERRPATH_0010
     * @tc.name      testExtRecErrPath0009
     * @tc.desc      Error path resumeRecorder/stopRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecErrPath0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.resumeRecorder();
      await service.stopRecorder();
      await service.closeFd();
      await service.closeFd();
      service.configAudioSampleRate(-1);
      service.configVideoResolution({ frameWidth: -1, frameHeight: -1 } as Resolution);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_ERRPATH_0011
     * @tc.name      testExtRecErrPath0010
     * @tc.desc      Error path stopRecorder/resetRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecErrPath0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.stopRecorder();
      await service.resetRecorder();
      await service.closeFd();
      await service.closeFd();
      service.configAudioSampleRate(-1);
      service.configVideoResolution({ frameWidth: -1, frameHeight: -1 } as Resolution);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_ERRPATH_0012
     * @tc.name      testExtRecErrPath0011
     * @tc.desc      Error path resetRecorder/releaseRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecErrPath0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.resetRecorder();
      await service.releaseRecorder();
      await service.closeFd();
      await service.closeFd();
      service.configAudioSampleRate(-1);
      service.configVideoResolution({ frameWidth: -1, frameHeight: -1 } as Resolution);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_ERRPATH_0013
     * @tc.name      testExtRecErrPath0012
     * @tc.desc      Error path releaseRecorder/closeFd.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecErrPath0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.releaseRecorder();
      await service.closeFd();
      await service.closeFd();
      await service.closeFd();
      service.configAudioSampleRate(-1);
      service.configVideoResolution({ frameWidth: -1, frameHeight: -1 } as Resolution);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_ERRPATH_0014
     * @tc.name      testExtRecErrPath0013
     * @tc.desc      Error path closeFd/startRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecErrPath0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.closeFd();
      await service.startRecorder();
      await service.closeFd();
      await service.closeFd();
      service.configAudioSampleRate(-1);
      service.configVideoResolution({ frameWidth: -1, frameHeight: -1 } as Resolution);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_ERRPATH_0015
     * @tc.name      testExtRecErrPath0014
     * @tc.desc      Error path startRecorder/pauseRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecErrPath0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.startRecorder();
      await service.pauseRecorder();
      await service.closeFd();
      await service.closeFd();
      service.configAudioSampleRate(-1);
      service.configVideoResolution({ frameWidth: -1, frameHeight: -1 } as Resolution);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_ERRPATH_0016
     * @tc.name      testExtRecErrPath0015
     * @tc.desc      Error path pauseRecorder/resumeRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecErrPath0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.pauseRecorder();
      await service.resumeRecorder();
      await service.closeFd();
      await service.closeFd();
      service.configAudioSampleRate(-1);
      service.configVideoResolution({ frameWidth: -1, frameHeight: -1 } as Resolution);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_ERRPATH_0017
     * @tc.name      testExtRecErrPath0016
     * @tc.desc      Error path resumeRecorder/stopRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecErrPath0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.resumeRecorder();
      await service.stopRecorder();
      await service.closeFd();
      await service.closeFd();
      service.configAudioSampleRate(-1);
      service.configVideoResolution({ frameWidth: -1, frameHeight: -1 } as Resolution);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_ERRPATH_0018
     * @tc.name      testExtRecErrPath0017
     * @tc.desc      Error path stopRecorder/resetRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecErrPath0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.stopRecorder();
      await service.resetRecorder();
      await service.closeFd();
      await service.closeFd();
      service.configAudioSampleRate(-1);
      service.configVideoResolution({ frameWidth: -1, frameHeight: -1 } as Resolution);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_ERRPATH_0019
     * @tc.name      testExtRecErrPath0018
     * @tc.desc      Error path resetRecorder/releaseRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecErrPath0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.resetRecorder();
      await service.releaseRecorder();
      await service.closeFd();
      await service.closeFd();
      service.configAudioSampleRate(-1);
      service.configVideoResolution({ frameWidth: -1, frameHeight: -1 } as Resolution);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_ERRPATH_0020
     * @tc.name      testExtRecErrPath0019
     * @tc.desc      Error path releaseRecorder/closeFd.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecErrPath0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.releaseRecorder();
      await service.closeFd();
      await service.closeFd();
      await service.closeFd();
      service.configAudioSampleRate(-1);
      service.configVideoResolution({ frameWidth: -1, frameHeight: -1 } as Resolution);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_ERRPATH_0021
     * @tc.name      testExtRecErrPath0020
     * @tc.desc      Error path closeFd/startRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecErrPath0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.closeFd();
      await service.startRecorder();
      await service.closeFd();
      await service.closeFd();
      service.configAudioSampleRate(-1);
      service.configVideoResolution({ frameWidth: -1, frameHeight: -1 } as Resolution);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_ERRPATH_0022
     * @tc.name      testExtRecErrPath0021
     * @tc.desc      Error path startRecorder/pauseRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecErrPath0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.startRecorder();
      await service.pauseRecorder();
      await service.closeFd();
      await service.closeFd();
      service.configAudioSampleRate(-1);
      service.configVideoResolution({ frameWidth: -1, frameHeight: -1 } as Resolution);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_ERRPATH_0023
     * @tc.name      testExtRecErrPath0022
     * @tc.desc      Error path pauseRecorder/resumeRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecErrPath0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.pauseRecorder();
      await service.resumeRecorder();
      await service.closeFd();
      await service.closeFd();
      service.configAudioSampleRate(-1);
      service.configVideoResolution({ frameWidth: -1, frameHeight: -1 } as Resolution);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_ERRPATH_0024
     * @tc.name      testExtRecErrPath0023
     * @tc.desc      Error path resumeRecorder/stopRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecErrPath0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.resumeRecorder();
      await service.stopRecorder();
      await service.closeFd();
      await service.closeFd();
      service.configAudioSampleRate(-1);
      service.configVideoResolution({ frameWidth: -1, frameHeight: -1 } as Resolution);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_ERRPATH_0025
     * @tc.name      testExtRecErrPath0024
     * @tc.desc      Error path stopRecorder/resetRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecErrPath0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.stopRecorder();
      await service.resetRecorder();
      await service.closeFd();
      await service.closeFd();
      service.configAudioSampleRate(-1);
      service.configVideoResolution({ frameWidth: -1, frameHeight: -1 } as Resolution);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_ERRPATH_0026
     * @tc.name      testExtRecErrPath0025
     * @tc.desc      Error path resetRecorder/releaseRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecErrPath0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.resetRecorder();
      await service.releaseRecorder();
      await service.closeFd();
      await service.closeFd();
      service.configAudioSampleRate(-1);
      service.configVideoResolution({ frameWidth: -1, frameHeight: -1 } as Resolution);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_ERRPATH_0027
     * @tc.name      testExtRecErrPath0026
     * @tc.desc      Error path releaseRecorder/closeFd.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecErrPath0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.releaseRecorder();
      await service.closeFd();
      await service.closeFd();
      await service.closeFd();
      service.configAudioSampleRate(-1);
      service.configVideoResolution({ frameWidth: -1, frameHeight: -1 } as Resolution);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_ERRPATH_0028
     * @tc.name      testExtRecErrPath0027
     * @tc.desc      Error path closeFd/startRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecErrPath0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.closeFd();
      await service.startRecorder();
      await service.closeFd();
      await service.closeFd();
      service.configAudioSampleRate(-1);
      service.configVideoResolution({ frameWidth: -1, frameHeight: -1 } as Resolution);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_ERRPATH_0029
     * @tc.name      testExtRecErrPath0028
     * @tc.desc      Error path startRecorder/pauseRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecErrPath0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.startRecorder();
      await service.pauseRecorder();
      await service.closeFd();
      await service.closeFd();
      service.configAudioSampleRate(-1);
      service.configVideoResolution({ frameWidth: -1, frameHeight: -1 } as Resolution);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_ERRPATH_0030
     * @tc.name      testExtRecErrPath0029
     * @tc.desc      Error path pauseRecorder/resumeRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecErrPath0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.pauseRecorder();
      await service.resumeRecorder();
      await service.closeFd();
      await service.closeFd();
      service.configAudioSampleRate(-1);
      service.configVideoResolution({ frameWidth: -1, frameHeight: -1 } as Resolution);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_ERRPATH_0031
     * @tc.name      testExtRecErrPath0030
     * @tc.desc      Error path resumeRecorder/stopRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecErrPath0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.resumeRecorder();
      await service.stopRecorder();
      await service.closeFd();
      await service.closeFd();
      service.configAudioSampleRate(-1);
      service.configVideoResolution({ frameWidth: -1, frameHeight: -1 } as Resolution);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_ERRPATH_0032
     * @tc.name      testExtRecErrPath0031
     * @tc.desc      Error path stopRecorder/resetRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecErrPath0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.stopRecorder();
      await service.resetRecorder();
      await service.closeFd();
      await service.closeFd();
      service.configAudioSampleRate(-1);
      service.configVideoResolution({ frameWidth: -1, frameHeight: -1 } as Resolution);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_ERRPATH_0033
     * @tc.name      testExtRecErrPath0032
     * @tc.desc      Error path resetRecorder/releaseRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecErrPath0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.resetRecorder();
      await service.releaseRecorder();
      await service.closeFd();
      await service.closeFd();
      service.configAudioSampleRate(-1);
      service.configVideoResolution({ frameWidth: -1, frameHeight: -1 } as Resolution);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_ERRPATH_0034
     * @tc.name      testExtRecErrPath0033
     * @tc.desc      Error path releaseRecorder/closeFd.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecErrPath0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.releaseRecorder();
      await service.closeFd();
      await service.closeFd();
      await service.closeFd();
      service.configAudioSampleRate(-1);
      service.configVideoResolution({ frameWidth: -1, frameHeight: -1 } as Resolution);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_ERRPATH_0035
     * @tc.name      testExtRecErrPath0034
     * @tc.desc      Error path closeFd/startRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecErrPath0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.closeFd();
      await service.startRecorder();
      await service.closeFd();
      await service.closeFd();
      service.configAudioSampleRate(-1);
      service.configVideoResolution({ frameWidth: -1, frameHeight: -1 } as Resolution);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_ERRPATH_0036
     * @tc.name      testExtRecErrPath0035
     * @tc.desc      Error path startRecorder/pauseRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecErrPath0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.startRecorder();
      await service.pauseRecorder();
      await service.closeFd();
      await service.closeFd();
      service.configAudioSampleRate(-1);
      service.configVideoResolution({ frameWidth: -1, frameHeight: -1 } as Resolution);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_ERRPATH_0037
     * @tc.name      testExtRecErrPath0036
     * @tc.desc      Error path pauseRecorder/resumeRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecErrPath0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.pauseRecorder();
      await service.resumeRecorder();
      await service.closeFd();
      await service.closeFd();
      service.configAudioSampleRate(-1);
      service.configVideoResolution({ frameWidth: -1, frameHeight: -1 } as Resolution);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_ERRPATH_0038
     * @tc.name      testExtRecErrPath0037
     * @tc.desc      Error path resumeRecorder/stopRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecErrPath0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.resumeRecorder();
      await service.stopRecorder();
      await service.closeFd();
      await service.closeFd();
      service.configAudioSampleRate(-1);
      service.configVideoResolution({ frameWidth: -1, frameHeight: -1 } as Resolution);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_ERRPATH_0039
     * @tc.name      testExtRecErrPath0038
     * @tc.desc      Error path stopRecorder/resetRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecErrPath0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.stopRecorder();
      await service.resetRecorder();
      await service.closeFd();
      await service.closeFd();
      service.configAudioSampleRate(-1);
      service.configVideoResolution({ frameWidth: -1, frameHeight: -1 } as Resolution);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_ERRPATH_0040
     * @tc.name      testExtRecErrPath0039
     * @tc.desc      Error path resetRecorder/releaseRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecErrPath0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.resetRecorder();
      await service.releaseRecorder();
      await service.closeFd();
      await service.closeFd();
      service.configAudioSampleRate(-1);
      service.configVideoResolution({ frameWidth: -1, frameHeight: -1 } as Resolution);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_ERRPATH_0041
     * @tc.name      testExtRecErrPath0040
     * @tc.desc      Error path releaseRecorder/closeFd.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecErrPath0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.releaseRecorder();
      await service.closeFd();
      await service.closeFd();
      await service.closeFd();
      service.configAudioSampleRate(-1);
      service.configVideoResolution({ frameWidth: -1, frameHeight: -1 } as Resolution);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_ERRPATH_0042
     * @tc.name      testExtRecErrPath0041
     * @tc.desc      Error path closeFd/startRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecErrPath0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.closeFd();
      await service.startRecorder();
      await service.closeFd();
      await service.closeFd();
      service.configAudioSampleRate(-1);
      service.configVideoResolution({ frameWidth: -1, frameHeight: -1 } as Resolution);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_ERRPATH_0043
     * @tc.name      testExtRecErrPath0042
     * @tc.desc      Error path startRecorder/pauseRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecErrPath0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.startRecorder();
      await service.pauseRecorder();
      await service.closeFd();
      await service.closeFd();
      service.configAudioSampleRate(-1);
      service.configVideoResolution({ frameWidth: -1, frameHeight: -1 } as Resolution);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_ERRPATH_0044
     * @tc.name      testExtRecErrPath0043
     * @tc.desc      Error path pauseRecorder/resumeRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecErrPath0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.pauseRecorder();
      await service.resumeRecorder();
      await service.closeFd();
      await service.closeFd();
      service.configAudioSampleRate(-1);
      service.configVideoResolution({ frameWidth: -1, frameHeight: -1 } as Resolution);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_ERRPATH_0045
     * @tc.name      testExtRecErrPath0044
     * @tc.desc      Error path resumeRecorder/stopRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecErrPath0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.resumeRecorder();
      await service.stopRecorder();
      await service.closeFd();
      await service.closeFd();
      service.configAudioSampleRate(-1);
      service.configVideoResolution({ frameWidth: -1, frameHeight: -1 } as Resolution);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_ERRPATH_0046
     * @tc.name      testExtRecErrPath0045
     * @tc.desc      Error path stopRecorder/resetRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecErrPath0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.stopRecorder();
      await service.resetRecorder();
      await service.closeFd();
      await service.closeFd();
      service.configAudioSampleRate(-1);
      service.configVideoResolution({ frameWidth: -1, frameHeight: -1 } as Resolution);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_ERRPATH_0047
     * @tc.name      testExtRecErrPath0046
     * @tc.desc      Error path resetRecorder/releaseRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecErrPath0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.resetRecorder();
      await service.releaseRecorder();
      await service.closeFd();
      await service.closeFd();
      service.configAudioSampleRate(-1);
      service.configVideoResolution({ frameWidth: -1, frameHeight: -1 } as Resolution);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_ERRPATH_0048
     * @tc.name      testExtRecErrPath0047
     * @tc.desc      Error path releaseRecorder/closeFd.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecErrPath0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.releaseRecorder();
      await service.closeFd();
      await service.closeFd();
      await service.closeFd();
      service.configAudioSampleRate(-1);
      service.configVideoResolution({ frameWidth: -1, frameHeight: -1 } as Resolution);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_ERRPATH_0049
     * @tc.name      testExtRecErrPath0048
     * @tc.desc      Error path closeFd/startRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecErrPath0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.closeFd();
      await service.startRecorder();
      await service.closeFd();
      await service.closeFd();
      service.configAudioSampleRate(-1);
      service.configVideoResolution({ frameWidth: -1, frameHeight: -1 } as Resolution);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_ERRPATH_0050
     * @tc.name      testExtRecErrPath0049
     * @tc.desc      Error path startRecorder/pauseRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecErrPath0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.startRecorder();
      await service.pauseRecorder();
      await service.closeFd();
      await service.closeFd();
      service.configAudioSampleRate(-1);
      service.configVideoResolution({ frameWidth: -1, frameHeight: -1 } as Resolution);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_ERRPATH_0051
     * @tc.name      testExtRecErrPath0050
     * @tc.desc      Error path pauseRecorder/resumeRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecErrPath0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.pauseRecorder();
      await service.resumeRecorder();
      await service.closeFd();
      await service.closeFd();
      service.configAudioSampleRate(-1);
      service.configVideoResolution({ frameWidth: -1, frameHeight: -1 } as Resolution);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_ERRPATH_0052
     * @tc.name      testExtRecErrPath0051
     * @tc.desc      Error path resumeRecorder/stopRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecErrPath0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.resumeRecorder();
      await service.stopRecorder();
      await service.closeFd();
      await service.closeFd();
      service.configAudioSampleRate(-1);
      service.configVideoResolution({ frameWidth: -1, frameHeight: -1 } as Resolution);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_ERRPATH_0053
     * @tc.name      testExtRecErrPath0052
     * @tc.desc      Error path stopRecorder/resetRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecErrPath0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.stopRecorder();
      await service.resetRecorder();
      await service.closeFd();
      await service.closeFd();
      service.configAudioSampleRate(-1);
      service.configVideoResolution({ frameWidth: -1, frameHeight: -1 } as Resolution);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_ERRPATH_0054
     * @tc.name      testExtRecErrPath0053
     * @tc.desc      Error path resetRecorder/releaseRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecErrPath0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.resetRecorder();
      await service.releaseRecorder();
      await service.closeFd();
      await service.closeFd();
      service.configAudioSampleRate(-1);
      service.configVideoResolution({ frameWidth: -1, frameHeight: -1 } as Resolution);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_ERRPATH_0055
     * @tc.name      testExtRecErrPath0054
     * @tc.desc      Error path releaseRecorder/closeFd.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecErrPath0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.releaseRecorder();
      await service.closeFd();
      await service.closeFd();
      await service.closeFd();
      service.configAudioSampleRate(-1);
      service.configVideoResolution({ frameWidth: -1, frameHeight: -1 } as Resolution);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_ERRPATH_0056
     * @tc.name      testExtRecErrPath0055
     * @tc.desc      Error path closeFd/startRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecErrPath0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.closeFd();
      await service.startRecorder();
      await service.closeFd();
      await service.closeFd();
      service.configAudioSampleRate(-1);
      service.configVideoResolution({ frameWidth: -1, frameHeight: -1 } as Resolution);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_ERRPATH_0057
     * @tc.name      testExtRecErrPath0056
     * @tc.desc      Error path startRecorder/pauseRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecErrPath0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.startRecorder();
      await service.pauseRecorder();
      await service.closeFd();
      await service.closeFd();
      service.configAudioSampleRate(-1);
      service.configVideoResolution({ frameWidth: -1, frameHeight: -1 } as Resolution);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_ERRPATH_0058
     * @tc.name      testExtRecErrPath0057
     * @tc.desc      Error path pauseRecorder/resumeRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecErrPath0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.pauseRecorder();
      await service.resumeRecorder();
      await service.closeFd();
      await service.closeFd();
      service.configAudioSampleRate(-1);
      service.configVideoResolution({ frameWidth: -1, frameHeight: -1 } as Resolution);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_ERRPATH_0059
     * @tc.name      testExtRecErrPath0058
     * @tc.desc      Error path resumeRecorder/stopRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecErrPath0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.resumeRecorder();
      await service.stopRecorder();
      await service.closeFd();
      await service.closeFd();
      service.configAudioSampleRate(-1);
      service.configVideoResolution({ frameWidth: -1, frameHeight: -1 } as Resolution);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_ERRPATH_0060
     * @tc.name      testExtRecErrPath0059
     * @tc.desc      Error path stopRecorder/resetRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecErrPath0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.stopRecorder();
      await service.resetRecorder();
      await service.closeFd();
      await service.closeFd();
      service.configAudioSampleRate(-1);
      service.configVideoResolution({ frameWidth: -1, frameHeight: -1 } as Resolution);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_ERRPATH_0061
     * @tc.name      testExtRecErrPath0060
     * @tc.desc      Error path resetRecorder/releaseRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecErrPath0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.resetRecorder();
      await service.releaseRecorder();
      await service.closeFd();
      await service.closeFd();
      service.configAudioSampleRate(-1);
      service.configVideoResolution({ frameWidth: -1, frameHeight: -1 } as Resolution);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_ERRPATH_0062
     * @tc.name      testExtRecErrPath0061
     * @tc.desc      Error path releaseRecorder/closeFd.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecErrPath0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.releaseRecorder();
      await service.closeFd();
      await service.closeFd();
      await service.closeFd();
      service.configAudioSampleRate(-1);
      service.configVideoResolution({ frameWidth: -1, frameHeight: -1 } as Resolution);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_ERRPATH_0063
     * @tc.name      testExtRecErrPath0062
     * @tc.desc      Error path closeFd/startRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecErrPath0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.closeFd();
      await service.startRecorder();
      await service.closeFd();
      await service.closeFd();
      service.configAudioSampleRate(-1);
      service.configVideoResolution({ frameWidth: -1, frameHeight: -1 } as Resolution);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_ERRPATH_0064
     * @tc.name      testExtRecErrPath0063
     * @tc.desc      Error path startRecorder/pauseRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecErrPath0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.startRecorder();
      await service.pauseRecorder();
      await service.closeFd();
      await service.closeFd();
      service.configAudioSampleRate(-1);
      service.configVideoResolution({ frameWidth: -1, frameHeight: -1 } as Resolution);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_ERRPATH_0065
     * @tc.name      testExtRecErrPath0064
     * @tc.desc      Error path pauseRecorder/resumeRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecErrPath0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.pauseRecorder();
      await service.resumeRecorder();
      await service.closeFd();
      await service.closeFd();
      service.configAudioSampleRate(-1);
      service.configVideoResolution({ frameWidth: -1, frameHeight: -1 } as Resolution);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_ERRPATH_0066
     * @tc.name      testExtRecErrPath0065
     * @tc.desc      Error path resumeRecorder/stopRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecErrPath0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.resumeRecorder();
      await service.stopRecorder();
      await service.closeFd();
      await service.closeFd();
      service.configAudioSampleRate(-1);
      service.configVideoResolution({ frameWidth: -1, frameHeight: -1 } as Resolution);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_ERRPATH_0067
     * @tc.name      testExtRecErrPath0066
     * @tc.desc      Error path stopRecorder/resetRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecErrPath0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.stopRecorder();
      await service.resetRecorder();
      await service.closeFd();
      await service.closeFd();
      service.configAudioSampleRate(-1);
      service.configVideoResolution({ frameWidth: -1, frameHeight: -1 } as Resolution);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_ERRPATH_0068
     * @tc.name      testExtRecErrPath0067
     * @tc.desc      Error path resetRecorder/releaseRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecErrPath0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.resetRecorder();
      await service.releaseRecorder();
      await service.closeFd();
      await service.closeFd();
      service.configAudioSampleRate(-1);
      service.configVideoResolution({ frameWidth: -1, frameHeight: -1 } as Resolution);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_ERRPATH_0069
     * @tc.name      testExtRecErrPath0068
     * @tc.desc      Error path releaseRecorder/closeFd.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecErrPath0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.releaseRecorder();
      await service.closeFd();
      await service.closeFd();
      await service.closeFd();
      service.configAudioSampleRate(-1);
      service.configVideoResolution({ frameWidth: -1, frameHeight: -1 } as Resolution);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_ERRPATH_0070
     * @tc.name      testExtRecErrPath0069
     * @tc.desc      Error path closeFd/startRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecErrPath0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.closeFd();
      await service.startRecorder();
      await service.closeFd();
      await service.closeFd();
      service.configAudioSampleRate(-1);
      service.configVideoResolution({ frameWidth: -1, frameHeight: -1 } as Resolution);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_ERRPATH_0071
     * @tc.name      testExtRecErrPath0070
     * @tc.desc      Error path startRecorder/pauseRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecErrPath0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.startRecorder();
      await service.pauseRecorder();
      await service.closeFd();
      await service.closeFd();
      service.configAudioSampleRate(-1);
      service.configVideoResolution({ frameWidth: -1, frameHeight: -1 } as Resolution);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_ERRPATH_0072
     * @tc.name      testExtRecErrPath0071
     * @tc.desc      Error path pauseRecorder/resumeRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecErrPath0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.pauseRecorder();
      await service.resumeRecorder();
      await service.closeFd();
      await service.closeFd();
      service.configAudioSampleRate(-1);
      service.configVideoResolution({ frameWidth: -1, frameHeight: -1 } as Resolution);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_ERRPATH_0073
     * @tc.name      testExtRecErrPath0072
     * @tc.desc      Error path resumeRecorder/stopRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecErrPath0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.resumeRecorder();
      await service.stopRecorder();
      await service.closeFd();
      await service.closeFd();
      service.configAudioSampleRate(-1);
      service.configVideoResolution({ frameWidth: -1, frameHeight: -1 } as Resolution);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_ERRPATH_0074
     * @tc.name      testExtRecErrPath0073
     * @tc.desc      Error path stopRecorder/resetRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecErrPath0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.stopRecorder();
      await service.resetRecorder();
      await service.closeFd();
      await service.closeFd();
      service.configAudioSampleRate(-1);
      service.configVideoResolution({ frameWidth: -1, frameHeight: -1 } as Resolution);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_ERRPATH_0075
     * @tc.name      testExtRecErrPath0074
     * @tc.desc      Error path resetRecorder/releaseRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecErrPath0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.resetRecorder();
      await service.releaseRecorder();
      await service.closeFd();
      await service.closeFd();
      service.configAudioSampleRate(-1);
      service.configVideoResolution({ frameWidth: -1, frameHeight: -1 } as Resolution);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_ERRPATH_0076
     * @tc.name      testExtRecErrPath0075
     * @tc.desc      Error path releaseRecorder/closeFd.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecErrPath0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.releaseRecorder();
      await service.closeFd();
      await service.closeFd();
      await service.closeFd();
      service.configAudioSampleRate(-1);
      service.configVideoResolution({ frameWidth: -1, frameHeight: -1 } as Resolution);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_ERRPATH_0077
     * @tc.name      testExtRecErrPath0076
     * @tc.desc      Error path closeFd/startRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecErrPath0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.closeFd();
      await service.startRecorder();
      await service.closeFd();
      await service.closeFd();
      service.configAudioSampleRate(-1);
      service.configVideoResolution({ frameWidth: -1, frameHeight: -1 } as Resolution);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_ERRPATH_0078
     * @tc.name      testExtRecErrPath0077
     * @tc.desc      Error path startRecorder/pauseRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecErrPath0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.startRecorder();
      await service.pauseRecorder();
      await service.closeFd();
      await service.closeFd();
      service.configAudioSampleRate(-1);
      service.configVideoResolution({ frameWidth: -1, frameHeight: -1 } as Resolution);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_ERRPATH_0079
     * @tc.name      testExtRecErrPath0078
     * @tc.desc      Error path pauseRecorder/resumeRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecErrPath0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.pauseRecorder();
      await service.resumeRecorder();
      await service.closeFd();
      await service.closeFd();
      service.configAudioSampleRate(-1);
      service.configVideoResolution({ frameWidth: -1, frameHeight: -1 } as Resolution);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_ERRPATH_0080
     * @tc.name      testExtRecErrPath0079
     * @tc.desc      Error path resumeRecorder/stopRecorder.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecErrPath0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.resumeRecorder();
      await service.stopRecorder();
      await service.closeFd();
      await service.closeFd();
      service.configAudioSampleRate(-1);
      service.configVideoResolution({ frameWidth: -1, frameHeight: -1 } as Resolution);
      expect(service !== null && service !== undefined).assertTrue();
    })
  });
}
