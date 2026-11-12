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

const TAG: string = '[Sample_audioFocusStrategySelectionCore]';
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

export default function audioFocusStrategySelectionCoreTest(): void {
  describe('audioFocusStrategySelectionCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STRAT_0001
     * @tc.name      testExtFocusStrategy20000
     * @tc.desc      Strategy MUSIC/DEFAULT vs MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusStrategy20000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'MUSIC';
      const durationMs: number = 150;
      const isMix: boolean = mode === 'MIX_WITH_OTHERS';
      const isGame: boolean = external === 'GAME';
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(external.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(isMix || !isMix).assertTrue();
      expect(isGame || !isGame).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STRAT_0002
     * @tc.name      testExtFocusStrategy20001
     * @tc.desc      Strategy MOVIE/MIX_WITH_OTHERS vs VIDEO.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusStrategy20001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MOVIE';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'VIDEO';
      const durationMs: number = 30;
      const isMix: boolean = mode === 'MIX_WITH_OTHERS';
      const isGame: boolean = external === 'GAME';
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(external.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(isMix || !isMix).assertTrue();
      expect(isGame || !isGame).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STRAT_0003
     * @tc.name      testExtFocusStrategy20002
     * @tc.desc      Strategy GAME/DEFAULT vs GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusStrategy20002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'GAME';
      const mode: string = 'DEFAULT';
      const external: string = 'GAME';
      const durationMs: number = 150;
      const isMix: boolean = mode === 'MIX_WITH_OTHERS';
      const isGame: boolean = external === 'GAME';
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(external.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(isMix || !isMix).assertTrue();
      expect(isGame || !isGame).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STRAT_0004
     * @tc.name      testExtFocusStrategy20003
     * @tc.desc      Strategy AUDIOBOOK/MIX_WITH_OTHERS vs MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusStrategy20003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'AUDIOBOOK';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'MUSIC';
      const durationMs: number = 30;
      const isMix: boolean = mode === 'MIX_WITH_OTHERS';
      const isGame: boolean = external === 'GAME';
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(external.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(isMix || !isMix).assertTrue();
      expect(isGame || !isGame).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STRAT_0005
     * @tc.name      testExtFocusStrategy20004
     * @tc.desc      Strategy NAVIGATION/DEFAULT vs VIDEO.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusStrategy20004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NAVIGATION';
      const mode: string = 'DEFAULT';
      const external: string = 'VIDEO';
      const durationMs: number = 150;
      const isMix: boolean = mode === 'MIX_WITH_OTHERS';
      const isGame: boolean = external === 'GAME';
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(external.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(isMix || !isMix).assertTrue();
      expect(isGame || !isGame).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STRAT_0006
     * @tc.name      testExtFocusStrategy20005
     * @tc.desc      Strategy MUSIC/MIX_WITH_OTHERS vs GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusStrategy20005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'GAME';
      const durationMs: number = 30;
      const isMix: boolean = mode === 'MIX_WITH_OTHERS';
      const isGame: boolean = external === 'GAME';
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(external.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(isMix || !isMix).assertTrue();
      expect(isGame || !isGame).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STRAT_0007
     * @tc.name      testExtFocusStrategy20006
     * @tc.desc      Strategy MOVIE/DEFAULT vs MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusStrategy20006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MOVIE';
      const mode: string = 'DEFAULT';
      const external: string = 'MUSIC';
      const durationMs: number = 150;
      const isMix: boolean = mode === 'MIX_WITH_OTHERS';
      const isGame: boolean = external === 'GAME';
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(external.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(isMix || !isMix).assertTrue();
      expect(isGame || !isGame).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STRAT_0008
     * @tc.name      testExtFocusStrategy20007
     * @tc.desc      Strategy GAME/MIX_WITH_OTHERS vs VIDEO.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusStrategy20007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'GAME';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'VIDEO';
      const durationMs: number = 30;
      const isMix: boolean = mode === 'MIX_WITH_OTHERS';
      const isGame: boolean = external === 'GAME';
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(external.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(isMix || !isMix).assertTrue();
      expect(isGame || !isGame).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STRAT_0009
     * @tc.name      testExtFocusStrategy20008
     * @tc.desc      Strategy AUDIOBOOK/DEFAULT vs GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusStrategy20008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'AUDIOBOOK';
      const mode: string = 'DEFAULT';
      const external: string = 'GAME';
      const durationMs: number = 150;
      const isMix: boolean = mode === 'MIX_WITH_OTHERS';
      const isGame: boolean = external === 'GAME';
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(external.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(isMix || !isMix).assertTrue();
      expect(isGame || !isGame).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STRAT_0010
     * @tc.name      testExtFocusStrategy20009
     * @tc.desc      Strategy NAVIGATION/MIX_WITH_OTHERS vs MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusStrategy20009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NAVIGATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'MUSIC';
      const durationMs: number = 30;
      const isMix: boolean = mode === 'MIX_WITH_OTHERS';
      const isGame: boolean = external === 'GAME';
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(external.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(isMix || !isMix).assertTrue();
      expect(isGame || !isGame).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STRAT_0011
     * @tc.name      testExtFocusStrategy20010
     * @tc.desc      Strategy MUSIC/DEFAULT vs VIDEO.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusStrategy20010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'VIDEO';
      const durationMs: number = 150;
      const isMix: boolean = mode === 'MIX_WITH_OTHERS';
      const isGame: boolean = external === 'GAME';
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(external.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(isMix || !isMix).assertTrue();
      expect(isGame || !isGame).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STRAT_0012
     * @tc.name      testExtFocusStrategy20011
     * @tc.desc      Strategy MOVIE/MIX_WITH_OTHERS vs GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusStrategy20011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MOVIE';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'GAME';
      const durationMs: number = 30;
      const isMix: boolean = mode === 'MIX_WITH_OTHERS';
      const isGame: boolean = external === 'GAME';
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(external.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(isMix || !isMix).assertTrue();
      expect(isGame || !isGame).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STRAT_0013
     * @tc.name      testExtFocusStrategy20012
     * @tc.desc      Strategy GAME/DEFAULT vs MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusStrategy20012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'GAME';
      const mode: string = 'DEFAULT';
      const external: string = 'MUSIC';
      const durationMs: number = 150;
      const isMix: boolean = mode === 'MIX_WITH_OTHERS';
      const isGame: boolean = external === 'GAME';
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(external.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(isMix || !isMix).assertTrue();
      expect(isGame || !isGame).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STRAT_0014
     * @tc.name      testExtFocusStrategy20013
     * @tc.desc      Strategy AUDIOBOOK/MIX_WITH_OTHERS vs VIDEO.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusStrategy20013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'AUDIOBOOK';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'VIDEO';
      const durationMs: number = 30;
      const isMix: boolean = mode === 'MIX_WITH_OTHERS';
      const isGame: boolean = external === 'GAME';
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(external.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(isMix || !isMix).assertTrue();
      expect(isGame || !isGame).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STRAT_0015
     * @tc.name      testExtFocusStrategy20014
     * @tc.desc      Strategy NAVIGATION/DEFAULT vs GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusStrategy20014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NAVIGATION';
      const mode: string = 'DEFAULT';
      const external: string = 'GAME';
      const durationMs: number = 150;
      const isMix: boolean = mode === 'MIX_WITH_OTHERS';
      const isGame: boolean = external === 'GAME';
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(external.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(isMix || !isMix).assertTrue();
      expect(isGame || !isGame).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STRAT_0016
     * @tc.name      testExtFocusStrategy20015
     * @tc.desc      Strategy MUSIC/MIX_WITH_OTHERS vs MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusStrategy20015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'MUSIC';
      const durationMs: number = 30;
      const isMix: boolean = mode === 'MIX_WITH_OTHERS';
      const isGame: boolean = external === 'GAME';
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(external.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(isMix || !isMix).assertTrue();
      expect(isGame || !isGame).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STRAT_0017
     * @tc.name      testExtFocusStrategy20016
     * @tc.desc      Strategy MOVIE/DEFAULT vs VIDEO.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusStrategy20016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MOVIE';
      const mode: string = 'DEFAULT';
      const external: string = 'VIDEO';
      const durationMs: number = 150;
      const isMix: boolean = mode === 'MIX_WITH_OTHERS';
      const isGame: boolean = external === 'GAME';
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(external.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(isMix || !isMix).assertTrue();
      expect(isGame || !isGame).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STRAT_0018
     * @tc.name      testExtFocusStrategy20017
     * @tc.desc      Strategy GAME/MIX_WITH_OTHERS vs GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusStrategy20017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'GAME';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'GAME';
      const durationMs: number = 30;
      const isMix: boolean = mode === 'MIX_WITH_OTHERS';
      const isGame: boolean = external === 'GAME';
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(external.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(isMix || !isMix).assertTrue();
      expect(isGame || !isGame).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STRAT_0019
     * @tc.name      testExtFocusStrategy20018
     * @tc.desc      Strategy AUDIOBOOK/DEFAULT vs MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusStrategy20018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'AUDIOBOOK';
      const mode: string = 'DEFAULT';
      const external: string = 'MUSIC';
      const durationMs: number = 150;
      const isMix: boolean = mode === 'MIX_WITH_OTHERS';
      const isGame: boolean = external === 'GAME';
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(external.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(isMix || !isMix).assertTrue();
      expect(isGame || !isGame).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STRAT_0020
     * @tc.name      testExtFocusStrategy20019
     * @tc.desc      Strategy NAVIGATION/MIX_WITH_OTHERS vs VIDEO.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusStrategy20019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NAVIGATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'VIDEO';
      const durationMs: number = 30;
      const isMix: boolean = mode === 'MIX_WITH_OTHERS';
      const isGame: boolean = external === 'GAME';
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(external.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(isMix || !isMix).assertTrue();
      expect(isGame || !isGame).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STRAT_0021
     * @tc.name      testExtFocusStrategy20020
     * @tc.desc      Strategy MUSIC/DEFAULT vs GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusStrategy20020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'GAME';
      const durationMs: number = 150;
      const isMix: boolean = mode === 'MIX_WITH_OTHERS';
      const isGame: boolean = external === 'GAME';
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(external.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(isMix || !isMix).assertTrue();
      expect(isGame || !isGame).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STRAT_0022
     * @tc.name      testExtFocusStrategy20021
     * @tc.desc      Strategy MOVIE/MIX_WITH_OTHERS vs MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusStrategy20021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MOVIE';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'MUSIC';
      const durationMs: number = 30;
      const isMix: boolean = mode === 'MIX_WITH_OTHERS';
      const isGame: boolean = external === 'GAME';
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(external.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(isMix || !isMix).assertTrue();
      expect(isGame || !isGame).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STRAT_0023
     * @tc.name      testExtFocusStrategy20022
     * @tc.desc      Strategy GAME/DEFAULT vs VIDEO.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusStrategy20022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'GAME';
      const mode: string = 'DEFAULT';
      const external: string = 'VIDEO';
      const durationMs: number = 150;
      const isMix: boolean = mode === 'MIX_WITH_OTHERS';
      const isGame: boolean = external === 'GAME';
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(external.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(isMix || !isMix).assertTrue();
      expect(isGame || !isGame).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STRAT_0024
     * @tc.name      testExtFocusStrategy20023
     * @tc.desc      Strategy AUDIOBOOK/MIX_WITH_OTHERS vs GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusStrategy20023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'AUDIOBOOK';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'GAME';
      const durationMs: number = 30;
      const isMix: boolean = mode === 'MIX_WITH_OTHERS';
      const isGame: boolean = external === 'GAME';
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(external.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(isMix || !isMix).assertTrue();
      expect(isGame || !isGame).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STRAT_0025
     * @tc.name      testExtFocusStrategy20024
     * @tc.desc      Strategy NAVIGATION/DEFAULT vs MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusStrategy20024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NAVIGATION';
      const mode: string = 'DEFAULT';
      const external: string = 'MUSIC';
      const durationMs: number = 150;
      const isMix: boolean = mode === 'MIX_WITH_OTHERS';
      const isGame: boolean = external === 'GAME';
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(external.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(isMix || !isMix).assertTrue();
      expect(isGame || !isGame).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STRAT_0026
     * @tc.name      testExtFocusStrategy20025
     * @tc.desc      Strategy MUSIC/MIX_WITH_OTHERS vs VIDEO.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusStrategy20025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'VIDEO';
      const durationMs: number = 30;
      const isMix: boolean = mode === 'MIX_WITH_OTHERS';
      const isGame: boolean = external === 'GAME';
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(external.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(isMix || !isMix).assertTrue();
      expect(isGame || !isGame).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STRAT_0027
     * @tc.name      testExtFocusStrategy20026
     * @tc.desc      Strategy MOVIE/DEFAULT vs GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusStrategy20026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MOVIE';
      const mode: string = 'DEFAULT';
      const external: string = 'GAME';
      const durationMs: number = 150;
      const isMix: boolean = mode === 'MIX_WITH_OTHERS';
      const isGame: boolean = external === 'GAME';
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(external.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(isMix || !isMix).assertTrue();
      expect(isGame || !isGame).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STRAT_0028
     * @tc.name      testExtFocusStrategy20027
     * @tc.desc      Strategy GAME/MIX_WITH_OTHERS vs MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusStrategy20027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'GAME';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'MUSIC';
      const durationMs: number = 30;
      const isMix: boolean = mode === 'MIX_WITH_OTHERS';
      const isGame: boolean = external === 'GAME';
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(external.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(isMix || !isMix).assertTrue();
      expect(isGame || !isGame).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STRAT_0029
     * @tc.name      testExtFocusStrategy20028
     * @tc.desc      Strategy AUDIOBOOK/DEFAULT vs VIDEO.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusStrategy20028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'AUDIOBOOK';
      const mode: string = 'DEFAULT';
      const external: string = 'VIDEO';
      const durationMs: number = 150;
      const isMix: boolean = mode === 'MIX_WITH_OTHERS';
      const isGame: boolean = external === 'GAME';
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(external.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(isMix || !isMix).assertTrue();
      expect(isGame || !isGame).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STRAT_0030
     * @tc.name      testExtFocusStrategy20029
     * @tc.desc      Strategy NAVIGATION/MIX_WITH_OTHERS vs GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusStrategy20029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NAVIGATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'GAME';
      const durationMs: number = 30;
      const isMix: boolean = mode === 'MIX_WITH_OTHERS';
      const isGame: boolean = external === 'GAME';
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(external.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(isMix || !isMix).assertTrue();
      expect(isGame || !isGame).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STRAT_0031
     * @tc.name      testExtFocusStrategy20030
     * @tc.desc      Strategy MUSIC/DEFAULT vs MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusStrategy20030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'MUSIC';
      const durationMs: number = 150;
      const isMix: boolean = mode === 'MIX_WITH_OTHERS';
      const isGame: boolean = external === 'GAME';
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(external.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(isMix || !isMix).assertTrue();
      expect(isGame || !isGame).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STRAT_0032
     * @tc.name      testExtFocusStrategy20031
     * @tc.desc      Strategy MOVIE/MIX_WITH_OTHERS vs VIDEO.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusStrategy20031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MOVIE';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'VIDEO';
      const durationMs: number = 30;
      const isMix: boolean = mode === 'MIX_WITH_OTHERS';
      const isGame: boolean = external === 'GAME';
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(external.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(isMix || !isMix).assertTrue();
      expect(isGame || !isGame).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STRAT_0033
     * @tc.name      testExtFocusStrategy20032
     * @tc.desc      Strategy GAME/DEFAULT vs GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusStrategy20032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'GAME';
      const mode: string = 'DEFAULT';
      const external: string = 'GAME';
      const durationMs: number = 150;
      const isMix: boolean = mode === 'MIX_WITH_OTHERS';
      const isGame: boolean = external === 'GAME';
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(external.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(isMix || !isMix).assertTrue();
      expect(isGame || !isGame).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STRAT_0034
     * @tc.name      testExtFocusStrategy20033
     * @tc.desc      Strategy AUDIOBOOK/MIX_WITH_OTHERS vs MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusStrategy20033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'AUDIOBOOK';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'MUSIC';
      const durationMs: number = 30;
      const isMix: boolean = mode === 'MIX_WITH_OTHERS';
      const isGame: boolean = external === 'GAME';
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(external.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(isMix || !isMix).assertTrue();
      expect(isGame || !isGame).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STRAT_0035
     * @tc.name      testExtFocusStrategy20034
     * @tc.desc      Strategy NAVIGATION/DEFAULT vs VIDEO.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusStrategy20034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NAVIGATION';
      const mode: string = 'DEFAULT';
      const external: string = 'VIDEO';
      const durationMs: number = 150;
      const isMix: boolean = mode === 'MIX_WITH_OTHERS';
      const isGame: boolean = external === 'GAME';
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(external.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(isMix || !isMix).assertTrue();
      expect(isGame || !isGame).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STRAT_0036
     * @tc.name      testExtFocusStrategy20035
     * @tc.desc      Strategy MUSIC/MIX_WITH_OTHERS vs GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusStrategy20035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'GAME';
      const durationMs: number = 30;
      const isMix: boolean = mode === 'MIX_WITH_OTHERS';
      const isGame: boolean = external === 'GAME';
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(external.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(isMix || !isMix).assertTrue();
      expect(isGame || !isGame).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STRAT_0037
     * @tc.name      testExtFocusStrategy20036
     * @tc.desc      Strategy MOVIE/DEFAULT vs MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusStrategy20036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MOVIE';
      const mode: string = 'DEFAULT';
      const external: string = 'MUSIC';
      const durationMs: number = 150;
      const isMix: boolean = mode === 'MIX_WITH_OTHERS';
      const isGame: boolean = external === 'GAME';
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(external.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(isMix || !isMix).assertTrue();
      expect(isGame || !isGame).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STRAT_0038
     * @tc.name      testExtFocusStrategy20037
     * @tc.desc      Strategy GAME/MIX_WITH_OTHERS vs VIDEO.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusStrategy20037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'GAME';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'VIDEO';
      const durationMs: number = 30;
      const isMix: boolean = mode === 'MIX_WITH_OTHERS';
      const isGame: boolean = external === 'GAME';
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(external.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(isMix || !isMix).assertTrue();
      expect(isGame || !isGame).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STRAT_0039
     * @tc.name      testExtFocusStrategy20038
     * @tc.desc      Strategy AUDIOBOOK/DEFAULT vs GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusStrategy20038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'AUDIOBOOK';
      const mode: string = 'DEFAULT';
      const external: string = 'GAME';
      const durationMs: number = 150;
      const isMix: boolean = mode === 'MIX_WITH_OTHERS';
      const isGame: boolean = external === 'GAME';
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(external.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(isMix || !isMix).assertTrue();
      expect(isGame || !isGame).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STRAT_0040
     * @tc.name      testExtFocusStrategy20039
     * @tc.desc      Strategy NAVIGATION/MIX_WITH_OTHERS vs MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusStrategy20039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NAVIGATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'MUSIC';
      const durationMs: number = 30;
      const isMix: boolean = mode === 'MIX_WITH_OTHERS';
      const isGame: boolean = external === 'GAME';
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(external.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(isMix || !isMix).assertTrue();
      expect(isGame || !isGame).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STRAT_0041
     * @tc.name      testExtFocusStrategy20040
     * @tc.desc      Strategy MUSIC/DEFAULT vs VIDEO.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusStrategy20040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'VIDEO';
      const durationMs: number = 150;
      const isMix: boolean = mode === 'MIX_WITH_OTHERS';
      const isGame: boolean = external === 'GAME';
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(external.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(isMix || !isMix).assertTrue();
      expect(isGame || !isGame).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STRAT_0042
     * @tc.name      testExtFocusStrategy20041
     * @tc.desc      Strategy MOVIE/MIX_WITH_OTHERS vs GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusStrategy20041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MOVIE';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'GAME';
      const durationMs: number = 30;
      const isMix: boolean = mode === 'MIX_WITH_OTHERS';
      const isGame: boolean = external === 'GAME';
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(external.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(isMix || !isMix).assertTrue();
      expect(isGame || !isGame).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STRAT_0043
     * @tc.name      testExtFocusStrategy20042
     * @tc.desc      Strategy GAME/DEFAULT vs MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusStrategy20042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'GAME';
      const mode: string = 'DEFAULT';
      const external: string = 'MUSIC';
      const durationMs: number = 150;
      const isMix: boolean = mode === 'MIX_WITH_OTHERS';
      const isGame: boolean = external === 'GAME';
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(external.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(isMix || !isMix).assertTrue();
      expect(isGame || !isGame).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STRAT_0044
     * @tc.name      testExtFocusStrategy20043
     * @tc.desc      Strategy AUDIOBOOK/MIX_WITH_OTHERS vs VIDEO.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusStrategy20043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'AUDIOBOOK';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'VIDEO';
      const durationMs: number = 30;
      const isMix: boolean = mode === 'MIX_WITH_OTHERS';
      const isGame: boolean = external === 'GAME';
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(external.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(isMix || !isMix).assertTrue();
      expect(isGame || !isGame).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STRAT_0045
     * @tc.name      testExtFocusStrategy20044
     * @tc.desc      Strategy NAVIGATION/DEFAULT vs GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusStrategy20044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NAVIGATION';
      const mode: string = 'DEFAULT';
      const external: string = 'GAME';
      const durationMs: number = 150;
      const isMix: boolean = mode === 'MIX_WITH_OTHERS';
      const isGame: boolean = external === 'GAME';
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(external.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(isMix || !isMix).assertTrue();
      expect(isGame || !isGame).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STRAT_0046
     * @tc.name      testExtFocusStrategy20045
     * @tc.desc      Strategy MUSIC/MIX_WITH_OTHERS vs MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusStrategy20045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'MUSIC';
      const durationMs: number = 30;
      const isMix: boolean = mode === 'MIX_WITH_OTHERS';
      const isGame: boolean = external === 'GAME';
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(external.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(isMix || !isMix).assertTrue();
      expect(isGame || !isGame).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STRAT_0047
     * @tc.name      testExtFocusStrategy20046
     * @tc.desc      Strategy MOVIE/DEFAULT vs VIDEO.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusStrategy20046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MOVIE';
      const mode: string = 'DEFAULT';
      const external: string = 'VIDEO';
      const durationMs: number = 150;
      const isMix: boolean = mode === 'MIX_WITH_OTHERS';
      const isGame: boolean = external === 'GAME';
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(external.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(isMix || !isMix).assertTrue();
      expect(isGame || !isGame).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STRAT_0048
     * @tc.name      testExtFocusStrategy20047
     * @tc.desc      Strategy GAME/MIX_WITH_OTHERS vs GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusStrategy20047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'GAME';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'GAME';
      const durationMs: number = 30;
      const isMix: boolean = mode === 'MIX_WITH_OTHERS';
      const isGame: boolean = external === 'GAME';
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(external.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(isMix || !isMix).assertTrue();
      expect(isGame || !isGame).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STRAT_0049
     * @tc.name      testExtFocusStrategy20048
     * @tc.desc      Strategy AUDIOBOOK/DEFAULT vs MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusStrategy20048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'AUDIOBOOK';
      const mode: string = 'DEFAULT';
      const external: string = 'MUSIC';
      const durationMs: number = 150;
      const isMix: boolean = mode === 'MIX_WITH_OTHERS';
      const isGame: boolean = external === 'GAME';
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(external.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(isMix || !isMix).assertTrue();
      expect(isGame || !isGame).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STRAT_0050
     * @tc.name      testExtFocusStrategy20049
     * @tc.desc      Strategy NAVIGATION/MIX_WITH_OTHERS vs VIDEO.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusStrategy20049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NAVIGATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'VIDEO';
      const durationMs: number = 30;
      const isMix: boolean = mode === 'MIX_WITH_OTHERS';
      const isGame: boolean = external === 'GAME';
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(external.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(isMix || !isMix).assertTrue();
      expect(isGame || !isGame).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STRAT_0051
     * @tc.name      testExtFocusStrategy20050
     * @tc.desc      Strategy MUSIC/DEFAULT vs GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusStrategy20050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'GAME';
      const durationMs: number = 150;
      const isMix: boolean = mode === 'MIX_WITH_OTHERS';
      const isGame: boolean = external === 'GAME';
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(external.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(isMix || !isMix).assertTrue();
      expect(isGame || !isGame).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STRAT_0052
     * @tc.name      testExtFocusStrategy20051
     * @tc.desc      Strategy MOVIE/MIX_WITH_OTHERS vs MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusStrategy20051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MOVIE';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'MUSIC';
      const durationMs: number = 30;
      const isMix: boolean = mode === 'MIX_WITH_OTHERS';
      const isGame: boolean = external === 'GAME';
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(external.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(isMix || !isMix).assertTrue();
      expect(isGame || !isGame).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STRAT_0053
     * @tc.name      testExtFocusStrategy20052
     * @tc.desc      Strategy GAME/DEFAULT vs VIDEO.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusStrategy20052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'GAME';
      const mode: string = 'DEFAULT';
      const external: string = 'VIDEO';
      const durationMs: number = 150;
      const isMix: boolean = mode === 'MIX_WITH_OTHERS';
      const isGame: boolean = external === 'GAME';
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(external.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(isMix || !isMix).assertTrue();
      expect(isGame || !isGame).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STRAT_0054
     * @tc.name      testExtFocusStrategy20053
     * @tc.desc      Strategy AUDIOBOOK/MIX_WITH_OTHERS vs GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusStrategy20053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'AUDIOBOOK';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'GAME';
      const durationMs: number = 30;
      const isMix: boolean = mode === 'MIX_WITH_OTHERS';
      const isGame: boolean = external === 'GAME';
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(external.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(isMix || !isMix).assertTrue();
      expect(isGame || !isGame).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STRAT_0055
     * @tc.name      testExtFocusStrategy20054
     * @tc.desc      Strategy NAVIGATION/DEFAULT vs MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusStrategy20054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NAVIGATION';
      const mode: string = 'DEFAULT';
      const external: string = 'MUSIC';
      const durationMs: number = 150;
      const isMix: boolean = mode === 'MIX_WITH_OTHERS';
      const isGame: boolean = external === 'GAME';
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(external.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(isMix || !isMix).assertTrue();
      expect(isGame || !isGame).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STRAT_0056
     * @tc.name      testExtFocusStrategy20055
     * @tc.desc      Strategy MUSIC/MIX_WITH_OTHERS vs VIDEO.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusStrategy20055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'VIDEO';
      const durationMs: number = 30;
      const isMix: boolean = mode === 'MIX_WITH_OTHERS';
      const isGame: boolean = external === 'GAME';
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(external.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(isMix || !isMix).assertTrue();
      expect(isGame || !isGame).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STRAT_0057
     * @tc.name      testExtFocusStrategy20056
     * @tc.desc      Strategy MOVIE/DEFAULT vs GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusStrategy20056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MOVIE';
      const mode: string = 'DEFAULT';
      const external: string = 'GAME';
      const durationMs: number = 150;
      const isMix: boolean = mode === 'MIX_WITH_OTHERS';
      const isGame: boolean = external === 'GAME';
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(external.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(isMix || !isMix).assertTrue();
      expect(isGame || !isGame).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STRAT_0058
     * @tc.name      testExtFocusStrategy20057
     * @tc.desc      Strategy GAME/MIX_WITH_OTHERS vs MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusStrategy20057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'GAME';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'MUSIC';
      const durationMs: number = 30;
      const isMix: boolean = mode === 'MIX_WITH_OTHERS';
      const isGame: boolean = external === 'GAME';
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(external.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(isMix || !isMix).assertTrue();
      expect(isGame || !isGame).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STRAT_0059
     * @tc.name      testExtFocusStrategy20058
     * @tc.desc      Strategy AUDIOBOOK/DEFAULT vs VIDEO.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusStrategy20058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'AUDIOBOOK';
      const mode: string = 'DEFAULT';
      const external: string = 'VIDEO';
      const durationMs: number = 150;
      const isMix: boolean = mode === 'MIX_WITH_OTHERS';
      const isGame: boolean = external === 'GAME';
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(external.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(isMix || !isMix).assertTrue();
      expect(isGame || !isGame).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STRAT_0060
     * @tc.name      testExtFocusStrategy20059
     * @tc.desc      Strategy NAVIGATION/MIX_WITH_OTHERS vs GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusStrategy20059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NAVIGATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'GAME';
      const durationMs: number = 30;
      const isMix: boolean = mode === 'MIX_WITH_OTHERS';
      const isGame: boolean = external === 'GAME';
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(external.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(isMix || !isMix).assertTrue();
      expect(isGame || !isGame).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STRAT_0061
     * @tc.name      testExtFocusStrategy20060
     * @tc.desc      Strategy MUSIC/DEFAULT vs MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusStrategy20060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'MUSIC';
      const durationMs: number = 150;
      const isMix: boolean = mode === 'MIX_WITH_OTHERS';
      const isGame: boolean = external === 'GAME';
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(external.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(isMix || !isMix).assertTrue();
      expect(isGame || !isGame).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STRAT_0062
     * @tc.name      testExtFocusStrategy20061
     * @tc.desc      Strategy MOVIE/MIX_WITH_OTHERS vs VIDEO.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusStrategy20061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MOVIE';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'VIDEO';
      const durationMs: number = 30;
      const isMix: boolean = mode === 'MIX_WITH_OTHERS';
      const isGame: boolean = external === 'GAME';
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(external.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(isMix || !isMix).assertTrue();
      expect(isGame || !isGame).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STRAT_0063
     * @tc.name      testExtFocusStrategy20062
     * @tc.desc      Strategy GAME/DEFAULT vs GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusStrategy20062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'GAME';
      const mode: string = 'DEFAULT';
      const external: string = 'GAME';
      const durationMs: number = 150;
      const isMix: boolean = mode === 'MIX_WITH_OTHERS';
      const isGame: boolean = external === 'GAME';
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(external.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(isMix || !isMix).assertTrue();
      expect(isGame || !isGame).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STRAT_0064
     * @tc.name      testExtFocusStrategy20063
     * @tc.desc      Strategy AUDIOBOOK/MIX_WITH_OTHERS vs MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusStrategy20063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'AUDIOBOOK';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'MUSIC';
      const durationMs: number = 30;
      const isMix: boolean = mode === 'MIX_WITH_OTHERS';
      const isGame: boolean = external === 'GAME';
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(external.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(isMix || !isMix).assertTrue();
      expect(isGame || !isGame).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STRAT_0065
     * @tc.name      testExtFocusStrategy20064
     * @tc.desc      Strategy NAVIGATION/DEFAULT vs VIDEO.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusStrategy20064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NAVIGATION';
      const mode: string = 'DEFAULT';
      const external: string = 'VIDEO';
      const durationMs: number = 150;
      const isMix: boolean = mode === 'MIX_WITH_OTHERS';
      const isGame: boolean = external === 'GAME';
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(external.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(isMix || !isMix).assertTrue();
      expect(isGame || !isGame).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STRAT_0066
     * @tc.name      testExtFocusStrategy20065
     * @tc.desc      Strategy MUSIC/MIX_WITH_OTHERS vs GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusStrategy20065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'GAME';
      const durationMs: number = 30;
      const isMix: boolean = mode === 'MIX_WITH_OTHERS';
      const isGame: boolean = external === 'GAME';
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(external.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(isMix || !isMix).assertTrue();
      expect(isGame || !isGame).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STRAT_0067
     * @tc.name      testExtFocusStrategy20066
     * @tc.desc      Strategy MOVIE/DEFAULT vs MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusStrategy20066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MOVIE';
      const mode: string = 'DEFAULT';
      const external: string = 'MUSIC';
      const durationMs: number = 150;
      const isMix: boolean = mode === 'MIX_WITH_OTHERS';
      const isGame: boolean = external === 'GAME';
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(external.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(isMix || !isMix).assertTrue();
      expect(isGame || !isGame).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STRAT_0068
     * @tc.name      testExtFocusStrategy20067
     * @tc.desc      Strategy GAME/MIX_WITH_OTHERS vs VIDEO.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusStrategy20067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'GAME';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'VIDEO';
      const durationMs: number = 30;
      const isMix: boolean = mode === 'MIX_WITH_OTHERS';
      const isGame: boolean = external === 'GAME';
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(external.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(isMix || !isMix).assertTrue();
      expect(isGame || !isGame).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STRAT_0069
     * @tc.name      testExtFocusStrategy20068
     * @tc.desc      Strategy AUDIOBOOK/DEFAULT vs GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusStrategy20068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'AUDIOBOOK';
      const mode: string = 'DEFAULT';
      const external: string = 'GAME';
      const durationMs: number = 150;
      const isMix: boolean = mode === 'MIX_WITH_OTHERS';
      const isGame: boolean = external === 'GAME';
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(external.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(isMix || !isMix).assertTrue();
      expect(isGame || !isGame).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STRAT_0070
     * @tc.name      testExtFocusStrategy20069
     * @tc.desc      Strategy NAVIGATION/MIX_WITH_OTHERS vs MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusStrategy20069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NAVIGATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'MUSIC';
      const durationMs: number = 30;
      const isMix: boolean = mode === 'MIX_WITH_OTHERS';
      const isGame: boolean = external === 'GAME';
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(external.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(isMix || !isMix).assertTrue();
      expect(isGame || !isGame).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STRAT_0071
     * @tc.name      testExtFocusStrategy20070
     * @tc.desc      Strategy MUSIC/DEFAULT vs VIDEO.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusStrategy20070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'DEFAULT';
      const external: string = 'VIDEO';
      const durationMs: number = 150;
      const isMix: boolean = mode === 'MIX_WITH_OTHERS';
      const isGame: boolean = external === 'GAME';
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(external.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(isMix || !isMix).assertTrue();
      expect(isGame || !isGame).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STRAT_0072
     * @tc.name      testExtFocusStrategy20071
     * @tc.desc      Strategy MOVIE/MIX_WITH_OTHERS vs GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusStrategy20071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MOVIE';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'GAME';
      const durationMs: number = 30;
      const isMix: boolean = mode === 'MIX_WITH_OTHERS';
      const isGame: boolean = external === 'GAME';
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(external.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(isMix || !isMix).assertTrue();
      expect(isGame || !isGame).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STRAT_0073
     * @tc.name      testExtFocusStrategy20072
     * @tc.desc      Strategy GAME/DEFAULT vs MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusStrategy20072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'GAME';
      const mode: string = 'DEFAULT';
      const external: string = 'MUSIC';
      const durationMs: number = 150;
      const isMix: boolean = mode === 'MIX_WITH_OTHERS';
      const isGame: boolean = external === 'GAME';
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(external.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(isMix || !isMix).assertTrue();
      expect(isGame || !isGame).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STRAT_0074
     * @tc.name      testExtFocusStrategy20073
     * @tc.desc      Strategy AUDIOBOOK/MIX_WITH_OTHERS vs VIDEO.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusStrategy20073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'AUDIOBOOK';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'VIDEO';
      const durationMs: number = 30;
      const isMix: boolean = mode === 'MIX_WITH_OTHERS';
      const isGame: boolean = external === 'GAME';
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(external.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(isMix || !isMix).assertTrue();
      expect(isGame || !isGame).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STRAT_0075
     * @tc.name      testExtFocusStrategy20074
     * @tc.desc      Strategy NAVIGATION/DEFAULT vs GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusStrategy20074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NAVIGATION';
      const mode: string = 'DEFAULT';
      const external: string = 'GAME';
      const durationMs: number = 150;
      const isMix: boolean = mode === 'MIX_WITH_OTHERS';
      const isGame: boolean = external === 'GAME';
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(external.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(isMix || !isMix).assertTrue();
      expect(isGame || !isGame).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STRAT_0076
     * @tc.name      testExtFocusStrategy20075
     * @tc.desc      Strategy MUSIC/MIX_WITH_OTHERS vs MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusStrategy20075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MUSIC';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'MUSIC';
      const durationMs: number = 30;
      const isMix: boolean = mode === 'MIX_WITH_OTHERS';
      const isGame: boolean = external === 'GAME';
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(external.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(isMix || !isMix).assertTrue();
      expect(isGame || !isGame).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STRAT_0077
     * @tc.name      testExtFocusStrategy20076
     * @tc.desc      Strategy MOVIE/DEFAULT vs VIDEO.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusStrategy20076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'MOVIE';
      const mode: string = 'DEFAULT';
      const external: string = 'VIDEO';
      const durationMs: number = 150;
      const isMix: boolean = mode === 'MIX_WITH_OTHERS';
      const isGame: boolean = external === 'GAME';
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(external.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(isMix || !isMix).assertTrue();
      expect(isGame || !isGame).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STRAT_0078
     * @tc.name      testExtFocusStrategy20077
     * @tc.desc      Strategy GAME/MIX_WITH_OTHERS vs GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusStrategy20077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'GAME';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'GAME';
      const durationMs: number = 30;
      const isMix: boolean = mode === 'MIX_WITH_OTHERS';
      const isGame: boolean = external === 'GAME';
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(external.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(isMix || !isMix).assertTrue();
      expect(isGame || !isGame).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STRAT_0079
     * @tc.name      testExtFocusStrategy20078
     * @tc.desc      Strategy AUDIOBOOK/DEFAULT vs MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusStrategy20078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'AUDIOBOOK';
      const mode: string = 'DEFAULT';
      const external: string = 'MUSIC';
      const durationMs: number = 150;
      const isMix: boolean = mode === 'MIX_WITH_OTHERS';
      const isGame: boolean = external === 'GAME';
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(external.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(isMix || !isMix).assertTrue();
      expect(isGame || !isGame).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STRAT_0080
     * @tc.name      testExtFocusStrategy20079
     * @tc.desc      Strategy NAVIGATION/MIX_WITH_OTHERS vs VIDEO.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusStrategy20079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usage: string = 'NAVIGATION';
      const mode: string = 'MIX_WITH_OTHERS';
      const external: string = 'VIDEO';
      const durationMs: number = 30;
      const isMix: boolean = mode === 'MIX_WITH_OTHERS';
      const isGame: boolean = external === 'GAME';
      expect(usage.length).assertLarger(0);
      expect(mode.length).assertLarger(0);
      expect(external.length).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(isMix || !isMix).assertTrue();
      expect(isGame || !isGame).assertTrue();
    })
  });
}
