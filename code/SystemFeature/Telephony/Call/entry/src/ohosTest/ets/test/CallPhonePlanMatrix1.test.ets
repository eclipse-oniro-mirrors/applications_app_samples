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
const TAG: string = 'CallPhonePlanMatrix1';
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

export default function callPhonePlanMatrix1Test(): void {
  describe('CallPhonePlanMatrix1', () => {
    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0001
     * @tc.name      testCallingCode0001
     * @tc.desc      callingCode(CN) -> +86
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallingCode0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallingCode0001 begin');
      const actual: string = PhoneNumberPlan.callingCode('CN');
      expect(actual).assertEqual('+86');
      log('testCallingCode0001 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0002
     * @tc.name      testCallingCodeLower0002
     * @tc.desc      callingCode accepts lower case region cn
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallingCodeLower0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallingCodeLower0002 begin');
      const actual: string = PhoneNumberPlan.callingCode('cn');
      expect(actual).assertEqual('+86');
      log('testCallingCodeLower0002 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0003
     * @tc.name      testRegionOf0003
     * @tc.desc      regionOf(+86) -> CN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRegionOf0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRegionOf0003 begin');
      const actual: string = PhoneNumberPlan.regionOf('+86');
      expect(actual).assertEqual('CN');
      log('testRegionOf0003 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0004
     * @tc.name      testValidLength0004
     * @tc.desc      isValidLength(CN,11 digits) is true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidLength0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidLength0004 begin');
      const actual: boolean = PhoneNumberPlan.isValidLength('CN', '11111111111');
      expect(actual).assertTrue();
      log('testValidLength0004 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0005
     * @tc.name      testInvalidLength0005
     * @tc.desc      isValidLength(CN,13 digits) is false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testInvalidLength0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testInvalidLength0005 begin');
      const actual: boolean = PhoneNumberPlan.isValidLength('CN', '1111111111111');
      expect(actual).assertFalse();
      log('testInvalidLength0005 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0006
     * @tc.name      testE1640006
     * @tc.desc      e164(CN) joins the calling code
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testE1640006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testE1640006 begin');
      const actual: string = PhoneNumberPlan.e164('CN', '11111111111');
      expect(actual).assertEqual('+8611111111111');
      log('testE1640006 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0007
     * @tc.name      testParseE1640007
     * @tc.desc      parseE164(+8611111111111) restores region and national number
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseE1640007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testParseE1640007 begin');
      const actual: string[] = PhoneNumberPlan.parseE164('+8611111111111');
      expect(actual[0]).assertEqual('CN');
      expect(actual[1]).assertEqual('11111111111');
      log('testParseE1640007 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0008
     * @tc.name      testCallingCode0008
     * @tc.desc      callingCode(US) -> +1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallingCode0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallingCode0008 begin');
      const actual: string = PhoneNumberPlan.callingCode('US');
      expect(actual).assertEqual('+1');
      log('testCallingCode0008 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0009
     * @tc.name      testCallingCodeLower0009
     * @tc.desc      callingCode accepts lower case region us
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallingCodeLower0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallingCodeLower0009 begin');
      const actual: string = PhoneNumberPlan.callingCode('us');
      expect(actual).assertEqual('+1');
      log('testCallingCodeLower0009 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0010
     * @tc.name      testRegionOf0010
     * @tc.desc      regionOf(+1) -> US
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRegionOf0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRegionOf0010 begin');
      const actual: string = PhoneNumberPlan.regionOf('+1');
      expect(actual).assertEqual('US');
      log('testRegionOf0010 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0011
     * @tc.name      testValidLength0011
     * @tc.desc      isValidLength(US,10 digits) is true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidLength0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidLength0011 begin');
      const actual: boolean = PhoneNumberPlan.isValidLength('US', '1111111111');
      expect(actual).assertTrue();
      log('testValidLength0011 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0012
     * @tc.name      testInvalidLength0012
     * @tc.desc      isValidLength(US,12 digits) is false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testInvalidLength0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testInvalidLength0012 begin');
      const actual: boolean = PhoneNumberPlan.isValidLength('US', '111111111111');
      expect(actual).assertFalse();
      log('testInvalidLength0012 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0013
     * @tc.name      testE1640013
     * @tc.desc      e164(US) joins the calling code
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testE1640013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testE1640013 begin');
      const actual: string = PhoneNumberPlan.e164('US', '1111111111');
      expect(actual).assertEqual('+11111111111');
      log('testE1640013 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0014
     * @tc.name      testParseE1640014
     * @tc.desc      parseE164(+11111111111) restores region and national number
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseE1640014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testParseE1640014 begin');
      const actual: string[] = PhoneNumberPlan.parseE164('+11111111111');
      expect(actual[0]).assertEqual('US');
      expect(actual[1]).assertEqual('1111111111');
      log('testParseE1640014 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0015
     * @tc.name      testCallingCode0015
     * @tc.desc      callingCode(CA) -> +1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallingCode0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallingCode0015 begin');
      const actual: string = PhoneNumberPlan.callingCode('CA');
      expect(actual).assertEqual('+1');
      log('testCallingCode0015 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0016
     * @tc.name      testCallingCodeLower0016
     * @tc.desc      callingCode accepts lower case region ca
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallingCodeLower0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallingCodeLower0016 begin');
      const actual: string = PhoneNumberPlan.callingCode('ca');
      expect(actual).assertEqual('+1');
      log('testCallingCodeLower0016 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0017
     * @tc.name      testRegionOf0017
     * @tc.desc      regionOf(+1) -> US
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRegionOf0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRegionOf0017 begin');
      const actual: string = PhoneNumberPlan.regionOf('+1');
      expect(actual).assertEqual('US');
      log('testRegionOf0017 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0018
     * @tc.name      testValidLength0018
     * @tc.desc      isValidLength(CA,10 digits) is true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidLength0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidLength0018 begin');
      const actual: boolean = PhoneNumberPlan.isValidLength('CA', '1111111111');
      expect(actual).assertTrue();
      log('testValidLength0018 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0019
     * @tc.name      testInvalidLength0019
     * @tc.desc      isValidLength(CA,12 digits) is false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testInvalidLength0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testInvalidLength0019 begin');
      const actual: boolean = PhoneNumberPlan.isValidLength('CA', '111111111111');
      expect(actual).assertFalse();
      log('testInvalidLength0019 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0020
     * @tc.name      testE1640020
     * @tc.desc      e164(CA) joins the calling code
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testE1640020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testE1640020 begin');
      const actual: string = PhoneNumberPlan.e164('CA', '1111111111');
      expect(actual).assertEqual('+11111111111');
      log('testE1640020 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0021
     * @tc.name      testParseE1640021
     * @tc.desc      parseE164(+11111111111) restores region and national number
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseE1640021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testParseE1640021 begin');
      const actual: string[] = PhoneNumberPlan.parseE164('+11111111111');
      expect(actual[0]).assertEqual('US');
      expect(actual[1]).assertEqual('1111111111');
      log('testParseE1640021 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0022
     * @tc.name      testCallingCode0022
     * @tc.desc      callingCode(GB) -> +44
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallingCode0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallingCode0022 begin');
      const actual: string = PhoneNumberPlan.callingCode('GB');
      expect(actual).assertEqual('+44');
      log('testCallingCode0022 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0023
     * @tc.name      testCallingCodeLower0023
     * @tc.desc      callingCode accepts lower case region gb
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallingCodeLower0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallingCodeLower0023 begin');
      const actual: string = PhoneNumberPlan.callingCode('gb');
      expect(actual).assertEqual('+44');
      log('testCallingCodeLower0023 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0024
     * @tc.name      testRegionOf0024
     * @tc.desc      regionOf(+44) -> GB
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRegionOf0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRegionOf0024 begin');
      const actual: string = PhoneNumberPlan.regionOf('+44');
      expect(actual).assertEqual('GB');
      log('testRegionOf0024 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0025
     * @tc.name      testValidLength0025
     * @tc.desc      isValidLength(GB,10 digits) is true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidLength0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidLength0025 begin');
      const actual: boolean = PhoneNumberPlan.isValidLength('GB', '1111111111');
      expect(actual).assertTrue();
      log('testValidLength0025 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0026
     * @tc.name      testInvalidLength0026
     * @tc.desc      isValidLength(GB,12 digits) is false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testInvalidLength0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testInvalidLength0026 begin');
      const actual: boolean = PhoneNumberPlan.isValidLength('GB', '111111111111');
      expect(actual).assertFalse();
      log('testInvalidLength0026 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0027
     * @tc.name      testE1640027
     * @tc.desc      e164(GB) joins the calling code
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testE1640027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testE1640027 begin');
      const actual: string = PhoneNumberPlan.e164('GB', '1111111111');
      expect(actual).assertEqual('+441111111111');
      log('testE1640027 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0028
     * @tc.name      testParseE1640028
     * @tc.desc      parseE164(+441111111111) restores region and national number
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseE1640028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testParseE1640028 begin');
      const actual: string[] = PhoneNumberPlan.parseE164('+441111111111');
      expect(actual[0]).assertEqual('GB');
      expect(actual[1]).assertEqual('1111111111');
      log('testParseE1640028 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0029
     * @tc.name      testCallingCode0029
     * @tc.desc      callingCode(JP) -> +81
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallingCode0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallingCode0029 begin');
      const actual: string = PhoneNumberPlan.callingCode('JP');
      expect(actual).assertEqual('+81');
      log('testCallingCode0029 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0030
     * @tc.name      testCallingCodeLower0030
     * @tc.desc      callingCode accepts lower case region jp
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallingCodeLower0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallingCodeLower0030 begin');
      const actual: string = PhoneNumberPlan.callingCode('jp');
      expect(actual).assertEqual('+81');
      log('testCallingCodeLower0030 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0031
     * @tc.name      testRegionOf0031
     * @tc.desc      regionOf(+81) -> JP
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRegionOf0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRegionOf0031 begin');
      const actual: string = PhoneNumberPlan.regionOf('+81');
      expect(actual).assertEqual('JP');
      log('testRegionOf0031 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0032
     * @tc.name      testValidLength0032
     * @tc.desc      isValidLength(JP,10 digits) is true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidLength0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidLength0032 begin');
      const actual: boolean = PhoneNumberPlan.isValidLength('JP', '1111111111');
      expect(actual).assertTrue();
      log('testValidLength0032 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0033
     * @tc.name      testInvalidLength0033
     * @tc.desc      isValidLength(JP,12 digits) is false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testInvalidLength0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testInvalidLength0033 begin');
      const actual: boolean = PhoneNumberPlan.isValidLength('JP', '111111111111');
      expect(actual).assertFalse();
      log('testInvalidLength0033 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0034
     * @tc.name      testE1640034
     * @tc.desc      e164(JP) joins the calling code
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testE1640034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testE1640034 begin');
      const actual: string = PhoneNumberPlan.e164('JP', '1111111111');
      expect(actual).assertEqual('+811111111111');
      log('testE1640034 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0035
     * @tc.name      testParseE1640035
     * @tc.desc      parseE164(+811111111111) restores region and national number
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseE1640035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testParseE1640035 begin');
      const actual: string[] = PhoneNumberPlan.parseE164('+811111111111');
      expect(actual[0]).assertEqual('JP');
      expect(actual[1]).assertEqual('1111111111');
      log('testParseE1640035 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0036
     * @tc.name      testCallingCode0036
     * @tc.desc      callingCode(DE) -> +49
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallingCode0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallingCode0036 begin');
      const actual: string = PhoneNumberPlan.callingCode('DE');
      expect(actual).assertEqual('+49');
      log('testCallingCode0036 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0037
     * @tc.name      testCallingCodeLower0037
     * @tc.desc      callingCode accepts lower case region de
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallingCodeLower0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallingCodeLower0037 begin');
      const actual: string = PhoneNumberPlan.callingCode('de');
      expect(actual).assertEqual('+49');
      log('testCallingCodeLower0037 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0038
     * @tc.name      testRegionOf0038
     * @tc.desc      regionOf(+49) -> DE
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRegionOf0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRegionOf0038 begin');
      const actual: string = PhoneNumberPlan.regionOf('+49');
      expect(actual).assertEqual('DE');
      log('testRegionOf0038 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0039
     * @tc.name      testValidLength0039
     * @tc.desc      isValidLength(DE,10 digits) is true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidLength0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidLength0039 begin');
      const actual: boolean = PhoneNumberPlan.isValidLength('DE', '1111111111');
      expect(actual).assertTrue();
      log('testValidLength0039 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0040
     * @tc.name      testInvalidLength0040
     * @tc.desc      isValidLength(DE,12 digits) is false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testInvalidLength0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testInvalidLength0040 begin');
      const actual: boolean = PhoneNumberPlan.isValidLength('DE', '111111111111');
      expect(actual).assertFalse();
      log('testInvalidLength0040 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0041
     * @tc.name      testValidLength0041
     * @tc.desc      isValidLength(DE,11 digits) is true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidLength0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidLength0041 begin');
      const actual: boolean = PhoneNumberPlan.isValidLength('DE', '11111111111');
      expect(actual).assertTrue();
      log('testValidLength0041 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0042
     * @tc.name      testInvalidLength0042
     * @tc.desc      isValidLength(DE,13 digits) is false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testInvalidLength0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testInvalidLength0042 begin');
      const actual: boolean = PhoneNumberPlan.isValidLength('DE', '1111111111111');
      expect(actual).assertFalse();
      log('testInvalidLength0042 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0043
     * @tc.name      testE1640043
     * @tc.desc      e164(DE) joins the calling code
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testE1640043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testE1640043 begin');
      const actual: string = PhoneNumberPlan.e164('DE', '1111111111');
      expect(actual).assertEqual('+491111111111');
      log('testE1640043 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0044
     * @tc.name      testParseE1640044
     * @tc.desc      parseE164(+491111111111) restores region and national number
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseE1640044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testParseE1640044 begin');
      const actual: string[] = PhoneNumberPlan.parseE164('+491111111111');
      expect(actual[0]).assertEqual('DE');
      expect(actual[1]).assertEqual('1111111111');
      log('testParseE1640044 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0045
     * @tc.name      testCallingCode0045
     * @tc.desc      callingCode(FR) -> +33
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallingCode0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallingCode0045 begin');
      const actual: string = PhoneNumberPlan.callingCode('FR');
      expect(actual).assertEqual('+33');
      log('testCallingCode0045 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0046
     * @tc.name      testCallingCodeLower0046
     * @tc.desc      callingCode accepts lower case region fr
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallingCodeLower0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallingCodeLower0046 begin');
      const actual: string = PhoneNumberPlan.callingCode('fr');
      expect(actual).assertEqual('+33');
      log('testCallingCodeLower0046 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0047
     * @tc.name      testRegionOf0047
     * @tc.desc      regionOf(+33) -> FR
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRegionOf0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRegionOf0047 begin');
      const actual: string = PhoneNumberPlan.regionOf('+33');
      expect(actual).assertEqual('FR');
      log('testRegionOf0047 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0048
     * @tc.name      testValidLength0048
     * @tc.desc      isValidLength(FR,9 digits) is true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidLength0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidLength0048 begin');
      const actual: boolean = PhoneNumberPlan.isValidLength('FR', '111111111');
      expect(actual).assertTrue();
      log('testValidLength0048 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0049
     * @tc.name      testInvalidLength0049
     * @tc.desc      isValidLength(FR,11 digits) is false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testInvalidLength0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testInvalidLength0049 begin');
      const actual: boolean = PhoneNumberPlan.isValidLength('FR', '11111111111');
      expect(actual).assertFalse();
      log('testInvalidLength0049 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0050
     * @tc.name      testE1640050
     * @tc.desc      e164(FR) joins the calling code
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testE1640050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testE1640050 begin');
      const actual: string = PhoneNumberPlan.e164('FR', '111111111');
      expect(actual).assertEqual('+33111111111');
      log('testE1640050 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0051
     * @tc.name      testParseE1640051
     * @tc.desc      parseE164(+33111111111) restores region and national number
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseE1640051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testParseE1640051 begin');
      const actual: string[] = PhoneNumberPlan.parseE164('+33111111111');
      expect(actual[0]).assertEqual('FR');
      expect(actual[1]).assertEqual('111111111');
      log('testParseE1640051 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0052
     * @tc.name      testCallingCode0052
     * @tc.desc      callingCode(IN) -> +91
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallingCode0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallingCode0052 begin');
      const actual: string = PhoneNumberPlan.callingCode('IN');
      expect(actual).assertEqual('+91');
      log('testCallingCode0052 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0053
     * @tc.name      testCallingCodeLower0053
     * @tc.desc      callingCode accepts lower case region in
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallingCodeLower0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallingCodeLower0053 begin');
      const actual: string = PhoneNumberPlan.callingCode('in');
      expect(actual).assertEqual('+91');
      log('testCallingCodeLower0053 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0054
     * @tc.name      testRegionOf0054
     * @tc.desc      regionOf(+91) -> IN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRegionOf0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRegionOf0054 begin');
      const actual: string = PhoneNumberPlan.regionOf('+91');
      expect(actual).assertEqual('IN');
      log('testRegionOf0054 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0055
     * @tc.name      testValidLength0055
     * @tc.desc      isValidLength(IN,10 digits) is true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidLength0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidLength0055 begin');
      const actual: boolean = PhoneNumberPlan.isValidLength('IN', '1111111111');
      expect(actual).assertTrue();
      log('testValidLength0055 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0056
     * @tc.name      testInvalidLength0056
     * @tc.desc      isValidLength(IN,12 digits) is false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testInvalidLength0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testInvalidLength0056 begin');
      const actual: boolean = PhoneNumberPlan.isValidLength('IN', '111111111111');
      expect(actual).assertFalse();
      log('testInvalidLength0056 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0057
     * @tc.name      testE1640057
     * @tc.desc      e164(IN) joins the calling code
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testE1640057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testE1640057 begin');
      const actual: string = PhoneNumberPlan.e164('IN', '1111111111');
      expect(actual).assertEqual('+911111111111');
      log('testE1640057 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0058
     * @tc.name      testParseE1640058
     * @tc.desc      parseE164(+911111111111) restores region and national number
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseE1640058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testParseE1640058 begin');
      const actual: string[] = PhoneNumberPlan.parseE164('+911111111111');
      expect(actual[0]).assertEqual('IN');
      expect(actual[1]).assertEqual('1111111111');
      log('testParseE1640058 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0059
     * @tc.name      testCallingCode0059
     * @tc.desc      callingCode(KR) -> +82
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallingCode0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallingCode0059 begin');
      const actual: string = PhoneNumberPlan.callingCode('KR');
      expect(actual).assertEqual('+82');
      log('testCallingCode0059 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0060
     * @tc.name      testCallingCodeLower0060
     * @tc.desc      callingCode accepts lower case region kr
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallingCodeLower0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallingCodeLower0060 begin');
      const actual: string = PhoneNumberPlan.callingCode('kr');
      expect(actual).assertEqual('+82');
      log('testCallingCodeLower0060 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0061
     * @tc.name      testRegionOf0061
     * @tc.desc      regionOf(+82) -> KR
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRegionOf0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRegionOf0061 begin');
      const actual: string = PhoneNumberPlan.regionOf('+82');
      expect(actual).assertEqual('KR');
      log('testRegionOf0061 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0062
     * @tc.name      testValidLength0062
     * @tc.desc      isValidLength(KR,9 digits) is true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidLength0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidLength0062 begin');
      const actual: boolean = PhoneNumberPlan.isValidLength('KR', '111111111');
      expect(actual).assertTrue();
      log('testValidLength0062 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0063
     * @tc.name      testInvalidLength0063
     * @tc.desc      isValidLength(KR,11 digits) is false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testInvalidLength0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testInvalidLength0063 begin');
      const actual: boolean = PhoneNumberPlan.isValidLength('KR', '11111111111');
      expect(actual).assertFalse();
      log('testInvalidLength0063 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0064
     * @tc.name      testValidLength0064
     * @tc.desc      isValidLength(KR,10 digits) is true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidLength0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidLength0064 begin');
      const actual: boolean = PhoneNumberPlan.isValidLength('KR', '1111111111');
      expect(actual).assertTrue();
      log('testValidLength0064 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0065
     * @tc.name      testInvalidLength0065
     * @tc.desc      isValidLength(KR,12 digits) is false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testInvalidLength0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testInvalidLength0065 begin');
      const actual: boolean = PhoneNumberPlan.isValidLength('KR', '111111111111');
      expect(actual).assertFalse();
      log('testInvalidLength0065 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0066
     * @tc.name      testE1640066
     * @tc.desc      e164(KR) joins the calling code
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testE1640066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testE1640066 begin');
      const actual: string = PhoneNumberPlan.e164('KR', '111111111');
      expect(actual).assertEqual('+82111111111');
      log('testE1640066 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0067
     * @tc.name      testParseE1640067
     * @tc.desc      parseE164(+82111111111) restores region and national number
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseE1640067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testParseE1640067 begin');
      const actual: string[] = PhoneNumberPlan.parseE164('+82111111111');
      expect(actual[0]).assertEqual('KR');
      expect(actual[1]).assertEqual('111111111');
      log('testParseE1640067 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0068
     * @tc.name      testCallingCode0068
     * @tc.desc      callingCode(SG) -> +65
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallingCode0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallingCode0068 begin');
      const actual: string = PhoneNumberPlan.callingCode('SG');
      expect(actual).assertEqual('+65');
      log('testCallingCode0068 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0069
     * @tc.name      testCallingCodeLower0069
     * @tc.desc      callingCode accepts lower case region sg
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallingCodeLower0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallingCodeLower0069 begin');
      const actual: string = PhoneNumberPlan.callingCode('sg');
      expect(actual).assertEqual('+65');
      log('testCallingCodeLower0069 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0070
     * @tc.name      testRegionOf0070
     * @tc.desc      regionOf(+65) -> SG
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRegionOf0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRegionOf0070 begin');
      const actual: string = PhoneNumberPlan.regionOf('+65');
      expect(actual).assertEqual('SG');
      log('testRegionOf0070 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0071
     * @tc.name      testValidLength0071
     * @tc.desc      isValidLength(SG,8 digits) is true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidLength0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidLength0071 begin');
      const actual: boolean = PhoneNumberPlan.isValidLength('SG', '11111111');
      expect(actual).assertTrue();
      log('testValidLength0071 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0072
     * @tc.name      testInvalidLength0072
     * @tc.desc      isValidLength(SG,10 digits) is false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testInvalidLength0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testInvalidLength0072 begin');
      const actual: boolean = PhoneNumberPlan.isValidLength('SG', '1111111111');
      expect(actual).assertFalse();
      log('testInvalidLength0072 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0073
     * @tc.name      testE1640073
     * @tc.desc      e164(SG) joins the calling code
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testE1640073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testE1640073 begin');
      const actual: string = PhoneNumberPlan.e164('SG', '11111111');
      expect(actual).assertEqual('+6511111111');
      log('testE1640073 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0074
     * @tc.name      testParseE1640074
     * @tc.desc      parseE164(+6511111111) restores region and national number
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseE1640074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testParseE1640074 begin');
      const actual: string[] = PhoneNumberPlan.parseE164('+6511111111');
      expect(actual[0]).assertEqual('SG');
      expect(actual[1]).assertEqual('11111111');
      log('testParseE1640074 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0075
     * @tc.name      testCallingCode0075
     * @tc.desc      callingCode(AU) -> +61
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallingCode0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallingCode0075 begin');
      const actual: string = PhoneNumberPlan.callingCode('AU');
      expect(actual).assertEqual('+61');
      log('testCallingCode0075 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0076
     * @tc.name      testCallingCodeLower0076
     * @tc.desc      callingCode accepts lower case region au
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallingCodeLower0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallingCodeLower0076 begin');
      const actual: string = PhoneNumberPlan.callingCode('au');
      expect(actual).assertEqual('+61');
      log('testCallingCodeLower0076 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0077
     * @tc.name      testRegionOf0077
     * @tc.desc      regionOf(+61) -> AU
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRegionOf0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRegionOf0077 begin');
      const actual: string = PhoneNumberPlan.regionOf('+61');
      expect(actual).assertEqual('AU');
      log('testRegionOf0077 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0078
     * @tc.name      testValidLength0078
     * @tc.desc      isValidLength(AU,9 digits) is true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidLength0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidLength0078 begin');
      const actual: boolean = PhoneNumberPlan.isValidLength('AU', '111111111');
      expect(actual).assertTrue();
      log('testValidLength0078 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0079
     * @tc.name      testInvalidLength0079
     * @tc.desc      isValidLength(AU,11 digits) is false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testInvalidLength0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testInvalidLength0079 begin');
      const actual: boolean = PhoneNumberPlan.isValidLength('AU', '11111111111');
      expect(actual).assertFalse();
      log('testInvalidLength0079 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0080
     * @tc.name      testE1640080
     * @tc.desc      e164(AU) joins the calling code
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testE1640080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testE1640080 begin');
      const actual: string = PhoneNumberPlan.e164('AU', '111111111');
      expect(actual).assertEqual('+61111111111');
      log('testE1640080 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0081
     * @tc.name      testParseE1640081
     * @tc.desc      parseE164(+61111111111) restores region and national number
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseE1640081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testParseE1640081 begin');
      const actual: string[] = PhoneNumberPlan.parseE164('+61111111111');
      expect(actual[0]).assertEqual('AU');
      expect(actual[1]).assertEqual('111111111');
      log('testParseE1640081 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0082
     * @tc.name      testCallingCode0082
     * @tc.desc      callingCode(BR) -> +55
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallingCode0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallingCode0082 begin');
      const actual: string = PhoneNumberPlan.callingCode('BR');
      expect(actual).assertEqual('+55');
      log('testCallingCode0082 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0083
     * @tc.name      testCallingCodeLower0083
     * @tc.desc      callingCode accepts lower case region br
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallingCodeLower0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallingCodeLower0083 begin');
      const actual: string = PhoneNumberPlan.callingCode('br');
      expect(actual).assertEqual('+55');
      log('testCallingCodeLower0083 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0084
     * @tc.name      testRegionOf0084
     * @tc.desc      regionOf(+55) -> BR
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRegionOf0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRegionOf0084 begin');
      const actual: string = PhoneNumberPlan.regionOf('+55');
      expect(actual).assertEqual('BR');
      log('testRegionOf0084 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0085
     * @tc.name      testValidLength0085
     * @tc.desc      isValidLength(BR,10 digits) is true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidLength0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidLength0085 begin');
      const actual: boolean = PhoneNumberPlan.isValidLength('BR', '1111111111');
      expect(actual).assertTrue();
      log('testValidLength0085 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0086
     * @tc.name      testInvalidLength0086
     * @tc.desc      isValidLength(BR,12 digits) is false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testInvalidLength0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testInvalidLength0086 begin');
      const actual: boolean = PhoneNumberPlan.isValidLength('BR', '111111111111');
      expect(actual).assertFalse();
      log('testInvalidLength0086 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0087
     * @tc.name      testValidLength0087
     * @tc.desc      isValidLength(BR,11 digits) is true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidLength0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidLength0087 begin');
      const actual: boolean = PhoneNumberPlan.isValidLength('BR', '11111111111');
      expect(actual).assertTrue();
      log('testValidLength0087 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0088
     * @tc.name      testInvalidLength0088
     * @tc.desc      isValidLength(BR,13 digits) is false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testInvalidLength0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testInvalidLength0088 begin');
      const actual: boolean = PhoneNumberPlan.isValidLength('BR', '1111111111111');
      expect(actual).assertFalse();
      log('testInvalidLength0088 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0089
     * @tc.name      testE1640089
     * @tc.desc      e164(BR) joins the calling code
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testE1640089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testE1640089 begin');
      const actual: string = PhoneNumberPlan.e164('BR', '1111111111');
      expect(actual).assertEqual('+551111111111');
      log('testE1640089 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0090
     * @tc.name      testParseE1640090
     * @tc.desc      parseE164(+551111111111) restores region and national number
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseE1640090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testParseE1640090 begin');
      const actual: string[] = PhoneNumberPlan.parseE164('+551111111111');
      expect(actual[0]).assertEqual('BR');
      expect(actual[1]).assertEqual('1111111111');
      log('testParseE1640090 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0091
     * @tc.name      testCallingCode0091
     * @tc.desc      callingCode(RU) -> +7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallingCode0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallingCode0091 begin');
      const actual: string = PhoneNumberPlan.callingCode('RU');
      expect(actual).assertEqual('+7');
      log('testCallingCode0091 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0092
     * @tc.name      testCallingCodeLower0092
     * @tc.desc      callingCode accepts lower case region ru
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallingCodeLower0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallingCodeLower0092 begin');
      const actual: string = PhoneNumberPlan.callingCode('ru');
      expect(actual).assertEqual('+7');
      log('testCallingCodeLower0092 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0093
     * @tc.name      testRegionOf0093
     * @tc.desc      regionOf(+7) -> RU
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRegionOf0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRegionOf0093 begin');
      const actual: string = PhoneNumberPlan.regionOf('+7');
      expect(actual).assertEqual('RU');
      log('testRegionOf0093 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0094
     * @tc.name      testValidLength0094
     * @tc.desc      isValidLength(RU,10 digits) is true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidLength0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidLength0094 begin');
      const actual: boolean = PhoneNumberPlan.isValidLength('RU', '1111111111');
      expect(actual).assertTrue();
      log('testValidLength0094 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0095
     * @tc.name      testInvalidLength0095
     * @tc.desc      isValidLength(RU,12 digits) is false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testInvalidLength0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testInvalidLength0095 begin');
      const actual: boolean = PhoneNumberPlan.isValidLength('RU', '111111111111');
      expect(actual).assertFalse();
      log('testInvalidLength0095 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0096
     * @tc.name      testE1640096
     * @tc.desc      e164(RU) joins the calling code
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testE1640096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testE1640096 begin');
      const actual: string = PhoneNumberPlan.e164('RU', '1111111111');
      expect(actual).assertEqual('+71111111111');
      log('testE1640096 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0097
     * @tc.name      testParseE1640097
     * @tc.desc      parseE164(+71111111111) restores region and national number
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseE1640097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testParseE1640097 begin');
      const actual: string[] = PhoneNumberPlan.parseE164('+71111111111');
      expect(actual[0]).assertEqual('RU');
      expect(actual[1]).assertEqual('1111111111');
      log('testParseE1640097 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0098
     * @tc.name      testCallingCode0098
     * @tc.desc      callingCode(HK) -> +852
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallingCode0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallingCode0098 begin');
      const actual: string = PhoneNumberPlan.callingCode('HK');
      expect(actual).assertEqual('+852');
      log('testCallingCode0098 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0099
     * @tc.name      testCallingCodeLower0099
     * @tc.desc      callingCode accepts lower case region hk
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallingCodeLower0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallingCodeLower0099 begin');
      const actual: string = PhoneNumberPlan.callingCode('hk');
      expect(actual).assertEqual('+852');
      log('testCallingCodeLower0099 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0100
     * @tc.name      testRegionOf0100
     * @tc.desc      regionOf(+852) -> HK
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRegionOf0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRegionOf0100 begin');
      const actual: string = PhoneNumberPlan.regionOf('+852');
      expect(actual).assertEqual('HK');
      log('testRegionOf0100 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0101
     * @tc.name      testValidLength0101
     * @tc.desc      isValidLength(HK,8 digits) is true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidLength0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidLength0101 begin');
      const actual: boolean = PhoneNumberPlan.isValidLength('HK', '11111111');
      expect(actual).assertTrue();
      log('testValidLength0101 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0102
     * @tc.name      testInvalidLength0102
     * @tc.desc      isValidLength(HK,10 digits) is false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testInvalidLength0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testInvalidLength0102 begin');
      const actual: boolean = PhoneNumberPlan.isValidLength('HK', '1111111111');
      expect(actual).assertFalse();
      log('testInvalidLength0102 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0103
     * @tc.name      testE1640103
     * @tc.desc      e164(HK) joins the calling code
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testE1640103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testE1640103 begin');
      const actual: string = PhoneNumberPlan.e164('HK', '11111111');
      expect(actual).assertEqual('+85211111111');
      log('testE1640103 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0104
     * @tc.name      testParseE1640104
     * @tc.desc      parseE164(+85211111111) restores region and national number
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseE1640104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testParseE1640104 begin');
      const actual: string[] = PhoneNumberPlan.parseE164('+85211111111');
      expect(actual[0]).assertEqual('HK');
      expect(actual[1]).assertEqual('11111111');
      log('testParseE1640104 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0105
     * @tc.name      testCallingCode0105
     * @tc.desc      callingCode(TW) -> +886
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallingCode0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallingCode0105 begin');
      const actual: string = PhoneNumberPlan.callingCode('TW');
      expect(actual).assertEqual('+886');
      log('testCallingCode0105 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0106
     * @tc.name      testCallingCodeLower0106
     * @tc.desc      callingCode accepts lower case region tw
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallingCodeLower0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallingCodeLower0106 begin');
      const actual: string = PhoneNumberPlan.callingCode('tw');
      expect(actual).assertEqual('+886');
      log('testCallingCodeLower0106 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0107
     * @tc.name      testRegionOf0107
     * @tc.desc      regionOf(+886) -> TW
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRegionOf0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRegionOf0107 begin');
      const actual: string = PhoneNumberPlan.regionOf('+886');
      expect(actual).assertEqual('TW');
      log('testRegionOf0107 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0108
     * @tc.name      testValidLength0108
     * @tc.desc      isValidLength(TW,9 digits) is true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidLength0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testValidLength0108 begin');
      const actual: boolean = PhoneNumberPlan.isValidLength('TW', '111111111');
      expect(actual).assertTrue();
      log('testValidLength0108 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0109
     * @tc.name      testInvalidLength0109
     * @tc.desc      isValidLength(TW,11 digits) is false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testInvalidLength0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testInvalidLength0109 begin');
      const actual: boolean = PhoneNumberPlan.isValidLength('TW', '11111111111');
      expect(actual).assertFalse();
      log('testInvalidLength0109 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0110
     * @tc.name      testE1640110
     * @tc.desc      e164(TW) joins the calling code
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testE1640110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testE1640110 begin');
      const actual: string = PhoneNumberPlan.e164('TW', '111111111');
      expect(actual).assertEqual('+886111111111');
      log('testE1640110 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0111
     * @tc.name      testParseE1640111
     * @tc.desc      parseE164(+886111111111) restores region and national number
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseE1640111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testParseE1640111 begin');
      const actual: string[] = PhoneNumberPlan.parseE164('+886111111111');
      expect(actual[0]).assertEqual('TW');
      expect(actual[1]).assertEqual('111111111');
      log('testParseE1640111 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0112
     * @tc.name      testUnknownRegion0112
     * @tc.desc      callingCode for an unknown region returns empty string
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testUnknownRegion0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testUnknownRegion0112 begin');
      const actual: string = PhoneNumberPlan.callingCode('ZZ');
      expect(actual).assertEqual('');
      log('testUnknownRegion0112 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_PHONEPLAN_0113
     * @tc.name      testUnknownRegionLength0113
     * @tc.desc      isValidLength for an unknown region is false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testUnknownRegionLength0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testUnknownRegionLength0113 begin');
      const actual: boolean = PhoneNumberPlan.isValidLength('ZZ', '12345678901');
      expect(actual).assertFalse();
      log('testUnknownRegionLength0113 end');
      await yieldToMain();
    })
  })
}
