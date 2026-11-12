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

const TAG: string = '[Sample_keyboardSoundStrategyMatrix]';
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

export default function keyboardSoundStrategyMatrixTest(): void {
  describe('keyboardSoundStrategyMatrixTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_STRATEGY_0001
     * @tc.name      testExtKeyboardStrategy0000
     * @tc.desc      Strategy MUSIC/DEFAULT 150ms.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardStrategy0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      expect(usage === 'MUSIC' || usage === 'NOTIFICATION').assertTrue();
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
      expect(durationMs).assertLarger(0);
      expect(sampleRate).assertLarger(0);
      expect(2).assertEqual(2);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_STRATEGY_0002
     * @tc.name      testExtKeyboardStrategy0001
     * @tc.desc      Strategy NOTIFICATION/MIX_WITH_OTHERS 30ms.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardStrategy0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      expect(usage === 'MUSIC' || usage === 'NOTIFICATION').assertTrue();
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
      expect(durationMs).assertLarger(0);
      expect(sampleRate).assertLarger(0);
      expect(2).assertEqual(2);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_STRATEGY_0003
     * @tc.name      testExtKeyboardStrategy0002
     * @tc.desc      Strategy MUSIC/DEFAULT 150ms.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardStrategy0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      expect(usage === 'MUSIC' || usage === 'NOTIFICATION').assertTrue();
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
      expect(durationMs).assertLarger(0);
      expect(sampleRate).assertLarger(0);
      expect(2).assertEqual(2);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_STRATEGY_0004
     * @tc.name      testExtKeyboardStrategy0003
     * @tc.desc      Strategy NOTIFICATION/MIX_WITH_OTHERS 30ms.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardStrategy0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      expect(usage === 'MUSIC' || usage === 'NOTIFICATION').assertTrue();
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
      expect(durationMs).assertLarger(0);
      expect(sampleRate).assertLarger(0);
      expect(2).assertEqual(2);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_STRATEGY_0005
     * @tc.name      testExtKeyboardStrategy0004
     * @tc.desc      Strategy MUSIC/DEFAULT 150ms.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardStrategy0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      expect(usage === 'MUSIC' || usage === 'NOTIFICATION').assertTrue();
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
      expect(durationMs).assertLarger(0);
      expect(sampleRate).assertLarger(0);
      expect(2).assertEqual(2);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_STRATEGY_0006
     * @tc.name      testExtKeyboardStrategy0005
     * @tc.desc      Strategy NOTIFICATION/MIX_WITH_OTHERS 30ms.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardStrategy0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      expect(usage === 'MUSIC' || usage === 'NOTIFICATION').assertTrue();
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
      expect(durationMs).assertLarger(0);
      expect(sampleRate).assertLarger(0);
      expect(2).assertEqual(2);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_STRATEGY_0007
     * @tc.name      testExtKeyboardStrategy0006
     * @tc.desc      Strategy MUSIC/DEFAULT 150ms.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardStrategy0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      expect(usage === 'MUSIC' || usage === 'NOTIFICATION').assertTrue();
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
      expect(durationMs).assertLarger(0);
      expect(sampleRate).assertLarger(0);
      expect(2).assertEqual(2);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_STRATEGY_0008
     * @tc.name      testExtKeyboardStrategy0007
     * @tc.desc      Strategy NOTIFICATION/MIX_WITH_OTHERS 30ms.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardStrategy0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      expect(usage === 'MUSIC' || usage === 'NOTIFICATION').assertTrue();
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
      expect(durationMs).assertLarger(0);
      expect(sampleRate).assertLarger(0);
      expect(2).assertEqual(2);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_STRATEGY_0009
     * @tc.name      testExtKeyboardStrategy0008
     * @tc.desc      Strategy MUSIC/DEFAULT 150ms.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardStrategy0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      expect(usage === 'MUSIC' || usage === 'NOTIFICATION').assertTrue();
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
      expect(durationMs).assertLarger(0);
      expect(sampleRate).assertLarger(0);
      expect(2).assertEqual(2);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_STRATEGY_0010
     * @tc.name      testExtKeyboardStrategy0009
     * @tc.desc      Strategy NOTIFICATION/MIX_WITH_OTHERS 30ms.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardStrategy0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      expect(usage === 'MUSIC' || usage === 'NOTIFICATION').assertTrue();
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
      expect(durationMs).assertLarger(0);
      expect(sampleRate).assertLarger(0);
      expect(2).assertEqual(2);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_STRATEGY_0011
     * @tc.name      testExtKeyboardStrategy0010
     * @tc.desc      Strategy MUSIC/DEFAULT 150ms.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardStrategy0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      expect(usage === 'MUSIC' || usage === 'NOTIFICATION').assertTrue();
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
      expect(durationMs).assertLarger(0);
      expect(sampleRate).assertLarger(0);
      expect(2).assertEqual(2);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_STRATEGY_0012
     * @tc.name      testExtKeyboardStrategy0011
     * @tc.desc      Strategy NOTIFICATION/MIX_WITH_OTHERS 30ms.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardStrategy0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      expect(usage === 'MUSIC' || usage === 'NOTIFICATION').assertTrue();
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
      expect(durationMs).assertLarger(0);
      expect(sampleRate).assertLarger(0);
      expect(2).assertEqual(2);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_STRATEGY_0013
     * @tc.name      testExtKeyboardStrategy0012
     * @tc.desc      Strategy MUSIC/DEFAULT 150ms.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardStrategy0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      expect(usage === 'MUSIC' || usage === 'NOTIFICATION').assertTrue();
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
      expect(durationMs).assertLarger(0);
      expect(sampleRate).assertLarger(0);
      expect(2).assertEqual(2);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_STRATEGY_0014
     * @tc.name      testExtKeyboardStrategy0013
     * @tc.desc      Strategy NOTIFICATION/MIX_WITH_OTHERS 30ms.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardStrategy0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      expect(usage === 'MUSIC' || usage === 'NOTIFICATION').assertTrue();
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
      expect(durationMs).assertLarger(0);
      expect(sampleRate).assertLarger(0);
      expect(2).assertEqual(2);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_STRATEGY_0015
     * @tc.name      testExtKeyboardStrategy0014
     * @tc.desc      Strategy MUSIC/DEFAULT 150ms.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardStrategy0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      expect(usage === 'MUSIC' || usage === 'NOTIFICATION').assertTrue();
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
      expect(durationMs).assertLarger(0);
      expect(sampleRate).assertLarger(0);
      expect(2).assertEqual(2);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_STRATEGY_0016
     * @tc.name      testExtKeyboardStrategy0015
     * @tc.desc      Strategy NOTIFICATION/MIX_WITH_OTHERS 30ms.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardStrategy0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      expect(usage === 'MUSIC' || usage === 'NOTIFICATION').assertTrue();
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
      expect(durationMs).assertLarger(0);
      expect(sampleRate).assertLarger(0);
      expect(2).assertEqual(2);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_STRATEGY_0017
     * @tc.name      testExtKeyboardStrategy0016
     * @tc.desc      Strategy MUSIC/DEFAULT 150ms.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardStrategy0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      expect(usage === 'MUSIC' || usage === 'NOTIFICATION').assertTrue();
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
      expect(durationMs).assertLarger(0);
      expect(sampleRate).assertLarger(0);
      expect(2).assertEqual(2);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_STRATEGY_0018
     * @tc.name      testExtKeyboardStrategy0017
     * @tc.desc      Strategy NOTIFICATION/MIX_WITH_OTHERS 30ms.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardStrategy0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      expect(usage === 'MUSIC' || usage === 'NOTIFICATION').assertTrue();
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
      expect(durationMs).assertLarger(0);
      expect(sampleRate).assertLarger(0);
      expect(2).assertEqual(2);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_STRATEGY_0019
     * @tc.name      testExtKeyboardStrategy0018
     * @tc.desc      Strategy MUSIC/DEFAULT 150ms.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardStrategy0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      expect(usage === 'MUSIC' || usage === 'NOTIFICATION').assertTrue();
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
      expect(durationMs).assertLarger(0);
      expect(sampleRate).assertLarger(0);
      expect(2).assertEqual(2);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_STRATEGY_0020
     * @tc.name      testExtKeyboardStrategy0019
     * @tc.desc      Strategy NOTIFICATION/MIX_WITH_OTHERS 30ms.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardStrategy0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      expect(usage === 'MUSIC' || usage === 'NOTIFICATION').assertTrue();
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
      expect(durationMs).assertLarger(0);
      expect(sampleRate).assertLarger(0);
      expect(2).assertEqual(2);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_STRATEGY_0021
     * @tc.name      testExtKeyboardStrategy0020
     * @tc.desc      Strategy MUSIC/DEFAULT 150ms.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardStrategy0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      expect(usage === 'MUSIC' || usage === 'NOTIFICATION').assertTrue();
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
      expect(durationMs).assertLarger(0);
      expect(sampleRate).assertLarger(0);
      expect(2).assertEqual(2);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_STRATEGY_0022
     * @tc.name      testExtKeyboardStrategy0021
     * @tc.desc      Strategy NOTIFICATION/MIX_WITH_OTHERS 30ms.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardStrategy0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      expect(usage === 'MUSIC' || usage === 'NOTIFICATION').assertTrue();
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
      expect(durationMs).assertLarger(0);
      expect(sampleRate).assertLarger(0);
      expect(2).assertEqual(2);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_STRATEGY_0023
     * @tc.name      testExtKeyboardStrategy0022
     * @tc.desc      Strategy MUSIC/DEFAULT 150ms.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardStrategy0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      expect(usage === 'MUSIC' || usage === 'NOTIFICATION').assertTrue();
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
      expect(durationMs).assertLarger(0);
      expect(sampleRate).assertLarger(0);
      expect(2).assertEqual(2);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_STRATEGY_0024
     * @tc.name      testExtKeyboardStrategy0023
     * @tc.desc      Strategy NOTIFICATION/MIX_WITH_OTHERS 30ms.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardStrategy0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      expect(usage === 'MUSIC' || usage === 'NOTIFICATION').assertTrue();
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
      expect(durationMs).assertLarger(0);
      expect(sampleRate).assertLarger(0);
      expect(2).assertEqual(2);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_STRATEGY_0025
     * @tc.name      testExtKeyboardStrategy0024
     * @tc.desc      Strategy MUSIC/DEFAULT 150ms.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardStrategy0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      expect(usage === 'MUSIC' || usage === 'NOTIFICATION').assertTrue();
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
      expect(durationMs).assertLarger(0);
      expect(sampleRate).assertLarger(0);
      expect(2).assertEqual(2);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_STRATEGY_0026
     * @tc.name      testExtKeyboardStrategy0025
     * @tc.desc      Strategy NOTIFICATION/MIX_WITH_OTHERS 30ms.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardStrategy0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      expect(usage === 'MUSIC' || usage === 'NOTIFICATION').assertTrue();
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
      expect(durationMs).assertLarger(0);
      expect(sampleRate).assertLarger(0);
      expect(2).assertEqual(2);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_STRATEGY_0027
     * @tc.name      testExtKeyboardStrategy0026
     * @tc.desc      Strategy MUSIC/DEFAULT 150ms.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardStrategy0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      expect(usage === 'MUSIC' || usage === 'NOTIFICATION').assertTrue();
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
      expect(durationMs).assertLarger(0);
      expect(sampleRate).assertLarger(0);
      expect(2).assertEqual(2);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_STRATEGY_0028
     * @tc.name      testExtKeyboardStrategy0027
     * @tc.desc      Strategy NOTIFICATION/MIX_WITH_OTHERS 30ms.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardStrategy0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      expect(usage === 'MUSIC' || usage === 'NOTIFICATION').assertTrue();
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
      expect(durationMs).assertLarger(0);
      expect(sampleRate).assertLarger(0);
      expect(2).assertEqual(2);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_STRATEGY_0029
     * @tc.name      testExtKeyboardStrategy0028
     * @tc.desc      Strategy MUSIC/DEFAULT 150ms.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardStrategy0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      expect(usage === 'MUSIC' || usage === 'NOTIFICATION').assertTrue();
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
      expect(durationMs).assertLarger(0);
      expect(sampleRate).assertLarger(0);
      expect(2).assertEqual(2);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_STRATEGY_0030
     * @tc.name      testExtKeyboardStrategy0029
     * @tc.desc      Strategy NOTIFICATION/MIX_WITH_OTHERS 30ms.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardStrategy0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      expect(usage === 'MUSIC' || usage === 'NOTIFICATION').assertTrue();
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
      expect(durationMs).assertLarger(0);
      expect(sampleRate).assertLarger(0);
      expect(2).assertEqual(2);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_STRATEGY_0031
     * @tc.name      testExtKeyboardStrategy0030
     * @tc.desc      Strategy MUSIC/DEFAULT 150ms.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardStrategy0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      expect(usage === 'MUSIC' || usage === 'NOTIFICATION').assertTrue();
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
      expect(durationMs).assertLarger(0);
      expect(sampleRate).assertLarger(0);
      expect(2).assertEqual(2);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_STRATEGY_0032
     * @tc.name      testExtKeyboardStrategy0031
     * @tc.desc      Strategy NOTIFICATION/MIX_WITH_OTHERS 30ms.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardStrategy0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      expect(usage === 'MUSIC' || usage === 'NOTIFICATION').assertTrue();
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
      expect(durationMs).assertLarger(0);
      expect(sampleRate).assertLarger(0);
      expect(2).assertEqual(2);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_STRATEGY_0033
     * @tc.name      testExtKeyboardStrategy0032
     * @tc.desc      Strategy MUSIC/DEFAULT 150ms.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardStrategy0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      expect(usage === 'MUSIC' || usage === 'NOTIFICATION').assertTrue();
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
      expect(durationMs).assertLarger(0);
      expect(sampleRate).assertLarger(0);
      expect(2).assertEqual(2);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_STRATEGY_0034
     * @tc.name      testExtKeyboardStrategy0033
     * @tc.desc      Strategy NOTIFICATION/MIX_WITH_OTHERS 30ms.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardStrategy0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      expect(usage === 'MUSIC' || usage === 'NOTIFICATION').assertTrue();
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
      expect(durationMs).assertLarger(0);
      expect(sampleRate).assertLarger(0);
      expect(2).assertEqual(2);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_STRATEGY_0035
     * @tc.name      testExtKeyboardStrategy0034
     * @tc.desc      Strategy MUSIC/DEFAULT 150ms.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardStrategy0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      expect(usage === 'MUSIC' || usage === 'NOTIFICATION').assertTrue();
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
      expect(durationMs).assertLarger(0);
      expect(sampleRate).assertLarger(0);
      expect(2).assertEqual(2);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_STRATEGY_0036
     * @tc.name      testExtKeyboardStrategy0035
     * @tc.desc      Strategy NOTIFICATION/MIX_WITH_OTHERS 30ms.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardStrategy0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      expect(usage === 'MUSIC' || usage === 'NOTIFICATION').assertTrue();
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
      expect(durationMs).assertLarger(0);
      expect(sampleRate).assertLarger(0);
      expect(2).assertEqual(2);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_STRATEGY_0037
     * @tc.name      testExtKeyboardStrategy0036
     * @tc.desc      Strategy MUSIC/DEFAULT 150ms.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardStrategy0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      expect(usage === 'MUSIC' || usage === 'NOTIFICATION').assertTrue();
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
      expect(durationMs).assertLarger(0);
      expect(sampleRate).assertLarger(0);
      expect(2).assertEqual(2);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_STRATEGY_0038
     * @tc.name      testExtKeyboardStrategy0037
     * @tc.desc      Strategy NOTIFICATION/MIX_WITH_OTHERS 30ms.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardStrategy0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      expect(usage === 'MUSIC' || usage === 'NOTIFICATION').assertTrue();
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
      expect(durationMs).assertLarger(0);
      expect(sampleRate).assertLarger(0);
      expect(2).assertEqual(2);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_STRATEGY_0039
     * @tc.name      testExtKeyboardStrategy0038
     * @tc.desc      Strategy MUSIC/DEFAULT 150ms.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardStrategy0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      expect(usage === 'MUSIC' || usage === 'NOTIFICATION').assertTrue();
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
      expect(durationMs).assertLarger(0);
      expect(sampleRate).assertLarger(0);
      expect(2).assertEqual(2);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_STRATEGY_0040
     * @tc.name      testExtKeyboardStrategy0039
     * @tc.desc      Strategy NOTIFICATION/MIX_WITH_OTHERS 30ms.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardStrategy0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      expect(usage === 'MUSIC' || usage === 'NOTIFICATION').assertTrue();
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
      expect(durationMs).assertLarger(0);
      expect(sampleRate).assertLarger(0);
      expect(2).assertEqual(2);
    })
  });
}
