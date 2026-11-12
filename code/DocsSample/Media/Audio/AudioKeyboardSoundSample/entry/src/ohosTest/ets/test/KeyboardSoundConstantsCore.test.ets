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
import { AudioConstants } from '../../../main/ets/common/constants/AudioConstants';

const TAG: string = '[Sample_keyboardSoundConstantsCore]';
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

export default function keyboardSoundConstantsCoreTest(): void {
  describe('keyboardSoundConstantsCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CONST_0001
     * @tc.name      testExtKeyboardConst0000
     * @tc.desc      Keyboard constants 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardConst0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(AudioConstants.SAMPLE_RATE).assertEqual(44100);
      expect(AudioConstants.CHANNELS).assertEqual(2);
      expect(AudioConstants.BYTES_PER_SAMPLE).assertEqual(2);
      expect(AudioConstants.FRAME_SIZE).assertEqual(4);
      expect(AudioConstants.KEY_SOUND_FREQUENCY).assertEqual(1000);
      expect(AudioConstants.AMPLITUDE).assertEqual(0.3);
      expect(AudioConstants.KEY_SOUND_DURATION_MS).assertEqual(150);
      expect(AudioConstants.KEY_SOUND_DURATION_MS_NOTIFICATION).assertEqual(30);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CONST_0002
     * @tc.name      testExtKeyboardConst0001
     * @tc.desc      Keyboard constants 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardConst0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(AudioConstants.SAMPLE_RATE).assertEqual(44100);
      expect(AudioConstants.CHANNELS).assertEqual(2);
      expect(AudioConstants.BYTES_PER_SAMPLE).assertEqual(2);
      expect(AudioConstants.FRAME_SIZE).assertEqual(4);
      expect(AudioConstants.KEY_SOUND_FREQUENCY).assertEqual(1000);
      expect(AudioConstants.AMPLITUDE).assertEqual(0.3);
      expect(AudioConstants.KEY_SOUND_DURATION_MS).assertEqual(150);
      expect(AudioConstants.KEY_SOUND_DURATION_MS_NOTIFICATION).assertEqual(30);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CONST_0003
     * @tc.name      testExtKeyboardConst0002
     * @tc.desc      Keyboard constants 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardConst0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(AudioConstants.SAMPLE_RATE).assertEqual(44100);
      expect(AudioConstants.CHANNELS).assertEqual(2);
      expect(AudioConstants.BYTES_PER_SAMPLE).assertEqual(2);
      expect(AudioConstants.FRAME_SIZE).assertEqual(4);
      expect(AudioConstants.KEY_SOUND_FREQUENCY).assertEqual(1000);
      expect(AudioConstants.AMPLITUDE).assertEqual(0.3);
      expect(AudioConstants.KEY_SOUND_DURATION_MS).assertEqual(150);
      expect(AudioConstants.KEY_SOUND_DURATION_MS_NOTIFICATION).assertEqual(30);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CONST_0004
     * @tc.name      testExtKeyboardConst0003
     * @tc.desc      Keyboard constants 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardConst0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(AudioConstants.SAMPLE_RATE).assertEqual(44100);
      expect(AudioConstants.CHANNELS).assertEqual(2);
      expect(AudioConstants.BYTES_PER_SAMPLE).assertEqual(2);
      expect(AudioConstants.FRAME_SIZE).assertEqual(4);
      expect(AudioConstants.KEY_SOUND_FREQUENCY).assertEqual(1000);
      expect(AudioConstants.AMPLITUDE).assertEqual(0.3);
      expect(AudioConstants.KEY_SOUND_DURATION_MS).assertEqual(150);
      expect(AudioConstants.KEY_SOUND_DURATION_MS_NOTIFICATION).assertEqual(30);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CONST_0005
     * @tc.name      testExtKeyboardConst0004
     * @tc.desc      Keyboard constants 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardConst0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(AudioConstants.SAMPLE_RATE).assertEqual(44100);
      expect(AudioConstants.CHANNELS).assertEqual(2);
      expect(AudioConstants.BYTES_PER_SAMPLE).assertEqual(2);
      expect(AudioConstants.FRAME_SIZE).assertEqual(4);
      expect(AudioConstants.KEY_SOUND_FREQUENCY).assertEqual(1000);
      expect(AudioConstants.AMPLITUDE).assertEqual(0.3);
      expect(AudioConstants.KEY_SOUND_DURATION_MS).assertEqual(150);
      expect(AudioConstants.KEY_SOUND_DURATION_MS_NOTIFICATION).assertEqual(30);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CONST_0006
     * @tc.name      testExtKeyboardConst0005
     * @tc.desc      Keyboard constants 6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardConst0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(AudioConstants.SAMPLE_RATE).assertEqual(44100);
      expect(AudioConstants.CHANNELS).assertEqual(2);
      expect(AudioConstants.BYTES_PER_SAMPLE).assertEqual(2);
      expect(AudioConstants.FRAME_SIZE).assertEqual(4);
      expect(AudioConstants.KEY_SOUND_FREQUENCY).assertEqual(1000);
      expect(AudioConstants.AMPLITUDE).assertEqual(0.3);
      expect(AudioConstants.KEY_SOUND_DURATION_MS).assertEqual(150);
      expect(AudioConstants.KEY_SOUND_DURATION_MS_NOTIFICATION).assertEqual(30);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CONST_0007
     * @tc.name      testExtKeyboardConst0006
     * @tc.desc      Keyboard constants 7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardConst0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(AudioConstants.SAMPLE_RATE).assertEqual(44100);
      expect(AudioConstants.CHANNELS).assertEqual(2);
      expect(AudioConstants.BYTES_PER_SAMPLE).assertEqual(2);
      expect(AudioConstants.FRAME_SIZE).assertEqual(4);
      expect(AudioConstants.KEY_SOUND_FREQUENCY).assertEqual(1000);
      expect(AudioConstants.AMPLITUDE).assertEqual(0.3);
      expect(AudioConstants.KEY_SOUND_DURATION_MS).assertEqual(150);
      expect(AudioConstants.KEY_SOUND_DURATION_MS_NOTIFICATION).assertEqual(30);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CONST_0008
     * @tc.name      testExtKeyboardConst0007
     * @tc.desc      Keyboard constants 8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardConst0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(AudioConstants.SAMPLE_RATE).assertEqual(44100);
      expect(AudioConstants.CHANNELS).assertEqual(2);
      expect(AudioConstants.BYTES_PER_SAMPLE).assertEqual(2);
      expect(AudioConstants.FRAME_SIZE).assertEqual(4);
      expect(AudioConstants.KEY_SOUND_FREQUENCY).assertEqual(1000);
      expect(AudioConstants.AMPLITUDE).assertEqual(0.3);
      expect(AudioConstants.KEY_SOUND_DURATION_MS).assertEqual(150);
      expect(AudioConstants.KEY_SOUND_DURATION_MS_NOTIFICATION).assertEqual(30);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CONST_0009
     * @tc.name      testExtKeyboardConst0008
     * @tc.desc      Keyboard constants 9.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardConst0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(AudioConstants.SAMPLE_RATE).assertEqual(44100);
      expect(AudioConstants.CHANNELS).assertEqual(2);
      expect(AudioConstants.BYTES_PER_SAMPLE).assertEqual(2);
      expect(AudioConstants.FRAME_SIZE).assertEqual(4);
      expect(AudioConstants.KEY_SOUND_FREQUENCY).assertEqual(1000);
      expect(AudioConstants.AMPLITUDE).assertEqual(0.3);
      expect(AudioConstants.KEY_SOUND_DURATION_MS).assertEqual(150);
      expect(AudioConstants.KEY_SOUND_DURATION_MS_NOTIFICATION).assertEqual(30);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CONST_0010
     * @tc.name      testExtKeyboardConst0009
     * @tc.desc      Keyboard constants 10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardConst0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(AudioConstants.SAMPLE_RATE).assertEqual(44100);
      expect(AudioConstants.CHANNELS).assertEqual(2);
      expect(AudioConstants.BYTES_PER_SAMPLE).assertEqual(2);
      expect(AudioConstants.FRAME_SIZE).assertEqual(4);
      expect(AudioConstants.KEY_SOUND_FREQUENCY).assertEqual(1000);
      expect(AudioConstants.AMPLITUDE).assertEqual(0.3);
      expect(AudioConstants.KEY_SOUND_DURATION_MS).assertEqual(150);
      expect(AudioConstants.KEY_SOUND_DURATION_MS_NOTIFICATION).assertEqual(30);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CONST_0011
     * @tc.name      testExtKeyboardConst0010
     * @tc.desc      Keyboard constants 11.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardConst0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(AudioConstants.SAMPLE_RATE).assertEqual(44100);
      expect(AudioConstants.CHANNELS).assertEqual(2);
      expect(AudioConstants.BYTES_PER_SAMPLE).assertEqual(2);
      expect(AudioConstants.FRAME_SIZE).assertEqual(4);
      expect(AudioConstants.KEY_SOUND_FREQUENCY).assertEqual(1000);
      expect(AudioConstants.AMPLITUDE).assertEqual(0.3);
      expect(AudioConstants.KEY_SOUND_DURATION_MS).assertEqual(150);
      expect(AudioConstants.KEY_SOUND_DURATION_MS_NOTIFICATION).assertEqual(30);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CONST_0012
     * @tc.name      testExtKeyboardConst0011
     * @tc.desc      Keyboard constants 12.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardConst0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(AudioConstants.SAMPLE_RATE).assertEqual(44100);
      expect(AudioConstants.CHANNELS).assertEqual(2);
      expect(AudioConstants.BYTES_PER_SAMPLE).assertEqual(2);
      expect(AudioConstants.FRAME_SIZE).assertEqual(4);
      expect(AudioConstants.KEY_SOUND_FREQUENCY).assertEqual(1000);
      expect(AudioConstants.AMPLITUDE).assertEqual(0.3);
      expect(AudioConstants.KEY_SOUND_DURATION_MS).assertEqual(150);
      expect(AudioConstants.KEY_SOUND_DURATION_MS_NOTIFICATION).assertEqual(30);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CONST_0013
     * @tc.name      testExtKeyboardConst0012
     * @tc.desc      Keyboard constants 13.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardConst0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(AudioConstants.SAMPLE_RATE).assertEqual(44100);
      expect(AudioConstants.CHANNELS).assertEqual(2);
      expect(AudioConstants.BYTES_PER_SAMPLE).assertEqual(2);
      expect(AudioConstants.FRAME_SIZE).assertEqual(4);
      expect(AudioConstants.KEY_SOUND_FREQUENCY).assertEqual(1000);
      expect(AudioConstants.AMPLITUDE).assertEqual(0.3);
      expect(AudioConstants.KEY_SOUND_DURATION_MS).assertEqual(150);
      expect(AudioConstants.KEY_SOUND_DURATION_MS_NOTIFICATION).assertEqual(30);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CONST_0014
     * @tc.name      testExtKeyboardConst0013
     * @tc.desc      Keyboard constants 14.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardConst0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(AudioConstants.SAMPLE_RATE).assertEqual(44100);
      expect(AudioConstants.CHANNELS).assertEqual(2);
      expect(AudioConstants.BYTES_PER_SAMPLE).assertEqual(2);
      expect(AudioConstants.FRAME_SIZE).assertEqual(4);
      expect(AudioConstants.KEY_SOUND_FREQUENCY).assertEqual(1000);
      expect(AudioConstants.AMPLITUDE).assertEqual(0.3);
      expect(AudioConstants.KEY_SOUND_DURATION_MS).assertEqual(150);
      expect(AudioConstants.KEY_SOUND_DURATION_MS_NOTIFICATION).assertEqual(30);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CONST_0015
     * @tc.name      testExtKeyboardConst0014
     * @tc.desc      Keyboard constants 15.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardConst0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(AudioConstants.SAMPLE_RATE).assertEqual(44100);
      expect(AudioConstants.CHANNELS).assertEqual(2);
      expect(AudioConstants.BYTES_PER_SAMPLE).assertEqual(2);
      expect(AudioConstants.FRAME_SIZE).assertEqual(4);
      expect(AudioConstants.KEY_SOUND_FREQUENCY).assertEqual(1000);
      expect(AudioConstants.AMPLITUDE).assertEqual(0.3);
      expect(AudioConstants.KEY_SOUND_DURATION_MS).assertEqual(150);
      expect(AudioConstants.KEY_SOUND_DURATION_MS_NOTIFICATION).assertEqual(30);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CONST_0016
     * @tc.name      testExtKeyboardConst0015
     * @tc.desc      Keyboard constants 16.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardConst0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(AudioConstants.SAMPLE_RATE).assertEqual(44100);
      expect(AudioConstants.CHANNELS).assertEqual(2);
      expect(AudioConstants.BYTES_PER_SAMPLE).assertEqual(2);
      expect(AudioConstants.FRAME_SIZE).assertEqual(4);
      expect(AudioConstants.KEY_SOUND_FREQUENCY).assertEqual(1000);
      expect(AudioConstants.AMPLITUDE).assertEqual(0.3);
      expect(AudioConstants.KEY_SOUND_DURATION_MS).assertEqual(150);
      expect(AudioConstants.KEY_SOUND_DURATION_MS_NOTIFICATION).assertEqual(30);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CONST_0017
     * @tc.name      testExtKeyboardConst0016
     * @tc.desc      Keyboard constants 17.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardConst0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(AudioConstants.SAMPLE_RATE).assertEqual(44100);
      expect(AudioConstants.CHANNELS).assertEqual(2);
      expect(AudioConstants.BYTES_PER_SAMPLE).assertEqual(2);
      expect(AudioConstants.FRAME_SIZE).assertEqual(4);
      expect(AudioConstants.KEY_SOUND_FREQUENCY).assertEqual(1000);
      expect(AudioConstants.AMPLITUDE).assertEqual(0.3);
      expect(AudioConstants.KEY_SOUND_DURATION_MS).assertEqual(150);
      expect(AudioConstants.KEY_SOUND_DURATION_MS_NOTIFICATION).assertEqual(30);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CONST_0018
     * @tc.name      testExtKeyboardConst0017
     * @tc.desc      Keyboard constants 18.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardConst0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(AudioConstants.SAMPLE_RATE).assertEqual(44100);
      expect(AudioConstants.CHANNELS).assertEqual(2);
      expect(AudioConstants.BYTES_PER_SAMPLE).assertEqual(2);
      expect(AudioConstants.FRAME_SIZE).assertEqual(4);
      expect(AudioConstants.KEY_SOUND_FREQUENCY).assertEqual(1000);
      expect(AudioConstants.AMPLITUDE).assertEqual(0.3);
      expect(AudioConstants.KEY_SOUND_DURATION_MS).assertEqual(150);
      expect(AudioConstants.KEY_SOUND_DURATION_MS_NOTIFICATION).assertEqual(30);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CONST_0019
     * @tc.name      testExtKeyboardConst0018
     * @tc.desc      Keyboard constants 19.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardConst0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(AudioConstants.SAMPLE_RATE).assertEqual(44100);
      expect(AudioConstants.CHANNELS).assertEqual(2);
      expect(AudioConstants.BYTES_PER_SAMPLE).assertEqual(2);
      expect(AudioConstants.FRAME_SIZE).assertEqual(4);
      expect(AudioConstants.KEY_SOUND_FREQUENCY).assertEqual(1000);
      expect(AudioConstants.AMPLITUDE).assertEqual(0.3);
      expect(AudioConstants.KEY_SOUND_DURATION_MS).assertEqual(150);
      expect(AudioConstants.KEY_SOUND_DURATION_MS_NOTIFICATION).assertEqual(30);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CONST_0020
     * @tc.name      testExtKeyboardConst0019
     * @tc.desc      Keyboard constants 20.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardConst0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(AudioConstants.SAMPLE_RATE).assertEqual(44100);
      expect(AudioConstants.CHANNELS).assertEqual(2);
      expect(AudioConstants.BYTES_PER_SAMPLE).assertEqual(2);
      expect(AudioConstants.FRAME_SIZE).assertEqual(4);
      expect(AudioConstants.KEY_SOUND_FREQUENCY).assertEqual(1000);
      expect(AudioConstants.AMPLITUDE).assertEqual(0.3);
      expect(AudioConstants.KEY_SOUND_DURATION_MS).assertEqual(150);
      expect(AudioConstants.KEY_SOUND_DURATION_MS_NOTIFICATION).assertEqual(30);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CONST_0021
     * @tc.name      testExtKeyboardConst0020
     * @tc.desc      Keyboard constants 21.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardConst0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(AudioConstants.SAMPLE_RATE).assertEqual(44100);
      expect(AudioConstants.CHANNELS).assertEqual(2);
      expect(AudioConstants.BYTES_PER_SAMPLE).assertEqual(2);
      expect(AudioConstants.FRAME_SIZE).assertEqual(4);
      expect(AudioConstants.KEY_SOUND_FREQUENCY).assertEqual(1000);
      expect(AudioConstants.AMPLITUDE).assertEqual(0.3);
      expect(AudioConstants.KEY_SOUND_DURATION_MS).assertEqual(150);
      expect(AudioConstants.KEY_SOUND_DURATION_MS_NOTIFICATION).assertEqual(30);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CONST_0022
     * @tc.name      testExtKeyboardConst0021
     * @tc.desc      Keyboard constants 22.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardConst0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(AudioConstants.SAMPLE_RATE).assertEqual(44100);
      expect(AudioConstants.CHANNELS).assertEqual(2);
      expect(AudioConstants.BYTES_PER_SAMPLE).assertEqual(2);
      expect(AudioConstants.FRAME_SIZE).assertEqual(4);
      expect(AudioConstants.KEY_SOUND_FREQUENCY).assertEqual(1000);
      expect(AudioConstants.AMPLITUDE).assertEqual(0.3);
      expect(AudioConstants.KEY_SOUND_DURATION_MS).assertEqual(150);
      expect(AudioConstants.KEY_SOUND_DURATION_MS_NOTIFICATION).assertEqual(30);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CONST_0023
     * @tc.name      testExtKeyboardConst0022
     * @tc.desc      Keyboard constants 23.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardConst0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(AudioConstants.SAMPLE_RATE).assertEqual(44100);
      expect(AudioConstants.CHANNELS).assertEqual(2);
      expect(AudioConstants.BYTES_PER_SAMPLE).assertEqual(2);
      expect(AudioConstants.FRAME_SIZE).assertEqual(4);
      expect(AudioConstants.KEY_SOUND_FREQUENCY).assertEqual(1000);
      expect(AudioConstants.AMPLITUDE).assertEqual(0.3);
      expect(AudioConstants.KEY_SOUND_DURATION_MS).assertEqual(150);
      expect(AudioConstants.KEY_SOUND_DURATION_MS_NOTIFICATION).assertEqual(30);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CONST_0024
     * @tc.name      testExtKeyboardConst0023
     * @tc.desc      Keyboard constants 24.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardConst0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(AudioConstants.SAMPLE_RATE).assertEqual(44100);
      expect(AudioConstants.CHANNELS).assertEqual(2);
      expect(AudioConstants.BYTES_PER_SAMPLE).assertEqual(2);
      expect(AudioConstants.FRAME_SIZE).assertEqual(4);
      expect(AudioConstants.KEY_SOUND_FREQUENCY).assertEqual(1000);
      expect(AudioConstants.AMPLITUDE).assertEqual(0.3);
      expect(AudioConstants.KEY_SOUND_DURATION_MS).assertEqual(150);
      expect(AudioConstants.KEY_SOUND_DURATION_MS_NOTIFICATION).assertEqual(30);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CONST_0025
     * @tc.name      testExtKeyboardConst0024
     * @tc.desc      Keyboard constants 25.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardConst0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(AudioConstants.SAMPLE_RATE).assertEqual(44100);
      expect(AudioConstants.CHANNELS).assertEqual(2);
      expect(AudioConstants.BYTES_PER_SAMPLE).assertEqual(2);
      expect(AudioConstants.FRAME_SIZE).assertEqual(4);
      expect(AudioConstants.KEY_SOUND_FREQUENCY).assertEqual(1000);
      expect(AudioConstants.AMPLITUDE).assertEqual(0.3);
      expect(AudioConstants.KEY_SOUND_DURATION_MS).assertEqual(150);
      expect(AudioConstants.KEY_SOUND_DURATION_MS_NOTIFICATION).assertEqual(30);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CONST_0026
     * @tc.name      testExtKeyboardConst0025
     * @tc.desc      Keyboard constants 26.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardConst0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(AudioConstants.SAMPLE_RATE).assertEqual(44100);
      expect(AudioConstants.CHANNELS).assertEqual(2);
      expect(AudioConstants.BYTES_PER_SAMPLE).assertEqual(2);
      expect(AudioConstants.FRAME_SIZE).assertEqual(4);
      expect(AudioConstants.KEY_SOUND_FREQUENCY).assertEqual(1000);
      expect(AudioConstants.AMPLITUDE).assertEqual(0.3);
      expect(AudioConstants.KEY_SOUND_DURATION_MS).assertEqual(150);
      expect(AudioConstants.KEY_SOUND_DURATION_MS_NOTIFICATION).assertEqual(30);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CONST_0027
     * @tc.name      testExtKeyboardConst0026
     * @tc.desc      Keyboard constants 27.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardConst0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(AudioConstants.SAMPLE_RATE).assertEqual(44100);
      expect(AudioConstants.CHANNELS).assertEqual(2);
      expect(AudioConstants.BYTES_PER_SAMPLE).assertEqual(2);
      expect(AudioConstants.FRAME_SIZE).assertEqual(4);
      expect(AudioConstants.KEY_SOUND_FREQUENCY).assertEqual(1000);
      expect(AudioConstants.AMPLITUDE).assertEqual(0.3);
      expect(AudioConstants.KEY_SOUND_DURATION_MS).assertEqual(150);
      expect(AudioConstants.KEY_SOUND_DURATION_MS_NOTIFICATION).assertEqual(30);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CONST_0028
     * @tc.name      testExtKeyboardConst0027
     * @tc.desc      Keyboard constants 28.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardConst0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(AudioConstants.SAMPLE_RATE).assertEqual(44100);
      expect(AudioConstants.CHANNELS).assertEqual(2);
      expect(AudioConstants.BYTES_PER_SAMPLE).assertEqual(2);
      expect(AudioConstants.FRAME_SIZE).assertEqual(4);
      expect(AudioConstants.KEY_SOUND_FREQUENCY).assertEqual(1000);
      expect(AudioConstants.AMPLITUDE).assertEqual(0.3);
      expect(AudioConstants.KEY_SOUND_DURATION_MS).assertEqual(150);
      expect(AudioConstants.KEY_SOUND_DURATION_MS_NOTIFICATION).assertEqual(30);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CONST_0029
     * @tc.name      testExtKeyboardConst0028
     * @tc.desc      Keyboard constants 29.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardConst0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(AudioConstants.SAMPLE_RATE).assertEqual(44100);
      expect(AudioConstants.CHANNELS).assertEqual(2);
      expect(AudioConstants.BYTES_PER_SAMPLE).assertEqual(2);
      expect(AudioConstants.FRAME_SIZE).assertEqual(4);
      expect(AudioConstants.KEY_SOUND_FREQUENCY).assertEqual(1000);
      expect(AudioConstants.AMPLITUDE).assertEqual(0.3);
      expect(AudioConstants.KEY_SOUND_DURATION_MS).assertEqual(150);
      expect(AudioConstants.KEY_SOUND_DURATION_MS_NOTIFICATION).assertEqual(30);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CONST_0030
     * @tc.name      testExtKeyboardConst0029
     * @tc.desc      Keyboard constants 30.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardConst0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(AudioConstants.SAMPLE_RATE).assertEqual(44100);
      expect(AudioConstants.CHANNELS).assertEqual(2);
      expect(AudioConstants.BYTES_PER_SAMPLE).assertEqual(2);
      expect(AudioConstants.FRAME_SIZE).assertEqual(4);
      expect(AudioConstants.KEY_SOUND_FREQUENCY).assertEqual(1000);
      expect(AudioConstants.AMPLITUDE).assertEqual(0.3);
      expect(AudioConstants.KEY_SOUND_DURATION_MS).assertEqual(150);
      expect(AudioConstants.KEY_SOUND_DURATION_MS_NOTIFICATION).assertEqual(30);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CONST_0031
     * @tc.name      testExtKeyboardConst0030
     * @tc.desc      Keyboard constants 31.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardConst0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(AudioConstants.SAMPLE_RATE).assertEqual(44100);
      expect(AudioConstants.CHANNELS).assertEqual(2);
      expect(AudioConstants.BYTES_PER_SAMPLE).assertEqual(2);
      expect(AudioConstants.FRAME_SIZE).assertEqual(4);
      expect(AudioConstants.KEY_SOUND_FREQUENCY).assertEqual(1000);
      expect(AudioConstants.AMPLITUDE).assertEqual(0.3);
      expect(AudioConstants.KEY_SOUND_DURATION_MS).assertEqual(150);
      expect(AudioConstants.KEY_SOUND_DURATION_MS_NOTIFICATION).assertEqual(30);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CONST_0032
     * @tc.name      testExtKeyboardConst0031
     * @tc.desc      Keyboard constants 32.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardConst0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(AudioConstants.SAMPLE_RATE).assertEqual(44100);
      expect(AudioConstants.CHANNELS).assertEqual(2);
      expect(AudioConstants.BYTES_PER_SAMPLE).assertEqual(2);
      expect(AudioConstants.FRAME_SIZE).assertEqual(4);
      expect(AudioConstants.KEY_SOUND_FREQUENCY).assertEqual(1000);
      expect(AudioConstants.AMPLITUDE).assertEqual(0.3);
      expect(AudioConstants.KEY_SOUND_DURATION_MS).assertEqual(150);
      expect(AudioConstants.KEY_SOUND_DURATION_MS_NOTIFICATION).assertEqual(30);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CONST_0033
     * @tc.name      testExtKeyboardConst0032
     * @tc.desc      Keyboard constants 33.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardConst0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(AudioConstants.SAMPLE_RATE).assertEqual(44100);
      expect(AudioConstants.CHANNELS).assertEqual(2);
      expect(AudioConstants.BYTES_PER_SAMPLE).assertEqual(2);
      expect(AudioConstants.FRAME_SIZE).assertEqual(4);
      expect(AudioConstants.KEY_SOUND_FREQUENCY).assertEqual(1000);
      expect(AudioConstants.AMPLITUDE).assertEqual(0.3);
      expect(AudioConstants.KEY_SOUND_DURATION_MS).assertEqual(150);
      expect(AudioConstants.KEY_SOUND_DURATION_MS_NOTIFICATION).assertEqual(30);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CONST_0034
     * @tc.name      testExtKeyboardConst0033
     * @tc.desc      Keyboard constants 34.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardConst0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(AudioConstants.SAMPLE_RATE).assertEqual(44100);
      expect(AudioConstants.CHANNELS).assertEqual(2);
      expect(AudioConstants.BYTES_PER_SAMPLE).assertEqual(2);
      expect(AudioConstants.FRAME_SIZE).assertEqual(4);
      expect(AudioConstants.KEY_SOUND_FREQUENCY).assertEqual(1000);
      expect(AudioConstants.AMPLITUDE).assertEqual(0.3);
      expect(AudioConstants.KEY_SOUND_DURATION_MS).assertEqual(150);
      expect(AudioConstants.KEY_SOUND_DURATION_MS_NOTIFICATION).assertEqual(30);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CONST_0035
     * @tc.name      testExtKeyboardConst0034
     * @tc.desc      Keyboard constants 35.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardConst0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(AudioConstants.SAMPLE_RATE).assertEqual(44100);
      expect(AudioConstants.CHANNELS).assertEqual(2);
      expect(AudioConstants.BYTES_PER_SAMPLE).assertEqual(2);
      expect(AudioConstants.FRAME_SIZE).assertEqual(4);
      expect(AudioConstants.KEY_SOUND_FREQUENCY).assertEqual(1000);
      expect(AudioConstants.AMPLITUDE).assertEqual(0.3);
      expect(AudioConstants.KEY_SOUND_DURATION_MS).assertEqual(150);
      expect(AudioConstants.KEY_SOUND_DURATION_MS_NOTIFICATION).assertEqual(30);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CONST_0036
     * @tc.name      testExtKeyboardConst0035
     * @tc.desc      Keyboard constants 36.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardConst0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(AudioConstants.SAMPLE_RATE).assertEqual(44100);
      expect(AudioConstants.CHANNELS).assertEqual(2);
      expect(AudioConstants.BYTES_PER_SAMPLE).assertEqual(2);
      expect(AudioConstants.FRAME_SIZE).assertEqual(4);
      expect(AudioConstants.KEY_SOUND_FREQUENCY).assertEqual(1000);
      expect(AudioConstants.AMPLITUDE).assertEqual(0.3);
      expect(AudioConstants.KEY_SOUND_DURATION_MS).assertEqual(150);
      expect(AudioConstants.KEY_SOUND_DURATION_MS_NOTIFICATION).assertEqual(30);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CONST_0037
     * @tc.name      testExtKeyboardConst0036
     * @tc.desc      Keyboard constants 37.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardConst0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(AudioConstants.SAMPLE_RATE).assertEqual(44100);
      expect(AudioConstants.CHANNELS).assertEqual(2);
      expect(AudioConstants.BYTES_PER_SAMPLE).assertEqual(2);
      expect(AudioConstants.FRAME_SIZE).assertEqual(4);
      expect(AudioConstants.KEY_SOUND_FREQUENCY).assertEqual(1000);
      expect(AudioConstants.AMPLITUDE).assertEqual(0.3);
      expect(AudioConstants.KEY_SOUND_DURATION_MS).assertEqual(150);
      expect(AudioConstants.KEY_SOUND_DURATION_MS_NOTIFICATION).assertEqual(30);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CONST_0038
     * @tc.name      testExtKeyboardConst0037
     * @tc.desc      Keyboard constants 38.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardConst0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(AudioConstants.SAMPLE_RATE).assertEqual(44100);
      expect(AudioConstants.CHANNELS).assertEqual(2);
      expect(AudioConstants.BYTES_PER_SAMPLE).assertEqual(2);
      expect(AudioConstants.FRAME_SIZE).assertEqual(4);
      expect(AudioConstants.KEY_SOUND_FREQUENCY).assertEqual(1000);
      expect(AudioConstants.AMPLITUDE).assertEqual(0.3);
      expect(AudioConstants.KEY_SOUND_DURATION_MS).assertEqual(150);
      expect(AudioConstants.KEY_SOUND_DURATION_MS_NOTIFICATION).assertEqual(30);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CONST_0039
     * @tc.name      testExtKeyboardConst0038
     * @tc.desc      Keyboard constants 39.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardConst0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(AudioConstants.SAMPLE_RATE).assertEqual(44100);
      expect(AudioConstants.CHANNELS).assertEqual(2);
      expect(AudioConstants.BYTES_PER_SAMPLE).assertEqual(2);
      expect(AudioConstants.FRAME_SIZE).assertEqual(4);
      expect(AudioConstants.KEY_SOUND_FREQUENCY).assertEqual(1000);
      expect(AudioConstants.AMPLITUDE).assertEqual(0.3);
      expect(AudioConstants.KEY_SOUND_DURATION_MS).assertEqual(150);
      expect(AudioConstants.KEY_SOUND_DURATION_MS_NOTIFICATION).assertEqual(30);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CONST_0040
     * @tc.name      testExtKeyboardConst0039
     * @tc.desc      Keyboard constants 40.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardConst0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(AudioConstants.SAMPLE_RATE).assertEqual(44100);
      expect(AudioConstants.CHANNELS).assertEqual(2);
      expect(AudioConstants.BYTES_PER_SAMPLE).assertEqual(2);
      expect(AudioConstants.FRAME_SIZE).assertEqual(4);
      expect(AudioConstants.KEY_SOUND_FREQUENCY).assertEqual(1000);
      expect(AudioConstants.AMPLITUDE).assertEqual(0.3);
      expect(AudioConstants.KEY_SOUND_DURATION_MS).assertEqual(150);
      expect(AudioConstants.KEY_SOUND_DURATION_MS_NOTIFICATION).assertEqual(30);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CONST_0041
     * @tc.name      testExtKeyboardConst0040
     * @tc.desc      Keyboard constants 41.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardConst0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(AudioConstants.SAMPLE_RATE).assertEqual(44100);
      expect(AudioConstants.CHANNELS).assertEqual(2);
      expect(AudioConstants.BYTES_PER_SAMPLE).assertEqual(2);
      expect(AudioConstants.FRAME_SIZE).assertEqual(4);
      expect(AudioConstants.KEY_SOUND_FREQUENCY).assertEqual(1000);
      expect(AudioConstants.AMPLITUDE).assertEqual(0.3);
      expect(AudioConstants.KEY_SOUND_DURATION_MS).assertEqual(150);
      expect(AudioConstants.KEY_SOUND_DURATION_MS_NOTIFICATION).assertEqual(30);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CONST_0042
     * @tc.name      testExtKeyboardConst0041
     * @tc.desc      Keyboard constants 42.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardConst0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(AudioConstants.SAMPLE_RATE).assertEqual(44100);
      expect(AudioConstants.CHANNELS).assertEqual(2);
      expect(AudioConstants.BYTES_PER_SAMPLE).assertEqual(2);
      expect(AudioConstants.FRAME_SIZE).assertEqual(4);
      expect(AudioConstants.KEY_SOUND_FREQUENCY).assertEqual(1000);
      expect(AudioConstants.AMPLITUDE).assertEqual(0.3);
      expect(AudioConstants.KEY_SOUND_DURATION_MS).assertEqual(150);
      expect(AudioConstants.KEY_SOUND_DURATION_MS_NOTIFICATION).assertEqual(30);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CONST_0043
     * @tc.name      testExtKeyboardConst0042
     * @tc.desc      Keyboard constants 43.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardConst0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(AudioConstants.SAMPLE_RATE).assertEqual(44100);
      expect(AudioConstants.CHANNELS).assertEqual(2);
      expect(AudioConstants.BYTES_PER_SAMPLE).assertEqual(2);
      expect(AudioConstants.FRAME_SIZE).assertEqual(4);
      expect(AudioConstants.KEY_SOUND_FREQUENCY).assertEqual(1000);
      expect(AudioConstants.AMPLITUDE).assertEqual(0.3);
      expect(AudioConstants.KEY_SOUND_DURATION_MS).assertEqual(150);
      expect(AudioConstants.KEY_SOUND_DURATION_MS_NOTIFICATION).assertEqual(30);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CONST_0044
     * @tc.name      testExtKeyboardConst0043
     * @tc.desc      Keyboard constants 44.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardConst0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(AudioConstants.SAMPLE_RATE).assertEqual(44100);
      expect(AudioConstants.CHANNELS).assertEqual(2);
      expect(AudioConstants.BYTES_PER_SAMPLE).assertEqual(2);
      expect(AudioConstants.FRAME_SIZE).assertEqual(4);
      expect(AudioConstants.KEY_SOUND_FREQUENCY).assertEqual(1000);
      expect(AudioConstants.AMPLITUDE).assertEqual(0.3);
      expect(AudioConstants.KEY_SOUND_DURATION_MS).assertEqual(150);
      expect(AudioConstants.KEY_SOUND_DURATION_MS_NOTIFICATION).assertEqual(30);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CONST_0045
     * @tc.name      testExtKeyboardConst0044
     * @tc.desc      Keyboard constants 45.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardConst0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(AudioConstants.SAMPLE_RATE).assertEqual(44100);
      expect(AudioConstants.CHANNELS).assertEqual(2);
      expect(AudioConstants.BYTES_PER_SAMPLE).assertEqual(2);
      expect(AudioConstants.FRAME_SIZE).assertEqual(4);
      expect(AudioConstants.KEY_SOUND_FREQUENCY).assertEqual(1000);
      expect(AudioConstants.AMPLITUDE).assertEqual(0.3);
      expect(AudioConstants.KEY_SOUND_DURATION_MS).assertEqual(150);
      expect(AudioConstants.KEY_SOUND_DURATION_MS_NOTIFICATION).assertEqual(30);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CONST_0046
     * @tc.name      testExtKeyboardConst0045
     * @tc.desc      Keyboard constants 46.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardConst0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(AudioConstants.SAMPLE_RATE).assertEqual(44100);
      expect(AudioConstants.CHANNELS).assertEqual(2);
      expect(AudioConstants.BYTES_PER_SAMPLE).assertEqual(2);
      expect(AudioConstants.FRAME_SIZE).assertEqual(4);
      expect(AudioConstants.KEY_SOUND_FREQUENCY).assertEqual(1000);
      expect(AudioConstants.AMPLITUDE).assertEqual(0.3);
      expect(AudioConstants.KEY_SOUND_DURATION_MS).assertEqual(150);
      expect(AudioConstants.KEY_SOUND_DURATION_MS_NOTIFICATION).assertEqual(30);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CONST_0047
     * @tc.name      testExtKeyboardConst0046
     * @tc.desc      Keyboard constants 47.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardConst0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(AudioConstants.SAMPLE_RATE).assertEqual(44100);
      expect(AudioConstants.CHANNELS).assertEqual(2);
      expect(AudioConstants.BYTES_PER_SAMPLE).assertEqual(2);
      expect(AudioConstants.FRAME_SIZE).assertEqual(4);
      expect(AudioConstants.KEY_SOUND_FREQUENCY).assertEqual(1000);
      expect(AudioConstants.AMPLITUDE).assertEqual(0.3);
      expect(AudioConstants.KEY_SOUND_DURATION_MS).assertEqual(150);
      expect(AudioConstants.KEY_SOUND_DURATION_MS_NOTIFICATION).assertEqual(30);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CONST_0048
     * @tc.name      testExtKeyboardConst0047
     * @tc.desc      Keyboard constants 48.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardConst0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(AudioConstants.SAMPLE_RATE).assertEqual(44100);
      expect(AudioConstants.CHANNELS).assertEqual(2);
      expect(AudioConstants.BYTES_PER_SAMPLE).assertEqual(2);
      expect(AudioConstants.FRAME_SIZE).assertEqual(4);
      expect(AudioConstants.KEY_SOUND_FREQUENCY).assertEqual(1000);
      expect(AudioConstants.AMPLITUDE).assertEqual(0.3);
      expect(AudioConstants.KEY_SOUND_DURATION_MS).assertEqual(150);
      expect(AudioConstants.KEY_SOUND_DURATION_MS_NOTIFICATION).assertEqual(30);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CONST_0049
     * @tc.name      testExtKeyboardConst0048
     * @tc.desc      Keyboard constants 49.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardConst0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(AudioConstants.SAMPLE_RATE).assertEqual(44100);
      expect(AudioConstants.CHANNELS).assertEqual(2);
      expect(AudioConstants.BYTES_PER_SAMPLE).assertEqual(2);
      expect(AudioConstants.FRAME_SIZE).assertEqual(4);
      expect(AudioConstants.KEY_SOUND_FREQUENCY).assertEqual(1000);
      expect(AudioConstants.AMPLITUDE).assertEqual(0.3);
      expect(AudioConstants.KEY_SOUND_DURATION_MS).assertEqual(150);
      expect(AudioConstants.KEY_SOUND_DURATION_MS_NOTIFICATION).assertEqual(30);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CONST_0050
     * @tc.name      testExtKeyboardConst0049
     * @tc.desc      Keyboard constants 50.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardConst0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(AudioConstants.SAMPLE_RATE).assertEqual(44100);
      expect(AudioConstants.CHANNELS).assertEqual(2);
      expect(AudioConstants.BYTES_PER_SAMPLE).assertEqual(2);
      expect(AudioConstants.FRAME_SIZE).assertEqual(4);
      expect(AudioConstants.KEY_SOUND_FREQUENCY).assertEqual(1000);
      expect(AudioConstants.AMPLITUDE).assertEqual(0.3);
      expect(AudioConstants.KEY_SOUND_DURATION_MS).assertEqual(150);
      expect(AudioConstants.KEY_SOUND_DURATION_MS_NOTIFICATION).assertEqual(30);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CONST_0051
     * @tc.name      testExtKeyboardConst0050
     * @tc.desc      Keyboard constants 51.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardConst0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(AudioConstants.SAMPLE_RATE).assertEqual(44100);
      expect(AudioConstants.CHANNELS).assertEqual(2);
      expect(AudioConstants.BYTES_PER_SAMPLE).assertEqual(2);
      expect(AudioConstants.FRAME_SIZE).assertEqual(4);
      expect(AudioConstants.KEY_SOUND_FREQUENCY).assertEqual(1000);
      expect(AudioConstants.AMPLITUDE).assertEqual(0.3);
      expect(AudioConstants.KEY_SOUND_DURATION_MS).assertEqual(150);
      expect(AudioConstants.KEY_SOUND_DURATION_MS_NOTIFICATION).assertEqual(30);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CONST_0052
     * @tc.name      testExtKeyboardConst0051
     * @tc.desc      Keyboard constants 52.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardConst0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(AudioConstants.SAMPLE_RATE).assertEqual(44100);
      expect(AudioConstants.CHANNELS).assertEqual(2);
      expect(AudioConstants.BYTES_PER_SAMPLE).assertEqual(2);
      expect(AudioConstants.FRAME_SIZE).assertEqual(4);
      expect(AudioConstants.KEY_SOUND_FREQUENCY).assertEqual(1000);
      expect(AudioConstants.AMPLITUDE).assertEqual(0.3);
      expect(AudioConstants.KEY_SOUND_DURATION_MS).assertEqual(150);
      expect(AudioConstants.KEY_SOUND_DURATION_MS_NOTIFICATION).assertEqual(30);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CONST_0053
     * @tc.name      testExtKeyboardConst0052
     * @tc.desc      Keyboard constants 53.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardConst0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(AudioConstants.SAMPLE_RATE).assertEqual(44100);
      expect(AudioConstants.CHANNELS).assertEqual(2);
      expect(AudioConstants.BYTES_PER_SAMPLE).assertEqual(2);
      expect(AudioConstants.FRAME_SIZE).assertEqual(4);
      expect(AudioConstants.KEY_SOUND_FREQUENCY).assertEqual(1000);
      expect(AudioConstants.AMPLITUDE).assertEqual(0.3);
      expect(AudioConstants.KEY_SOUND_DURATION_MS).assertEqual(150);
      expect(AudioConstants.KEY_SOUND_DURATION_MS_NOTIFICATION).assertEqual(30);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CONST_0054
     * @tc.name      testExtKeyboardConst0053
     * @tc.desc      Keyboard constants 54.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardConst0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(AudioConstants.SAMPLE_RATE).assertEqual(44100);
      expect(AudioConstants.CHANNELS).assertEqual(2);
      expect(AudioConstants.BYTES_PER_SAMPLE).assertEqual(2);
      expect(AudioConstants.FRAME_SIZE).assertEqual(4);
      expect(AudioConstants.KEY_SOUND_FREQUENCY).assertEqual(1000);
      expect(AudioConstants.AMPLITUDE).assertEqual(0.3);
      expect(AudioConstants.KEY_SOUND_DURATION_MS).assertEqual(150);
      expect(AudioConstants.KEY_SOUND_DURATION_MS_NOTIFICATION).assertEqual(30);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CONST_0055
     * @tc.name      testExtKeyboardConst0054
     * @tc.desc      Keyboard constants 55.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardConst0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(AudioConstants.SAMPLE_RATE).assertEqual(44100);
      expect(AudioConstants.CHANNELS).assertEqual(2);
      expect(AudioConstants.BYTES_PER_SAMPLE).assertEqual(2);
      expect(AudioConstants.FRAME_SIZE).assertEqual(4);
      expect(AudioConstants.KEY_SOUND_FREQUENCY).assertEqual(1000);
      expect(AudioConstants.AMPLITUDE).assertEqual(0.3);
      expect(AudioConstants.KEY_SOUND_DURATION_MS).assertEqual(150);
      expect(AudioConstants.KEY_SOUND_DURATION_MS_NOTIFICATION).assertEqual(30);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CONST_0056
     * @tc.name      testExtKeyboardConst0055
     * @tc.desc      Keyboard constants 56.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardConst0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(AudioConstants.SAMPLE_RATE).assertEqual(44100);
      expect(AudioConstants.CHANNELS).assertEqual(2);
      expect(AudioConstants.BYTES_PER_SAMPLE).assertEqual(2);
      expect(AudioConstants.FRAME_SIZE).assertEqual(4);
      expect(AudioConstants.KEY_SOUND_FREQUENCY).assertEqual(1000);
      expect(AudioConstants.AMPLITUDE).assertEqual(0.3);
      expect(AudioConstants.KEY_SOUND_DURATION_MS).assertEqual(150);
      expect(AudioConstants.KEY_SOUND_DURATION_MS_NOTIFICATION).assertEqual(30);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CONST_0057
     * @tc.name      testExtKeyboardConst0056
     * @tc.desc      Keyboard constants 57.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardConst0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(AudioConstants.SAMPLE_RATE).assertEqual(44100);
      expect(AudioConstants.CHANNELS).assertEqual(2);
      expect(AudioConstants.BYTES_PER_SAMPLE).assertEqual(2);
      expect(AudioConstants.FRAME_SIZE).assertEqual(4);
      expect(AudioConstants.KEY_SOUND_FREQUENCY).assertEqual(1000);
      expect(AudioConstants.AMPLITUDE).assertEqual(0.3);
      expect(AudioConstants.KEY_SOUND_DURATION_MS).assertEqual(150);
      expect(AudioConstants.KEY_SOUND_DURATION_MS_NOTIFICATION).assertEqual(30);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CONST_0058
     * @tc.name      testExtKeyboardConst0057
     * @tc.desc      Keyboard constants 58.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardConst0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(AudioConstants.SAMPLE_RATE).assertEqual(44100);
      expect(AudioConstants.CHANNELS).assertEqual(2);
      expect(AudioConstants.BYTES_PER_SAMPLE).assertEqual(2);
      expect(AudioConstants.FRAME_SIZE).assertEqual(4);
      expect(AudioConstants.KEY_SOUND_FREQUENCY).assertEqual(1000);
      expect(AudioConstants.AMPLITUDE).assertEqual(0.3);
      expect(AudioConstants.KEY_SOUND_DURATION_MS).assertEqual(150);
      expect(AudioConstants.KEY_SOUND_DURATION_MS_NOTIFICATION).assertEqual(30);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CONST_0059
     * @tc.name      testExtKeyboardConst0058
     * @tc.desc      Keyboard constants 59.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardConst0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(AudioConstants.SAMPLE_RATE).assertEqual(44100);
      expect(AudioConstants.CHANNELS).assertEqual(2);
      expect(AudioConstants.BYTES_PER_SAMPLE).assertEqual(2);
      expect(AudioConstants.FRAME_SIZE).assertEqual(4);
      expect(AudioConstants.KEY_SOUND_FREQUENCY).assertEqual(1000);
      expect(AudioConstants.AMPLITUDE).assertEqual(0.3);
      expect(AudioConstants.KEY_SOUND_DURATION_MS).assertEqual(150);
      expect(AudioConstants.KEY_SOUND_DURATION_MS_NOTIFICATION).assertEqual(30);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CONST_0060
     * @tc.name      testExtKeyboardConst0059
     * @tc.desc      Keyboard constants 60.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardConst0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(AudioConstants.SAMPLE_RATE).assertEqual(44100);
      expect(AudioConstants.CHANNELS).assertEqual(2);
      expect(AudioConstants.BYTES_PER_SAMPLE).assertEqual(2);
      expect(AudioConstants.FRAME_SIZE).assertEqual(4);
      expect(AudioConstants.KEY_SOUND_FREQUENCY).assertEqual(1000);
      expect(AudioConstants.AMPLITUDE).assertEqual(0.3);
      expect(AudioConstants.KEY_SOUND_DURATION_MS).assertEqual(150);
      expect(AudioConstants.KEY_SOUND_DURATION_MS_NOTIFICATION).assertEqual(30);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CONST_0061
     * @tc.name      testExtKeyboardConst0060
     * @tc.desc      Keyboard constants 61.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardConst0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(AudioConstants.SAMPLE_RATE).assertEqual(44100);
      expect(AudioConstants.CHANNELS).assertEqual(2);
      expect(AudioConstants.BYTES_PER_SAMPLE).assertEqual(2);
      expect(AudioConstants.FRAME_SIZE).assertEqual(4);
      expect(AudioConstants.KEY_SOUND_FREQUENCY).assertEqual(1000);
      expect(AudioConstants.AMPLITUDE).assertEqual(0.3);
      expect(AudioConstants.KEY_SOUND_DURATION_MS).assertEqual(150);
      expect(AudioConstants.KEY_SOUND_DURATION_MS_NOTIFICATION).assertEqual(30);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CONST_0062
     * @tc.name      testExtKeyboardConst0061
     * @tc.desc      Keyboard constants 62.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardConst0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(AudioConstants.SAMPLE_RATE).assertEqual(44100);
      expect(AudioConstants.CHANNELS).assertEqual(2);
      expect(AudioConstants.BYTES_PER_SAMPLE).assertEqual(2);
      expect(AudioConstants.FRAME_SIZE).assertEqual(4);
      expect(AudioConstants.KEY_SOUND_FREQUENCY).assertEqual(1000);
      expect(AudioConstants.AMPLITUDE).assertEqual(0.3);
      expect(AudioConstants.KEY_SOUND_DURATION_MS).assertEqual(150);
      expect(AudioConstants.KEY_SOUND_DURATION_MS_NOTIFICATION).assertEqual(30);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CONST_0063
     * @tc.name      testExtKeyboardConst0062
     * @tc.desc      Keyboard constants 63.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardConst0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(AudioConstants.SAMPLE_RATE).assertEqual(44100);
      expect(AudioConstants.CHANNELS).assertEqual(2);
      expect(AudioConstants.BYTES_PER_SAMPLE).assertEqual(2);
      expect(AudioConstants.FRAME_SIZE).assertEqual(4);
      expect(AudioConstants.KEY_SOUND_FREQUENCY).assertEqual(1000);
      expect(AudioConstants.AMPLITUDE).assertEqual(0.3);
      expect(AudioConstants.KEY_SOUND_DURATION_MS).assertEqual(150);
      expect(AudioConstants.KEY_SOUND_DURATION_MS_NOTIFICATION).assertEqual(30);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CONST_0064
     * @tc.name      testExtKeyboardConst0063
     * @tc.desc      Keyboard constants 64.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardConst0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(AudioConstants.SAMPLE_RATE).assertEqual(44100);
      expect(AudioConstants.CHANNELS).assertEqual(2);
      expect(AudioConstants.BYTES_PER_SAMPLE).assertEqual(2);
      expect(AudioConstants.FRAME_SIZE).assertEqual(4);
      expect(AudioConstants.KEY_SOUND_FREQUENCY).assertEqual(1000);
      expect(AudioConstants.AMPLITUDE).assertEqual(0.3);
      expect(AudioConstants.KEY_SOUND_DURATION_MS).assertEqual(150);
      expect(AudioConstants.KEY_SOUND_DURATION_MS_NOTIFICATION).assertEqual(30);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CONST_0065
     * @tc.name      testExtKeyboardConst0064
     * @tc.desc      Keyboard constants 65.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardConst0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(AudioConstants.SAMPLE_RATE).assertEqual(44100);
      expect(AudioConstants.CHANNELS).assertEqual(2);
      expect(AudioConstants.BYTES_PER_SAMPLE).assertEqual(2);
      expect(AudioConstants.FRAME_SIZE).assertEqual(4);
      expect(AudioConstants.KEY_SOUND_FREQUENCY).assertEqual(1000);
      expect(AudioConstants.AMPLITUDE).assertEqual(0.3);
      expect(AudioConstants.KEY_SOUND_DURATION_MS).assertEqual(150);
      expect(AudioConstants.KEY_SOUND_DURATION_MS_NOTIFICATION).assertEqual(30);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CONST_0066
     * @tc.name      testExtKeyboardConst0065
     * @tc.desc      Keyboard constants 66.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardConst0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(AudioConstants.SAMPLE_RATE).assertEqual(44100);
      expect(AudioConstants.CHANNELS).assertEqual(2);
      expect(AudioConstants.BYTES_PER_SAMPLE).assertEqual(2);
      expect(AudioConstants.FRAME_SIZE).assertEqual(4);
      expect(AudioConstants.KEY_SOUND_FREQUENCY).assertEqual(1000);
      expect(AudioConstants.AMPLITUDE).assertEqual(0.3);
      expect(AudioConstants.KEY_SOUND_DURATION_MS).assertEqual(150);
      expect(AudioConstants.KEY_SOUND_DURATION_MS_NOTIFICATION).assertEqual(30);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CONST_0067
     * @tc.name      testExtKeyboardConst0066
     * @tc.desc      Keyboard constants 67.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardConst0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(AudioConstants.SAMPLE_RATE).assertEqual(44100);
      expect(AudioConstants.CHANNELS).assertEqual(2);
      expect(AudioConstants.BYTES_PER_SAMPLE).assertEqual(2);
      expect(AudioConstants.FRAME_SIZE).assertEqual(4);
      expect(AudioConstants.KEY_SOUND_FREQUENCY).assertEqual(1000);
      expect(AudioConstants.AMPLITUDE).assertEqual(0.3);
      expect(AudioConstants.KEY_SOUND_DURATION_MS).assertEqual(150);
      expect(AudioConstants.KEY_SOUND_DURATION_MS_NOTIFICATION).assertEqual(30);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CONST_0068
     * @tc.name      testExtKeyboardConst0067
     * @tc.desc      Keyboard constants 68.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardConst0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(AudioConstants.SAMPLE_RATE).assertEqual(44100);
      expect(AudioConstants.CHANNELS).assertEqual(2);
      expect(AudioConstants.BYTES_PER_SAMPLE).assertEqual(2);
      expect(AudioConstants.FRAME_SIZE).assertEqual(4);
      expect(AudioConstants.KEY_SOUND_FREQUENCY).assertEqual(1000);
      expect(AudioConstants.AMPLITUDE).assertEqual(0.3);
      expect(AudioConstants.KEY_SOUND_DURATION_MS).assertEqual(150);
      expect(AudioConstants.KEY_SOUND_DURATION_MS_NOTIFICATION).assertEqual(30);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CONST_0069
     * @tc.name      testExtKeyboardConst0068
     * @tc.desc      Keyboard constants 69.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardConst0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(AudioConstants.SAMPLE_RATE).assertEqual(44100);
      expect(AudioConstants.CHANNELS).assertEqual(2);
      expect(AudioConstants.BYTES_PER_SAMPLE).assertEqual(2);
      expect(AudioConstants.FRAME_SIZE).assertEqual(4);
      expect(AudioConstants.KEY_SOUND_FREQUENCY).assertEqual(1000);
      expect(AudioConstants.AMPLITUDE).assertEqual(0.3);
      expect(AudioConstants.KEY_SOUND_DURATION_MS).assertEqual(150);
      expect(AudioConstants.KEY_SOUND_DURATION_MS_NOTIFICATION).assertEqual(30);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CONST_0070
     * @tc.name      testExtKeyboardConst0069
     * @tc.desc      Keyboard constants 70.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardConst0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(AudioConstants.SAMPLE_RATE).assertEqual(44100);
      expect(AudioConstants.CHANNELS).assertEqual(2);
      expect(AudioConstants.BYTES_PER_SAMPLE).assertEqual(2);
      expect(AudioConstants.FRAME_SIZE).assertEqual(4);
      expect(AudioConstants.KEY_SOUND_FREQUENCY).assertEqual(1000);
      expect(AudioConstants.AMPLITUDE).assertEqual(0.3);
      expect(AudioConstants.KEY_SOUND_DURATION_MS).assertEqual(150);
      expect(AudioConstants.KEY_SOUND_DURATION_MS_NOTIFICATION).assertEqual(30);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CONST_0071
     * @tc.name      testExtKeyboardConst0070
     * @tc.desc      Keyboard constants 71.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardConst0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(AudioConstants.SAMPLE_RATE).assertEqual(44100);
      expect(AudioConstants.CHANNELS).assertEqual(2);
      expect(AudioConstants.BYTES_PER_SAMPLE).assertEqual(2);
      expect(AudioConstants.FRAME_SIZE).assertEqual(4);
      expect(AudioConstants.KEY_SOUND_FREQUENCY).assertEqual(1000);
      expect(AudioConstants.AMPLITUDE).assertEqual(0.3);
      expect(AudioConstants.KEY_SOUND_DURATION_MS).assertEqual(150);
      expect(AudioConstants.KEY_SOUND_DURATION_MS_NOTIFICATION).assertEqual(30);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CONST_0072
     * @tc.name      testExtKeyboardConst0071
     * @tc.desc      Keyboard constants 72.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardConst0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(AudioConstants.SAMPLE_RATE).assertEqual(44100);
      expect(AudioConstants.CHANNELS).assertEqual(2);
      expect(AudioConstants.BYTES_PER_SAMPLE).assertEqual(2);
      expect(AudioConstants.FRAME_SIZE).assertEqual(4);
      expect(AudioConstants.KEY_SOUND_FREQUENCY).assertEqual(1000);
      expect(AudioConstants.AMPLITUDE).assertEqual(0.3);
      expect(AudioConstants.KEY_SOUND_DURATION_MS).assertEqual(150);
      expect(AudioConstants.KEY_SOUND_DURATION_MS_NOTIFICATION).assertEqual(30);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CONST_0073
     * @tc.name      testExtKeyboardConst0072
     * @tc.desc      Keyboard constants 73.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardConst0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(AudioConstants.SAMPLE_RATE).assertEqual(44100);
      expect(AudioConstants.CHANNELS).assertEqual(2);
      expect(AudioConstants.BYTES_PER_SAMPLE).assertEqual(2);
      expect(AudioConstants.FRAME_SIZE).assertEqual(4);
      expect(AudioConstants.KEY_SOUND_FREQUENCY).assertEqual(1000);
      expect(AudioConstants.AMPLITUDE).assertEqual(0.3);
      expect(AudioConstants.KEY_SOUND_DURATION_MS).assertEqual(150);
      expect(AudioConstants.KEY_SOUND_DURATION_MS_NOTIFICATION).assertEqual(30);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CONST_0074
     * @tc.name      testExtKeyboardConst0073
     * @tc.desc      Keyboard constants 74.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardConst0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(AudioConstants.SAMPLE_RATE).assertEqual(44100);
      expect(AudioConstants.CHANNELS).assertEqual(2);
      expect(AudioConstants.BYTES_PER_SAMPLE).assertEqual(2);
      expect(AudioConstants.FRAME_SIZE).assertEqual(4);
      expect(AudioConstants.KEY_SOUND_FREQUENCY).assertEqual(1000);
      expect(AudioConstants.AMPLITUDE).assertEqual(0.3);
      expect(AudioConstants.KEY_SOUND_DURATION_MS).assertEqual(150);
      expect(AudioConstants.KEY_SOUND_DURATION_MS_NOTIFICATION).assertEqual(30);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CONST_0075
     * @tc.name      testExtKeyboardConst0074
     * @tc.desc      Keyboard constants 75.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardConst0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(AudioConstants.SAMPLE_RATE).assertEqual(44100);
      expect(AudioConstants.CHANNELS).assertEqual(2);
      expect(AudioConstants.BYTES_PER_SAMPLE).assertEqual(2);
      expect(AudioConstants.FRAME_SIZE).assertEqual(4);
      expect(AudioConstants.KEY_SOUND_FREQUENCY).assertEqual(1000);
      expect(AudioConstants.AMPLITUDE).assertEqual(0.3);
      expect(AudioConstants.KEY_SOUND_DURATION_MS).assertEqual(150);
      expect(AudioConstants.KEY_SOUND_DURATION_MS_NOTIFICATION).assertEqual(30);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CONST_0076
     * @tc.name      testExtKeyboardConst0075
     * @tc.desc      Keyboard constants 76.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardConst0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(AudioConstants.SAMPLE_RATE).assertEqual(44100);
      expect(AudioConstants.CHANNELS).assertEqual(2);
      expect(AudioConstants.BYTES_PER_SAMPLE).assertEqual(2);
      expect(AudioConstants.FRAME_SIZE).assertEqual(4);
      expect(AudioConstants.KEY_SOUND_FREQUENCY).assertEqual(1000);
      expect(AudioConstants.AMPLITUDE).assertEqual(0.3);
      expect(AudioConstants.KEY_SOUND_DURATION_MS).assertEqual(150);
      expect(AudioConstants.KEY_SOUND_DURATION_MS_NOTIFICATION).assertEqual(30);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CONST_0077
     * @tc.name      testExtKeyboardConst0076
     * @tc.desc      Keyboard constants 77.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardConst0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(AudioConstants.SAMPLE_RATE).assertEqual(44100);
      expect(AudioConstants.CHANNELS).assertEqual(2);
      expect(AudioConstants.BYTES_PER_SAMPLE).assertEqual(2);
      expect(AudioConstants.FRAME_SIZE).assertEqual(4);
      expect(AudioConstants.KEY_SOUND_FREQUENCY).assertEqual(1000);
      expect(AudioConstants.AMPLITUDE).assertEqual(0.3);
      expect(AudioConstants.KEY_SOUND_DURATION_MS).assertEqual(150);
      expect(AudioConstants.KEY_SOUND_DURATION_MS_NOTIFICATION).assertEqual(30);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CONST_0078
     * @tc.name      testExtKeyboardConst0077
     * @tc.desc      Keyboard constants 78.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardConst0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(AudioConstants.SAMPLE_RATE).assertEqual(44100);
      expect(AudioConstants.CHANNELS).assertEqual(2);
      expect(AudioConstants.BYTES_PER_SAMPLE).assertEqual(2);
      expect(AudioConstants.FRAME_SIZE).assertEqual(4);
      expect(AudioConstants.KEY_SOUND_FREQUENCY).assertEqual(1000);
      expect(AudioConstants.AMPLITUDE).assertEqual(0.3);
      expect(AudioConstants.KEY_SOUND_DURATION_MS).assertEqual(150);
      expect(AudioConstants.KEY_SOUND_DURATION_MS_NOTIFICATION).assertEqual(30);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CONST_0079
     * @tc.name      testExtKeyboardConst0078
     * @tc.desc      Keyboard constants 79.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardConst0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(AudioConstants.SAMPLE_RATE).assertEqual(44100);
      expect(AudioConstants.CHANNELS).assertEqual(2);
      expect(AudioConstants.BYTES_PER_SAMPLE).assertEqual(2);
      expect(AudioConstants.FRAME_SIZE).assertEqual(4);
      expect(AudioConstants.KEY_SOUND_FREQUENCY).assertEqual(1000);
      expect(AudioConstants.AMPLITUDE).assertEqual(0.3);
      expect(AudioConstants.KEY_SOUND_DURATION_MS).assertEqual(150);
      expect(AudioConstants.KEY_SOUND_DURATION_MS_NOTIFICATION).assertEqual(30);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CONST_0080
     * @tc.name      testExtKeyboardConst0079
     * @tc.desc      Keyboard constants 80.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardConst0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(AudioConstants.SAMPLE_RATE).assertEqual(44100);
      expect(AudioConstants.CHANNELS).assertEqual(2);
      expect(AudioConstants.BYTES_PER_SAMPLE).assertEqual(2);
      expect(AudioConstants.FRAME_SIZE).assertEqual(4);
      expect(AudioConstants.KEY_SOUND_FREQUENCY).assertEqual(1000);
      expect(AudioConstants.AMPLITUDE).assertEqual(0.3);
      expect(AudioConstants.KEY_SOUND_DURATION_MS).assertEqual(150);
      expect(AudioConstants.KEY_SOUND_DURATION_MS_NOTIFICATION).assertEqual(30);
    })
  });
}
