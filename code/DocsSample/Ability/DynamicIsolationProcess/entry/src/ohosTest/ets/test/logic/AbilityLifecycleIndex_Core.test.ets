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

import { describe, expect, it, beforeAll, afterAll, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { IsolationModel } from '../Shared/IsolationFixtures';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_dynamicisolationprocess]';
const BUNDLE: string = 'DynamicIsolationProcess_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for abilityLifecycleIndex (50 cases). */
export default function abilityLifecycleIndexCoreTest(): void {
  describe('AbilityLifecycleIndexCoreTest', () => {
    beforeAll(() => {
      logInfo(`${BUNDLE}AbilityLifecycleIndexCoreTest begin`);
    });
    afterAll(() => {
      logInfo(`${BUNDLE}AbilityLifecycleIndexCoreTest end`);
    });
    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ABILITY_LIFECYCLE_INDEX_CORE_0001
     * @tc.name      DynamicIsolationProcess_abilityLifecycleIndex_Core_0001
     * @tc.desc      [PlainString] Verify abilityLifecycleIndex(onCreate) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('DynamicIsolationProcess_abilityLifecycleIndex_Core_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Category: PlainString; expected: 0
      const actual: number = IsolationModel.abilityLifecycleIndex('onCreate');
      expect(actual).assertEqual(0);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ABILITY_LIFECYCLE_INDEX_CORE_0002
     * @tc.name      DynamicIsolationProcess_abilityLifecycleIndex_Core_0002
     * @tc.desc      [PlainString] Verify abilityLifecycleIndex(onWindowStageCreate) returns 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_abilityLifecycleIndex_Core_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString; expected: 1
      const actual: number = IsolationModel.abilityLifecycleIndex('onWindowStageCreate');
      expect(actual).assertEqual(1);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ABILITY_LIFECYCLE_INDEX_CORE_0003
     * @tc.name      DynamicIsolationProcess_abilityLifecycleIndex_Core_0003
     * @tc.desc      [PlainString] Verify abilityLifecycleIndex(onForeground) returns 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_abilityLifecycleIndex_Core_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString; expected: 2
      const actual: number = IsolationModel.abilityLifecycleIndex('onForeground');
      expect(actual).assertEqual(2);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ABILITY_LIFECYCLE_INDEX_CORE_0004
     * @tc.name      DynamicIsolationProcess_abilityLifecycleIndex_Core_0004
     * @tc.desc      [PlainString] Verify abilityLifecycleIndex(onBackground) returns 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_abilityLifecycleIndex_Core_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString; expected: 3
      const actual: number = IsolationModel.abilityLifecycleIndex('onBackground');
      expect(actual).assertEqual(3);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ABILITY_LIFECYCLE_INDEX_CORE_0005
     * @tc.name      DynamicIsolationProcess_abilityLifecycleIndex_Core_0005
     * @tc.desc      [PlainString] Verify abilityLifecycleIndex(onWindowStageDestroy) returns 4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_abilityLifecycleIndex_Core_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString; expected: 4
      const actual: number = IsolationModel.abilityLifecycleIndex('onWindowStageDestroy');
      expect(actual).assertEqual(4);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ABILITY_LIFECYCLE_INDEX_CORE_0006
     * @tc.name      DynamicIsolationProcess_abilityLifecycleIndex_Core_0006
     * @tc.desc      [PlainString] Verify abilityLifecycleIndex(onDestroy) returns 5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_abilityLifecycleIndex_Core_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString; expected: 5
      const actual: number = IsolationModel.abilityLifecycleIndex('onDestroy');
      expect(actual).assertEqual(5);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ABILITY_LIFECYCLE_INDEX_CORE_0007
     * @tc.name      DynamicIsolationProcess_abilityLifecycleIndex_Core_0007
     * @tc.desc      [PlainString] Verify abilityLifecycleIndex(event0) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_abilityLifecycleIndex_Core_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString; expected: -1
      const actual: number = IsolationModel.abilityLifecycleIndex('event0');
      expect(actual).assertEqual(-1);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ABILITY_LIFECYCLE_INDEX_CORE_0008
     * @tc.name      DynamicIsolationProcess_abilityLifecycleIndex_Core_0008
     * @tc.desc      [PlainString] Verify abilityLifecycleIndex(event1) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_abilityLifecycleIndex_Core_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString; expected: -1
      const actual: number = IsolationModel.abilityLifecycleIndex('event1');
      expect(actual).assertEqual(-1);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ABILITY_LIFECYCLE_INDEX_CORE_0009
     * @tc.name      DynamicIsolationProcess_abilityLifecycleIndex_Core_0009
     * @tc.desc      [PlainString] Verify abilityLifecycleIndex(event2) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_abilityLifecycleIndex_Core_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString; expected: -1
      const actual: number = IsolationModel.abilityLifecycleIndex('event2');
      expect(actual).assertEqual(-1);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ABILITY_LIFECYCLE_INDEX_CORE_0010
     * @tc.name      DynamicIsolationProcess_abilityLifecycleIndex_Core_0010
     * @tc.desc      [PlainString] Verify abilityLifecycleIndex(event3) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_abilityLifecycleIndex_Core_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString; expected: -1
      const actual: number = IsolationModel.abilityLifecycleIndex('event3');
      expect(actual).assertEqual(-1);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ABILITY_LIFECYCLE_INDEX_CORE_0011
     * @tc.name      DynamicIsolationProcess_abilityLifecycleIndex_Core_0011
     * @tc.desc      [PlainString] Verify abilityLifecycleIndex(event4) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_abilityLifecycleIndex_Core_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString; expected: -1
      const actual: number = IsolationModel.abilityLifecycleIndex('event4');
      expect(actual).assertEqual(-1);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ABILITY_LIFECYCLE_INDEX_CORE_0012
     * @tc.name      DynamicIsolationProcess_abilityLifecycleIndex_Core_0012
     * @tc.desc      [PlainString] Verify abilityLifecycleIndex(event5) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_abilityLifecycleIndex_Core_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString; expected: -1
      const actual: number = IsolationModel.abilityLifecycleIndex('event5');
      expect(actual).assertEqual(-1);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ABILITY_LIFECYCLE_INDEX_CORE_0013
     * @tc.name      DynamicIsolationProcess_abilityLifecycleIndex_Core_0013
     * @tc.desc      [PlainString] Verify abilityLifecycleIndex(event6) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_abilityLifecycleIndex_Core_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString; expected: -1
      const actual: number = IsolationModel.abilityLifecycleIndex('event6');
      expect(actual).assertEqual(-1);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ABILITY_LIFECYCLE_INDEX_CORE_0014
     * @tc.name      DynamicIsolationProcess_abilityLifecycleIndex_Core_0014
     * @tc.desc      [PlainString] Verify abilityLifecycleIndex(event7) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_abilityLifecycleIndex_Core_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString; expected: -1
      const actual: number = IsolationModel.abilityLifecycleIndex('event7');
      expect(actual).assertEqual(-1);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ABILITY_LIFECYCLE_INDEX_CORE_0015
     * @tc.name      DynamicIsolationProcess_abilityLifecycleIndex_Core_0015
     * @tc.desc      [PlainString] Verify abilityLifecycleIndex(event8) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_abilityLifecycleIndex_Core_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString; expected: -1
      const actual: number = IsolationModel.abilityLifecycleIndex('event8');
      expect(actual).assertEqual(-1);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ABILITY_LIFECYCLE_INDEX_CORE_0016
     * @tc.name      DynamicIsolationProcess_abilityLifecycleIndex_Core_0016
     * @tc.desc      [PlainString] Verify abilityLifecycleIndex(event9) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_abilityLifecycleIndex_Core_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString; expected: -1
      const actual: number = IsolationModel.abilityLifecycleIndex('event9');
      expect(actual).assertEqual(-1);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ABILITY_LIFECYCLE_INDEX_CORE_0017
     * @tc.name      DynamicIsolationProcess_abilityLifecycleIndex_Core_0017
     * @tc.desc      [PlainString] Verify abilityLifecycleIndex(event10) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_abilityLifecycleIndex_Core_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString; expected: -1
      const actual: number = IsolationModel.abilityLifecycleIndex('event10');
      expect(actual).assertEqual(-1);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ABILITY_LIFECYCLE_INDEX_CORE_0018
     * @tc.name      DynamicIsolationProcess_abilityLifecycleIndex_Core_0018
     * @tc.desc      [PlainString] Verify abilityLifecycleIndex(event11) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_abilityLifecycleIndex_Core_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString; expected: -1
      const actual: number = IsolationModel.abilityLifecycleIndex('event11');
      expect(actual).assertEqual(-1);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ABILITY_LIFECYCLE_INDEX_CORE_0019
     * @tc.name      DynamicIsolationProcess_abilityLifecycleIndex_Core_0019
     * @tc.desc      [PlainString] Verify abilityLifecycleIndex(event12) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_abilityLifecycleIndex_Core_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString; expected: -1
      const actual: number = IsolationModel.abilityLifecycleIndex('event12');
      expect(actual).assertEqual(-1);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ABILITY_LIFECYCLE_INDEX_CORE_0020
     * @tc.name      DynamicIsolationProcess_abilityLifecycleIndex_Core_0020
     * @tc.desc      [PlainString] Verify abilityLifecycleIndex(event13) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_abilityLifecycleIndex_Core_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString; expected: -1
      const actual: number = IsolationModel.abilityLifecycleIndex('event13');
      expect(actual).assertEqual(-1);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ABILITY_LIFECYCLE_INDEX_CORE_0021
     * @tc.name      DynamicIsolationProcess_abilityLifecycleIndex_Core_0021
     * @tc.desc      [PlainString] Verify abilityLifecycleIndex(event14) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_abilityLifecycleIndex_Core_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString; expected: -1
      const actual: number = IsolationModel.abilityLifecycleIndex('event14');
      expect(actual).assertEqual(-1);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ABILITY_LIFECYCLE_INDEX_CORE_0022
     * @tc.name      DynamicIsolationProcess_abilityLifecycleIndex_Core_0022
     * @tc.desc      [PlainString] Verify abilityLifecycleIndex(event15) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_abilityLifecycleIndex_Core_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString; expected: -1
      const actual: number = IsolationModel.abilityLifecycleIndex('event15');
      expect(actual).assertEqual(-1);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ABILITY_LIFECYCLE_INDEX_CORE_0023
     * @tc.name      DynamicIsolationProcess_abilityLifecycleIndex_Core_0023
     * @tc.desc      [PlainString] Verify abilityLifecycleIndex(event16) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_abilityLifecycleIndex_Core_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString; expected: -1
      const actual: number = IsolationModel.abilityLifecycleIndex('event16');
      expect(actual).assertEqual(-1);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ABILITY_LIFECYCLE_INDEX_CORE_0024
     * @tc.name      DynamicIsolationProcess_abilityLifecycleIndex_Core_0024
     * @tc.desc      [PlainString] Verify abilityLifecycleIndex(event17) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_abilityLifecycleIndex_Core_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString; expected: -1
      const actual: number = IsolationModel.abilityLifecycleIndex('event17');
      expect(actual).assertEqual(-1);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ABILITY_LIFECYCLE_INDEX_CORE_0025
     * @tc.name      DynamicIsolationProcess_abilityLifecycleIndex_Core_0025
     * @tc.desc      [PlainString] Verify abilityLifecycleIndex(event18) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_abilityLifecycleIndex_Core_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString; expected: -1
      const actual: number = IsolationModel.abilityLifecycleIndex('event18');
      expect(actual).assertEqual(-1);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ABILITY_LIFECYCLE_INDEX_CORE_0026
     * @tc.name      DynamicIsolationProcess_abilityLifecycleIndex_Core_0026
     * @tc.desc      [PlainString] Verify abilityLifecycleIndex(event19) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_abilityLifecycleIndex_Core_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString; expected: -1
      const actual: number = IsolationModel.abilityLifecycleIndex('event19');
      expect(actual).assertEqual(-1);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ABILITY_LIFECYCLE_INDEX_CORE_0027
     * @tc.name      DynamicIsolationProcess_abilityLifecycleIndex_Core_0027
     * @tc.desc      [PlainString] Verify abilityLifecycleIndex(event20) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_abilityLifecycleIndex_Core_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString; expected: -1
      const actual: number = IsolationModel.abilityLifecycleIndex('event20');
      expect(actual).assertEqual(-1);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ABILITY_LIFECYCLE_INDEX_CORE_0028
     * @tc.name      DynamicIsolationProcess_abilityLifecycleIndex_Core_0028
     * @tc.desc      [PlainString] Verify abilityLifecycleIndex(event21) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_abilityLifecycleIndex_Core_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString; expected: -1
      const actual: number = IsolationModel.abilityLifecycleIndex('event21');
      expect(actual).assertEqual(-1);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ABILITY_LIFECYCLE_INDEX_CORE_0029
     * @tc.name      DynamicIsolationProcess_abilityLifecycleIndex_Core_0029
     * @tc.desc      [PlainString] Verify abilityLifecycleIndex(event22) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_abilityLifecycleIndex_Core_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString; expected: -1
      const actual: number = IsolationModel.abilityLifecycleIndex('event22');
      expect(actual).assertEqual(-1);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ABILITY_LIFECYCLE_INDEX_CORE_0030
     * @tc.name      DynamicIsolationProcess_abilityLifecycleIndex_Core_0030
     * @tc.desc      [PlainString] Verify abilityLifecycleIndex(event23) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_abilityLifecycleIndex_Core_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString; expected: -1
      const actual: number = IsolationModel.abilityLifecycleIndex('event23');
      expect(actual).assertEqual(-1);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ABILITY_LIFECYCLE_INDEX_CORE_0031
     * @tc.name      DynamicIsolationProcess_abilityLifecycleIndex_Core_0031
     * @tc.desc      [PlainString] Verify abilityLifecycleIndex(event24) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_abilityLifecycleIndex_Core_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString; expected: -1
      const actual: number = IsolationModel.abilityLifecycleIndex('event24');
      expect(actual).assertEqual(-1);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ABILITY_LIFECYCLE_INDEX_CORE_0032
     * @tc.name      DynamicIsolationProcess_abilityLifecycleIndex_Core_0032
     * @tc.desc      [PlainString] Verify abilityLifecycleIndex(event25) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_abilityLifecycleIndex_Core_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString; expected: -1
      const actual: number = IsolationModel.abilityLifecycleIndex('event25');
      expect(actual).assertEqual(-1);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ABILITY_LIFECYCLE_INDEX_CORE_0033
     * @tc.name      DynamicIsolationProcess_abilityLifecycleIndex_Core_0033
     * @tc.desc      [PlainString] Verify abilityLifecycleIndex(event26) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_abilityLifecycleIndex_Core_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString; expected: -1
      const actual: number = IsolationModel.abilityLifecycleIndex('event26');
      expect(actual).assertEqual(-1);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ABILITY_LIFECYCLE_INDEX_CORE_0034
     * @tc.name      DynamicIsolationProcess_abilityLifecycleIndex_Core_0034
     * @tc.desc      [PlainString] Verify abilityLifecycleIndex(event27) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_abilityLifecycleIndex_Core_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString; expected: -1
      const actual: number = IsolationModel.abilityLifecycleIndex('event27');
      expect(actual).assertEqual(-1);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ABILITY_LIFECYCLE_INDEX_CORE_0035
     * @tc.name      DynamicIsolationProcess_abilityLifecycleIndex_Core_0035
     * @tc.desc      [PlainString] Verify abilityLifecycleIndex(event28) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_abilityLifecycleIndex_Core_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString; expected: -1
      const actual: number = IsolationModel.abilityLifecycleIndex('event28');
      expect(actual).assertEqual(-1);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ABILITY_LIFECYCLE_INDEX_CORE_0036
     * @tc.name      DynamicIsolationProcess_abilityLifecycleIndex_Core_0036
     * @tc.desc      [PlainString] Verify abilityLifecycleIndex(event29) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_abilityLifecycleIndex_Core_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString; expected: -1
      const actual: number = IsolationModel.abilityLifecycleIndex('event29');
      expect(actual).assertEqual(-1);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ABILITY_LIFECYCLE_INDEX_CORE_0037
     * @tc.name      DynamicIsolationProcess_abilityLifecycleIndex_Core_0037
     * @tc.desc      [PlainString] Verify abilityLifecycleIndex(event30) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_abilityLifecycleIndex_Core_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString; expected: -1
      const actual: number = IsolationModel.abilityLifecycleIndex('event30');
      expect(actual).assertEqual(-1);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ABILITY_LIFECYCLE_INDEX_CORE_0038
     * @tc.name      DynamicIsolationProcess_abilityLifecycleIndex_Core_0038
     * @tc.desc      [PlainString] Verify abilityLifecycleIndex(event31) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_abilityLifecycleIndex_Core_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString; expected: -1
      const actual: number = IsolationModel.abilityLifecycleIndex('event31');
      expect(actual).assertEqual(-1);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ABILITY_LIFECYCLE_INDEX_CORE_0039
     * @tc.name      DynamicIsolationProcess_abilityLifecycleIndex_Core_0039
     * @tc.desc      [PlainString] Verify abilityLifecycleIndex(event32) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_abilityLifecycleIndex_Core_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString; expected: -1
      const actual: number = IsolationModel.abilityLifecycleIndex('event32');
      expect(actual).assertEqual(-1);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ABILITY_LIFECYCLE_INDEX_CORE_0040
     * @tc.name      DynamicIsolationProcess_abilityLifecycleIndex_Core_0040
     * @tc.desc      [PlainString] Verify abilityLifecycleIndex(event33) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_abilityLifecycleIndex_Core_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString; expected: -1
      const actual: number = IsolationModel.abilityLifecycleIndex('event33');
      expect(actual).assertEqual(-1);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ABILITY_LIFECYCLE_INDEX_CORE_0041
     * @tc.name      DynamicIsolationProcess_abilityLifecycleIndex_Core_0041
     * @tc.desc      [PlainString] Verify abilityLifecycleIndex(event34) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_abilityLifecycleIndex_Core_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString; expected: -1
      const actual: number = IsolationModel.abilityLifecycleIndex('event34');
      expect(actual).assertEqual(-1);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ABILITY_LIFECYCLE_INDEX_CORE_0042
     * @tc.name      DynamicIsolationProcess_abilityLifecycleIndex_Core_0042
     * @tc.desc      [PlainString] Verify abilityLifecycleIndex(event35) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_abilityLifecycleIndex_Core_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString; expected: -1
      const actual: number = IsolationModel.abilityLifecycleIndex('event35');
      expect(actual).assertEqual(-1);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ABILITY_LIFECYCLE_INDEX_CORE_0043
     * @tc.name      DynamicIsolationProcess_abilityLifecycleIndex_Core_0043
     * @tc.desc      [PlainString] Verify abilityLifecycleIndex(event36) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_abilityLifecycleIndex_Core_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString; expected: -1
      const actual: number = IsolationModel.abilityLifecycleIndex('event36');
      expect(actual).assertEqual(-1);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ABILITY_LIFECYCLE_INDEX_CORE_0044
     * @tc.name      DynamicIsolationProcess_abilityLifecycleIndex_Core_0044
     * @tc.desc      [PlainString] Verify abilityLifecycleIndex(event37) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_abilityLifecycleIndex_Core_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString; expected: -1
      const actual: number = IsolationModel.abilityLifecycleIndex('event37');
      expect(actual).assertEqual(-1);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ABILITY_LIFECYCLE_INDEX_CORE_0045
     * @tc.name      DynamicIsolationProcess_abilityLifecycleIndex_Core_0045
     * @tc.desc      [PlainString] Verify abilityLifecycleIndex(event38) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_abilityLifecycleIndex_Core_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString; expected: -1
      const actual: number = IsolationModel.abilityLifecycleIndex('event38');
      expect(actual).assertEqual(-1);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ABILITY_LIFECYCLE_INDEX_CORE_0046
     * @tc.name      DynamicIsolationProcess_abilityLifecycleIndex_Core_0046
     * @tc.desc      [PlainString] Verify abilityLifecycleIndex(event39) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_abilityLifecycleIndex_Core_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString; expected: -1
      const actual: number = IsolationModel.abilityLifecycleIndex('event39');
      expect(actual).assertEqual(-1);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ABILITY_LIFECYCLE_INDEX_CORE_0047
     * @tc.name      DynamicIsolationProcess_abilityLifecycleIndex_Core_0047
     * @tc.desc      [PlainString] Verify abilityLifecycleIndex(event40) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_abilityLifecycleIndex_Core_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString; expected: -1
      const actual: number = IsolationModel.abilityLifecycleIndex('event40');
      expect(actual).assertEqual(-1);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ABILITY_LIFECYCLE_INDEX_CORE_0048
     * @tc.name      DynamicIsolationProcess_abilityLifecycleIndex_Core_0048
     * @tc.desc      [PlainString] Verify abilityLifecycleIndex(event41) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_abilityLifecycleIndex_Core_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString; expected: -1
      const actual: number = IsolationModel.abilityLifecycleIndex('event41');
      expect(actual).assertEqual(-1);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ABILITY_LIFECYCLE_INDEX_CORE_0049
     * @tc.name      DynamicIsolationProcess_abilityLifecycleIndex_Core_0049
     * @tc.desc      [PlainString] Verify abilityLifecycleIndex(event42) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_abilityLifecycleIndex_Core_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString; expected: -1
      const actual: number = IsolationModel.abilityLifecycleIndex('event42');
      expect(actual).assertEqual(-1);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ABILITY_LIFECYCLE_INDEX_CORE_0050
     * @tc.name      DynamicIsolationProcess_abilityLifecycleIndex_Core_0050
     * @tc.desc      [PlainString] Verify abilityLifecycleIndex(event43) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_abilityLifecycleIndex_Core_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString; expected: -1
      const actual: number = IsolationModel.abilityLifecycleIndex('event43');
      expect(actual).assertEqual(-1);
      expect(typeof actual).assertEqual('number');
    });

  });
}
