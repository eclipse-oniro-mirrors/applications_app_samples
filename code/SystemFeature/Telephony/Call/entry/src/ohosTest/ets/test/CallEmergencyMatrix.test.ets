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

import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { EmergencyDirectory } from '../../../main/ets/model/DialValidator';

const DOMAIN: number = 0xF814;
const TAG: string = 'CallEmergencyMatrix';
const delegator: AbilityDelegatorRegistry.AbilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();

let caseCounter: number = 0;

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

// Breaking the JS micro-task chain every 20 cases: Hypium runs all `it` callbacks as
// promise continuations inside one native task, so a real async call is required to
// hand the main thread back to the EventHandler before THREAD_BLOCK_3S/6S fires.
async function yieldToMain(): Promise<void> {
  caseCounter++;
  if (caseCounter % 20 === 0) {
    try {
      await delegator.getCurrentTopAbility();
    } catch (error) {
      log('yield point failed');
    }
  }
}

export default function callEmergencyMatrixTest(): void {
  describe('CallEmergencyMatrix', () => {
    /**
     * @tc.number    SUB_CALL_EMERGENCY_0001
     * @tc.name      testByRegion0001
     * @tc.desc      byRegion(CN) returns 4 numbers
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testByRegion0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testByRegion0001 begin');
      const actual: string[] = EmergencyDirectory.byRegion('CN');
      expect(actual.length).assertEqual(4);
      expect(actual[0]).assertEqual('110');
      log('testByRegion0001 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0002
     * @tc.name      testContainsNumber0002
     * @tc.desc      CN contains emergency number 110
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testContainsNumber0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testContainsNumber0002 begin');
      const actual: boolean = EmergencyDirectory.containsNumber('CN', '110');
      expect(actual).assertTrue();
      log('testContainsNumber0002 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0003
     * @tc.name      testDescribeNumber0003
     * @tc.desc      describe(110) -> police
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDescribeNumber0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDescribeNumber0003 begin');
      const actual: string = EmergencyDirectory.describe('110');
      expect(actual).assertEqual('police');
      log('testDescribeNumber0003 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0004
     * @tc.name      testContainsNumber0004
     * @tc.desc      CN contains emergency number 119
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testContainsNumber0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testContainsNumber0004 begin');
      const actual: boolean = EmergencyDirectory.containsNumber('CN', '119');
      expect(actual).assertTrue();
      log('testContainsNumber0004 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0005
     * @tc.name      testDescribeNumber0005
     * @tc.desc      describe(119) -> fire
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDescribeNumber0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDescribeNumber0005 begin');
      const actual: string = EmergencyDirectory.describe('119');
      expect(actual).assertEqual('fire');
      log('testDescribeNumber0005 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0006
     * @tc.name      testContainsNumber0006
     * @tc.desc      CN contains emergency number 120
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testContainsNumber0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testContainsNumber0006 begin');
      const actual: boolean = EmergencyDirectory.containsNumber('CN', '120');
      expect(actual).assertTrue();
      log('testContainsNumber0006 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0007
     * @tc.name      testDescribeNumber0007
     * @tc.desc      describe(120) -> ambulance
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDescribeNumber0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDescribeNumber0007 begin');
      const actual: string = EmergencyDirectory.describe('120');
      expect(actual).assertEqual('ambulance');
      log('testDescribeNumber0007 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0008
     * @tc.name      testContainsNumber0008
     * @tc.desc      CN contains emergency number 122
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testContainsNumber0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testContainsNumber0008 begin');
      const actual: boolean = EmergencyDirectory.containsNumber('CN', '122');
      expect(actual).assertTrue();
      log('testContainsNumber0008 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0009
     * @tc.name      testDescribeNumber0009
     * @tc.desc      describe(122) -> generic
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDescribeNumber0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDescribeNumber0009 begin');
      const actual: string = EmergencyDirectory.describe('122');
      expect(actual).assertEqual('generic');
      log('testDescribeNumber0009 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0010
     * @tc.name      testRejectNumber0010
     * @tc.desc      CN rejects an ordinary number
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRejectNumber0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRejectNumber0010 begin');
      const actual: boolean = EmergencyDirectory.containsNumber('CN', '13800138000');
      expect(actual).assertFalse();
      log('testRejectNumber0010 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0011
     * @tc.name      testByRegion0011
     * @tc.desc      byRegion(US) returns 1 numbers
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testByRegion0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testByRegion0011 begin');
      const actual: string[] = EmergencyDirectory.byRegion('US');
      expect(actual.length).assertEqual(1);
      expect(actual[0]).assertEqual('911');
      log('testByRegion0011 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0012
     * @tc.name      testContainsNumber0012
     * @tc.desc      US contains emergency number 911
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testContainsNumber0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testContainsNumber0012 begin');
      const actual: boolean = EmergencyDirectory.containsNumber('US', '911');
      expect(actual).assertTrue();
      log('testContainsNumber0012 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0013
     * @tc.name      testDescribeNumber0013
     * @tc.desc      describe(911) -> generic
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDescribeNumber0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDescribeNumber0013 begin');
      const actual: string = EmergencyDirectory.describe('911');
      expect(actual).assertEqual('generic');
      log('testDescribeNumber0013 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0014
     * @tc.name      testRejectNumber0014
     * @tc.desc      US rejects an ordinary number
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRejectNumber0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRejectNumber0014 begin');
      const actual: boolean = EmergencyDirectory.containsNumber('US', '13800138000');
      expect(actual).assertFalse();
      log('testRejectNumber0014 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0015
     * @tc.name      testByRegion0015
     * @tc.desc      byRegion(GB) returns 2 numbers
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testByRegion0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testByRegion0015 begin');
      const actual: string[] = EmergencyDirectory.byRegion('GB');
      expect(actual.length).assertEqual(2);
      expect(actual[0]).assertEqual('999');
      log('testByRegion0015 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0016
     * @tc.name      testContainsNumber0016
     * @tc.desc      GB contains emergency number 999
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testContainsNumber0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testContainsNumber0016 begin');
      const actual: boolean = EmergencyDirectory.containsNumber('GB', '999');
      expect(actual).assertTrue();
      log('testContainsNumber0016 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0017
     * @tc.name      testDescribeNumber0017
     * @tc.desc      describe(999) -> generic
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDescribeNumber0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDescribeNumber0017 begin');
      const actual: string = EmergencyDirectory.describe('999');
      expect(actual).assertEqual('generic');
      log('testDescribeNumber0017 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0018
     * @tc.name      testContainsNumber0018
     * @tc.desc      GB contains emergency number 112
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testContainsNumber0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testContainsNumber0018 begin');
      const actual: boolean = EmergencyDirectory.containsNumber('GB', '112');
      expect(actual).assertTrue();
      log('testContainsNumber0018 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0019
     * @tc.name      testDescribeNumber0019
     * @tc.desc      describe(112) -> generic
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDescribeNumber0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDescribeNumber0019 begin');
      const actual: string = EmergencyDirectory.describe('112');
      expect(actual).assertEqual('generic');
      log('testDescribeNumber0019 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0020
     * @tc.name      testRejectNumber0020
     * @tc.desc      GB rejects an ordinary number
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRejectNumber0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRejectNumber0020 begin');
      const actual: boolean = EmergencyDirectory.containsNumber('GB', '13800138000');
      expect(actual).assertFalse();
      log('testRejectNumber0020 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0021
     * @tc.name      testByRegion0021
     * @tc.desc      byRegion(JP) returns 2 numbers
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testByRegion0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testByRegion0021 begin');
      const actual: string[] = EmergencyDirectory.byRegion('JP');
      expect(actual.length).assertEqual(2);
      expect(actual[0]).assertEqual('110');
      log('testByRegion0021 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0022
     * @tc.name      testContainsNumber0022
     * @tc.desc      JP contains emergency number 110
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testContainsNumber0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testContainsNumber0022 begin');
      const actual: boolean = EmergencyDirectory.containsNumber('JP', '110');
      expect(actual).assertTrue();
      log('testContainsNumber0022 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0023
     * @tc.name      testDescribeNumber0023
     * @tc.desc      describe(110) -> police
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDescribeNumber0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDescribeNumber0023 begin');
      const actual: string = EmergencyDirectory.describe('110');
      expect(actual).assertEqual('police');
      log('testDescribeNumber0023 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0024
     * @tc.name      testContainsNumber0024
     * @tc.desc      JP contains emergency number 119
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testContainsNumber0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testContainsNumber0024 begin');
      const actual: boolean = EmergencyDirectory.containsNumber('JP', '119');
      expect(actual).assertTrue();
      log('testContainsNumber0024 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0025
     * @tc.name      testDescribeNumber0025
     * @tc.desc      describe(119) -> fire
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDescribeNumber0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDescribeNumber0025 begin');
      const actual: string = EmergencyDirectory.describe('119');
      expect(actual).assertEqual('fire');
      log('testDescribeNumber0025 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0026
     * @tc.name      testRejectNumber0026
     * @tc.desc      JP rejects an ordinary number
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRejectNumber0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRejectNumber0026 begin');
      const actual: boolean = EmergencyDirectory.containsNumber('JP', '13800138000');
      expect(actual).assertFalse();
      log('testRejectNumber0026 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0027
     * @tc.name      testByRegion0027
     * @tc.desc      byRegion(DE) returns 2 numbers
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testByRegion0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testByRegion0027 begin');
      const actual: string[] = EmergencyDirectory.byRegion('DE');
      expect(actual.length).assertEqual(2);
      expect(actual[0]).assertEqual('110');
      log('testByRegion0027 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0028
     * @tc.name      testContainsNumber0028
     * @tc.desc      DE contains emergency number 110
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testContainsNumber0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testContainsNumber0028 begin');
      const actual: boolean = EmergencyDirectory.containsNumber('DE', '110');
      expect(actual).assertTrue();
      log('testContainsNumber0028 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0029
     * @tc.name      testDescribeNumber0029
     * @tc.desc      describe(110) -> police
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDescribeNumber0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDescribeNumber0029 begin');
      const actual: string = EmergencyDirectory.describe('110');
      expect(actual).assertEqual('police');
      log('testDescribeNumber0029 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0030
     * @tc.name      testContainsNumber0030
     * @tc.desc      DE contains emergency number 112
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testContainsNumber0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testContainsNumber0030 begin');
      const actual: boolean = EmergencyDirectory.containsNumber('DE', '112');
      expect(actual).assertTrue();
      log('testContainsNumber0030 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0031
     * @tc.name      testDescribeNumber0031
     * @tc.desc      describe(112) -> generic
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDescribeNumber0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDescribeNumber0031 begin');
      const actual: string = EmergencyDirectory.describe('112');
      expect(actual).assertEqual('generic');
      log('testDescribeNumber0031 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0032
     * @tc.name      testRejectNumber0032
     * @tc.desc      DE rejects an ordinary number
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRejectNumber0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRejectNumber0032 begin');
      const actual: boolean = EmergencyDirectory.containsNumber('DE', '13800138000');
      expect(actual).assertFalse();
      log('testRejectNumber0032 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0033
     * @tc.name      testByRegion0033
     * @tc.desc      byRegion(FR) returns 4 numbers
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testByRegion0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testByRegion0033 begin');
      const actual: string[] = EmergencyDirectory.byRegion('FR');
      expect(actual.length).assertEqual(4);
      expect(actual[0]).assertEqual('15');
      log('testByRegion0033 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0034
     * @tc.name      testContainsNumber0034
     * @tc.desc      FR contains emergency number 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testContainsNumber0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testContainsNumber0034 begin');
      const actual: boolean = EmergencyDirectory.containsNumber('FR', '15');
      expect(actual).assertTrue();
      log('testContainsNumber0034 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0035
     * @tc.name      testDescribeNumber0035
     * @tc.desc      describe(15) -> ambulance
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDescribeNumber0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDescribeNumber0035 begin');
      const actual: string = EmergencyDirectory.describe('15');
      expect(actual).assertEqual('ambulance');
      log('testDescribeNumber0035 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0036
     * @tc.name      testContainsNumber0036
     * @tc.desc      FR contains emergency number 17
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testContainsNumber0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testContainsNumber0036 begin');
      const actual: boolean = EmergencyDirectory.containsNumber('FR', '17');
      expect(actual).assertTrue();
      log('testContainsNumber0036 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0037
     * @tc.name      testDescribeNumber0037
     * @tc.desc      describe(17) -> police
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDescribeNumber0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDescribeNumber0037 begin');
      const actual: string = EmergencyDirectory.describe('17');
      expect(actual).assertEqual('police');
      log('testDescribeNumber0037 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0038
     * @tc.name      testContainsNumber0038
     * @tc.desc      FR contains emergency number 18
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testContainsNumber0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testContainsNumber0038 begin');
      const actual: boolean = EmergencyDirectory.containsNumber('FR', '18');
      expect(actual).assertTrue();
      log('testContainsNumber0038 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0039
     * @tc.name      testDescribeNumber0039
     * @tc.desc      describe(18) -> fire
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDescribeNumber0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDescribeNumber0039 begin');
      const actual: string = EmergencyDirectory.describe('18');
      expect(actual).assertEqual('fire');
      log('testDescribeNumber0039 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0040
     * @tc.name      testContainsNumber0040
     * @tc.desc      FR contains emergency number 112
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testContainsNumber0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testContainsNumber0040 begin');
      const actual: boolean = EmergencyDirectory.containsNumber('FR', '112');
      expect(actual).assertTrue();
      log('testContainsNumber0040 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0041
     * @tc.name      testDescribeNumber0041
     * @tc.desc      describe(112) -> generic
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDescribeNumber0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDescribeNumber0041 begin');
      const actual: string = EmergencyDirectory.describe('112');
      expect(actual).assertEqual('generic');
      log('testDescribeNumber0041 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0042
     * @tc.name      testRejectNumber0042
     * @tc.desc      FR rejects an ordinary number
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRejectNumber0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRejectNumber0042 begin');
      const actual: boolean = EmergencyDirectory.containsNumber('FR', '13800138000');
      expect(actual).assertFalse();
      log('testRejectNumber0042 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0043
     * @tc.name      testByRegion0043
     * @tc.desc      byRegion(IN) returns 4 numbers
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testByRegion0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testByRegion0043 begin');
      const actual: string[] = EmergencyDirectory.byRegion('IN');
      expect(actual.length).assertEqual(4);
      expect(actual[0]).assertEqual('100');
      log('testByRegion0043 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0044
     * @tc.name      testContainsNumber0044
     * @tc.desc      IN contains emergency number 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testContainsNumber0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testContainsNumber0044 begin');
      const actual: boolean = EmergencyDirectory.containsNumber('IN', '100');
      expect(actual).assertTrue();
      log('testContainsNumber0044 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0045
     * @tc.name      testDescribeNumber0045
     * @tc.desc      describe(100) -> police
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDescribeNumber0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDescribeNumber0045 begin');
      const actual: string = EmergencyDirectory.describe('100');
      expect(actual).assertEqual('police');
      log('testDescribeNumber0045 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0046
     * @tc.name      testContainsNumber0046
     * @tc.desc      IN contains emergency number 101
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testContainsNumber0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testContainsNumber0046 begin');
      const actual: boolean = EmergencyDirectory.containsNumber('IN', '101');
      expect(actual).assertTrue();
      log('testContainsNumber0046 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0047
     * @tc.name      testDescribeNumber0047
     * @tc.desc      describe(101) -> fire
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDescribeNumber0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDescribeNumber0047 begin');
      const actual: string = EmergencyDirectory.describe('101');
      expect(actual).assertEqual('fire');
      log('testDescribeNumber0047 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0048
     * @tc.name      testContainsNumber0048
     * @tc.desc      IN contains emergency number 102
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testContainsNumber0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testContainsNumber0048 begin');
      const actual: boolean = EmergencyDirectory.containsNumber('IN', '102');
      expect(actual).assertTrue();
      log('testContainsNumber0048 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0049
     * @tc.name      testDescribeNumber0049
     * @tc.desc      describe(102) -> ambulance
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDescribeNumber0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDescribeNumber0049 begin');
      const actual: string = EmergencyDirectory.describe('102');
      expect(actual).assertEqual('ambulance');
      log('testDescribeNumber0049 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0050
     * @tc.name      testContainsNumber0050
     * @tc.desc      IN contains emergency number 112
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testContainsNumber0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testContainsNumber0050 begin');
      const actual: boolean = EmergencyDirectory.containsNumber('IN', '112');
      expect(actual).assertTrue();
      log('testContainsNumber0050 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0051
     * @tc.name      testDescribeNumber0051
     * @tc.desc      describe(112) -> generic
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDescribeNumber0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDescribeNumber0051 begin');
      const actual: string = EmergencyDirectory.describe('112');
      expect(actual).assertEqual('generic');
      log('testDescribeNumber0051 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0052
     * @tc.name      testRejectNumber0052
     * @tc.desc      IN rejects an ordinary number
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRejectNumber0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRejectNumber0052 begin');
      const actual: boolean = EmergencyDirectory.containsNumber('IN', '13800138000');
      expect(actual).assertFalse();
      log('testRejectNumber0052 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0053
     * @tc.name      testByRegion0053
     * @tc.desc      byRegion(KR) returns 2 numbers
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testByRegion0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testByRegion0053 begin');
      const actual: string[] = EmergencyDirectory.byRegion('KR');
      expect(actual.length).assertEqual(2);
      expect(actual[0]).assertEqual('112');
      log('testByRegion0053 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0054
     * @tc.name      testContainsNumber0054
     * @tc.desc      KR contains emergency number 112
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testContainsNumber0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testContainsNumber0054 begin');
      const actual: boolean = EmergencyDirectory.containsNumber('KR', '112');
      expect(actual).assertTrue();
      log('testContainsNumber0054 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0055
     * @tc.name      testDescribeNumber0055
     * @tc.desc      describe(112) -> generic
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDescribeNumber0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDescribeNumber0055 begin');
      const actual: string = EmergencyDirectory.describe('112');
      expect(actual).assertEqual('generic');
      log('testDescribeNumber0055 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0056
     * @tc.name      testContainsNumber0056
     * @tc.desc      KR contains emergency number 119
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testContainsNumber0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testContainsNumber0056 begin');
      const actual: boolean = EmergencyDirectory.containsNumber('KR', '119');
      expect(actual).assertTrue();
      log('testContainsNumber0056 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0057
     * @tc.name      testDescribeNumber0057
     * @tc.desc      describe(119) -> fire
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDescribeNumber0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDescribeNumber0057 begin');
      const actual: string = EmergencyDirectory.describe('119');
      expect(actual).assertEqual('fire');
      log('testDescribeNumber0057 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0058
     * @tc.name      testRejectNumber0058
     * @tc.desc      KR rejects an ordinary number
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRejectNumber0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRejectNumber0058 begin');
      const actual: boolean = EmergencyDirectory.containsNumber('KR', '13800138000');
      expect(actual).assertFalse();
      log('testRejectNumber0058 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0059
     * @tc.name      testByRegion0059
     * @tc.desc      byRegion(SG) returns 2 numbers
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testByRegion0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testByRegion0059 begin');
      const actual: string[] = EmergencyDirectory.byRegion('SG');
      expect(actual.length).assertEqual(2);
      expect(actual[0]).assertEqual('999');
      log('testByRegion0059 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0060
     * @tc.name      testContainsNumber0060
     * @tc.desc      SG contains emergency number 999
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testContainsNumber0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testContainsNumber0060 begin');
      const actual: boolean = EmergencyDirectory.containsNumber('SG', '999');
      expect(actual).assertTrue();
      log('testContainsNumber0060 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0061
     * @tc.name      testDescribeNumber0061
     * @tc.desc      describe(999) -> generic
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDescribeNumber0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDescribeNumber0061 begin');
      const actual: string = EmergencyDirectory.describe('999');
      expect(actual).assertEqual('generic');
      log('testDescribeNumber0061 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0062
     * @tc.name      testContainsNumber0062
     * @tc.desc      SG contains emergency number 995
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testContainsNumber0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testContainsNumber0062 begin');
      const actual: boolean = EmergencyDirectory.containsNumber('SG', '995');
      expect(actual).assertTrue();
      log('testContainsNumber0062 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0063
     * @tc.name      testDescribeNumber0063
     * @tc.desc      describe(995) -> ambulance
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDescribeNumber0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDescribeNumber0063 begin');
      const actual: string = EmergencyDirectory.describe('995');
      expect(actual).assertEqual('ambulance');
      log('testDescribeNumber0063 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0064
     * @tc.name      testRejectNumber0064
     * @tc.desc      SG rejects an ordinary number
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRejectNumber0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRejectNumber0064 begin');
      const actual: boolean = EmergencyDirectory.containsNumber('SG', '13800138000');
      expect(actual).assertFalse();
      log('testRejectNumber0064 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0065
     * @tc.name      testByRegion0065
     * @tc.desc      byRegion(AU) returns 2 numbers
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testByRegion0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testByRegion0065 begin');
      const actual: string[] = EmergencyDirectory.byRegion('AU');
      expect(actual.length).assertEqual(2);
      expect(actual[0]).assertEqual('000');
      log('testByRegion0065 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0066
     * @tc.name      testContainsNumber0066
     * @tc.desc      AU contains emergency number 000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testContainsNumber0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testContainsNumber0066 begin');
      const actual: boolean = EmergencyDirectory.containsNumber('AU', '000');
      expect(actual).assertTrue();
      log('testContainsNumber0066 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0067
     * @tc.name      testDescribeNumber0067
     * @tc.desc      describe(000) -> generic
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDescribeNumber0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDescribeNumber0067 begin');
      const actual: string = EmergencyDirectory.describe('000');
      expect(actual).assertEqual('generic');
      log('testDescribeNumber0067 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0068
     * @tc.name      testContainsNumber0068
     * @tc.desc      AU contains emergency number 112
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testContainsNumber0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testContainsNumber0068 begin');
      const actual: boolean = EmergencyDirectory.containsNumber('AU', '112');
      expect(actual).assertTrue();
      log('testContainsNumber0068 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0069
     * @tc.name      testDescribeNumber0069
     * @tc.desc      describe(112) -> generic
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDescribeNumber0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDescribeNumber0069 begin');
      const actual: string = EmergencyDirectory.describe('112');
      expect(actual).assertEqual('generic');
      log('testDescribeNumber0069 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0070
     * @tc.name      testRejectNumber0070
     * @tc.desc      AU rejects an ordinary number
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRejectNumber0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRejectNumber0070 begin');
      const actual: boolean = EmergencyDirectory.containsNumber('AU', '13800138000');
      expect(actual).assertFalse();
      log('testRejectNumber0070 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0071
     * @tc.name      testUnknownRegion0071
     * @tc.desc      byRegion for an unknown region is empty
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testUnknownRegion0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testUnknownRegion0071 begin');
      const actual: string[] = EmergencyDirectory.byRegion('ZZ');
      expect(actual.length).assertEqual(0);
      log('testUnknownRegion0071 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0072
     * @tc.name      testUnknownDescribe0072
     * @tc.desc      describe for an unknown number returns unknown
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testUnknownDescribe0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testUnknownDescribe0072 begin');
      const actual: string = EmergencyDirectory.describe('13800138000');
      expect(actual).assertEqual('unknown');
      log('testUnknownDescribe0072 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0073
     * @tc.name      testLowerRegion0073
     * @tc.desc      byRegion accepts lower case region codes
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLowerRegion0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLowerRegion0073 begin');
      const actual: string[] = EmergencyDirectory.byRegion('cn');
      expect(actual.length).assertEqual(4);
      log('testLowerRegion0073 end');
      await yieldToMain();
    })

  })
}
