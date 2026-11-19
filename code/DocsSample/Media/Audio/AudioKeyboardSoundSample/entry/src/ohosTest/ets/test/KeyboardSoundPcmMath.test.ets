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

const TAG: string = '[Sample_keyboardSoundPcmMath]';
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

export default function keyboardSoundPcmMathTest(): void {
  describe('keyboardSoundPcmMathTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCM_0001
     * @tc.name      testExtKeyboardPcm0000
     * @tc.desc      PCM frames 256 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcm0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 256;
      const channels: number = 1;
      const bufferBytes: number = frames * channels * 2;
      const inc: number = 2 * Math.PI * 500 / 44100;
      const sample: number = Math.floor(Math.sin(0) * 0.3 * 32767);
      expect(bufferBytes).assertEqual(512);
      expect(sample).assertLargerOrEqual(-32767);
      expect(sample).assertLessOrEqual(32767);
      expect(inc).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCM_0002
     * @tc.name      testExtKeyboardPcm0001
     * @tc.desc      PCM frames 512 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcm0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 512;
      const channels: number = 2;
      const bufferBytes: number = frames * channels * 2;
      const inc: number = 2 * Math.PI * 1000 / 44100;
      const sample: number = Math.floor(Math.sin(0.5) * 0.3 * 32767);
      expect(bufferBytes).assertEqual(2048);
      expect(sample).assertLargerOrEqual(-32767);
      expect(sample).assertLessOrEqual(32767);
      expect(inc).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCM_0003
     * @tc.name      testExtKeyboardPcm0002
     * @tc.desc      PCM frames 1024 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcm0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 1024;
      const channels: number = 1;
      const bufferBytes: number = frames * channels * 2;
      const inc: number = 2 * Math.PI * 2000 / 44100;
      const sample: number = Math.floor(Math.sin(1.0) * 0.3 * 32767);
      expect(bufferBytes).assertEqual(2048);
      expect(sample).assertLargerOrEqual(-32767);
      expect(sample).assertLessOrEqual(32767);
      expect(inc).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCM_0004
     * @tc.name      testExtKeyboardPcm0003
     * @tc.desc      PCM frames 2048 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcm0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 2048;
      const channels: number = 2;
      const bufferBytes: number = frames * channels * 2;
      const inc: number = 2 * Math.PI * 500 / 44100;
      const sample: number = Math.floor(Math.sin(3.14) * 0.3 * 32767);
      expect(bufferBytes).assertEqual(8192);
      expect(sample).assertLargerOrEqual(-32767);
      expect(sample).assertLessOrEqual(32767);
      expect(inc).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCM_0005
     * @tc.name      testExtKeyboardPcm0004
     * @tc.desc      PCM frames 256 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcm0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 256;
      const channels: number = 1;
      const bufferBytes: number = frames * channels * 2;
      const inc: number = 2 * Math.PI * 1000 / 44100;
      const sample: number = Math.floor(Math.sin(0) * 0.3 * 32767);
      expect(bufferBytes).assertEqual(512);
      expect(sample).assertLargerOrEqual(-32767);
      expect(sample).assertLessOrEqual(32767);
      expect(inc).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCM_0006
     * @tc.name      testExtKeyboardPcm0005
     * @tc.desc      PCM frames 512 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcm0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 512;
      const channels: number = 2;
      const bufferBytes: number = frames * channels * 2;
      const inc: number = 2 * Math.PI * 2000 / 44100;
      const sample: number = Math.floor(Math.sin(0.5) * 0.3 * 32767);
      expect(bufferBytes).assertEqual(2048);
      expect(sample).assertLargerOrEqual(-32767);
      expect(sample).assertLessOrEqual(32767);
      expect(inc).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCM_0007
     * @tc.name      testExtKeyboardPcm0006
     * @tc.desc      PCM frames 1024 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcm0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 1024;
      const channels: number = 1;
      const bufferBytes: number = frames * channels * 2;
      const inc: number = 2 * Math.PI * 500 / 44100;
      const sample: number = Math.floor(Math.sin(1.0) * 0.3 * 32767);
      expect(bufferBytes).assertEqual(2048);
      expect(sample).assertLargerOrEqual(-32767);
      expect(sample).assertLessOrEqual(32767);
      expect(inc).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCM_0008
     * @tc.name      testExtKeyboardPcm0007
     * @tc.desc      PCM frames 2048 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcm0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 2048;
      const channels: number = 2;
      const bufferBytes: number = frames * channels * 2;
      const inc: number = 2 * Math.PI * 1000 / 44100;
      const sample: number = Math.floor(Math.sin(3.14) * 0.3 * 32767);
      expect(bufferBytes).assertEqual(8192);
      expect(sample).assertLargerOrEqual(-32767);
      expect(sample).assertLessOrEqual(32767);
      expect(inc).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCM_0009
     * @tc.name      testExtKeyboardPcm0008
     * @tc.desc      PCM frames 256 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcm0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 256;
      const channels: number = 1;
      const bufferBytes: number = frames * channels * 2;
      const inc: number = 2 * Math.PI * 2000 / 44100;
      const sample: number = Math.floor(Math.sin(0) * 0.3 * 32767);
      expect(bufferBytes).assertEqual(512);
      expect(sample).assertLargerOrEqual(-32767);
      expect(sample).assertLessOrEqual(32767);
      expect(inc).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCM_0010
     * @tc.name      testExtKeyboardPcm0009
     * @tc.desc      PCM frames 512 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcm0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 512;
      const channels: number = 2;
      const bufferBytes: number = frames * channels * 2;
      const inc: number = 2 * Math.PI * 500 / 44100;
      const sample: number = Math.floor(Math.sin(0.5) * 0.3 * 32767);
      expect(bufferBytes).assertEqual(2048);
      expect(sample).assertLargerOrEqual(-32767);
      expect(sample).assertLessOrEqual(32767);
      expect(inc).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCM_0011
     * @tc.name      testExtKeyboardPcm0010
     * @tc.desc      PCM frames 1024 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcm0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 1024;
      const channels: number = 1;
      const bufferBytes: number = frames * channels * 2;
      const inc: number = 2 * Math.PI * 1000 / 44100;
      const sample: number = Math.floor(Math.sin(1.0) * 0.3 * 32767);
      expect(bufferBytes).assertEqual(2048);
      expect(sample).assertLargerOrEqual(-32767);
      expect(sample).assertLessOrEqual(32767);
      expect(inc).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCM_0012
     * @tc.name      testExtKeyboardPcm0011
     * @tc.desc      PCM frames 2048 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcm0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 2048;
      const channels: number = 2;
      const bufferBytes: number = frames * channels * 2;
      const inc: number = 2 * Math.PI * 2000 / 44100;
      const sample: number = Math.floor(Math.sin(3.14) * 0.3 * 32767);
      expect(bufferBytes).assertEqual(8192);
      expect(sample).assertLargerOrEqual(-32767);
      expect(sample).assertLessOrEqual(32767);
      expect(inc).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCM_0013
     * @tc.name      testExtKeyboardPcm0012
     * @tc.desc      PCM frames 256 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcm0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 256;
      const channels: number = 1;
      const bufferBytes: number = frames * channels * 2;
      const inc: number = 2 * Math.PI * 500 / 44100;
      const sample: number = Math.floor(Math.sin(0) * 0.3 * 32767);
      expect(bufferBytes).assertEqual(512);
      expect(sample).assertLargerOrEqual(-32767);
      expect(sample).assertLessOrEqual(32767);
      expect(inc).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCM_0014
     * @tc.name      testExtKeyboardPcm0013
     * @tc.desc      PCM frames 512 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcm0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 512;
      const channels: number = 2;
      const bufferBytes: number = frames * channels * 2;
      const inc: number = 2 * Math.PI * 1000 / 44100;
      const sample: number = Math.floor(Math.sin(0.5) * 0.3 * 32767);
      expect(bufferBytes).assertEqual(2048);
      expect(sample).assertLargerOrEqual(-32767);
      expect(sample).assertLessOrEqual(32767);
      expect(inc).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCM_0015
     * @tc.name      testExtKeyboardPcm0014
     * @tc.desc      PCM frames 1024 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcm0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 1024;
      const channels: number = 1;
      const bufferBytes: number = frames * channels * 2;
      const inc: number = 2 * Math.PI * 2000 / 44100;
      const sample: number = Math.floor(Math.sin(1.0) * 0.3 * 32767);
      expect(bufferBytes).assertEqual(2048);
      expect(sample).assertLargerOrEqual(-32767);
      expect(sample).assertLessOrEqual(32767);
      expect(inc).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCM_0016
     * @tc.name      testExtKeyboardPcm0015
     * @tc.desc      PCM frames 2048 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcm0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 2048;
      const channels: number = 2;
      const bufferBytes: number = frames * channels * 2;
      const inc: number = 2 * Math.PI * 500 / 44100;
      const sample: number = Math.floor(Math.sin(3.14) * 0.3 * 32767);
      expect(bufferBytes).assertEqual(8192);
      expect(sample).assertLargerOrEqual(-32767);
      expect(sample).assertLessOrEqual(32767);
      expect(inc).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCM_0017
     * @tc.name      testExtKeyboardPcm0016
     * @tc.desc      PCM frames 256 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcm0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 256;
      const channels: number = 1;
      const bufferBytes: number = frames * channels * 2;
      const inc: number = 2 * Math.PI * 1000 / 44100;
      const sample: number = Math.floor(Math.sin(0) * 0.3 * 32767);
      expect(bufferBytes).assertEqual(512);
      expect(sample).assertLargerOrEqual(-32767);
      expect(sample).assertLessOrEqual(32767);
      expect(inc).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCM_0018
     * @tc.name      testExtKeyboardPcm0017
     * @tc.desc      PCM frames 512 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcm0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 512;
      const channels: number = 2;
      const bufferBytes: number = frames * channels * 2;
      const inc: number = 2 * Math.PI * 2000 / 44100;
      const sample: number = Math.floor(Math.sin(0.5) * 0.3 * 32767);
      expect(bufferBytes).assertEqual(2048);
      expect(sample).assertLargerOrEqual(-32767);
      expect(sample).assertLessOrEqual(32767);
      expect(inc).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCM_0019
     * @tc.name      testExtKeyboardPcm0018
     * @tc.desc      PCM frames 1024 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcm0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 1024;
      const channels: number = 1;
      const bufferBytes: number = frames * channels * 2;
      const inc: number = 2 * Math.PI * 500 / 44100;
      const sample: number = Math.floor(Math.sin(1.0) * 0.3 * 32767);
      expect(bufferBytes).assertEqual(2048);
      expect(sample).assertLargerOrEqual(-32767);
      expect(sample).assertLessOrEqual(32767);
      expect(inc).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCM_0020
     * @tc.name      testExtKeyboardPcm0019
     * @tc.desc      PCM frames 2048 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcm0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 2048;
      const channels: number = 2;
      const bufferBytes: number = frames * channels * 2;
      const inc: number = 2 * Math.PI * 1000 / 44100;
      const sample: number = Math.floor(Math.sin(3.14) * 0.3 * 32767);
      expect(bufferBytes).assertEqual(8192);
      expect(sample).assertLargerOrEqual(-32767);
      expect(sample).assertLessOrEqual(32767);
      expect(inc).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCM_0021
     * @tc.name      testExtKeyboardPcm0020
     * @tc.desc      PCM frames 256 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcm0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 256;
      const channels: number = 1;
      const bufferBytes: number = frames * channels * 2;
      const inc: number = 2 * Math.PI * 2000 / 44100;
      const sample: number = Math.floor(Math.sin(0) * 0.3 * 32767);
      expect(bufferBytes).assertEqual(512);
      expect(sample).assertLargerOrEqual(-32767);
      expect(sample).assertLessOrEqual(32767);
      expect(inc).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCM_0022
     * @tc.name      testExtKeyboardPcm0021
     * @tc.desc      PCM frames 512 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcm0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 512;
      const channels: number = 2;
      const bufferBytes: number = frames * channels * 2;
      const inc: number = 2 * Math.PI * 500 / 44100;
      const sample: number = Math.floor(Math.sin(0.5) * 0.3 * 32767);
      expect(bufferBytes).assertEqual(2048);
      expect(sample).assertLargerOrEqual(-32767);
      expect(sample).assertLessOrEqual(32767);
      expect(inc).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCM_0023
     * @tc.name      testExtKeyboardPcm0022
     * @tc.desc      PCM frames 1024 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcm0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 1024;
      const channels: number = 1;
      const bufferBytes: number = frames * channels * 2;
      const inc: number = 2 * Math.PI * 1000 / 44100;
      const sample: number = Math.floor(Math.sin(1.0) * 0.3 * 32767);
      expect(bufferBytes).assertEqual(2048);
      expect(sample).assertLargerOrEqual(-32767);
      expect(sample).assertLessOrEqual(32767);
      expect(inc).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCM_0024
     * @tc.name      testExtKeyboardPcm0023
     * @tc.desc      PCM frames 2048 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcm0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 2048;
      const channels: number = 2;
      const bufferBytes: number = frames * channels * 2;
      const inc: number = 2 * Math.PI * 2000 / 44100;
      const sample: number = Math.floor(Math.sin(3.14) * 0.3 * 32767);
      expect(bufferBytes).assertEqual(8192);
      expect(sample).assertLargerOrEqual(-32767);
      expect(sample).assertLessOrEqual(32767);
      expect(inc).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCM_0025
     * @tc.name      testExtKeyboardPcm0024
     * @tc.desc      PCM frames 256 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcm0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 256;
      const channels: number = 1;
      const bufferBytes: number = frames * channels * 2;
      const inc: number = 2 * Math.PI * 500 / 44100;
      const sample: number = Math.floor(Math.sin(0) * 0.3 * 32767);
      expect(bufferBytes).assertEqual(512);
      expect(sample).assertLargerOrEqual(-32767);
      expect(sample).assertLessOrEqual(32767);
      expect(inc).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCM_0026
     * @tc.name      testExtKeyboardPcm0025
     * @tc.desc      PCM frames 512 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcm0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 512;
      const channels: number = 2;
      const bufferBytes: number = frames * channels * 2;
      const inc: number = 2 * Math.PI * 1000 / 44100;
      const sample: number = Math.floor(Math.sin(0.5) * 0.3 * 32767);
      expect(bufferBytes).assertEqual(2048);
      expect(sample).assertLargerOrEqual(-32767);
      expect(sample).assertLessOrEqual(32767);
      expect(inc).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCM_0027
     * @tc.name      testExtKeyboardPcm0026
     * @tc.desc      PCM frames 1024 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcm0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 1024;
      const channels: number = 1;
      const bufferBytes: number = frames * channels * 2;
      const inc: number = 2 * Math.PI * 2000 / 44100;
      const sample: number = Math.floor(Math.sin(1.0) * 0.3 * 32767);
      expect(bufferBytes).assertEqual(2048);
      expect(sample).assertLargerOrEqual(-32767);
      expect(sample).assertLessOrEqual(32767);
      expect(inc).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCM_0028
     * @tc.name      testExtKeyboardPcm0027
     * @tc.desc      PCM frames 2048 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcm0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 2048;
      const channels: number = 2;
      const bufferBytes: number = frames * channels * 2;
      const inc: number = 2 * Math.PI * 500 / 44100;
      const sample: number = Math.floor(Math.sin(3.14) * 0.3 * 32767);
      expect(bufferBytes).assertEqual(8192);
      expect(sample).assertLargerOrEqual(-32767);
      expect(sample).assertLessOrEqual(32767);
      expect(inc).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCM_0029
     * @tc.name      testExtKeyboardPcm0028
     * @tc.desc      PCM frames 256 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcm0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 256;
      const channels: number = 1;
      const bufferBytes: number = frames * channels * 2;
      const inc: number = 2 * Math.PI * 1000 / 44100;
      const sample: number = Math.floor(Math.sin(0) * 0.3 * 32767);
      expect(bufferBytes).assertEqual(512);
      expect(sample).assertLargerOrEqual(-32767);
      expect(sample).assertLessOrEqual(32767);
      expect(inc).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCM_0030
     * @tc.name      testExtKeyboardPcm0029
     * @tc.desc      PCM frames 512 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcm0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 512;
      const channels: number = 2;
      const bufferBytes: number = frames * channels * 2;
      const inc: number = 2 * Math.PI * 2000 / 44100;
      const sample: number = Math.floor(Math.sin(0.5) * 0.3 * 32767);
      expect(bufferBytes).assertEqual(2048);
      expect(sample).assertLargerOrEqual(-32767);
      expect(sample).assertLessOrEqual(32767);
      expect(inc).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCM_0031
     * @tc.name      testExtKeyboardPcm0030
     * @tc.desc      PCM frames 1024 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcm0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 1024;
      const channels: number = 1;
      const bufferBytes: number = frames * channels * 2;
      const inc: number = 2 * Math.PI * 500 / 44100;
      const sample: number = Math.floor(Math.sin(1.0) * 0.3 * 32767);
      expect(bufferBytes).assertEqual(2048);
      expect(sample).assertLargerOrEqual(-32767);
      expect(sample).assertLessOrEqual(32767);
      expect(inc).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCM_0032
     * @tc.name      testExtKeyboardPcm0031
     * @tc.desc      PCM frames 2048 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcm0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 2048;
      const channels: number = 2;
      const bufferBytes: number = frames * channels * 2;
      const inc: number = 2 * Math.PI * 1000 / 44100;
      const sample: number = Math.floor(Math.sin(3.14) * 0.3 * 32767);
      expect(bufferBytes).assertEqual(8192);
      expect(sample).assertLargerOrEqual(-32767);
      expect(sample).assertLessOrEqual(32767);
      expect(inc).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCM_0033
     * @tc.name      testExtKeyboardPcm0032
     * @tc.desc      PCM frames 256 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcm0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 256;
      const channels: number = 1;
      const bufferBytes: number = frames * channels * 2;
      const inc: number = 2 * Math.PI * 2000 / 44100;
      const sample: number = Math.floor(Math.sin(0) * 0.3 * 32767);
      expect(bufferBytes).assertEqual(512);
      expect(sample).assertLargerOrEqual(-32767);
      expect(sample).assertLessOrEqual(32767);
      expect(inc).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCM_0034
     * @tc.name      testExtKeyboardPcm0033
     * @tc.desc      PCM frames 512 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcm0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 512;
      const channels: number = 2;
      const bufferBytes: number = frames * channels * 2;
      const inc: number = 2 * Math.PI * 500 / 44100;
      const sample: number = Math.floor(Math.sin(0.5) * 0.3 * 32767);
      expect(bufferBytes).assertEqual(2048);
      expect(sample).assertLargerOrEqual(-32767);
      expect(sample).assertLessOrEqual(32767);
      expect(inc).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCM_0035
     * @tc.name      testExtKeyboardPcm0034
     * @tc.desc      PCM frames 1024 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcm0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 1024;
      const channels: number = 1;
      const bufferBytes: number = frames * channels * 2;
      const inc: number = 2 * Math.PI * 1000 / 44100;
      const sample: number = Math.floor(Math.sin(1.0) * 0.3 * 32767);
      expect(bufferBytes).assertEqual(2048);
      expect(sample).assertLargerOrEqual(-32767);
      expect(sample).assertLessOrEqual(32767);
      expect(inc).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCM_0036
     * @tc.name      testExtKeyboardPcm0035
     * @tc.desc      PCM frames 2048 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcm0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 2048;
      const channels: number = 2;
      const bufferBytes: number = frames * channels * 2;
      const inc: number = 2 * Math.PI * 2000 / 44100;
      const sample: number = Math.floor(Math.sin(3.14) * 0.3 * 32767);
      expect(bufferBytes).assertEqual(8192);
      expect(sample).assertLargerOrEqual(-32767);
      expect(sample).assertLessOrEqual(32767);
      expect(inc).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCM_0037
     * @tc.name      testExtKeyboardPcm0036
     * @tc.desc      PCM frames 256 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcm0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 256;
      const channels: number = 1;
      const bufferBytes: number = frames * channels * 2;
      const inc: number = 2 * Math.PI * 500 / 44100;
      const sample: number = Math.floor(Math.sin(0) * 0.3 * 32767);
      expect(bufferBytes).assertEqual(512);
      expect(sample).assertLargerOrEqual(-32767);
      expect(sample).assertLessOrEqual(32767);
      expect(inc).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCM_0038
     * @tc.name      testExtKeyboardPcm0037
     * @tc.desc      PCM frames 512 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcm0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 512;
      const channels: number = 2;
      const bufferBytes: number = frames * channels * 2;
      const inc: number = 2 * Math.PI * 1000 / 44100;
      const sample: number = Math.floor(Math.sin(0.5) * 0.3 * 32767);
      expect(bufferBytes).assertEqual(2048);
      expect(sample).assertLargerOrEqual(-32767);
      expect(sample).assertLessOrEqual(32767);
      expect(inc).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCM_0039
     * @tc.name      testExtKeyboardPcm0038
     * @tc.desc      PCM frames 1024 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcm0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 1024;
      const channels: number = 1;
      const bufferBytes: number = frames * channels * 2;
      const inc: number = 2 * Math.PI * 2000 / 44100;
      const sample: number = Math.floor(Math.sin(1.0) * 0.3 * 32767);
      expect(bufferBytes).assertEqual(2048);
      expect(sample).assertLargerOrEqual(-32767);
      expect(sample).assertLessOrEqual(32767);
      expect(inc).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCM_0040
     * @tc.name      testExtKeyboardPcm0039
     * @tc.desc      PCM frames 2048 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcm0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 2048;
      const channels: number = 2;
      const bufferBytes: number = frames * channels * 2;
      const inc: number = 2 * Math.PI * 500 / 44100;
      const sample: number = Math.floor(Math.sin(3.14) * 0.3 * 32767);
      expect(bufferBytes).assertEqual(8192);
      expect(sample).assertLargerOrEqual(-32767);
      expect(sample).assertLessOrEqual(32767);
      expect(inc).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCM_0041
     * @tc.name      testExtKeyboardPcm0040
     * @tc.desc      PCM frames 256 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcm0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 256;
      const channels: number = 1;
      const bufferBytes: number = frames * channels * 2;
      const inc: number = 2 * Math.PI * 1000 / 44100;
      const sample: number = Math.floor(Math.sin(0) * 0.3 * 32767);
      expect(bufferBytes).assertEqual(512);
      expect(sample).assertLargerOrEqual(-32767);
      expect(sample).assertLessOrEqual(32767);
      expect(inc).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCM_0042
     * @tc.name      testExtKeyboardPcm0041
     * @tc.desc      PCM frames 512 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcm0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 512;
      const channels: number = 2;
      const bufferBytes: number = frames * channels * 2;
      const inc: number = 2 * Math.PI * 2000 / 44100;
      const sample: number = Math.floor(Math.sin(0.5) * 0.3 * 32767);
      expect(bufferBytes).assertEqual(2048);
      expect(sample).assertLargerOrEqual(-32767);
      expect(sample).assertLessOrEqual(32767);
      expect(inc).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCM_0043
     * @tc.name      testExtKeyboardPcm0042
     * @tc.desc      PCM frames 1024 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcm0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 1024;
      const channels: number = 1;
      const bufferBytes: number = frames * channels * 2;
      const inc: number = 2 * Math.PI * 500 / 44100;
      const sample: number = Math.floor(Math.sin(1.0) * 0.3 * 32767);
      expect(bufferBytes).assertEqual(2048);
      expect(sample).assertLargerOrEqual(-32767);
      expect(sample).assertLessOrEqual(32767);
      expect(inc).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCM_0044
     * @tc.name      testExtKeyboardPcm0043
     * @tc.desc      PCM frames 2048 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcm0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 2048;
      const channels: number = 2;
      const bufferBytes: number = frames * channels * 2;
      const inc: number = 2 * Math.PI * 1000 / 44100;
      const sample: number = Math.floor(Math.sin(3.14) * 0.3 * 32767);
      expect(bufferBytes).assertEqual(8192);
      expect(sample).assertLargerOrEqual(-32767);
      expect(sample).assertLessOrEqual(32767);
      expect(inc).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCM_0045
     * @tc.name      testExtKeyboardPcm0044
     * @tc.desc      PCM frames 256 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcm0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 256;
      const channels: number = 1;
      const bufferBytes: number = frames * channels * 2;
      const inc: number = 2 * Math.PI * 2000 / 44100;
      const sample: number = Math.floor(Math.sin(0) * 0.3 * 32767);
      expect(bufferBytes).assertEqual(512);
      expect(sample).assertLargerOrEqual(-32767);
      expect(sample).assertLessOrEqual(32767);
      expect(inc).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCM_0046
     * @tc.name      testExtKeyboardPcm0045
     * @tc.desc      PCM frames 512 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcm0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 512;
      const channels: number = 2;
      const bufferBytes: number = frames * channels * 2;
      const inc: number = 2 * Math.PI * 500 / 44100;
      const sample: number = Math.floor(Math.sin(0.5) * 0.3 * 32767);
      expect(bufferBytes).assertEqual(2048);
      expect(sample).assertLargerOrEqual(-32767);
      expect(sample).assertLessOrEqual(32767);
      expect(inc).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCM_0047
     * @tc.name      testExtKeyboardPcm0046
     * @tc.desc      PCM frames 1024 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcm0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 1024;
      const channels: number = 1;
      const bufferBytes: number = frames * channels * 2;
      const inc: number = 2 * Math.PI * 1000 / 44100;
      const sample: number = Math.floor(Math.sin(1.0) * 0.3 * 32767);
      expect(bufferBytes).assertEqual(2048);
      expect(sample).assertLargerOrEqual(-32767);
      expect(sample).assertLessOrEqual(32767);
      expect(inc).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCM_0048
     * @tc.name      testExtKeyboardPcm0047
     * @tc.desc      PCM frames 2048 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcm0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 2048;
      const channels: number = 2;
      const bufferBytes: number = frames * channels * 2;
      const inc: number = 2 * Math.PI * 2000 / 44100;
      const sample: number = Math.floor(Math.sin(3.14) * 0.3 * 32767);
      expect(bufferBytes).assertEqual(8192);
      expect(sample).assertLargerOrEqual(-32767);
      expect(sample).assertLessOrEqual(32767);
      expect(inc).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCM_0049
     * @tc.name      testExtKeyboardPcm0048
     * @tc.desc      PCM frames 256 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcm0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 256;
      const channels: number = 1;
      const bufferBytes: number = frames * channels * 2;
      const inc: number = 2 * Math.PI * 500 / 44100;
      const sample: number = Math.floor(Math.sin(0) * 0.3 * 32767);
      expect(bufferBytes).assertEqual(512);
      expect(sample).assertLargerOrEqual(-32767);
      expect(sample).assertLessOrEqual(32767);
      expect(inc).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCM_0050
     * @tc.name      testExtKeyboardPcm0049
     * @tc.desc      PCM frames 512 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcm0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 512;
      const channels: number = 2;
      const bufferBytes: number = frames * channels * 2;
      const inc: number = 2 * Math.PI * 1000 / 44100;
      const sample: number = Math.floor(Math.sin(0.5) * 0.3 * 32767);
      expect(bufferBytes).assertEqual(2048);
      expect(sample).assertLargerOrEqual(-32767);
      expect(sample).assertLessOrEqual(32767);
      expect(inc).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCM_0051
     * @tc.name      testExtKeyboardPcm0050
     * @tc.desc      PCM frames 1024 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcm0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 1024;
      const channels: number = 1;
      const bufferBytes: number = frames * channels * 2;
      const inc: number = 2 * Math.PI * 2000 / 44100;
      const sample: number = Math.floor(Math.sin(1.0) * 0.3 * 32767);
      expect(bufferBytes).assertEqual(2048);
      expect(sample).assertLargerOrEqual(-32767);
      expect(sample).assertLessOrEqual(32767);
      expect(inc).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCM_0052
     * @tc.name      testExtKeyboardPcm0051
     * @tc.desc      PCM frames 2048 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcm0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 2048;
      const channels: number = 2;
      const bufferBytes: number = frames * channels * 2;
      const inc: number = 2 * Math.PI * 500 / 44100;
      const sample: number = Math.floor(Math.sin(3.14) * 0.3 * 32767);
      expect(bufferBytes).assertEqual(8192);
      expect(sample).assertLargerOrEqual(-32767);
      expect(sample).assertLessOrEqual(32767);
      expect(inc).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCM_0053
     * @tc.name      testExtKeyboardPcm0052
     * @tc.desc      PCM frames 256 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcm0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 256;
      const channels: number = 1;
      const bufferBytes: number = frames * channels * 2;
      const inc: number = 2 * Math.PI * 1000 / 44100;
      const sample: number = Math.floor(Math.sin(0) * 0.3 * 32767);
      expect(bufferBytes).assertEqual(512);
      expect(sample).assertLargerOrEqual(-32767);
      expect(sample).assertLessOrEqual(32767);
      expect(inc).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCM_0054
     * @tc.name      testExtKeyboardPcm0053
     * @tc.desc      PCM frames 512 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcm0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 512;
      const channels: number = 2;
      const bufferBytes: number = frames * channels * 2;
      const inc: number = 2 * Math.PI * 2000 / 44100;
      const sample: number = Math.floor(Math.sin(0.5) * 0.3 * 32767);
      expect(bufferBytes).assertEqual(2048);
      expect(sample).assertLargerOrEqual(-32767);
      expect(sample).assertLessOrEqual(32767);
      expect(inc).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCM_0055
     * @tc.name      testExtKeyboardPcm0054
     * @tc.desc      PCM frames 1024 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcm0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 1024;
      const channels: number = 1;
      const bufferBytes: number = frames * channels * 2;
      const inc: number = 2 * Math.PI * 500 / 44100;
      const sample: number = Math.floor(Math.sin(1.0) * 0.3 * 32767);
      expect(bufferBytes).assertEqual(2048);
      expect(sample).assertLargerOrEqual(-32767);
      expect(sample).assertLessOrEqual(32767);
      expect(inc).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCM_0056
     * @tc.name      testExtKeyboardPcm0055
     * @tc.desc      PCM frames 2048 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcm0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 2048;
      const channels: number = 2;
      const bufferBytes: number = frames * channels * 2;
      const inc: number = 2 * Math.PI * 1000 / 44100;
      const sample: number = Math.floor(Math.sin(3.14) * 0.3 * 32767);
      expect(bufferBytes).assertEqual(8192);
      expect(sample).assertLargerOrEqual(-32767);
      expect(sample).assertLessOrEqual(32767);
      expect(inc).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCM_0057
     * @tc.name      testExtKeyboardPcm0056
     * @tc.desc      PCM frames 256 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcm0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 256;
      const channels: number = 1;
      const bufferBytes: number = frames * channels * 2;
      const inc: number = 2 * Math.PI * 2000 / 44100;
      const sample: number = Math.floor(Math.sin(0) * 0.3 * 32767);
      expect(bufferBytes).assertEqual(512);
      expect(sample).assertLargerOrEqual(-32767);
      expect(sample).assertLessOrEqual(32767);
      expect(inc).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCM_0058
     * @tc.name      testExtKeyboardPcm0057
     * @tc.desc      PCM frames 512 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcm0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 512;
      const channels: number = 2;
      const bufferBytes: number = frames * channels * 2;
      const inc: number = 2 * Math.PI * 500 / 44100;
      const sample: number = Math.floor(Math.sin(0.5) * 0.3 * 32767);
      expect(bufferBytes).assertEqual(2048);
      expect(sample).assertLargerOrEqual(-32767);
      expect(sample).assertLessOrEqual(32767);
      expect(inc).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCM_0059
     * @tc.name      testExtKeyboardPcm0058
     * @tc.desc      PCM frames 1024 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcm0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 1024;
      const channels: number = 1;
      const bufferBytes: number = frames * channels * 2;
      const inc: number = 2 * Math.PI * 1000 / 44100;
      const sample: number = Math.floor(Math.sin(1.0) * 0.3 * 32767);
      expect(bufferBytes).assertEqual(2048);
      expect(sample).assertLargerOrEqual(-32767);
      expect(sample).assertLessOrEqual(32767);
      expect(inc).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCM_0060
     * @tc.name      testExtKeyboardPcm0059
     * @tc.desc      PCM frames 2048 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcm0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 2048;
      const channels: number = 2;
      const bufferBytes: number = frames * channels * 2;
      const inc: number = 2 * Math.PI * 2000 / 44100;
      const sample: number = Math.floor(Math.sin(3.14) * 0.3 * 32767);
      expect(bufferBytes).assertEqual(8192);
      expect(sample).assertLargerOrEqual(-32767);
      expect(sample).assertLessOrEqual(32767);
      expect(inc).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCM_0061
     * @tc.name      testExtKeyboardPcm0060
     * @tc.desc      PCM frames 256 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcm0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 256;
      const channels: number = 1;
      const bufferBytes: number = frames * channels * 2;
      const inc: number = 2 * Math.PI * 500 / 44100;
      const sample: number = Math.floor(Math.sin(0) * 0.3 * 32767);
      expect(bufferBytes).assertEqual(512);
      expect(sample).assertLargerOrEqual(-32767);
      expect(sample).assertLessOrEqual(32767);
      expect(inc).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCM_0062
     * @tc.name      testExtKeyboardPcm0061
     * @tc.desc      PCM frames 512 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcm0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 512;
      const channels: number = 2;
      const bufferBytes: number = frames * channels * 2;
      const inc: number = 2 * Math.PI * 1000 / 44100;
      const sample: number = Math.floor(Math.sin(0.5) * 0.3 * 32767);
      expect(bufferBytes).assertEqual(2048);
      expect(sample).assertLargerOrEqual(-32767);
      expect(sample).assertLessOrEqual(32767);
      expect(inc).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCM_0063
     * @tc.name      testExtKeyboardPcm0062
     * @tc.desc      PCM frames 1024 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcm0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 1024;
      const channels: number = 1;
      const bufferBytes: number = frames * channels * 2;
      const inc: number = 2 * Math.PI * 2000 / 44100;
      const sample: number = Math.floor(Math.sin(1.0) * 0.3 * 32767);
      expect(bufferBytes).assertEqual(2048);
      expect(sample).assertLargerOrEqual(-32767);
      expect(sample).assertLessOrEqual(32767);
      expect(inc).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCM_0064
     * @tc.name      testExtKeyboardPcm0063
     * @tc.desc      PCM frames 2048 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcm0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 2048;
      const channels: number = 2;
      const bufferBytes: number = frames * channels * 2;
      const inc: number = 2 * Math.PI * 500 / 44100;
      const sample: number = Math.floor(Math.sin(3.14) * 0.3 * 32767);
      expect(bufferBytes).assertEqual(8192);
      expect(sample).assertLargerOrEqual(-32767);
      expect(sample).assertLessOrEqual(32767);
      expect(inc).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCM_0065
     * @tc.name      testExtKeyboardPcm0064
     * @tc.desc      PCM frames 256 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcm0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 256;
      const channels: number = 1;
      const bufferBytes: number = frames * channels * 2;
      const inc: number = 2 * Math.PI * 1000 / 44100;
      const sample: number = Math.floor(Math.sin(0) * 0.3 * 32767);
      expect(bufferBytes).assertEqual(512);
      expect(sample).assertLargerOrEqual(-32767);
      expect(sample).assertLessOrEqual(32767);
      expect(inc).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCM_0066
     * @tc.name      testExtKeyboardPcm0065
     * @tc.desc      PCM frames 512 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcm0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 512;
      const channels: number = 2;
      const bufferBytes: number = frames * channels * 2;
      const inc: number = 2 * Math.PI * 2000 / 44100;
      const sample: number = Math.floor(Math.sin(0.5) * 0.3 * 32767);
      expect(bufferBytes).assertEqual(2048);
      expect(sample).assertLargerOrEqual(-32767);
      expect(sample).assertLessOrEqual(32767);
      expect(inc).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCM_0067
     * @tc.name      testExtKeyboardPcm0066
     * @tc.desc      PCM frames 1024 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcm0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 1024;
      const channels: number = 1;
      const bufferBytes: number = frames * channels * 2;
      const inc: number = 2 * Math.PI * 500 / 44100;
      const sample: number = Math.floor(Math.sin(1.0) * 0.3 * 32767);
      expect(bufferBytes).assertEqual(2048);
      expect(sample).assertLargerOrEqual(-32767);
      expect(sample).assertLessOrEqual(32767);
      expect(inc).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCM_0068
     * @tc.name      testExtKeyboardPcm0067
     * @tc.desc      PCM frames 2048 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcm0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 2048;
      const channels: number = 2;
      const bufferBytes: number = frames * channels * 2;
      const inc: number = 2 * Math.PI * 1000 / 44100;
      const sample: number = Math.floor(Math.sin(3.14) * 0.3 * 32767);
      expect(bufferBytes).assertEqual(8192);
      expect(sample).assertLargerOrEqual(-32767);
      expect(sample).assertLessOrEqual(32767);
      expect(inc).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCM_0069
     * @tc.name      testExtKeyboardPcm0068
     * @tc.desc      PCM frames 256 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcm0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 256;
      const channels: number = 1;
      const bufferBytes: number = frames * channels * 2;
      const inc: number = 2 * Math.PI * 2000 / 44100;
      const sample: number = Math.floor(Math.sin(0) * 0.3 * 32767);
      expect(bufferBytes).assertEqual(512);
      expect(sample).assertLargerOrEqual(-32767);
      expect(sample).assertLessOrEqual(32767);
      expect(inc).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCM_0070
     * @tc.name      testExtKeyboardPcm0069
     * @tc.desc      PCM frames 512 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcm0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 512;
      const channels: number = 2;
      const bufferBytes: number = frames * channels * 2;
      const inc: number = 2 * Math.PI * 500 / 44100;
      const sample: number = Math.floor(Math.sin(0.5) * 0.3 * 32767);
      expect(bufferBytes).assertEqual(2048);
      expect(sample).assertLargerOrEqual(-32767);
      expect(sample).assertLessOrEqual(32767);
      expect(inc).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCM_0071
     * @tc.name      testExtKeyboardPcm0070
     * @tc.desc      PCM frames 1024 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcm0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 1024;
      const channels: number = 1;
      const bufferBytes: number = frames * channels * 2;
      const inc: number = 2 * Math.PI * 1000 / 44100;
      const sample: number = Math.floor(Math.sin(1.0) * 0.3 * 32767);
      expect(bufferBytes).assertEqual(2048);
      expect(sample).assertLargerOrEqual(-32767);
      expect(sample).assertLessOrEqual(32767);
      expect(inc).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCM_0072
     * @tc.name      testExtKeyboardPcm0071
     * @tc.desc      PCM frames 2048 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcm0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 2048;
      const channels: number = 2;
      const bufferBytes: number = frames * channels * 2;
      const inc: number = 2 * Math.PI * 2000 / 44100;
      const sample: number = Math.floor(Math.sin(3.14) * 0.3 * 32767);
      expect(bufferBytes).assertEqual(8192);
      expect(sample).assertLargerOrEqual(-32767);
      expect(sample).assertLessOrEqual(32767);
      expect(inc).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCM_0073
     * @tc.name      testExtKeyboardPcm0072
     * @tc.desc      PCM frames 256 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcm0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 256;
      const channels: number = 1;
      const bufferBytes: number = frames * channels * 2;
      const inc: number = 2 * Math.PI * 500 / 44100;
      const sample: number = Math.floor(Math.sin(0) * 0.3 * 32767);
      expect(bufferBytes).assertEqual(512);
      expect(sample).assertLargerOrEqual(-32767);
      expect(sample).assertLessOrEqual(32767);
      expect(inc).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCM_0074
     * @tc.name      testExtKeyboardPcm0073
     * @tc.desc      PCM frames 512 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcm0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 512;
      const channels: number = 2;
      const bufferBytes: number = frames * channels * 2;
      const inc: number = 2 * Math.PI * 1000 / 44100;
      const sample: number = Math.floor(Math.sin(0.5) * 0.3 * 32767);
      expect(bufferBytes).assertEqual(2048);
      expect(sample).assertLargerOrEqual(-32767);
      expect(sample).assertLessOrEqual(32767);
      expect(inc).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCM_0075
     * @tc.name      testExtKeyboardPcm0074
     * @tc.desc      PCM frames 1024 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcm0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 1024;
      const channels: number = 1;
      const bufferBytes: number = frames * channels * 2;
      const inc: number = 2 * Math.PI * 2000 / 44100;
      const sample: number = Math.floor(Math.sin(1.0) * 0.3 * 32767);
      expect(bufferBytes).assertEqual(2048);
      expect(sample).assertLargerOrEqual(-32767);
      expect(sample).assertLessOrEqual(32767);
      expect(inc).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCM_0076
     * @tc.name      testExtKeyboardPcm0075
     * @tc.desc      PCM frames 2048 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcm0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 2048;
      const channels: number = 2;
      const bufferBytes: number = frames * channels * 2;
      const inc: number = 2 * Math.PI * 500 / 44100;
      const sample: number = Math.floor(Math.sin(3.14) * 0.3 * 32767);
      expect(bufferBytes).assertEqual(8192);
      expect(sample).assertLargerOrEqual(-32767);
      expect(sample).assertLessOrEqual(32767);
      expect(inc).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCM_0077
     * @tc.name      testExtKeyboardPcm0076
     * @tc.desc      PCM frames 256 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcm0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 256;
      const channels: number = 1;
      const bufferBytes: number = frames * channels * 2;
      const inc: number = 2 * Math.PI * 1000 / 44100;
      const sample: number = Math.floor(Math.sin(0) * 0.3 * 32767);
      expect(bufferBytes).assertEqual(512);
      expect(sample).assertLargerOrEqual(-32767);
      expect(sample).assertLessOrEqual(32767);
      expect(inc).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCM_0078
     * @tc.name      testExtKeyboardPcm0077
     * @tc.desc      PCM frames 512 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcm0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 512;
      const channels: number = 2;
      const bufferBytes: number = frames * channels * 2;
      const inc: number = 2 * Math.PI * 2000 / 44100;
      const sample: number = Math.floor(Math.sin(0.5) * 0.3 * 32767);
      expect(bufferBytes).assertEqual(2048);
      expect(sample).assertLargerOrEqual(-32767);
      expect(sample).assertLessOrEqual(32767);
      expect(inc).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCM_0079
     * @tc.name      testExtKeyboardPcm0078
     * @tc.desc      PCM frames 1024 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcm0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 1024;
      const channels: number = 1;
      const bufferBytes: number = frames * channels * 2;
      const inc: number = 2 * Math.PI * 500 / 44100;
      const sample: number = Math.floor(Math.sin(1.0) * 0.3 * 32767);
      expect(bufferBytes).assertEqual(2048);
      expect(sample).assertLargerOrEqual(-32767);
      expect(sample).assertLessOrEqual(32767);
      expect(inc).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_PCM_0080
     * @tc.name      testExtKeyboardPcm0079
     * @tc.desc      PCM frames 2048 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardPcm0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 2048;
      const channels: number = 2;
      const bufferBytes: number = frames * channels * 2;
      const inc: number = 2 * Math.PI * 1000 / 44100;
      const sample: number = Math.floor(Math.sin(3.14) * 0.3 * 32767);
      expect(bufferBytes).assertEqual(8192);
      expect(sample).assertLargerOrEqual(-32767);
      expect(sample).assertLessOrEqual(32767);
      expect(inc).assertLarger(0);
    })
  });
}
