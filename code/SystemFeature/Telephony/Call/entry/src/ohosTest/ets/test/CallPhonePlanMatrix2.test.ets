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
import { PhoneNumberPlan } from '../../../main/ets/model/PhoneNumberPlan';

const DOMAIN: number = 0xF814;
const TAG: string = 'CallPhonePlanMatrix2';
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

export default function callPhonePlanMatrix2Test(): void {
  describe('CallPhonePlanMatrix2', () => {
    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0114
     * @tc.name      testUnknownCode0114
     * @tc.desc      regionOf for an unknown calling code returns empty string
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testUnknownCode0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testUnknownCode0114 begin');
      const actual: string = PhoneNumberPlan.regionOf('+999');
      expect(actual).assertEqual('');
      log('testUnknownCode0114 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0115
     * @tc.name      testParseNoPlus0115
     * @tc.desc      parseE164 without a leading plus returns empty entries
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseNoPlus0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testParseNoPlus0115 begin');
      const actual: string[] = PhoneNumberPlan.parseE164('8613800138000');
      expect(actual[0]).assertEqual('');
      expect(actual[1]).assertEqual('');
      log('testParseNoPlus0115 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0116
     * @tc.name      testParseBadLength0116
     * @tc.desc      parseE164 rejects a national number with a wrong length
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseBadLength0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testParseBadLength0116 begin');
      const actual: string[] = PhoneNumberPlan.parseE164('+86138');
      expect(actual[0]).assertEqual('');
      expect(actual[1]).assertEqual('');
      log('testParseBadLength0116 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0117
     * @tc.name      testSupportedRegions0117
     * @tc.desc      supportedRegions lists every plan
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSupportedRegions0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSupportedRegions0117 begin');
      const actual: string[] = PhoneNumberPlan.supportedRegions();
      expect(actual.length).assertEqual(15);
      expect(actual[0]).assertEqual('CN');
      log('testSupportedRegions0117 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0118
     * @tc.name      testE164Empty0118
     * @tc.desc      e164 with empty digits returns empty string
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testE164Empty0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testE164Empty0118 begin');
      const actual: string = PhoneNumberPlan.e164('CN', '');
      expect(actual).assertEqual('');
      log('testE164Empty0118 end');
      await yieldToMain();
    })
  })
}
