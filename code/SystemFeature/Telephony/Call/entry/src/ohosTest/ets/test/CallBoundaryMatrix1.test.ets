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
const TAG: string = 'CallBoundaryMatrix1';
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

export default function callBoundaryMatrix1Test(): void {
  describe('CallBoundaryMatrix1', () => {
    /**
     * @tc.number    SUB_CALL_BOUNDARY_0001
     * @tc.name      testFormatNationalBoundary0001
     * @tc.desc      formatNational with 0 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNationalBoundary0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNationalBoundary0001 begin');
      const actual: string = CallNumberFormatter.formatNational('');
      expect(actual).assertEqual('');
      log('testFormatNationalBoundary0001 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0002
     * @tc.name      testFormatDashesBoundary0002
     * @tc.desc      formatDashes with 0 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashesBoundary0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashesBoundary0002 begin');
      const actual: string = CallNumberFormatter.formatDashes('');
      expect(actual).assertEqual('');
      log('testFormatDashesBoundary0002 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0003
     * @tc.name      testFormatDotsBoundary0003
     * @tc.desc      formatDots with 0 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDotsBoundary0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDotsBoundary0003 begin');
      const actual: string = CallNumberFormatter.formatDots('');
      expect(actual).assertEqual('');
      log('testFormatDotsBoundary0003 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0004
     * @tc.name      testFormatNationalBoundary0004
     * @tc.desc      formatNational with 1 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNationalBoundary0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNationalBoundary0004 begin');
      const actual: string = CallNumberFormatter.formatNational('9');
      expect(actual).assertEqual('9');
      log('testFormatNationalBoundary0004 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0005
     * @tc.name      testFormatDashesBoundary0005
     * @tc.desc      formatDashes with 1 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashesBoundary0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashesBoundary0005 begin');
      const actual: string = CallNumberFormatter.formatDashes('9');
      expect(actual).assertEqual('9');
      log('testFormatDashesBoundary0005 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0006
     * @tc.name      testFormatDotsBoundary0006
     * @tc.desc      formatDots with 1 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDotsBoundary0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDotsBoundary0006 begin');
      const actual: string = CallNumberFormatter.formatDots('9');
      expect(actual).assertEqual('9');
      log('testFormatDotsBoundary0006 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0007
     * @tc.name      testFormatNationalBoundary0007
     * @tc.desc      formatNational with 2 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNationalBoundary0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNationalBoundary0007 begin');
      const actual: string = CallNumberFormatter.formatNational('99');
      expect(actual).assertEqual('99');
      log('testFormatNationalBoundary0007 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0008
     * @tc.name      testFormatDashesBoundary0008
     * @tc.desc      formatDashes with 2 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashesBoundary0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashesBoundary0008 begin');
      const actual: string = CallNumberFormatter.formatDashes('99');
      expect(actual).assertEqual('99');
      log('testFormatDashesBoundary0008 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0009
     * @tc.name      testFormatDotsBoundary0009
     * @tc.desc      formatDots with 2 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDotsBoundary0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDotsBoundary0009 begin');
      const actual: string = CallNumberFormatter.formatDots('99');
      expect(actual).assertEqual('99');
      log('testFormatDotsBoundary0009 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0010
     * @tc.name      testFormatNationalBoundary0010
     * @tc.desc      formatNational with 3 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNationalBoundary0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNationalBoundary0010 begin');
      const actual: string = CallNumberFormatter.formatNational('999');
      expect(actual).assertEqual('999');
      log('testFormatNationalBoundary0010 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0011
     * @tc.name      testFormatDashesBoundary0011
     * @tc.desc      formatDashes with 3 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashesBoundary0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashesBoundary0011 begin');
      const actual: string = CallNumberFormatter.formatDashes('999');
      expect(actual).assertEqual('999');
      log('testFormatDashesBoundary0011 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0012
     * @tc.name      testFormatDotsBoundary0012
     * @tc.desc      formatDots with 3 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDotsBoundary0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDotsBoundary0012 begin');
      const actual: string = CallNumberFormatter.formatDots('999');
      expect(actual).assertEqual('999');
      log('testFormatDotsBoundary0012 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0013
     * @tc.name      testFormatNationalBoundary0013
     * @tc.desc      formatNational with 4 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNationalBoundary0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNationalBoundary0013 begin');
      const actual: string = CallNumberFormatter.formatNational('9999');
      expect(actual).assertEqual('9999');
      log('testFormatNationalBoundary0013 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0014
     * @tc.name      testFormatDashesBoundary0014
     * @tc.desc      formatDashes with 4 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashesBoundary0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashesBoundary0014 begin');
      const actual: string = CallNumberFormatter.formatDashes('9999');
      expect(actual).assertEqual('9999');
      log('testFormatDashesBoundary0014 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0015
     * @tc.name      testFormatDotsBoundary0015
     * @tc.desc      formatDots with 4 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDotsBoundary0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDotsBoundary0015 begin');
      const actual: string = CallNumberFormatter.formatDots('9999');
      expect(actual).assertEqual('9999');
      log('testFormatDotsBoundary0015 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0016
     * @tc.name      testFormatNationalBoundary0016
     * @tc.desc      formatNational with 5 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNationalBoundary0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNationalBoundary0016 begin');
      const actual: string = CallNumberFormatter.formatNational('99999');
      expect(actual).assertEqual('99999');
      log('testFormatNationalBoundary0016 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0017
     * @tc.name      testFormatDashesBoundary0017
     * @tc.desc      formatDashes with 5 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashesBoundary0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashesBoundary0017 begin');
      const actual: string = CallNumberFormatter.formatDashes('99999');
      expect(actual).assertEqual('99999');
      log('testFormatDashesBoundary0017 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0018
     * @tc.name      testFormatDotsBoundary0018
     * @tc.desc      formatDots with 5 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDotsBoundary0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDotsBoundary0018 begin');
      const actual: string = CallNumberFormatter.formatDots('99999');
      expect(actual).assertEqual('99999');
      log('testFormatDotsBoundary0018 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0019
     * @tc.name      testFormatNationalBoundary0019
     * @tc.desc      formatNational with 6 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNationalBoundary0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNationalBoundary0019 begin');
      const actual: string = CallNumberFormatter.formatNational('999999');
      expect(actual).assertEqual('999999');
      log('testFormatNationalBoundary0019 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0020
     * @tc.name      testFormatDashesBoundary0020
     * @tc.desc      formatDashes with 6 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashesBoundary0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashesBoundary0020 begin');
      const actual: string = CallNumberFormatter.formatDashes('999999');
      expect(actual).assertEqual('999999');
      log('testFormatDashesBoundary0020 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0021
     * @tc.name      testFormatDotsBoundary0021
     * @tc.desc      formatDots with 6 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDotsBoundary0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDotsBoundary0021 begin');
      const actual: string = CallNumberFormatter.formatDots('999999');
      expect(actual).assertEqual('999999');
      log('testFormatDotsBoundary0021 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0022
     * @tc.name      testFormatNationalBoundary0022
     * @tc.desc      formatNational with 7 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNationalBoundary0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNationalBoundary0022 begin');
      const actual: string = CallNumberFormatter.formatNational('9999999');
      expect(actual).assertEqual('9999999');
      log('testFormatNationalBoundary0022 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0023
     * @tc.name      testFormatDashesBoundary0023
     * @tc.desc      formatDashes with 7 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashesBoundary0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashesBoundary0023 begin');
      const actual: string = CallNumberFormatter.formatDashes('9999999');
      expect(actual).assertEqual('9999999');
      log('testFormatDashesBoundary0023 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0024
     * @tc.name      testFormatDotsBoundary0024
     * @tc.desc      formatDots with 7 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDotsBoundary0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDotsBoundary0024 begin');
      const actual: string = CallNumberFormatter.formatDots('9999999');
      expect(actual).assertEqual('9999999');
      log('testFormatDotsBoundary0024 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0025
     * @tc.name      testFormatNationalBoundary0025
     * @tc.desc      formatNational with 8 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNationalBoundary0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNationalBoundary0025 begin');
      const actual: string = CallNumberFormatter.formatNational('99999999');
      expect(actual).assertEqual('9999 9999');
      log('testFormatNationalBoundary0025 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0026
     * @tc.name      testFormatDashesBoundary0026
     * @tc.desc      formatDashes with 8 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashesBoundary0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashesBoundary0026 begin');
      const actual: string = CallNumberFormatter.formatDashes('99999999');
      expect(actual).assertEqual('99999999');
      log('testFormatDashesBoundary0026 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0027
     * @tc.name      testFormatDotsBoundary0027
     * @tc.desc      formatDots with 8 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDotsBoundary0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDotsBoundary0027 begin');
      const actual: string = CallNumberFormatter.formatDots('99999999');
      expect(actual).assertEqual('99999999');
      log('testFormatDotsBoundary0027 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0028
     * @tc.name      testFormatNationalBoundary0028
     * @tc.desc      formatNational with 9 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNationalBoundary0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNationalBoundary0028 begin');
      const actual: string = CallNumberFormatter.formatNational('999999999');
      expect(actual).assertEqual('999999999');
      log('testFormatNationalBoundary0028 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0029
     * @tc.name      testFormatDashesBoundary0029
     * @tc.desc      formatDashes with 9 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashesBoundary0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashesBoundary0029 begin');
      const actual: string = CallNumberFormatter.formatDashes('999999999');
      expect(actual).assertEqual('999999999');
      log('testFormatDashesBoundary0029 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0030
     * @tc.name      testFormatDotsBoundary0030
     * @tc.desc      formatDots with 9 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDotsBoundary0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDotsBoundary0030 begin');
      const actual: string = CallNumberFormatter.formatDots('999999999');
      expect(actual).assertEqual('999999999');
      log('testFormatDotsBoundary0030 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0031
     * @tc.name      testFormatNationalBoundary0031
     * @tc.desc      formatNational with 10 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNationalBoundary0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNationalBoundary0031 begin');
      const actual: string = CallNumberFormatter.formatNational('9999999999');
      expect(actual).assertEqual('999 999 9999');
      log('testFormatNationalBoundary0031 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0032
     * @tc.name      testFormatDashesBoundary0032
     * @tc.desc      formatDashes with 10 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashesBoundary0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashesBoundary0032 begin');
      const actual: string = CallNumberFormatter.formatDashes('9999999999');
      expect(actual).assertEqual('999-999-9999');
      log('testFormatDashesBoundary0032 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0033
     * @tc.name      testFormatDotsBoundary0033
     * @tc.desc      formatDots with 10 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDotsBoundary0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDotsBoundary0033 begin');
      const actual: string = CallNumberFormatter.formatDots('9999999999');
      expect(actual).assertEqual('999.999.9999');
      log('testFormatDotsBoundary0033 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0034
     * @tc.name      testFormatNationalBoundary0034
     * @tc.desc      formatNational with 11 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNationalBoundary0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNationalBoundary0034 begin');
      const actual: string = CallNumberFormatter.formatNational('99999999999');
      expect(actual).assertEqual('999 9999 9999');
      log('testFormatNationalBoundary0034 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0035
     * @tc.name      testFormatDashesBoundary0035
     * @tc.desc      formatDashes with 11 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashesBoundary0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashesBoundary0035 begin');
      const actual: string = CallNumberFormatter.formatDashes('99999999999');
      expect(actual).assertEqual('999-9999-9999');
      log('testFormatDashesBoundary0035 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0036
     * @tc.name      testFormatDotsBoundary0036
     * @tc.desc      formatDots with 11 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDotsBoundary0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDotsBoundary0036 begin');
      const actual: string = CallNumberFormatter.formatDots('99999999999');
      expect(actual).assertEqual('999.9999.9999');
      log('testFormatDotsBoundary0036 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0037
     * @tc.name      testFormatNationalBoundary0037
     * @tc.desc      formatNational with 12 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNationalBoundary0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNationalBoundary0037 begin');
      const actual: string = CallNumberFormatter.formatNational('999999999999');
      expect(actual).assertEqual('999999999999');
      log('testFormatNationalBoundary0037 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0038
     * @tc.name      testFormatDashesBoundary0038
     * @tc.desc      formatDashes with 12 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashesBoundary0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashesBoundary0038 begin');
      const actual: string = CallNumberFormatter.formatDashes('999999999999');
      expect(actual).assertEqual('999999999999');
      log('testFormatDashesBoundary0038 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0039
     * @tc.name      testFormatDotsBoundary0039
     * @tc.desc      formatDots with 12 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDotsBoundary0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDotsBoundary0039 begin');
      const actual: string = CallNumberFormatter.formatDots('999999999999');
      expect(actual).assertEqual('999999999999');
      log('testFormatDotsBoundary0039 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0040
     * @tc.name      testFormatNationalBoundary0040
     * @tc.desc      formatNational with 13 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNationalBoundary0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNationalBoundary0040 begin');
      const actual: string = CallNumberFormatter.formatNational('9999999999999');
      expect(actual).assertEqual('9999999999999');
      log('testFormatNationalBoundary0040 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0041
     * @tc.name      testFormatDashesBoundary0041
     * @tc.desc      formatDashes with 13 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashesBoundary0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashesBoundary0041 begin');
      const actual: string = CallNumberFormatter.formatDashes('9999999999999');
      expect(actual).assertEqual('9999999999999');
      log('testFormatDashesBoundary0041 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0042
     * @tc.name      testFormatDotsBoundary0042
     * @tc.desc      formatDots with 13 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDotsBoundary0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDotsBoundary0042 begin');
      const actual: string = CallNumberFormatter.formatDots('9999999999999');
      expect(actual).assertEqual('9999999999999');
      log('testFormatDotsBoundary0042 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0043
     * @tc.name      testFormatNationalBoundary0043
     * @tc.desc      formatNational with 14 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNationalBoundary0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNationalBoundary0043 begin');
      const actual: string = CallNumberFormatter.formatNational('99999999999999');
      expect(actual).assertEqual('99999999999999');
      log('testFormatNationalBoundary0043 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0044
     * @tc.name      testFormatDashesBoundary0044
     * @tc.desc      formatDashes with 14 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashesBoundary0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashesBoundary0044 begin');
      const actual: string = CallNumberFormatter.formatDashes('99999999999999');
      expect(actual).assertEqual('99999999999999');
      log('testFormatDashesBoundary0044 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0045
     * @tc.name      testFormatDotsBoundary0045
     * @tc.desc      formatDots with 14 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDotsBoundary0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDotsBoundary0045 begin');
      const actual: string = CallNumberFormatter.formatDots('99999999999999');
      expect(actual).assertEqual('99999999999999');
      log('testFormatDotsBoundary0045 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0046
     * @tc.name      testFormatNationalBoundary0046
     * @tc.desc      formatNational with 15 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNationalBoundary0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNationalBoundary0046 begin');
      const actual: string = CallNumberFormatter.formatNational('999999999999999');
      expect(actual).assertEqual('999999999999999');
      log('testFormatNationalBoundary0046 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0047
     * @tc.name      testFormatDashesBoundary0047
     * @tc.desc      formatDashes with 15 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashesBoundary0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashesBoundary0047 begin');
      const actual: string = CallNumberFormatter.formatDashes('999999999999999');
      expect(actual).assertEqual('999999999999999');
      log('testFormatDashesBoundary0047 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0048
     * @tc.name      testFormatDotsBoundary0048
     * @tc.desc      formatDots with 15 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDotsBoundary0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDotsBoundary0048 begin');
      const actual: string = CallNumberFormatter.formatDots('999999999999999');
      expect(actual).assertEqual('999999999999999');
      log('testFormatDotsBoundary0048 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0049
     * @tc.name      testFormatNationalBoundary0049
     * @tc.desc      formatNational with 16 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNationalBoundary0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNationalBoundary0049 begin');
      const actual: string = CallNumberFormatter.formatNational('9999999999999999');
      expect(actual).assertEqual('9999999999999999');
      log('testFormatNationalBoundary0049 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0050
     * @tc.name      testFormatDashesBoundary0050
     * @tc.desc      formatDashes with 16 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashesBoundary0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashesBoundary0050 begin');
      const actual: string = CallNumberFormatter.formatDashes('9999999999999999');
      expect(actual).assertEqual('9999999999999999');
      log('testFormatDashesBoundary0050 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0051
     * @tc.name      testFormatDotsBoundary0051
     * @tc.desc      formatDots with 16 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDotsBoundary0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDotsBoundary0051 begin');
      const actual: string = CallNumberFormatter.formatDots('9999999999999999');
      expect(actual).assertEqual('9999999999999999');
      log('testFormatDotsBoundary0051 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0052
     * @tc.name      testFormatNationalBoundary0052
     * @tc.desc      formatNational with 17 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNationalBoundary0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNationalBoundary0052 begin');
      const actual: string = CallNumberFormatter.formatNational('99999999999999999');
      expect(actual).assertEqual('99999999999999999');
      log('testFormatNationalBoundary0052 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0053
     * @tc.name      testFormatDashesBoundary0053
     * @tc.desc      formatDashes with 17 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashesBoundary0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashesBoundary0053 begin');
      const actual: string = CallNumberFormatter.formatDashes('99999999999999999');
      expect(actual).assertEqual('99999999999999999');
      log('testFormatDashesBoundary0053 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0054
     * @tc.name      testFormatDotsBoundary0054
     * @tc.desc      formatDots with 17 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDotsBoundary0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDotsBoundary0054 begin');
      const actual: string = CallNumberFormatter.formatDots('99999999999999999');
      expect(actual).assertEqual('99999999999999999');
      log('testFormatDotsBoundary0054 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0055
     * @tc.name      testFormatNationalBoundary0055
     * @tc.desc      formatNational with 18 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNationalBoundary0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNationalBoundary0055 begin');
      const actual: string = CallNumberFormatter.formatNational('999999999999999999');
      expect(actual).assertEqual('999999999999999999');
      log('testFormatNationalBoundary0055 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0056
     * @tc.name      testFormatDashesBoundary0056
     * @tc.desc      formatDashes with 18 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashesBoundary0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashesBoundary0056 begin');
      const actual: string = CallNumberFormatter.formatDashes('999999999999999999');
      expect(actual).assertEqual('999999999999999999');
      log('testFormatDashesBoundary0056 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0057
     * @tc.name      testFormatDotsBoundary0057
     * @tc.desc      formatDots with 18 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDotsBoundary0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDotsBoundary0057 begin');
      const actual: string = CallNumberFormatter.formatDots('999999999999999999');
      expect(actual).assertEqual('999999999999999999');
      log('testFormatDotsBoundary0057 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0058
     * @tc.name      testFormatNationalBoundary0058
     * @tc.desc      formatNational with 19 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNationalBoundary0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNationalBoundary0058 begin');
      const actual: string = CallNumberFormatter.formatNational('9999999999999999999');
      expect(actual).assertEqual('9999999999999999999');
      log('testFormatNationalBoundary0058 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0059
     * @tc.name      testFormatDashesBoundary0059
     * @tc.desc      formatDashes with 19 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashesBoundary0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashesBoundary0059 begin');
      const actual: string = CallNumberFormatter.formatDashes('9999999999999999999');
      expect(actual).assertEqual('9999999999999999999');
      log('testFormatDashesBoundary0059 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0060
     * @tc.name      testFormatDotsBoundary0060
     * @tc.desc      formatDots with 19 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDotsBoundary0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDotsBoundary0060 begin');
      const actual: string = CallNumberFormatter.formatDots('9999999999999999999');
      expect(actual).assertEqual('9999999999999999999');
      log('testFormatDotsBoundary0060 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0061
     * @tc.name      testFormatNationalBoundary0061
     * @tc.desc      formatNational with 20 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNationalBoundary0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNationalBoundary0061 begin');
      const actual: string = CallNumberFormatter.formatNational('99999999999999999999');
      expect(actual).assertEqual('99999999999999999999');
      log('testFormatNationalBoundary0061 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0062
     * @tc.name      testFormatDashesBoundary0062
     * @tc.desc      formatDashes with 20 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashesBoundary0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashesBoundary0062 begin');
      const actual: string = CallNumberFormatter.formatDashes('99999999999999999999');
      expect(actual).assertEqual('99999999999999999999');
      log('testFormatDashesBoundary0062 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0063
     * @tc.name      testFormatDotsBoundary0063
     * @tc.desc      formatDots with 20 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDotsBoundary0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDotsBoundary0063 begin');
      const actual: string = CallNumberFormatter.formatDots('99999999999999999999');
      expect(actual).assertEqual('99999999999999999999');
      log('testFormatDotsBoundary0063 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0064
     * @tc.name      testFormatNationalBoundary0064
     * @tc.desc      formatNational with 21 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNationalBoundary0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNationalBoundary0064 begin');
      const actual: string = CallNumberFormatter.formatNational('999999999999999999999');
      expect(actual).assertEqual('999999999999999999999');
      log('testFormatNationalBoundary0064 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0065
     * @tc.name      testFormatDashesBoundary0065
     * @tc.desc      formatDashes with 21 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashesBoundary0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashesBoundary0065 begin');
      const actual: string = CallNumberFormatter.formatDashes('999999999999999999999');
      expect(actual).assertEqual('999999999999999999999');
      log('testFormatDashesBoundary0065 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0066
     * @tc.name      testFormatDotsBoundary0066
     * @tc.desc      formatDots with 21 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDotsBoundary0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDotsBoundary0066 begin');
      const actual: string = CallNumberFormatter.formatDots('999999999999999999999');
      expect(actual).assertEqual('999999999999999999999');
      log('testFormatDotsBoundary0066 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0067
     * @tc.name      testFormatNationalBoundary0067
     * @tc.desc      formatNational with 22 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNationalBoundary0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNationalBoundary0067 begin');
      const actual: string = CallNumberFormatter.formatNational('9999999999999999999999');
      expect(actual).assertEqual('9999999999999999999999');
      log('testFormatNationalBoundary0067 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0068
     * @tc.name      testFormatDashesBoundary0068
     * @tc.desc      formatDashes with 22 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashesBoundary0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashesBoundary0068 begin');
      const actual: string = CallNumberFormatter.formatDashes('9999999999999999999999');
      expect(actual).assertEqual('9999999999999999999999');
      log('testFormatDashesBoundary0068 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0069
     * @tc.name      testFormatDotsBoundary0069
     * @tc.desc      formatDots with 22 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDotsBoundary0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDotsBoundary0069 begin');
      const actual: string = CallNumberFormatter.formatDots('9999999999999999999999');
      expect(actual).assertEqual('9999999999999999999999');
      log('testFormatDotsBoundary0069 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0070
     * @tc.name      testFormatNationalBoundary0070
     * @tc.desc      formatNational with 23 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNationalBoundary0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNationalBoundary0070 begin');
      const actual: string = CallNumberFormatter.formatNational('99999999999999999999999');
      expect(actual).assertEqual('99999999999999999999999');
      log('testFormatNationalBoundary0070 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0071
     * @tc.name      testFormatDashesBoundary0071
     * @tc.desc      formatDashes with 23 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashesBoundary0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashesBoundary0071 begin');
      const actual: string = CallNumberFormatter.formatDashes('99999999999999999999999');
      expect(actual).assertEqual('99999999999999999999999');
      log('testFormatDashesBoundary0071 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0072
     * @tc.name      testFormatDotsBoundary0072
     * @tc.desc      formatDots with 23 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDotsBoundary0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDotsBoundary0072 begin');
      const actual: string = CallNumberFormatter.formatDots('99999999999999999999999');
      expect(actual).assertEqual('99999999999999999999999');
      log('testFormatDotsBoundary0072 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0073
     * @tc.name      testFormatNationalBoundary0073
     * @tc.desc      formatNational with 24 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNationalBoundary0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNationalBoundary0073 begin');
      const actual: string = CallNumberFormatter.formatNational('999999999999999999999999');
      expect(actual).assertEqual('999999999999999999999999');
      log('testFormatNationalBoundary0073 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0074
     * @tc.name      testFormatDashesBoundary0074
     * @tc.desc      formatDashes with 24 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashesBoundary0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashesBoundary0074 begin');
      const actual: string = CallNumberFormatter.formatDashes('999999999999999999999999');
      expect(actual).assertEqual('999999999999999999999999');
      log('testFormatDashesBoundary0074 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0075
     * @tc.name      testFormatDotsBoundary0075
     * @tc.desc      formatDots with 24 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDotsBoundary0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDotsBoundary0075 begin');
      const actual: string = CallNumberFormatter.formatDots('999999999999999999999999');
      expect(actual).assertEqual('999999999999999999999999');
      log('testFormatDotsBoundary0075 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0076
     * @tc.name      testPlusBoundary0076
     * @tc.desc      formatNational with plus and 0 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPlusBoundary0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testPlusBoundary0076 begin');
      const actual: string = CallNumberFormatter.formatNational('+');
      expect(actual).assertEqual('+');
      log('testPlusBoundary0076 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0077
     * @tc.name      testPlusBoundary0077
     * @tc.desc      formatNational with plus and 1 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPlusBoundary0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testPlusBoundary0077 begin');
      const actual: string = CallNumberFormatter.formatNational('+8');
      expect(actual).assertEqual('+8');
      log('testPlusBoundary0077 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0078
     * @tc.name      testPlusBoundary0078
     * @tc.desc      formatNational with plus and 2 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPlusBoundary0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testPlusBoundary0078 begin');
      const actual: string = CallNumberFormatter.formatNational('+88');
      expect(actual).assertEqual('+88');
      log('testPlusBoundary0078 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0079
     * @tc.name      testPlusBoundary0079
     * @tc.desc      formatNational with plus and 3 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPlusBoundary0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testPlusBoundary0079 begin');
      const actual: string = CallNumberFormatter.formatNational('+888');
      expect(actual).assertEqual('+888');
      log('testPlusBoundary0079 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0080
     * @tc.name      testPlusBoundary0080
     * @tc.desc      formatNational with plus and 4 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPlusBoundary0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testPlusBoundary0080 begin');
      const actual: string = CallNumberFormatter.formatNational('+8888');
      expect(actual).assertEqual('+8888');
      log('testPlusBoundary0080 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0081
     * @tc.name      testPlusBoundary0081
     * @tc.desc      formatNational with plus and 5 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPlusBoundary0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testPlusBoundary0081 begin');
      const actual: string = CallNumberFormatter.formatNational('+88888');
      expect(actual).assertEqual('+88888');
      log('testPlusBoundary0081 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0082
     * @tc.name      testPlusBoundary0082
     * @tc.desc      formatNational with plus and 6 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPlusBoundary0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testPlusBoundary0082 begin');
      const actual: string = CallNumberFormatter.formatNational('+888888');
      expect(actual).assertEqual('+888888');
      log('testPlusBoundary0082 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0083
     * @tc.name      testPlusBoundary0083
     * @tc.desc      formatNational with plus and 7 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPlusBoundary0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testPlusBoundary0083 begin');
      const actual: string = CallNumberFormatter.formatNational('+8888888');
      expect(actual).assertEqual('+8888888');
      log('testPlusBoundary0083 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0084
     * @tc.name      testPlusBoundary0084
     * @tc.desc      formatNational with plus and 8 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPlusBoundary0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testPlusBoundary0084 begin');
      const actual: string = CallNumberFormatter.formatNational('+88888888');
      expect(actual).assertEqual('+8888 8888');
      log('testPlusBoundary0084 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0085
     * @tc.name      testPlusBoundary0085
     * @tc.desc      formatNational with plus and 9 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPlusBoundary0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testPlusBoundary0085 begin');
      const actual: string = CallNumberFormatter.formatNational('+888888888');
      expect(actual).assertEqual('+888888888');
      log('testPlusBoundary0085 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0086
     * @tc.name      testPlusBoundary0086
     * @tc.desc      formatNational with plus and 10 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPlusBoundary0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testPlusBoundary0086 begin');
      const actual: string = CallNumberFormatter.formatNational('+8888888888');
      expect(actual).assertEqual('+888 888 8888');
      log('testPlusBoundary0086 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0087
     * @tc.name      testPlusBoundary0087
     * @tc.desc      formatNational with plus and 11 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPlusBoundary0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testPlusBoundary0087 begin');
      const actual: string = CallNumberFormatter.formatNational('+88888888888');
      expect(actual).assertEqual('+888 8888 8888');
      log('testPlusBoundary0087 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0088
     * @tc.name      testPlusBoundary0088
     * @tc.desc      formatNational with plus and 12 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPlusBoundary0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testPlusBoundary0088 begin');
      const actual: string = CallNumberFormatter.formatNational('+888888888888');
      expect(actual).assertEqual('+888888888888');
      log('testPlusBoundary0088 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0089
     * @tc.name      testPlusBoundary0089
     * @tc.desc      formatNational with plus and 13 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPlusBoundary0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testPlusBoundary0089 begin');
      const actual: string = CallNumberFormatter.formatNational('+8888888888888');
      expect(actual).assertEqual('+8888888888888');
      log('testPlusBoundary0089 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0090
     * @tc.name      testPlusBoundary0090
     * @tc.desc      formatNational with plus and 14 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPlusBoundary0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testPlusBoundary0090 begin');
      const actual: string = CallNumberFormatter.formatNational('+88888888888888');
      expect(actual).assertEqual('+88888888888888');
      log('testPlusBoundary0090 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0091
     * @tc.name      testPlusBoundary0091
     * @tc.desc      formatNational with plus and 15 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPlusBoundary0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testPlusBoundary0091 begin');
      const actual: string = CallNumberFormatter.formatNational('+888888888888888');
      expect(actual).assertEqual('+888888888888888');
      log('testPlusBoundary0091 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0092
     * @tc.name      testPlusBoundary0092
     * @tc.desc      formatNational with plus and 16 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPlusBoundary0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testPlusBoundary0092 begin');
      const actual: string = CallNumberFormatter.formatNational('+8888888888888888');
      expect(actual).assertEqual('+8888888888888888');
      log('testPlusBoundary0092 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0093
     * @tc.name      testPlusBoundary0093
     * @tc.desc      formatNational with plus and 17 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPlusBoundary0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testPlusBoundary0093 begin');
      const actual: string = CallNumberFormatter.formatNational('+88888888888888888');
      expect(actual).assertEqual('+88888888888888888');
      log('testPlusBoundary0093 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0094
     * @tc.name      testPlusBoundary0094
     * @tc.desc      formatNational with plus and 18 digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPlusBoundary0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testPlusBoundary0094 begin');
      const actual: string = CallNumberFormatter.formatNational('+888888888888888888');
      expect(actual).assertEqual('+888888888888888888');
      log('testPlusBoundary0094 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0095
     * @tc.name      testValidateBoundary0095
     * @tc.desc      validate(1 digits) -> TOO_SHORT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidateBoundary0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidateBoundary0095 begin');
      const result: ValidationResult = DialValidator.validate('7');
      expect(result.reason).assertEqual('TOO_SHORT');
      log('testValidateBoundary0095 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0096
     * @tc.name      testValidateBoundary0096
     * @tc.desc      validate(2 digits) -> TOO_SHORT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidateBoundary0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidateBoundary0096 begin');
      const result: ValidationResult = DialValidator.validate('77');
      expect(result.reason).assertEqual('TOO_SHORT');
      log('testValidateBoundary0096 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0097
     * @tc.name      testValidateBoundary0097
     * @tc.desc      validate(3 digits) -> OK
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidateBoundary0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidateBoundary0097 begin');
      const result: ValidationResult = DialValidator.validate('777');
      expect(result.reason).assertEqual('OK');
      log('testValidateBoundary0097 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0098
     * @tc.name      testValidateBoundary0098
     * @tc.desc      validate(4 digits) -> OK
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidateBoundary0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidateBoundary0098 begin');
      const result: ValidationResult = DialValidator.validate('7777');
      expect(result.reason).assertEqual('OK');
      log('testValidateBoundary0098 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0099
     * @tc.name      testValidateBoundary0099
     * @tc.desc      validate(5 digits) -> OK
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidateBoundary0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidateBoundary0099 begin');
      const result: ValidationResult = DialValidator.validate('77777');
      expect(result.reason).assertEqual('OK');
      log('testValidateBoundary0099 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0100
     * @tc.name      testValidateBoundary0100
     * @tc.desc      validate(6 digits) -> OK
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidateBoundary0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidateBoundary0100 begin');
      const result: ValidationResult = DialValidator.validate('777777');
      expect(result.reason).assertEqual('OK');
      log('testValidateBoundary0100 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0101
     * @tc.name      testValidateBoundary0101
     * @tc.desc      validate(7 digits) -> OK
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidateBoundary0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidateBoundary0101 begin');
      const result: ValidationResult = DialValidator.validate('7777777');
      expect(result.reason).assertEqual('OK');
      log('testValidateBoundary0101 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0102
     * @tc.name      testValidateBoundary0102
     * @tc.desc      validate(8 digits) -> OK
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidateBoundary0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidateBoundary0102 begin');
      const result: ValidationResult = DialValidator.validate('77777777');
      expect(result.reason).assertEqual('OK');
      log('testValidateBoundary0102 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0103
     * @tc.name      testValidateBoundary0103
     * @tc.desc      validate(9 digits) -> OK
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidateBoundary0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidateBoundary0103 begin');
      const result: ValidationResult = DialValidator.validate('777777777');
      expect(result.reason).assertEqual('OK');
      log('testValidateBoundary0103 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0104
     * @tc.name      testValidateBoundary0104
     * @tc.desc      validate(10 digits) -> OK
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidateBoundary0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidateBoundary0104 begin');
      const result: ValidationResult = DialValidator.validate('7777777777');
      expect(result.reason).assertEqual('OK');
      log('testValidateBoundary0104 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0105
     * @tc.name      testValidateBoundary0105
     * @tc.desc      validate(11 digits) -> OK
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidateBoundary0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidateBoundary0105 begin');
      const result: ValidationResult = DialValidator.validate('77777777777');
      expect(result.reason).assertEqual('OK');
      log('testValidateBoundary0105 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0106
     * @tc.name      testValidateBoundary0106
     * @tc.desc      validate(12 digits) -> TOO_LONG
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidateBoundary0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidateBoundary0106 begin');
      const result: ValidationResult = DialValidator.validate('777777777777');
      expect(result.reason).assertEqual('TOO_LONG');
      log('testValidateBoundary0106 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0107
     * @tc.name      testValidateBoundary0107
     * @tc.desc      validate(13 digits) -> TOO_LONG
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidateBoundary0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidateBoundary0107 begin');
      const result: ValidationResult = DialValidator.validate('7777777777777');
      expect(result.reason).assertEqual('TOO_LONG');
      log('testValidateBoundary0107 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0108
     * @tc.name      testValidateBoundary0108
     * @tc.desc      validate(14 digits) -> TOO_LONG
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidateBoundary0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidateBoundary0108 begin');
      const result: ValidationResult = DialValidator.validate('77777777777777');
      expect(result.reason).assertEqual('TOO_LONG');
      log('testValidateBoundary0108 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0109
     * @tc.name      testValidateBoundary0109
     * @tc.desc      validate(15 digits) -> TOO_LONG
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidateBoundary0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidateBoundary0109 begin');
      const result: ValidationResult = DialValidator.validate('777777777777777');
      expect(result.reason).assertEqual('TOO_LONG');
      log('testValidateBoundary0109 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0110
     * @tc.name      testValidateBoundary0110
     * @tc.desc      validate(16 digits) -> TOO_LONG
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidateBoundary0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidateBoundary0110 begin');
      const result: ValidationResult = DialValidator.validate('7777777777777777');
      expect(result.reason).assertEqual('TOO_LONG');
      log('testValidateBoundary0110 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0111
     * @tc.name      testValidateBoundary0111
     * @tc.desc      validate(17 digits) -> TOO_LONG
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidateBoundary0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidateBoundary0111 begin');
      const result: ValidationResult = DialValidator.validate('77777777777777777');
      expect(result.reason).assertEqual('TOO_LONG');
      log('testValidateBoundary0111 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0112
     * @tc.name      testValidateBoundary0112
     * @tc.desc      validate(18 digits) -> TOO_LONG
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidateBoundary0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidateBoundary0112 begin');
      const result: ValidationResult = DialValidator.validate('777777777777777777');
      expect(result.reason).assertEqual('TOO_LONG');
      log('testValidateBoundary0112 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0113
     * @tc.name      testValidateBoundary0113
     * @tc.desc      validate(19 digits) -> TOO_LONG
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidateBoundary0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidateBoundary0113 begin');
      const result: ValidationResult = DialValidator.validate('7777777777777777777');
      expect(result.reason).assertEqual('TOO_LONG');
      log('testValidateBoundary0113 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_BOUNDARY_0114
     * @tc.name      testValidateBoundary0114
     * @tc.desc      validate(20 digits) -> TOO_LONG
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidateBoundary0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidateBoundary0114 begin');
      const result: ValidationResult = DialValidator.validate('77777777777777777777');
      expect(result.reason).assertEqual('TOO_LONG');
      log('testValidateBoundary0114 end');
      await yieldToMain();
    })
  })
}
