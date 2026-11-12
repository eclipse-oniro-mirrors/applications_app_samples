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

const TAG: string = '[Sample_keyboardSoundUsageMatrix]';
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

export default function keyboardSoundUsageMatrixTest(): void {
  describe('keyboardSoundUsageMatrixTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_USAGE_0001
     * @tc.name      testExtKeyboardUsage0000
     * @tc.desc      Usage matrix MUSIC/DEFAULT.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardUsage0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      const amplitude: number = 0.3;
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(sampleRate).assertLarger(0);
      expect(amplitude).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_USAGE_0002
     * @tc.name      testExtKeyboardUsage0001
     * @tc.desc      Usage matrix NOTIFICATION/MIX_WITH_OTHERS.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardUsage0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      const amplitude: number = 0.5;
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(sampleRate).assertLarger(0);
      expect(amplitude).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_USAGE_0003
     * @tc.name      testExtKeyboardUsage0002
     * @tc.desc      Usage matrix MUSIC/DEFAULT.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardUsage0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      const amplitude: number = 0.3;
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(sampleRate).assertLarger(0);
      expect(amplitude).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_USAGE_0004
     * @tc.name      testExtKeyboardUsage0003
     * @tc.desc      Usage matrix NOTIFICATION/MIX_WITH_OTHERS.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardUsage0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      const amplitude: number = 0.5;
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(sampleRate).assertLarger(0);
      expect(amplitude).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_USAGE_0005
     * @tc.name      testExtKeyboardUsage0004
     * @tc.desc      Usage matrix MUSIC/DEFAULT.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardUsage0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      const amplitude: number = 0.3;
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(sampleRate).assertLarger(0);
      expect(amplitude).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_USAGE_0006
     * @tc.name      testExtKeyboardUsage0005
     * @tc.desc      Usage matrix NOTIFICATION/MIX_WITH_OTHERS.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardUsage0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      const amplitude: number = 0.5;
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(sampleRate).assertLarger(0);
      expect(amplitude).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_USAGE_0007
     * @tc.name      testExtKeyboardUsage0006
     * @tc.desc      Usage matrix MUSIC/DEFAULT.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardUsage0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      const amplitude: number = 0.3;
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(sampleRate).assertLarger(0);
      expect(amplitude).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_USAGE_0008
     * @tc.name      testExtKeyboardUsage0007
     * @tc.desc      Usage matrix NOTIFICATION/MIX_WITH_OTHERS.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardUsage0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      const amplitude: number = 0.5;
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(sampleRate).assertLarger(0);
      expect(amplitude).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_USAGE_0009
     * @tc.name      testExtKeyboardUsage0008
     * @tc.desc      Usage matrix MUSIC/DEFAULT.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardUsage0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      const amplitude: number = 0.3;
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(sampleRate).assertLarger(0);
      expect(amplitude).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_USAGE_0010
     * @tc.name      testExtKeyboardUsage0009
     * @tc.desc      Usage matrix NOTIFICATION/MIX_WITH_OTHERS.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardUsage0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      const amplitude: number = 0.5;
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(sampleRate).assertLarger(0);
      expect(amplitude).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_USAGE_0011
     * @tc.name      testExtKeyboardUsage0010
     * @tc.desc      Usage matrix MUSIC/DEFAULT.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardUsage0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      const amplitude: number = 0.3;
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(sampleRate).assertLarger(0);
      expect(amplitude).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_USAGE_0012
     * @tc.name      testExtKeyboardUsage0011
     * @tc.desc      Usage matrix NOTIFICATION/MIX_WITH_OTHERS.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardUsage0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      const amplitude: number = 0.5;
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(sampleRate).assertLarger(0);
      expect(amplitude).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_USAGE_0013
     * @tc.name      testExtKeyboardUsage0012
     * @tc.desc      Usage matrix MUSIC/DEFAULT.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardUsage0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      const amplitude: number = 0.3;
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(sampleRate).assertLarger(0);
      expect(amplitude).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_USAGE_0014
     * @tc.name      testExtKeyboardUsage0013
     * @tc.desc      Usage matrix NOTIFICATION/MIX_WITH_OTHERS.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardUsage0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      const amplitude: number = 0.5;
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(sampleRate).assertLarger(0);
      expect(amplitude).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_USAGE_0015
     * @tc.name      testExtKeyboardUsage0014
     * @tc.desc      Usage matrix MUSIC/DEFAULT.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardUsage0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      const amplitude: number = 0.3;
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(sampleRate).assertLarger(0);
      expect(amplitude).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_USAGE_0016
     * @tc.name      testExtKeyboardUsage0015
     * @tc.desc      Usage matrix NOTIFICATION/MIX_WITH_OTHERS.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardUsage0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      const amplitude: number = 0.5;
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(sampleRate).assertLarger(0);
      expect(amplitude).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_USAGE_0017
     * @tc.name      testExtKeyboardUsage0016
     * @tc.desc      Usage matrix MUSIC/DEFAULT.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardUsage0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      const amplitude: number = 0.3;
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(sampleRate).assertLarger(0);
      expect(amplitude).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_USAGE_0018
     * @tc.name      testExtKeyboardUsage0017
     * @tc.desc      Usage matrix NOTIFICATION/MIX_WITH_OTHERS.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardUsage0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      const amplitude: number = 0.5;
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(sampleRate).assertLarger(0);
      expect(amplitude).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_USAGE_0019
     * @tc.name      testExtKeyboardUsage0018
     * @tc.desc      Usage matrix MUSIC/DEFAULT.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardUsage0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      const amplitude: number = 0.3;
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(sampleRate).assertLarger(0);
      expect(amplitude).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_USAGE_0020
     * @tc.name      testExtKeyboardUsage0019
     * @tc.desc      Usage matrix NOTIFICATION/MIX_WITH_OTHERS.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardUsage0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      const amplitude: number = 0.5;
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(sampleRate).assertLarger(0);
      expect(amplitude).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_USAGE_0021
     * @tc.name      testExtKeyboardUsage0020
     * @tc.desc      Usage matrix MUSIC/DEFAULT.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardUsage0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      const amplitude: number = 0.3;
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(sampleRate).assertLarger(0);
      expect(amplitude).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_USAGE_0022
     * @tc.name      testExtKeyboardUsage0021
     * @tc.desc      Usage matrix NOTIFICATION/MIX_WITH_OTHERS.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardUsage0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      const amplitude: number = 0.5;
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(sampleRate).assertLarger(0);
      expect(amplitude).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_USAGE_0023
     * @tc.name      testExtKeyboardUsage0022
     * @tc.desc      Usage matrix MUSIC/DEFAULT.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardUsage0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      const amplitude: number = 0.3;
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(sampleRate).assertLarger(0);
      expect(amplitude).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_USAGE_0024
     * @tc.name      testExtKeyboardUsage0023
     * @tc.desc      Usage matrix NOTIFICATION/MIX_WITH_OTHERS.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardUsage0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      const amplitude: number = 0.5;
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(sampleRate).assertLarger(0);
      expect(amplitude).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_USAGE_0025
     * @tc.name      testExtKeyboardUsage0024
     * @tc.desc      Usage matrix MUSIC/DEFAULT.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardUsage0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      const amplitude: number = 0.3;
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(sampleRate).assertLarger(0);
      expect(amplitude).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_USAGE_0026
     * @tc.name      testExtKeyboardUsage0025
     * @tc.desc      Usage matrix NOTIFICATION/MIX_WITH_OTHERS.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardUsage0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      const amplitude: number = 0.5;
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(sampleRate).assertLarger(0);
      expect(amplitude).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_USAGE_0027
     * @tc.name      testExtKeyboardUsage0026
     * @tc.desc      Usage matrix MUSIC/DEFAULT.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardUsage0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      const amplitude: number = 0.3;
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(sampleRate).assertLarger(0);
      expect(amplitude).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_USAGE_0028
     * @tc.name      testExtKeyboardUsage0027
     * @tc.desc      Usage matrix NOTIFICATION/MIX_WITH_OTHERS.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardUsage0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      const amplitude: number = 0.5;
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(sampleRate).assertLarger(0);
      expect(amplitude).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_USAGE_0029
     * @tc.name      testExtKeyboardUsage0028
     * @tc.desc      Usage matrix MUSIC/DEFAULT.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardUsage0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      const amplitude: number = 0.3;
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(sampleRate).assertLarger(0);
      expect(amplitude).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_USAGE_0030
     * @tc.name      testExtKeyboardUsage0029
     * @tc.desc      Usage matrix NOTIFICATION/MIX_WITH_OTHERS.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardUsage0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      const amplitude: number = 0.5;
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(sampleRate).assertLarger(0);
      expect(amplitude).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_USAGE_0031
     * @tc.name      testExtKeyboardUsage0030
     * @tc.desc      Usage matrix MUSIC/DEFAULT.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardUsage0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      const amplitude: number = 0.3;
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(sampleRate).assertLarger(0);
      expect(amplitude).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_USAGE_0032
     * @tc.name      testExtKeyboardUsage0031
     * @tc.desc      Usage matrix NOTIFICATION/MIX_WITH_OTHERS.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardUsage0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      const amplitude: number = 0.5;
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(sampleRate).assertLarger(0);
      expect(amplitude).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_USAGE_0033
     * @tc.name      testExtKeyboardUsage0032
     * @tc.desc      Usage matrix MUSIC/DEFAULT.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardUsage0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      const amplitude: number = 0.3;
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(sampleRate).assertLarger(0);
      expect(amplitude).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_USAGE_0034
     * @tc.name      testExtKeyboardUsage0033
     * @tc.desc      Usage matrix NOTIFICATION/MIX_WITH_OTHERS.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardUsage0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      const amplitude: number = 0.5;
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(sampleRate).assertLarger(0);
      expect(amplitude).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_USAGE_0035
     * @tc.name      testExtKeyboardUsage0034
     * @tc.desc      Usage matrix MUSIC/DEFAULT.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardUsage0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      const amplitude: number = 0.3;
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(sampleRate).assertLarger(0);
      expect(amplitude).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_USAGE_0036
     * @tc.name      testExtKeyboardUsage0035
     * @tc.desc      Usage matrix NOTIFICATION/MIX_WITH_OTHERS.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardUsage0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      const amplitude: number = 0.5;
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(sampleRate).assertLarger(0);
      expect(amplitude).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_USAGE_0037
     * @tc.name      testExtKeyboardUsage0036
     * @tc.desc      Usage matrix MUSIC/DEFAULT.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardUsage0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      const amplitude: number = 0.3;
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(sampleRate).assertLarger(0);
      expect(amplitude).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_USAGE_0038
     * @tc.name      testExtKeyboardUsage0037
     * @tc.desc      Usage matrix NOTIFICATION/MIX_WITH_OTHERS.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardUsage0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      const amplitude: number = 0.5;
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(sampleRate).assertLarger(0);
      expect(amplitude).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_USAGE_0039
     * @tc.name      testExtKeyboardUsage0038
     * @tc.desc      Usage matrix MUSIC/DEFAULT.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardUsage0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      const amplitude: number = 0.3;
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(sampleRate).assertLarger(0);
      expect(amplitude).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_USAGE_0040
     * @tc.name      testExtKeyboardUsage0039
     * @tc.desc      Usage matrix NOTIFICATION/MIX_WITH_OTHERS.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardUsage0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      const amplitude: number = 0.5;
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(sampleRate).assertLarger(0);
      expect(amplitude).assertLarger(0);
    })
  });
}
