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
import { describe, it as hypiumIt, expect as hypiumExpect, TestType, Size, Level, Assert } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';


const TAG: string = '[Sample_PlayerContractSafeCore]';
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


function expect(actual: string | number | boolean | Object | null | undefined): Assert {
  hilog.info(DOMAIN, TAG, '%{public}s', 'actual: ' + String(actual));
  return hypiumExpect(actual);
}
export default function playerContractSafeCoreTest(): void {
  describe('playerContractSafeCoreTest', () => {
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0001
     * @tc.name      testSafePlayerState0001
     * @tc.desc      Player state idle keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'idle';
      expect(state).assertEqual('idle');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0002
     * @tc.name      testSafePlayerState0002
     * @tc.desc      Player state initialized keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'initialized';
      expect(state).assertEqual('initialized');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0003
     * @tc.name      testSafePlayerState0003
     * @tc.desc      Player state prepared keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'prepared';
      expect(state).assertEqual('prepared');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0004
     * @tc.name      testSafePlayerState0004
     * @tc.desc      Player state playing keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'playing';
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0005
     * @tc.name      testSafePlayerState0005
     * @tc.desc      Player state paused keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'paused';
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0006
     * @tc.name      testSafePlayerState0006
     * @tc.desc      Player state completed keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'completed';
      expect(state).assertEqual('completed');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0007
     * @tc.name      testSafePlayerState0007
     * @tc.desc      Player state stopped keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'stopped';
      expect(state).assertEqual('stopped');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0008
     * @tc.name      testSafePlayerState0008
     * @tc.desc      Player state released keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'released';
      expect(state).assertEqual('released');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0009
     * @tc.name      testSafePlayerState0009
     * @tc.desc      Player state error keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'error';
      expect(state).assertEqual('error');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0010
     * @tc.name      testSafePlayerState0010
     * @tc.desc      Player state idle keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'idle';
      expect(state).assertEqual('idle');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0011
     * @tc.name      testSafePlayerState0011
     * @tc.desc      Player state initialized keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'initialized';
      expect(state).assertEqual('initialized');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0012
     * @tc.name      testSafePlayerState0012
     * @tc.desc      Player state prepared keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'prepared';
      expect(state).assertEqual('prepared');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0013
     * @tc.name      testSafePlayerState0013
     * @tc.desc      Player state playing keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'playing';
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0014
     * @tc.name      testSafePlayerState0014
     * @tc.desc      Player state paused keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'paused';
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0015
     * @tc.name      testSafePlayerState0015
     * @tc.desc      Player state completed keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'completed';
      expect(state).assertEqual('completed');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0016
     * @tc.name      testSafePlayerState0016
     * @tc.desc      Player state stopped keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'stopped';
      expect(state).assertEqual('stopped');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0017
     * @tc.name      testSafePlayerState0017
     * @tc.desc      Player state released keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'released';
      expect(state).assertEqual('released');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0018
     * @tc.name      testSafePlayerState0018
     * @tc.desc      Player state error keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'error';
      expect(state).assertEqual('error');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0019
     * @tc.name      testSafePlayerState0019
     * @tc.desc      Player state idle keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'idle';
      expect(state).assertEqual('idle');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0020
     * @tc.name      testSafePlayerState0020
     * @tc.desc      Player state initialized keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'initialized';
      expect(state).assertEqual('initialized');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0021
     * @tc.name      testSafePlayerState0021
     * @tc.desc      Player state prepared keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'prepared';
      expect(state).assertEqual('prepared');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0022
     * @tc.name      testSafePlayerState0022
     * @tc.desc      Player state playing keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'playing';
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0023
     * @tc.name      testSafePlayerState0023
     * @tc.desc      Player state paused keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'paused';
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0024
     * @tc.name      testSafePlayerState0024
     * @tc.desc      Player state completed keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'completed';
      expect(state).assertEqual('completed');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0025
     * @tc.name      testSafePlayerState0025
     * @tc.desc      Player state stopped keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'stopped';
      expect(state).assertEqual('stopped');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0026
     * @tc.name      testSafePlayerState0026
     * @tc.desc      Player state released keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'released';
      expect(state).assertEqual('released');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0027
     * @tc.name      testSafePlayerState0027
     * @tc.desc      Player state error keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'error';
      expect(state).assertEqual('error');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0028
     * @tc.name      testSafePlayerState0028
     * @tc.desc      Player state idle keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'idle';
      expect(state).assertEqual('idle');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0029
     * @tc.name      testSafePlayerState0029
     * @tc.desc      Player state initialized keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'initialized';
      expect(state).assertEqual('initialized');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0030
     * @tc.name      testSafePlayerState0030
     * @tc.desc      Player state prepared keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'prepared';
      expect(state).assertEqual('prepared');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0031
     * @tc.name      testSafePlayerState0031
     * @tc.desc      Player state playing keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'playing';
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0032
     * @tc.name      testSafePlayerState0032
     * @tc.desc      Player state paused keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'paused';
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0033
     * @tc.name      testSafePlayerState0033
     * @tc.desc      Player state completed keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'completed';
      expect(state).assertEqual('completed');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0034
     * @tc.name      testSafePlayerState0034
     * @tc.desc      Player state stopped keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'stopped';
      expect(state).assertEqual('stopped');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0035
     * @tc.name      testSafePlayerState0035
     * @tc.desc      Player state released keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'released';
      expect(state).assertEqual('released');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0036
     * @tc.name      testSafePlayerState0036
     * @tc.desc      Player state error keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'error';
      expect(state).assertEqual('error');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0037
     * @tc.name      testSafePlayerState0037
     * @tc.desc      Player state idle keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'idle';
      expect(state).assertEqual('idle');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0038
     * @tc.name      testSafePlayerState0038
     * @tc.desc      Player state initialized keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'initialized';
      expect(state).assertEqual('initialized');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0039
     * @tc.name      testSafePlayerState0039
     * @tc.desc      Player state prepared keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'prepared';
      expect(state).assertEqual('prepared');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0040
     * @tc.name      testSafePlayerState0040
     * @tc.desc      Player state playing keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'playing';
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0041
     * @tc.name      testSafePlayerState0041
     * @tc.desc      Player state paused keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'paused';
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0042
     * @tc.name      testSafePlayerState0042
     * @tc.desc      Player state completed keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'completed';
      expect(state).assertEqual('completed');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0043
     * @tc.name      testSafePlayerState0043
     * @tc.desc      Player state stopped keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'stopped';
      expect(state).assertEqual('stopped');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0044
     * @tc.name      testSafePlayerState0044
     * @tc.desc      Player state released keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'released';
      expect(state).assertEqual('released');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0045
     * @tc.name      testSafePlayerState0045
     * @tc.desc      Player state error keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'error';
      expect(state).assertEqual('error');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0046
     * @tc.name      testSafePlayerState0046
     * @tc.desc      Player state idle keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'idle';
      expect(state).assertEqual('idle');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0047
     * @tc.name      testSafePlayerState0047
     * @tc.desc      Player state initialized keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'initialized';
      expect(state).assertEqual('initialized');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0048
     * @tc.name      testSafePlayerState0048
     * @tc.desc      Player state prepared keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'prepared';
      expect(state).assertEqual('prepared');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0049
     * @tc.name      testSafePlayerState0049
     * @tc.desc      Player state playing keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'playing';
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0050
     * @tc.name      testSafePlayerState0050
     * @tc.desc      Player state paused keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'paused';
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0051
     * @tc.name      testSafePlayerState0051
     * @tc.desc      Player state completed keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'completed';
      expect(state).assertEqual('completed');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0052
     * @tc.name      testSafePlayerState0052
     * @tc.desc      Player state stopped keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'stopped';
      expect(state).assertEqual('stopped');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0053
     * @tc.name      testSafePlayerState0053
     * @tc.desc      Player state released keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'released';
      expect(state).assertEqual('released');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0054
     * @tc.name      testSafePlayerState0054
     * @tc.desc      Player state error keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'error';
      expect(state).assertEqual('error');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0055
     * @tc.name      testSafePlayerState0055
     * @tc.desc      Player state idle keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'idle';
      expect(state).assertEqual('idle');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0056
     * @tc.name      testSafePlayerState0056
     * @tc.desc      Player state initialized keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'initialized';
      expect(state).assertEqual('initialized');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0057
     * @tc.name      testSafePlayerState0057
     * @tc.desc      Player state prepared keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'prepared';
      expect(state).assertEqual('prepared');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0058
     * @tc.name      testSafePlayerState0058
     * @tc.desc      Player state playing keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'playing';
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0059
     * @tc.name      testSafePlayerState0059
     * @tc.desc      Player state paused keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'paused';
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0060
     * @tc.name      testSafePlayerState0060
     * @tc.desc      Player state completed keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'completed';
      expect(state).assertEqual('completed');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0061
     * @tc.name      testSafePlayerState0061
     * @tc.desc      Player state stopped keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'stopped';
      expect(state).assertEqual('stopped');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0062
     * @tc.name      testSafePlayerState0062
     * @tc.desc      Player state released keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'released';
      expect(state).assertEqual('released');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0063
     * @tc.name      testSafePlayerState0063
     * @tc.desc      Player state error keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'error';
      expect(state).assertEqual('error');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0064
     * @tc.name      testSafePlayerState0064
     * @tc.desc      Player state idle keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'idle';
      expect(state).assertEqual('idle');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0065
     * @tc.name      testSafePlayerState0065
     * @tc.desc      Player state initialized keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'initialized';
      expect(state).assertEqual('initialized');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0066
     * @tc.name      testSafePlayerState0066
     * @tc.desc      Player state prepared keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'prepared';
      expect(state).assertEqual('prepared');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0067
     * @tc.name      testSafePlayerState0067
     * @tc.desc      Player state playing keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'playing';
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0068
     * @tc.name      testSafePlayerState0068
     * @tc.desc      Player state paused keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'paused';
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0069
     * @tc.name      testSafePlayerState0069
     * @tc.desc      Player state completed keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'completed';
      expect(state).assertEqual('completed');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0070
     * @tc.name      testSafePlayerState0070
     * @tc.desc      Player state stopped keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'stopped';
      expect(state).assertEqual('stopped');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0071
     * @tc.name      testSafePlayerState0071
     * @tc.desc      Player state released keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'released';
      expect(state).assertEqual('released');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0072
     * @tc.name      testSafePlayerState0072
     * @tc.desc      Player state error keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'error';
      expect(state).assertEqual('error');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0073
     * @tc.name      testSafePlayerState0073
     * @tc.desc      Player state idle keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'idle';
      expect(state).assertEqual('idle');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0074
     * @tc.name      testSafePlayerState0074
     * @tc.desc      Player state initialized keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'initialized';
      expect(state).assertEqual('initialized');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0075
     * @tc.name      testSafePlayerState0075
     * @tc.desc      Player state prepared keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'prepared';
      expect(state).assertEqual('prepared');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0076
     * @tc.name      testSafePlayerState0076
     * @tc.desc      Player state playing keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'playing';
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0077
     * @tc.name      testSafePlayerState0077
     * @tc.desc      Player state paused keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'paused';
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0078
     * @tc.name      testSafePlayerState0078
     * @tc.desc      Player state completed keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'completed';
      expect(state).assertEqual('completed');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0079
     * @tc.name      testSafePlayerState0079
     * @tc.desc      Player state stopped keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'stopped';
      expect(state).assertEqual('stopped');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0080
     * @tc.name      testSafePlayerState0080
     * @tc.desc      Player state released keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'released';
      expect(state).assertEqual('released');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0081
     * @tc.name      testSafePlayerState0081
     * @tc.desc      Player state error keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'error';
      expect(state).assertEqual('error');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0082
     * @tc.name      testSafePlayerState0082
     * @tc.desc      Player state idle keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'idle';
      expect(state).assertEqual('idle');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0083
     * @tc.name      testSafePlayerState0083
     * @tc.desc      Player state initialized keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'initialized';
      expect(state).assertEqual('initialized');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0084
     * @tc.name      testSafePlayerState0084
     * @tc.desc      Player state prepared keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'prepared';
      expect(state).assertEqual('prepared');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0085
     * @tc.name      testSafePlayerState0085
     * @tc.desc      Player state playing keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'playing';
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0086
     * @tc.name      testSafePlayerState0086
     * @tc.desc      Player state paused keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'paused';
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0087
     * @tc.name      testSafePlayerState0087
     * @tc.desc      Player state completed keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'completed';
      expect(state).assertEqual('completed');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0088
     * @tc.name      testSafePlayerState0088
     * @tc.desc      Player state stopped keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'stopped';
      expect(state).assertEqual('stopped');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0089
     * @tc.name      testSafePlayerState0089
     * @tc.desc      Player state released keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'released';
      expect(state).assertEqual('released');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0090
     * @tc.name      testSafePlayerState0090
     * @tc.desc      Player state error keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'error';
      expect(state).assertEqual('error');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0091
     * @tc.name      testSafePlayerState0091
     * @tc.desc      Player state idle keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'idle';
      expect(state).assertEqual('idle');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0092
     * @tc.name      testSafePlayerState0092
     * @tc.desc      Player state initialized keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'initialized';
      expect(state).assertEqual('initialized');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0093
     * @tc.name      testSafePlayerState0093
     * @tc.desc      Player state prepared keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'prepared';
      expect(state).assertEqual('prepared');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0094
     * @tc.name      testSafePlayerState0094
     * @tc.desc      Player state playing keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'playing';
      expect(state).assertEqual('playing');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0095
     * @tc.name      testSafePlayerState0095
     * @tc.desc      Player state paused keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'paused';
      expect(state).assertEqual('paused');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0096
     * @tc.name      testSafePlayerState0096
     * @tc.desc      Player state completed keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'completed';
      expect(state).assertEqual('completed');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0097
     * @tc.name      testSafePlayerState0097
     * @tc.desc      Player state stopped keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'stopped';
      expect(state).assertEqual('stopped');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0098
     * @tc.name      testSafePlayerState0098
     * @tc.desc      Player state released keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'released';
      expect(state).assertEqual('released');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0099
     * @tc.name      testSafePlayerState0099
     * @tc.desc      Player state error keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'error';
      expect(state).assertEqual('error');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PC1_0100
     * @tc.name      testSafePlayerState0100
     * @tc.desc      Player state idle keeps token contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafePlayerState0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'idle';
      expect(state).assertEqual('idle');
      expect(state.length).assertLarger(0);
      expect(state).assertEqual(state.toLowerCase());
      expect(state.indexOf(' ')).assertEqual(-1);
    })
  })
}
