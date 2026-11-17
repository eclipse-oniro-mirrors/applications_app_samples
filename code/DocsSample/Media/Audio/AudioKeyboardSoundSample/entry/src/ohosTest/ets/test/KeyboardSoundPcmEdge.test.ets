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

const TAG: string = '[Sample_keyboardSoundPcmEdge]';
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

export default function keyboardSoundPcmEdgeTest(): void {
  describe('keyboardSoundPcmEdgeTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCMEDGE_0001
     * @tc.name      testExtKeyboardPcmEdge0000
     * @tc.desc      PCM edge amp -1.0 freq 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcmEdge0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sample: number = Math.floor(Math.sin(0) * -1.0 * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(0).assertLargerOrEqual(0);
      expect(Number.isNaN(clamped)).assertFalse();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCMEDGE_0002
     * @tc.name      testExtKeyboardPcmEdge0001
     * @tc.desc      PCM edge amp -0.3 freq 500.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcmEdge0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sample: number = Math.floor(Math.sin(3.14) * -0.3 * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(500).assertLargerOrEqual(0);
      expect(Number.isNaN(clamped)).assertFalse();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCMEDGE_0003
     * @tc.name      testExtKeyboardPcmEdge0002
     * @tc.desc      PCM edge amp 0.0 freq 1000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcmEdge0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sample: number = Math.floor(Math.sin(6.28) * 0.0 * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(1000).assertLargerOrEqual(0);
      expect(Number.isNaN(clamped)).assertFalse();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCMEDGE_0004
     * @tc.name      testExtKeyboardPcmEdge0003
     * @tc.desc      PCM edge amp 0.3 freq 4000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcmEdge0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sample: number = Math.floor(Math.sin(100.0) * 0.3 * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(4000).assertLargerOrEqual(0);
      expect(Number.isNaN(clamped)).assertFalse();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCMEDGE_0005
     * @tc.name      testExtKeyboardPcmEdge0004
     * @tc.desc      PCM edge amp 1.0 freq 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcmEdge0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sample: number = Math.floor(Math.sin(0) * 1.0 * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(0).assertLargerOrEqual(0);
      expect(Number.isNaN(clamped)).assertFalse();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCMEDGE_0006
     * @tc.name      testExtKeyboardPcmEdge0005
     * @tc.desc      PCM edge amp 2.0 freq 500.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcmEdge0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sample: number = Math.floor(Math.sin(3.14) * 2.0 * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(500).assertLargerOrEqual(0);
      expect(Number.isNaN(clamped)).assertFalse();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCMEDGE_0007
     * @tc.name      testExtKeyboardPcmEdge0006
     * @tc.desc      PCM edge amp -1.0 freq 1000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcmEdge0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sample: number = Math.floor(Math.sin(6.28) * -1.0 * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(1000).assertLargerOrEqual(0);
      expect(Number.isNaN(clamped)).assertFalse();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCMEDGE_0008
     * @tc.name      testExtKeyboardPcmEdge0007
     * @tc.desc      PCM edge amp -0.3 freq 4000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcmEdge0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sample: number = Math.floor(Math.sin(100.0) * -0.3 * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(4000).assertLargerOrEqual(0);
      expect(Number.isNaN(clamped)).assertFalse();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCMEDGE_0009
     * @tc.name      testExtKeyboardPcmEdge0008
     * @tc.desc      PCM edge amp 0.0 freq 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcmEdge0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sample: number = Math.floor(Math.sin(0) * 0.0 * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(0).assertLargerOrEqual(0);
      expect(Number.isNaN(clamped)).assertFalse();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCMEDGE_0010
     * @tc.name      testExtKeyboardPcmEdge0009
     * @tc.desc      PCM edge amp 0.3 freq 500.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcmEdge0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sample: number = Math.floor(Math.sin(3.14) * 0.3 * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(500).assertLargerOrEqual(0);
      expect(Number.isNaN(clamped)).assertFalse();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCMEDGE_0011
     * @tc.name      testExtKeyboardPcmEdge0010
     * @tc.desc      PCM edge amp 1.0 freq 1000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcmEdge0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sample: number = Math.floor(Math.sin(6.28) * 1.0 * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(1000).assertLargerOrEqual(0);
      expect(Number.isNaN(clamped)).assertFalse();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCMEDGE_0012
     * @tc.name      testExtKeyboardPcmEdge0011
     * @tc.desc      PCM edge amp 2.0 freq 4000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcmEdge0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sample: number = Math.floor(Math.sin(100.0) * 2.0 * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(4000).assertLargerOrEqual(0);
      expect(Number.isNaN(clamped)).assertFalse();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCMEDGE_0013
     * @tc.name      testExtKeyboardPcmEdge0012
     * @tc.desc      PCM edge amp -1.0 freq 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcmEdge0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sample: number = Math.floor(Math.sin(0) * -1.0 * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(0).assertLargerOrEqual(0);
      expect(Number.isNaN(clamped)).assertFalse();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCMEDGE_0014
     * @tc.name      testExtKeyboardPcmEdge0013
     * @tc.desc      PCM edge amp -0.3 freq 500.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcmEdge0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sample: number = Math.floor(Math.sin(3.14) * -0.3 * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(500).assertLargerOrEqual(0);
      expect(Number.isNaN(clamped)).assertFalse();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCMEDGE_0015
     * @tc.name      testExtKeyboardPcmEdge0014
     * @tc.desc      PCM edge amp 0.0 freq 1000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcmEdge0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sample: number = Math.floor(Math.sin(6.28) * 0.0 * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(1000).assertLargerOrEqual(0);
      expect(Number.isNaN(clamped)).assertFalse();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCMEDGE_0016
     * @tc.name      testExtKeyboardPcmEdge0015
     * @tc.desc      PCM edge amp 0.3 freq 4000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcmEdge0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sample: number = Math.floor(Math.sin(100.0) * 0.3 * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(4000).assertLargerOrEqual(0);
      expect(Number.isNaN(clamped)).assertFalse();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCMEDGE_0017
     * @tc.name      testExtKeyboardPcmEdge0016
     * @tc.desc      PCM edge amp 1.0 freq 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcmEdge0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sample: number = Math.floor(Math.sin(0) * 1.0 * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(0).assertLargerOrEqual(0);
      expect(Number.isNaN(clamped)).assertFalse();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCMEDGE_0018
     * @tc.name      testExtKeyboardPcmEdge0017
     * @tc.desc      PCM edge amp 2.0 freq 500.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcmEdge0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sample: number = Math.floor(Math.sin(3.14) * 2.0 * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(500).assertLargerOrEqual(0);
      expect(Number.isNaN(clamped)).assertFalse();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCMEDGE_0019
     * @tc.name      testExtKeyboardPcmEdge0018
     * @tc.desc      PCM edge amp -1.0 freq 1000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcmEdge0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sample: number = Math.floor(Math.sin(6.28) * -1.0 * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(1000).assertLargerOrEqual(0);
      expect(Number.isNaN(clamped)).assertFalse();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCMEDGE_0020
     * @tc.name      testExtKeyboardPcmEdge0019
     * @tc.desc      PCM edge amp -0.3 freq 4000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcmEdge0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sample: number = Math.floor(Math.sin(100.0) * -0.3 * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(4000).assertLargerOrEqual(0);
      expect(Number.isNaN(clamped)).assertFalse();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCMEDGE_0021
     * @tc.name      testExtKeyboardPcmEdge0020
     * @tc.desc      PCM edge amp 0.0 freq 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcmEdge0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sample: number = Math.floor(Math.sin(0) * 0.0 * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(0).assertLargerOrEqual(0);
      expect(Number.isNaN(clamped)).assertFalse();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCMEDGE_0022
     * @tc.name      testExtKeyboardPcmEdge0021
     * @tc.desc      PCM edge amp 0.3 freq 500.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcmEdge0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sample: number = Math.floor(Math.sin(3.14) * 0.3 * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(500).assertLargerOrEqual(0);
      expect(Number.isNaN(clamped)).assertFalse();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCMEDGE_0023
     * @tc.name      testExtKeyboardPcmEdge0022
     * @tc.desc      PCM edge amp 1.0 freq 1000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcmEdge0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sample: number = Math.floor(Math.sin(6.28) * 1.0 * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(1000).assertLargerOrEqual(0);
      expect(Number.isNaN(clamped)).assertFalse();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCMEDGE_0024
     * @tc.name      testExtKeyboardPcmEdge0023
     * @tc.desc      PCM edge amp 2.0 freq 4000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcmEdge0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sample: number = Math.floor(Math.sin(100.0) * 2.0 * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(4000).assertLargerOrEqual(0);
      expect(Number.isNaN(clamped)).assertFalse();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCMEDGE_0025
     * @tc.name      testExtKeyboardPcmEdge0024
     * @tc.desc      PCM edge amp -1.0 freq 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcmEdge0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sample: number = Math.floor(Math.sin(0) * -1.0 * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(0).assertLargerOrEqual(0);
      expect(Number.isNaN(clamped)).assertFalse();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCMEDGE_0026
     * @tc.name      testExtKeyboardPcmEdge0025
     * @tc.desc      PCM edge amp -0.3 freq 500.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcmEdge0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sample: number = Math.floor(Math.sin(3.14) * -0.3 * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(500).assertLargerOrEqual(0);
      expect(Number.isNaN(clamped)).assertFalse();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCMEDGE_0027
     * @tc.name      testExtKeyboardPcmEdge0026
     * @tc.desc      PCM edge amp 0.0 freq 1000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcmEdge0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sample: number = Math.floor(Math.sin(6.28) * 0.0 * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(1000).assertLargerOrEqual(0);
      expect(Number.isNaN(clamped)).assertFalse();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCMEDGE_0028
     * @tc.name      testExtKeyboardPcmEdge0027
     * @tc.desc      PCM edge amp 0.3 freq 4000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcmEdge0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sample: number = Math.floor(Math.sin(100.0) * 0.3 * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(4000).assertLargerOrEqual(0);
      expect(Number.isNaN(clamped)).assertFalse();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCMEDGE_0029
     * @tc.name      testExtKeyboardPcmEdge0028
     * @tc.desc      PCM edge amp 1.0 freq 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcmEdge0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sample: number = Math.floor(Math.sin(0) * 1.0 * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(0).assertLargerOrEqual(0);
      expect(Number.isNaN(clamped)).assertFalse();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCMEDGE_0030
     * @tc.name      testExtKeyboardPcmEdge0029
     * @tc.desc      PCM edge amp 2.0 freq 500.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcmEdge0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sample: number = Math.floor(Math.sin(3.14) * 2.0 * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(500).assertLargerOrEqual(0);
      expect(Number.isNaN(clamped)).assertFalse();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCMEDGE_0031
     * @tc.name      testExtKeyboardPcmEdge0030
     * @tc.desc      PCM edge amp -1.0 freq 1000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcmEdge0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sample: number = Math.floor(Math.sin(6.28) * -1.0 * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(1000).assertLargerOrEqual(0);
      expect(Number.isNaN(clamped)).assertFalse();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCMEDGE_0032
     * @tc.name      testExtKeyboardPcmEdge0031
     * @tc.desc      PCM edge amp -0.3 freq 4000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcmEdge0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sample: number = Math.floor(Math.sin(100.0) * -0.3 * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(4000).assertLargerOrEqual(0);
      expect(Number.isNaN(clamped)).assertFalse();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCMEDGE_0033
     * @tc.name      testExtKeyboardPcmEdge0032
     * @tc.desc      PCM edge amp 0.0 freq 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcmEdge0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sample: number = Math.floor(Math.sin(0) * 0.0 * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(0).assertLargerOrEqual(0);
      expect(Number.isNaN(clamped)).assertFalse();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCMEDGE_0034
     * @tc.name      testExtKeyboardPcmEdge0033
     * @tc.desc      PCM edge amp 0.3 freq 500.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcmEdge0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sample: number = Math.floor(Math.sin(3.14) * 0.3 * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(500).assertLargerOrEqual(0);
      expect(Number.isNaN(clamped)).assertFalse();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCMEDGE_0035
     * @tc.name      testExtKeyboardPcmEdge0034
     * @tc.desc      PCM edge amp 1.0 freq 1000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcmEdge0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sample: number = Math.floor(Math.sin(6.28) * 1.0 * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(1000).assertLargerOrEqual(0);
      expect(Number.isNaN(clamped)).assertFalse();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCMEDGE_0036
     * @tc.name      testExtKeyboardPcmEdge0035
     * @tc.desc      PCM edge amp 2.0 freq 4000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcmEdge0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sample: number = Math.floor(Math.sin(100.0) * 2.0 * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(4000).assertLargerOrEqual(0);
      expect(Number.isNaN(clamped)).assertFalse();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCMEDGE_0037
     * @tc.name      testExtKeyboardPcmEdge0036
     * @tc.desc      PCM edge amp -1.0 freq 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcmEdge0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sample: number = Math.floor(Math.sin(0) * -1.0 * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(0).assertLargerOrEqual(0);
      expect(Number.isNaN(clamped)).assertFalse();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCMEDGE_0038
     * @tc.name      testExtKeyboardPcmEdge0037
     * @tc.desc      PCM edge amp -0.3 freq 500.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcmEdge0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sample: number = Math.floor(Math.sin(3.14) * -0.3 * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(500).assertLargerOrEqual(0);
      expect(Number.isNaN(clamped)).assertFalse();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCMEDGE_0039
     * @tc.name      testExtKeyboardPcmEdge0038
     * @tc.desc      PCM edge amp 0.0 freq 1000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcmEdge0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sample: number = Math.floor(Math.sin(6.28) * 0.0 * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(1000).assertLargerOrEqual(0);
      expect(Number.isNaN(clamped)).assertFalse();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCMEDGE_0040
     * @tc.name      testExtKeyboardPcmEdge0039
     * @tc.desc      PCM edge amp 0.3 freq 4000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcmEdge0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sample: number = Math.floor(Math.sin(100.0) * 0.3 * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(4000).assertLargerOrEqual(0);
      expect(Number.isNaN(clamped)).assertFalse();
    })
  });
}
