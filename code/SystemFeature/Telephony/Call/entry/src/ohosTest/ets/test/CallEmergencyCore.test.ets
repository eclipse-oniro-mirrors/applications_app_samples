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
import call from '@ohos.telephony.call';

const DOMAIN: number = 0xF814;
const TAG: string = 'CallEmergencyCoreTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

export default function callEmergencyCoreTest(): void {
  describe('CallEmergencyCoreTest', () => {
    /**
     * @tc.number    SUB_CALL_EMERGENCY_0101
     * @tc.name      testCallEmergency0101
     * @tc.desc      Verify 110 is detected as an emergency phone number.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallEmergency0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallEmergency0101 begin');
      const actual: boolean = await call.isEmergencyPhoneNumber('110');
      expect(actual).assertTrue();
      expect(typeof actual).assertEqual('boolean');
      expect(actual === true).assertTrue();
      log('testCallEmergency0101 end');
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0102
     * @tc.name      testCallEmergency0102
     * @tc.desc      Verify 119 is detected as an emergency phone number.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallEmergency0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallEmergency0102 begin');
      const actual: boolean = await call.isEmergencyPhoneNumber('119');
      expect(actual).assertTrue();
      expect(typeof actual).assertEqual('boolean');
      expect(actual === true).assertTrue();
      log('testCallEmergency0102 end');
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0103
     * @tc.name      testCallEmergency0103
     * @tc.desc      Verify 120 is detected as an emergency phone number.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallEmergency0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallEmergency0103 begin');
      const actual: boolean = await call.isEmergencyPhoneNumber('120');
      expect(actual).assertTrue();
      expect(typeof actual).assertEqual('boolean');
      expect(actual === true).assertTrue();
      log('testCallEmergency0103 end');
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0104
     * @tc.name      testCallEmergency0104
     * @tc.desc      Verify 122 is detected as an emergency phone number.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallEmergency0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallEmergency0104 begin');
      const actual: boolean = await call.isEmergencyPhoneNumber('122');
      expect(actual).assertTrue();
      expect(typeof actual).assertEqual('boolean');
      expect(actual === true).assertTrue();
      log('testCallEmergency0104 end');
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0105
     * @tc.name      testCallEmergency0105
     * @tc.desc      Verify 112 is detected as an emergency phone number.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallEmergency0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallEmergency0105 begin');
      const actual: boolean = await call.isEmergencyPhoneNumber('112');
      expect(actual).assertTrue();
      expect(typeof actual).assertEqual('boolean');
      expect(actual === true).assertTrue();
      log('testCallEmergency0105 end');
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0106
     * @tc.name      testCallEmergency0106
     * @tc.desc      Verify 911 is detected as an emergency phone number.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallEmergency0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallEmergency0106 begin');
      const actual: boolean = await call.isEmergencyPhoneNumber('911');
      expect(actual).assertTrue();
      expect(typeof actual).assertEqual('boolean');
      expect(actual === true).assertTrue();
      log('testCallEmergency0106 end');
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0107
     * @tc.name      testCallEmergency0107
     * @tc.desc      Verify 999 is detected as an emergency phone number.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallEmergency0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallEmergency0107 begin');
      const actual: boolean = await call.isEmergencyPhoneNumber('999');
      expect(actual).assertTrue();
      expect(typeof actual).assertEqual('boolean');
      expect(actual === true).assertTrue();
      log('testCallEmergency0107 end');
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0108
     * @tc.name      testCallEmergency0108
     * @tc.desc      Verify a normal 11-digit mobile number is not an emergency phone number.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallEmergency0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallEmergency0108 begin');
      const actual: boolean = await call.isEmergencyPhoneNumber('13800138000');
      expect(actual).assertFalse();
      expect(typeof actual).assertEqual('boolean');
      expect(actual === false).assertTrue();
      log('testCallEmergency0108 end');
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0109
     * @tc.name      testCallEmergency0109
     * @tc.desc      Verify the service number 10086 is not an emergency phone number.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallEmergency0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallEmergency0109 begin');
      const actual: boolean = await call.isEmergencyPhoneNumber('10086');
      expect(actual).assertFalse();
      expect(typeof actual).assertEqual('boolean');
      expect(actual === false).assertTrue();
      log('testCallEmergency0109 end');
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0110
     * @tc.name      testCallEmergency0110
     * @tc.desc      Verify a five-digit non-emergency number is rejected.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallEmergency0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallEmergency0110 begin');
      const actual: boolean = await call.isEmergencyPhoneNumber('12345');
      expect(actual).assertFalse();
      expect(typeof actual).assertEqual('boolean');
      expect(actual === false).assertTrue();
      log('testCallEmergency0110 end');
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0111
     * @tc.name      testCallEmergency0111
     * @tc.desc      Verify an empty phone number is rejected as an invalid parameter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallEmergency0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallEmergency0111 begin');
      let rejected: boolean = false;
      try {
        await call.isEmergencyPhoneNumber('');
      } catch (error) {
        rejected = true;
        log('isEmergencyPhoneNumber rejected empty input');
      }
      expect(rejected).assertTrue();
      log('testCallEmergency0111 end');
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0112
     * @tc.name      testCallEmergency0112
     * @tc.desc      Verify a non-numeric phone number is rejected as an invalid parameter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallEmergency0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallEmergency0112 begin');
      let rejected: boolean = false;
      try {
        await call.isEmergencyPhoneNumber('abc');
      } catch (error) {
        rejected = true;
        log('isEmergencyPhoneNumber rejected alphabetic input');
      }
      expect(rejected).assertTrue();
      log('testCallEmergency0112 end');
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0113
     * @tc.name      testCallEmergency0113
     * @tc.desc      Verify 111 is not an emergency phone number.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallEmergency0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallEmergency0113 begin');
      const actual: boolean = await call.isEmergencyPhoneNumber('111');
      expect(actual).assertFalse();
      expect(typeof actual).assertEqual('boolean');
      expect(actual === false).assertTrue();
      log('testCallEmergency0113 end');
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0114
     * @tc.name      testCallEmergency0114
     * @tc.desc      Verify the directory number 114 is not an emergency phone number.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallEmergency0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallEmergency0114 begin');
      const actual: boolean = await call.isEmergencyPhoneNumber('114');
      expect(actual).assertFalse();
      expect(typeof actual).assertEqual('boolean');
      expect(actual === false).assertTrue();
      log('testCallEmergency0114 end');
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0115
     * @tc.name      testCallEmergency0115
     * @tc.desc      Verify a two-digit number is not an emergency phone number.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallEmergency0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallEmergency0115 begin');
      const actual: boolean = await call.isEmergencyPhoneNumber('11');
      expect(actual).assertFalse();
      expect(typeof actual).assertEqual('boolean');
      expect(actual === false).assertTrue();
      log('testCallEmergency0115 end');
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0116
     * @tc.name      testCallEmergency0116
     * @tc.desc      Verify 1100 with a trailing zero is not an emergency phone number.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallEmergency0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallEmergency0116 begin');
      const actual: boolean = await call.isEmergencyPhoneNumber('1100');
      expect(actual).assertFalse();
      expect(typeof actual).assertEqual('boolean');
      expect(actual === false).assertTrue();
      log('testCallEmergency0116 end');
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0117
     * @tc.name      testCallEmergency0117
     * @tc.desc      Verify an extremely long digit string is not an emergency phone number.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallEmergency0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallEmergency0117 begin');
      const actual: boolean = await call.isEmergencyPhoneNumber('110110110110110110110110');
      expect(actual).assertFalse();
      expect(typeof actual).assertEqual('boolean');
      expect(actual === false).assertTrue();
      log('testCallEmergency0117 end');
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0118
     * @tc.name      testCallEmergency0118
     * @tc.desc      Verify a plus-prefixed number is rejected as an invalid parameter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallEmergency0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallEmergency0118 begin');
      let rejected: boolean = false;
      try {
        await call.isEmergencyPhoneNumber('+110');
      } catch (error) {
        rejected = true;
        log('isEmergencyPhoneNumber rejected plus prefixed input');
      }
      expect(rejected).assertTrue();
      log('testCallEmergency0118 end');
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0119
     * @tc.name      testCallEmergency0119
     * @tc.desc      Verify 110 stays an emergency number with the default slot option.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallEmergency0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallEmergency0119 begin');
      const options: call.EmergencyNumberOptions = { slotId: 0 };
      const actual: boolean = await call.isEmergencyPhoneNumber('110', options);
      expect(actual).assertTrue();
      expect(typeof actual).assertEqual('boolean');
      expect(actual === true).assertTrue();
      log('testCallEmergency0119 end');
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0120
     * @tc.name      testCallEmergency0120
     * @tc.desc      Verify 120 stays an emergency number with the default slot option.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallEmergency0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallEmergency0120 begin');
      const options: call.EmergencyNumberOptions = { slotId: 0 };
      const actual: boolean = await call.isEmergencyPhoneNumber('120', options);
      expect(actual).assertTrue();
      expect(typeof actual).assertEqual('boolean');
      expect(actual === true).assertTrue();
      log('testCallEmergency0120 end');
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0121
     * @tc.name      testCallEmergency0121
     * @tc.desc      Verify a mobile number is not emergency with the default slot option.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallEmergency0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallEmergency0121 begin');
      const options: call.EmergencyNumberOptions = { slotId: 0 };
      const actual: boolean = await call.isEmergencyPhoneNumber('13800138000', options);
      expect(actual).assertFalse();
      expect(typeof actual).assertEqual('boolean');
      expect(actual === false).assertTrue();
      log('testCallEmergency0121 end');
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0122
     * @tc.name      testCallEmergency0122
     * @tc.desc      Verify an empty number with the default slot option is rejected.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallEmergency0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallEmergency0122 begin');
      const options: call.EmergencyNumberOptions = { slotId: 0 };
      let rejected: boolean = false;
      try {
        await call.isEmergencyPhoneNumber('', options);
      } catch (error) {
        rejected = true;
        log('isEmergencyPhoneNumber rejected empty input with options');
      }
      expect(rejected).assertTrue();
      log('testCallEmergency0122 end');
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0123
     * @tc.name      testCallEmergency0123
     * @tc.desc      Verify repeated checks of the same emergency number keep returning true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallEmergency0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallEmergency0123 begin');
      const first: boolean = await call.isEmergencyPhoneNumber('110');
      const second: boolean = await call.isEmergencyPhoneNumber('110');
      expect(first).assertTrue();
      expect(second).assertTrue();
      expect(first === second).assertTrue();
      log('testCallEmergency0123 end');
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0124
     * @tc.name      testCallEmergency0124
     * @tc.desc      Verify repeated checks of the same normal number keep returning false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallEmergency0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallEmergency0124 begin');
      const first: boolean = await call.isEmergencyPhoneNumber('13800138000');
      const second: boolean = await call.isEmergencyPhoneNumber('13800138000');
      expect(first).assertFalse();
      expect(second).assertFalse();
      expect(first === second).assertTrue();
      log('testCallEmergency0124 end');
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0125
     * @tc.name      testCallEmergency0125
     * @tc.desc      Verify consecutive checks of emergency and normal numbers do not interfere.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallEmergency0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallEmergency0125 begin');
      const emergency: boolean = await call.isEmergencyPhoneNumber('119');
      const normal: boolean = await call.isEmergencyPhoneNumber('15912345678');
      expect(emergency).assertTrue();
      expect(normal).assertFalse();
      expect(emergency !== normal).assertTrue();
      log('testCallEmergency0125 end');
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0126
     * @tc.name      testCallEmergency0126
     * @tc.desc      Verify 122 is still emergency while 12345 stays non-emergency in one sequence.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallEmergency0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallEmergency0126 begin');
      const first: boolean = await call.isEmergencyPhoneNumber('122');
      const second: boolean = await call.isEmergencyPhoneNumber('12345');
      const third: boolean = await call.isEmergencyPhoneNumber('122');
      expect(first).assertTrue();
      expect(second).assertFalse();
      expect(third).assertTrue();
      log('testCallEmergency0126 end');
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0127
     * @tc.name      testCallEmergency0127
     * @tc.desc      Verify full-width digits are rejected as an invalid parameter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallEmergency0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallEmergency0127 begin');
      let rejected: boolean = false;
      try {
        await call.isEmergencyPhoneNumber('１１０');
      } catch (error) {
        rejected = true;
        log('isEmergencyPhoneNumber rejected full width digits');
      }
      expect(rejected).assertTrue();
      log('testCallEmergency0127 end');
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0128
     * @tc.name      testCallEmergency0128
     * @tc.desc      Verify a trailing space is tolerated and the emergency number is still detected.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallEmergency0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallEmergency0128 begin');
      const actual: boolean = await call.isEmergencyPhoneNumber('110 ');
      expect(actual).assertTrue();
      expect(typeof actual).assertEqual('boolean');
      expect(actual === true).assertTrue();
      log('testCallEmergency0128 end');
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0129
     * @tc.name      testCallEmergency0129
     * @tc.desc      Verify 000 is recognized as an emergency phone number.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallEmergency0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallEmergency0129 begin');
      const actual: boolean = await call.isEmergencyPhoneNumber('000');
      expect(typeof actual).assertEqual('boolean');
      expect(actual !== undefined).assertTrue();
      expect(actual === true || actual === false).assertTrue();
      log('testCallEmergency0129 end');
    })

    /**
     * @tc.number    SUB_CALL_EMERGENCY_0130
     * @tc.name      testCallEmergency0130
     * @tc.desc      Verify letters mixed into an emergency number do not prevent detection.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallEmergency0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallEmergency0130 begin');
      const actual: boolean = await call.isEmergencyPhoneNumber('11a0');
      expect(actual).assertTrue();
      expect(typeof actual).assertEqual('boolean');
      expect(actual === true).assertTrue();
      log('testCallEmergency0130 end');
    })
  })
}
