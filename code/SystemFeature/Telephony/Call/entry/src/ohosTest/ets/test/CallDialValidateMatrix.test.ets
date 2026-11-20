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
import { DialValidator } from '../../../main/ets/model/DialValidator';
import { ValidationResult } from '../../../main/ets/model/DialValidator';

const DOMAIN: number = 0xF814;
const TAG: string = 'CallDialValidateMatrix';
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

export default function callDialValidateMatrixTest(): void {
  describe('CallDialValidateMatrix', () => {
    /**
     * @tc.number    SUB_CALL_DIALVAL_0001
     * @tc.name      testValidate0001
     * @tc.desc      validate("") -> EMPTY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidate0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidate0001 begin');
      const result: ValidationResult = DialValidator.validate('');
      expect(result.ok).assertEqual(false);
      expect(result.reason).assertEqual('EMPTY');
      log('testValidate0001 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DIALVAL_0002
     * @tc.name      testValidate0002
     * @tc.desc      validate("   ") -> EMPTY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidate0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidate0002 begin');
      const result: ValidationResult = DialValidator.validate('   ');
      expect(result.ok).assertEqual(false);
      expect(result.reason).assertEqual('EMPTY');
      log('testValidate0002 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DIALVAL_0003
     * @tc.name      testValidate0003
     * @tc.desc      validate("1") -> TOO_SHORT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidate0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidate0003 begin');
      const result: ValidationResult = DialValidator.validate('1');
      expect(result.ok).assertEqual(false);
      expect(result.reason).assertEqual('TOO_SHORT');
      log('testValidate0003 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DIALVAL_0004
     * @tc.name      testValidate0004
     * @tc.desc      validate("12") -> TOO_SHORT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidate0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidate0004 begin');
      const result: ValidationResult = DialValidator.validate('12');
      expect(result.ok).assertEqual(false);
      expect(result.reason).assertEqual('TOO_SHORT');
      log('testValidate0004 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DIALVAL_0005
     * @tc.name      testValidate0005
     * @tc.desc      validate("123") -> OK
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidate0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidate0005 begin');
      const result: ValidationResult = DialValidator.validate('123');
      expect(result.ok).assertEqual(true);
      expect(result.reason).assertEqual('OK');
      log('testValidate0005 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DIALVAL_0006
     * @tc.name      testValidate0006
     * @tc.desc      validate("110") -> OK
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidate0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidate0006 begin');
      const result: ValidationResult = DialValidator.validate('110');
      expect(result.ok).assertEqual(true);
      expect(result.reason).assertEqual('OK');
      log('testValidate0006 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DIALVAL_0007
     * @tc.name      testValidate0007
     * @tc.desc      validate("119") -> OK
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidate0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidate0007 begin');
      const result: ValidationResult = DialValidator.validate('119');
      expect(result.ok).assertEqual(true);
      expect(result.reason).assertEqual('OK');
      log('testValidate0007 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DIALVAL_0008
     * @tc.name      testValidate0008
     * @tc.desc      validate("120") -> OK
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidate0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidate0008 begin');
      const result: ValidationResult = DialValidator.validate('120');
      expect(result.ok).assertEqual(true);
      expect(result.reason).assertEqual('OK');
      log('testValidate0008 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DIALVAL_0009
     * @tc.name      testValidate0009
     * @tc.desc      validate("122") -> OK
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidate0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidate0009 begin');
      const result: ValidationResult = DialValidator.validate('122');
      expect(result.ok).assertEqual(true);
      expect(result.reason).assertEqual('OK');
      log('testValidate0009 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DIALVAL_0010
     * @tc.name      testValidate0010
     * @tc.desc      validate("911") -> OK
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidate0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidate0010 begin');
      const result: ValidationResult = DialValidator.validate('911');
      expect(result.ok).assertEqual(true);
      expect(result.reason).assertEqual('OK');
      log('testValidate0010 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DIALVAL_0011
     * @tc.name      testValidate0011
     * @tc.desc      validate("999") -> OK
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidate0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidate0011 begin');
      const result: ValidationResult = DialValidator.validate('999');
      expect(result.ok).assertEqual(true);
      expect(result.reason).assertEqual('OK');
      log('testValidate0011 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DIALVAL_0012
     * @tc.name      testValidate0012
     * @tc.desc      validate("112") -> OK
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidate0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidate0012 begin');
      const result: ValidationResult = DialValidator.validate('112');
      expect(result.ok).assertEqual(true);
      expect(result.reason).assertEqual('OK');
      log('testValidate0012 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DIALVAL_0013
     * @tc.name      testValidate0013
     * @tc.desc      validate("000") -> OK
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidate0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidate0013 begin');
      const result: ValidationResult = DialValidator.validate('000');
      expect(result.ok).assertEqual(true);
      expect(result.reason).assertEqual('OK');
      log('testValidate0013 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DIALVAL_0014
     * @tc.name      testValidate0014
     * @tc.desc      validate("15") -> OK
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidate0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidate0014 begin');
      const result: ValidationResult = DialValidator.validate('15');
      expect(result.ok).assertEqual(true);
      expect(result.reason).assertEqual('OK');
      log('testValidate0014 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DIALVAL_0015
     * @tc.name      testValidate0015
     * @tc.desc      validate("17") -> OK
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidate0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidate0015 begin');
      const result: ValidationResult = DialValidator.validate('17');
      expect(result.ok).assertEqual(true);
      expect(result.reason).assertEqual('OK');
      log('testValidate0015 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DIALVAL_0016
     * @tc.name      testValidate0016
     * @tc.desc      validate("100") -> OK
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidate0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidate0016 begin');
      const result: ValidationResult = DialValidator.validate('100');
      expect(result.ok).assertEqual(true);
      expect(result.reason).assertEqual('OK');
      log('testValidate0016 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DIALVAL_0017
     * @tc.name      testValidate0017
     * @tc.desc      validate("1234567") -> OK
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidate0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidate0017 begin');
      const result: ValidationResult = DialValidator.validate('1234567');
      expect(result.ok).assertEqual(true);
      expect(result.reason).assertEqual('OK');
      log('testValidate0017 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DIALVAL_0018
     * @tc.name      testValidate0018
     * @tc.desc      validate("12345678") -> OK
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidate0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidate0018 begin');
      const result: ValidationResult = DialValidator.validate('12345678');
      expect(result.ok).assertEqual(true);
      expect(result.reason).assertEqual('OK');
      log('testValidate0018 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DIALVAL_0019
     * @tc.name      testValidate0019
     * @tc.desc      validate("13800138000") -> OK
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidate0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidate0019 begin');
      const result: ValidationResult = DialValidator.validate('13800138000');
      expect(result.ok).assertEqual(true);
      expect(result.reason).assertEqual('OK');
      log('testValidate0019 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DIALVAL_0020
     * @tc.name      testValidate0020
     * @tc.desc      validate("123456789012") -> TOO_LONG
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidate0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidate0020 begin');
      const result: ValidationResult = DialValidator.validate('123456789012');
      expect(result.ok).assertEqual(false);
      expect(result.reason).assertEqual('TOO_LONG');
      log('testValidate0020 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DIALVAL_0021
     * @tc.name      testValidate0021
     * @tc.desc      validate("+8613800138000") -> OK
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidate0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidate0021 begin');
      const result: ValidationResult = DialValidator.validate('+8613800138000');
      expect(result.ok).assertEqual(true);
      expect(result.reason).assertEqual('OK');
      log('testValidate0021 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DIALVAL_0022
     * @tc.name      testValidate0022
     * @tc.desc      validate("+12345678") -> OK
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidate0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidate0022 begin');
      const result: ValidationResult = DialValidator.validate('+12345678');
      expect(result.ok).assertEqual(true);
      expect(result.reason).assertEqual('OK');
      log('testValidate0022 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DIALVAL_0023
     * @tc.name      testValidate0023
     * @tc.desc      validate("+123456") -> TOO_SHORT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidate0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidate0023 begin');
      const result: ValidationResult = DialValidator.validate('+123456');
      expect(result.ok).assertEqual(false);
      expect(result.reason).assertEqual('TOO_SHORT');
      log('testValidate0023 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DIALVAL_0024
     * @tc.name      testValidate0024
     * @tc.desc      validate("+1234567890123456") -> TOO_LONG
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidate0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidate0024 begin');
      const result: ValidationResult = DialValidator.validate('+1234567890123456');
      expect(result.ok).assertEqual(false);
      expect(result.reason).assertEqual('TOO_LONG');
      log('testValidate0024 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DIALVAL_0025
     * @tc.name      testValidate0025
     * @tc.desc      validate("12a34") -> INVALID_CHAR
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidate0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidate0025 begin');
      const result: ValidationResult = DialValidator.validate('12a34');
      expect(result.ok).assertEqual(false);
      expect(result.reason).assertEqual('INVALID_CHAR');
      log('testValidate0025 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DIALVAL_0026
     * @tc.name      testValidate0026
     * @tc.desc      validate("12-34") -> INVALID_CHAR
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidate0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidate0026 begin');
      const result: ValidationResult = DialValidator.validate('12-34');
      expect(result.ok).assertEqual(false);
      expect(result.reason).assertEqual('INVALID_CHAR');
      log('testValidate0026 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DIALVAL_0027
     * @tc.name      testValidate0027
     * @tc.desc      validate("+1a") -> INVALID_CHAR
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidate0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidate0027 begin');
      const result: ValidationResult = DialValidator.validate('+1a');
      expect(result.ok).assertEqual(false);
      expect(result.reason).assertEqual('INVALID_CHAR');
      log('testValidate0027 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DIALVAL_0028
     * @tc.name      testValidate0028
     * @tc.desc      validate("++123") -> INVALID_CHAR
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidate0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidate0028 begin');
      const result: ValidationResult = DialValidator.validate('++123');
      expect(result.ok).assertEqual(false);
      expect(result.reason).assertEqual('INVALID_CHAR');
      log('testValidate0028 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DIALVAL_0029
     * @tc.name      testValidate0029
     * @tc.desc      validate(" 110 ") -> OK
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidate0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidate0029 begin');
      const result: ValidationResult = DialValidator.validate(' 110 ');
      expect(result.ok).assertEqual(true);
      expect(result.reason).assertEqual('OK');
      log('testValidate0029 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DIALVAL_0030
     * @tc.name      testValidate0030
     * @tc.desc      validate("0123456") -> OK
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidate0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidate0030 begin');
      const result: ValidationResult = DialValidator.validate('0123456');
      expect(result.ok).assertEqual(true);
      expect(result.reason).assertEqual('OK');
      log('testValidate0030 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DIALVAL_0031
     * @tc.name      testValidate0031
     * @tc.desc      validate("01234567") -> OK
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidate0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidate0031 begin');
      const result: ValidationResult = DialValidator.validate('01234567');
      expect(result.ok).assertEqual(true);
      expect(result.reason).assertEqual('OK');
      log('testValidate0031 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DIALVAL_0032
     * @tc.name      testValidate0032
     * @tc.desc      validate("1234567890123456") -> TOO_LONG
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidate0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidate0032 begin');
      const result: ValidationResult = DialValidator.validate('1234567890123456');
      expect(result.ok).assertEqual(false);
      expect(result.reason).assertEqual('TOO_LONG');
      log('testValidate0032 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DIALVAL_0033
     * @tc.name      testDescribeReason0033
     * @tc.desc      describeReason(OK) returns a readable text
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDescribeReason0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDescribeReason0033 begin');
      const actual: string = DialValidator.describeReason('OK');
      expect(actual).assertEqual('ready to dial');
      log('testDescribeReason0033 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DIALVAL_0034
     * @tc.name      testDescribeReason0034
     * @tc.desc      describeReason(EMPTY) returns a readable text
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDescribeReason0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDescribeReason0034 begin');
      const actual: string = DialValidator.describeReason('EMPTY');
      expect(actual).assertEqual('number is empty');
      log('testDescribeReason0034 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DIALVAL_0035
     * @tc.name      testDescribeReason0035
     * @tc.desc      describeReason(INVALID_CHAR) returns a readable text
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDescribeReason0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDescribeReason0035 begin');
      const actual: string = DialValidator.describeReason('INVALID_CHAR');
      expect(actual).assertEqual('number contains invalid character');
      log('testDescribeReason0035 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DIALVAL_0036
     * @tc.name      testDescribeReason0036
     * @tc.desc      describeReason(TOO_LONG) returns a readable text
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDescribeReason0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDescribeReason0036 begin');
      const actual: string = DialValidator.describeReason('TOO_LONG');
      expect(actual).assertEqual('number is too long');
      log('testDescribeReason0036 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DIALVAL_0037
     * @tc.name      testDescribeReason0037
     * @tc.desc      describeReason(TOO_SHORT) returns a readable text
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDescribeReason0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDescribeReason0037 begin');
      const actual: string = DialValidator.describeReason('TOO_SHORT');
      expect(actual).assertEqual('number is too short');
      log('testDescribeReason0037 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DIALVAL_0038
     * @tc.name      testDescribeReason0038
     * @tc.desc      describeReason(UNKNOWN) returns a readable text
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDescribeReason0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDescribeReason0038 begin');
      const actual: string = DialValidator.describeReason('UNKNOWN');
      expect(actual).assertEqual('unknown reason');
      log('testDescribeReason0038 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DIALVAL_0039
     * @tc.name      testIsEmergency0039
     * @tc.desc      isEmergency(110) -> true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testIsEmergency0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testIsEmergency0039 begin');
      const actual: boolean = DialValidator.isEmergency('110');
      expect(actual).assertEqual(true);
      log('testIsEmergency0039 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DIALVAL_0040
     * @tc.name      testIsEmergency0040
     * @tc.desc      isEmergency(119) -> true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testIsEmergency0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testIsEmergency0040 begin');
      const actual: boolean = DialValidator.isEmergency('119');
      expect(actual).assertEqual(true);
      log('testIsEmergency0040 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DIALVAL_0041
     * @tc.name      testIsEmergency0041
     * @tc.desc      isEmergency(120) -> true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testIsEmergency0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testIsEmergency0041 begin');
      const actual: boolean = DialValidator.isEmergency('120');
      expect(actual).assertEqual(true);
      log('testIsEmergency0041 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DIALVAL_0042
     * @tc.name      testIsEmergency0042
     * @tc.desc      isEmergency(122) -> true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testIsEmergency0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testIsEmergency0042 begin');
      const actual: boolean = DialValidator.isEmergency('122');
      expect(actual).assertEqual(true);
      log('testIsEmergency0042 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DIALVAL_0043
     * @tc.name      testIsEmergency0043
     * @tc.desc      isEmergency(911) -> true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testIsEmergency0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testIsEmergency0043 begin');
      const actual: boolean = DialValidator.isEmergency('911');
      expect(actual).assertEqual(true);
      log('testIsEmergency0043 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DIALVAL_0044
     * @tc.name      testIsEmergency0044
     * @tc.desc      isEmergency(999) -> true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testIsEmergency0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testIsEmergency0044 begin');
      const actual: boolean = DialValidator.isEmergency('999');
      expect(actual).assertEqual(true);
      log('testIsEmergency0044 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DIALVAL_0045
     * @tc.name      testIsEmergency0045
     * @tc.desc      isEmergency(112) -> true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testIsEmergency0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testIsEmergency0045 begin');
      const actual: boolean = DialValidator.isEmergency('112');
      expect(actual).assertEqual(true);
      log('testIsEmergency0045 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DIALVAL_0046
     * @tc.name      testIsEmergency0046
     * @tc.desc      isEmergency(000) -> true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testIsEmergency0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testIsEmergency0046 begin');
      const actual: boolean = DialValidator.isEmergency('000');
      expect(actual).assertEqual(true);
      log('testIsEmergency0046 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DIALVAL_0047
     * @tc.name      testIsEmergency0047
     * @tc.desc      isEmergency(100) -> true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testIsEmergency0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testIsEmergency0047 begin');
      const actual: boolean = DialValidator.isEmergency('100');
      expect(actual).assertEqual(true);
      log('testIsEmergency0047 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DIALVAL_0048
     * @tc.name      testIsEmergency0048
     * @tc.desc      isEmergency(101) -> true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testIsEmergency0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testIsEmergency0048 begin');
      const actual: boolean = DialValidator.isEmergency('101');
      expect(actual).assertEqual(true);
      log('testIsEmergency0048 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DIALVAL_0049
     * @tc.name      testIsEmergency0049
     * @tc.desc      isEmergency(102) -> true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testIsEmergency0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testIsEmergency0049 begin');
      const actual: boolean = DialValidator.isEmergency('102');
      expect(actual).assertEqual(true);
      log('testIsEmergency0049 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DIALVAL_0050
     * @tc.name      testIsEmergency0050
     * @tc.desc      isEmergency(15) -> true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testIsEmergency0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testIsEmergency0050 begin');
      const actual: boolean = DialValidator.isEmergency('15');
      expect(actual).assertEqual(true);
      log('testIsEmergency0050 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DIALVAL_0051
     * @tc.name      testIsEmergency0051
     * @tc.desc      isEmergency(17) -> true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testIsEmergency0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testIsEmergency0051 begin');
      const actual: boolean = DialValidator.isEmergency('17');
      expect(actual).assertEqual(true);
      log('testIsEmergency0051 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DIALVAL_0052
     * @tc.name      testIsEmergency0052
     * @tc.desc      isEmergency(18) -> true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testIsEmergency0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testIsEmergency0052 begin');
      const actual: boolean = DialValidator.isEmergency('18');
      expect(actual).assertEqual(true);
      log('testIsEmergency0052 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DIALVAL_0053
     * @tc.name      testIsEmergency0053
     * @tc.desc      isEmergency(995) -> true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testIsEmergency0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testIsEmergency0053 begin');
      const actual: boolean = DialValidator.isEmergency('995');
      expect(actual).assertEqual(true);
      log('testIsEmergency0053 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DIALVAL_0054
     * @tc.name      testIsEmergency0054
     * @tc.desc      isEmergency(116114) -> false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testIsEmergency0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testIsEmergency0054 begin');
      const actual: boolean = DialValidator.isEmergency('116114');
      expect(actual).assertEqual(false);
      log('testIsEmergency0054 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DIALVAL_0055
     * @tc.name      testIsEmergency0055
     * @tc.desc      isEmergency(13800138000) -> false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testIsEmergency0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testIsEmergency0055 begin');
      const actual: boolean = DialValidator.isEmergency('13800138000');
      expect(actual).assertEqual(false);
      log('testIsEmergency0055 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DIALVAL_0056
     * @tc.name      testIsEmergency0056
     * @tc.desc      isEmergency(12345) -> false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testIsEmergency0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testIsEmergency0056 begin');
      const actual: boolean = DialValidator.isEmergency('12345');
      expect(actual).assertEqual(false);
      log('testIsEmergency0056 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DIALVAL_0057
     * @tc.name      testInvalidChar0057
     * @tc.desc      hasInvalidChar("") -> false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testInvalidChar0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testInvalidChar0057 begin');
      const actual: boolean = DialValidator.hasInvalidChar('');
      expect(actual).assertEqual(false);
      log('testInvalidChar0057 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DIALVAL_0058
     * @tc.name      testInvalidChar0058
     * @tc.desc      hasInvalidChar("123") -> false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testInvalidChar0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testInvalidChar0058 begin');
      const actual: boolean = DialValidator.hasInvalidChar('123');
      expect(actual).assertEqual(false);
      log('testInvalidChar0058 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DIALVAL_0059
     * @tc.name      testInvalidChar0059
     * @tc.desc      hasInvalidChar("123a") -> true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testInvalidChar0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testInvalidChar0059 begin');
      const actual: boolean = DialValidator.hasInvalidChar('123a');
      expect(actual).assertEqual(true);
      log('testInvalidChar0059 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DIALVAL_0060
     * @tc.name      testInvalidChar0060
     * @tc.desc      hasInvalidChar("+8613800138000") -> false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testInvalidChar0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testInvalidChar0060 begin');
      const actual: boolean = DialValidator.hasInvalidChar('+8613800138000');
      expect(actual).assertEqual(false);
      log('testInvalidChar0060 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DIALVAL_0061
     * @tc.name      testInvalidChar0061
     * @tc.desc      hasInvalidChar("+86abc") -> true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testInvalidChar0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testInvalidChar0061 begin');
      const actual: boolean = DialValidator.hasInvalidChar('+86abc');
      expect(actual).assertEqual(true);
      log('testInvalidChar0061 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DIALVAL_0062
     * @tc.name      testInvalidChar0062
     * @tc.desc      hasInvalidChar("12 34") -> true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testInvalidChar0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testInvalidChar0062 begin');
      const actual: boolean = DialValidator.hasInvalidChar('12 34');
      expect(actual).assertEqual(true);
      log('testInvalidChar0062 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DIALVAL_0063
     * @tc.name      testInvalidChar0063
     * @tc.desc      hasInvalidChar("12-34") -> true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testInvalidChar0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testInvalidChar0063 begin');
      const actual: boolean = DialValidator.hasInvalidChar('12-34');
      expect(actual).assertEqual(true);
      log('testInvalidChar0063 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DIALVAL_0064
     * @tc.name      testInvalidChar0064
     * @tc.desc      hasInvalidChar("1.2") -> true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testInvalidChar0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testInvalidChar0064 begin');
      const actual: boolean = DialValidator.hasInvalidChar('1.2');
      expect(actual).assertEqual(true);
      log('testInvalidChar0064 end');
      await yieldToMain();
    })

  })
}
