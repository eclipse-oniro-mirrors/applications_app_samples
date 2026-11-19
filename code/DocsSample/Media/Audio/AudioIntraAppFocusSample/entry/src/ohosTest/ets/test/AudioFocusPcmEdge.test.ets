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

const TAG: string = '[Sample_audioFocusPcmEdge]';
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

export default function audioFocusPcmEdgeTest(): void {
  describe('audioFocusPcmEdgeTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCMEDGE_0001
     * @tc.name      testExtFocusPcmEdge0000
     * @tc.desc      PCM edge amp -1.0 freq 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcmEdge0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sample: number = -1.0 * Math.sin(2 * Math.PI * 0 * 0 / 8000);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(Number.isNaN(intSample)).assertFalse();
      expect(8000).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCMEDGE_0002
     * @tc.name      testExtFocusPcmEdge0001
     * @tc.desc      PCM edge amp -0.5 freq 220.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcmEdge0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sample: number = -0.5 * Math.sin(2 * Math.PI * 220 * 1 / 48000);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(Number.isNaN(intSample)).assertFalse();
      expect(48000).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCMEDGE_0003
     * @tc.name      testExtFocusPcmEdge0002
     * @tc.desc      PCM edge amp 0.0 freq 440.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcmEdge0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sample: number = 0.0 * Math.sin(2 * Math.PI * 440 * 1000000 / 8000);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(Number.isNaN(intSample)).assertFalse();
      expect(8000).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCMEDGE_0004
     * @tc.name      testExtFocusPcmEdge0003
     * @tc.desc      PCM edge amp 0.5 freq 1000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcmEdge0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sample: number = 0.5 * Math.sin(2 * Math.PI * 1000 * 0 / 48000);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(Number.isNaN(intSample)).assertFalse();
      expect(48000).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCMEDGE_0005
     * @tc.name      testExtFocusPcmEdge0004
     * @tc.desc      PCM edge amp 1.0 freq 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcmEdge0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sample: number = 1.0 * Math.sin(2 * Math.PI * 0 * 1 / 8000);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(Number.isNaN(intSample)).assertFalse();
      expect(8000).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCMEDGE_0006
     * @tc.name      testExtFocusPcmEdge0005
     * @tc.desc      PCM edge amp 2.0 freq 220.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcmEdge0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sample: number = 2.0 * Math.sin(2 * Math.PI * 220 * 1000000 / 48000);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(Number.isNaN(intSample)).assertFalse();
      expect(48000).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCMEDGE_0007
     * @tc.name      testExtFocusPcmEdge0006
     * @tc.desc      PCM edge amp -1.0 freq 440.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcmEdge0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sample: number = -1.0 * Math.sin(2 * Math.PI * 440 * 0 / 8000);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(Number.isNaN(intSample)).assertFalse();
      expect(8000).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCMEDGE_0008
     * @tc.name      testExtFocusPcmEdge0007
     * @tc.desc      PCM edge amp -0.5 freq 1000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcmEdge0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sample: number = -0.5 * Math.sin(2 * Math.PI * 1000 * 1 / 48000);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(Number.isNaN(intSample)).assertFalse();
      expect(48000).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCMEDGE_0009
     * @tc.name      testExtFocusPcmEdge0008
     * @tc.desc      PCM edge amp 0.0 freq 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcmEdge0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sample: number = 0.0 * Math.sin(2 * Math.PI * 0 * 1000000 / 8000);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(Number.isNaN(intSample)).assertFalse();
      expect(8000).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCMEDGE_0010
     * @tc.name      testExtFocusPcmEdge0009
     * @tc.desc      PCM edge amp 0.5 freq 220.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcmEdge0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sample: number = 0.5 * Math.sin(2 * Math.PI * 220 * 0 / 48000);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(Number.isNaN(intSample)).assertFalse();
      expect(48000).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCMEDGE_0011
     * @tc.name      testExtFocusPcmEdge0010
     * @tc.desc      PCM edge amp 1.0 freq 440.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcmEdge0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sample: number = 1.0 * Math.sin(2 * Math.PI * 440 * 1 / 8000);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(Number.isNaN(intSample)).assertFalse();
      expect(8000).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCMEDGE_0012
     * @tc.name      testExtFocusPcmEdge0011
     * @tc.desc      PCM edge amp 2.0 freq 1000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcmEdge0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sample: number = 2.0 * Math.sin(2 * Math.PI * 1000 * 1000000 / 48000);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(Number.isNaN(intSample)).assertFalse();
      expect(48000).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCMEDGE_0013
     * @tc.name      testExtFocusPcmEdge0012
     * @tc.desc      PCM edge amp -1.0 freq 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcmEdge0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sample: number = -1.0 * Math.sin(2 * Math.PI * 0 * 0 / 8000);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(Number.isNaN(intSample)).assertFalse();
      expect(8000).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCMEDGE_0014
     * @tc.name      testExtFocusPcmEdge0013
     * @tc.desc      PCM edge amp -0.5 freq 220.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcmEdge0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sample: number = -0.5 * Math.sin(2 * Math.PI * 220 * 1 / 48000);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(Number.isNaN(intSample)).assertFalse();
      expect(48000).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCMEDGE_0015
     * @tc.name      testExtFocusPcmEdge0014
     * @tc.desc      PCM edge amp 0.0 freq 440.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcmEdge0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sample: number = 0.0 * Math.sin(2 * Math.PI * 440 * 1000000 / 8000);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(Number.isNaN(intSample)).assertFalse();
      expect(8000).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCMEDGE_0016
     * @tc.name      testExtFocusPcmEdge0015
     * @tc.desc      PCM edge amp 0.5 freq 1000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcmEdge0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sample: number = 0.5 * Math.sin(2 * Math.PI * 1000 * 0 / 48000);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(Number.isNaN(intSample)).assertFalse();
      expect(48000).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCMEDGE_0017
     * @tc.name      testExtFocusPcmEdge0016
     * @tc.desc      PCM edge amp 1.0 freq 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcmEdge0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sample: number = 1.0 * Math.sin(2 * Math.PI * 0 * 1 / 8000);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(Number.isNaN(intSample)).assertFalse();
      expect(8000).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCMEDGE_0018
     * @tc.name      testExtFocusPcmEdge0017
     * @tc.desc      PCM edge amp 2.0 freq 220.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcmEdge0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sample: number = 2.0 * Math.sin(2 * Math.PI * 220 * 1000000 / 48000);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(Number.isNaN(intSample)).assertFalse();
      expect(48000).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCMEDGE_0019
     * @tc.name      testExtFocusPcmEdge0018
     * @tc.desc      PCM edge amp -1.0 freq 440.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcmEdge0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sample: number = -1.0 * Math.sin(2 * Math.PI * 440 * 0 / 8000);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(Number.isNaN(intSample)).assertFalse();
      expect(8000).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCMEDGE_0020
     * @tc.name      testExtFocusPcmEdge0019
     * @tc.desc      PCM edge amp -0.5 freq 1000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcmEdge0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sample: number = -0.5 * Math.sin(2 * Math.PI * 1000 * 1 / 48000);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(Number.isNaN(intSample)).assertFalse();
      expect(48000).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCMEDGE_0021
     * @tc.name      testExtFocusPcmEdge0020
     * @tc.desc      PCM edge amp 0.0 freq 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcmEdge0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sample: number = 0.0 * Math.sin(2 * Math.PI * 0 * 1000000 / 8000);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(Number.isNaN(intSample)).assertFalse();
      expect(8000).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCMEDGE_0022
     * @tc.name      testExtFocusPcmEdge0021
     * @tc.desc      PCM edge amp 0.5 freq 220.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcmEdge0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sample: number = 0.5 * Math.sin(2 * Math.PI * 220 * 0 / 48000);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(Number.isNaN(intSample)).assertFalse();
      expect(48000).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCMEDGE_0023
     * @tc.name      testExtFocusPcmEdge0022
     * @tc.desc      PCM edge amp 1.0 freq 440.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcmEdge0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sample: number = 1.0 * Math.sin(2 * Math.PI * 440 * 1 / 8000);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(Number.isNaN(intSample)).assertFalse();
      expect(8000).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCMEDGE_0024
     * @tc.name      testExtFocusPcmEdge0023
     * @tc.desc      PCM edge amp 2.0 freq 1000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcmEdge0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sample: number = 2.0 * Math.sin(2 * Math.PI * 1000 * 1000000 / 48000);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(Number.isNaN(intSample)).assertFalse();
      expect(48000).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCMEDGE_0025
     * @tc.name      testExtFocusPcmEdge0024
     * @tc.desc      PCM edge amp -1.0 freq 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcmEdge0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sample: number = -1.0 * Math.sin(2 * Math.PI * 0 * 0 / 8000);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(Number.isNaN(intSample)).assertFalse();
      expect(8000).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCMEDGE_0026
     * @tc.name      testExtFocusPcmEdge0025
     * @tc.desc      PCM edge amp -0.5 freq 220.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcmEdge0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sample: number = -0.5 * Math.sin(2 * Math.PI * 220 * 1 / 48000);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(Number.isNaN(intSample)).assertFalse();
      expect(48000).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCMEDGE_0027
     * @tc.name      testExtFocusPcmEdge0026
     * @tc.desc      PCM edge amp 0.0 freq 440.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcmEdge0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sample: number = 0.0 * Math.sin(2 * Math.PI * 440 * 1000000 / 8000);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(Number.isNaN(intSample)).assertFalse();
      expect(8000).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCMEDGE_0028
     * @tc.name      testExtFocusPcmEdge0027
     * @tc.desc      PCM edge amp 0.5 freq 1000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcmEdge0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sample: number = 0.5 * Math.sin(2 * Math.PI * 1000 * 0 / 48000);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(Number.isNaN(intSample)).assertFalse();
      expect(48000).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCMEDGE_0029
     * @tc.name      testExtFocusPcmEdge0028
     * @tc.desc      PCM edge amp 1.0 freq 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcmEdge0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sample: number = 1.0 * Math.sin(2 * Math.PI * 0 * 1 / 8000);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(Number.isNaN(intSample)).assertFalse();
      expect(8000).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCMEDGE_0030
     * @tc.name      testExtFocusPcmEdge0029
     * @tc.desc      PCM edge amp 2.0 freq 220.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcmEdge0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sample: number = 2.0 * Math.sin(2 * Math.PI * 220 * 1000000 / 48000);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(Number.isNaN(intSample)).assertFalse();
      expect(48000).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCMEDGE_0031
     * @tc.name      testExtFocusPcmEdge0030
     * @tc.desc      PCM edge amp -1.0 freq 440.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcmEdge0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sample: number = -1.0 * Math.sin(2 * Math.PI * 440 * 0 / 8000);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(Number.isNaN(intSample)).assertFalse();
      expect(8000).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCMEDGE_0032
     * @tc.name      testExtFocusPcmEdge0031
     * @tc.desc      PCM edge amp -0.5 freq 1000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcmEdge0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sample: number = -0.5 * Math.sin(2 * Math.PI * 1000 * 1 / 48000);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(Number.isNaN(intSample)).assertFalse();
      expect(48000).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCMEDGE_0033
     * @tc.name      testExtFocusPcmEdge0032
     * @tc.desc      PCM edge amp 0.0 freq 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcmEdge0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sample: number = 0.0 * Math.sin(2 * Math.PI * 0 * 1000000 / 8000);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(Number.isNaN(intSample)).assertFalse();
      expect(8000).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCMEDGE_0034
     * @tc.name      testExtFocusPcmEdge0033
     * @tc.desc      PCM edge amp 0.5 freq 220.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcmEdge0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sample: number = 0.5 * Math.sin(2 * Math.PI * 220 * 0 / 48000);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(Number.isNaN(intSample)).assertFalse();
      expect(48000).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCMEDGE_0035
     * @tc.name      testExtFocusPcmEdge0034
     * @tc.desc      PCM edge amp 1.0 freq 440.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcmEdge0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sample: number = 1.0 * Math.sin(2 * Math.PI * 440 * 1 / 8000);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(Number.isNaN(intSample)).assertFalse();
      expect(8000).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCMEDGE_0036
     * @tc.name      testExtFocusPcmEdge0035
     * @tc.desc      PCM edge amp 2.0 freq 1000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcmEdge0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sample: number = 2.0 * Math.sin(2 * Math.PI * 1000 * 1000000 / 48000);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(Number.isNaN(intSample)).assertFalse();
      expect(48000).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCMEDGE_0037
     * @tc.name      testExtFocusPcmEdge0036
     * @tc.desc      PCM edge amp -1.0 freq 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcmEdge0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sample: number = -1.0 * Math.sin(2 * Math.PI * 0 * 0 / 8000);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(Number.isNaN(intSample)).assertFalse();
      expect(8000).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCMEDGE_0038
     * @tc.name      testExtFocusPcmEdge0037
     * @tc.desc      PCM edge amp -0.5 freq 220.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcmEdge0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sample: number = -0.5 * Math.sin(2 * Math.PI * 220 * 1 / 48000);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(Number.isNaN(intSample)).assertFalse();
      expect(48000).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCMEDGE_0039
     * @tc.name      testExtFocusPcmEdge0038
     * @tc.desc      PCM edge amp 0.0 freq 440.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcmEdge0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sample: number = 0.0 * Math.sin(2 * Math.PI * 440 * 1000000 / 8000);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(Number.isNaN(intSample)).assertFalse();
      expect(8000).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PCMEDGE_0040
     * @tc.name      testExtFocusPcmEdge0039
     * @tc.desc      PCM edge amp 0.5 freq 1000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPcmEdge0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sample: number = 0.5 * Math.sin(2 * Math.PI * 1000 * 0 / 48000);
      const intSample: number = Math.max(-32767, Math.min(32767, Math.round(sample * 32767)));
      expect(intSample).assertLargerOrEqual(-32767);
      expect(intSample).assertLessOrEqual(32767);
      expect(Number.isNaN(intSample)).assertFalse();
      expect(48000).assertLarger(0);
    })
  });
}
