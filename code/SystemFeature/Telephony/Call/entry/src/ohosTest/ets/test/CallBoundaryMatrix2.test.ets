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

const DOMAIN: number = 0xF814;
const TAG: string = 'CallBoundaryMatrix2';
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

export default function callBoundaryMatrix2Test(): void {
  describe('CallBoundaryMatrix2', () => {
    /**
     * @tc.number    SUB_CALL_BOUNDARY_0115
     * @tc.name      testValidateBoundary0115
     * @tc.desc      validate(21 digits) -> TOO_LONG
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidateBoundary0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidateBoundary0115 begin');
      const result: ValidationResult = DialValidator.validate('777777777777777777777');
      expect(result.reason).assertEqual('TOO_LONG');
      log('testValidateBoundary0115 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0116
     * @tc.name      testValidateBoundary0116
     * @tc.desc      validate(22 digits) -> TOO_LONG
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidateBoundary0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidateBoundary0116 begin');
      const result: ValidationResult = DialValidator.validate('7777777777777777777777');
      expect(result.reason).assertEqual('TOO_LONG');
      log('testValidateBoundary0116 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0117
     * @tc.name      testValidateBoundary0117
     * @tc.desc      validate(23 digits) -> TOO_LONG
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidateBoundary0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidateBoundary0117 begin');
      const result: ValidationResult = DialValidator.validate('77777777777777777777777');
      expect(result.reason).assertEqual('TOO_LONG');
      log('testValidateBoundary0117 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0118
     * @tc.name      testValidateBoundary0118
     * @tc.desc      validate(24 digits) -> TOO_LONG
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidateBoundary0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidateBoundary0118 begin');
      const result: ValidationResult = DialValidator.validate('777777777777777777777777');
      expect(result.reason).assertEqual('TOO_LONG');
      log('testValidateBoundary0118 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0119
     * @tc.name      testValidatePlus0119
     * @tc.desc      validate(+ and 1 digits) -> TOO_SHORT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidatePlus0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidatePlus0119 begin');
      const result: ValidationResult = DialValidator.validate('+6');
      expect(result.reason).assertEqual('TOO_SHORT');
      log('testValidatePlus0119 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0120
     * @tc.name      testValidatePlus0120
     * @tc.desc      validate(+ and 3 digits) -> TOO_SHORT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidatePlus0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidatePlus0120 begin');
      const result: ValidationResult = DialValidator.validate('+666');
      expect(result.reason).assertEqual('TOO_SHORT');
      log('testValidatePlus0120 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0121
     * @tc.name      testValidatePlus0121
     * @tc.desc      validate(+ and 7 digits) -> OK
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidatePlus0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidatePlus0121 begin');
      const result: ValidationResult = DialValidator.validate('+6666666');
      expect(result.reason).assertEqual('OK');
      log('testValidatePlus0121 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0122
     * @tc.name      testValidatePlus0122
     * @tc.desc      validate(+ and 8 digits) -> OK
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidatePlus0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidatePlus0122 begin');
      const result: ValidationResult = DialValidator.validate('+66666666');
      expect(result.reason).assertEqual('OK');
      log('testValidatePlus0122 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0123
     * @tc.name      testValidatePlus0123
     * @tc.desc      validate(+ and 11 digits) -> OK
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidatePlus0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidatePlus0123 begin');
      const result: ValidationResult = DialValidator.validate('+66666666666');
      expect(result.reason).assertEqual('OK');
      log('testValidatePlus0123 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0124
     * @tc.name      testValidatePlus0124
     * @tc.desc      validate(+ and 13 digits) -> OK
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidatePlus0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidatePlus0124 begin');
      const result: ValidationResult = DialValidator.validate('+6666666666666');
      expect(result.reason).assertEqual('OK');
      log('testValidatePlus0124 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0125
     * @tc.name      testValidatePlus0125
     * @tc.desc      validate(+ and 15 digits) -> OK
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidatePlus0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidatePlus0125 begin');
      const result: ValidationResult = DialValidator.validate('+666666666666666');
      expect(result.reason).assertEqual('OK');
      log('testValidatePlus0125 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0126
     * @tc.name      testValidatePlus0126
     * @tc.desc      validate(+ and 16 digits) -> TOO_LONG
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidatePlus0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidatePlus0126 begin');
      const result: ValidationResult = DialValidator.validate('+6666666666666666');
      expect(result.reason).assertEqual('TOO_LONG');
      log('testValidatePlus0126 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0127
     * @tc.name      testValidatePlus0127
     * @tc.desc      validate(+ and 18 digits) -> TOO_LONG
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidatePlus0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidatePlus0127 begin');
      const result: ValidationResult = DialValidator.validate('+666666666666666666');
      expect(result.reason).assertEqual('TOO_LONG');
      log('testValidatePlus0127 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0128
     * @tc.name      testMaskBoundary0128
     * @tc.desc      maskMiddle(12345678901,0,0)
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskBoundary0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskBoundary0128 begin');
      const actual: string = CallNumberFormatter.maskMiddle('12345678901', 0, 0);
      expect(actual).assertEqual('***********');
      log('testMaskBoundary0128 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0129
     * @tc.name      testMaskBoundary0129
     * @tc.desc      maskMiddle(12345678901,1,1)
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskBoundary0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskBoundary0129 begin');
      const actual: string = CallNumberFormatter.maskMiddle('12345678901', 1, 1);
      expect(actual).assertEqual('1*********1');
      log('testMaskBoundary0129 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0130
     * @tc.name      testMaskBoundary0130
     * @tc.desc      maskMiddle(12345678901,2,2)
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskBoundary0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskBoundary0130 begin');
      const actual: string = CallNumberFormatter.maskMiddle('12345678901', 2, 2);
      expect(actual).assertEqual('12*******01');
      log('testMaskBoundary0130 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0131
     * @tc.name      testMaskBoundary0131
     * @tc.desc      maskMiddle(12345678901,5,5)
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskBoundary0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskBoundary0131 begin');
      const actual: string = CallNumberFormatter.maskMiddle('12345678901', 5, 5);
      expect(actual).assertEqual('12345*78901');
      log('testMaskBoundary0131 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0132
     * @tc.name      testMaskBoundary0132
     * @tc.desc      maskMiddle(12345678901,20,0)
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskBoundary0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskBoundary0132 begin');
      const actual: string = CallNumberFormatter.maskMiddle('12345678901', 20, 0);
      expect(actual).assertEqual('12345678901');
      log('testMaskBoundary0132 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0133
     * @tc.name      testMaskBoundary0133
     * @tc.desc      maskMiddle(12345678901,0,20)
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskBoundary0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskBoundary0133 begin');
      const actual: string = CallNumberFormatter.maskMiddle('12345678901', 0, 20);
      expect(actual).assertEqual('12345678901');
      log('testMaskBoundary0133 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0134
     * @tc.name      testMaskBoundary0134
     * @tc.desc      maskMiddle(12345678901,12,12)
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskBoundary0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskBoundary0134 begin');
      const actual: string = CallNumberFormatter.maskMiddle('12345678901', 12, 12);
      expect(actual).assertEqual('12345678901');
      log('testMaskBoundary0134 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0135
     * @tc.name      testMaskBoundary0135
     * @tc.desc      maskMiddle(1234567890,0,0)
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskBoundary0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskBoundary0135 begin');
      const actual: string = CallNumberFormatter.maskMiddle('1234567890', 0, 0);
      expect(actual).assertEqual('**********');
      log('testMaskBoundary0135 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0136
     * @tc.name      testMaskBoundary0136
     * @tc.desc      maskMiddle(1234567890,1,1)
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskBoundary0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskBoundary0136 begin');
      const actual: string = CallNumberFormatter.maskMiddle('1234567890', 1, 1);
      expect(actual).assertEqual('1********0');
      log('testMaskBoundary0136 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0137
     * @tc.name      testMaskBoundary0137
     * @tc.desc      maskMiddle(1234567890,2,2)
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskBoundary0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskBoundary0137 begin');
      const actual: string = CallNumberFormatter.maskMiddle('1234567890', 2, 2);
      expect(actual).assertEqual('12******90');
      log('testMaskBoundary0137 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0138
     * @tc.name      testMaskBoundary0138
     * @tc.desc      maskMiddle(1234567890,5,5)
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskBoundary0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskBoundary0138 begin');
      const actual: string = CallNumberFormatter.maskMiddle('1234567890', 5, 5);
      expect(actual).assertEqual('1234567890');
      log('testMaskBoundary0138 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0139
     * @tc.name      testMaskBoundary0139
     * @tc.desc      maskMiddle(1234567890,20,0)
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskBoundary0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskBoundary0139 begin');
      const actual: string = CallNumberFormatter.maskMiddle('1234567890', 20, 0);
      expect(actual).assertEqual('1234567890');
      log('testMaskBoundary0139 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0140
     * @tc.name      testMaskBoundary0140
     * @tc.desc      maskMiddle(1234567890,0,20)
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskBoundary0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskBoundary0140 begin');
      const actual: string = CallNumberFormatter.maskMiddle('1234567890', 0, 20);
      expect(actual).assertEqual('1234567890');
      log('testMaskBoundary0140 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0141
     * @tc.name      testMaskBoundary0141
     * @tc.desc      maskMiddle(1234567890,12,12)
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskBoundary0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskBoundary0141 begin');
      const actual: string = CallNumberFormatter.maskMiddle('1234567890', 12, 12);
      expect(actual).assertEqual('1234567890');
      log('testMaskBoundary0141 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0142
     * @tc.name      testMaskBoundary0142
     * @tc.desc      maskMiddle(12345678,0,0)
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskBoundary0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskBoundary0142 begin');
      const actual: string = CallNumberFormatter.maskMiddle('12345678', 0, 0);
      expect(actual).assertEqual('********');
      log('testMaskBoundary0142 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0143
     * @tc.name      testMaskBoundary0143
     * @tc.desc      maskMiddle(12345678,1,1)
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskBoundary0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskBoundary0143 begin');
      const actual: string = CallNumberFormatter.maskMiddle('12345678', 1, 1);
      expect(actual).assertEqual('1******8');
      log('testMaskBoundary0143 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0144
     * @tc.name      testMaskBoundary0144
     * @tc.desc      maskMiddle(12345678,2,2)
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskBoundary0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskBoundary0144 begin');
      const actual: string = CallNumberFormatter.maskMiddle('12345678', 2, 2);
      expect(actual).assertEqual('12****78');
      log('testMaskBoundary0144 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0145
     * @tc.name      testMaskBoundary0145
     * @tc.desc      maskMiddle(12345678,5,5)
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskBoundary0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskBoundary0145 begin');
      const actual: string = CallNumberFormatter.maskMiddle('12345678', 5, 5);
      expect(actual).assertEqual('12345678');
      log('testMaskBoundary0145 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0146
     * @tc.name      testMaskBoundary0146
     * @tc.desc      maskMiddle(12345678,20,0)
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskBoundary0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskBoundary0146 begin');
      const actual: string = CallNumberFormatter.maskMiddle('12345678', 20, 0);
      expect(actual).assertEqual('12345678');
      log('testMaskBoundary0146 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0147
     * @tc.name      testMaskBoundary0147
     * @tc.desc      maskMiddle(12345678,0,20)
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskBoundary0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskBoundary0147 begin');
      const actual: string = CallNumberFormatter.maskMiddle('12345678', 0, 20);
      expect(actual).assertEqual('12345678');
      log('testMaskBoundary0147 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0148
     * @tc.name      testMaskBoundary0148
     * @tc.desc      maskMiddle(12345678,12,12)
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskBoundary0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskBoundary0148 begin');
      const actual: string = CallNumberFormatter.maskMiddle('12345678', 12, 12);
      expect(actual).assertEqual('12345678');
      log('testMaskBoundary0148 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0149
     * @tc.name      testMaskBoundary0149
     * @tc.desc      maskMiddle(12345,0,0)
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskBoundary0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskBoundary0149 begin');
      const actual: string = CallNumberFormatter.maskMiddle('12345', 0, 0);
      expect(actual).assertEqual('*****');
      log('testMaskBoundary0149 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0150
     * @tc.name      testMaskBoundary0150
     * @tc.desc      maskMiddle(12345,1,1)
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskBoundary0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskBoundary0150 begin');
      const actual: string = CallNumberFormatter.maskMiddle('12345', 1, 1);
      expect(actual).assertEqual('1***5');
      log('testMaskBoundary0150 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0151
     * @tc.name      testMaskBoundary0151
     * @tc.desc      maskMiddle(12345,2,2)
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskBoundary0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskBoundary0151 begin');
      const actual: string = CallNumberFormatter.maskMiddle('12345', 2, 2);
      expect(actual).assertEqual('12*45');
      log('testMaskBoundary0151 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0152
     * @tc.name      testMaskBoundary0152
     * @tc.desc      maskMiddle(12345,5,5)
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskBoundary0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskBoundary0152 begin');
      const actual: string = CallNumberFormatter.maskMiddle('12345', 5, 5);
      expect(actual).assertEqual('12345');
      log('testMaskBoundary0152 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0153
     * @tc.name      testMaskBoundary0153
     * @tc.desc      maskMiddle(12345,20,0)
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskBoundary0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskBoundary0153 begin');
      const actual: string = CallNumberFormatter.maskMiddle('12345', 20, 0);
      expect(actual).assertEqual('12345');
      log('testMaskBoundary0153 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0154
     * @tc.name      testMaskBoundary0154
     * @tc.desc      maskMiddle(12345,0,20)
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskBoundary0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskBoundary0154 begin');
      const actual: string = CallNumberFormatter.maskMiddle('12345', 0, 20);
      expect(actual).assertEqual('12345');
      log('testMaskBoundary0154 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0155
     * @tc.name      testMaskBoundary0155
     * @tc.desc      maskMiddle(12345,12,12)
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskBoundary0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskBoundary0155 begin');
      const actual: string = CallNumberFormatter.maskMiddle('12345', 12, 12);
      expect(actual).assertEqual('12345');
      log('testMaskBoundary0155 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0156
     * @tc.name      testDigitCountBoundary0156
     * @tc.desc      digitCount with 0 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCountBoundary0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCountBoundary0156 begin');
      const actual: number = CallNumberFormatter.digitCount('');
      expect(actual).assertEqual(0);
      log('testDigitCountBoundary0156 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0157
     * @tc.name      testDigitCountBoundary0157
     * @tc.desc      digitCount with 1 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCountBoundary0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCountBoundary0157 begin');
      const actual: number = CallNumberFormatter.digitCount('5');
      expect(actual).assertEqual(1);
      log('testDigitCountBoundary0157 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0158
     * @tc.name      testDigitCountBoundary0158
     * @tc.desc      digitCount with 2 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCountBoundary0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCountBoundary0158 begin');
      const actual: number = CallNumberFormatter.digitCount('55');
      expect(actual).assertEqual(2);
      log('testDigitCountBoundary0158 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0159
     * @tc.name      testDigitCountBoundary0159
     * @tc.desc      digitCount with 3 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCountBoundary0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCountBoundary0159 begin');
      const actual: number = CallNumberFormatter.digitCount('555');
      expect(actual).assertEqual(3);
      log('testDigitCountBoundary0159 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0160
     * @tc.name      testDigitCountBoundary0160
     * @tc.desc      digitCount with 4 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCountBoundary0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCountBoundary0160 begin');
      const actual: number = CallNumberFormatter.digitCount('5555');
      expect(actual).assertEqual(4);
      log('testDigitCountBoundary0160 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0161
     * @tc.name      testDigitCountBoundary0161
     * @tc.desc      digitCount with 5 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCountBoundary0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCountBoundary0161 begin');
      const actual: number = CallNumberFormatter.digitCount('55555');
      expect(actual).assertEqual(5);
      log('testDigitCountBoundary0161 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0162
     * @tc.name      testDigitCountBoundary0162
     * @tc.desc      digitCount with 6 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCountBoundary0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCountBoundary0162 begin');
      const actual: number = CallNumberFormatter.digitCount('555555');
      expect(actual).assertEqual(6);
      log('testDigitCountBoundary0162 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0163
     * @tc.name      testDigitCountBoundary0163
     * @tc.desc      digitCount with 7 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCountBoundary0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCountBoundary0163 begin');
      const actual: number = CallNumberFormatter.digitCount('5555555');
      expect(actual).assertEqual(7);
      log('testDigitCountBoundary0163 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0164
     * @tc.name      testDigitCountBoundary0164
     * @tc.desc      digitCount with 8 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCountBoundary0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCountBoundary0164 begin');
      const actual: number = CallNumberFormatter.digitCount('55555555');
      expect(actual).assertEqual(8);
      log('testDigitCountBoundary0164 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0165
     * @tc.name      testDigitCountBoundary0165
     * @tc.desc      digitCount with 9 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCountBoundary0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCountBoundary0165 begin');
      const actual: number = CallNumberFormatter.digitCount('555555555');
      expect(actual).assertEqual(9);
      log('testDigitCountBoundary0165 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0166
     * @tc.name      testDigitCountBoundary0166
     * @tc.desc      digitCount with 10 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCountBoundary0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCountBoundary0166 begin');
      const actual: number = CallNumberFormatter.digitCount('5555555555');
      expect(actual).assertEqual(10);
      log('testDigitCountBoundary0166 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0167
     * @tc.name      testDigitCountBoundary0167
     * @tc.desc      digitCount with 11 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCountBoundary0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCountBoundary0167 begin');
      const actual: number = CallNumberFormatter.digitCount('55555555555');
      expect(actual).assertEqual(11);
      log('testDigitCountBoundary0167 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0168
     * @tc.name      testDigitCountBoundary0168
     * @tc.desc      digitCount with 12 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCountBoundary0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCountBoundary0168 begin');
      const actual: number = CallNumberFormatter.digitCount('555555555555');
      expect(actual).assertEqual(12);
      log('testDigitCountBoundary0168 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0169
     * @tc.name      testDigitCountBoundary0169
     * @tc.desc      digitCount with 13 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCountBoundary0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCountBoundary0169 begin');
      const actual: number = CallNumberFormatter.digitCount('5555555555555');
      expect(actual).assertEqual(13);
      log('testDigitCountBoundary0169 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0170
     * @tc.name      testDigitCountBoundary0170
     * @tc.desc      digitCount with 14 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCountBoundary0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCountBoundary0170 begin');
      const actual: number = CallNumberFormatter.digitCount('55555555555555');
      expect(actual).assertEqual(14);
      log('testDigitCountBoundary0170 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0171
     * @tc.name      testDigitCountBoundary0171
     * @tc.desc      digitCount with 15 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCountBoundary0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCountBoundary0171 begin');
      const actual: number = CallNumberFormatter.digitCount('555555555555555');
      expect(actual).assertEqual(15);
      log('testDigitCountBoundary0171 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0172
     * @tc.name      testDigitCountBoundary0172
     * @tc.desc      digitCount with 16 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCountBoundary0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCountBoundary0172 begin');
      const actual: number = CallNumberFormatter.digitCount('5555555555555555');
      expect(actual).assertEqual(16);
      log('testDigitCountBoundary0172 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0173
     * @tc.name      testDigitCountBoundary0173
     * @tc.desc      digitCount with 17 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCountBoundary0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCountBoundary0173 begin');
      const actual: number = CallNumberFormatter.digitCount('55555555555555555');
      expect(actual).assertEqual(17);
      log('testDigitCountBoundary0173 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0174
     * @tc.name      testDigitCountBoundary0174
     * @tc.desc      digitCount with 18 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCountBoundary0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCountBoundary0174 begin');
      const actual: number = CallNumberFormatter.digitCount('555555555555555555');
      expect(actual).assertEqual(18);
      log('testDigitCountBoundary0174 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0175
     * @tc.name      testDigitCountBoundary0175
     * @tc.desc      digitCount with 19 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCountBoundary0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCountBoundary0175 begin');
      const actual: number = CallNumberFormatter.digitCount('5555555555555555555');
      expect(actual).assertEqual(19);
      log('testDigitCountBoundary0175 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0176
     * @tc.name      testDigitCountBoundary0176
     * @tc.desc      digitCount with 20 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCountBoundary0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCountBoundary0176 begin');
      const actual: number = CallNumberFormatter.digitCount('55555555555555555555');
      expect(actual).assertEqual(20);
      log('testDigitCountBoundary0176 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0177
     * @tc.name      testDigitCountBoundary0177
     * @tc.desc      digitCount with 21 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCountBoundary0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCountBoundary0177 begin');
      const actual: number = CallNumberFormatter.digitCount('555555555555555555555');
      expect(actual).assertEqual(21);
      log('testDigitCountBoundary0177 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0178
     * @tc.name      testDigitCountBoundary0178
     * @tc.desc      digitCount with 22 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCountBoundary0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCountBoundary0178 begin');
      const actual: number = CallNumberFormatter.digitCount('5555555555555555555555');
      expect(actual).assertEqual(22);
      log('testDigitCountBoundary0178 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0179
     * @tc.name      testDigitCountBoundary0179
     * @tc.desc      digitCount with 23 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCountBoundary0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCountBoundary0179 begin');
      const actual: number = CallNumberFormatter.digitCount('55555555555555555555555');
      expect(actual).assertEqual(23);
      log('testDigitCountBoundary0179 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0180
     * @tc.name      testDigitCountBoundary0180
     * @tc.desc      digitCount with 24 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCountBoundary0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCountBoundary0180 begin');
      const actual: number = CallNumberFormatter.digitCount('555555555555555555555555');
      expect(actual).assertEqual(24);
      log('testDigitCountBoundary0180 end');
      await yieldToMain();
    })
  })
}
