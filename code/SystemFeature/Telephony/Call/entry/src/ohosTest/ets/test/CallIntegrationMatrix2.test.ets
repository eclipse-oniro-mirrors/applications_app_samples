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
import { CallNumberFormatter } from '../../../main/ets/model/CallNumberFormatter';
import { DialValidator } from '../../../main/ets/model/DialValidator';
import { ValidationResult } from '../../../main/ets/model/DialValidator';
import { CallCapabilityModel } from '../../../main/ets/model/CallCapabilityModel';
import { PhoneNumberPlan } from '../../../main/ets/model/PhoneNumberPlan';
import { CallStateMachine } from '../../../main/ets/model/CallStateMachine';
import { CallDurationFormatter } from '../../../main/ets/model/CallDurationFormatter';

const DOMAIN: number = 0xF814;
const TAG: string = 'CallIntegrationMatrix2';
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

export default function callIntegrationMatrix2Test(): void {
  describe('CallIntegrationMatrix2', () => {
    /**
     * @tc.number    SUB_CALL_INTEGRATION_0102
     * @tc.name      testBillableConsistency0102
     * @tc.desc      billable minutes for 3600 seconds is 60
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBillableConsistency0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBillableConsistency0102 begin');
      const minutes: number = CallDurationFormatter.billableMinutes(3600);
      expect(minutes).assertEqual(60);
      expect(minutes * 60 >= 3600).assertTrue();
      log('testBillableConsistency0102 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0103
     * @tc.name      testBillableConsistency0103
     * @tc.desc      billable minutes for 3661 seconds is 62
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBillableConsistency0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBillableConsistency0103 begin');
      const minutes: number = CallDurationFormatter.billableMinutes(3661);
      expect(minutes).assertEqual(62);
      expect(minutes * 60 >= 3661).assertTrue();
      log('testBillableConsistency0103 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0104
     * @tc.name      testBillableConsistency0104
     * @tc.desc      billable minutes for 7200 seconds is 120
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBillableConsistency0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBillableConsistency0104 begin');
      const minutes: number = CallDurationFormatter.billableMinutes(7200);
      expect(minutes).assertEqual(120);
      expect(minutes * 60 >= 7200).assertTrue();
      log('testBillableConsistency0104 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0105
     * @tc.name      testBillableConsistency0105
     * @tc.desc      billable minutes for 9000 seconds is 150
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBillableConsistency0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBillableConsistency0105 begin');
      const minutes: number = CallDurationFormatter.billableMinutes(9000);
      expect(minutes).assertEqual(150);
      expect(minutes * 60 >= 9000).assertTrue();
      log('testBillableConsistency0105 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0106
     * @tc.name      testPercentConsistency0106
     * @tc.desc      percent of hour for 0 seconds is 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPercentConsistency0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testPercentConsistency0106 begin');
      const pct: number = CallDurationFormatter.percentOfHour(0);
      expect(pct).assertEqual(0);
      expect(pct >= 0).assertTrue();
      log('testPercentConsistency0106 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0107
     * @tc.name      testPercentConsistency0107
     * @tc.desc      percent of hour for 30 seconds is 0.83
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPercentConsistency0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testPercentConsistency0107 begin');
      const pct: number = CallDurationFormatter.percentOfHour(30);
      expect(pct).assertEqual(0.83);
      expect(pct >= 0).assertTrue();
      log('testPercentConsistency0107 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0108
     * @tc.name      testPercentConsistency0108
     * @tc.desc      percent of hour for 59 seconds is 1.64
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPercentConsistency0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testPercentConsistency0108 begin');
      const pct: number = CallDurationFormatter.percentOfHour(59);
      expect(pct).assertEqual(1.64);
      expect(pct >= 0).assertTrue();
      log('testPercentConsistency0108 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0109
     * @tc.name      testPercentConsistency0109
     * @tc.desc      percent of hour for 60 seconds is 1.67
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPercentConsistency0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testPercentConsistency0109 begin');
      const pct: number = CallDurationFormatter.percentOfHour(60);
      expect(pct).assertEqual(1.67);
      expect(pct >= 0).assertTrue();
      log('testPercentConsistency0109 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0110
     * @tc.name      testPercentConsistency0110
     * @tc.desc      percent of hour for 61 seconds is 1.69
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPercentConsistency0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testPercentConsistency0110 begin');
      const pct: number = CallDurationFormatter.percentOfHour(61);
      expect(pct).assertEqual(1.69);
      expect(pct >= 0).assertTrue();
      log('testPercentConsistency0110 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0111
     * @tc.name      testPercentConsistency0111
     * @tc.desc      percent of hour for 599 seconds is 16.64
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPercentConsistency0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testPercentConsistency0111 begin');
      const pct: number = CallDurationFormatter.percentOfHour(599);
      expect(pct).assertEqual(16.64);
      expect(pct >= 0).assertTrue();
      log('testPercentConsistency0111 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0112
     * @tc.name      testPercentConsistency0112
     * @tc.desc      percent of hour for 600 seconds is 16.67
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPercentConsistency0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testPercentConsistency0112 begin');
      const pct: number = CallDurationFormatter.percentOfHour(600);
      expect(pct).assertEqual(16.67);
      expect(pct >= 0).assertTrue();
      log('testPercentConsistency0112 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0113
     * @tc.name      testPercentConsistency0113
     * @tc.desc      percent of hour for 3599 seconds is 99.97
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPercentConsistency0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testPercentConsistency0113 begin');
      const pct: number = CallDurationFormatter.percentOfHour(3599);
      expect(pct).assertEqual(99.97);
      expect(pct >= 0).assertTrue();
      log('testPercentConsistency0113 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0114
     * @tc.name      testPercentConsistency0114
     * @tc.desc      percent of hour for 3600 seconds is 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPercentConsistency0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testPercentConsistency0114 begin');
      const pct: number = CallDurationFormatter.percentOfHour(3600);
      expect(pct).assertEqual(100);
      expect(pct >= 0).assertTrue();
      log('testPercentConsistency0114 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0115
     * @tc.name      testPercentConsistency0115
     * @tc.desc      percent of hour for 3661 seconds is 101.69
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPercentConsistency0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testPercentConsistency0115 begin');
      const pct: number = CallDurationFormatter.percentOfHour(3661);
      expect(pct).assertEqual(101.69);
      expect(pct >= 0).assertTrue();
      log('testPercentConsistency0115 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0116
     * @tc.name      testPercentConsistency0116
     * @tc.desc      percent of hour for 7200 seconds is 200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPercentConsistency0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testPercentConsistency0116 begin');
      const pct: number = CallDurationFormatter.percentOfHour(7200);
      expect(pct).assertEqual(200);
      expect(pct >= 0).assertTrue();
      log('testPercentConsistency0116 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0117
     * @tc.name      testPercentConsistency0117
     * @tc.desc      percent of hour for 9000 seconds is 250
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPercentConsistency0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testPercentConsistency0117 begin');
      const pct: number = CallDurationFormatter.percentOfHour(9000);
      expect(pct).assertEqual(250);
      expect(pct >= 0).assertTrue();
      log('testPercentConsistency0117 end');
      await yieldToMain();
    })
  })
}
