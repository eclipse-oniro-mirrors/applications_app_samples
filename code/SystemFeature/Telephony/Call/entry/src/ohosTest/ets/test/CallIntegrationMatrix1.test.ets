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
const TAG: string = 'CallIntegrationMatrix1';
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

export default function callIntegrationMatrix1Test(): void {
  describe('CallIntegrationMatrix1', () => {
    /**
     * @tc.number    SUB_CALL_INTEGRATION_0001
     * @tc.name      testCompactRoundTrip0001
     * @tc.desc      compact(13800138000) keeps digits and leading plus only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCompactRoundTrip0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCompactRoundTrip0001 begin');
      const compact: string = CallNumberFormatter.compact('13800138000');
      expect(compact).assertEqual('13800138000');
      expect(CallNumberFormatter.sameNumber(compact, '13800138000')).assertTrue();
      log('testCompactRoundTrip0001 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0002
     * @tc.name      testCompactRoundTrip0002
     * @tc.desc      compact(13912345678) keeps digits and leading plus only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCompactRoundTrip0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCompactRoundTrip0002 begin');
      const compact: string = CallNumberFormatter.compact('13912345678');
      expect(compact).assertEqual('13912345678');
      expect(CallNumberFormatter.sameNumber(compact, '13912345678')).assertTrue();
      log('testCompactRoundTrip0002 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0003
     * @tc.name      testCompactRoundTrip0003
     * @tc.desc      compact(18600001111) keeps digits and leading plus only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCompactRoundTrip0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCompactRoundTrip0003 begin');
      const compact: string = CallNumberFormatter.compact('18600001111');
      expect(compact).assertEqual('18600001111');
      expect(CallNumberFormatter.sameNumber(compact, '18600001111')).assertTrue();
      log('testCompactRoundTrip0003 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0004
     * @tc.name      testCompactRoundTrip0004
     * @tc.desc      compact(1234567) keeps digits and leading plus only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCompactRoundTrip0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCompactRoundTrip0004 begin');
      const compact: string = CallNumberFormatter.compact('1234567');
      expect(compact).assertEqual('1234567');
      expect(CallNumberFormatter.sameNumber(compact, '1234567')).assertTrue();
      log('testCompactRoundTrip0004 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0005
     * @tc.name      testCompactRoundTrip0005
     * @tc.desc      compact(12345678) keeps digits and leading plus only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCompactRoundTrip0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCompactRoundTrip0005 begin');
      const compact: string = CallNumberFormatter.compact('12345678');
      expect(compact).assertEqual('12345678');
      expect(CallNumberFormatter.sameNumber(compact, '12345678')).assertTrue();
      log('testCompactRoundTrip0005 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0006
     * @tc.name      testCompactRoundTrip0006
     * @tc.desc      compact(123456789012) keeps digits and leading plus only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCompactRoundTrip0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCompactRoundTrip0006 begin');
      const compact: string = CallNumberFormatter.compact('123456789012');
      expect(compact).assertEqual('123456789012');
      expect(CallNumberFormatter.sameNumber(compact, '123456789012')).assertTrue();
      log('testCompactRoundTrip0006 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0007
     * @tc.name      testCompactRoundTrip0007
     * @tc.desc      compact(+8613800138000) keeps digits and leading plus only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCompactRoundTrip0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCompactRoundTrip0007 begin');
      const compact: string = CallNumberFormatter.compact('+8613800138000');
      expect(compact).assertEqual('+8613800138000');
      expect(CallNumberFormatter.sameNumber(compact, '+8613800138000')).assertTrue();
      log('testCompactRoundTrip0007 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0008
     * @tc.name      testCompactRoundTrip0008
     * @tc.desc      compact(+14155550123) keeps digits and leading plus only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCompactRoundTrip0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCompactRoundTrip0008 begin');
      const compact: string = CallNumberFormatter.compact('+14155550123');
      expect(compact).assertEqual('+14155550123');
      expect(CallNumberFormatter.sameNumber(compact, '+14155550123')).assertTrue();
      log('testCompactRoundTrip0008 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0009
     * @tc.name      testCompactRoundTrip0009
     * @tc.desc      compact(+442071838750) keeps digits and leading plus only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCompactRoundTrip0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCompactRoundTrip0009 begin');
      const compact: string = CallNumberFormatter.compact('+442071838750');
      expect(compact).assertEqual('+442071838750');
      expect(CallNumberFormatter.sameNumber(compact, '+442071838750')).assertTrue();
      log('testCompactRoundTrip0009 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0010
     * @tc.name      testCompactRoundTrip0010
     * @tc.desc      compact(+811234567890) keeps digits and leading plus only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCompactRoundTrip0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCompactRoundTrip0010 begin');
      const compact: string = CallNumberFormatter.compact('+811234567890');
      expect(compact).assertEqual('+811234567890');
      expect(CallNumberFormatter.sameNumber(compact, '+811234567890')).assertTrue();
      log('testCompactRoundTrip0010 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0011
     * @tc.name      testCompactRoundTrip0011
     * @tc.desc      compact(+8613800138000) keeps digits and leading plus only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCompactRoundTrip0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCompactRoundTrip0011 begin');
      const compact: string = CallNumberFormatter.compact('+8613800138000');
      expect(compact).assertEqual('+8613800138000');
      expect(CallNumberFormatter.sameNumber(compact, '+8613800138000')).assertTrue();
      log('testCompactRoundTrip0011 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0012
     * @tc.name      testCompactRoundTrip0012
     * @tc.desc      compact(110) keeps digits and leading plus only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCompactRoundTrip0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCompactRoundTrip0012 begin');
      const compact: string = CallNumberFormatter.compact('110');
      expect(compact).assertEqual('110');
      expect(CallNumberFormatter.sameNumber(compact, '110')).assertTrue();
      log('testCompactRoundTrip0012 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0013
     * @tc.name      testCompactRoundTrip0013
     * @tc.desc      compact(119) keeps digits and leading plus only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCompactRoundTrip0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCompactRoundTrip0013 begin');
      const compact: string = CallNumberFormatter.compact('119');
      expect(compact).assertEqual('119');
      expect(CallNumberFormatter.sameNumber(compact, '119')).assertTrue();
      log('testCompactRoundTrip0013 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0014
     * @tc.name      testCompactRoundTrip0014
     * @tc.desc      compact(120) keeps digits and leading plus only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCompactRoundTrip0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCompactRoundTrip0014 begin');
      const compact: string = CallNumberFormatter.compact('120');
      expect(compact).assertEqual('120');
      expect(CallNumberFormatter.sameNumber(compact, '120')).assertTrue();
      log('testCompactRoundTrip0014 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0015
     * @tc.name      testCompactRoundTrip0015
     * @tc.desc      compact(122) keeps digits and leading plus only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCompactRoundTrip0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCompactRoundTrip0015 begin');
      const compact: string = CallNumberFormatter.compact('122');
      expect(compact).assertEqual('122');
      expect(CallNumberFormatter.sameNumber(compact, '122')).assertTrue();
      log('testCompactRoundTrip0015 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0016
     * @tc.name      testCompactRoundTrip0016
     * @tc.desc      compact(911) keeps digits and leading plus only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCompactRoundTrip0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCompactRoundTrip0016 begin');
      const compact: string = CallNumberFormatter.compact('911');
      expect(compact).assertEqual('911');
      expect(CallNumberFormatter.sameNumber(compact, '911')).assertTrue();
      log('testCompactRoundTrip0016 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0017
     * @tc.name      testCompactRoundTrip0017
     * @tc.desc      compact(999) keeps digits and leading plus only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCompactRoundTrip0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCompactRoundTrip0017 begin');
      const compact: string = CallNumberFormatter.compact('999');
      expect(compact).assertEqual('999');
      expect(CallNumberFormatter.sameNumber(compact, '999')).assertTrue();
      log('testCompactRoundTrip0017 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0018
     * @tc.name      testCompactRoundTrip0018
     * @tc.desc      compact(112) keeps digits and leading plus only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCompactRoundTrip0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCompactRoundTrip0018 begin');
      const compact: string = CallNumberFormatter.compact('112');
      expect(compact).assertEqual('112');
      expect(CallNumberFormatter.sameNumber(compact, '112')).assertTrue();
      log('testCompactRoundTrip0018 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0019
     * @tc.name      testCompactRoundTrip0019
     * @tc.desc      compact(000) keeps digits and leading plus only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCompactRoundTrip0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCompactRoundTrip0019 begin');
      const compact: string = CallNumberFormatter.compact('000');
      expect(compact).assertEqual('000');
      expect(CallNumberFormatter.sameNumber(compact, '000')).assertTrue();
      log('testCompactRoundTrip0019 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0020
     * @tc.name      testCompactRoundTrip0020
     * @tc.desc      compact(116114) keeps digits and leading plus only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCompactRoundTrip0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCompactRoundTrip0020 begin');
      const compact: string = CallNumberFormatter.compact('116114');
      expect(compact).assertEqual('116114');
      expect(CallNumberFormatter.sameNumber(compact, '116114')).assertTrue();
      log('testCompactRoundTrip0020 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0021
     * @tc.name      testValidateConsistency0021
     * @tc.desc      validation of 13800138000 is stable across repeated calls
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidateConsistency0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidateConsistency0021 begin');
      const first: ValidationResult = DialValidator.validate('13800138000');
      const second: ValidationResult = DialValidator.validate('13800138000');
      expect(first.ok).assertEqual(second.ok);
      expect(first.ok).assertEqual(true);
      log('testValidateConsistency0021 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0022
     * @tc.name      testValidateConsistency0022
     * @tc.desc      validation of 13912345678 is stable across repeated calls
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidateConsistency0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidateConsistency0022 begin');
      const first: ValidationResult = DialValidator.validate('13912345678');
      const second: ValidationResult = DialValidator.validate('13912345678');
      expect(first.ok).assertEqual(second.ok);
      expect(first.ok).assertEqual(true);
      log('testValidateConsistency0022 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0023
     * @tc.name      testValidateConsistency0023
     * @tc.desc      validation of 18600001111 is stable across repeated calls
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidateConsistency0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidateConsistency0023 begin');
      const first: ValidationResult = DialValidator.validate('18600001111');
      const second: ValidationResult = DialValidator.validate('18600001111');
      expect(first.ok).assertEqual(second.ok);
      expect(first.ok).assertEqual(true);
      log('testValidateConsistency0023 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0024
     * @tc.name      testValidateConsistency0024
     * @tc.desc      validation of 1234567 is stable across repeated calls
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidateConsistency0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidateConsistency0024 begin');
      const first: ValidationResult = DialValidator.validate('1234567');
      const second: ValidationResult = DialValidator.validate('1234567');
      expect(first.ok).assertEqual(second.ok);
      expect(first.ok).assertEqual(true);
      log('testValidateConsistency0024 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0025
     * @tc.name      testValidateConsistency0025
     * @tc.desc      validation of 12345678 is stable across repeated calls
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidateConsistency0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidateConsistency0025 begin');
      const first: ValidationResult = DialValidator.validate('12345678');
      const second: ValidationResult = DialValidator.validate('12345678');
      expect(first.ok).assertEqual(second.ok);
      expect(first.ok).assertEqual(true);
      log('testValidateConsistency0025 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0026
     * @tc.name      testValidateConsistency0026
     * @tc.desc      validation of 123456789012 is stable across repeated calls
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidateConsistency0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidateConsistency0026 begin');
      const first: ValidationResult = DialValidator.validate('123456789012');
      const second: ValidationResult = DialValidator.validate('123456789012');
      expect(first.ok).assertEqual(second.ok);
      expect(first.ok).assertEqual(false);
      log('testValidateConsistency0026 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0027
     * @tc.name      testValidateConsistency0027
     * @tc.desc      validation of +8613800138000 is stable across repeated calls
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidateConsistency0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidateConsistency0027 begin');
      const first: ValidationResult = DialValidator.validate('+8613800138000');
      const second: ValidationResult = DialValidator.validate('+8613800138000');
      expect(first.ok).assertEqual(second.ok);
      expect(first.ok).assertEqual(true);
      log('testValidateConsistency0027 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0028
     * @tc.name      testValidateConsistency0028
     * @tc.desc      validation of +14155550123 is stable across repeated calls
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidateConsistency0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidateConsistency0028 begin');
      const first: ValidationResult = DialValidator.validate('+14155550123');
      const second: ValidationResult = DialValidator.validate('+14155550123');
      expect(first.ok).assertEqual(second.ok);
      expect(first.ok).assertEqual(true);
      log('testValidateConsistency0028 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0029
     * @tc.name      testValidateConsistency0029
     * @tc.desc      validation of +442071838750 is stable across repeated calls
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidateConsistency0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidateConsistency0029 begin');
      const first: ValidationResult = DialValidator.validate('+442071838750');
      const second: ValidationResult = DialValidator.validate('+442071838750');
      expect(first.ok).assertEqual(second.ok);
      expect(first.ok).assertEqual(true);
      log('testValidateConsistency0029 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0030
     * @tc.name      testValidateConsistency0030
     * @tc.desc      validation of +811234567890 is stable across repeated calls
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidateConsistency0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidateConsistency0030 begin');
      const first: ValidationResult = DialValidator.validate('+811234567890');
      const second: ValidationResult = DialValidator.validate('+811234567890');
      expect(first.ok).assertEqual(second.ok);
      expect(first.ok).assertEqual(true);
      log('testValidateConsistency0030 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0031
     * @tc.name      testValidateConsistency0031
     * @tc.desc      validation of +8613800138000 is stable across repeated calls
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidateConsistency0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidateConsistency0031 begin');
      const first: ValidationResult = DialValidator.validate('+8613800138000');
      const second: ValidationResult = DialValidator.validate('+8613800138000');
      expect(first.ok).assertEqual(second.ok);
      expect(first.ok).assertEqual(true);
      log('testValidateConsistency0031 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0032
     * @tc.name      testValidateConsistency0032
     * @tc.desc      validation of 110 is stable across repeated calls
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidateConsistency0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidateConsistency0032 begin');
      const first: ValidationResult = DialValidator.validate('110');
      const second: ValidationResult = DialValidator.validate('110');
      expect(first.ok).assertEqual(second.ok);
      expect(first.ok).assertEqual(true);
      log('testValidateConsistency0032 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0033
     * @tc.name      testValidateConsistency0033
     * @tc.desc      validation of 119 is stable across repeated calls
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidateConsistency0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidateConsistency0033 begin');
      const first: ValidationResult = DialValidator.validate('119');
      const second: ValidationResult = DialValidator.validate('119');
      expect(first.ok).assertEqual(second.ok);
      expect(first.ok).assertEqual(true);
      log('testValidateConsistency0033 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0034
     * @tc.name      testValidateConsistency0034
     * @tc.desc      validation of 120 is stable across repeated calls
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidateConsistency0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidateConsistency0034 begin');
      const first: ValidationResult = DialValidator.validate('120');
      const second: ValidationResult = DialValidator.validate('120');
      expect(first.ok).assertEqual(second.ok);
      expect(first.ok).assertEqual(true);
      log('testValidateConsistency0034 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0035
     * @tc.name      testValidateConsistency0035
     * @tc.desc      validation of 122 is stable across repeated calls
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidateConsistency0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidateConsistency0035 begin');
      const first: ValidationResult = DialValidator.validate('122');
      const second: ValidationResult = DialValidator.validate('122');
      expect(first.ok).assertEqual(second.ok);
      expect(first.ok).assertEqual(true);
      log('testValidateConsistency0035 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0036
     * @tc.name      testValidateConsistency0036
     * @tc.desc      validation of 911 is stable across repeated calls
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidateConsistency0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidateConsistency0036 begin');
      const first: ValidationResult = DialValidator.validate('911');
      const second: ValidationResult = DialValidator.validate('911');
      expect(first.ok).assertEqual(second.ok);
      expect(first.ok).assertEqual(true);
      log('testValidateConsistency0036 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0037
     * @tc.name      testValidateConsistency0037
     * @tc.desc      validation of 999 is stable across repeated calls
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidateConsistency0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidateConsistency0037 begin');
      const first: ValidationResult = DialValidator.validate('999');
      const second: ValidationResult = DialValidator.validate('999');
      expect(first.ok).assertEqual(second.ok);
      expect(first.ok).assertEqual(true);
      log('testValidateConsistency0037 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0038
     * @tc.name      testValidateConsistency0038
     * @tc.desc      validation of 112 is stable across repeated calls
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidateConsistency0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidateConsistency0038 begin');
      const first: ValidationResult = DialValidator.validate('112');
      const second: ValidationResult = DialValidator.validate('112');
      expect(first.ok).assertEqual(second.ok);
      expect(first.ok).assertEqual(true);
      log('testValidateConsistency0038 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0039
     * @tc.name      testValidateConsistency0039
     * @tc.desc      validation of 000 is stable across repeated calls
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidateConsistency0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidateConsistency0039 begin');
      const first: ValidationResult = DialValidator.validate('000');
      const second: ValidationResult = DialValidator.validate('000');
      expect(first.ok).assertEqual(second.ok);
      expect(first.ok).assertEqual(true);
      log('testValidateConsistency0039 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0040
     * @tc.name      testValidateConsistency0040
     * @tc.desc      validation of 116114 is stable across repeated calls
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidateConsistency0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidateConsistency0040 begin');
      const first: ValidationResult = DialValidator.validate('116114');
      const second: ValidationResult = DialValidator.validate('116114');
      expect(first.ok).assertEqual(second.ok);
      expect(first.ok).assertEqual(true);
      log('testValidateConsistency0040 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0041
     * @tc.name      testCapabilityAgrees0041
     * @tc.desc      canDial agrees with validation for 13800138000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCapabilityAgrees0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCapabilityAgrees0041 begin');
      const result: ValidationResult = DialValidator.validate('13800138000');
      const status: string = CallCapabilityModel.canDial('13800138000', true, true);
      expect(status === 'INVALID_NUMBER').assertEqual(!result.ok);
      log('testCapabilityAgrees0041 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0042
     * @tc.name      testCapabilityAgrees0042
     * @tc.desc      canDial agrees with validation for 13912345678
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCapabilityAgrees0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCapabilityAgrees0042 begin');
      const result: ValidationResult = DialValidator.validate('13912345678');
      const status: string = CallCapabilityModel.canDial('13912345678', true, true);
      expect(status === 'INVALID_NUMBER').assertEqual(!result.ok);
      log('testCapabilityAgrees0042 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0043
     * @tc.name      testCapabilityAgrees0043
     * @tc.desc      canDial agrees with validation for 18600001111
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCapabilityAgrees0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCapabilityAgrees0043 begin');
      const result: ValidationResult = DialValidator.validate('18600001111');
      const status: string = CallCapabilityModel.canDial('18600001111', true, true);
      expect(status === 'INVALID_NUMBER').assertEqual(!result.ok);
      log('testCapabilityAgrees0043 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0044
     * @tc.name      testCapabilityAgrees0044
     * @tc.desc      canDial agrees with validation for 1234567
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCapabilityAgrees0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCapabilityAgrees0044 begin');
      const result: ValidationResult = DialValidator.validate('1234567');
      const status: string = CallCapabilityModel.canDial('1234567', true, true);
      expect(status === 'INVALID_NUMBER').assertEqual(!result.ok);
      log('testCapabilityAgrees0044 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0045
     * @tc.name      testCapabilityAgrees0045
     * @tc.desc      canDial agrees with validation for 12345678
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCapabilityAgrees0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCapabilityAgrees0045 begin');
      const result: ValidationResult = DialValidator.validate('12345678');
      const status: string = CallCapabilityModel.canDial('12345678', true, true);
      expect(status === 'INVALID_NUMBER').assertEqual(!result.ok);
      log('testCapabilityAgrees0045 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0046
     * @tc.name      testCapabilityAgrees0046
     * @tc.desc      canDial agrees with validation for 123456789012
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCapabilityAgrees0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCapabilityAgrees0046 begin');
      const result: ValidationResult = DialValidator.validate('123456789012');
      const status: string = CallCapabilityModel.canDial('123456789012', true, true);
      expect(status === 'INVALID_NUMBER').assertEqual(!result.ok);
      log('testCapabilityAgrees0046 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0047
     * @tc.name      testCapabilityAgrees0047
     * @tc.desc      canDial agrees with validation for +8613800138000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCapabilityAgrees0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCapabilityAgrees0047 begin');
      const result: ValidationResult = DialValidator.validate('+8613800138000');
      const status: string = CallCapabilityModel.canDial('+8613800138000', true, true);
      expect(status === 'INVALID_NUMBER').assertEqual(!result.ok);
      log('testCapabilityAgrees0047 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0048
     * @tc.name      testCapabilityAgrees0048
     * @tc.desc      canDial agrees with validation for +14155550123
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCapabilityAgrees0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCapabilityAgrees0048 begin');
      const result: ValidationResult = DialValidator.validate('+14155550123');
      const status: string = CallCapabilityModel.canDial('+14155550123', true, true);
      expect(status === 'INVALID_NUMBER').assertEqual(!result.ok);
      log('testCapabilityAgrees0048 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0049
     * @tc.name      testCapabilityAgrees0049
     * @tc.desc      canDial agrees with validation for +442071838750
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCapabilityAgrees0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCapabilityAgrees0049 begin');
      const result: ValidationResult = DialValidator.validate('+442071838750');
      const status: string = CallCapabilityModel.canDial('+442071838750', true, true);
      expect(status === 'INVALID_NUMBER').assertEqual(!result.ok);
      log('testCapabilityAgrees0049 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0050
     * @tc.name      testCapabilityAgrees0050
     * @tc.desc      canDial agrees with validation for +811234567890
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCapabilityAgrees0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCapabilityAgrees0050 begin');
      const result: ValidationResult = DialValidator.validate('+811234567890');
      const status: string = CallCapabilityModel.canDial('+811234567890', true, true);
      expect(status === 'INVALID_NUMBER').assertEqual(!result.ok);
      log('testCapabilityAgrees0050 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0051
     * @tc.name      testCapabilityAgrees0051
     * @tc.desc      canDial agrees with validation for +8613800138000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCapabilityAgrees0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCapabilityAgrees0051 begin');
      const result: ValidationResult = DialValidator.validate('+8613800138000');
      const status: string = CallCapabilityModel.canDial('+8613800138000', true, true);
      expect(status === 'INVALID_NUMBER').assertEqual(!result.ok);
      log('testCapabilityAgrees0051 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0052
     * @tc.name      testCapabilityAgrees0052
     * @tc.desc      canDial agrees with validation for 110
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCapabilityAgrees0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCapabilityAgrees0052 begin');
      const result: ValidationResult = DialValidator.validate('110');
      const status: string = CallCapabilityModel.canDial('110', true, true);
      expect(status === 'INVALID_NUMBER').assertEqual(!result.ok);
      log('testCapabilityAgrees0052 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0053
     * @tc.name      testCapabilityAgrees0053
     * @tc.desc      canDial agrees with validation for 119
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCapabilityAgrees0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCapabilityAgrees0053 begin');
      const result: ValidationResult = DialValidator.validate('119');
      const status: string = CallCapabilityModel.canDial('119', true, true);
      expect(status === 'INVALID_NUMBER').assertEqual(!result.ok);
      log('testCapabilityAgrees0053 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0054
     * @tc.name      testCapabilityAgrees0054
     * @tc.desc      canDial agrees with validation for 120
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCapabilityAgrees0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCapabilityAgrees0054 begin');
      const result: ValidationResult = DialValidator.validate('120');
      const status: string = CallCapabilityModel.canDial('120', true, true);
      expect(status === 'INVALID_NUMBER').assertEqual(!result.ok);
      log('testCapabilityAgrees0054 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0055
     * @tc.name      testCapabilityAgrees0055
     * @tc.desc      canDial agrees with validation for 122
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCapabilityAgrees0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCapabilityAgrees0055 begin');
      const result: ValidationResult = DialValidator.validate('122');
      const status: string = CallCapabilityModel.canDial('122', true, true);
      expect(status === 'INVALID_NUMBER').assertEqual(!result.ok);
      log('testCapabilityAgrees0055 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0056
     * @tc.name      testCapabilityAgrees0056
     * @tc.desc      canDial agrees with validation for 911
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCapabilityAgrees0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCapabilityAgrees0056 begin');
      const result: ValidationResult = DialValidator.validate('911');
      const status: string = CallCapabilityModel.canDial('911', true, true);
      expect(status === 'INVALID_NUMBER').assertEqual(!result.ok);
      log('testCapabilityAgrees0056 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0057
     * @tc.name      testCapabilityAgrees0057
     * @tc.desc      canDial agrees with validation for 999
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCapabilityAgrees0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCapabilityAgrees0057 begin');
      const result: ValidationResult = DialValidator.validate('999');
      const status: string = CallCapabilityModel.canDial('999', true, true);
      expect(status === 'INVALID_NUMBER').assertEqual(!result.ok);
      log('testCapabilityAgrees0057 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0058
     * @tc.name      testCapabilityAgrees0058
     * @tc.desc      canDial agrees with validation for 112
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCapabilityAgrees0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCapabilityAgrees0058 begin');
      const result: ValidationResult = DialValidator.validate('112');
      const status: string = CallCapabilityModel.canDial('112', true, true);
      expect(status === 'INVALID_NUMBER').assertEqual(!result.ok);
      log('testCapabilityAgrees0058 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0059
     * @tc.name      testCapabilityAgrees0059
     * @tc.desc      canDial agrees with validation for 000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCapabilityAgrees0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCapabilityAgrees0059 begin');
      const result: ValidationResult = DialValidator.validate('000');
      const status: string = CallCapabilityModel.canDial('000', true, true);
      expect(status === 'INVALID_NUMBER').assertEqual(!result.ok);
      log('testCapabilityAgrees0059 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0060
     * @tc.name      testCapabilityAgrees0060
     * @tc.desc      canDial agrees with validation for 116114
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCapabilityAgrees0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCapabilityAgrees0060 begin');
      const result: ValidationResult = DialValidator.validate('116114');
      const status: string = CallCapabilityModel.canDial('116114', true, true);
      expect(status === 'INVALID_NUMBER').assertEqual(!result.ok);
      log('testCapabilityAgrees0060 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0061
     * @tc.name      testE164RoundTrip0061
     * @tc.desc      E.164 round trip for CN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testE164RoundTrip0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testE164RoundTrip0061 begin');
      const text: string = PhoneNumberPlan.e164('CN', '12345678901');
      expect(text).assertEqual('+8612345678901');
      const parts: string[] = PhoneNumberPlan.parseE164(text);
      expect(parts[0]).assertEqual('CN');
      expect(parts[1]).assertEqual('12345678901');
      log('testE164RoundTrip0061 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0062
     * @tc.name      testE164RoundTrip0062
     * @tc.desc      E.164 round trip for US
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testE164RoundTrip0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testE164RoundTrip0062 begin');
      const text: string = PhoneNumberPlan.e164('US', '1234567890');
      expect(text).assertEqual('+11234567890');
      const parts: string[] = PhoneNumberPlan.parseE164(text);
      expect(parts[0]).assertEqual('US');
      expect(parts[1]).assertEqual('1234567890');
      log('testE164RoundTrip0062 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0063
     * @tc.name      testE164RoundTrip0063
     * @tc.desc      E.164 round trip for CA
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testE164RoundTrip0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testE164RoundTrip0063 begin');
      const text: string = PhoneNumberPlan.e164('CA', '1234567890');
      expect(text).assertEqual('+11234567890');
      const parts: string[] = PhoneNumberPlan.parseE164(text);
      expect(parts[0]).assertEqual('US');
      expect(parts[1]).assertEqual('1234567890');
      log('testE164RoundTrip0063 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0064
     * @tc.name      testE164RoundTrip0064
     * @tc.desc      E.164 round trip for GB
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testE164RoundTrip0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testE164RoundTrip0064 begin');
      const text: string = PhoneNumberPlan.e164('GB', '1234567890');
      expect(text).assertEqual('+441234567890');
      const parts: string[] = PhoneNumberPlan.parseE164(text);
      expect(parts[0]).assertEqual('GB');
      expect(parts[1]).assertEqual('1234567890');
      log('testE164RoundTrip0064 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0065
     * @tc.name      testE164RoundTrip0065
     * @tc.desc      E.164 round trip for JP
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testE164RoundTrip0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testE164RoundTrip0065 begin');
      const text: string = PhoneNumberPlan.e164('JP', '1234567890');
      expect(text).assertEqual('+811234567890');
      const parts: string[] = PhoneNumberPlan.parseE164(text);
      expect(parts[0]).assertEqual('JP');
      expect(parts[1]).assertEqual('1234567890');
      log('testE164RoundTrip0065 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0066
     * @tc.name      testE164RoundTrip0066
     * @tc.desc      E.164 round trip for DE
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testE164RoundTrip0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testE164RoundTrip0066 begin');
      const text: string = PhoneNumberPlan.e164('DE', '1234567890');
      expect(text).assertEqual('+491234567890');
      const parts: string[] = PhoneNumberPlan.parseE164(text);
      expect(parts[0]).assertEqual('DE');
      expect(parts[1]).assertEqual('1234567890');
      log('testE164RoundTrip0066 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0067
     * @tc.name      testE164RoundTrip0067
     * @tc.desc      E.164 round trip for FR
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testE164RoundTrip0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testE164RoundTrip0067 begin');
      const text: string = PhoneNumberPlan.e164('FR', '123456789');
      expect(text).assertEqual('+33123456789');
      const parts: string[] = PhoneNumberPlan.parseE164(text);
      expect(parts[0]).assertEqual('FR');
      expect(parts[1]).assertEqual('123456789');
      log('testE164RoundTrip0067 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0068
     * @tc.name      testE164RoundTrip0068
     * @tc.desc      E.164 round trip for IN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testE164RoundTrip0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testE164RoundTrip0068 begin');
      const text: string = PhoneNumberPlan.e164('IN', '1234567890');
      expect(text).assertEqual('+911234567890');
      const parts: string[] = PhoneNumberPlan.parseE164(text);
      expect(parts[0]).assertEqual('IN');
      expect(parts[1]).assertEqual('1234567890');
      log('testE164RoundTrip0068 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0069
     * @tc.name      testE164RoundTrip0069
     * @tc.desc      E.164 round trip for KR
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testE164RoundTrip0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testE164RoundTrip0069 begin');
      const text: string = PhoneNumberPlan.e164('KR', '123456789');
      expect(text).assertEqual('+82123456789');
      const parts: string[] = PhoneNumberPlan.parseE164(text);
      expect(parts[0]).assertEqual('KR');
      expect(parts[1]).assertEqual('123456789');
      log('testE164RoundTrip0069 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0070
     * @tc.name      testE164RoundTrip0070
     * @tc.desc      E.164 round trip for SG
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testE164RoundTrip0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testE164RoundTrip0070 begin');
      const text: string = PhoneNumberPlan.e164('SG', '12345678');
      expect(text).assertEqual('+6512345678');
      const parts: string[] = PhoneNumberPlan.parseE164(text);
      expect(parts[0]).assertEqual('SG');
      expect(parts[1]).assertEqual('12345678');
      log('testE164RoundTrip0070 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0071
     * @tc.name      testE164RoundTrip0071
     * @tc.desc      E.164 round trip for AU
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testE164RoundTrip0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testE164RoundTrip0071 begin');
      const text: string = PhoneNumberPlan.e164('AU', '123456789');
      expect(text).assertEqual('+61123456789');
      const parts: string[] = PhoneNumberPlan.parseE164(text);
      expect(parts[0]).assertEqual('AU');
      expect(parts[1]).assertEqual('123456789');
      log('testE164RoundTrip0071 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0072
     * @tc.name      testE164RoundTrip0072
     * @tc.desc      E.164 round trip for BR
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testE164RoundTrip0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testE164RoundTrip0072 begin');
      const text: string = PhoneNumberPlan.e164('BR', '1234567890');
      expect(text).assertEqual('+551234567890');
      const parts: string[] = PhoneNumberPlan.parseE164(text);
      expect(parts[0]).assertEqual('BR');
      expect(parts[1]).assertEqual('1234567890');
      log('testE164RoundTrip0072 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0073
     * @tc.name      testE164RoundTrip0073
     * @tc.desc      E.164 round trip for RU
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testE164RoundTrip0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testE164RoundTrip0073 begin');
      const text: string = PhoneNumberPlan.e164('RU', '1234567890');
      expect(text).assertEqual('+71234567890');
      const parts: string[] = PhoneNumberPlan.parseE164(text);
      expect(parts[0]).assertEqual('RU');
      expect(parts[1]).assertEqual('1234567890');
      log('testE164RoundTrip0073 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0074
     * @tc.name      testE164RoundTrip0074
     * @tc.desc      E.164 round trip for HK
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testE164RoundTrip0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testE164RoundTrip0074 begin');
      const text: string = PhoneNumberPlan.e164('HK', '12345678');
      expect(text).assertEqual('+85212345678');
      const parts: string[] = PhoneNumberPlan.parseE164(text);
      expect(parts[0]).assertEqual('HK');
      expect(parts[1]).assertEqual('12345678');
      log('testE164RoundTrip0074 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0075
     * @tc.name      testE164RoundTrip0075
     * @tc.desc      E.164 round trip for TW
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testE164RoundTrip0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testE164RoundTrip0075 begin');
      const text: string = PhoneNumberPlan.e164('TW', '123456789');
      expect(text).assertEqual('+886123456789');
      const parts: string[] = PhoneNumberPlan.parseE164(text);
      expect(parts[0]).assertEqual('TW');
      expect(parts[1]).assertEqual('123456789');
      log('testE164RoundTrip0075 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0076
     * @tc.name      testReachableStates0076
     * @tc.desc      from IDLE there are 3 reachable states
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testReachableStates0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testReachableStates0076 begin');
      const all: string[] = CallStateMachine.allStates();
      let count: number = 0;
      for (let index = 0; index < all.length; index++) {
        if (CallStateMachine.canTransition('IDLE', all[index])) {
          count++;
        }
      }
      expect(count).assertEqual(3);
      log('testReachableStates0076 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0077
     * @tc.name      testReachableStates0077
     * @tc.desc      from DIALLING there are 3 reachable states
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testReachableStates0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testReachableStates0077 begin');
      const all: string[] = CallStateMachine.allStates();
      let count: number = 0;
      for (let index = 0; index < all.length; index++) {
        if (CallStateMachine.canTransition('DIALLING', all[index])) {
          count++;
        }
      }
      expect(count).assertEqual(3);
      log('testReachableStates0077 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0078
     * @tc.name      testReachableStates0078
     * @tc.desc      from RINGING there are 3 reachable states
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testReachableStates0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testReachableStates0078 begin');
      const all: string[] = CallStateMachine.allStates();
      let count: number = 0;
      for (let index = 0; index < all.length; index++) {
        if (CallStateMachine.canTransition('RINGING', all[index])) {
          count++;
        }
      }
      expect(count).assertEqual(3);
      log('testReachableStates0078 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0079
     * @tc.name      testReachableStates0079
     * @tc.desc      from ACTIVE there are 3 reachable states
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testReachableStates0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testReachableStates0079 begin');
      const all: string[] = CallStateMachine.allStates();
      let count: number = 0;
      for (let index = 0; index < all.length; index++) {
        if (CallStateMachine.canTransition('ACTIVE', all[index])) {
          count++;
        }
      }
      expect(count).assertEqual(3);
      log('testReachableStates0079 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0080
     * @tc.name      testReachableStates0080
     * @tc.desc      from HOLDING there are 3 reachable states
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testReachableStates0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testReachableStates0080 begin');
      const all: string[] = CallStateMachine.allStates();
      let count: number = 0;
      for (let index = 0; index < all.length; index++) {
        if (CallStateMachine.canTransition('HOLDING', all[index])) {
          count++;
        }
      }
      expect(count).assertEqual(3);
      log('testReachableStates0080 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0081
     * @tc.name      testReachableStates0081
     * @tc.desc      from DISCONNECTED there are 2 reachable states
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testReachableStates0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testReachableStates0081 begin');
      const all: string[] = CallStateMachine.allStates();
      let count: number = 0;
      for (let index = 0; index < all.length; index++) {
        if (CallStateMachine.canTransition('DISCONNECTED', all[index])) {
          count++;
        }
      }
      expect(count).assertEqual(2);
      log('testReachableStates0081 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0082
     * @tc.name      testDurationConsistency0082
     * @tc.desc      duration format and words stay consistent at 0 seconds
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDurationConsistency0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDurationConsistency0082 begin');
      const text: string = CallDurationFormatter.format(0);
      const words: string = CallDurationFormatter.formatWords(0);
      expect(text.length > 0).assertTrue();
      expect(words.length > 0).assertTrue();
      expect(CallDurationFormatter.summary(0)).assertEqual(text + ' (' + words + ')');
      log('testDurationConsistency0082 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0083
     * @tc.name      testDurationConsistency0083
     * @tc.desc      duration format and words stay consistent at 30 seconds
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDurationConsistency0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDurationConsistency0083 begin');
      const text: string = CallDurationFormatter.format(30);
      const words: string = CallDurationFormatter.formatWords(30);
      expect(text.length > 0).assertTrue();
      expect(words.length > 0).assertTrue();
      expect(CallDurationFormatter.summary(30)).assertEqual(text + ' (' + words + ')');
      log('testDurationConsistency0083 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0084
     * @tc.name      testDurationConsistency0084
     * @tc.desc      duration format and words stay consistent at 59 seconds
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDurationConsistency0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDurationConsistency0084 begin');
      const text: string = CallDurationFormatter.format(59);
      const words: string = CallDurationFormatter.formatWords(59);
      expect(text.length > 0).assertTrue();
      expect(words.length > 0).assertTrue();
      expect(CallDurationFormatter.summary(59)).assertEqual(text + ' (' + words + ')');
      log('testDurationConsistency0084 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0085
     * @tc.name      testDurationConsistency0085
     * @tc.desc      duration format and words stay consistent at 60 seconds
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDurationConsistency0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDurationConsistency0085 begin');
      const text: string = CallDurationFormatter.format(60);
      const words: string = CallDurationFormatter.formatWords(60);
      expect(text.length > 0).assertTrue();
      expect(words.length > 0).assertTrue();
      expect(CallDurationFormatter.summary(60)).assertEqual(text + ' (' + words + ')');
      log('testDurationConsistency0085 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0086
     * @tc.name      testDurationConsistency0086
     * @tc.desc      duration format and words stay consistent at 61 seconds
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDurationConsistency0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDurationConsistency0086 begin');
      const text: string = CallDurationFormatter.format(61);
      const words: string = CallDurationFormatter.formatWords(61);
      expect(text.length > 0).assertTrue();
      expect(words.length > 0).assertTrue();
      expect(CallDurationFormatter.summary(61)).assertEqual(text + ' (' + words + ')');
      log('testDurationConsistency0086 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0087
     * @tc.name      testDurationConsistency0087
     * @tc.desc      duration format and words stay consistent at 599 seconds
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDurationConsistency0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDurationConsistency0087 begin');
      const text: string = CallDurationFormatter.format(599);
      const words: string = CallDurationFormatter.formatWords(599);
      expect(text.length > 0).assertTrue();
      expect(words.length > 0).assertTrue();
      expect(CallDurationFormatter.summary(599)).assertEqual(text + ' (' + words + ')');
      log('testDurationConsistency0087 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0088
     * @tc.name      testDurationConsistency0088
     * @tc.desc      duration format and words stay consistent at 600 seconds
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDurationConsistency0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDurationConsistency0088 begin');
      const text: string = CallDurationFormatter.format(600);
      const words: string = CallDurationFormatter.formatWords(600);
      expect(text.length > 0).assertTrue();
      expect(words.length > 0).assertTrue();
      expect(CallDurationFormatter.summary(600)).assertEqual(text + ' (' + words + ')');
      log('testDurationConsistency0088 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0089
     * @tc.name      testDurationConsistency0089
     * @tc.desc      duration format and words stay consistent at 3599 seconds
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDurationConsistency0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDurationConsistency0089 begin');
      const text: string = CallDurationFormatter.format(3599);
      const words: string = CallDurationFormatter.formatWords(3599);
      expect(text.length > 0).assertTrue();
      expect(words.length > 0).assertTrue();
      expect(CallDurationFormatter.summary(3599)).assertEqual(text + ' (' + words + ')');
      log('testDurationConsistency0089 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0090
     * @tc.name      testDurationConsistency0090
     * @tc.desc      duration format and words stay consistent at 3600 seconds
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDurationConsistency0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDurationConsistency0090 begin');
      const text: string = CallDurationFormatter.format(3600);
      const words: string = CallDurationFormatter.formatWords(3600);
      expect(text.length > 0).assertTrue();
      expect(words.length > 0).assertTrue();
      expect(CallDurationFormatter.summary(3600)).assertEqual(text + ' (' + words + ')');
      log('testDurationConsistency0090 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0091
     * @tc.name      testDurationConsistency0091
     * @tc.desc      duration format and words stay consistent at 3661 seconds
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDurationConsistency0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDurationConsistency0091 begin');
      const text: string = CallDurationFormatter.format(3661);
      const words: string = CallDurationFormatter.formatWords(3661);
      expect(text.length > 0).assertTrue();
      expect(words.length > 0).assertTrue();
      expect(CallDurationFormatter.summary(3661)).assertEqual(text + ' (' + words + ')');
      log('testDurationConsistency0091 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0092
     * @tc.name      testDurationConsistency0092
     * @tc.desc      duration format and words stay consistent at 7200 seconds
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDurationConsistency0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDurationConsistency0092 begin');
      const text: string = CallDurationFormatter.format(7200);
      const words: string = CallDurationFormatter.formatWords(7200);
      expect(text.length > 0).assertTrue();
      expect(words.length > 0).assertTrue();
      expect(CallDurationFormatter.summary(7200)).assertEqual(text + ' (' + words + ')');
      log('testDurationConsistency0092 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0093
     * @tc.name      testDurationConsistency0093
     * @tc.desc      duration format and words stay consistent at 9000 seconds
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDurationConsistency0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDurationConsistency0093 begin');
      const text: string = CallDurationFormatter.format(9000);
      const words: string = CallDurationFormatter.formatWords(9000);
      expect(text.length > 0).assertTrue();
      expect(words.length > 0).assertTrue();
      expect(CallDurationFormatter.summary(9000)).assertEqual(text + ' (' + words + ')');
      log('testDurationConsistency0093 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0094
     * @tc.name      testBillableConsistency0094
     * @tc.desc      billable minutes for 0 seconds is 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBillableConsistency0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBillableConsistency0094 begin');
      const minutes: number = CallDurationFormatter.billableMinutes(0);
      expect(minutes).assertEqual(0);
      expect(minutes * 60 >= 0).assertTrue();
      log('testBillableConsistency0094 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0095
     * @tc.name      testBillableConsistency0095
     * @tc.desc      billable minutes for 30 seconds is 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBillableConsistency0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBillableConsistency0095 begin');
      const minutes: number = CallDurationFormatter.billableMinutes(30);
      expect(minutes).assertEqual(1);
      expect(minutes * 60 >= 30).assertTrue();
      log('testBillableConsistency0095 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0096
     * @tc.name      testBillableConsistency0096
     * @tc.desc      billable minutes for 59 seconds is 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBillableConsistency0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBillableConsistency0096 begin');
      const minutes: number = CallDurationFormatter.billableMinutes(59);
      expect(minutes).assertEqual(1);
      expect(minutes * 60 >= 59).assertTrue();
      log('testBillableConsistency0096 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0097
     * @tc.name      testBillableConsistency0097
     * @tc.desc      billable minutes for 60 seconds is 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBillableConsistency0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBillableConsistency0097 begin');
      const minutes: number = CallDurationFormatter.billableMinutes(60);
      expect(minutes).assertEqual(1);
      expect(minutes * 60 >= 60).assertTrue();
      log('testBillableConsistency0097 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0098
     * @tc.name      testBillableConsistency0098
     * @tc.desc      billable minutes for 61 seconds is 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBillableConsistency0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBillableConsistency0098 begin');
      const minutes: number = CallDurationFormatter.billableMinutes(61);
      expect(minutes).assertEqual(2);
      expect(minutes * 60 >= 61).assertTrue();
      log('testBillableConsistency0098 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0099
     * @tc.name      testBillableConsistency0099
     * @tc.desc      billable minutes for 599 seconds is 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBillableConsistency0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBillableConsistency0099 begin');
      const minutes: number = CallDurationFormatter.billableMinutes(599);
      expect(minutes).assertEqual(10);
      expect(minutes * 60 >= 599).assertTrue();
      log('testBillableConsistency0099 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0100
     * @tc.name      testBillableConsistency0100
     * @tc.desc      billable minutes for 600 seconds is 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBillableConsistency0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBillableConsistency0100 begin');
      const minutes: number = CallDurationFormatter.billableMinutes(600);
      expect(minutes).assertEqual(10);
      expect(minutes * 60 >= 600).assertTrue();
      log('testBillableConsistency0100 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_INTEGRATION_0101
     * @tc.name      testBillableConsistency0101
     * @tc.desc      billable minutes for 3599 seconds is 60
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBillableConsistency0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBillableConsistency0101 begin');
      const minutes: number = CallDurationFormatter.billableMinutes(3599);
      expect(minutes).assertEqual(60);
      expect(minutes * 60 >= 3599).assertTrue();
      log('testBillableConsistency0101 end');
      await yieldToMain();
    })
  })
}
