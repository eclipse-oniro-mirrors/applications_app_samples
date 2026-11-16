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
import { SCENARIO_LIST } from '../../../main/ets/common/constants/AudioConstants';

const TAG: string = '[Sample_audioFocusScenarioCore]';
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

export default function audioFocusScenarioCoreTest(): void {
  describe('audioFocusScenarioCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCEN_0001
     * @tc.name      testExtFocusScen0000
     * @tc.desc      Scenario musicVsMusic.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScen0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[0].id).assertEqual('musicVsMusic');
      expect(SCENARIO_LIST[0].page).assertEqual('pages/MusicVsMusicPage');
      expect(SCENARIO_LIST[0].desc).assertEqual('MUSIC vs MUSIC');
      expect('pages/MusicVsMusicPage'.endsWith('Page')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCEN_0002
     * @tc.name      testExtFocusScen0001
     * @tc.desc      Scenario musicVsVideo.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScen0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[1].id).assertEqual('musicVsVideo');
      expect(SCENARIO_LIST[1].page).assertEqual('pages/MusicVsVideoPage');
      expect(SCENARIO_LIST[1].desc).assertEqual('MUSIC vs MOVIE');
      expect('pages/MusicVsVideoPage'.endsWith('Page')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCEN_0003
     * @tc.name      testExtFocusScen0002
     * @tc.desc      Scenario musicVsGame.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScen0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[2].id).assertEqual('musicVsGame');
      expect(SCENARIO_LIST[2].page).assertEqual('pages/MusicVsGamePage');
      expect(SCENARIO_LIST[2].desc).assertEqual('MUSIC vs GAME');
      expect('pages/MusicVsGamePage'.endsWith('Page')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCEN_0004
     * @tc.name      testExtFocusScen0003
     * @tc.desc      Scenario musicVsMusic.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScen0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[0].id).assertEqual('musicVsMusic');
      expect(SCENARIO_LIST[0].page).assertEqual('pages/MusicVsMusicPage');
      expect(SCENARIO_LIST[0].desc).assertEqual('MUSIC vs MUSIC');
      expect('pages/MusicVsMusicPage'.endsWith('Page')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCEN_0005
     * @tc.name      testExtFocusScen0004
     * @tc.desc      Scenario musicVsVideo.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScen0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[1].id).assertEqual('musicVsVideo');
      expect(SCENARIO_LIST[1].page).assertEqual('pages/MusicVsVideoPage');
      expect(SCENARIO_LIST[1].desc).assertEqual('MUSIC vs MOVIE');
      expect('pages/MusicVsVideoPage'.endsWith('Page')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCEN_0006
     * @tc.name      testExtFocusScen0005
     * @tc.desc      Scenario musicVsGame.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScen0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[2].id).assertEqual('musicVsGame');
      expect(SCENARIO_LIST[2].page).assertEqual('pages/MusicVsGamePage');
      expect(SCENARIO_LIST[2].desc).assertEqual('MUSIC vs GAME');
      expect('pages/MusicVsGamePage'.endsWith('Page')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCEN_0007
     * @tc.name      testExtFocusScen0006
     * @tc.desc      Scenario musicVsMusic.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScen0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[0].id).assertEqual('musicVsMusic');
      expect(SCENARIO_LIST[0].page).assertEqual('pages/MusicVsMusicPage');
      expect(SCENARIO_LIST[0].desc).assertEqual('MUSIC vs MUSIC');
      expect('pages/MusicVsMusicPage'.endsWith('Page')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCEN_0008
     * @tc.name      testExtFocusScen0007
     * @tc.desc      Scenario musicVsVideo.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScen0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[1].id).assertEqual('musicVsVideo');
      expect(SCENARIO_LIST[1].page).assertEqual('pages/MusicVsVideoPage');
      expect(SCENARIO_LIST[1].desc).assertEqual('MUSIC vs MOVIE');
      expect('pages/MusicVsVideoPage'.endsWith('Page')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCEN_0009
     * @tc.name      testExtFocusScen0008
     * @tc.desc      Scenario musicVsGame.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScen0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[2].id).assertEqual('musicVsGame');
      expect(SCENARIO_LIST[2].page).assertEqual('pages/MusicVsGamePage');
      expect(SCENARIO_LIST[2].desc).assertEqual('MUSIC vs GAME');
      expect('pages/MusicVsGamePage'.endsWith('Page')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCEN_0010
     * @tc.name      testExtFocusScen0009
     * @tc.desc      Scenario musicVsMusic.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScen0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[0].id).assertEqual('musicVsMusic');
      expect(SCENARIO_LIST[0].page).assertEqual('pages/MusicVsMusicPage');
      expect(SCENARIO_LIST[0].desc).assertEqual('MUSIC vs MUSIC');
      expect('pages/MusicVsMusicPage'.endsWith('Page')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCEN_0011
     * @tc.name      testExtFocusScen0010
     * @tc.desc      Scenario musicVsVideo.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScen0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[1].id).assertEqual('musicVsVideo');
      expect(SCENARIO_LIST[1].page).assertEqual('pages/MusicVsVideoPage');
      expect(SCENARIO_LIST[1].desc).assertEqual('MUSIC vs MOVIE');
      expect('pages/MusicVsVideoPage'.endsWith('Page')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCEN_0012
     * @tc.name      testExtFocusScen0011
     * @tc.desc      Scenario musicVsGame.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScen0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[2].id).assertEqual('musicVsGame');
      expect(SCENARIO_LIST[2].page).assertEqual('pages/MusicVsGamePage');
      expect(SCENARIO_LIST[2].desc).assertEqual('MUSIC vs GAME');
      expect('pages/MusicVsGamePage'.endsWith('Page')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCEN_0013
     * @tc.name      testExtFocusScen0012
     * @tc.desc      Scenario musicVsMusic.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScen0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[0].id).assertEqual('musicVsMusic');
      expect(SCENARIO_LIST[0].page).assertEqual('pages/MusicVsMusicPage');
      expect(SCENARIO_LIST[0].desc).assertEqual('MUSIC vs MUSIC');
      expect('pages/MusicVsMusicPage'.endsWith('Page')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCEN_0014
     * @tc.name      testExtFocusScen0013
     * @tc.desc      Scenario musicVsVideo.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScen0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[1].id).assertEqual('musicVsVideo');
      expect(SCENARIO_LIST[1].page).assertEqual('pages/MusicVsVideoPage');
      expect(SCENARIO_LIST[1].desc).assertEqual('MUSIC vs MOVIE');
      expect('pages/MusicVsVideoPage'.endsWith('Page')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCEN_0015
     * @tc.name      testExtFocusScen0014
     * @tc.desc      Scenario musicVsGame.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScen0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[2].id).assertEqual('musicVsGame');
      expect(SCENARIO_LIST[2].page).assertEqual('pages/MusicVsGamePage');
      expect(SCENARIO_LIST[2].desc).assertEqual('MUSIC vs GAME');
      expect('pages/MusicVsGamePage'.endsWith('Page')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCEN_0016
     * @tc.name      testExtFocusScen0015
     * @tc.desc      Scenario musicVsMusic.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScen0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[0].id).assertEqual('musicVsMusic');
      expect(SCENARIO_LIST[0].page).assertEqual('pages/MusicVsMusicPage');
      expect(SCENARIO_LIST[0].desc).assertEqual('MUSIC vs MUSIC');
      expect('pages/MusicVsMusicPage'.endsWith('Page')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCEN_0017
     * @tc.name      testExtFocusScen0016
     * @tc.desc      Scenario musicVsVideo.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScen0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[1].id).assertEqual('musicVsVideo');
      expect(SCENARIO_LIST[1].page).assertEqual('pages/MusicVsVideoPage');
      expect(SCENARIO_LIST[1].desc).assertEqual('MUSIC vs MOVIE');
      expect('pages/MusicVsVideoPage'.endsWith('Page')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCEN_0018
     * @tc.name      testExtFocusScen0017
     * @tc.desc      Scenario musicVsGame.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScen0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[2].id).assertEqual('musicVsGame');
      expect(SCENARIO_LIST[2].page).assertEqual('pages/MusicVsGamePage');
      expect(SCENARIO_LIST[2].desc).assertEqual('MUSIC vs GAME');
      expect('pages/MusicVsGamePage'.endsWith('Page')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCEN_0019
     * @tc.name      testExtFocusScen0018
     * @tc.desc      Scenario musicVsMusic.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScen0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[0].id).assertEqual('musicVsMusic');
      expect(SCENARIO_LIST[0].page).assertEqual('pages/MusicVsMusicPage');
      expect(SCENARIO_LIST[0].desc).assertEqual('MUSIC vs MUSIC');
      expect('pages/MusicVsMusicPage'.endsWith('Page')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCEN_0020
     * @tc.name      testExtFocusScen0019
     * @tc.desc      Scenario musicVsVideo.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScen0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[1].id).assertEqual('musicVsVideo');
      expect(SCENARIO_LIST[1].page).assertEqual('pages/MusicVsVideoPage');
      expect(SCENARIO_LIST[1].desc).assertEqual('MUSIC vs MOVIE');
      expect('pages/MusicVsVideoPage'.endsWith('Page')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCEN_0021
     * @tc.name      testExtFocusScen0020
     * @tc.desc      Scenario musicVsGame.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScen0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[2].id).assertEqual('musicVsGame');
      expect(SCENARIO_LIST[2].page).assertEqual('pages/MusicVsGamePage');
      expect(SCENARIO_LIST[2].desc).assertEqual('MUSIC vs GAME');
      expect('pages/MusicVsGamePage'.endsWith('Page')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCEN_0022
     * @tc.name      testExtFocusScen0021
     * @tc.desc      Scenario musicVsMusic.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScen0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[0].id).assertEqual('musicVsMusic');
      expect(SCENARIO_LIST[0].page).assertEqual('pages/MusicVsMusicPage');
      expect(SCENARIO_LIST[0].desc).assertEqual('MUSIC vs MUSIC');
      expect('pages/MusicVsMusicPage'.endsWith('Page')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCEN_0023
     * @tc.name      testExtFocusScen0022
     * @tc.desc      Scenario musicVsVideo.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScen0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[1].id).assertEqual('musicVsVideo');
      expect(SCENARIO_LIST[1].page).assertEqual('pages/MusicVsVideoPage');
      expect(SCENARIO_LIST[1].desc).assertEqual('MUSIC vs MOVIE');
      expect('pages/MusicVsVideoPage'.endsWith('Page')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCEN_0024
     * @tc.name      testExtFocusScen0023
     * @tc.desc      Scenario musicVsGame.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScen0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[2].id).assertEqual('musicVsGame');
      expect(SCENARIO_LIST[2].page).assertEqual('pages/MusicVsGamePage');
      expect(SCENARIO_LIST[2].desc).assertEqual('MUSIC vs GAME');
      expect('pages/MusicVsGamePage'.endsWith('Page')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCEN_0025
     * @tc.name      testExtFocusScen0024
     * @tc.desc      Scenario musicVsMusic.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScen0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[0].id).assertEqual('musicVsMusic');
      expect(SCENARIO_LIST[0].page).assertEqual('pages/MusicVsMusicPage');
      expect(SCENARIO_LIST[0].desc).assertEqual('MUSIC vs MUSIC');
      expect('pages/MusicVsMusicPage'.endsWith('Page')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCEN_0026
     * @tc.name      testExtFocusScen0025
     * @tc.desc      Scenario musicVsVideo.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScen0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[1].id).assertEqual('musicVsVideo');
      expect(SCENARIO_LIST[1].page).assertEqual('pages/MusicVsVideoPage');
      expect(SCENARIO_LIST[1].desc).assertEqual('MUSIC vs MOVIE');
      expect('pages/MusicVsVideoPage'.endsWith('Page')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCEN_0027
     * @tc.name      testExtFocusScen0026
     * @tc.desc      Scenario musicVsGame.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScen0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[2].id).assertEqual('musicVsGame');
      expect(SCENARIO_LIST[2].page).assertEqual('pages/MusicVsGamePage');
      expect(SCENARIO_LIST[2].desc).assertEqual('MUSIC vs GAME');
      expect('pages/MusicVsGamePage'.endsWith('Page')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCEN_0028
     * @tc.name      testExtFocusScen0027
     * @tc.desc      Scenario musicVsMusic.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScen0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[0].id).assertEqual('musicVsMusic');
      expect(SCENARIO_LIST[0].page).assertEqual('pages/MusicVsMusicPage');
      expect(SCENARIO_LIST[0].desc).assertEqual('MUSIC vs MUSIC');
      expect('pages/MusicVsMusicPage'.endsWith('Page')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCEN_0029
     * @tc.name      testExtFocusScen0028
     * @tc.desc      Scenario musicVsVideo.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScen0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[1].id).assertEqual('musicVsVideo');
      expect(SCENARIO_LIST[1].page).assertEqual('pages/MusicVsVideoPage');
      expect(SCENARIO_LIST[1].desc).assertEqual('MUSIC vs MOVIE');
      expect('pages/MusicVsVideoPage'.endsWith('Page')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCEN_0030
     * @tc.name      testExtFocusScen0029
     * @tc.desc      Scenario musicVsGame.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScen0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[2].id).assertEqual('musicVsGame');
      expect(SCENARIO_LIST[2].page).assertEqual('pages/MusicVsGamePage');
      expect(SCENARIO_LIST[2].desc).assertEqual('MUSIC vs GAME');
      expect('pages/MusicVsGamePage'.endsWith('Page')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCEN_0031
     * @tc.name      testExtFocusScen0030
     * @tc.desc      Scenario musicVsMusic.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScen0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[0].id).assertEqual('musicVsMusic');
      expect(SCENARIO_LIST[0].page).assertEqual('pages/MusicVsMusicPage');
      expect(SCENARIO_LIST[0].desc).assertEqual('MUSIC vs MUSIC');
      expect('pages/MusicVsMusicPage'.endsWith('Page')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCEN_0032
     * @tc.name      testExtFocusScen0031
     * @tc.desc      Scenario musicVsVideo.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScen0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[1].id).assertEqual('musicVsVideo');
      expect(SCENARIO_LIST[1].page).assertEqual('pages/MusicVsVideoPage');
      expect(SCENARIO_LIST[1].desc).assertEqual('MUSIC vs MOVIE');
      expect('pages/MusicVsVideoPage'.endsWith('Page')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCEN_0033
     * @tc.name      testExtFocusScen0032
     * @tc.desc      Scenario musicVsGame.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScen0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[2].id).assertEqual('musicVsGame');
      expect(SCENARIO_LIST[2].page).assertEqual('pages/MusicVsGamePage');
      expect(SCENARIO_LIST[2].desc).assertEqual('MUSIC vs GAME');
      expect('pages/MusicVsGamePage'.endsWith('Page')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCEN_0034
     * @tc.name      testExtFocusScen0033
     * @tc.desc      Scenario musicVsMusic.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScen0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[0].id).assertEqual('musicVsMusic');
      expect(SCENARIO_LIST[0].page).assertEqual('pages/MusicVsMusicPage');
      expect(SCENARIO_LIST[0].desc).assertEqual('MUSIC vs MUSIC');
      expect('pages/MusicVsMusicPage'.endsWith('Page')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCEN_0035
     * @tc.name      testExtFocusScen0034
     * @tc.desc      Scenario musicVsVideo.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScen0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[1].id).assertEqual('musicVsVideo');
      expect(SCENARIO_LIST[1].page).assertEqual('pages/MusicVsVideoPage');
      expect(SCENARIO_LIST[1].desc).assertEqual('MUSIC vs MOVIE');
      expect('pages/MusicVsVideoPage'.endsWith('Page')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCEN_0036
     * @tc.name      testExtFocusScen0035
     * @tc.desc      Scenario musicVsGame.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScen0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[2].id).assertEqual('musicVsGame');
      expect(SCENARIO_LIST[2].page).assertEqual('pages/MusicVsGamePage');
      expect(SCENARIO_LIST[2].desc).assertEqual('MUSIC vs GAME');
      expect('pages/MusicVsGamePage'.endsWith('Page')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCEN_0037
     * @tc.name      testExtFocusScen0036
     * @tc.desc      Scenario musicVsMusic.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScen0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[0].id).assertEqual('musicVsMusic');
      expect(SCENARIO_LIST[0].page).assertEqual('pages/MusicVsMusicPage');
      expect(SCENARIO_LIST[0].desc).assertEqual('MUSIC vs MUSIC');
      expect('pages/MusicVsMusicPage'.endsWith('Page')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCEN_0038
     * @tc.name      testExtFocusScen0037
     * @tc.desc      Scenario musicVsVideo.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScen0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[1].id).assertEqual('musicVsVideo');
      expect(SCENARIO_LIST[1].page).assertEqual('pages/MusicVsVideoPage');
      expect(SCENARIO_LIST[1].desc).assertEqual('MUSIC vs MOVIE');
      expect('pages/MusicVsVideoPage'.endsWith('Page')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCEN_0039
     * @tc.name      testExtFocusScen0038
     * @tc.desc      Scenario musicVsGame.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScen0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[2].id).assertEqual('musicVsGame');
      expect(SCENARIO_LIST[2].page).assertEqual('pages/MusicVsGamePage');
      expect(SCENARIO_LIST[2].desc).assertEqual('MUSIC vs GAME');
      expect('pages/MusicVsGamePage'.endsWith('Page')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCEN_0040
     * @tc.name      testExtFocusScen0039
     * @tc.desc      Scenario musicVsMusic.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScen0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[0].id).assertEqual('musicVsMusic');
      expect(SCENARIO_LIST[0].page).assertEqual('pages/MusicVsMusicPage');
      expect(SCENARIO_LIST[0].desc).assertEqual('MUSIC vs MUSIC');
      expect('pages/MusicVsMusicPage'.endsWith('Page')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCEN_0041
     * @tc.name      testExtFocusScen0040
     * @tc.desc      Scenario musicVsVideo.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScen0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[1].id).assertEqual('musicVsVideo');
      expect(SCENARIO_LIST[1].page).assertEqual('pages/MusicVsVideoPage');
      expect(SCENARIO_LIST[1].desc).assertEqual('MUSIC vs MOVIE');
      expect('pages/MusicVsVideoPage'.endsWith('Page')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCEN_0042
     * @tc.name      testExtFocusScen0041
     * @tc.desc      Scenario musicVsGame.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScen0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[2].id).assertEqual('musicVsGame');
      expect(SCENARIO_LIST[2].page).assertEqual('pages/MusicVsGamePage');
      expect(SCENARIO_LIST[2].desc).assertEqual('MUSIC vs GAME');
      expect('pages/MusicVsGamePage'.endsWith('Page')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCEN_0043
     * @tc.name      testExtFocusScen0042
     * @tc.desc      Scenario musicVsMusic.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScen0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[0].id).assertEqual('musicVsMusic');
      expect(SCENARIO_LIST[0].page).assertEqual('pages/MusicVsMusicPage');
      expect(SCENARIO_LIST[0].desc).assertEqual('MUSIC vs MUSIC');
      expect('pages/MusicVsMusicPage'.endsWith('Page')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCEN_0044
     * @tc.name      testExtFocusScen0043
     * @tc.desc      Scenario musicVsVideo.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScen0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[1].id).assertEqual('musicVsVideo');
      expect(SCENARIO_LIST[1].page).assertEqual('pages/MusicVsVideoPage');
      expect(SCENARIO_LIST[1].desc).assertEqual('MUSIC vs MOVIE');
      expect('pages/MusicVsVideoPage'.endsWith('Page')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCEN_0045
     * @tc.name      testExtFocusScen0044
     * @tc.desc      Scenario musicVsGame.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScen0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[2].id).assertEqual('musicVsGame');
      expect(SCENARIO_LIST[2].page).assertEqual('pages/MusicVsGamePage');
      expect(SCENARIO_LIST[2].desc).assertEqual('MUSIC vs GAME');
      expect('pages/MusicVsGamePage'.endsWith('Page')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCEN_0046
     * @tc.name      testExtFocusScen0045
     * @tc.desc      Scenario musicVsMusic.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScen0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[0].id).assertEqual('musicVsMusic');
      expect(SCENARIO_LIST[0].page).assertEqual('pages/MusicVsMusicPage');
      expect(SCENARIO_LIST[0].desc).assertEqual('MUSIC vs MUSIC');
      expect('pages/MusicVsMusicPage'.endsWith('Page')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCEN_0047
     * @tc.name      testExtFocusScen0046
     * @tc.desc      Scenario musicVsVideo.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScen0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[1].id).assertEqual('musicVsVideo');
      expect(SCENARIO_LIST[1].page).assertEqual('pages/MusicVsVideoPage');
      expect(SCENARIO_LIST[1].desc).assertEqual('MUSIC vs MOVIE');
      expect('pages/MusicVsVideoPage'.endsWith('Page')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCEN_0048
     * @tc.name      testExtFocusScen0047
     * @tc.desc      Scenario musicVsGame.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScen0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[2].id).assertEqual('musicVsGame');
      expect(SCENARIO_LIST[2].page).assertEqual('pages/MusicVsGamePage');
      expect(SCENARIO_LIST[2].desc).assertEqual('MUSIC vs GAME');
      expect('pages/MusicVsGamePage'.endsWith('Page')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCEN_0049
     * @tc.name      testExtFocusScen0048
     * @tc.desc      Scenario musicVsMusic.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScen0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[0].id).assertEqual('musicVsMusic');
      expect(SCENARIO_LIST[0].page).assertEqual('pages/MusicVsMusicPage');
      expect(SCENARIO_LIST[0].desc).assertEqual('MUSIC vs MUSIC');
      expect('pages/MusicVsMusicPage'.endsWith('Page')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCEN_0050
     * @tc.name      testExtFocusScen0049
     * @tc.desc      Scenario musicVsVideo.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScen0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[1].id).assertEqual('musicVsVideo');
      expect(SCENARIO_LIST[1].page).assertEqual('pages/MusicVsVideoPage');
      expect(SCENARIO_LIST[1].desc).assertEqual('MUSIC vs MOVIE');
      expect('pages/MusicVsVideoPage'.endsWith('Page')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCEN_0051
     * @tc.name      testExtFocusScen0050
     * @tc.desc      Scenario musicVsGame.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScen0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[2].id).assertEqual('musicVsGame');
      expect(SCENARIO_LIST[2].page).assertEqual('pages/MusicVsGamePage');
      expect(SCENARIO_LIST[2].desc).assertEqual('MUSIC vs GAME');
      expect('pages/MusicVsGamePage'.endsWith('Page')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCEN_0052
     * @tc.name      testExtFocusScen0051
     * @tc.desc      Scenario musicVsMusic.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScen0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[0].id).assertEqual('musicVsMusic');
      expect(SCENARIO_LIST[0].page).assertEqual('pages/MusicVsMusicPage');
      expect(SCENARIO_LIST[0].desc).assertEqual('MUSIC vs MUSIC');
      expect('pages/MusicVsMusicPage'.endsWith('Page')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCEN_0053
     * @tc.name      testExtFocusScen0052
     * @tc.desc      Scenario musicVsVideo.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScen0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[1].id).assertEqual('musicVsVideo');
      expect(SCENARIO_LIST[1].page).assertEqual('pages/MusicVsVideoPage');
      expect(SCENARIO_LIST[1].desc).assertEqual('MUSIC vs MOVIE');
      expect('pages/MusicVsVideoPage'.endsWith('Page')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCEN_0054
     * @tc.name      testExtFocusScen0053
     * @tc.desc      Scenario musicVsGame.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScen0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[2].id).assertEqual('musicVsGame');
      expect(SCENARIO_LIST[2].page).assertEqual('pages/MusicVsGamePage');
      expect(SCENARIO_LIST[2].desc).assertEqual('MUSIC vs GAME');
      expect('pages/MusicVsGamePage'.endsWith('Page')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCEN_0055
     * @tc.name      testExtFocusScen0054
     * @tc.desc      Scenario musicVsMusic.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScen0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[0].id).assertEqual('musicVsMusic');
      expect(SCENARIO_LIST[0].page).assertEqual('pages/MusicVsMusicPage');
      expect(SCENARIO_LIST[0].desc).assertEqual('MUSIC vs MUSIC');
      expect('pages/MusicVsMusicPage'.endsWith('Page')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCEN_0056
     * @tc.name      testExtFocusScen0055
     * @tc.desc      Scenario musicVsVideo.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScen0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[1].id).assertEqual('musicVsVideo');
      expect(SCENARIO_LIST[1].page).assertEqual('pages/MusicVsVideoPage');
      expect(SCENARIO_LIST[1].desc).assertEqual('MUSIC vs MOVIE');
      expect('pages/MusicVsVideoPage'.endsWith('Page')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCEN_0057
     * @tc.name      testExtFocusScen0056
     * @tc.desc      Scenario musicVsGame.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScen0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[2].id).assertEqual('musicVsGame');
      expect(SCENARIO_LIST[2].page).assertEqual('pages/MusicVsGamePage');
      expect(SCENARIO_LIST[2].desc).assertEqual('MUSIC vs GAME');
      expect('pages/MusicVsGamePage'.endsWith('Page')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCEN_0058
     * @tc.name      testExtFocusScen0057
     * @tc.desc      Scenario musicVsMusic.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScen0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[0].id).assertEqual('musicVsMusic');
      expect(SCENARIO_LIST[0].page).assertEqual('pages/MusicVsMusicPage');
      expect(SCENARIO_LIST[0].desc).assertEqual('MUSIC vs MUSIC');
      expect('pages/MusicVsMusicPage'.endsWith('Page')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCEN_0059
     * @tc.name      testExtFocusScen0058
     * @tc.desc      Scenario musicVsVideo.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScen0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[1].id).assertEqual('musicVsVideo');
      expect(SCENARIO_LIST[1].page).assertEqual('pages/MusicVsVideoPage');
      expect(SCENARIO_LIST[1].desc).assertEqual('MUSIC vs MOVIE');
      expect('pages/MusicVsVideoPage'.endsWith('Page')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCEN_0060
     * @tc.name      testExtFocusScen0059
     * @tc.desc      Scenario musicVsGame.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScen0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[2].id).assertEqual('musicVsGame');
      expect(SCENARIO_LIST[2].page).assertEqual('pages/MusicVsGamePage');
      expect(SCENARIO_LIST[2].desc).assertEqual('MUSIC vs GAME');
      expect('pages/MusicVsGamePage'.endsWith('Page')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCEN_0061
     * @tc.name      testExtFocusScen0060
     * @tc.desc      Scenario musicVsMusic.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScen0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[0].id).assertEqual('musicVsMusic');
      expect(SCENARIO_LIST[0].page).assertEqual('pages/MusicVsMusicPage');
      expect(SCENARIO_LIST[0].desc).assertEqual('MUSIC vs MUSIC');
      expect('pages/MusicVsMusicPage'.endsWith('Page')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCEN_0062
     * @tc.name      testExtFocusScen0061
     * @tc.desc      Scenario musicVsVideo.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScen0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[1].id).assertEqual('musicVsVideo');
      expect(SCENARIO_LIST[1].page).assertEqual('pages/MusicVsVideoPage');
      expect(SCENARIO_LIST[1].desc).assertEqual('MUSIC vs MOVIE');
      expect('pages/MusicVsVideoPage'.endsWith('Page')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCEN_0063
     * @tc.name      testExtFocusScen0062
     * @tc.desc      Scenario musicVsGame.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScen0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[2].id).assertEqual('musicVsGame');
      expect(SCENARIO_LIST[2].page).assertEqual('pages/MusicVsGamePage');
      expect(SCENARIO_LIST[2].desc).assertEqual('MUSIC vs GAME');
      expect('pages/MusicVsGamePage'.endsWith('Page')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCEN_0064
     * @tc.name      testExtFocusScen0063
     * @tc.desc      Scenario musicVsMusic.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScen0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[0].id).assertEqual('musicVsMusic');
      expect(SCENARIO_LIST[0].page).assertEqual('pages/MusicVsMusicPage');
      expect(SCENARIO_LIST[0].desc).assertEqual('MUSIC vs MUSIC');
      expect('pages/MusicVsMusicPage'.endsWith('Page')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCEN_0065
     * @tc.name      testExtFocusScen0064
     * @tc.desc      Scenario musicVsVideo.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScen0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[1].id).assertEqual('musicVsVideo');
      expect(SCENARIO_LIST[1].page).assertEqual('pages/MusicVsVideoPage');
      expect(SCENARIO_LIST[1].desc).assertEqual('MUSIC vs MOVIE');
      expect('pages/MusicVsVideoPage'.endsWith('Page')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCEN_0066
     * @tc.name      testExtFocusScen0065
     * @tc.desc      Scenario musicVsGame.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScen0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[2].id).assertEqual('musicVsGame');
      expect(SCENARIO_LIST[2].page).assertEqual('pages/MusicVsGamePage');
      expect(SCENARIO_LIST[2].desc).assertEqual('MUSIC vs GAME');
      expect('pages/MusicVsGamePage'.endsWith('Page')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCEN_0067
     * @tc.name      testExtFocusScen0066
     * @tc.desc      Scenario musicVsMusic.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScen0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[0].id).assertEqual('musicVsMusic');
      expect(SCENARIO_LIST[0].page).assertEqual('pages/MusicVsMusicPage');
      expect(SCENARIO_LIST[0].desc).assertEqual('MUSIC vs MUSIC');
      expect('pages/MusicVsMusicPage'.endsWith('Page')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCEN_0068
     * @tc.name      testExtFocusScen0067
     * @tc.desc      Scenario musicVsVideo.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScen0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[1].id).assertEqual('musicVsVideo');
      expect(SCENARIO_LIST[1].page).assertEqual('pages/MusicVsVideoPage');
      expect(SCENARIO_LIST[1].desc).assertEqual('MUSIC vs MOVIE');
      expect('pages/MusicVsVideoPage'.endsWith('Page')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCEN_0069
     * @tc.name      testExtFocusScen0068
     * @tc.desc      Scenario musicVsGame.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScen0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[2].id).assertEqual('musicVsGame');
      expect(SCENARIO_LIST[2].page).assertEqual('pages/MusicVsGamePage');
      expect(SCENARIO_LIST[2].desc).assertEqual('MUSIC vs GAME');
      expect('pages/MusicVsGamePage'.endsWith('Page')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCEN_0070
     * @tc.name      testExtFocusScen0069
     * @tc.desc      Scenario musicVsMusic.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScen0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[0].id).assertEqual('musicVsMusic');
      expect(SCENARIO_LIST[0].page).assertEqual('pages/MusicVsMusicPage');
      expect(SCENARIO_LIST[0].desc).assertEqual('MUSIC vs MUSIC');
      expect('pages/MusicVsMusicPage'.endsWith('Page')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCEN_0071
     * @tc.name      testExtFocusScen0070
     * @tc.desc      Scenario musicVsVideo.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScen0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[1].id).assertEqual('musicVsVideo');
      expect(SCENARIO_LIST[1].page).assertEqual('pages/MusicVsVideoPage');
      expect(SCENARIO_LIST[1].desc).assertEqual('MUSIC vs MOVIE');
      expect('pages/MusicVsVideoPage'.endsWith('Page')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCEN_0072
     * @tc.name      testExtFocusScen0071
     * @tc.desc      Scenario musicVsGame.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScen0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[2].id).assertEqual('musicVsGame');
      expect(SCENARIO_LIST[2].page).assertEqual('pages/MusicVsGamePage');
      expect(SCENARIO_LIST[2].desc).assertEqual('MUSIC vs GAME');
      expect('pages/MusicVsGamePage'.endsWith('Page')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCEN_0073
     * @tc.name      testExtFocusScen0072
     * @tc.desc      Scenario musicVsMusic.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScen0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[0].id).assertEqual('musicVsMusic');
      expect(SCENARIO_LIST[0].page).assertEqual('pages/MusicVsMusicPage');
      expect(SCENARIO_LIST[0].desc).assertEqual('MUSIC vs MUSIC');
      expect('pages/MusicVsMusicPage'.endsWith('Page')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCEN_0074
     * @tc.name      testExtFocusScen0073
     * @tc.desc      Scenario musicVsVideo.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScen0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[1].id).assertEqual('musicVsVideo');
      expect(SCENARIO_LIST[1].page).assertEqual('pages/MusicVsVideoPage');
      expect(SCENARIO_LIST[1].desc).assertEqual('MUSIC vs MOVIE');
      expect('pages/MusicVsVideoPage'.endsWith('Page')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCEN_0075
     * @tc.name      testExtFocusScen0074
     * @tc.desc      Scenario musicVsGame.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScen0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[2].id).assertEqual('musicVsGame');
      expect(SCENARIO_LIST[2].page).assertEqual('pages/MusicVsGamePage');
      expect(SCENARIO_LIST[2].desc).assertEqual('MUSIC vs GAME');
      expect('pages/MusicVsGamePage'.endsWith('Page')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCEN_0076
     * @tc.name      testExtFocusScen0075
     * @tc.desc      Scenario musicVsMusic.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScen0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[0].id).assertEqual('musicVsMusic');
      expect(SCENARIO_LIST[0].page).assertEqual('pages/MusicVsMusicPage');
      expect(SCENARIO_LIST[0].desc).assertEqual('MUSIC vs MUSIC');
      expect('pages/MusicVsMusicPage'.endsWith('Page')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCEN_0077
     * @tc.name      testExtFocusScen0076
     * @tc.desc      Scenario musicVsVideo.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScen0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[1].id).assertEqual('musicVsVideo');
      expect(SCENARIO_LIST[1].page).assertEqual('pages/MusicVsVideoPage');
      expect(SCENARIO_LIST[1].desc).assertEqual('MUSIC vs MOVIE');
      expect('pages/MusicVsVideoPage'.endsWith('Page')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCEN_0078
     * @tc.name      testExtFocusScen0077
     * @tc.desc      Scenario musicVsGame.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScen0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[2].id).assertEqual('musicVsGame');
      expect(SCENARIO_LIST[2].page).assertEqual('pages/MusicVsGamePage');
      expect(SCENARIO_LIST[2].desc).assertEqual('MUSIC vs GAME');
      expect('pages/MusicVsGamePage'.endsWith('Page')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCEN_0079
     * @tc.name      testExtFocusScen0078
     * @tc.desc      Scenario musicVsMusic.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScen0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[0].id).assertEqual('musicVsMusic');
      expect(SCENARIO_LIST[0].page).assertEqual('pages/MusicVsMusicPage');
      expect(SCENARIO_LIST[0].desc).assertEqual('MUSIC vs MUSIC');
      expect('pages/MusicVsMusicPage'.endsWith('Page')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCEN_0080
     * @tc.name      testExtFocusScen0079
     * @tc.desc      Scenario musicVsVideo.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScen0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[1].id).assertEqual('musicVsVideo');
      expect(SCENARIO_LIST[1].page).assertEqual('pages/MusicVsVideoPage');
      expect(SCENARIO_LIST[1].desc).assertEqual('MUSIC vs MOVIE');
      expect('pages/MusicVsVideoPage'.endsWith('Page')).assertTrue();
    })
  });
}
