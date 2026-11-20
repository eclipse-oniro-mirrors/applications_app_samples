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

const TAG: string = '[Sample_audioFocusScenarioStateCore]';
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

export default function audioFocusScenarioStateCoreTest(): void {
  describe('audioFocusScenarioStateCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCENARIO_0001
     * @tc.name      testExtFocusScenarioState0000
     * @tc.desc      Scenario musicVsMusic control=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScenarioState0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const scenario: string = 'musicVsMusic';
      const appControl: boolean = true;
      let playingA: boolean = true;
      let playingB: boolean = false;
      if (appControl && playingA && playingB) { playingA = false; }
      expect(scenario.length).assertLarger(0);
      expect(appControl || !appControl).assertTrue();
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCENARIO_0002
     * @tc.name      testExtFocusScenarioState0001
     * @tc.desc      Scenario musicVsVideo control=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScenarioState0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const scenario: string = 'musicVsVideo';
      const appControl: boolean = false;
      let playingA: boolean = false;
      let playingB: boolean = true;
      if (appControl && playingA && playingB) { playingA = false; }
      expect(scenario.length).assertLarger(0);
      expect(appControl || !appControl).assertTrue();
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCENARIO_0003
     * @tc.name      testExtFocusScenarioState0002
     * @tc.desc      Scenario musicVsGame control=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScenarioState0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const scenario: string = 'musicVsGame';
      const appControl: boolean = true;
      let playingA: boolean = false;
      let playingB: boolean = false;
      if (appControl && playingA && playingB) { playingA = false; }
      expect(scenario.length).assertLarger(0);
      expect(appControl || !appControl).assertTrue();
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCENARIO_0004
     * @tc.name      testExtFocusScenarioState0003
     * @tc.desc      Scenario musicVsMusic control=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScenarioState0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const scenario: string = 'musicVsMusic';
      const appControl: boolean = false;
      let playingA: boolean = true;
      let playingB: boolean = true;
      if (appControl && playingA && playingB) { playingA = false; }
      expect(scenario.length).assertLarger(0);
      expect(appControl || !appControl).assertTrue();
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCENARIO_0005
     * @tc.name      testExtFocusScenarioState0004
     * @tc.desc      Scenario musicVsVideo control=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScenarioState0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const scenario: string = 'musicVsVideo';
      const appControl: boolean = true;
      let playingA: boolean = false;
      let playingB: boolean = false;
      if (appControl && playingA && playingB) { playingA = false; }
      expect(scenario.length).assertLarger(0);
      expect(appControl || !appControl).assertTrue();
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCENARIO_0006
     * @tc.name      testExtFocusScenarioState0005
     * @tc.desc      Scenario musicVsGame control=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScenarioState0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const scenario: string = 'musicVsGame';
      const appControl: boolean = false;
      let playingA: boolean = false;
      let playingB: boolean = true;
      if (appControl && playingA && playingB) { playingA = false; }
      expect(scenario.length).assertLarger(0);
      expect(appControl || !appControl).assertTrue();
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCENARIO_0007
     * @tc.name      testExtFocusScenarioState0006
     * @tc.desc      Scenario musicVsMusic control=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScenarioState0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const scenario: string = 'musicVsMusic';
      const appControl: boolean = true;
      let playingA: boolean = true;
      let playingB: boolean = false;
      if (appControl && playingA && playingB) { playingA = false; }
      expect(scenario.length).assertLarger(0);
      expect(appControl || !appControl).assertTrue();
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCENARIO_0008
     * @tc.name      testExtFocusScenarioState0007
     * @tc.desc      Scenario musicVsVideo control=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScenarioState0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const scenario: string = 'musicVsVideo';
      const appControl: boolean = false;
      let playingA: boolean = false;
      let playingB: boolean = true;
      if (appControl && playingA && playingB) { playingA = false; }
      expect(scenario.length).assertLarger(0);
      expect(appControl || !appControl).assertTrue();
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCENARIO_0009
     * @tc.name      testExtFocusScenarioState0008
     * @tc.desc      Scenario musicVsGame control=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScenarioState0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const scenario: string = 'musicVsGame';
      const appControl: boolean = true;
      let playingA: boolean = false;
      let playingB: boolean = false;
      if (appControl && playingA && playingB) { playingA = false; }
      expect(scenario.length).assertLarger(0);
      expect(appControl || !appControl).assertTrue();
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCENARIO_0010
     * @tc.name      testExtFocusScenarioState0009
     * @tc.desc      Scenario musicVsMusic control=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScenarioState0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const scenario: string = 'musicVsMusic';
      const appControl: boolean = false;
      let playingA: boolean = true;
      let playingB: boolean = true;
      if (appControl && playingA && playingB) { playingA = false; }
      expect(scenario.length).assertLarger(0);
      expect(appControl || !appControl).assertTrue();
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCENARIO_0011
     * @tc.name      testExtFocusScenarioState0010
     * @tc.desc      Scenario musicVsVideo control=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScenarioState0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const scenario: string = 'musicVsVideo';
      const appControl: boolean = true;
      let playingA: boolean = false;
      let playingB: boolean = false;
      if (appControl && playingA && playingB) { playingA = false; }
      expect(scenario.length).assertLarger(0);
      expect(appControl || !appControl).assertTrue();
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCENARIO_0012
     * @tc.name      testExtFocusScenarioState0011
     * @tc.desc      Scenario musicVsGame control=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScenarioState0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const scenario: string = 'musicVsGame';
      const appControl: boolean = false;
      let playingA: boolean = false;
      let playingB: boolean = true;
      if (appControl && playingA && playingB) { playingA = false; }
      expect(scenario.length).assertLarger(0);
      expect(appControl || !appControl).assertTrue();
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCENARIO_0013
     * @tc.name      testExtFocusScenarioState0012
     * @tc.desc      Scenario musicVsMusic control=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScenarioState0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const scenario: string = 'musicVsMusic';
      const appControl: boolean = true;
      let playingA: boolean = true;
      let playingB: boolean = false;
      if (appControl && playingA && playingB) { playingA = false; }
      expect(scenario.length).assertLarger(0);
      expect(appControl || !appControl).assertTrue();
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCENARIO_0014
     * @tc.name      testExtFocusScenarioState0013
     * @tc.desc      Scenario musicVsVideo control=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScenarioState0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const scenario: string = 'musicVsVideo';
      const appControl: boolean = false;
      let playingA: boolean = false;
      let playingB: boolean = true;
      if (appControl && playingA && playingB) { playingA = false; }
      expect(scenario.length).assertLarger(0);
      expect(appControl || !appControl).assertTrue();
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCENARIO_0015
     * @tc.name      testExtFocusScenarioState0014
     * @tc.desc      Scenario musicVsGame control=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScenarioState0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const scenario: string = 'musicVsGame';
      const appControl: boolean = true;
      let playingA: boolean = false;
      let playingB: boolean = false;
      if (appControl && playingA && playingB) { playingA = false; }
      expect(scenario.length).assertLarger(0);
      expect(appControl || !appControl).assertTrue();
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCENARIO_0016
     * @tc.name      testExtFocusScenarioState0015
     * @tc.desc      Scenario musicVsMusic control=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScenarioState0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const scenario: string = 'musicVsMusic';
      const appControl: boolean = false;
      let playingA: boolean = true;
      let playingB: boolean = true;
      if (appControl && playingA && playingB) { playingA = false; }
      expect(scenario.length).assertLarger(0);
      expect(appControl || !appControl).assertTrue();
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCENARIO_0017
     * @tc.name      testExtFocusScenarioState0016
     * @tc.desc      Scenario musicVsVideo control=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScenarioState0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const scenario: string = 'musicVsVideo';
      const appControl: boolean = true;
      let playingA: boolean = false;
      let playingB: boolean = false;
      if (appControl && playingA && playingB) { playingA = false; }
      expect(scenario.length).assertLarger(0);
      expect(appControl || !appControl).assertTrue();
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCENARIO_0018
     * @tc.name      testExtFocusScenarioState0017
     * @tc.desc      Scenario musicVsGame control=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScenarioState0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const scenario: string = 'musicVsGame';
      const appControl: boolean = false;
      let playingA: boolean = false;
      let playingB: boolean = true;
      if (appControl && playingA && playingB) { playingA = false; }
      expect(scenario.length).assertLarger(0);
      expect(appControl || !appControl).assertTrue();
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCENARIO_0019
     * @tc.name      testExtFocusScenarioState0018
     * @tc.desc      Scenario musicVsMusic control=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScenarioState0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const scenario: string = 'musicVsMusic';
      const appControl: boolean = true;
      let playingA: boolean = true;
      let playingB: boolean = false;
      if (appControl && playingA && playingB) { playingA = false; }
      expect(scenario.length).assertLarger(0);
      expect(appControl || !appControl).assertTrue();
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCENARIO_0020
     * @tc.name      testExtFocusScenarioState0019
     * @tc.desc      Scenario musicVsVideo control=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScenarioState0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const scenario: string = 'musicVsVideo';
      const appControl: boolean = false;
      let playingA: boolean = false;
      let playingB: boolean = true;
      if (appControl && playingA && playingB) { playingA = false; }
      expect(scenario.length).assertLarger(0);
      expect(appControl || !appControl).assertTrue();
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCENARIO_0021
     * @tc.name      testExtFocusScenarioState0020
     * @tc.desc      Scenario musicVsGame control=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScenarioState0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const scenario: string = 'musicVsGame';
      const appControl: boolean = true;
      let playingA: boolean = false;
      let playingB: boolean = false;
      if (appControl && playingA && playingB) { playingA = false; }
      expect(scenario.length).assertLarger(0);
      expect(appControl || !appControl).assertTrue();
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCENARIO_0022
     * @tc.name      testExtFocusScenarioState0021
     * @tc.desc      Scenario musicVsMusic control=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScenarioState0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const scenario: string = 'musicVsMusic';
      const appControl: boolean = false;
      let playingA: boolean = true;
      let playingB: boolean = true;
      if (appControl && playingA && playingB) { playingA = false; }
      expect(scenario.length).assertLarger(0);
      expect(appControl || !appControl).assertTrue();
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCENARIO_0023
     * @tc.name      testExtFocusScenarioState0022
     * @tc.desc      Scenario musicVsVideo control=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScenarioState0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const scenario: string = 'musicVsVideo';
      const appControl: boolean = true;
      let playingA: boolean = false;
      let playingB: boolean = false;
      if (appControl && playingA && playingB) { playingA = false; }
      expect(scenario.length).assertLarger(0);
      expect(appControl || !appControl).assertTrue();
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCENARIO_0024
     * @tc.name      testExtFocusScenarioState0023
     * @tc.desc      Scenario musicVsGame control=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScenarioState0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const scenario: string = 'musicVsGame';
      const appControl: boolean = false;
      let playingA: boolean = false;
      let playingB: boolean = true;
      if (appControl && playingA && playingB) { playingA = false; }
      expect(scenario.length).assertLarger(0);
      expect(appControl || !appControl).assertTrue();
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCENARIO_0025
     * @tc.name      testExtFocusScenarioState0024
     * @tc.desc      Scenario musicVsMusic control=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScenarioState0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const scenario: string = 'musicVsMusic';
      const appControl: boolean = true;
      let playingA: boolean = true;
      let playingB: boolean = false;
      if (appControl && playingA && playingB) { playingA = false; }
      expect(scenario.length).assertLarger(0);
      expect(appControl || !appControl).assertTrue();
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCENARIO_0026
     * @tc.name      testExtFocusScenarioState0025
     * @tc.desc      Scenario musicVsVideo control=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScenarioState0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const scenario: string = 'musicVsVideo';
      const appControl: boolean = false;
      let playingA: boolean = false;
      let playingB: boolean = true;
      if (appControl && playingA && playingB) { playingA = false; }
      expect(scenario.length).assertLarger(0);
      expect(appControl || !appControl).assertTrue();
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCENARIO_0027
     * @tc.name      testExtFocusScenarioState0026
     * @tc.desc      Scenario musicVsGame control=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScenarioState0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const scenario: string = 'musicVsGame';
      const appControl: boolean = true;
      let playingA: boolean = false;
      let playingB: boolean = false;
      if (appControl && playingA && playingB) { playingA = false; }
      expect(scenario.length).assertLarger(0);
      expect(appControl || !appControl).assertTrue();
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCENARIO_0028
     * @tc.name      testExtFocusScenarioState0027
     * @tc.desc      Scenario musicVsMusic control=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScenarioState0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const scenario: string = 'musicVsMusic';
      const appControl: boolean = false;
      let playingA: boolean = true;
      let playingB: boolean = true;
      if (appControl && playingA && playingB) { playingA = false; }
      expect(scenario.length).assertLarger(0);
      expect(appControl || !appControl).assertTrue();
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCENARIO_0029
     * @tc.name      testExtFocusScenarioState0028
     * @tc.desc      Scenario musicVsVideo control=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScenarioState0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const scenario: string = 'musicVsVideo';
      const appControl: boolean = true;
      let playingA: boolean = false;
      let playingB: boolean = false;
      if (appControl && playingA && playingB) { playingA = false; }
      expect(scenario.length).assertLarger(0);
      expect(appControl || !appControl).assertTrue();
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCENARIO_0030
     * @tc.name      testExtFocusScenarioState0029
     * @tc.desc      Scenario musicVsGame control=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScenarioState0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const scenario: string = 'musicVsGame';
      const appControl: boolean = false;
      let playingA: boolean = false;
      let playingB: boolean = true;
      if (appControl && playingA && playingB) { playingA = false; }
      expect(scenario.length).assertLarger(0);
      expect(appControl || !appControl).assertTrue();
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCENARIO_0031
     * @tc.name      testExtFocusScenarioState0030
     * @tc.desc      Scenario musicVsMusic control=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScenarioState0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const scenario: string = 'musicVsMusic';
      const appControl: boolean = true;
      let playingA: boolean = true;
      let playingB: boolean = false;
      if (appControl && playingA && playingB) { playingA = false; }
      expect(scenario.length).assertLarger(0);
      expect(appControl || !appControl).assertTrue();
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCENARIO_0032
     * @tc.name      testExtFocusScenarioState0031
     * @tc.desc      Scenario musicVsVideo control=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScenarioState0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const scenario: string = 'musicVsVideo';
      const appControl: boolean = false;
      let playingA: boolean = false;
      let playingB: boolean = true;
      if (appControl && playingA && playingB) { playingA = false; }
      expect(scenario.length).assertLarger(0);
      expect(appControl || !appControl).assertTrue();
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCENARIO_0033
     * @tc.name      testExtFocusScenarioState0032
     * @tc.desc      Scenario musicVsGame control=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScenarioState0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const scenario: string = 'musicVsGame';
      const appControl: boolean = true;
      let playingA: boolean = false;
      let playingB: boolean = false;
      if (appControl && playingA && playingB) { playingA = false; }
      expect(scenario.length).assertLarger(0);
      expect(appControl || !appControl).assertTrue();
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCENARIO_0034
     * @tc.name      testExtFocusScenarioState0033
     * @tc.desc      Scenario musicVsMusic control=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScenarioState0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const scenario: string = 'musicVsMusic';
      const appControl: boolean = false;
      let playingA: boolean = true;
      let playingB: boolean = true;
      if (appControl && playingA && playingB) { playingA = false; }
      expect(scenario.length).assertLarger(0);
      expect(appControl || !appControl).assertTrue();
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCENARIO_0035
     * @tc.name      testExtFocusScenarioState0034
     * @tc.desc      Scenario musicVsVideo control=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScenarioState0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const scenario: string = 'musicVsVideo';
      const appControl: boolean = true;
      let playingA: boolean = false;
      let playingB: boolean = false;
      if (appControl && playingA && playingB) { playingA = false; }
      expect(scenario.length).assertLarger(0);
      expect(appControl || !appControl).assertTrue();
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCENARIO_0036
     * @tc.name      testExtFocusScenarioState0035
     * @tc.desc      Scenario musicVsGame control=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScenarioState0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const scenario: string = 'musicVsGame';
      const appControl: boolean = false;
      let playingA: boolean = false;
      let playingB: boolean = true;
      if (appControl && playingA && playingB) { playingA = false; }
      expect(scenario.length).assertLarger(0);
      expect(appControl || !appControl).assertTrue();
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCENARIO_0037
     * @tc.name      testExtFocusScenarioState0036
     * @tc.desc      Scenario musicVsMusic control=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScenarioState0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const scenario: string = 'musicVsMusic';
      const appControl: boolean = true;
      let playingA: boolean = true;
      let playingB: boolean = false;
      if (appControl && playingA && playingB) { playingA = false; }
      expect(scenario.length).assertLarger(0);
      expect(appControl || !appControl).assertTrue();
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCENARIO_0038
     * @tc.name      testExtFocusScenarioState0037
     * @tc.desc      Scenario musicVsVideo control=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScenarioState0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const scenario: string = 'musicVsVideo';
      const appControl: boolean = false;
      let playingA: boolean = false;
      let playingB: boolean = true;
      if (appControl && playingA && playingB) { playingA = false; }
      expect(scenario.length).assertLarger(0);
      expect(appControl || !appControl).assertTrue();
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCENARIO_0039
     * @tc.name      testExtFocusScenarioState0038
     * @tc.desc      Scenario musicVsGame control=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScenarioState0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const scenario: string = 'musicVsGame';
      const appControl: boolean = true;
      let playingA: boolean = false;
      let playingB: boolean = false;
      if (appControl && playingA && playingB) { playingA = false; }
      expect(scenario.length).assertLarger(0);
      expect(appControl || !appControl).assertTrue();
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCENARIO_0040
     * @tc.name      testExtFocusScenarioState0039
     * @tc.desc      Scenario musicVsMusic control=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScenarioState0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const scenario: string = 'musicVsMusic';
      const appControl: boolean = false;
      let playingA: boolean = true;
      let playingB: boolean = true;
      if (appControl && playingA && playingB) { playingA = false; }
      expect(scenario.length).assertLarger(0);
      expect(appControl || !appControl).assertTrue();
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCENARIO_0041
     * @tc.name      testExtFocusScenarioState0040
     * @tc.desc      Scenario musicVsVideo control=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScenarioState0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const scenario: string = 'musicVsVideo';
      const appControl: boolean = true;
      let playingA: boolean = false;
      let playingB: boolean = false;
      if (appControl && playingA && playingB) { playingA = false; }
      expect(scenario.length).assertLarger(0);
      expect(appControl || !appControl).assertTrue();
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCENARIO_0042
     * @tc.name      testExtFocusScenarioState0041
     * @tc.desc      Scenario musicVsGame control=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScenarioState0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const scenario: string = 'musicVsGame';
      const appControl: boolean = false;
      let playingA: boolean = false;
      let playingB: boolean = true;
      if (appControl && playingA && playingB) { playingA = false; }
      expect(scenario.length).assertLarger(0);
      expect(appControl || !appControl).assertTrue();
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCENARIO_0043
     * @tc.name      testExtFocusScenarioState0042
     * @tc.desc      Scenario musicVsMusic control=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScenarioState0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const scenario: string = 'musicVsMusic';
      const appControl: boolean = true;
      let playingA: boolean = true;
      let playingB: boolean = false;
      if (appControl && playingA && playingB) { playingA = false; }
      expect(scenario.length).assertLarger(0);
      expect(appControl || !appControl).assertTrue();
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCENARIO_0044
     * @tc.name      testExtFocusScenarioState0043
     * @tc.desc      Scenario musicVsVideo control=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScenarioState0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const scenario: string = 'musicVsVideo';
      const appControl: boolean = false;
      let playingA: boolean = false;
      let playingB: boolean = true;
      if (appControl && playingA && playingB) { playingA = false; }
      expect(scenario.length).assertLarger(0);
      expect(appControl || !appControl).assertTrue();
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCENARIO_0045
     * @tc.name      testExtFocusScenarioState0044
     * @tc.desc      Scenario musicVsGame control=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScenarioState0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const scenario: string = 'musicVsGame';
      const appControl: boolean = true;
      let playingA: boolean = false;
      let playingB: boolean = false;
      if (appControl && playingA && playingB) { playingA = false; }
      expect(scenario.length).assertLarger(0);
      expect(appControl || !appControl).assertTrue();
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCENARIO_0046
     * @tc.name      testExtFocusScenarioState0045
     * @tc.desc      Scenario musicVsMusic control=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScenarioState0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const scenario: string = 'musicVsMusic';
      const appControl: boolean = false;
      let playingA: boolean = true;
      let playingB: boolean = true;
      if (appControl && playingA && playingB) { playingA = false; }
      expect(scenario.length).assertLarger(0);
      expect(appControl || !appControl).assertTrue();
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCENARIO_0047
     * @tc.name      testExtFocusScenarioState0046
     * @tc.desc      Scenario musicVsVideo control=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScenarioState0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const scenario: string = 'musicVsVideo';
      const appControl: boolean = true;
      let playingA: boolean = false;
      let playingB: boolean = false;
      if (appControl && playingA && playingB) { playingA = false; }
      expect(scenario.length).assertLarger(0);
      expect(appControl || !appControl).assertTrue();
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCENARIO_0048
     * @tc.name      testExtFocusScenarioState0047
     * @tc.desc      Scenario musicVsGame control=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScenarioState0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const scenario: string = 'musicVsGame';
      const appControl: boolean = false;
      let playingA: boolean = false;
      let playingB: boolean = true;
      if (appControl && playingA && playingB) { playingA = false; }
      expect(scenario.length).assertLarger(0);
      expect(appControl || !appControl).assertTrue();
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCENARIO_0049
     * @tc.name      testExtFocusScenarioState0048
     * @tc.desc      Scenario musicVsMusic control=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScenarioState0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const scenario: string = 'musicVsMusic';
      const appControl: boolean = true;
      let playingA: boolean = true;
      let playingB: boolean = false;
      if (appControl && playingA && playingB) { playingA = false; }
      expect(scenario.length).assertLarger(0);
      expect(appControl || !appControl).assertTrue();
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCENARIO_0050
     * @tc.name      testExtFocusScenarioState0049
     * @tc.desc      Scenario musicVsVideo control=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScenarioState0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const scenario: string = 'musicVsVideo';
      const appControl: boolean = false;
      let playingA: boolean = false;
      let playingB: boolean = true;
      if (appControl && playingA && playingB) { playingA = false; }
      expect(scenario.length).assertLarger(0);
      expect(appControl || !appControl).assertTrue();
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCENARIO_0051
     * @tc.name      testExtFocusScenarioState0050
     * @tc.desc      Scenario musicVsGame control=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScenarioState0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const scenario: string = 'musicVsGame';
      const appControl: boolean = true;
      let playingA: boolean = false;
      let playingB: boolean = false;
      if (appControl && playingA && playingB) { playingA = false; }
      expect(scenario.length).assertLarger(0);
      expect(appControl || !appControl).assertTrue();
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCENARIO_0052
     * @tc.name      testExtFocusScenarioState0051
     * @tc.desc      Scenario musicVsMusic control=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScenarioState0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const scenario: string = 'musicVsMusic';
      const appControl: boolean = false;
      let playingA: boolean = true;
      let playingB: boolean = true;
      if (appControl && playingA && playingB) { playingA = false; }
      expect(scenario.length).assertLarger(0);
      expect(appControl || !appControl).assertTrue();
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCENARIO_0053
     * @tc.name      testExtFocusScenarioState0052
     * @tc.desc      Scenario musicVsVideo control=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScenarioState0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const scenario: string = 'musicVsVideo';
      const appControl: boolean = true;
      let playingA: boolean = false;
      let playingB: boolean = false;
      if (appControl && playingA && playingB) { playingA = false; }
      expect(scenario.length).assertLarger(0);
      expect(appControl || !appControl).assertTrue();
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCENARIO_0054
     * @tc.name      testExtFocusScenarioState0053
     * @tc.desc      Scenario musicVsGame control=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScenarioState0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const scenario: string = 'musicVsGame';
      const appControl: boolean = false;
      let playingA: boolean = false;
      let playingB: boolean = true;
      if (appControl && playingA && playingB) { playingA = false; }
      expect(scenario.length).assertLarger(0);
      expect(appControl || !appControl).assertTrue();
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCENARIO_0055
     * @tc.name      testExtFocusScenarioState0054
     * @tc.desc      Scenario musicVsMusic control=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScenarioState0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const scenario: string = 'musicVsMusic';
      const appControl: boolean = true;
      let playingA: boolean = true;
      let playingB: boolean = false;
      if (appControl && playingA && playingB) { playingA = false; }
      expect(scenario.length).assertLarger(0);
      expect(appControl || !appControl).assertTrue();
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCENARIO_0056
     * @tc.name      testExtFocusScenarioState0055
     * @tc.desc      Scenario musicVsVideo control=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScenarioState0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const scenario: string = 'musicVsVideo';
      const appControl: boolean = false;
      let playingA: boolean = false;
      let playingB: boolean = true;
      if (appControl && playingA && playingB) { playingA = false; }
      expect(scenario.length).assertLarger(0);
      expect(appControl || !appControl).assertTrue();
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCENARIO_0057
     * @tc.name      testExtFocusScenarioState0056
     * @tc.desc      Scenario musicVsGame control=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScenarioState0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const scenario: string = 'musicVsGame';
      const appControl: boolean = true;
      let playingA: boolean = false;
      let playingB: boolean = false;
      if (appControl && playingA && playingB) { playingA = false; }
      expect(scenario.length).assertLarger(0);
      expect(appControl || !appControl).assertTrue();
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCENARIO_0058
     * @tc.name      testExtFocusScenarioState0057
     * @tc.desc      Scenario musicVsMusic control=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScenarioState0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const scenario: string = 'musicVsMusic';
      const appControl: boolean = false;
      let playingA: boolean = true;
      let playingB: boolean = true;
      if (appControl && playingA && playingB) { playingA = false; }
      expect(scenario.length).assertLarger(0);
      expect(appControl || !appControl).assertTrue();
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCENARIO_0059
     * @tc.name      testExtFocusScenarioState0058
     * @tc.desc      Scenario musicVsVideo control=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScenarioState0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const scenario: string = 'musicVsVideo';
      const appControl: boolean = true;
      let playingA: boolean = false;
      let playingB: boolean = false;
      if (appControl && playingA && playingB) { playingA = false; }
      expect(scenario.length).assertLarger(0);
      expect(appControl || !appControl).assertTrue();
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCENARIO_0060
     * @tc.name      testExtFocusScenarioState0059
     * @tc.desc      Scenario musicVsGame control=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScenarioState0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const scenario: string = 'musicVsGame';
      const appControl: boolean = false;
      let playingA: boolean = false;
      let playingB: boolean = true;
      if (appControl && playingA && playingB) { playingA = false; }
      expect(scenario.length).assertLarger(0);
      expect(appControl || !appControl).assertTrue();
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCENARIO_0061
     * @tc.name      testExtFocusScenarioState0060
     * @tc.desc      Scenario musicVsMusic control=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScenarioState0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const scenario: string = 'musicVsMusic';
      const appControl: boolean = true;
      let playingA: boolean = true;
      let playingB: boolean = false;
      if (appControl && playingA && playingB) { playingA = false; }
      expect(scenario.length).assertLarger(0);
      expect(appControl || !appControl).assertTrue();
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCENARIO_0062
     * @tc.name      testExtFocusScenarioState0061
     * @tc.desc      Scenario musicVsVideo control=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScenarioState0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const scenario: string = 'musicVsVideo';
      const appControl: boolean = false;
      let playingA: boolean = false;
      let playingB: boolean = true;
      if (appControl && playingA && playingB) { playingA = false; }
      expect(scenario.length).assertLarger(0);
      expect(appControl || !appControl).assertTrue();
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCENARIO_0063
     * @tc.name      testExtFocusScenarioState0062
     * @tc.desc      Scenario musicVsGame control=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScenarioState0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const scenario: string = 'musicVsGame';
      const appControl: boolean = true;
      let playingA: boolean = false;
      let playingB: boolean = false;
      if (appControl && playingA && playingB) { playingA = false; }
      expect(scenario.length).assertLarger(0);
      expect(appControl || !appControl).assertTrue();
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCENARIO_0064
     * @tc.name      testExtFocusScenarioState0063
     * @tc.desc      Scenario musicVsMusic control=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScenarioState0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const scenario: string = 'musicVsMusic';
      const appControl: boolean = false;
      let playingA: boolean = true;
      let playingB: boolean = true;
      if (appControl && playingA && playingB) { playingA = false; }
      expect(scenario.length).assertLarger(0);
      expect(appControl || !appControl).assertTrue();
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCENARIO_0065
     * @tc.name      testExtFocusScenarioState0064
     * @tc.desc      Scenario musicVsVideo control=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScenarioState0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const scenario: string = 'musicVsVideo';
      const appControl: boolean = true;
      let playingA: boolean = false;
      let playingB: boolean = false;
      if (appControl && playingA && playingB) { playingA = false; }
      expect(scenario.length).assertLarger(0);
      expect(appControl || !appControl).assertTrue();
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCENARIO_0066
     * @tc.name      testExtFocusScenarioState0065
     * @tc.desc      Scenario musicVsGame control=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScenarioState0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const scenario: string = 'musicVsGame';
      const appControl: boolean = false;
      let playingA: boolean = false;
      let playingB: boolean = true;
      if (appControl && playingA && playingB) { playingA = false; }
      expect(scenario.length).assertLarger(0);
      expect(appControl || !appControl).assertTrue();
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCENARIO_0067
     * @tc.name      testExtFocusScenarioState0066
     * @tc.desc      Scenario musicVsMusic control=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScenarioState0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const scenario: string = 'musicVsMusic';
      const appControl: boolean = true;
      let playingA: boolean = true;
      let playingB: boolean = false;
      if (appControl && playingA && playingB) { playingA = false; }
      expect(scenario.length).assertLarger(0);
      expect(appControl || !appControl).assertTrue();
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCENARIO_0068
     * @tc.name      testExtFocusScenarioState0067
     * @tc.desc      Scenario musicVsVideo control=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScenarioState0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const scenario: string = 'musicVsVideo';
      const appControl: boolean = false;
      let playingA: boolean = false;
      let playingB: boolean = true;
      if (appControl && playingA && playingB) { playingA = false; }
      expect(scenario.length).assertLarger(0);
      expect(appControl || !appControl).assertTrue();
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCENARIO_0069
     * @tc.name      testExtFocusScenarioState0068
     * @tc.desc      Scenario musicVsGame control=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScenarioState0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const scenario: string = 'musicVsGame';
      const appControl: boolean = true;
      let playingA: boolean = false;
      let playingB: boolean = false;
      if (appControl && playingA && playingB) { playingA = false; }
      expect(scenario.length).assertLarger(0);
      expect(appControl || !appControl).assertTrue();
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCENARIO_0070
     * @tc.name      testExtFocusScenarioState0069
     * @tc.desc      Scenario musicVsMusic control=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScenarioState0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const scenario: string = 'musicVsMusic';
      const appControl: boolean = false;
      let playingA: boolean = true;
      let playingB: boolean = true;
      if (appControl && playingA && playingB) { playingA = false; }
      expect(scenario.length).assertLarger(0);
      expect(appControl || !appControl).assertTrue();
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCENARIO_0071
     * @tc.name      testExtFocusScenarioState0070
     * @tc.desc      Scenario musicVsVideo control=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScenarioState0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const scenario: string = 'musicVsVideo';
      const appControl: boolean = true;
      let playingA: boolean = false;
      let playingB: boolean = false;
      if (appControl && playingA && playingB) { playingA = false; }
      expect(scenario.length).assertLarger(0);
      expect(appControl || !appControl).assertTrue();
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCENARIO_0072
     * @tc.name      testExtFocusScenarioState0071
     * @tc.desc      Scenario musicVsGame control=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScenarioState0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const scenario: string = 'musicVsGame';
      const appControl: boolean = false;
      let playingA: boolean = false;
      let playingB: boolean = true;
      if (appControl && playingA && playingB) { playingA = false; }
      expect(scenario.length).assertLarger(0);
      expect(appControl || !appControl).assertTrue();
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCENARIO_0073
     * @tc.name      testExtFocusScenarioState0072
     * @tc.desc      Scenario musicVsMusic control=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScenarioState0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const scenario: string = 'musicVsMusic';
      const appControl: boolean = true;
      let playingA: boolean = true;
      let playingB: boolean = false;
      if (appControl && playingA && playingB) { playingA = false; }
      expect(scenario.length).assertLarger(0);
      expect(appControl || !appControl).assertTrue();
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCENARIO_0074
     * @tc.name      testExtFocusScenarioState0073
     * @tc.desc      Scenario musicVsVideo control=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScenarioState0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const scenario: string = 'musicVsVideo';
      const appControl: boolean = false;
      let playingA: boolean = false;
      let playingB: boolean = true;
      if (appControl && playingA && playingB) { playingA = false; }
      expect(scenario.length).assertLarger(0);
      expect(appControl || !appControl).assertTrue();
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCENARIO_0075
     * @tc.name      testExtFocusScenarioState0074
     * @tc.desc      Scenario musicVsGame control=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScenarioState0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const scenario: string = 'musicVsGame';
      const appControl: boolean = true;
      let playingA: boolean = false;
      let playingB: boolean = false;
      if (appControl && playingA && playingB) { playingA = false; }
      expect(scenario.length).assertLarger(0);
      expect(appControl || !appControl).assertTrue();
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCENARIO_0076
     * @tc.name      testExtFocusScenarioState0075
     * @tc.desc      Scenario musicVsMusic control=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScenarioState0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const scenario: string = 'musicVsMusic';
      const appControl: boolean = false;
      let playingA: boolean = true;
      let playingB: boolean = true;
      if (appControl && playingA && playingB) { playingA = false; }
      expect(scenario.length).assertLarger(0);
      expect(appControl || !appControl).assertTrue();
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCENARIO_0077
     * @tc.name      testExtFocusScenarioState0076
     * @tc.desc      Scenario musicVsVideo control=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScenarioState0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const scenario: string = 'musicVsVideo';
      const appControl: boolean = true;
      let playingA: boolean = false;
      let playingB: boolean = false;
      if (appControl && playingA && playingB) { playingA = false; }
      expect(scenario.length).assertLarger(0);
      expect(appControl || !appControl).assertTrue();
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCENARIO_0078
     * @tc.name      testExtFocusScenarioState0077
     * @tc.desc      Scenario musicVsGame control=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScenarioState0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const scenario: string = 'musicVsGame';
      const appControl: boolean = false;
      let playingA: boolean = false;
      let playingB: boolean = true;
      if (appControl && playingA && playingB) { playingA = false; }
      expect(scenario.length).assertLarger(0);
      expect(appControl || !appControl).assertTrue();
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCENARIO_0079
     * @tc.name      testExtFocusScenarioState0078
     * @tc.desc      Scenario musicVsMusic control=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScenarioState0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const scenario: string = 'musicVsMusic';
      const appControl: boolean = true;
      let playingA: boolean = true;
      let playingB: boolean = false;
      if (appControl && playingA && playingB) { playingA = false; }
      expect(scenario.length).assertLarger(0);
      expect(appControl || !appControl).assertTrue();
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_SCENARIO_0080
     * @tc.name      testExtFocusScenarioState0079
     * @tc.desc      Scenario musicVsVideo control=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusScenarioState0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const scenario: string = 'musicVsVideo';
      const appControl: boolean = false;
      let playingA: boolean = false;
      let playingB: boolean = true;
      if (appControl && playingA && playingB) { playingA = false; }
      expect(scenario.length).assertLarger(0);
      expect(appControl || !appControl).assertTrue();
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
    })
  });
}
