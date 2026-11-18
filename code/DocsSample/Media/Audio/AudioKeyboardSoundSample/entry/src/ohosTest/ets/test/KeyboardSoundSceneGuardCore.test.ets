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

const TAG: string = '[Sample_keyboardSoundSceneGuardCore]';
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

export default function keyboardSoundSceneGuardCoreTest(): void {
  describe('keyboardSoundSceneGuardCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SCENEGUARD_0001
     * @tc.name      testExtKeyboardSceneGuard0000
     * @tc.desc      Scene MUSIC/DEFAULT vs MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSceneGuard0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'MUSIC';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(true);
      expect(concurrent).assertEqual(false);
      expect(usage.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SCENEGUARD_0002
     * @tc.name      testExtKeyboardSceneGuard0001
     * @tc.desc      Scene NOTIFICATION/MIX_WITH_OTHERS vs VIDEO.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSceneGuard0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'VIDEO';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SCENEGUARD_0003
     * @tc.name      testExtKeyboardSceneGuard0002
     * @tc.desc      Scene MUSIC/DEFAULT vs GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSceneGuard0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'GAME';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SCENEGUARD_0004
     * @tc.name      testExtKeyboardSceneGuard0003
     * @tc.desc      Scene NOTIFICATION/MIX_WITH_OTHERS vs MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSceneGuard0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'MUSIC';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SCENEGUARD_0005
     * @tc.name      testExtKeyboardSceneGuard0004
     * @tc.desc      Scene MUSIC/DEFAULT vs VIDEO.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSceneGuard0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'VIDEO';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(true);
      expect(concurrent).assertEqual(false);
      expect(usage.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SCENEGUARD_0006
     * @tc.name      testExtKeyboardSceneGuard0005
     * @tc.desc      Scene NOTIFICATION/MIX_WITH_OTHERS vs GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSceneGuard0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'GAME';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SCENEGUARD_0007
     * @tc.name      testExtKeyboardSceneGuard0006
     * @tc.desc      Scene MUSIC/DEFAULT vs MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSceneGuard0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'MUSIC';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(true);
      expect(concurrent).assertEqual(false);
      expect(usage.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SCENEGUARD_0008
     * @tc.name      testExtKeyboardSceneGuard0007
     * @tc.desc      Scene NOTIFICATION/MIX_WITH_OTHERS vs VIDEO.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSceneGuard0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'VIDEO';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SCENEGUARD_0009
     * @tc.name      testExtKeyboardSceneGuard0008
     * @tc.desc      Scene MUSIC/DEFAULT vs GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSceneGuard0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'GAME';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SCENEGUARD_0010
     * @tc.name      testExtKeyboardSceneGuard0009
     * @tc.desc      Scene NOTIFICATION/MIX_WITH_OTHERS vs MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSceneGuard0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'MUSIC';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SCENEGUARD_0011
     * @tc.name      testExtKeyboardSceneGuard0010
     * @tc.desc      Scene MUSIC/DEFAULT vs VIDEO.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSceneGuard0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'VIDEO';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(true);
      expect(concurrent).assertEqual(false);
      expect(usage.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SCENEGUARD_0012
     * @tc.name      testExtKeyboardSceneGuard0011
     * @tc.desc      Scene NOTIFICATION/MIX_WITH_OTHERS vs GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSceneGuard0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'GAME';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SCENEGUARD_0013
     * @tc.name      testExtKeyboardSceneGuard0012
     * @tc.desc      Scene MUSIC/DEFAULT vs MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSceneGuard0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'MUSIC';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(true);
      expect(concurrent).assertEqual(false);
      expect(usage.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SCENEGUARD_0014
     * @tc.name      testExtKeyboardSceneGuard0013
     * @tc.desc      Scene NOTIFICATION/MIX_WITH_OTHERS vs VIDEO.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSceneGuard0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'VIDEO';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SCENEGUARD_0015
     * @tc.name      testExtKeyboardSceneGuard0014
     * @tc.desc      Scene MUSIC/DEFAULT vs GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSceneGuard0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'GAME';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SCENEGUARD_0016
     * @tc.name      testExtKeyboardSceneGuard0015
     * @tc.desc      Scene NOTIFICATION/MIX_WITH_OTHERS vs MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSceneGuard0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'MUSIC';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SCENEGUARD_0017
     * @tc.name      testExtKeyboardSceneGuard0016
     * @tc.desc      Scene MUSIC/DEFAULT vs VIDEO.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSceneGuard0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'VIDEO';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(true);
      expect(concurrent).assertEqual(false);
      expect(usage.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SCENEGUARD_0018
     * @tc.name      testExtKeyboardSceneGuard0017
     * @tc.desc      Scene NOTIFICATION/MIX_WITH_OTHERS vs GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSceneGuard0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'GAME';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SCENEGUARD_0019
     * @tc.name      testExtKeyboardSceneGuard0018
     * @tc.desc      Scene MUSIC/DEFAULT vs MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSceneGuard0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'MUSIC';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(true);
      expect(concurrent).assertEqual(false);
      expect(usage.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SCENEGUARD_0020
     * @tc.name      testExtKeyboardSceneGuard0019
     * @tc.desc      Scene NOTIFICATION/MIX_WITH_OTHERS vs VIDEO.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSceneGuard0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'VIDEO';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SCENEGUARD_0021
     * @tc.name      testExtKeyboardSceneGuard0020
     * @tc.desc      Scene MUSIC/DEFAULT vs GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSceneGuard0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'GAME';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SCENEGUARD_0022
     * @tc.name      testExtKeyboardSceneGuard0021
     * @tc.desc      Scene NOTIFICATION/MIX_WITH_OTHERS vs MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSceneGuard0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'MUSIC';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SCENEGUARD_0023
     * @tc.name      testExtKeyboardSceneGuard0022
     * @tc.desc      Scene MUSIC/DEFAULT vs VIDEO.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSceneGuard0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'VIDEO';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(true);
      expect(concurrent).assertEqual(false);
      expect(usage.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SCENEGUARD_0024
     * @tc.name      testExtKeyboardSceneGuard0023
     * @tc.desc      Scene NOTIFICATION/MIX_WITH_OTHERS vs GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSceneGuard0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'GAME';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SCENEGUARD_0025
     * @tc.name      testExtKeyboardSceneGuard0024
     * @tc.desc      Scene MUSIC/DEFAULT vs MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSceneGuard0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'MUSIC';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(true);
      expect(concurrent).assertEqual(false);
      expect(usage.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SCENEGUARD_0026
     * @tc.name      testExtKeyboardSceneGuard0025
     * @tc.desc      Scene NOTIFICATION/MIX_WITH_OTHERS vs VIDEO.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSceneGuard0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'VIDEO';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SCENEGUARD_0027
     * @tc.name      testExtKeyboardSceneGuard0026
     * @tc.desc      Scene MUSIC/DEFAULT vs GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSceneGuard0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'GAME';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SCENEGUARD_0028
     * @tc.name      testExtKeyboardSceneGuard0027
     * @tc.desc      Scene NOTIFICATION/MIX_WITH_OTHERS vs MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSceneGuard0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'MUSIC';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SCENEGUARD_0029
     * @tc.name      testExtKeyboardSceneGuard0028
     * @tc.desc      Scene MUSIC/DEFAULT vs VIDEO.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSceneGuard0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'VIDEO';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(true);
      expect(concurrent).assertEqual(false);
      expect(usage.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SCENEGUARD_0030
     * @tc.name      testExtKeyboardSceneGuard0029
     * @tc.desc      Scene NOTIFICATION/MIX_WITH_OTHERS vs GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSceneGuard0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'GAME';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SCENEGUARD_0031
     * @tc.name      testExtKeyboardSceneGuard0030
     * @tc.desc      Scene MUSIC/DEFAULT vs MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSceneGuard0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'MUSIC';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(true);
      expect(concurrent).assertEqual(false);
      expect(usage.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SCENEGUARD_0032
     * @tc.name      testExtKeyboardSceneGuard0031
     * @tc.desc      Scene NOTIFICATION/MIX_WITH_OTHERS vs VIDEO.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSceneGuard0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'VIDEO';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SCENEGUARD_0033
     * @tc.name      testExtKeyboardSceneGuard0032
     * @tc.desc      Scene MUSIC/DEFAULT vs GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSceneGuard0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'GAME';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SCENEGUARD_0034
     * @tc.name      testExtKeyboardSceneGuard0033
     * @tc.desc      Scene NOTIFICATION/MIX_WITH_OTHERS vs MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSceneGuard0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'MUSIC';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SCENEGUARD_0035
     * @tc.name      testExtKeyboardSceneGuard0034
     * @tc.desc      Scene MUSIC/DEFAULT vs VIDEO.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSceneGuard0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'VIDEO';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(true);
      expect(concurrent).assertEqual(false);
      expect(usage.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SCENEGUARD_0036
     * @tc.name      testExtKeyboardSceneGuard0035
     * @tc.desc      Scene NOTIFICATION/MIX_WITH_OTHERS vs GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSceneGuard0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'GAME';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SCENEGUARD_0037
     * @tc.name      testExtKeyboardSceneGuard0036
     * @tc.desc      Scene MUSIC/DEFAULT vs MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSceneGuard0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'MUSIC';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(true);
      expect(concurrent).assertEqual(false);
      expect(usage.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SCENEGUARD_0038
     * @tc.name      testExtKeyboardSceneGuard0037
     * @tc.desc      Scene NOTIFICATION/MIX_WITH_OTHERS vs VIDEO.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSceneGuard0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'VIDEO';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SCENEGUARD_0039
     * @tc.name      testExtKeyboardSceneGuard0038
     * @tc.desc      Scene MUSIC/DEFAULT vs GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSceneGuard0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'GAME';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SCENEGUARD_0040
     * @tc.name      testExtKeyboardSceneGuard0039
     * @tc.desc      Scene NOTIFICATION/MIX_WITH_OTHERS vs MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSceneGuard0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'MUSIC';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SCENEGUARD_0041
     * @tc.name      testExtKeyboardSceneGuard0040
     * @tc.desc      Scene MUSIC/DEFAULT vs VIDEO.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSceneGuard0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'VIDEO';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(true);
      expect(concurrent).assertEqual(false);
      expect(usage.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SCENEGUARD_0042
     * @tc.name      testExtKeyboardSceneGuard0041
     * @tc.desc      Scene NOTIFICATION/MIX_WITH_OTHERS vs GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSceneGuard0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'GAME';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SCENEGUARD_0043
     * @tc.name      testExtKeyboardSceneGuard0042
     * @tc.desc      Scene MUSIC/DEFAULT vs MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSceneGuard0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'MUSIC';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(true);
      expect(concurrent).assertEqual(false);
      expect(usage.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SCENEGUARD_0044
     * @tc.name      testExtKeyboardSceneGuard0043
     * @tc.desc      Scene NOTIFICATION/MIX_WITH_OTHERS vs VIDEO.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSceneGuard0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'VIDEO';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SCENEGUARD_0045
     * @tc.name      testExtKeyboardSceneGuard0044
     * @tc.desc      Scene MUSIC/DEFAULT vs GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSceneGuard0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'GAME';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SCENEGUARD_0046
     * @tc.name      testExtKeyboardSceneGuard0045
     * @tc.desc      Scene NOTIFICATION/MIX_WITH_OTHERS vs MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSceneGuard0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'MUSIC';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SCENEGUARD_0047
     * @tc.name      testExtKeyboardSceneGuard0046
     * @tc.desc      Scene MUSIC/DEFAULT vs VIDEO.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSceneGuard0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'VIDEO';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(true);
      expect(concurrent).assertEqual(false);
      expect(usage.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SCENEGUARD_0048
     * @tc.name      testExtKeyboardSceneGuard0047
     * @tc.desc      Scene NOTIFICATION/MIX_WITH_OTHERS vs GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSceneGuard0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'GAME';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SCENEGUARD_0049
     * @tc.name      testExtKeyboardSceneGuard0048
     * @tc.desc      Scene MUSIC/DEFAULT vs MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSceneGuard0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'MUSIC';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(true);
      expect(concurrent).assertEqual(false);
      expect(usage.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SCENEGUARD_0050
     * @tc.name      testExtKeyboardSceneGuard0049
     * @tc.desc      Scene NOTIFICATION/MIX_WITH_OTHERS vs VIDEO.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSceneGuard0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'VIDEO';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SCENEGUARD_0051
     * @tc.name      testExtKeyboardSceneGuard0050
     * @tc.desc      Scene MUSIC/DEFAULT vs GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSceneGuard0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'GAME';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SCENEGUARD_0052
     * @tc.name      testExtKeyboardSceneGuard0051
     * @tc.desc      Scene NOTIFICATION/MIX_WITH_OTHERS vs MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSceneGuard0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'MUSIC';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SCENEGUARD_0053
     * @tc.name      testExtKeyboardSceneGuard0052
     * @tc.desc      Scene MUSIC/DEFAULT vs VIDEO.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSceneGuard0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'VIDEO';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(true);
      expect(concurrent).assertEqual(false);
      expect(usage.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SCENEGUARD_0054
     * @tc.name      testExtKeyboardSceneGuard0053
     * @tc.desc      Scene NOTIFICATION/MIX_WITH_OTHERS vs GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSceneGuard0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'GAME';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SCENEGUARD_0055
     * @tc.name      testExtKeyboardSceneGuard0054
     * @tc.desc      Scene MUSIC/DEFAULT vs MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSceneGuard0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'MUSIC';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(true);
      expect(concurrent).assertEqual(false);
      expect(usage.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SCENEGUARD_0056
     * @tc.name      testExtKeyboardSceneGuard0055
     * @tc.desc      Scene NOTIFICATION/MIX_WITH_OTHERS vs VIDEO.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSceneGuard0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'VIDEO';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SCENEGUARD_0057
     * @tc.name      testExtKeyboardSceneGuard0056
     * @tc.desc      Scene MUSIC/DEFAULT vs GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSceneGuard0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'GAME';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SCENEGUARD_0058
     * @tc.name      testExtKeyboardSceneGuard0057
     * @tc.desc      Scene NOTIFICATION/MIX_WITH_OTHERS vs MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSceneGuard0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'MUSIC';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SCENEGUARD_0059
     * @tc.name      testExtKeyboardSceneGuard0058
     * @tc.desc      Scene MUSIC/DEFAULT vs VIDEO.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSceneGuard0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'VIDEO';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(true);
      expect(concurrent).assertEqual(false);
      expect(usage.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SCENEGUARD_0060
     * @tc.name      testExtKeyboardSceneGuard0059
     * @tc.desc      Scene NOTIFICATION/MIX_WITH_OTHERS vs GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSceneGuard0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'GAME';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SCENEGUARD_0061
     * @tc.name      testExtKeyboardSceneGuard0060
     * @tc.desc      Scene MUSIC/DEFAULT vs MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSceneGuard0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'MUSIC';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(true);
      expect(concurrent).assertEqual(false);
      expect(usage.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SCENEGUARD_0062
     * @tc.name      testExtKeyboardSceneGuard0061
     * @tc.desc      Scene NOTIFICATION/MIX_WITH_OTHERS vs VIDEO.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSceneGuard0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'VIDEO';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SCENEGUARD_0063
     * @tc.name      testExtKeyboardSceneGuard0062
     * @tc.desc      Scene MUSIC/DEFAULT vs GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSceneGuard0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'GAME';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SCENEGUARD_0064
     * @tc.name      testExtKeyboardSceneGuard0063
     * @tc.desc      Scene NOTIFICATION/MIX_WITH_OTHERS vs MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSceneGuard0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'MUSIC';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SCENEGUARD_0065
     * @tc.name      testExtKeyboardSceneGuard0064
     * @tc.desc      Scene MUSIC/DEFAULT vs VIDEO.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSceneGuard0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'VIDEO';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(true);
      expect(concurrent).assertEqual(false);
      expect(usage.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SCENEGUARD_0066
     * @tc.name      testExtKeyboardSceneGuard0065
     * @tc.desc      Scene NOTIFICATION/MIX_WITH_OTHERS vs GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSceneGuard0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'GAME';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SCENEGUARD_0067
     * @tc.name      testExtKeyboardSceneGuard0066
     * @tc.desc      Scene MUSIC/DEFAULT vs MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSceneGuard0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'MUSIC';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(true);
      expect(concurrent).assertEqual(false);
      expect(usage.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SCENEGUARD_0068
     * @tc.name      testExtKeyboardSceneGuard0067
     * @tc.desc      Scene NOTIFICATION/MIX_WITH_OTHERS vs VIDEO.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSceneGuard0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'VIDEO';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SCENEGUARD_0069
     * @tc.name      testExtKeyboardSceneGuard0068
     * @tc.desc      Scene MUSIC/DEFAULT vs GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSceneGuard0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'GAME';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SCENEGUARD_0070
     * @tc.name      testExtKeyboardSceneGuard0069
     * @tc.desc      Scene NOTIFICATION/MIX_WITH_OTHERS vs MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSceneGuard0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'MUSIC';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SCENEGUARD_0071
     * @tc.name      testExtKeyboardSceneGuard0070
     * @tc.desc      Scene MUSIC/DEFAULT vs VIDEO.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSceneGuard0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'VIDEO';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(true);
      expect(concurrent).assertEqual(false);
      expect(usage.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SCENEGUARD_0072
     * @tc.name      testExtKeyboardSceneGuard0071
     * @tc.desc      Scene NOTIFICATION/MIX_WITH_OTHERS vs GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSceneGuard0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'GAME';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SCENEGUARD_0073
     * @tc.name      testExtKeyboardSceneGuard0072
     * @tc.desc      Scene MUSIC/DEFAULT vs MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSceneGuard0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'MUSIC';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(true);
      expect(concurrent).assertEqual(false);
      expect(usage.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SCENEGUARD_0074
     * @tc.name      testExtKeyboardSceneGuard0073
     * @tc.desc      Scene NOTIFICATION/MIX_WITH_OTHERS vs VIDEO.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSceneGuard0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'VIDEO';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SCENEGUARD_0075
     * @tc.name      testExtKeyboardSceneGuard0074
     * @tc.desc      Scene MUSIC/DEFAULT vs GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSceneGuard0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'GAME';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SCENEGUARD_0076
     * @tc.name      testExtKeyboardSceneGuard0075
     * @tc.desc      Scene NOTIFICATION/MIX_WITH_OTHERS vs MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSceneGuard0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'MUSIC';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SCENEGUARD_0077
     * @tc.name      testExtKeyboardSceneGuard0076
     * @tc.desc      Scene MUSIC/DEFAULT vs VIDEO.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSceneGuard0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'VIDEO';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(true);
      expect(concurrent).assertEqual(false);
      expect(usage.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SCENEGUARD_0078
     * @tc.name      testExtKeyboardSceneGuard0077
     * @tc.desc      Scene NOTIFICATION/MIX_WITH_OTHERS vs GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSceneGuard0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'GAME';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SCENEGUARD_0079
     * @tc.name      testExtKeyboardSceneGuard0078
     * @tc.desc      Scene MUSIC/DEFAULT vs MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSceneGuard0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'MUSIC';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(true);
      expect(concurrent).assertEqual(false);
      expect(usage.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_SCENEGUARD_0080
     * @tc.name      testExtKeyboardSceneGuard0079
     * @tc.desc      Scene NOTIFICATION/MIX_WITH_OTHERS vs VIDEO.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardSceneGuard0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NOTIFICATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'VIDEO';
      const stopped: boolean = usage === 'MUSIC' && mode === 'DEFAULT' && external !== 'GAME';
      const concurrent: boolean = (usage === 'NOTIFICATION' && mode === 'MIX_WITH_OTHERS') || external === 'GAME';
      expect(stopped).assertEqual(false);
      expect(concurrent).assertEqual(true);
      expect(usage.length).assertLarger(0);
    })
  });
}
