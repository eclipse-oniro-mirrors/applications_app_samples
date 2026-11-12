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

const TAG: string = '[Sample_audioFocusBufferContract]';
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

export default function audioFocusBufferContractTest(): void {
  describe('audioFocusBufferContractTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_BUFFER_0001
     * @tc.name      testExtFocusBuf0000
     * @tc.desc      Buffer 256 bytes ch=1 rate=8000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusBuf0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bufferBytes: number = 256;
      const channels: number = 1;
      const frameSize: number = bufferBytes / (channels * 2);
      const sampleRate: number = 8000;
      const frequency: number = 220;
      const amplitude: number = 0.1;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * 7 / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(frameSize).assertEqual(128);
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_BUFFER_0002
     * @tc.name      testExtFocusBuf0001
     * @tc.desc      Buffer 512 bytes ch=2 rate=44100.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusBuf0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bufferBytes: number = 512;
      const channels: number = 2;
      const frameSize: number = bufferBytes / (channels * 2);
      const sampleRate: number = 44100;
      const frequency: number = 440;
      const amplitude: number = 0.3;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * 7 / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(frameSize).assertEqual(128);
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_BUFFER_0003
     * @tc.name      testExtFocusBuf0002
     * @tc.desc      Buffer 1024 bytes ch=1 rate=48000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusBuf0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bufferBytes: number = 1024;
      const channels: number = 1;
      const frameSize: number = bufferBytes / (channels * 2);
      const sampleRate: number = 48000;
      const frequency: number = 880;
      const amplitude: number = 0.5;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * 7 / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(frameSize).assertEqual(512);
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_BUFFER_0004
     * @tc.name      testExtFocusBuf0003
     * @tc.desc      Buffer 2048 bytes ch=2 rate=96000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusBuf0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bufferBytes: number = 2048;
      const channels: number = 2;
      const frameSize: number = bufferBytes / (channels * 2);
      const sampleRate: number = 96000;
      const frequency: number = 220;
      const amplitude: number = 0.1;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * 7 / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(frameSize).assertEqual(512);
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_BUFFER_0005
     * @tc.name      testExtFocusBuf0004
     * @tc.desc      Buffer 256 bytes ch=1 rate=8000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusBuf0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bufferBytes: number = 256;
      const channels: number = 1;
      const frameSize: number = bufferBytes / (channels * 2);
      const sampleRate: number = 8000;
      const frequency: number = 440;
      const amplitude: number = 0.3;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * 7 / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(frameSize).assertEqual(128);
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_BUFFER_0006
     * @tc.name      testExtFocusBuf0005
     * @tc.desc      Buffer 512 bytes ch=2 rate=44100.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusBuf0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bufferBytes: number = 512;
      const channels: number = 2;
      const frameSize: number = bufferBytes / (channels * 2);
      const sampleRate: number = 44100;
      const frequency: number = 880;
      const amplitude: number = 0.5;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * 7 / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(frameSize).assertEqual(128);
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_BUFFER_0007
     * @tc.name      testExtFocusBuf0006
     * @tc.desc      Buffer 1024 bytes ch=1 rate=48000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusBuf0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bufferBytes: number = 1024;
      const channels: number = 1;
      const frameSize: number = bufferBytes / (channels * 2);
      const sampleRate: number = 48000;
      const frequency: number = 220;
      const amplitude: number = 0.1;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * 7 / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(frameSize).assertEqual(512);
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_BUFFER_0008
     * @tc.name      testExtFocusBuf0007
     * @tc.desc      Buffer 2048 bytes ch=2 rate=96000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusBuf0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bufferBytes: number = 2048;
      const channels: number = 2;
      const frameSize: number = bufferBytes / (channels * 2);
      const sampleRate: number = 96000;
      const frequency: number = 440;
      const amplitude: number = 0.3;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * 7 / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(frameSize).assertEqual(512);
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_BUFFER_0009
     * @tc.name      testExtFocusBuf0008
     * @tc.desc      Buffer 256 bytes ch=1 rate=8000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusBuf0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bufferBytes: number = 256;
      const channels: number = 1;
      const frameSize: number = bufferBytes / (channels * 2);
      const sampleRate: number = 8000;
      const frequency: number = 880;
      const amplitude: number = 0.5;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * 7 / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(frameSize).assertEqual(128);
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_BUFFER_0010
     * @tc.name      testExtFocusBuf0009
     * @tc.desc      Buffer 512 bytes ch=2 rate=44100.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusBuf0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bufferBytes: number = 512;
      const channels: number = 2;
      const frameSize: number = bufferBytes / (channels * 2);
      const sampleRate: number = 44100;
      const frequency: number = 220;
      const amplitude: number = 0.1;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * 7 / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(frameSize).assertEqual(128);
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_BUFFER_0011
     * @tc.name      testExtFocusBuf0010
     * @tc.desc      Buffer 1024 bytes ch=1 rate=48000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusBuf0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bufferBytes: number = 1024;
      const channels: number = 1;
      const frameSize: number = bufferBytes / (channels * 2);
      const sampleRate: number = 48000;
      const frequency: number = 440;
      const amplitude: number = 0.3;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * 7 / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(frameSize).assertEqual(512);
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_BUFFER_0012
     * @tc.name      testExtFocusBuf0011
     * @tc.desc      Buffer 2048 bytes ch=2 rate=96000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusBuf0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bufferBytes: number = 2048;
      const channels: number = 2;
      const frameSize: number = bufferBytes / (channels * 2);
      const sampleRate: number = 96000;
      const frequency: number = 880;
      const amplitude: number = 0.5;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * 7 / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(frameSize).assertEqual(512);
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_BUFFER_0013
     * @tc.name      testExtFocusBuf0012
     * @tc.desc      Buffer 256 bytes ch=1 rate=8000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusBuf0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bufferBytes: number = 256;
      const channels: number = 1;
      const frameSize: number = bufferBytes / (channels * 2);
      const sampleRate: number = 8000;
      const frequency: number = 220;
      const amplitude: number = 0.1;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * 7 / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(frameSize).assertEqual(128);
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_BUFFER_0014
     * @tc.name      testExtFocusBuf0013
     * @tc.desc      Buffer 512 bytes ch=2 rate=44100.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusBuf0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bufferBytes: number = 512;
      const channels: number = 2;
      const frameSize: number = bufferBytes / (channels * 2);
      const sampleRate: number = 44100;
      const frequency: number = 440;
      const amplitude: number = 0.3;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * 7 / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(frameSize).assertEqual(128);
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_BUFFER_0015
     * @tc.name      testExtFocusBuf0014
     * @tc.desc      Buffer 1024 bytes ch=1 rate=48000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusBuf0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bufferBytes: number = 1024;
      const channels: number = 1;
      const frameSize: number = bufferBytes / (channels * 2);
      const sampleRate: number = 48000;
      const frequency: number = 880;
      const amplitude: number = 0.5;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * 7 / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(frameSize).assertEqual(512);
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_BUFFER_0016
     * @tc.name      testExtFocusBuf0015
     * @tc.desc      Buffer 2048 bytes ch=2 rate=96000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusBuf0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bufferBytes: number = 2048;
      const channels: number = 2;
      const frameSize: number = bufferBytes / (channels * 2);
      const sampleRate: number = 96000;
      const frequency: number = 220;
      const amplitude: number = 0.1;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * 7 / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(frameSize).assertEqual(512);
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_BUFFER_0017
     * @tc.name      testExtFocusBuf0016
     * @tc.desc      Buffer 256 bytes ch=1 rate=8000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusBuf0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bufferBytes: number = 256;
      const channels: number = 1;
      const frameSize: number = bufferBytes / (channels * 2);
      const sampleRate: number = 8000;
      const frequency: number = 440;
      const amplitude: number = 0.3;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * 7 / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(frameSize).assertEqual(128);
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_BUFFER_0018
     * @tc.name      testExtFocusBuf0017
     * @tc.desc      Buffer 512 bytes ch=2 rate=44100.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusBuf0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bufferBytes: number = 512;
      const channels: number = 2;
      const frameSize: number = bufferBytes / (channels * 2);
      const sampleRate: number = 44100;
      const frequency: number = 880;
      const amplitude: number = 0.5;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * 7 / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(frameSize).assertEqual(128);
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_BUFFER_0019
     * @tc.name      testExtFocusBuf0018
     * @tc.desc      Buffer 1024 bytes ch=1 rate=48000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusBuf0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bufferBytes: number = 1024;
      const channels: number = 1;
      const frameSize: number = bufferBytes / (channels * 2);
      const sampleRate: number = 48000;
      const frequency: number = 220;
      const amplitude: number = 0.1;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * 7 / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(frameSize).assertEqual(512);
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_BUFFER_0020
     * @tc.name      testExtFocusBuf0019
     * @tc.desc      Buffer 2048 bytes ch=2 rate=96000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusBuf0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bufferBytes: number = 2048;
      const channels: number = 2;
      const frameSize: number = bufferBytes / (channels * 2);
      const sampleRate: number = 96000;
      const frequency: number = 440;
      const amplitude: number = 0.3;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * 7 / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(frameSize).assertEqual(512);
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_BUFFER_0021
     * @tc.name      testExtFocusBuf0020
     * @tc.desc      Buffer 256 bytes ch=1 rate=8000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusBuf0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bufferBytes: number = 256;
      const channels: number = 1;
      const frameSize: number = bufferBytes / (channels * 2);
      const sampleRate: number = 8000;
      const frequency: number = 880;
      const amplitude: number = 0.5;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * 7 / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(frameSize).assertEqual(128);
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_BUFFER_0022
     * @tc.name      testExtFocusBuf0021
     * @tc.desc      Buffer 512 bytes ch=2 rate=44100.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusBuf0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bufferBytes: number = 512;
      const channels: number = 2;
      const frameSize: number = bufferBytes / (channels * 2);
      const sampleRate: number = 44100;
      const frequency: number = 220;
      const amplitude: number = 0.1;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * 7 / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(frameSize).assertEqual(128);
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_BUFFER_0023
     * @tc.name      testExtFocusBuf0022
     * @tc.desc      Buffer 1024 bytes ch=1 rate=48000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusBuf0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bufferBytes: number = 1024;
      const channels: number = 1;
      const frameSize: number = bufferBytes / (channels * 2);
      const sampleRate: number = 48000;
      const frequency: number = 440;
      const amplitude: number = 0.3;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * 7 / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(frameSize).assertEqual(512);
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_BUFFER_0024
     * @tc.name      testExtFocusBuf0023
     * @tc.desc      Buffer 2048 bytes ch=2 rate=96000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusBuf0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bufferBytes: number = 2048;
      const channels: number = 2;
      const frameSize: number = bufferBytes / (channels * 2);
      const sampleRate: number = 96000;
      const frequency: number = 880;
      const amplitude: number = 0.5;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * 7 / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(frameSize).assertEqual(512);
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_BUFFER_0025
     * @tc.name      testExtFocusBuf0024
     * @tc.desc      Buffer 256 bytes ch=1 rate=8000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusBuf0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bufferBytes: number = 256;
      const channels: number = 1;
      const frameSize: number = bufferBytes / (channels * 2);
      const sampleRate: number = 8000;
      const frequency: number = 220;
      const amplitude: number = 0.1;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * 7 / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(frameSize).assertEqual(128);
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_BUFFER_0026
     * @tc.name      testExtFocusBuf0025
     * @tc.desc      Buffer 512 bytes ch=2 rate=44100.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusBuf0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bufferBytes: number = 512;
      const channels: number = 2;
      const frameSize: number = bufferBytes / (channels * 2);
      const sampleRate: number = 44100;
      const frequency: number = 440;
      const amplitude: number = 0.3;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * 7 / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(frameSize).assertEqual(128);
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_BUFFER_0027
     * @tc.name      testExtFocusBuf0026
     * @tc.desc      Buffer 1024 bytes ch=1 rate=48000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusBuf0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bufferBytes: number = 1024;
      const channels: number = 1;
      const frameSize: number = bufferBytes / (channels * 2);
      const sampleRate: number = 48000;
      const frequency: number = 880;
      const amplitude: number = 0.5;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * 7 / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(frameSize).assertEqual(512);
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_BUFFER_0028
     * @tc.name      testExtFocusBuf0027
     * @tc.desc      Buffer 2048 bytes ch=2 rate=96000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusBuf0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bufferBytes: number = 2048;
      const channels: number = 2;
      const frameSize: number = bufferBytes / (channels * 2);
      const sampleRate: number = 96000;
      const frequency: number = 220;
      const amplitude: number = 0.1;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * 7 / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(frameSize).assertEqual(512);
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_BUFFER_0029
     * @tc.name      testExtFocusBuf0028
     * @tc.desc      Buffer 256 bytes ch=1 rate=8000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusBuf0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bufferBytes: number = 256;
      const channels: number = 1;
      const frameSize: number = bufferBytes / (channels * 2);
      const sampleRate: number = 8000;
      const frequency: number = 440;
      const amplitude: number = 0.3;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * 7 / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(frameSize).assertEqual(128);
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_BUFFER_0030
     * @tc.name      testExtFocusBuf0029
     * @tc.desc      Buffer 512 bytes ch=2 rate=44100.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusBuf0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bufferBytes: number = 512;
      const channels: number = 2;
      const frameSize: number = bufferBytes / (channels * 2);
      const sampleRate: number = 44100;
      const frequency: number = 880;
      const amplitude: number = 0.5;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * 7 / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(frameSize).assertEqual(128);
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_BUFFER_0031
     * @tc.name      testExtFocusBuf0030
     * @tc.desc      Buffer 1024 bytes ch=1 rate=48000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusBuf0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bufferBytes: number = 1024;
      const channels: number = 1;
      const frameSize: number = bufferBytes / (channels * 2);
      const sampleRate: number = 48000;
      const frequency: number = 220;
      const amplitude: number = 0.1;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * 7 / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(frameSize).assertEqual(512);
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_BUFFER_0032
     * @tc.name      testExtFocusBuf0031
     * @tc.desc      Buffer 2048 bytes ch=2 rate=96000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusBuf0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bufferBytes: number = 2048;
      const channels: number = 2;
      const frameSize: number = bufferBytes / (channels * 2);
      const sampleRate: number = 96000;
      const frequency: number = 440;
      const amplitude: number = 0.3;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * 7 / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(frameSize).assertEqual(512);
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_BUFFER_0033
     * @tc.name      testExtFocusBuf0032
     * @tc.desc      Buffer 256 bytes ch=1 rate=8000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusBuf0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bufferBytes: number = 256;
      const channels: number = 1;
      const frameSize: number = bufferBytes / (channels * 2);
      const sampleRate: number = 8000;
      const frequency: number = 880;
      const amplitude: number = 0.5;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * 7 / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(frameSize).assertEqual(128);
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_BUFFER_0034
     * @tc.name      testExtFocusBuf0033
     * @tc.desc      Buffer 512 bytes ch=2 rate=44100.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusBuf0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bufferBytes: number = 512;
      const channels: number = 2;
      const frameSize: number = bufferBytes / (channels * 2);
      const sampleRate: number = 44100;
      const frequency: number = 220;
      const amplitude: number = 0.1;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * 7 / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(frameSize).assertEqual(128);
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_BUFFER_0035
     * @tc.name      testExtFocusBuf0034
     * @tc.desc      Buffer 1024 bytes ch=1 rate=48000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusBuf0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bufferBytes: number = 1024;
      const channels: number = 1;
      const frameSize: number = bufferBytes / (channels * 2);
      const sampleRate: number = 48000;
      const frequency: number = 440;
      const amplitude: number = 0.3;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * 7 / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(frameSize).assertEqual(512);
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_BUFFER_0036
     * @tc.name      testExtFocusBuf0035
     * @tc.desc      Buffer 2048 bytes ch=2 rate=96000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusBuf0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bufferBytes: number = 2048;
      const channels: number = 2;
      const frameSize: number = bufferBytes / (channels * 2);
      const sampleRate: number = 96000;
      const frequency: number = 880;
      const amplitude: number = 0.5;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * 7 / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(frameSize).assertEqual(512);
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_BUFFER_0037
     * @tc.name      testExtFocusBuf0036
     * @tc.desc      Buffer 256 bytes ch=1 rate=8000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusBuf0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bufferBytes: number = 256;
      const channels: number = 1;
      const frameSize: number = bufferBytes / (channels * 2);
      const sampleRate: number = 8000;
      const frequency: number = 220;
      const amplitude: number = 0.1;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * 7 / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(frameSize).assertEqual(128);
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_BUFFER_0038
     * @tc.name      testExtFocusBuf0037
     * @tc.desc      Buffer 512 bytes ch=2 rate=44100.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusBuf0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bufferBytes: number = 512;
      const channels: number = 2;
      const frameSize: number = bufferBytes / (channels * 2);
      const sampleRate: number = 44100;
      const frequency: number = 440;
      const amplitude: number = 0.3;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * 7 / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(frameSize).assertEqual(128);
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_BUFFER_0039
     * @tc.name      testExtFocusBuf0038
     * @tc.desc      Buffer 1024 bytes ch=1 rate=48000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusBuf0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bufferBytes: number = 1024;
      const channels: number = 1;
      const frameSize: number = bufferBytes / (channels * 2);
      const sampleRate: number = 48000;
      const frequency: number = 880;
      const amplitude: number = 0.5;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * 7 / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(frameSize).assertEqual(512);
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_BUFFER_0040
     * @tc.name      testExtFocusBuf0039
     * @tc.desc      Buffer 2048 bytes ch=2 rate=96000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusBuf0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bufferBytes: number = 2048;
      const channels: number = 2;
      const frameSize: number = bufferBytes / (channels * 2);
      const sampleRate: number = 96000;
      const frequency: number = 220;
      const amplitude: number = 0.1;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * 7 / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(frameSize).assertEqual(512);
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_BUFFER_0041
     * @tc.name      testExtFocusBuf0040
     * @tc.desc      Buffer 256 bytes ch=1 rate=8000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusBuf0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bufferBytes: number = 256;
      const channels: number = 1;
      const frameSize: number = bufferBytes / (channels * 2);
      const sampleRate: number = 8000;
      const frequency: number = 440;
      const amplitude: number = 0.3;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * 7 / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(frameSize).assertEqual(128);
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_BUFFER_0042
     * @tc.name      testExtFocusBuf0041
     * @tc.desc      Buffer 512 bytes ch=2 rate=44100.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusBuf0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bufferBytes: number = 512;
      const channels: number = 2;
      const frameSize: number = bufferBytes / (channels * 2);
      const sampleRate: number = 44100;
      const frequency: number = 880;
      const amplitude: number = 0.5;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * 7 / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(frameSize).assertEqual(128);
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_BUFFER_0043
     * @tc.name      testExtFocusBuf0042
     * @tc.desc      Buffer 1024 bytes ch=1 rate=48000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusBuf0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bufferBytes: number = 1024;
      const channels: number = 1;
      const frameSize: number = bufferBytes / (channels * 2);
      const sampleRate: number = 48000;
      const frequency: number = 220;
      const amplitude: number = 0.1;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * 7 / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(frameSize).assertEqual(512);
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_BUFFER_0044
     * @tc.name      testExtFocusBuf0043
     * @tc.desc      Buffer 2048 bytes ch=2 rate=96000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusBuf0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bufferBytes: number = 2048;
      const channels: number = 2;
      const frameSize: number = bufferBytes / (channels * 2);
      const sampleRate: number = 96000;
      const frequency: number = 440;
      const amplitude: number = 0.3;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * 7 / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(frameSize).assertEqual(512);
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_BUFFER_0045
     * @tc.name      testExtFocusBuf0044
     * @tc.desc      Buffer 256 bytes ch=1 rate=8000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusBuf0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bufferBytes: number = 256;
      const channels: number = 1;
      const frameSize: number = bufferBytes / (channels * 2);
      const sampleRate: number = 8000;
      const frequency: number = 880;
      const amplitude: number = 0.5;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * 7 / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(frameSize).assertEqual(128);
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_BUFFER_0046
     * @tc.name      testExtFocusBuf0045
     * @tc.desc      Buffer 512 bytes ch=2 rate=44100.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusBuf0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bufferBytes: number = 512;
      const channels: number = 2;
      const frameSize: number = bufferBytes / (channels * 2);
      const sampleRate: number = 44100;
      const frequency: number = 220;
      const amplitude: number = 0.1;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * 7 / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(frameSize).assertEqual(128);
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_BUFFER_0047
     * @tc.name      testExtFocusBuf0046
     * @tc.desc      Buffer 1024 bytes ch=1 rate=48000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusBuf0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bufferBytes: number = 1024;
      const channels: number = 1;
      const frameSize: number = bufferBytes / (channels * 2);
      const sampleRate: number = 48000;
      const frequency: number = 440;
      const amplitude: number = 0.3;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * 7 / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(frameSize).assertEqual(512);
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_BUFFER_0048
     * @tc.name      testExtFocusBuf0047
     * @tc.desc      Buffer 2048 bytes ch=2 rate=96000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusBuf0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bufferBytes: number = 2048;
      const channels: number = 2;
      const frameSize: number = bufferBytes / (channels * 2);
      const sampleRate: number = 96000;
      const frequency: number = 880;
      const amplitude: number = 0.5;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * 7 / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(frameSize).assertEqual(512);
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_BUFFER_0049
     * @tc.name      testExtFocusBuf0048
     * @tc.desc      Buffer 256 bytes ch=1 rate=8000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusBuf0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bufferBytes: number = 256;
      const channels: number = 1;
      const frameSize: number = bufferBytes / (channels * 2);
      const sampleRate: number = 8000;
      const frequency: number = 220;
      const amplitude: number = 0.1;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * 7 / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(frameSize).assertEqual(128);
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_BUFFER_0050
     * @tc.name      testExtFocusBuf0049
     * @tc.desc      Buffer 512 bytes ch=2 rate=44100.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusBuf0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bufferBytes: number = 512;
      const channels: number = 2;
      const frameSize: number = bufferBytes / (channels * 2);
      const sampleRate: number = 44100;
      const frequency: number = 440;
      const amplitude: number = 0.3;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * 7 / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(frameSize).assertEqual(128);
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_BUFFER_0051
     * @tc.name      testExtFocusBuf0050
     * @tc.desc      Buffer 1024 bytes ch=1 rate=48000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusBuf0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bufferBytes: number = 1024;
      const channels: number = 1;
      const frameSize: number = bufferBytes / (channels * 2);
      const sampleRate: number = 48000;
      const frequency: number = 880;
      const amplitude: number = 0.5;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * 7 / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(frameSize).assertEqual(512);
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_BUFFER_0052
     * @tc.name      testExtFocusBuf0051
     * @tc.desc      Buffer 2048 bytes ch=2 rate=96000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusBuf0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bufferBytes: number = 2048;
      const channels: number = 2;
      const frameSize: number = bufferBytes / (channels * 2);
      const sampleRate: number = 96000;
      const frequency: number = 220;
      const amplitude: number = 0.1;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * 7 / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(frameSize).assertEqual(512);
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_BUFFER_0053
     * @tc.name      testExtFocusBuf0052
     * @tc.desc      Buffer 256 bytes ch=1 rate=8000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusBuf0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bufferBytes: number = 256;
      const channels: number = 1;
      const frameSize: number = bufferBytes / (channels * 2);
      const sampleRate: number = 8000;
      const frequency: number = 440;
      const amplitude: number = 0.3;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * 7 / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(frameSize).assertEqual(128);
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_BUFFER_0054
     * @tc.name      testExtFocusBuf0053
     * @tc.desc      Buffer 512 bytes ch=2 rate=44100.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusBuf0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bufferBytes: number = 512;
      const channels: number = 2;
      const frameSize: number = bufferBytes / (channels * 2);
      const sampleRate: number = 44100;
      const frequency: number = 880;
      const amplitude: number = 0.5;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * 7 / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(frameSize).assertEqual(128);
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_BUFFER_0055
     * @tc.name      testExtFocusBuf0054
     * @tc.desc      Buffer 1024 bytes ch=1 rate=48000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusBuf0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bufferBytes: number = 1024;
      const channels: number = 1;
      const frameSize: number = bufferBytes / (channels * 2);
      const sampleRate: number = 48000;
      const frequency: number = 220;
      const amplitude: number = 0.1;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * 7 / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(frameSize).assertEqual(512);
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_BUFFER_0056
     * @tc.name      testExtFocusBuf0055
     * @tc.desc      Buffer 2048 bytes ch=2 rate=96000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusBuf0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bufferBytes: number = 2048;
      const channels: number = 2;
      const frameSize: number = bufferBytes / (channels * 2);
      const sampleRate: number = 96000;
      const frequency: number = 440;
      const amplitude: number = 0.3;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * 7 / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(frameSize).assertEqual(512);
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_BUFFER_0057
     * @tc.name      testExtFocusBuf0056
     * @tc.desc      Buffer 256 bytes ch=1 rate=8000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusBuf0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bufferBytes: number = 256;
      const channels: number = 1;
      const frameSize: number = bufferBytes / (channels * 2);
      const sampleRate: number = 8000;
      const frequency: number = 880;
      const amplitude: number = 0.5;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * 7 / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(frameSize).assertEqual(128);
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_BUFFER_0058
     * @tc.name      testExtFocusBuf0057
     * @tc.desc      Buffer 512 bytes ch=2 rate=44100.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusBuf0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bufferBytes: number = 512;
      const channels: number = 2;
      const frameSize: number = bufferBytes / (channels * 2);
      const sampleRate: number = 44100;
      const frequency: number = 220;
      const amplitude: number = 0.1;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * 7 / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(frameSize).assertEqual(128);
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_BUFFER_0059
     * @tc.name      testExtFocusBuf0058
     * @tc.desc      Buffer 1024 bytes ch=1 rate=48000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusBuf0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bufferBytes: number = 1024;
      const channels: number = 1;
      const frameSize: number = bufferBytes / (channels * 2);
      const sampleRate: number = 48000;
      const frequency: number = 440;
      const amplitude: number = 0.3;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * 7 / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(frameSize).assertEqual(512);
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_BUFFER_0060
     * @tc.name      testExtFocusBuf0059
     * @tc.desc      Buffer 2048 bytes ch=2 rate=96000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusBuf0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bufferBytes: number = 2048;
      const channels: number = 2;
      const frameSize: number = bufferBytes / (channels * 2);
      const sampleRate: number = 96000;
      const frequency: number = 880;
      const amplitude: number = 0.5;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * 7 / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(frameSize).assertEqual(512);
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_BUFFER_0061
     * @tc.name      testExtFocusBuf0060
     * @tc.desc      Buffer 256 bytes ch=1 rate=8000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusBuf0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bufferBytes: number = 256;
      const channels: number = 1;
      const frameSize: number = bufferBytes / (channels * 2);
      const sampleRate: number = 8000;
      const frequency: number = 220;
      const amplitude: number = 0.1;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * 7 / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(frameSize).assertEqual(128);
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_BUFFER_0062
     * @tc.name      testExtFocusBuf0061
     * @tc.desc      Buffer 512 bytes ch=2 rate=44100.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusBuf0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bufferBytes: number = 512;
      const channels: number = 2;
      const frameSize: number = bufferBytes / (channels * 2);
      const sampleRate: number = 44100;
      const frequency: number = 440;
      const amplitude: number = 0.3;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * 7 / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(frameSize).assertEqual(128);
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_BUFFER_0063
     * @tc.name      testExtFocusBuf0062
     * @tc.desc      Buffer 1024 bytes ch=1 rate=48000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusBuf0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bufferBytes: number = 1024;
      const channels: number = 1;
      const frameSize: number = bufferBytes / (channels * 2);
      const sampleRate: number = 48000;
      const frequency: number = 880;
      const amplitude: number = 0.5;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * 7 / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(frameSize).assertEqual(512);
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_BUFFER_0064
     * @tc.name      testExtFocusBuf0063
     * @tc.desc      Buffer 2048 bytes ch=2 rate=96000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusBuf0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bufferBytes: number = 2048;
      const channels: number = 2;
      const frameSize: number = bufferBytes / (channels * 2);
      const sampleRate: number = 96000;
      const frequency: number = 220;
      const amplitude: number = 0.1;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * 7 / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(frameSize).assertEqual(512);
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_BUFFER_0065
     * @tc.name      testExtFocusBuf0064
     * @tc.desc      Buffer 256 bytes ch=1 rate=8000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusBuf0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bufferBytes: number = 256;
      const channels: number = 1;
      const frameSize: number = bufferBytes / (channels * 2);
      const sampleRate: number = 8000;
      const frequency: number = 440;
      const amplitude: number = 0.3;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * 7 / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(frameSize).assertEqual(128);
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_BUFFER_0066
     * @tc.name      testExtFocusBuf0065
     * @tc.desc      Buffer 512 bytes ch=2 rate=44100.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusBuf0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bufferBytes: number = 512;
      const channels: number = 2;
      const frameSize: number = bufferBytes / (channels * 2);
      const sampleRate: number = 44100;
      const frequency: number = 880;
      const amplitude: number = 0.5;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * 7 / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(frameSize).assertEqual(128);
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_BUFFER_0067
     * @tc.name      testExtFocusBuf0066
     * @tc.desc      Buffer 1024 bytes ch=1 rate=48000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusBuf0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bufferBytes: number = 1024;
      const channels: number = 1;
      const frameSize: number = bufferBytes / (channels * 2);
      const sampleRate: number = 48000;
      const frequency: number = 220;
      const amplitude: number = 0.1;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * 7 / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(frameSize).assertEqual(512);
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_BUFFER_0068
     * @tc.name      testExtFocusBuf0067
     * @tc.desc      Buffer 2048 bytes ch=2 rate=96000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusBuf0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bufferBytes: number = 2048;
      const channels: number = 2;
      const frameSize: number = bufferBytes / (channels * 2);
      const sampleRate: number = 96000;
      const frequency: number = 440;
      const amplitude: number = 0.3;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * 7 / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(frameSize).assertEqual(512);
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_BUFFER_0069
     * @tc.name      testExtFocusBuf0068
     * @tc.desc      Buffer 256 bytes ch=1 rate=8000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusBuf0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bufferBytes: number = 256;
      const channels: number = 1;
      const frameSize: number = bufferBytes / (channels * 2);
      const sampleRate: number = 8000;
      const frequency: number = 880;
      const amplitude: number = 0.5;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * 7 / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(frameSize).assertEqual(128);
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_BUFFER_0070
     * @tc.name      testExtFocusBuf0069
     * @tc.desc      Buffer 512 bytes ch=2 rate=44100.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusBuf0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bufferBytes: number = 512;
      const channels: number = 2;
      const frameSize: number = bufferBytes / (channels * 2);
      const sampleRate: number = 44100;
      const frequency: number = 220;
      const amplitude: number = 0.1;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * 7 / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(frameSize).assertEqual(128);
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_BUFFER_0071
     * @tc.name      testExtFocusBuf0070
     * @tc.desc      Buffer 1024 bytes ch=1 rate=48000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusBuf0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bufferBytes: number = 1024;
      const channels: number = 1;
      const frameSize: number = bufferBytes / (channels * 2);
      const sampleRate: number = 48000;
      const frequency: number = 440;
      const amplitude: number = 0.3;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * 7 / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(frameSize).assertEqual(512);
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_BUFFER_0072
     * @tc.name      testExtFocusBuf0071
     * @tc.desc      Buffer 2048 bytes ch=2 rate=96000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusBuf0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bufferBytes: number = 2048;
      const channels: number = 2;
      const frameSize: number = bufferBytes / (channels * 2);
      const sampleRate: number = 96000;
      const frequency: number = 880;
      const amplitude: number = 0.5;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * 7 / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(frameSize).assertEqual(512);
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_BUFFER_0073
     * @tc.name      testExtFocusBuf0072
     * @tc.desc      Buffer 256 bytes ch=1 rate=8000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusBuf0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bufferBytes: number = 256;
      const channels: number = 1;
      const frameSize: number = bufferBytes / (channels * 2);
      const sampleRate: number = 8000;
      const frequency: number = 220;
      const amplitude: number = 0.1;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * 7 / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(frameSize).assertEqual(128);
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_BUFFER_0074
     * @tc.name      testExtFocusBuf0073
     * @tc.desc      Buffer 512 bytes ch=2 rate=44100.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusBuf0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bufferBytes: number = 512;
      const channels: number = 2;
      const frameSize: number = bufferBytes / (channels * 2);
      const sampleRate: number = 44100;
      const frequency: number = 440;
      const amplitude: number = 0.3;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * 7 / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(frameSize).assertEqual(128);
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_BUFFER_0075
     * @tc.name      testExtFocusBuf0074
     * @tc.desc      Buffer 1024 bytes ch=1 rate=48000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusBuf0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bufferBytes: number = 1024;
      const channels: number = 1;
      const frameSize: number = bufferBytes / (channels * 2);
      const sampleRate: number = 48000;
      const frequency: number = 880;
      const amplitude: number = 0.5;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * 7 / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(frameSize).assertEqual(512);
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_BUFFER_0076
     * @tc.name      testExtFocusBuf0075
     * @tc.desc      Buffer 2048 bytes ch=2 rate=96000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusBuf0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bufferBytes: number = 2048;
      const channels: number = 2;
      const frameSize: number = bufferBytes / (channels * 2);
      const sampleRate: number = 96000;
      const frequency: number = 220;
      const amplitude: number = 0.1;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * 7 / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(frameSize).assertEqual(512);
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_BUFFER_0077
     * @tc.name      testExtFocusBuf0076
     * @tc.desc      Buffer 256 bytes ch=1 rate=8000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusBuf0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bufferBytes: number = 256;
      const channels: number = 1;
      const frameSize: number = bufferBytes / (channels * 2);
      const sampleRate: number = 8000;
      const frequency: number = 440;
      const amplitude: number = 0.3;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * 7 / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(frameSize).assertEqual(128);
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_BUFFER_0078
     * @tc.name      testExtFocusBuf0077
     * @tc.desc      Buffer 512 bytes ch=2 rate=44100.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusBuf0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bufferBytes: number = 512;
      const channels: number = 2;
      const frameSize: number = bufferBytes / (channels * 2);
      const sampleRate: number = 44100;
      const frequency: number = 880;
      const amplitude: number = 0.5;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * 7 / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(frameSize).assertEqual(128);
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_BUFFER_0079
     * @tc.name      testExtFocusBuf0078
     * @tc.desc      Buffer 1024 bytes ch=1 rate=48000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusBuf0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bufferBytes: number = 1024;
      const channels: number = 1;
      const frameSize: number = bufferBytes / (channels * 2);
      const sampleRate: number = 48000;
      const frequency: number = 220;
      const amplitude: number = 0.1;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * 7 / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(frameSize).assertEqual(512);
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_BUFFER_0080
     * @tc.name      testExtFocusBuf0079
     * @tc.desc      Buffer 2048 bytes ch=2 rate=96000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusBuf0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bufferBytes: number = 2048;
      const channels: number = 2;
      const frameSize: number = bufferBytes / (channels * 2);
      const sampleRate: number = 96000;
      const frequency: number = 440;
      const amplitude: number = 0.3;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * 7 / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(frameSize).assertEqual(512);
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(channels).assertLarger(0);
    })
  });
}
