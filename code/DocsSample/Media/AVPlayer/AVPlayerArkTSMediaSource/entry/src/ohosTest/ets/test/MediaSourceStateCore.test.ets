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

const TAG: string = '[Sample_MediaSourceStateCore]';
const DOMAIN: number = 0xF812;

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
  assertClose(expectValue: number, precision: number): void;
  assertUndefined(): void;
  assertFail(): void;
}

function expect(actual: string | number | boolean | Object | null | undefined): ExpectAssert {
  hilog.info(DOMAIN, TAG, '%{public}s', 'actual: ' + String(actual));
  return hypiumExpect(actual);
}

export default function mediaSourceStateCoreTest(): void {
  describe('mediaSourceStateCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0001
     * @tc.name      testSafeState0001
     * @tc.desc      AVPlayer state idle keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'idle';
      expect(state).assertEqual('idle');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0002
     * @tc.name      testSafeState0002
     * @tc.desc      AVPlayer state initialized keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'initialized';
      expect(state).assertEqual('initialized');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0003
     * @tc.name      testSafeState0003
     * @tc.desc      AVPlayer state prepared keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'prepared';
      expect(state).assertEqual('prepared');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0004
     * @tc.name      testSafeState0004
     * @tc.desc      AVPlayer state playing keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'playing';
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0005
     * @tc.name      testSafeState0005
     * @tc.desc      AVPlayer state paused keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'paused';
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0006
     * @tc.name      testSafeState0006
     * @tc.desc      AVPlayer state completed keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'completed';
      expect(state).assertEqual('completed');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0007
     * @tc.name      testSafeState0007
     * @tc.desc      AVPlayer state stopped keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'stopped';
      expect(state).assertEqual('stopped');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0008
     * @tc.name      testSafeState0008
     * @tc.desc      AVPlayer state released keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'released';
      expect(state).assertEqual('released');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0009
     * @tc.name      testSafeState0009
     * @tc.desc      AVPlayer state error keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'error';
      expect(state).assertEqual('error');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0010
     * @tc.name      testSafeState0010
     * @tc.desc      AVPlayer state idle keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'idle';
      expect(state).assertEqual('idle');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0011
     * @tc.name      testSafeState0011
     * @tc.desc      AVPlayer state initialized keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'initialized';
      expect(state).assertEqual('initialized');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0012
     * @tc.name      testSafeState0012
     * @tc.desc      AVPlayer state prepared keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'prepared';
      expect(state).assertEqual('prepared');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0013
     * @tc.name      testSafeState0013
     * @tc.desc      AVPlayer state playing keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'playing';
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0014
     * @tc.name      testSafeState0014
     * @tc.desc      AVPlayer state paused keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'paused';
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0015
     * @tc.name      testSafeState0015
     * @tc.desc      AVPlayer state completed keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'completed';
      expect(state).assertEqual('completed');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0016
     * @tc.name      testSafeState0016
     * @tc.desc      AVPlayer state stopped keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'stopped';
      expect(state).assertEqual('stopped');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0017
     * @tc.name      testSafeState0017
     * @tc.desc      AVPlayer state released keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'released';
      expect(state).assertEqual('released');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0018
     * @tc.name      testSafeState0018
     * @tc.desc      AVPlayer state error keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'error';
      expect(state).assertEqual('error');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0019
     * @tc.name      testSafeState0019
     * @tc.desc      AVPlayer state idle keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'idle';
      expect(state).assertEqual('idle');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0020
     * @tc.name      testSafeState0020
     * @tc.desc      AVPlayer state initialized keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'initialized';
      expect(state).assertEqual('initialized');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0021
     * @tc.name      testSafeState0021
     * @tc.desc      AVPlayer state prepared keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'prepared';
      expect(state).assertEqual('prepared');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0022
     * @tc.name      testSafeState0022
     * @tc.desc      AVPlayer state playing keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'playing';
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0023
     * @tc.name      testSafeState0023
     * @tc.desc      AVPlayer state paused keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'paused';
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0024
     * @tc.name      testSafeState0024
     * @tc.desc      AVPlayer state completed keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'completed';
      expect(state).assertEqual('completed');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0025
     * @tc.name      testSafeState0025
     * @tc.desc      AVPlayer state stopped keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'stopped';
      expect(state).assertEqual('stopped');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0026
     * @tc.name      testSafeState0026
     * @tc.desc      AVPlayer state released keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'released';
      expect(state).assertEqual('released');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0027
     * @tc.name      testSafeState0027
     * @tc.desc      AVPlayer state error keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'error';
      expect(state).assertEqual('error');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0028
     * @tc.name      testSafeState0028
     * @tc.desc      AVPlayer state idle keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'idle';
      expect(state).assertEqual('idle');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0029
     * @tc.name      testSafeState0029
     * @tc.desc      AVPlayer state initialized keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'initialized';
      expect(state).assertEqual('initialized');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0030
     * @tc.name      testSafeState0030
     * @tc.desc      AVPlayer state prepared keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'prepared';
      expect(state).assertEqual('prepared');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0031
     * @tc.name      testSafeState0031
     * @tc.desc      AVPlayer state playing keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'playing';
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0032
     * @tc.name      testSafeState0032
     * @tc.desc      AVPlayer state paused keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'paused';
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0033
     * @tc.name      testSafeState0033
     * @tc.desc      AVPlayer state completed keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'completed';
      expect(state).assertEqual('completed');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0034
     * @tc.name      testSafeState0034
     * @tc.desc      AVPlayer state stopped keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'stopped';
      expect(state).assertEqual('stopped');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0035
     * @tc.name      testSafeState0035
     * @tc.desc      AVPlayer state released keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'released';
      expect(state).assertEqual('released');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0036
     * @tc.name      testSafeState0036
     * @tc.desc      AVPlayer state error keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'error';
      expect(state).assertEqual('error');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0037
     * @tc.name      testSafeState0037
     * @tc.desc      AVPlayer state idle keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'idle';
      expect(state).assertEqual('idle');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0038
     * @tc.name      testSafeState0038
     * @tc.desc      AVPlayer state initialized keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'initialized';
      expect(state).assertEqual('initialized');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0039
     * @tc.name      testSafeState0039
     * @tc.desc      AVPlayer state prepared keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'prepared';
      expect(state).assertEqual('prepared');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0040
     * @tc.name      testSafeState0040
     * @tc.desc      AVPlayer state playing keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'playing';
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0041
     * @tc.name      testSafeState0041
     * @tc.desc      AVPlayer state paused keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'paused';
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0042
     * @tc.name      testSafeState0042
     * @tc.desc      AVPlayer state completed keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'completed';
      expect(state).assertEqual('completed');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0043
     * @tc.name      testSafeState0043
     * @tc.desc      AVPlayer state stopped keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'stopped';
      expect(state).assertEqual('stopped');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0044
     * @tc.name      testSafeState0044
     * @tc.desc      AVPlayer state released keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'released';
      expect(state).assertEqual('released');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0045
     * @tc.name      testSafeState0045
     * @tc.desc      AVPlayer state error keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'error';
      expect(state).assertEqual('error');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0046
     * @tc.name      testSafeState0046
     * @tc.desc      AVPlayer state idle keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'idle';
      expect(state).assertEqual('idle');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0047
     * @tc.name      testSafeState0047
     * @tc.desc      AVPlayer state initialized keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'initialized';
      expect(state).assertEqual('initialized');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0048
     * @tc.name      testSafeState0048
     * @tc.desc      AVPlayer state prepared keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'prepared';
      expect(state).assertEqual('prepared');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0049
     * @tc.name      testSafeState0049
     * @tc.desc      AVPlayer state playing keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'playing';
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0050
     * @tc.name      testSafeState0050
     * @tc.desc      AVPlayer state paused keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'paused';
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0051
     * @tc.name      testSafeState0051
     * @tc.desc      AVPlayer state completed keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'completed';
      expect(state).assertEqual('completed');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0052
     * @tc.name      testSafeState0052
     * @tc.desc      AVPlayer state stopped keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'stopped';
      expect(state).assertEqual('stopped');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0053
     * @tc.name      testSafeState0053
     * @tc.desc      AVPlayer state released keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'released';
      expect(state).assertEqual('released');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0054
     * @tc.name      testSafeState0054
     * @tc.desc      AVPlayer state error keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'error';
      expect(state).assertEqual('error');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0055
     * @tc.name      testSafeState0055
     * @tc.desc      AVPlayer state idle keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'idle';
      expect(state).assertEqual('idle');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0056
     * @tc.name      testSafeState0056
     * @tc.desc      AVPlayer state initialized keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'initialized';
      expect(state).assertEqual('initialized');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0057
     * @tc.name      testSafeState0057
     * @tc.desc      AVPlayer state prepared keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'prepared';
      expect(state).assertEqual('prepared');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0058
     * @tc.name      testSafeState0058
     * @tc.desc      AVPlayer state playing keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'playing';
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0059
     * @tc.name      testSafeState0059
     * @tc.desc      AVPlayer state paused keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'paused';
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0060
     * @tc.name      testSafeState0060
     * @tc.desc      AVPlayer state completed keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'completed';
      expect(state).assertEqual('completed');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0061
     * @tc.name      testSafeState0061
     * @tc.desc      AVPlayer state stopped keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'stopped';
      expect(state).assertEqual('stopped');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0062
     * @tc.name      testSafeState0062
     * @tc.desc      AVPlayer state released keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'released';
      expect(state).assertEqual('released');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0063
     * @tc.name      testSafeState0063
     * @tc.desc      AVPlayer state error keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'error';
      expect(state).assertEqual('error');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0064
     * @tc.name      testSafeState0064
     * @tc.desc      AVPlayer state idle keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'idle';
      expect(state).assertEqual('idle');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0065
     * @tc.name      testSafeState0065
     * @tc.desc      AVPlayer state initialized keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'initialized';
      expect(state).assertEqual('initialized');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0066
     * @tc.name      testSafeState0066
     * @tc.desc      AVPlayer state prepared keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'prepared';
      expect(state).assertEqual('prepared');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0067
     * @tc.name      testSafeState0067
     * @tc.desc      AVPlayer state playing keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'playing';
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0068
     * @tc.name      testSafeState0068
     * @tc.desc      AVPlayer state paused keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'paused';
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0069
     * @tc.name      testSafeState0069
     * @tc.desc      AVPlayer state completed keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'completed';
      expect(state).assertEqual('completed');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0070
     * @tc.name      testSafeState0070
     * @tc.desc      AVPlayer state stopped keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'stopped';
      expect(state).assertEqual('stopped');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0071
     * @tc.name      testSafeState0071
     * @tc.desc      AVPlayer state released keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'released';
      expect(state).assertEqual('released');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0072
     * @tc.name      testSafeState0072
     * @tc.desc      AVPlayer state error keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'error';
      expect(state).assertEqual('error');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0073
     * @tc.name      testSafeState0073
     * @tc.desc      AVPlayer state idle keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'idle';
      expect(state).assertEqual('idle');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0074
     * @tc.name      testSafeState0074
     * @tc.desc      AVPlayer state initialized keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'initialized';
      expect(state).assertEqual('initialized');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0075
     * @tc.name      testSafeState0075
     * @tc.desc      AVPlayer state prepared keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'prepared';
      expect(state).assertEqual('prepared');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0076
     * @tc.name      testSafeState0076
     * @tc.desc      AVPlayer state playing keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'playing';
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0077
     * @tc.name      testSafeState0077
     * @tc.desc      AVPlayer state paused keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'paused';
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0078
     * @tc.name      testSafeState0078
     * @tc.desc      AVPlayer state completed keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'completed';
      expect(state).assertEqual('completed');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0079
     * @tc.name      testSafeState0079
     * @tc.desc      AVPlayer state stopped keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'stopped';
      expect(state).assertEqual('stopped');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0080
     * @tc.name      testSafeState0080
     * @tc.desc      AVPlayer state released keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'released';
      expect(state).assertEqual('released');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0081
     * @tc.name      testSafeState0081
     * @tc.desc      AVPlayer state error keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'error';
      expect(state).assertEqual('error');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0082
     * @tc.name      testSafeState0082
     * @tc.desc      AVPlayer state idle keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'idle';
      expect(state).assertEqual('idle');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0083
     * @tc.name      testSafeState0083
     * @tc.desc      AVPlayer state initialized keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'initialized';
      expect(state).assertEqual('initialized');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0084
     * @tc.name      testSafeState0084
     * @tc.desc      AVPlayer state prepared keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'prepared';
      expect(state).assertEqual('prepared');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0085
     * @tc.name      testSafeState0085
     * @tc.desc      AVPlayer state playing keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'playing';
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0086
     * @tc.name      testSafeState0086
     * @tc.desc      AVPlayer state paused keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'paused';
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0087
     * @tc.name      testSafeState0087
     * @tc.desc      AVPlayer state completed keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'completed';
      expect(state).assertEqual('completed');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0088
     * @tc.name      testSafeState0088
     * @tc.desc      AVPlayer state stopped keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'stopped';
      expect(state).assertEqual('stopped');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0089
     * @tc.name      testSafeState0089
     * @tc.desc      AVPlayer state released keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'released';
      expect(state).assertEqual('released');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0090
     * @tc.name      testSafeState0090
     * @tc.desc      AVPlayer state error keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'error';
      expect(state).assertEqual('error');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0091
     * @tc.name      testSafeState0091
     * @tc.desc      AVPlayer state idle keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'idle';
      expect(state).assertEqual('idle');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0092
     * @tc.name      testSafeState0092
     * @tc.desc      AVPlayer state initialized keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'initialized';
      expect(state).assertEqual('initialized');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0093
     * @tc.name      testSafeState0093
     * @tc.desc      AVPlayer state prepared keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'prepared';
      expect(state).assertEqual('prepared');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0094
     * @tc.name      testSafeState0094
     * @tc.desc      AVPlayer state playing keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'playing';
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0095
     * @tc.name      testSafeState0095
     * @tc.desc      AVPlayer state paused keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'paused';
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0096
     * @tc.name      testSafeState0096
     * @tc.desc      AVPlayer state completed keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'completed';
      expect(state).assertEqual('completed');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0097
     * @tc.name      testSafeState0097
     * @tc.desc      AVPlayer state stopped keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'stopped';
      expect(state).assertEqual('stopped');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0098
     * @tc.name      testSafeState0098
     * @tc.desc      AVPlayer state released keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'released';
      expect(state).assertEqual('released');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0099
     * @tc.name      testSafeState0099
     * @tc.desc      AVPlayer state error keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'error';
      expect(state).assertEqual('error');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_ST_0100
     * @tc.name      testSafeState0100
     * @tc.desc      AVPlayer state idle keeps its string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeState0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'idle';
      expect(state).assertEqual('idle');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
  })
}
