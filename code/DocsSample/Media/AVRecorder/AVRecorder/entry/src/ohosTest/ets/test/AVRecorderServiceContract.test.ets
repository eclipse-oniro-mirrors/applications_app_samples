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

const TAG: string = '[Sample_avRecorderServiceContract]';
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

export default function avRecorderServiceContractTest(): void {
  describe('avRecorderServiceContractTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SERVICE_0001
     * @tc.name      testExtRecService0000
     * @tc.desc      Recorder service contract 8000Hz 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecService0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'fd://0';
      const audioBitrate: number = 112000;
      const videoBitrate: number = 3000000;
      const sampleRate: number = 8000;
      const channels: number = 1;
      const width: number = 640;
      const height: number = 480;
      const orientation: string = '0';
      expect(url.startsWith('fd://')).assertTrue();
      expect(audioBitrate).assertEqual(112000);
      expect(videoBitrate).assertEqual(3000000);
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      expect(orientation.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SERVICE_0002
     * @tc.name      testExtRecService0001
     * @tc.desc      Recorder service contract 22050Hz 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecService0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'fd://0';
      const audioBitrate: number = 112000;
      const videoBitrate: number = 3000000;
      const sampleRate: number = 22050;
      const channels: number = 2;
      const width: number = 1280;
      const height: number = 720;
      const orientation: string = '90';
      expect(url.startsWith('fd://')).assertTrue();
      expect(audioBitrate).assertEqual(112000);
      expect(videoBitrate).assertEqual(3000000);
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      expect(orientation.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SERVICE_0003
     * @tc.name      testExtRecService0002
     * @tc.desc      Recorder service contract 44100Hz 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecService0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'fd://0';
      const audioBitrate: number = 112000;
      const videoBitrate: number = 3000000;
      const sampleRate: number = 44100;
      const channels: number = 1;
      const width: number = 1920;
      const height: number = 1080;
      const orientation: string = '180';
      expect(url.startsWith('fd://')).assertTrue();
      expect(audioBitrate).assertEqual(112000);
      expect(videoBitrate).assertEqual(3000000);
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      expect(orientation.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SERVICE_0004
     * @tc.name      testExtRecService0003
     * @tc.desc      Recorder service contract 48000Hz 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecService0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'fd://0';
      const audioBitrate: number = 112000;
      const videoBitrate: number = 3000000;
      const sampleRate: number = 48000;
      const channels: number = 2;
      const width: number = 640;
      const height: number = 480;
      const orientation: string = '270';
      expect(url.startsWith('fd://')).assertTrue();
      expect(audioBitrate).assertEqual(112000);
      expect(videoBitrate).assertEqual(3000000);
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      expect(orientation.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SERVICE_0005
     * @tc.name      testExtRecService0004
     * @tc.desc      Recorder service contract 96000Hz 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecService0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'fd://0';
      const audioBitrate: number = 112000;
      const videoBitrate: number = 3000000;
      const sampleRate: number = 96000;
      const channels: number = 1;
      const width: number = 1280;
      const height: number = 720;
      const orientation: string = '0';
      expect(url.startsWith('fd://')).assertTrue();
      expect(audioBitrate).assertEqual(112000);
      expect(videoBitrate).assertEqual(3000000);
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      expect(orientation.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SERVICE_0006
     * @tc.name      testExtRecService0005
     * @tc.desc      Recorder service contract 8000Hz 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecService0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'fd://0';
      const audioBitrate: number = 112000;
      const videoBitrate: number = 3000000;
      const sampleRate: number = 8000;
      const channels: number = 2;
      const width: number = 1920;
      const height: number = 1080;
      const orientation: string = '90';
      expect(url.startsWith('fd://')).assertTrue();
      expect(audioBitrate).assertEqual(112000);
      expect(videoBitrate).assertEqual(3000000);
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      expect(orientation.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SERVICE_0007
     * @tc.name      testExtRecService0006
     * @tc.desc      Recorder service contract 22050Hz 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecService0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'fd://0';
      const audioBitrate: number = 112000;
      const videoBitrate: number = 3000000;
      const sampleRate: number = 22050;
      const channels: number = 1;
      const width: number = 640;
      const height: number = 480;
      const orientation: string = '180';
      expect(url.startsWith('fd://')).assertTrue();
      expect(audioBitrate).assertEqual(112000);
      expect(videoBitrate).assertEqual(3000000);
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      expect(orientation.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SERVICE_0008
     * @tc.name      testExtRecService0007
     * @tc.desc      Recorder service contract 44100Hz 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecService0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'fd://0';
      const audioBitrate: number = 112000;
      const videoBitrate: number = 3000000;
      const sampleRate: number = 44100;
      const channels: number = 2;
      const width: number = 1280;
      const height: number = 720;
      const orientation: string = '270';
      expect(url.startsWith('fd://')).assertTrue();
      expect(audioBitrate).assertEqual(112000);
      expect(videoBitrate).assertEqual(3000000);
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      expect(orientation.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SERVICE_0009
     * @tc.name      testExtRecService0008
     * @tc.desc      Recorder service contract 48000Hz 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecService0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'fd://0';
      const audioBitrate: number = 112000;
      const videoBitrate: number = 3000000;
      const sampleRate: number = 48000;
      const channels: number = 1;
      const width: number = 1920;
      const height: number = 1080;
      const orientation: string = '0';
      expect(url.startsWith('fd://')).assertTrue();
      expect(audioBitrate).assertEqual(112000);
      expect(videoBitrate).assertEqual(3000000);
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      expect(orientation.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SERVICE_0010
     * @tc.name      testExtRecService0009
     * @tc.desc      Recorder service contract 96000Hz 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecService0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'fd://0';
      const audioBitrate: number = 112000;
      const videoBitrate: number = 3000000;
      const sampleRate: number = 96000;
      const channels: number = 2;
      const width: number = 640;
      const height: number = 480;
      const orientation: string = '90';
      expect(url.startsWith('fd://')).assertTrue();
      expect(audioBitrate).assertEqual(112000);
      expect(videoBitrate).assertEqual(3000000);
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      expect(orientation.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SERVICE_0011
     * @tc.name      testExtRecService0010
     * @tc.desc      Recorder service contract 8000Hz 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecService0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'fd://0';
      const audioBitrate: number = 112000;
      const videoBitrate: number = 3000000;
      const sampleRate: number = 8000;
      const channels: number = 1;
      const width: number = 1280;
      const height: number = 720;
      const orientation: string = '180';
      expect(url.startsWith('fd://')).assertTrue();
      expect(audioBitrate).assertEqual(112000);
      expect(videoBitrate).assertEqual(3000000);
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      expect(orientation.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SERVICE_0012
     * @tc.name      testExtRecService0011
     * @tc.desc      Recorder service contract 22050Hz 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecService0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'fd://0';
      const audioBitrate: number = 112000;
      const videoBitrate: number = 3000000;
      const sampleRate: number = 22050;
      const channels: number = 2;
      const width: number = 1920;
      const height: number = 1080;
      const orientation: string = '270';
      expect(url.startsWith('fd://')).assertTrue();
      expect(audioBitrate).assertEqual(112000);
      expect(videoBitrate).assertEqual(3000000);
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      expect(orientation.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SERVICE_0013
     * @tc.name      testExtRecService0012
     * @tc.desc      Recorder service contract 44100Hz 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecService0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'fd://0';
      const audioBitrate: number = 112000;
      const videoBitrate: number = 3000000;
      const sampleRate: number = 44100;
      const channels: number = 1;
      const width: number = 640;
      const height: number = 480;
      const orientation: string = '0';
      expect(url.startsWith('fd://')).assertTrue();
      expect(audioBitrate).assertEqual(112000);
      expect(videoBitrate).assertEqual(3000000);
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      expect(orientation.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SERVICE_0014
     * @tc.name      testExtRecService0013
     * @tc.desc      Recorder service contract 48000Hz 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecService0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'fd://0';
      const audioBitrate: number = 112000;
      const videoBitrate: number = 3000000;
      const sampleRate: number = 48000;
      const channels: number = 2;
      const width: number = 1280;
      const height: number = 720;
      const orientation: string = '90';
      expect(url.startsWith('fd://')).assertTrue();
      expect(audioBitrate).assertEqual(112000);
      expect(videoBitrate).assertEqual(3000000);
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      expect(orientation.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SERVICE_0015
     * @tc.name      testExtRecService0014
     * @tc.desc      Recorder service contract 96000Hz 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecService0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'fd://0';
      const audioBitrate: number = 112000;
      const videoBitrate: number = 3000000;
      const sampleRate: number = 96000;
      const channels: number = 1;
      const width: number = 1920;
      const height: number = 1080;
      const orientation: string = '180';
      expect(url.startsWith('fd://')).assertTrue();
      expect(audioBitrate).assertEqual(112000);
      expect(videoBitrate).assertEqual(3000000);
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      expect(orientation.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SERVICE_0016
     * @tc.name      testExtRecService0015
     * @tc.desc      Recorder service contract 8000Hz 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecService0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'fd://0';
      const audioBitrate: number = 112000;
      const videoBitrate: number = 3000000;
      const sampleRate: number = 8000;
      const channels: number = 2;
      const width: number = 640;
      const height: number = 480;
      const orientation: string = '270';
      expect(url.startsWith('fd://')).assertTrue();
      expect(audioBitrate).assertEqual(112000);
      expect(videoBitrate).assertEqual(3000000);
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      expect(orientation.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SERVICE_0017
     * @tc.name      testExtRecService0016
     * @tc.desc      Recorder service contract 22050Hz 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecService0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'fd://0';
      const audioBitrate: number = 112000;
      const videoBitrate: number = 3000000;
      const sampleRate: number = 22050;
      const channels: number = 1;
      const width: number = 1280;
      const height: number = 720;
      const orientation: string = '0';
      expect(url.startsWith('fd://')).assertTrue();
      expect(audioBitrate).assertEqual(112000);
      expect(videoBitrate).assertEqual(3000000);
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      expect(orientation.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SERVICE_0018
     * @tc.name      testExtRecService0017
     * @tc.desc      Recorder service contract 44100Hz 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecService0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'fd://0';
      const audioBitrate: number = 112000;
      const videoBitrate: number = 3000000;
      const sampleRate: number = 44100;
      const channels: number = 2;
      const width: number = 1920;
      const height: number = 1080;
      const orientation: string = '90';
      expect(url.startsWith('fd://')).assertTrue();
      expect(audioBitrate).assertEqual(112000);
      expect(videoBitrate).assertEqual(3000000);
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      expect(orientation.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SERVICE_0019
     * @tc.name      testExtRecService0018
     * @tc.desc      Recorder service contract 48000Hz 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecService0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'fd://0';
      const audioBitrate: number = 112000;
      const videoBitrate: number = 3000000;
      const sampleRate: number = 48000;
      const channels: number = 1;
      const width: number = 640;
      const height: number = 480;
      const orientation: string = '180';
      expect(url.startsWith('fd://')).assertTrue();
      expect(audioBitrate).assertEqual(112000);
      expect(videoBitrate).assertEqual(3000000);
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      expect(orientation.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SERVICE_0020
     * @tc.name      testExtRecService0019
     * @tc.desc      Recorder service contract 96000Hz 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecService0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'fd://0';
      const audioBitrate: number = 112000;
      const videoBitrate: number = 3000000;
      const sampleRate: number = 96000;
      const channels: number = 2;
      const width: number = 1280;
      const height: number = 720;
      const orientation: string = '270';
      expect(url.startsWith('fd://')).assertTrue();
      expect(audioBitrate).assertEqual(112000);
      expect(videoBitrate).assertEqual(3000000);
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      expect(orientation.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SERVICE_0021
     * @tc.name      testExtRecService0020
     * @tc.desc      Recorder service contract 8000Hz 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecService0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'fd://0';
      const audioBitrate: number = 112000;
      const videoBitrate: number = 3000000;
      const sampleRate: number = 8000;
      const channels: number = 1;
      const width: number = 1920;
      const height: number = 1080;
      const orientation: string = '0';
      expect(url.startsWith('fd://')).assertTrue();
      expect(audioBitrate).assertEqual(112000);
      expect(videoBitrate).assertEqual(3000000);
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      expect(orientation.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SERVICE_0022
     * @tc.name      testExtRecService0021
     * @tc.desc      Recorder service contract 22050Hz 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecService0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'fd://0';
      const audioBitrate: number = 112000;
      const videoBitrate: number = 3000000;
      const sampleRate: number = 22050;
      const channels: number = 2;
      const width: number = 640;
      const height: number = 480;
      const orientation: string = '90';
      expect(url.startsWith('fd://')).assertTrue();
      expect(audioBitrate).assertEqual(112000);
      expect(videoBitrate).assertEqual(3000000);
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      expect(orientation.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SERVICE_0023
     * @tc.name      testExtRecService0022
     * @tc.desc      Recorder service contract 44100Hz 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecService0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'fd://0';
      const audioBitrate: number = 112000;
      const videoBitrate: number = 3000000;
      const sampleRate: number = 44100;
      const channels: number = 1;
      const width: number = 1280;
      const height: number = 720;
      const orientation: string = '180';
      expect(url.startsWith('fd://')).assertTrue();
      expect(audioBitrate).assertEqual(112000);
      expect(videoBitrate).assertEqual(3000000);
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      expect(orientation.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SERVICE_0024
     * @tc.name      testExtRecService0023
     * @tc.desc      Recorder service contract 48000Hz 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecService0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'fd://0';
      const audioBitrate: number = 112000;
      const videoBitrate: number = 3000000;
      const sampleRate: number = 48000;
      const channels: number = 2;
      const width: number = 1920;
      const height: number = 1080;
      const orientation: string = '270';
      expect(url.startsWith('fd://')).assertTrue();
      expect(audioBitrate).assertEqual(112000);
      expect(videoBitrate).assertEqual(3000000);
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      expect(orientation.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SERVICE_0025
     * @tc.name      testExtRecService0024
     * @tc.desc      Recorder service contract 96000Hz 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecService0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'fd://0';
      const audioBitrate: number = 112000;
      const videoBitrate: number = 3000000;
      const sampleRate: number = 96000;
      const channels: number = 1;
      const width: number = 640;
      const height: number = 480;
      const orientation: string = '0';
      expect(url.startsWith('fd://')).assertTrue();
      expect(audioBitrate).assertEqual(112000);
      expect(videoBitrate).assertEqual(3000000);
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      expect(orientation.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SERVICE_0026
     * @tc.name      testExtRecService0025
     * @tc.desc      Recorder service contract 8000Hz 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecService0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'fd://0';
      const audioBitrate: number = 112000;
      const videoBitrate: number = 3000000;
      const sampleRate: number = 8000;
      const channels: number = 2;
      const width: number = 1280;
      const height: number = 720;
      const orientation: string = '90';
      expect(url.startsWith('fd://')).assertTrue();
      expect(audioBitrate).assertEqual(112000);
      expect(videoBitrate).assertEqual(3000000);
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      expect(orientation.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SERVICE_0027
     * @tc.name      testExtRecService0026
     * @tc.desc      Recorder service contract 22050Hz 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecService0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'fd://0';
      const audioBitrate: number = 112000;
      const videoBitrate: number = 3000000;
      const sampleRate: number = 22050;
      const channels: number = 1;
      const width: number = 1920;
      const height: number = 1080;
      const orientation: string = '180';
      expect(url.startsWith('fd://')).assertTrue();
      expect(audioBitrate).assertEqual(112000);
      expect(videoBitrate).assertEqual(3000000);
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      expect(orientation.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SERVICE_0028
     * @tc.name      testExtRecService0027
     * @tc.desc      Recorder service contract 44100Hz 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecService0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'fd://0';
      const audioBitrate: number = 112000;
      const videoBitrate: number = 3000000;
      const sampleRate: number = 44100;
      const channels: number = 2;
      const width: number = 640;
      const height: number = 480;
      const orientation: string = '270';
      expect(url.startsWith('fd://')).assertTrue();
      expect(audioBitrate).assertEqual(112000);
      expect(videoBitrate).assertEqual(3000000);
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      expect(orientation.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SERVICE_0029
     * @tc.name      testExtRecService0028
     * @tc.desc      Recorder service contract 48000Hz 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecService0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'fd://0';
      const audioBitrate: number = 112000;
      const videoBitrate: number = 3000000;
      const sampleRate: number = 48000;
      const channels: number = 1;
      const width: number = 1280;
      const height: number = 720;
      const orientation: string = '0';
      expect(url.startsWith('fd://')).assertTrue();
      expect(audioBitrate).assertEqual(112000);
      expect(videoBitrate).assertEqual(3000000);
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      expect(orientation.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SERVICE_0030
     * @tc.name      testExtRecService0029
     * @tc.desc      Recorder service contract 96000Hz 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecService0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'fd://0';
      const audioBitrate: number = 112000;
      const videoBitrate: number = 3000000;
      const sampleRate: number = 96000;
      const channels: number = 2;
      const width: number = 1920;
      const height: number = 1080;
      const orientation: string = '90';
      expect(url.startsWith('fd://')).assertTrue();
      expect(audioBitrate).assertEqual(112000);
      expect(videoBitrate).assertEqual(3000000);
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      expect(orientation.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SERVICE_0031
     * @tc.name      testExtRecService0030
     * @tc.desc      Recorder service contract 8000Hz 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecService0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'fd://0';
      const audioBitrate: number = 112000;
      const videoBitrate: number = 3000000;
      const sampleRate: number = 8000;
      const channels: number = 1;
      const width: number = 640;
      const height: number = 480;
      const orientation: string = '180';
      expect(url.startsWith('fd://')).assertTrue();
      expect(audioBitrate).assertEqual(112000);
      expect(videoBitrate).assertEqual(3000000);
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      expect(orientation.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SERVICE_0032
     * @tc.name      testExtRecService0031
     * @tc.desc      Recorder service contract 22050Hz 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecService0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'fd://0';
      const audioBitrate: number = 112000;
      const videoBitrate: number = 3000000;
      const sampleRate: number = 22050;
      const channels: number = 2;
      const width: number = 1280;
      const height: number = 720;
      const orientation: string = '270';
      expect(url.startsWith('fd://')).assertTrue();
      expect(audioBitrate).assertEqual(112000);
      expect(videoBitrate).assertEqual(3000000);
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      expect(orientation.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SERVICE_0033
     * @tc.name      testExtRecService0032
     * @tc.desc      Recorder service contract 44100Hz 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecService0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'fd://0';
      const audioBitrate: number = 112000;
      const videoBitrate: number = 3000000;
      const sampleRate: number = 44100;
      const channels: number = 1;
      const width: number = 1920;
      const height: number = 1080;
      const orientation: string = '0';
      expect(url.startsWith('fd://')).assertTrue();
      expect(audioBitrate).assertEqual(112000);
      expect(videoBitrate).assertEqual(3000000);
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      expect(orientation.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SERVICE_0034
     * @tc.name      testExtRecService0033
     * @tc.desc      Recorder service contract 48000Hz 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecService0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'fd://0';
      const audioBitrate: number = 112000;
      const videoBitrate: number = 3000000;
      const sampleRate: number = 48000;
      const channels: number = 2;
      const width: number = 640;
      const height: number = 480;
      const orientation: string = '90';
      expect(url.startsWith('fd://')).assertTrue();
      expect(audioBitrate).assertEqual(112000);
      expect(videoBitrate).assertEqual(3000000);
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      expect(orientation.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SERVICE_0035
     * @tc.name      testExtRecService0034
     * @tc.desc      Recorder service contract 96000Hz 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecService0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'fd://0';
      const audioBitrate: number = 112000;
      const videoBitrate: number = 3000000;
      const sampleRate: number = 96000;
      const channels: number = 1;
      const width: number = 1280;
      const height: number = 720;
      const orientation: string = '180';
      expect(url.startsWith('fd://')).assertTrue();
      expect(audioBitrate).assertEqual(112000);
      expect(videoBitrate).assertEqual(3000000);
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      expect(orientation.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SERVICE_0036
     * @tc.name      testExtRecService0035
     * @tc.desc      Recorder service contract 8000Hz 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecService0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'fd://0';
      const audioBitrate: number = 112000;
      const videoBitrate: number = 3000000;
      const sampleRate: number = 8000;
      const channels: number = 2;
      const width: number = 1920;
      const height: number = 1080;
      const orientation: string = '270';
      expect(url.startsWith('fd://')).assertTrue();
      expect(audioBitrate).assertEqual(112000);
      expect(videoBitrate).assertEqual(3000000);
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      expect(orientation.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SERVICE_0037
     * @tc.name      testExtRecService0036
     * @tc.desc      Recorder service contract 22050Hz 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecService0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'fd://0';
      const audioBitrate: number = 112000;
      const videoBitrate: number = 3000000;
      const sampleRate: number = 22050;
      const channels: number = 1;
      const width: number = 640;
      const height: number = 480;
      const orientation: string = '0';
      expect(url.startsWith('fd://')).assertTrue();
      expect(audioBitrate).assertEqual(112000);
      expect(videoBitrate).assertEqual(3000000);
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      expect(orientation.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SERVICE_0038
     * @tc.name      testExtRecService0037
     * @tc.desc      Recorder service contract 44100Hz 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecService0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'fd://0';
      const audioBitrate: number = 112000;
      const videoBitrate: number = 3000000;
      const sampleRate: number = 44100;
      const channels: number = 2;
      const width: number = 1280;
      const height: number = 720;
      const orientation: string = '90';
      expect(url.startsWith('fd://')).assertTrue();
      expect(audioBitrate).assertEqual(112000);
      expect(videoBitrate).assertEqual(3000000);
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      expect(orientation.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SERVICE_0039
     * @tc.name      testExtRecService0038
     * @tc.desc      Recorder service contract 48000Hz 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecService0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'fd://0';
      const audioBitrate: number = 112000;
      const videoBitrate: number = 3000000;
      const sampleRate: number = 48000;
      const channels: number = 1;
      const width: number = 1920;
      const height: number = 1080;
      const orientation: string = '180';
      expect(url.startsWith('fd://')).assertTrue();
      expect(audioBitrate).assertEqual(112000);
      expect(videoBitrate).assertEqual(3000000);
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      expect(orientation.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SERVICE_0040
     * @tc.name      testExtRecService0039
     * @tc.desc      Recorder service contract 96000Hz 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecService0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'fd://0';
      const audioBitrate: number = 112000;
      const videoBitrate: number = 3000000;
      const sampleRate: number = 96000;
      const channels: number = 2;
      const width: number = 640;
      const height: number = 480;
      const orientation: string = '270';
      expect(url.startsWith('fd://')).assertTrue();
      expect(audioBitrate).assertEqual(112000);
      expect(videoBitrate).assertEqual(3000000);
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      expect(orientation.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SERVICE_0041
     * @tc.name      testExtRecService0040
     * @tc.desc      Recorder service contract 8000Hz 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecService0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'fd://0';
      const audioBitrate: number = 112000;
      const videoBitrate: number = 3000000;
      const sampleRate: number = 8000;
      const channels: number = 1;
      const width: number = 1280;
      const height: number = 720;
      const orientation: string = '0';
      expect(url.startsWith('fd://')).assertTrue();
      expect(audioBitrate).assertEqual(112000);
      expect(videoBitrate).assertEqual(3000000);
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      expect(orientation.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SERVICE_0042
     * @tc.name      testExtRecService0041
     * @tc.desc      Recorder service contract 22050Hz 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecService0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'fd://0';
      const audioBitrate: number = 112000;
      const videoBitrate: number = 3000000;
      const sampleRate: number = 22050;
      const channels: number = 2;
      const width: number = 1920;
      const height: number = 1080;
      const orientation: string = '90';
      expect(url.startsWith('fd://')).assertTrue();
      expect(audioBitrate).assertEqual(112000);
      expect(videoBitrate).assertEqual(3000000);
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      expect(orientation.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SERVICE_0043
     * @tc.name      testExtRecService0042
     * @tc.desc      Recorder service contract 44100Hz 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecService0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'fd://0';
      const audioBitrate: number = 112000;
      const videoBitrate: number = 3000000;
      const sampleRate: number = 44100;
      const channels: number = 1;
      const width: number = 640;
      const height: number = 480;
      const orientation: string = '180';
      expect(url.startsWith('fd://')).assertTrue();
      expect(audioBitrate).assertEqual(112000);
      expect(videoBitrate).assertEqual(3000000);
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      expect(orientation.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SERVICE_0044
     * @tc.name      testExtRecService0043
     * @tc.desc      Recorder service contract 48000Hz 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecService0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'fd://0';
      const audioBitrate: number = 112000;
      const videoBitrate: number = 3000000;
      const sampleRate: number = 48000;
      const channels: number = 2;
      const width: number = 1280;
      const height: number = 720;
      const orientation: string = '270';
      expect(url.startsWith('fd://')).assertTrue();
      expect(audioBitrate).assertEqual(112000);
      expect(videoBitrate).assertEqual(3000000);
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      expect(orientation.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SERVICE_0045
     * @tc.name      testExtRecService0044
     * @tc.desc      Recorder service contract 96000Hz 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecService0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'fd://0';
      const audioBitrate: number = 112000;
      const videoBitrate: number = 3000000;
      const sampleRate: number = 96000;
      const channels: number = 1;
      const width: number = 1920;
      const height: number = 1080;
      const orientation: string = '0';
      expect(url.startsWith('fd://')).assertTrue();
      expect(audioBitrate).assertEqual(112000);
      expect(videoBitrate).assertEqual(3000000);
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      expect(orientation.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SERVICE_0046
     * @tc.name      testExtRecService0045
     * @tc.desc      Recorder service contract 8000Hz 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecService0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'fd://0';
      const audioBitrate: number = 112000;
      const videoBitrate: number = 3000000;
      const sampleRate: number = 8000;
      const channels: number = 2;
      const width: number = 640;
      const height: number = 480;
      const orientation: string = '90';
      expect(url.startsWith('fd://')).assertTrue();
      expect(audioBitrate).assertEqual(112000);
      expect(videoBitrate).assertEqual(3000000);
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      expect(orientation.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SERVICE_0047
     * @tc.name      testExtRecService0046
     * @tc.desc      Recorder service contract 22050Hz 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecService0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'fd://0';
      const audioBitrate: number = 112000;
      const videoBitrate: number = 3000000;
      const sampleRate: number = 22050;
      const channels: number = 1;
      const width: number = 1280;
      const height: number = 720;
      const orientation: string = '180';
      expect(url.startsWith('fd://')).assertTrue();
      expect(audioBitrate).assertEqual(112000);
      expect(videoBitrate).assertEqual(3000000);
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      expect(orientation.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SERVICE_0048
     * @tc.name      testExtRecService0047
     * @tc.desc      Recorder service contract 44100Hz 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecService0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'fd://0';
      const audioBitrate: number = 112000;
      const videoBitrate: number = 3000000;
      const sampleRate: number = 44100;
      const channels: number = 2;
      const width: number = 1920;
      const height: number = 1080;
      const orientation: string = '270';
      expect(url.startsWith('fd://')).assertTrue();
      expect(audioBitrate).assertEqual(112000);
      expect(videoBitrate).assertEqual(3000000);
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      expect(orientation.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SERVICE_0049
     * @tc.name      testExtRecService0048
     * @tc.desc      Recorder service contract 48000Hz 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecService0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'fd://0';
      const audioBitrate: number = 112000;
      const videoBitrate: number = 3000000;
      const sampleRate: number = 48000;
      const channels: number = 1;
      const width: number = 640;
      const height: number = 480;
      const orientation: string = '0';
      expect(url.startsWith('fd://')).assertTrue();
      expect(audioBitrate).assertEqual(112000);
      expect(videoBitrate).assertEqual(3000000);
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      expect(orientation.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SERVICE_0050
     * @tc.name      testExtRecService0049
     * @tc.desc      Recorder service contract 96000Hz 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecService0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'fd://0';
      const audioBitrate: number = 112000;
      const videoBitrate: number = 3000000;
      const sampleRate: number = 96000;
      const channels: number = 2;
      const width: number = 1280;
      const height: number = 720;
      const orientation: string = '90';
      expect(url.startsWith('fd://')).assertTrue();
      expect(audioBitrate).assertEqual(112000);
      expect(videoBitrate).assertEqual(3000000);
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      expect(orientation.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SERVICE_0051
     * @tc.name      testExtRecService0050
     * @tc.desc      Recorder service contract 8000Hz 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecService0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'fd://0';
      const audioBitrate: number = 112000;
      const videoBitrate: number = 3000000;
      const sampleRate: number = 8000;
      const channels: number = 1;
      const width: number = 1920;
      const height: number = 1080;
      const orientation: string = '180';
      expect(url.startsWith('fd://')).assertTrue();
      expect(audioBitrate).assertEqual(112000);
      expect(videoBitrate).assertEqual(3000000);
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      expect(orientation.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SERVICE_0052
     * @tc.name      testExtRecService0051
     * @tc.desc      Recorder service contract 22050Hz 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecService0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'fd://0';
      const audioBitrate: number = 112000;
      const videoBitrate: number = 3000000;
      const sampleRate: number = 22050;
      const channels: number = 2;
      const width: number = 640;
      const height: number = 480;
      const orientation: string = '270';
      expect(url.startsWith('fd://')).assertTrue();
      expect(audioBitrate).assertEqual(112000);
      expect(videoBitrate).assertEqual(3000000);
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      expect(orientation.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SERVICE_0053
     * @tc.name      testExtRecService0052
     * @tc.desc      Recorder service contract 44100Hz 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecService0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'fd://0';
      const audioBitrate: number = 112000;
      const videoBitrate: number = 3000000;
      const sampleRate: number = 44100;
      const channels: number = 1;
      const width: number = 1280;
      const height: number = 720;
      const orientation: string = '0';
      expect(url.startsWith('fd://')).assertTrue();
      expect(audioBitrate).assertEqual(112000);
      expect(videoBitrate).assertEqual(3000000);
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      expect(orientation.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SERVICE_0054
     * @tc.name      testExtRecService0053
     * @tc.desc      Recorder service contract 48000Hz 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecService0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'fd://0';
      const audioBitrate: number = 112000;
      const videoBitrate: number = 3000000;
      const sampleRate: number = 48000;
      const channels: number = 2;
      const width: number = 1920;
      const height: number = 1080;
      const orientation: string = '90';
      expect(url.startsWith('fd://')).assertTrue();
      expect(audioBitrate).assertEqual(112000);
      expect(videoBitrate).assertEqual(3000000);
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      expect(orientation.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SERVICE_0055
     * @tc.name      testExtRecService0054
     * @tc.desc      Recorder service contract 96000Hz 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecService0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'fd://0';
      const audioBitrate: number = 112000;
      const videoBitrate: number = 3000000;
      const sampleRate: number = 96000;
      const channels: number = 1;
      const width: number = 640;
      const height: number = 480;
      const orientation: string = '180';
      expect(url.startsWith('fd://')).assertTrue();
      expect(audioBitrate).assertEqual(112000);
      expect(videoBitrate).assertEqual(3000000);
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      expect(orientation.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SERVICE_0056
     * @tc.name      testExtRecService0055
     * @tc.desc      Recorder service contract 8000Hz 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecService0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'fd://0';
      const audioBitrate: number = 112000;
      const videoBitrate: number = 3000000;
      const sampleRate: number = 8000;
      const channels: number = 2;
      const width: number = 1280;
      const height: number = 720;
      const orientation: string = '270';
      expect(url.startsWith('fd://')).assertTrue();
      expect(audioBitrate).assertEqual(112000);
      expect(videoBitrate).assertEqual(3000000);
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      expect(orientation.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SERVICE_0057
     * @tc.name      testExtRecService0056
     * @tc.desc      Recorder service contract 22050Hz 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecService0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'fd://0';
      const audioBitrate: number = 112000;
      const videoBitrate: number = 3000000;
      const sampleRate: number = 22050;
      const channels: number = 1;
      const width: number = 1920;
      const height: number = 1080;
      const orientation: string = '0';
      expect(url.startsWith('fd://')).assertTrue();
      expect(audioBitrate).assertEqual(112000);
      expect(videoBitrate).assertEqual(3000000);
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      expect(orientation.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SERVICE_0058
     * @tc.name      testExtRecService0057
     * @tc.desc      Recorder service contract 44100Hz 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecService0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'fd://0';
      const audioBitrate: number = 112000;
      const videoBitrate: number = 3000000;
      const sampleRate: number = 44100;
      const channels: number = 2;
      const width: number = 640;
      const height: number = 480;
      const orientation: string = '90';
      expect(url.startsWith('fd://')).assertTrue();
      expect(audioBitrate).assertEqual(112000);
      expect(videoBitrate).assertEqual(3000000);
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      expect(orientation.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SERVICE_0059
     * @tc.name      testExtRecService0058
     * @tc.desc      Recorder service contract 48000Hz 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecService0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'fd://0';
      const audioBitrate: number = 112000;
      const videoBitrate: number = 3000000;
      const sampleRate: number = 48000;
      const channels: number = 1;
      const width: number = 1280;
      const height: number = 720;
      const orientation: string = '180';
      expect(url.startsWith('fd://')).assertTrue();
      expect(audioBitrate).assertEqual(112000);
      expect(videoBitrate).assertEqual(3000000);
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      expect(orientation.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SERVICE_0060
     * @tc.name      testExtRecService0059
     * @tc.desc      Recorder service contract 96000Hz 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecService0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'fd://0';
      const audioBitrate: number = 112000;
      const videoBitrate: number = 3000000;
      const sampleRate: number = 96000;
      const channels: number = 2;
      const width: number = 1920;
      const height: number = 1080;
      const orientation: string = '270';
      expect(url.startsWith('fd://')).assertTrue();
      expect(audioBitrate).assertEqual(112000);
      expect(videoBitrate).assertEqual(3000000);
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      expect(orientation.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SERVICE_0061
     * @tc.name      testExtRecService0060
     * @tc.desc      Recorder service contract 8000Hz 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecService0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'fd://0';
      const audioBitrate: number = 112000;
      const videoBitrate: number = 3000000;
      const sampleRate: number = 8000;
      const channels: number = 1;
      const width: number = 640;
      const height: number = 480;
      const orientation: string = '0';
      expect(url.startsWith('fd://')).assertTrue();
      expect(audioBitrate).assertEqual(112000);
      expect(videoBitrate).assertEqual(3000000);
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      expect(orientation.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SERVICE_0062
     * @tc.name      testExtRecService0061
     * @tc.desc      Recorder service contract 22050Hz 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecService0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'fd://0';
      const audioBitrate: number = 112000;
      const videoBitrate: number = 3000000;
      const sampleRate: number = 22050;
      const channels: number = 2;
      const width: number = 1280;
      const height: number = 720;
      const orientation: string = '90';
      expect(url.startsWith('fd://')).assertTrue();
      expect(audioBitrate).assertEqual(112000);
      expect(videoBitrate).assertEqual(3000000);
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      expect(orientation.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SERVICE_0063
     * @tc.name      testExtRecService0062
     * @tc.desc      Recorder service contract 44100Hz 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecService0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'fd://0';
      const audioBitrate: number = 112000;
      const videoBitrate: number = 3000000;
      const sampleRate: number = 44100;
      const channels: number = 1;
      const width: number = 1920;
      const height: number = 1080;
      const orientation: string = '180';
      expect(url.startsWith('fd://')).assertTrue();
      expect(audioBitrate).assertEqual(112000);
      expect(videoBitrate).assertEqual(3000000);
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      expect(orientation.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SERVICE_0064
     * @tc.name      testExtRecService0063
     * @tc.desc      Recorder service contract 48000Hz 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecService0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'fd://0';
      const audioBitrate: number = 112000;
      const videoBitrate: number = 3000000;
      const sampleRate: number = 48000;
      const channels: number = 2;
      const width: number = 640;
      const height: number = 480;
      const orientation: string = '270';
      expect(url.startsWith('fd://')).assertTrue();
      expect(audioBitrate).assertEqual(112000);
      expect(videoBitrate).assertEqual(3000000);
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      expect(orientation.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SERVICE_0065
     * @tc.name      testExtRecService0064
     * @tc.desc      Recorder service contract 96000Hz 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecService0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'fd://0';
      const audioBitrate: number = 112000;
      const videoBitrate: number = 3000000;
      const sampleRate: number = 96000;
      const channels: number = 1;
      const width: number = 1280;
      const height: number = 720;
      const orientation: string = '0';
      expect(url.startsWith('fd://')).assertTrue();
      expect(audioBitrate).assertEqual(112000);
      expect(videoBitrate).assertEqual(3000000);
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      expect(orientation.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SERVICE_0066
     * @tc.name      testExtRecService0065
     * @tc.desc      Recorder service contract 8000Hz 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecService0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'fd://0';
      const audioBitrate: number = 112000;
      const videoBitrate: number = 3000000;
      const sampleRate: number = 8000;
      const channels: number = 2;
      const width: number = 1920;
      const height: number = 1080;
      const orientation: string = '90';
      expect(url.startsWith('fd://')).assertTrue();
      expect(audioBitrate).assertEqual(112000);
      expect(videoBitrate).assertEqual(3000000);
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      expect(orientation.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SERVICE_0067
     * @tc.name      testExtRecService0066
     * @tc.desc      Recorder service contract 22050Hz 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecService0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'fd://0';
      const audioBitrate: number = 112000;
      const videoBitrate: number = 3000000;
      const sampleRate: number = 22050;
      const channels: number = 1;
      const width: number = 640;
      const height: number = 480;
      const orientation: string = '180';
      expect(url.startsWith('fd://')).assertTrue();
      expect(audioBitrate).assertEqual(112000);
      expect(videoBitrate).assertEqual(3000000);
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      expect(orientation.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SERVICE_0068
     * @tc.name      testExtRecService0067
     * @tc.desc      Recorder service contract 44100Hz 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecService0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'fd://0';
      const audioBitrate: number = 112000;
      const videoBitrate: number = 3000000;
      const sampleRate: number = 44100;
      const channels: number = 2;
      const width: number = 1280;
      const height: number = 720;
      const orientation: string = '270';
      expect(url.startsWith('fd://')).assertTrue();
      expect(audioBitrate).assertEqual(112000);
      expect(videoBitrate).assertEqual(3000000);
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      expect(orientation.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SERVICE_0069
     * @tc.name      testExtRecService0068
     * @tc.desc      Recorder service contract 48000Hz 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecService0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'fd://0';
      const audioBitrate: number = 112000;
      const videoBitrate: number = 3000000;
      const sampleRate: number = 48000;
      const channels: number = 1;
      const width: number = 1920;
      const height: number = 1080;
      const orientation: string = '0';
      expect(url.startsWith('fd://')).assertTrue();
      expect(audioBitrate).assertEqual(112000);
      expect(videoBitrate).assertEqual(3000000);
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      expect(orientation.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SERVICE_0070
     * @tc.name      testExtRecService0069
     * @tc.desc      Recorder service contract 96000Hz 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecService0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'fd://0';
      const audioBitrate: number = 112000;
      const videoBitrate: number = 3000000;
      const sampleRate: number = 96000;
      const channels: number = 2;
      const width: number = 640;
      const height: number = 480;
      const orientation: string = '90';
      expect(url.startsWith('fd://')).assertTrue();
      expect(audioBitrate).assertEqual(112000);
      expect(videoBitrate).assertEqual(3000000);
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      expect(orientation.length).assertLarger(0);
    })
  });
}
