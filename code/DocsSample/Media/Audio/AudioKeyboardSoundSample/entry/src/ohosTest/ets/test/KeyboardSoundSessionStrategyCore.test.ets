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

const TAG: string = '[Sample_keyboardSoundSessionStrategyCore]';
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

export default function keyboardSoundSessionStrategyCoreTest(): void {
  describe('keyboardSoundSessionStrategyCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SESSION_0001
     * @tc.name      testExtKeyboardSession0000
     * @tc.desc      Session MUSIC/DEFAULT vs MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSession0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'MUSIC';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(true);
      expect(concurrent).assertEqual(false);
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SESSION_0002
     * @tc.name      testExtKeyboardSession0001
     * @tc.desc      Session NOTIFICATION/MIX_WITH_OTHERS vs VIDEO.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSession0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'VIDEO';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SESSION_0003
     * @tc.name      testExtKeyboardSession0002
     * @tc.desc      Session MUSIC/DEFAULT vs GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSession0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'GAME';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SESSION_0004
     * @tc.name      testExtKeyboardSession0003
     * @tc.desc      Session NOTIFICATION/MIX_WITH_OTHERS vs MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSession0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'MUSIC';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SESSION_0005
     * @tc.name      testExtKeyboardSession0004
     * @tc.desc      Session MUSIC/DEFAULT vs VIDEO.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSession0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'VIDEO';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(true);
      expect(concurrent).assertEqual(false);
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SESSION_0006
     * @tc.name      testExtKeyboardSession0005
     * @tc.desc      Session NOTIFICATION/MIX_WITH_OTHERS vs GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSession0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'GAME';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SESSION_0007
     * @tc.name      testExtKeyboardSession0006
     * @tc.desc      Session MUSIC/DEFAULT vs MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSession0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'MUSIC';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(true);
      expect(concurrent).assertEqual(false);
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SESSION_0008
     * @tc.name      testExtKeyboardSession0007
     * @tc.desc      Session NOTIFICATION/MIX_WITH_OTHERS vs VIDEO.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSession0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'VIDEO';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SESSION_0009
     * @tc.name      testExtKeyboardSession0008
     * @tc.desc      Session MUSIC/DEFAULT vs GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSession0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'GAME';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SESSION_0010
     * @tc.name      testExtKeyboardSession0009
     * @tc.desc      Session NOTIFICATION/MIX_WITH_OTHERS vs MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSession0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'MUSIC';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SESSION_0011
     * @tc.name      testExtKeyboardSession0010
     * @tc.desc      Session MUSIC/DEFAULT vs VIDEO.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSession0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'VIDEO';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(true);
      expect(concurrent).assertEqual(false);
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SESSION_0012
     * @tc.name      testExtKeyboardSession0011
     * @tc.desc      Session NOTIFICATION/MIX_WITH_OTHERS vs GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSession0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'GAME';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SESSION_0013
     * @tc.name      testExtKeyboardSession0012
     * @tc.desc      Session MUSIC/DEFAULT vs MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSession0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'MUSIC';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(true);
      expect(concurrent).assertEqual(false);
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SESSION_0014
     * @tc.name      testExtKeyboardSession0013
     * @tc.desc      Session NOTIFICATION/MIX_WITH_OTHERS vs VIDEO.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSession0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'VIDEO';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SESSION_0015
     * @tc.name      testExtKeyboardSession0014
     * @tc.desc      Session MUSIC/DEFAULT vs GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSession0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'GAME';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SESSION_0016
     * @tc.name      testExtKeyboardSession0015
     * @tc.desc      Session NOTIFICATION/MIX_WITH_OTHERS vs MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSession0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'MUSIC';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SESSION_0017
     * @tc.name      testExtKeyboardSession0016
     * @tc.desc      Session MUSIC/DEFAULT vs VIDEO.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSession0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'VIDEO';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(true);
      expect(concurrent).assertEqual(false);
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SESSION_0018
     * @tc.name      testExtKeyboardSession0017
     * @tc.desc      Session NOTIFICATION/MIX_WITH_OTHERS vs GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSession0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'GAME';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SESSION_0019
     * @tc.name      testExtKeyboardSession0018
     * @tc.desc      Session MUSIC/DEFAULT vs MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSession0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'MUSIC';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(true);
      expect(concurrent).assertEqual(false);
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SESSION_0020
     * @tc.name      testExtKeyboardSession0019
     * @tc.desc      Session NOTIFICATION/MIX_WITH_OTHERS vs VIDEO.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSession0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'VIDEO';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SESSION_0021
     * @tc.name      testExtKeyboardSession0020
     * @tc.desc      Session MUSIC/DEFAULT vs GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSession0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'GAME';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SESSION_0022
     * @tc.name      testExtKeyboardSession0021
     * @tc.desc      Session NOTIFICATION/MIX_WITH_OTHERS vs MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSession0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'MUSIC';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SESSION_0023
     * @tc.name      testExtKeyboardSession0022
     * @tc.desc      Session MUSIC/DEFAULT vs VIDEO.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSession0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'VIDEO';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(true);
      expect(concurrent).assertEqual(false);
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SESSION_0024
     * @tc.name      testExtKeyboardSession0023
     * @tc.desc      Session NOTIFICATION/MIX_WITH_OTHERS vs GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSession0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'GAME';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SESSION_0025
     * @tc.name      testExtKeyboardSession0024
     * @tc.desc      Session MUSIC/DEFAULT vs MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSession0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'MUSIC';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(true);
      expect(concurrent).assertEqual(false);
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SESSION_0026
     * @tc.name      testExtKeyboardSession0025
     * @tc.desc      Session NOTIFICATION/MIX_WITH_OTHERS vs VIDEO.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSession0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'VIDEO';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SESSION_0027
     * @tc.name      testExtKeyboardSession0026
     * @tc.desc      Session MUSIC/DEFAULT vs GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSession0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'GAME';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SESSION_0028
     * @tc.name      testExtKeyboardSession0027
     * @tc.desc      Session NOTIFICATION/MIX_WITH_OTHERS vs MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSession0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'MUSIC';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SESSION_0029
     * @tc.name      testExtKeyboardSession0028
     * @tc.desc      Session MUSIC/DEFAULT vs VIDEO.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSession0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'VIDEO';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(true);
      expect(concurrent).assertEqual(false);
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SESSION_0030
     * @tc.name      testExtKeyboardSession0029
     * @tc.desc      Session NOTIFICATION/MIX_WITH_OTHERS vs GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSession0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'GAME';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SESSION_0031
     * @tc.name      testExtKeyboardSession0030
     * @tc.desc      Session MUSIC/DEFAULT vs MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSession0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'MUSIC';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(true);
      expect(concurrent).assertEqual(false);
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SESSION_0032
     * @tc.name      testExtKeyboardSession0031
     * @tc.desc      Session NOTIFICATION/MIX_WITH_OTHERS vs VIDEO.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSession0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'VIDEO';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SESSION_0033
     * @tc.name      testExtKeyboardSession0032
     * @tc.desc      Session MUSIC/DEFAULT vs GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSession0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'GAME';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SESSION_0034
     * @tc.name      testExtKeyboardSession0033
     * @tc.desc      Session NOTIFICATION/MIX_WITH_OTHERS vs MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSession0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'MUSIC';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SESSION_0035
     * @tc.name      testExtKeyboardSession0034
     * @tc.desc      Session MUSIC/DEFAULT vs VIDEO.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSession0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'VIDEO';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(true);
      expect(concurrent).assertEqual(false);
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SESSION_0036
     * @tc.name      testExtKeyboardSession0035
     * @tc.desc      Session NOTIFICATION/MIX_WITH_OTHERS vs GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSession0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'GAME';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SESSION_0037
     * @tc.name      testExtKeyboardSession0036
     * @tc.desc      Session MUSIC/DEFAULT vs MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSession0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'MUSIC';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(true);
      expect(concurrent).assertEqual(false);
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SESSION_0038
     * @tc.name      testExtKeyboardSession0037
     * @tc.desc      Session NOTIFICATION/MIX_WITH_OTHERS vs VIDEO.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSession0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'VIDEO';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SESSION_0039
     * @tc.name      testExtKeyboardSession0038
     * @tc.desc      Session MUSIC/DEFAULT vs GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSession0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'GAME';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SESSION_0040
     * @tc.name      testExtKeyboardSession0039
     * @tc.desc      Session NOTIFICATION/MIX_WITH_OTHERS vs MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSession0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'MUSIC';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SESSION_0041
     * @tc.name      testExtKeyboardSession0040
     * @tc.desc      Session MUSIC/DEFAULT vs VIDEO.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSession0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'VIDEO';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(true);
      expect(concurrent).assertEqual(false);
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SESSION_0042
     * @tc.name      testExtKeyboardSession0041
     * @tc.desc      Session NOTIFICATION/MIX_WITH_OTHERS vs GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSession0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'GAME';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SESSION_0043
     * @tc.name      testExtKeyboardSession0042
     * @tc.desc      Session MUSIC/DEFAULT vs MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSession0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'MUSIC';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(true);
      expect(concurrent).assertEqual(false);
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SESSION_0044
     * @tc.name      testExtKeyboardSession0043
     * @tc.desc      Session NOTIFICATION/MIX_WITH_OTHERS vs VIDEO.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSession0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'VIDEO';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SESSION_0045
     * @tc.name      testExtKeyboardSession0044
     * @tc.desc      Session MUSIC/DEFAULT vs GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSession0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'GAME';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SESSION_0046
     * @tc.name      testExtKeyboardSession0045
     * @tc.desc      Session NOTIFICATION/MIX_WITH_OTHERS vs MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSession0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'MUSIC';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SESSION_0047
     * @tc.name      testExtKeyboardSession0046
     * @tc.desc      Session MUSIC/DEFAULT vs VIDEO.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSession0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'VIDEO';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(true);
      expect(concurrent).assertEqual(false);
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SESSION_0048
     * @tc.name      testExtKeyboardSession0047
     * @tc.desc      Session NOTIFICATION/MIX_WITH_OTHERS vs GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSession0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'GAME';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SESSION_0049
     * @tc.name      testExtKeyboardSession0048
     * @tc.desc      Session MUSIC/DEFAULT vs MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSession0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'MUSIC';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(true);
      expect(concurrent).assertEqual(false);
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SESSION_0050
     * @tc.name      testExtKeyboardSession0049
     * @tc.desc      Session NOTIFICATION/MIX_WITH_OTHERS vs VIDEO.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSession0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'VIDEO';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SESSION_0051
     * @tc.name      testExtKeyboardSession0050
     * @tc.desc      Session MUSIC/DEFAULT vs GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSession0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'GAME';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SESSION_0052
     * @tc.name      testExtKeyboardSession0051
     * @tc.desc      Session NOTIFICATION/MIX_WITH_OTHERS vs MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSession0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'MUSIC';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SESSION_0053
     * @tc.name      testExtKeyboardSession0052
     * @tc.desc      Session MUSIC/DEFAULT vs VIDEO.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSession0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'VIDEO';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(true);
      expect(concurrent).assertEqual(false);
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SESSION_0054
     * @tc.name      testExtKeyboardSession0053
     * @tc.desc      Session NOTIFICATION/MIX_WITH_OTHERS vs GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSession0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'GAME';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SESSION_0055
     * @tc.name      testExtKeyboardSession0054
     * @tc.desc      Session MUSIC/DEFAULT vs MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSession0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'MUSIC';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(true);
      expect(concurrent).assertEqual(false);
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SESSION_0056
     * @tc.name      testExtKeyboardSession0055
     * @tc.desc      Session NOTIFICATION/MIX_WITH_OTHERS vs VIDEO.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSession0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'VIDEO';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SESSION_0057
     * @tc.name      testExtKeyboardSession0056
     * @tc.desc      Session MUSIC/DEFAULT vs GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSession0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'GAME';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SESSION_0058
     * @tc.name      testExtKeyboardSession0057
     * @tc.desc      Session NOTIFICATION/MIX_WITH_OTHERS vs MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSession0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'MUSIC';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SESSION_0059
     * @tc.name      testExtKeyboardSession0058
     * @tc.desc      Session MUSIC/DEFAULT vs VIDEO.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSession0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'VIDEO';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(true);
      expect(concurrent).assertEqual(false);
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SESSION_0060
     * @tc.name      testExtKeyboardSession0059
     * @tc.desc      Session NOTIFICATION/MIX_WITH_OTHERS vs GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSession0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'GAME';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SESSION_0061
     * @tc.name      testExtKeyboardSession0060
     * @tc.desc      Session MUSIC/DEFAULT vs MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSession0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'MUSIC';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(true);
      expect(concurrent).assertEqual(false);
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SESSION_0062
     * @tc.name      testExtKeyboardSession0061
     * @tc.desc      Session NOTIFICATION/MIX_WITH_OTHERS vs VIDEO.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSession0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'VIDEO';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SESSION_0063
     * @tc.name      testExtKeyboardSession0062
     * @tc.desc      Session MUSIC/DEFAULT vs GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSession0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'GAME';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SESSION_0064
     * @tc.name      testExtKeyboardSession0063
     * @tc.desc      Session NOTIFICATION/MIX_WITH_OTHERS vs MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSession0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'MUSIC';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SESSION_0065
     * @tc.name      testExtKeyboardSession0064
     * @tc.desc      Session MUSIC/DEFAULT vs VIDEO.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSession0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'VIDEO';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(true);
      expect(concurrent).assertEqual(false);
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SESSION_0066
     * @tc.name      testExtKeyboardSession0065
     * @tc.desc      Session NOTIFICATION/MIX_WITH_OTHERS vs GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSession0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'GAME';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SESSION_0067
     * @tc.name      testExtKeyboardSession0066
     * @tc.desc      Session MUSIC/DEFAULT vs MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSession0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'MUSIC';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(true);
      expect(concurrent).assertEqual(false);
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SESSION_0068
     * @tc.name      testExtKeyboardSession0067
     * @tc.desc      Session NOTIFICATION/MIX_WITH_OTHERS vs VIDEO.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSession0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'VIDEO';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SESSION_0069
     * @tc.name      testExtKeyboardSession0068
     * @tc.desc      Session MUSIC/DEFAULT vs GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSession0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'GAME';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SESSION_0070
     * @tc.name      testExtKeyboardSession0069
     * @tc.desc      Session NOTIFICATION/MIX_WITH_OTHERS vs MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSession0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'MUSIC';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SESSION_0071
     * @tc.name      testExtKeyboardSession0070
     * @tc.desc      Session MUSIC/DEFAULT vs VIDEO.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSession0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'VIDEO';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(true);
      expect(concurrent).assertEqual(false);
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SESSION_0072
     * @tc.name      testExtKeyboardSession0071
     * @tc.desc      Session NOTIFICATION/MIX_WITH_OTHERS vs GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSession0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'GAME';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SESSION_0073
     * @tc.name      testExtKeyboardSession0072
     * @tc.desc      Session MUSIC/DEFAULT vs MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSession0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'MUSIC';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(true);
      expect(concurrent).assertEqual(false);
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SESSION_0074
     * @tc.name      testExtKeyboardSession0073
     * @tc.desc      Session NOTIFICATION/MIX_WITH_OTHERS vs VIDEO.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSession0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'VIDEO';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SESSION_0075
     * @tc.name      testExtKeyboardSession0074
     * @tc.desc      Session MUSIC/DEFAULT vs GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSession0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'GAME';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SESSION_0076
     * @tc.name      testExtKeyboardSession0075
     * @tc.desc      Session NOTIFICATION/MIX_WITH_OTHERS vs MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSession0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'MUSIC';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SESSION_0077
     * @tc.name      testExtKeyboardSession0076
     * @tc.desc      Session MUSIC/DEFAULT vs VIDEO.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSession0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'VIDEO';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(true);
      expect(concurrent).assertEqual(false);
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SESSION_0078
     * @tc.name      testExtKeyboardSession0077
     * @tc.desc      Session NOTIFICATION/MIX_WITH_OTHERS vs GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSession0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'GAME';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SESSION_0079
     * @tc.name      testExtKeyboardSession0078
     * @tc.desc      Session MUSIC/DEFAULT vs MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSession0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'MUSIC';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(true);
      expect(concurrent).assertEqual(false);
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SESSION_0080
     * @tc.name      testExtKeyboardSession0079
     * @tc.desc      Session NOTIFICATION/MIX_WITH_OTHERS vs VIDEO.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSession0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'VIDEO';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
    })
  });
}
