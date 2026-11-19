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

const TAG: string = '[Sample_audioFocusPcmMath]';
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

export default function audioFocusPcmMathTest(): void {
  describe('audioFocusPcmMathTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCM_0001
     * @tc.name      testExtFocusPcm0000
     * @tc.desc      PCM math 8000Hz 220Hz amp 0.1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcm0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 8000;
      const frequency: number = 220;
      const amplitude: number = 0.1;
      const channels: number = 1;
      const phase: number = 0;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * phase / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      const frameSize: number = Math.floor((1024) / (channels * 2));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(frameSize).assertLarger(0);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCM_0002
     * @tc.name      testExtFocusPcm0001
     * @tc.desc      PCM math 44100Hz 440Hz amp 0.3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcm0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 44100;
      const frequency: number = 440;
      const amplitude: number = 0.3;
      const channels: number = 2;
      const phase: number = 1;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * phase / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      const frameSize: number = Math.floor((1024) / (channels * 2));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(frameSize).assertLarger(0);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCM_0003
     * @tc.name      testExtFocusPcm0002
     * @tc.desc      PCM math 48000Hz 880Hz amp 0.5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcm0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 48000;
      const frequency: number = 880;
      const amplitude: number = 0.5;
      const channels: number = 1;
      const phase: number = 2;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * phase / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      const frameSize: number = Math.floor((1024) / (channels * 2));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(frameSize).assertLarger(0);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCM_0004
     * @tc.name      testExtFocusPcm0003
     * @tc.desc      PCM math 96000Hz 220Hz amp 1.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcm0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 96000;
      const frequency: number = 220;
      const amplitude: number = 1.0;
      const channels: number = 2;
      const phase: number = 3;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * phase / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      const frameSize: number = Math.floor((1024) / (channels * 2));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(frameSize).assertLarger(0);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCM_0005
     * @tc.name      testExtFocusPcm0004
     * @tc.desc      PCM math 8000Hz 440Hz amp 0.1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcm0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 8000;
      const frequency: number = 440;
      const amplitude: number = 0.1;
      const channels: number = 1;
      const phase: number = 4;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * phase / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      const frameSize: number = Math.floor((1024) / (channels * 2));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(frameSize).assertLarger(0);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCM_0006
     * @tc.name      testExtFocusPcm0005
     * @tc.desc      PCM math 44100Hz 880Hz amp 0.3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcm0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 44100;
      const frequency: number = 880;
      const amplitude: number = 0.3;
      const channels: number = 2;
      const phase: number = 5;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * phase / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      const frameSize: number = Math.floor((1024) / (channels * 2));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(frameSize).assertLarger(0);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCM_0007
     * @tc.name      testExtFocusPcm0006
     * @tc.desc      PCM math 48000Hz 220Hz amp 0.5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcm0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 48000;
      const frequency: number = 220;
      const amplitude: number = 0.5;
      const channels: number = 1;
      const phase: number = 6;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * phase / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      const frameSize: number = Math.floor((1024) / (channels * 2));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(frameSize).assertLarger(0);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCM_0008
     * @tc.name      testExtFocusPcm0007
     * @tc.desc      PCM math 96000Hz 440Hz amp 1.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcm0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 96000;
      const frequency: number = 440;
      const amplitude: number = 1.0;
      const channels: number = 2;
      const phase: number = 7;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * phase / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      const frameSize: number = Math.floor((1024) / (channels * 2));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(frameSize).assertLarger(0);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCM_0009
     * @tc.name      testExtFocusPcm0008
     * @tc.desc      PCM math 8000Hz 880Hz amp 0.1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcm0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 8000;
      const frequency: number = 880;
      const amplitude: number = 0.1;
      const channels: number = 1;
      const phase: number = 8;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * phase / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      const frameSize: number = Math.floor((1024) / (channels * 2));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(frameSize).assertLarger(0);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCM_0010
     * @tc.name      testExtFocusPcm0009
     * @tc.desc      PCM math 44100Hz 220Hz amp 0.3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcm0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 44100;
      const frequency: number = 220;
      const amplitude: number = 0.3;
      const channels: number = 2;
      const phase: number = 9;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * phase / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      const frameSize: number = Math.floor((1024) / (channels * 2));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(frameSize).assertLarger(0);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCM_0011
     * @tc.name      testExtFocusPcm0010
     * @tc.desc      PCM math 48000Hz 440Hz amp 0.5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcm0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 48000;
      const frequency: number = 440;
      const amplitude: number = 0.5;
      const channels: number = 1;
      const phase: number = 10;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * phase / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      const frameSize: number = Math.floor((1024) / (channels * 2));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(frameSize).assertLarger(0);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCM_0012
     * @tc.name      testExtFocusPcm0011
     * @tc.desc      PCM math 96000Hz 880Hz amp 1.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcm0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 96000;
      const frequency: number = 880;
      const amplitude: number = 1.0;
      const channels: number = 2;
      const phase: number = 11;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * phase / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      const frameSize: number = Math.floor((1024) / (channels * 2));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(frameSize).assertLarger(0);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCM_0013
     * @tc.name      testExtFocusPcm0012
     * @tc.desc      PCM math 8000Hz 220Hz amp 0.1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcm0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 8000;
      const frequency: number = 220;
      const amplitude: number = 0.1;
      const channels: number = 1;
      const phase: number = 12;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * phase / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      const frameSize: number = Math.floor((1024) / (channels * 2));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(frameSize).assertLarger(0);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCM_0014
     * @tc.name      testExtFocusPcm0013
     * @tc.desc      PCM math 44100Hz 440Hz amp 0.3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcm0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 44100;
      const frequency: number = 440;
      const amplitude: number = 0.3;
      const channels: number = 2;
      const phase: number = 13;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * phase / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      const frameSize: number = Math.floor((1024) / (channels * 2));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(frameSize).assertLarger(0);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCM_0015
     * @tc.name      testExtFocusPcm0014
     * @tc.desc      PCM math 48000Hz 880Hz amp 0.5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcm0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 48000;
      const frequency: number = 880;
      const amplitude: number = 0.5;
      const channels: number = 1;
      const phase: number = 14;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * phase / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      const frameSize: number = Math.floor((1024) / (channels * 2));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(frameSize).assertLarger(0);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCM_0016
     * @tc.name      testExtFocusPcm0015
     * @tc.desc      PCM math 96000Hz 220Hz amp 1.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcm0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 96000;
      const frequency: number = 220;
      const amplitude: number = 1.0;
      const channels: number = 2;
      const phase: number = 15;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * phase / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      const frameSize: number = Math.floor((1024) / (channels * 2));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(frameSize).assertLarger(0);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCM_0017
     * @tc.name      testExtFocusPcm0016
     * @tc.desc      PCM math 8000Hz 440Hz amp 0.1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcm0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 8000;
      const frequency: number = 440;
      const amplitude: number = 0.1;
      const channels: number = 1;
      const phase: number = 16;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * phase / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      const frameSize: number = Math.floor((1024) / (channels * 2));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(frameSize).assertLarger(0);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCM_0018
     * @tc.name      testExtFocusPcm0017
     * @tc.desc      PCM math 44100Hz 880Hz amp 0.3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcm0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 44100;
      const frequency: number = 880;
      const amplitude: number = 0.3;
      const channels: number = 2;
      const phase: number = 17;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * phase / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      const frameSize: number = Math.floor((1024) / (channels * 2));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(frameSize).assertLarger(0);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCM_0019
     * @tc.name      testExtFocusPcm0018
     * @tc.desc      PCM math 48000Hz 220Hz amp 0.5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcm0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 48000;
      const frequency: number = 220;
      const amplitude: number = 0.5;
      const channels: number = 1;
      const phase: number = 18;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * phase / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      const frameSize: number = Math.floor((1024) / (channels * 2));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(frameSize).assertLarger(0);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCM_0020
     * @tc.name      testExtFocusPcm0019
     * @tc.desc      PCM math 96000Hz 440Hz amp 1.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcm0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 96000;
      const frequency: number = 440;
      const amplitude: number = 1.0;
      const channels: number = 2;
      const phase: number = 19;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * phase / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      const frameSize: number = Math.floor((1024) / (channels * 2));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(frameSize).assertLarger(0);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCM_0021
     * @tc.name      testExtFocusPcm0020
     * @tc.desc      PCM math 8000Hz 880Hz amp 0.1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcm0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 8000;
      const frequency: number = 880;
      const amplitude: number = 0.1;
      const channels: number = 1;
      const phase: number = 20;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * phase / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      const frameSize: number = Math.floor((1024) / (channels * 2));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(frameSize).assertLarger(0);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCM_0022
     * @tc.name      testExtFocusPcm0021
     * @tc.desc      PCM math 44100Hz 220Hz amp 0.3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcm0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 44100;
      const frequency: number = 220;
      const amplitude: number = 0.3;
      const channels: number = 2;
      const phase: number = 21;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * phase / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      const frameSize: number = Math.floor((1024) / (channels * 2));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(frameSize).assertLarger(0);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCM_0023
     * @tc.name      testExtFocusPcm0022
     * @tc.desc      PCM math 48000Hz 440Hz amp 0.5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcm0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 48000;
      const frequency: number = 440;
      const amplitude: number = 0.5;
      const channels: number = 1;
      const phase: number = 22;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * phase / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      const frameSize: number = Math.floor((1024) / (channels * 2));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(frameSize).assertLarger(0);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCM_0024
     * @tc.name      testExtFocusPcm0023
     * @tc.desc      PCM math 96000Hz 880Hz amp 1.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcm0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 96000;
      const frequency: number = 880;
      const amplitude: number = 1.0;
      const channels: number = 2;
      const phase: number = 23;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * phase / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      const frameSize: number = Math.floor((1024) / (channels * 2));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(frameSize).assertLarger(0);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCM_0025
     * @tc.name      testExtFocusPcm0024
     * @tc.desc      PCM math 8000Hz 220Hz amp 0.1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcm0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 8000;
      const frequency: number = 220;
      const amplitude: number = 0.1;
      const channels: number = 1;
      const phase: number = 24;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * phase / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      const frameSize: number = Math.floor((1024) / (channels * 2));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(frameSize).assertLarger(0);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCM_0026
     * @tc.name      testExtFocusPcm0025
     * @tc.desc      PCM math 44100Hz 440Hz amp 0.3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcm0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 44100;
      const frequency: number = 440;
      const amplitude: number = 0.3;
      const channels: number = 2;
      const phase: number = 25;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * phase / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      const frameSize: number = Math.floor((1024) / (channels * 2));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(frameSize).assertLarger(0);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCM_0027
     * @tc.name      testExtFocusPcm0026
     * @tc.desc      PCM math 48000Hz 880Hz amp 0.5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcm0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 48000;
      const frequency: number = 880;
      const amplitude: number = 0.5;
      const channels: number = 1;
      const phase: number = 26;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * phase / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      const frameSize: number = Math.floor((1024) / (channels * 2));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(frameSize).assertLarger(0);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCM_0028
     * @tc.name      testExtFocusPcm0027
     * @tc.desc      PCM math 96000Hz 220Hz amp 1.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcm0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 96000;
      const frequency: number = 220;
      const amplitude: number = 1.0;
      const channels: number = 2;
      const phase: number = 27;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * phase / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      const frameSize: number = Math.floor((1024) / (channels * 2));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(frameSize).assertLarger(0);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCM_0029
     * @tc.name      testExtFocusPcm0028
     * @tc.desc      PCM math 8000Hz 440Hz amp 0.1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcm0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 8000;
      const frequency: number = 440;
      const amplitude: number = 0.1;
      const channels: number = 1;
      const phase: number = 28;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * phase / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      const frameSize: number = Math.floor((1024) / (channels * 2));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(frameSize).assertLarger(0);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCM_0030
     * @tc.name      testExtFocusPcm0029
     * @tc.desc      PCM math 44100Hz 880Hz amp 0.3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcm0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 44100;
      const frequency: number = 880;
      const amplitude: number = 0.3;
      const channels: number = 2;
      const phase: number = 29;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * phase / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      const frameSize: number = Math.floor((1024) / (channels * 2));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(frameSize).assertLarger(0);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCM_0031
     * @tc.name      testExtFocusPcm0030
     * @tc.desc      PCM math 48000Hz 220Hz amp 0.5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcm0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 48000;
      const frequency: number = 220;
      const amplitude: number = 0.5;
      const channels: number = 1;
      const phase: number = 30;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * phase / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      const frameSize: number = Math.floor((1024) / (channels * 2));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(frameSize).assertLarger(0);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCM_0032
     * @tc.name      testExtFocusPcm0031
     * @tc.desc      PCM math 96000Hz 440Hz amp 1.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcm0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 96000;
      const frequency: number = 440;
      const amplitude: number = 1.0;
      const channels: number = 2;
      const phase: number = 31;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * phase / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      const frameSize: number = Math.floor((1024) / (channels * 2));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(frameSize).assertLarger(0);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCM_0033
     * @tc.name      testExtFocusPcm0032
     * @tc.desc      PCM math 8000Hz 880Hz amp 0.1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcm0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 8000;
      const frequency: number = 880;
      const amplitude: number = 0.1;
      const channels: number = 1;
      const phase: number = 32;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * phase / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      const frameSize: number = Math.floor((1024) / (channels * 2));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(frameSize).assertLarger(0);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCM_0034
     * @tc.name      testExtFocusPcm0033
     * @tc.desc      PCM math 44100Hz 220Hz amp 0.3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcm0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 44100;
      const frequency: number = 220;
      const amplitude: number = 0.3;
      const channels: number = 2;
      const phase: number = 33;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * phase / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      const frameSize: number = Math.floor((1024) / (channels * 2));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(frameSize).assertLarger(0);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCM_0035
     * @tc.name      testExtFocusPcm0034
     * @tc.desc      PCM math 48000Hz 440Hz amp 0.5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcm0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 48000;
      const frequency: number = 440;
      const amplitude: number = 0.5;
      const channels: number = 1;
      const phase: number = 34;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * phase / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      const frameSize: number = Math.floor((1024) / (channels * 2));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(frameSize).assertLarger(0);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCM_0036
     * @tc.name      testExtFocusPcm0035
     * @tc.desc      PCM math 96000Hz 880Hz amp 1.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcm0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 96000;
      const frequency: number = 880;
      const amplitude: number = 1.0;
      const channels: number = 2;
      const phase: number = 35;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * phase / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      const frameSize: number = Math.floor((1024) / (channels * 2));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(frameSize).assertLarger(0);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCM_0037
     * @tc.name      testExtFocusPcm0036
     * @tc.desc      PCM math 8000Hz 220Hz amp 0.1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcm0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 8000;
      const frequency: number = 220;
      const amplitude: number = 0.1;
      const channels: number = 1;
      const phase: number = 36;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * phase / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      const frameSize: number = Math.floor((1024) / (channels * 2));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(frameSize).assertLarger(0);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCM_0038
     * @tc.name      testExtFocusPcm0037
     * @tc.desc      PCM math 44100Hz 440Hz amp 0.3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcm0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 44100;
      const frequency: number = 440;
      const amplitude: number = 0.3;
      const channels: number = 2;
      const phase: number = 37;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * phase / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      const frameSize: number = Math.floor((1024) / (channels * 2));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(frameSize).assertLarger(0);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCM_0039
     * @tc.name      testExtFocusPcm0038
     * @tc.desc      PCM math 48000Hz 880Hz amp 0.5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcm0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 48000;
      const frequency: number = 880;
      const amplitude: number = 0.5;
      const channels: number = 1;
      const phase: number = 38;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * phase / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      const frameSize: number = Math.floor((1024) / (channels * 2));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(frameSize).assertLarger(0);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCM_0040
     * @tc.name      testExtFocusPcm0039
     * @tc.desc      PCM math 96000Hz 220Hz amp 1.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcm0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 96000;
      const frequency: number = 220;
      const amplitude: number = 1.0;
      const channels: number = 2;
      const phase: number = 39;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * phase / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      const frameSize: number = Math.floor((1024) / (channels * 2));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(frameSize).assertLarger(0);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCM_0041
     * @tc.name      testExtFocusPcm0040
     * @tc.desc      PCM math 8000Hz 440Hz amp 0.1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcm0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 8000;
      const frequency: number = 440;
      const amplitude: number = 0.1;
      const channels: number = 1;
      const phase: number = 40;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * phase / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      const frameSize: number = Math.floor((1024) / (channels * 2));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(frameSize).assertLarger(0);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCM_0042
     * @tc.name      testExtFocusPcm0041
     * @tc.desc      PCM math 44100Hz 880Hz amp 0.3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcm0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 44100;
      const frequency: number = 880;
      const amplitude: number = 0.3;
      const channels: number = 2;
      const phase: number = 41;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * phase / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      const frameSize: number = Math.floor((1024) / (channels * 2));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(frameSize).assertLarger(0);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCM_0043
     * @tc.name      testExtFocusPcm0042
     * @tc.desc      PCM math 48000Hz 220Hz amp 0.5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcm0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 48000;
      const frequency: number = 220;
      const amplitude: number = 0.5;
      const channels: number = 1;
      const phase: number = 42;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * phase / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      const frameSize: number = Math.floor((1024) / (channels * 2));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(frameSize).assertLarger(0);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCM_0044
     * @tc.name      testExtFocusPcm0043
     * @tc.desc      PCM math 96000Hz 440Hz amp 1.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcm0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 96000;
      const frequency: number = 440;
      const amplitude: number = 1.0;
      const channels: number = 2;
      const phase: number = 43;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * phase / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      const frameSize: number = Math.floor((1024) / (channels * 2));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(frameSize).assertLarger(0);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCM_0045
     * @tc.name      testExtFocusPcm0044
     * @tc.desc      PCM math 8000Hz 880Hz amp 0.1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcm0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 8000;
      const frequency: number = 880;
      const amplitude: number = 0.1;
      const channels: number = 1;
      const phase: number = 44;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * phase / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      const frameSize: number = Math.floor((1024) / (channels * 2));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(frameSize).assertLarger(0);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCM_0046
     * @tc.name      testExtFocusPcm0045
     * @tc.desc      PCM math 44100Hz 220Hz amp 0.3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcm0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 44100;
      const frequency: number = 220;
      const amplitude: number = 0.3;
      const channels: number = 2;
      const phase: number = 45;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * phase / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      const frameSize: number = Math.floor((1024) / (channels * 2));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(frameSize).assertLarger(0);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCM_0047
     * @tc.name      testExtFocusPcm0046
     * @tc.desc      PCM math 48000Hz 440Hz amp 0.5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcm0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 48000;
      const frequency: number = 440;
      const amplitude: number = 0.5;
      const channels: number = 1;
      const phase: number = 46;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * phase / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      const frameSize: number = Math.floor((1024) / (channels * 2));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(frameSize).assertLarger(0);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCM_0048
     * @tc.name      testExtFocusPcm0047
     * @tc.desc      PCM math 96000Hz 880Hz amp 1.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcm0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 96000;
      const frequency: number = 880;
      const amplitude: number = 1.0;
      const channels: number = 2;
      const phase: number = 47;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * phase / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      const frameSize: number = Math.floor((1024) / (channels * 2));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(frameSize).assertLarger(0);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCM_0049
     * @tc.name      testExtFocusPcm0048
     * @tc.desc      PCM math 8000Hz 220Hz amp 0.1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcm0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 8000;
      const frequency: number = 220;
      const amplitude: number = 0.1;
      const channels: number = 1;
      const phase: number = 48;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * phase / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      const frameSize: number = Math.floor((1024) / (channels * 2));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(frameSize).assertLarger(0);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCM_0050
     * @tc.name      testExtFocusPcm0049
     * @tc.desc      PCM math 44100Hz 440Hz amp 0.3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcm0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 44100;
      const frequency: number = 440;
      const amplitude: number = 0.3;
      const channels: number = 2;
      const phase: number = 49;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * phase / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      const frameSize: number = Math.floor((1024) / (channels * 2));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(frameSize).assertLarger(0);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCM_0051
     * @tc.name      testExtFocusPcm0050
     * @tc.desc      PCM math 48000Hz 880Hz amp 0.5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcm0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 48000;
      const frequency: number = 880;
      const amplitude: number = 0.5;
      const channels: number = 1;
      const phase: number = 50;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * phase / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      const frameSize: number = Math.floor((1024) / (channels * 2));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(frameSize).assertLarger(0);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCM_0052
     * @tc.name      testExtFocusPcm0051
     * @tc.desc      PCM math 96000Hz 220Hz amp 1.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcm0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 96000;
      const frequency: number = 220;
      const amplitude: number = 1.0;
      const channels: number = 2;
      const phase: number = 51;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * phase / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      const frameSize: number = Math.floor((1024) / (channels * 2));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(frameSize).assertLarger(0);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCM_0053
     * @tc.name      testExtFocusPcm0052
     * @tc.desc      PCM math 8000Hz 440Hz amp 0.1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcm0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 8000;
      const frequency: number = 440;
      const amplitude: number = 0.1;
      const channels: number = 1;
      const phase: number = 52;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * phase / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      const frameSize: number = Math.floor((1024) / (channels * 2));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(frameSize).assertLarger(0);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCM_0054
     * @tc.name      testExtFocusPcm0053
     * @tc.desc      PCM math 44100Hz 880Hz amp 0.3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcm0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 44100;
      const frequency: number = 880;
      const amplitude: number = 0.3;
      const channels: number = 2;
      const phase: number = 53;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * phase / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      const frameSize: number = Math.floor((1024) / (channels * 2));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(frameSize).assertLarger(0);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCM_0055
     * @tc.name      testExtFocusPcm0054
     * @tc.desc      PCM math 48000Hz 220Hz amp 0.5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcm0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 48000;
      const frequency: number = 220;
      const amplitude: number = 0.5;
      const channels: number = 1;
      const phase: number = 54;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * phase / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      const frameSize: number = Math.floor((1024) / (channels * 2));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(frameSize).assertLarger(0);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCM_0056
     * @tc.name      testExtFocusPcm0055
     * @tc.desc      PCM math 96000Hz 440Hz amp 1.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcm0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 96000;
      const frequency: number = 440;
      const amplitude: number = 1.0;
      const channels: number = 2;
      const phase: number = 55;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * phase / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      const frameSize: number = Math.floor((1024) / (channels * 2));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(frameSize).assertLarger(0);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCM_0057
     * @tc.name      testExtFocusPcm0056
     * @tc.desc      PCM math 8000Hz 880Hz amp 0.1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcm0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 8000;
      const frequency: number = 880;
      const amplitude: number = 0.1;
      const channels: number = 1;
      const phase: number = 56;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * phase / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      const frameSize: number = Math.floor((1024) / (channels * 2));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(frameSize).assertLarger(0);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCM_0058
     * @tc.name      testExtFocusPcm0057
     * @tc.desc      PCM math 44100Hz 220Hz amp 0.3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcm0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 44100;
      const frequency: number = 220;
      const amplitude: number = 0.3;
      const channels: number = 2;
      const phase: number = 57;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * phase / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      const frameSize: number = Math.floor((1024) / (channels * 2));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(frameSize).assertLarger(0);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCM_0059
     * @tc.name      testExtFocusPcm0058
     * @tc.desc      PCM math 48000Hz 440Hz amp 0.5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcm0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 48000;
      const frequency: number = 440;
      const amplitude: number = 0.5;
      const channels: number = 1;
      const phase: number = 58;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * phase / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      const frameSize: number = Math.floor((1024) / (channels * 2));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(frameSize).assertLarger(0);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCM_0060
     * @tc.name      testExtFocusPcm0059
     * @tc.desc      PCM math 96000Hz 880Hz amp 1.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcm0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 96000;
      const frequency: number = 880;
      const amplitude: number = 1.0;
      const channels: number = 2;
      const phase: number = 59;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * phase / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      const frameSize: number = Math.floor((1024) / (channels * 2));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(frameSize).assertLarger(0);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCM_0061
     * @tc.name      testExtFocusPcm0060
     * @tc.desc      PCM math 8000Hz 220Hz amp 0.1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcm0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 8000;
      const frequency: number = 220;
      const amplitude: number = 0.1;
      const channels: number = 1;
      const phase: number = 60;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * phase / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      const frameSize: number = Math.floor((1024) / (channels * 2));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(frameSize).assertLarger(0);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCM_0062
     * @tc.name      testExtFocusPcm0061
     * @tc.desc      PCM math 44100Hz 440Hz amp 0.3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcm0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 44100;
      const frequency: number = 440;
      const amplitude: number = 0.3;
      const channels: number = 2;
      const phase: number = 61;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * phase / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      const frameSize: number = Math.floor((1024) / (channels * 2));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(frameSize).assertLarger(0);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCM_0063
     * @tc.name      testExtFocusPcm0062
     * @tc.desc      PCM math 48000Hz 880Hz amp 0.5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcm0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 48000;
      const frequency: number = 880;
      const amplitude: number = 0.5;
      const channels: number = 1;
      const phase: number = 62;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * phase / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      const frameSize: number = Math.floor((1024) / (channels * 2));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(frameSize).assertLarger(0);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCM_0064
     * @tc.name      testExtFocusPcm0063
     * @tc.desc      PCM math 96000Hz 220Hz amp 1.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcm0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 96000;
      const frequency: number = 220;
      const amplitude: number = 1.0;
      const channels: number = 2;
      const phase: number = 63;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * phase / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      const frameSize: number = Math.floor((1024) / (channels * 2));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(frameSize).assertLarger(0);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCM_0065
     * @tc.name      testExtFocusPcm0064
     * @tc.desc      PCM math 8000Hz 440Hz amp 0.1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcm0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 8000;
      const frequency: number = 440;
      const amplitude: number = 0.1;
      const channels: number = 1;
      const phase: number = 64;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * phase / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      const frameSize: number = Math.floor((1024) / (channels * 2));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(frameSize).assertLarger(0);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCM_0066
     * @tc.name      testExtFocusPcm0065
     * @tc.desc      PCM math 44100Hz 880Hz amp 0.3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcm0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 44100;
      const frequency: number = 880;
      const amplitude: number = 0.3;
      const channels: number = 2;
      const phase: number = 65;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * phase / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      const frameSize: number = Math.floor((1024) / (channels * 2));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(frameSize).assertLarger(0);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCM_0067
     * @tc.name      testExtFocusPcm0066
     * @tc.desc      PCM math 48000Hz 220Hz amp 0.5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcm0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 48000;
      const frequency: number = 220;
      const amplitude: number = 0.5;
      const channels: number = 1;
      const phase: number = 66;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * phase / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      const frameSize: number = Math.floor((1024) / (channels * 2));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(frameSize).assertLarger(0);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCM_0068
     * @tc.name      testExtFocusPcm0067
     * @tc.desc      PCM math 96000Hz 440Hz amp 1.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcm0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 96000;
      const frequency: number = 440;
      const amplitude: number = 1.0;
      const channels: number = 2;
      const phase: number = 67;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * phase / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      const frameSize: number = Math.floor((1024) / (channels * 2));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(frameSize).assertLarger(0);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCM_0069
     * @tc.name      testExtFocusPcm0068
     * @tc.desc      PCM math 8000Hz 880Hz amp 0.1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcm0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 8000;
      const frequency: number = 880;
      const amplitude: number = 0.1;
      const channels: number = 1;
      const phase: number = 68;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * phase / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      const frameSize: number = Math.floor((1024) / (channels * 2));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(frameSize).assertLarger(0);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCM_0070
     * @tc.name      testExtFocusPcm0069
     * @tc.desc      PCM math 44100Hz 220Hz amp 0.3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcm0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 44100;
      const frequency: number = 220;
      const amplitude: number = 0.3;
      const channels: number = 2;
      const phase: number = 69;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * phase / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      const frameSize: number = Math.floor((1024) / (channels * 2));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(frameSize).assertLarger(0);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCM_0071
     * @tc.name      testExtFocusPcm0070
     * @tc.desc      PCM math 48000Hz 440Hz amp 0.5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcm0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 48000;
      const frequency: number = 440;
      const amplitude: number = 0.5;
      const channels: number = 1;
      const phase: number = 70;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * phase / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      const frameSize: number = Math.floor((1024) / (channels * 2));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(frameSize).assertLarger(0);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCM_0072
     * @tc.name      testExtFocusPcm0071
     * @tc.desc      PCM math 96000Hz 880Hz amp 1.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcm0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 96000;
      const frequency: number = 880;
      const amplitude: number = 1.0;
      const channels: number = 2;
      const phase: number = 71;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * phase / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      const frameSize: number = Math.floor((1024) / (channels * 2));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(frameSize).assertLarger(0);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCM_0073
     * @tc.name      testExtFocusPcm0072
     * @tc.desc      PCM math 8000Hz 220Hz amp 0.1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcm0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 8000;
      const frequency: number = 220;
      const amplitude: number = 0.1;
      const channels: number = 1;
      const phase: number = 72;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * phase / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      const frameSize: number = Math.floor((1024) / (channels * 2));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(frameSize).assertLarger(0);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCM_0074
     * @tc.name      testExtFocusPcm0073
     * @tc.desc      PCM math 44100Hz 440Hz amp 0.3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcm0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 44100;
      const frequency: number = 440;
      const amplitude: number = 0.3;
      const channels: number = 2;
      const phase: number = 73;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * phase / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      const frameSize: number = Math.floor((1024) / (channels * 2));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(frameSize).assertLarger(0);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCM_0075
     * @tc.name      testExtFocusPcm0074
     * @tc.desc      PCM math 48000Hz 880Hz amp 0.5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcm0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 48000;
      const frequency: number = 880;
      const amplitude: number = 0.5;
      const channels: number = 1;
      const phase: number = 74;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * phase / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      const frameSize: number = Math.floor((1024) / (channels * 2));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(frameSize).assertLarger(0);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCM_0076
     * @tc.name      testExtFocusPcm0075
     * @tc.desc      PCM math 96000Hz 220Hz amp 1.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcm0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 96000;
      const frequency: number = 220;
      const amplitude: number = 1.0;
      const channels: number = 2;
      const phase: number = 75;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * phase / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      const frameSize: number = Math.floor((1024) / (channels * 2));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(frameSize).assertLarger(0);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCM_0077
     * @tc.name      testExtFocusPcm0076
     * @tc.desc      PCM math 8000Hz 440Hz amp 0.1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcm0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 8000;
      const frequency: number = 440;
      const amplitude: number = 0.1;
      const channels: number = 1;
      const phase: number = 76;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * phase / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      const frameSize: number = Math.floor((1024) / (channels * 2));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(frameSize).assertLarger(0);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCM_0078
     * @tc.name      testExtFocusPcm0077
     * @tc.desc      PCM math 44100Hz 880Hz amp 0.3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcm0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 44100;
      const frequency: number = 880;
      const amplitude: number = 0.3;
      const channels: number = 2;
      const phase: number = 77;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * phase / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      const frameSize: number = Math.floor((1024) / (channels * 2));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(frameSize).assertLarger(0);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCM_0079
     * @tc.name      testExtFocusPcm0078
     * @tc.desc      PCM math 48000Hz 220Hz amp 0.5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcm0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 48000;
      const frequency: number = 220;
      const amplitude: number = 0.5;
      const channels: number = 1;
      const phase: number = 78;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * phase / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      const frameSize: number = Math.floor((1024) / (channels * 2));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(frameSize).assertLarger(0);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCM_0080
     * @tc.name      testExtFocusPcm0079
     * @tc.desc      PCM math 96000Hz 440Hz amp 1.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcm0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 96000;
      const frequency: number = 440;
      const amplitude: number = 1.0;
      const channels: number = 2;
      const phase: number = 79;
      const sample: number = amplitude * Math.sin(2 * Math.PI * frequency * phase / sampleRate);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      const frameSize: number = Math.floor((1024) / (channels * 2));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(frameSize).assertLarger(0);
      expect(sampleRate).assertLarger(0);
    })
  });
}
