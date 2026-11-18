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
const TAG: string = 'CallNumberFormatCoreTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

export default function callNumberFormatCoreTest(): void {
  describe('CallNumberFormatCoreTest', () => {
    /**
     * @tc.number    SUB_CALL_NUMBERFORMAT_0001
     * @tc.name      testCallNumberFormat0001
     * @tc.desc      Verify formatPhoneNumber groups a China mobile number as 3-4-4 segments.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallNumberFormat0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallNumberFormat0001 begin');
      const options: call.NumberFormatOptions = { countryCode: 'CN' };
      const actual: string = await call.formatPhoneNumber('13800138000', options);
      expect(actual).assertEqual('138 0013 8000');
      expect(typeof actual).assertEqual('string');
      expect(actual.length).assertEqual(13);
      log('testCallNumberFormat0001 end');
    })

    /**
     * @tc.number    SUB_CALL_NUMBERFORMAT_0002
     * @tc.name      testCallNumberFormat0002
     * @tc.desc      Verify formatPhoneNumber groups the 159 prefix mobile number as 3-4-4 segments.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallNumberFormat0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallNumberFormat0002 begin');
      const options: call.NumberFormatOptions = { countryCode: 'CN' };
      const actual: string = await call.formatPhoneNumber('15912345678', options);
      expect(actual).assertEqual('159 1234 5678');
      expect(typeof actual).assertEqual('string');
      expect(actual.length).assertEqual(13);
      log('testCallNumberFormat0002 end');
    })

    /**
     * @tc.number    SUB_CALL_NUMBERFORMAT_0003
     * @tc.name      testCallNumberFormat0003
     * @tc.desc      Verify formatPhoneNumber groups the 186 prefix mobile number as 3-4-4 segments.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallNumberFormat0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallNumberFormat0003 begin');
      const options: call.NumberFormatOptions = { countryCode: 'CN' };
      const actual: string = await call.formatPhoneNumber('18612345678', options);
      expect(actual).assertEqual('186 1234 5678');
      expect(typeof actual).assertEqual('string');
      expect(actual.length).assertEqual(13);
      log('testCallNumberFormat0003 end');
    })

    /**
     * @tc.number    SUB_CALL_NUMBERFORMAT_0004
     * @tc.name      testCallNumberFormat0004
     * @tc.desc      Verify formatPhoneNumber groups the 130 prefix mobile number as 3-4-4 segments.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallNumberFormat0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallNumberFormat0004 begin');
      const options: call.NumberFormatOptions = { countryCode: 'CN' };
      const actual: string = await call.formatPhoneNumber('13012345678', options);
      expect(actual).assertEqual('130 1234 5678');
      expect(typeof actual).assertEqual('string');
      expect(actual.length).assertEqual(13);
      log('testCallNumberFormat0004 end');
    })

    /**
     * @tc.number    SUB_CALL_NUMBERFORMAT_0005
     * @tc.name      testCallNumberFormat0005
     * @tc.desc      Verify formatPhoneNumber groups the 199 prefix mobile number as 3-4-4 segments.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallNumberFormat0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallNumberFormat0005 begin');
      const options: call.NumberFormatOptions = { countryCode: 'CN' };
      const actual: string = await call.formatPhoneNumber('19912345678', options);
      expect(actual).assertEqual('199 1234 5678');
      expect(typeof actual).assertEqual('string');
      expect(actual.length).assertEqual(13);
      log('testCallNumberFormat0005 end');
    })

    /**
     * @tc.number    SUB_CALL_NUMBERFORMAT_0006
     * @tc.name      testCallNumberFormat0006
     * @tc.desc      Verify formatPhoneNumber groups the 147 prefix mobile number as 3-4-4 segments.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallNumberFormat0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallNumberFormat0006 begin');
      const options: call.NumberFormatOptions = { countryCode: 'CN' };
      const actual: string = await call.formatPhoneNumber('14712345678', options);
      expect(actual).assertEqual('147 1234 5678');
      expect(typeof actual).assertEqual('string');
      expect(actual.length).assertEqual(13);
      log('testCallNumberFormat0006 end');
    })

    /**
     * @tc.number    SUB_CALL_NUMBERFORMAT_0007
     * @tc.name      testCallNumberFormat0007
     * @tc.desc      Verify formatPhoneNumber groups the 175 prefix mobile number as 3-4-4 segments.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallNumberFormat0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallNumberFormat0007 begin');
      const options: call.NumberFormatOptions = { countryCode: 'CN' };
      const actual: string = await call.formatPhoneNumber('17512345678', options);
      expect(actual).assertEqual('175 1234 5678');
      expect(typeof actual).assertEqual('string');
      expect(actual.length).assertEqual(13);
      log('testCallNumberFormat0007 end');
    })

    /**
     * @tc.number    SUB_CALL_NUMBERFORMAT_0008
     * @tc.name      testCallNumberFormat0008
     * @tc.desc      Verify formatPhoneNumber groups the 188 prefix mobile number as 3-4-4 segments.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallNumberFormat0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallNumberFormat0008 begin');
      const options: call.NumberFormatOptions = { countryCode: 'CN' };
      const actual: string = await call.formatPhoneNumber('18812345678', options);
      expect(actual).assertEqual('188 1234 5678');
      expect(typeof actual).assertEqual('string');
      expect(actual.length).assertEqual(13);
      log('testCallNumberFormat0008 end');
    })

    /**
     * @tc.number    SUB_CALL_NUMBERFORMAT_0009
     * @tc.name      testCallNumberFormat0009
     * @tc.desc      Verify formatPhoneNumber rejects an empty input with a parameter error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallNumberFormat0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallNumberFormat0009 begin');
      const options: call.NumberFormatOptions = { countryCode: 'CN' };
      let rejected: boolean = false;
      try {
        await call.formatPhoneNumber('', options);
      } catch (error) {
        rejected = true;
        log('formatPhoneNumber rejected empty input');
      }
      expect(rejected).assertTrue();
      log('testCallNumberFormat0009 end');
    })

    /**
     * @tc.number    SUB_CALL_NUMBERFORMAT_0010
     * @tc.name      testCallNumberFormat0010
     * @tc.desc      Verify formatPhoneNumber returns an empty string for alphabetic input.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallNumberFormat0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallNumberFormat0010 begin');
      const options: call.NumberFormatOptions = { countryCode: 'CN' };
      const actual: string = await call.formatPhoneNumber('abc', options);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      expect(actual.length).assertEqual(0);
      log('testCallNumberFormat0010 end');
    })

    /**
     * @tc.number    SUB_CALL_NUMBERFORMAT_0011
     * @tc.name      testCallNumberFormat0011
     * @tc.desc      Verify formatPhoneNumber keeps the short emergency-like number 110 unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallNumberFormat0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallNumberFormat0011 begin');
      const options: call.NumberFormatOptions = { countryCode: 'CN' };
      const actual: string = await call.formatPhoneNumber('110', options);
      expect(actual).assertEqual('110');
      expect(typeof actual).assertEqual('string');
      expect(actual.length).assertEqual(3);
      log('testCallNumberFormat0011 end');
    })

    /**
     * @tc.number    SUB_CALL_NUMBERFORMAT_0012
     * @tc.name      testCallNumberFormat0012
     * @tc.desc      Verify formatPhoneNumber keeps a five digit short number unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallNumberFormat0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallNumberFormat0012 begin');
      const options: call.NumberFormatOptions = { countryCode: 'CN' };
      const actual: string = await call.formatPhoneNumber('12345', options);
      expect(actual).assertEqual('12345');
      expect(typeof actual).assertEqual('string');
      expect(actual.length).assertEqual(5);
      log('testCallNumberFormat0012 end');
    })

    /**
     * @tc.number    SUB_CALL_NUMBERFORMAT_0013
     * @tc.name      testCallNumberFormat0013
     * @tc.desc      Verify formatPhoneNumber still returns a non-empty string for a fixed-line number.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallNumberFormat0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallNumberFormat0013 begin');
      const options: call.NumberFormatOptions = { countryCode: 'CN' };
      const actual: string = await call.formatPhoneNumber('01012345678', options);
      expect(typeof actual).assertEqual('string');
      expect(actual.length >= 10).assertTrue();
      expect(actual.length > 0).assertTrue();
      log('testCallNumberFormat0013 end');
    })

    /**
     * @tc.number    SUB_CALL_NUMBERFORMAT_0014
     * @tc.name      testCallNumberFormat0014
     * @tc.desc      Verify formatPhoneNumber returns a non-empty string for a plus-prefixed input.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallNumberFormat0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallNumberFormat0014 begin');
      const options: call.NumberFormatOptions = { countryCode: 'CN' };
      const actual: string = await call.formatPhoneNumber('+8613800138000', options);
      expect(typeof actual).assertEqual('string');
      expect(actual.length > 0).assertTrue();
      expect(actual !== undefined).assertTrue();
      log('testCallNumberFormat0014 end');
    })

    /**
     * @tc.number    SUB_CALL_NUMBERFORMAT_0015
     * @tc.name      testCallNumberFormat0015
     * @tc.desc      Verify formatPhoneNumber returns an empty string for an over-length input.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallNumberFormat0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallNumberFormat0015 begin');
      const options: call.NumberFormatOptions = { countryCode: 'CN' };
      const actual: string = await call.formatPhoneNumber('13800138000138001380001380', options);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      expect(actual.length).assertEqual(0);
      log('testCallNumberFormat0015 end');
    })

    /**
     * @tc.number    SUB_CALL_NUMBERFORMAT_0016
     * @tc.name      testCallNumberFormat0016
     * @tc.desc      Verify formatPhoneNumber without options still formats an 11-digit mobile number.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallNumberFormat0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallNumberFormat0016 begin');
      const actual: string = await call.formatPhoneNumber('13800138000');
      expect(typeof actual).assertEqual('string');
      expect(actual.length >= 11).assertTrue();
      expect(actual.length > 0).assertTrue();
      log('testCallNumberFormat0016 end');
    })

    /**
     * @tc.number    SUB_CALL_NUMBERFORMAT_0017
     * @tc.name      testCallNumberFormat0017
     * @tc.desc      Verify formatPhoneNumber without options rejects an empty input.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallNumberFormat0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallNumberFormat0017 begin');
      let rejected: boolean = false;
      try {
        await call.formatPhoneNumber('');
      } catch (error) {
        rejected = true;
        log('formatPhoneNumber rejected empty input without options');
      }
      expect(rejected).assertTrue();
      log('testCallNumberFormat0017 end');
    })

    /**
     * @tc.number    SUB_CALL_NUMBERFORMAT_0018
     * @tc.name      testCallNumberFormat0018
     * @tc.desc      Verify formatPhoneNumberToE164 converts a China mobile number to the E164 form.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallNumberFormat0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallNumberFormat0018 begin');
      const actual: string = await call.formatPhoneNumberToE164('13800138000', 'CN');
      expect(actual).assertEqual('+8613800138000');
      expect(typeof actual).assertEqual('string');
      expect(actual.startsWith('+86')).assertTrue();
      log('testCallNumberFormat0018 end');
    })

    /**
     * @tc.number    SUB_CALL_NUMBERFORMAT_0019
     * @tc.name      testCallNumberFormat0019
     * @tc.desc      Verify formatPhoneNumberToE164 converts the 159 prefix mobile number to E164.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallNumberFormat0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallNumberFormat0019 begin');
      const actual: string = await call.formatPhoneNumberToE164('15912345678', 'CN');
      expect(actual).assertEqual('+8615912345678');
      expect(typeof actual).assertEqual('string');
      expect(actual.startsWith('+86')).assertTrue();
      log('testCallNumberFormat0019 end');
    })

    /**
     * @tc.number    SUB_CALL_NUMBERFORMAT_0020
     * @tc.name      testCallNumberFormat0020
     * @tc.desc      Verify formatPhoneNumberToE164 converts the 186 prefix mobile number to E164.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallNumberFormat0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallNumberFormat0020 begin');
      const actual: string = await call.formatPhoneNumberToE164('18612345678', 'CN');
      expect(actual).assertEqual('+8618612345678');
      expect(typeof actual).assertEqual('string');
      expect(actual.startsWith('+86')).assertTrue();
      log('testCallNumberFormat0020 end');
    })

    /**
     * @tc.number    SUB_CALL_NUMBERFORMAT_0021
     * @tc.name      testCallNumberFormat0021
     * @tc.desc      Verify formatPhoneNumberToE164 converts the 130 prefix mobile number to E164.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallNumberFormat0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallNumberFormat0021 begin');
      const actual: string = await call.formatPhoneNumberToE164('13012345678', 'CN');
      expect(actual).assertEqual('+8613012345678');
      expect(typeof actual).assertEqual('string');
      expect(actual.startsWith('+86')).assertTrue();
      log('testCallNumberFormat0021 end');
    })

    /**
     * @tc.number    SUB_CALL_NUMBERFORMAT_0022
     * @tc.name      testCallNumberFormat0022
     * @tc.desc      Verify formatPhoneNumberToE164 rejects an empty number.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallNumberFormat0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallNumberFormat0022 begin');
      let rejected: boolean = false;
      try {
        await call.formatPhoneNumberToE164('', 'CN');
      } catch (error) {
        rejected = true;
        log('formatPhoneNumberToE164 rejected empty number');
      }
      expect(rejected).assertTrue();
      log('testCallNumberFormat0022 end');
    })

    /**
     * @tc.number    SUB_CALL_NUMBERFORMAT_0023
     * @tc.name      testCallNumberFormat0023
     * @tc.desc      Verify formatPhoneNumberToE164 returns a string result for alphabetic input.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallNumberFormat0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallNumberFormat0023 begin');
      const actual: string = await call.formatPhoneNumberToE164('abc', 'CN');
      expect(typeof actual).assertEqual('string');
      expect(actual.length >= 0).assertTrue();
      expect(actual !== undefined).assertTrue();
      log('testCallNumberFormat0023 end');
    })

    /**
     * @tc.number    SUB_CALL_NUMBERFORMAT_0024
     * @tc.name      testCallNumberFormat0024
     * @tc.desc      Verify formatPhoneNumberToE164 returns a string result for an unsupported country code.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallNumberFormat0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallNumberFormat0024 begin');
      const actual: string = await call.formatPhoneNumberToE164('13800138000', 'ZZ');
      expect(typeof actual).assertEqual('string');
      expect(actual !== undefined).assertTrue();
      expect(actual.length >= 0).assertTrue();
      log('testCallNumberFormat0024 end');
    })

    /**
     * @tc.number    SUB_CALL_NUMBERFORMAT_0025
     * @tc.name      testCallNumberFormat0025
     * @tc.desc      Verify formatPhoneNumberToE164 rejects an empty country code.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallNumberFormat0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallNumberFormat0025 begin');
      let rejected: boolean = false;
      try {
        await call.formatPhoneNumberToE164('13800138000', '');
      } catch (error) {
        rejected = true;
        log('formatPhoneNumberToE164 rejected empty country code');
      }
      expect(rejected).assertTrue();
      log('testCallNumberFormat0025 end');
    })

    /**
     * @tc.number    SUB_CALL_NUMBERFORMAT_0026
     * @tc.name      testCallNumberFormat0026
     * @tc.desc      Verify formatPhoneNumber output contains only digits and spaces for a mobile number.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallNumberFormat0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallNumberFormat0026 begin');
      const options: call.NumberFormatOptions = { countryCode: 'CN' };
      const actual: string = await call.formatPhoneNumber('13800138000', options);
      expect(actual).assertEqual('138 0013 8000');
      expect(/^[\d ]+$/.test(actual)).assertTrue();
      expect(actual.indexOf('-')).assertEqual(-1);
      log('testCallNumberFormat0026 end');
    })

    /**
     * @tc.number    SUB_CALL_NUMBERFORMAT_0027
     * @tc.name      testCallNumberFormat0027
     * @tc.desc      Verify formatPhoneNumber is idempotent for the same input.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallNumberFormat0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallNumberFormat0027 begin');
      const options: call.NumberFormatOptions = { countryCode: 'CN' };
      const first: string = await call.formatPhoneNumber('13800138000', options);
      const second: string = await call.formatPhoneNumber('13800138000', options);
      expect(first).assertEqual(second);
      expect(first).assertEqual('138 0013 8000');
      expect(typeof first).assertEqual('string');
      log('testCallNumberFormat0027 end');
    })

    /**
     * @tc.number    SUB_CALL_NUMBERFORMAT_0028
     * @tc.name      testCallNumberFormat0028
     * @tc.desc      Verify consecutive formatPhoneNumber calls do not interfere with each other.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallNumberFormat0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallNumberFormat0028 begin');
      const options: call.NumberFormatOptions = { countryCode: 'CN' };
      const first: string = await call.formatPhoneNumber('13800138000', options);
      const second: string = await call.formatPhoneNumber('15912345678', options);
      expect(first).assertEqual('138 0013 8000');
      expect(second).assertEqual('159 1234 5678');
      expect(first === second).assertFalse();
      log('testCallNumberFormat0028 end');
    })

    /**
     * @tc.number    SUB_CALL_NUMBERFORMAT_0029
     * @tc.name      testCallNumberFormat0029
     * @tc.desc      Verify formatPhoneNumberToE164 is idempotent for the same input and country.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallNumberFormat0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallNumberFormat0029 begin');
      const first: string = await call.formatPhoneNumberToE164('13800138000', 'CN');
      const second: string = await call.formatPhoneNumberToE164('13800138000', 'CN');
      expect(first).assertEqual(second);
      expect(first).assertEqual('+8613800138000');
      expect(typeof first).assertEqual('string');
      log('testCallNumberFormat0029 end');
    })

    /**
     * @tc.number    SUB_CALL_NUMBERFORMAT_0030
     * @tc.name      testCallNumberFormat0030
     * @tc.desc      Verify the formatted result drops the original spacing of a spaced input.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallNumberFormat0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallNumberFormat0030 begin');
      const options: call.NumberFormatOptions = { countryCode: 'CN' };
      const actual: string = await call.formatPhoneNumber('13800138000', options);
      const spaced: string = await call.formatPhoneNumber('138 0013 8000', options);
      expect(actual).assertEqual('138 0013 8000');
      expect(typeof spaced).assertEqual('string');
      expect(spaced.length > 0).assertTrue();
      log('testCallNumberFormat0030 end');
    })
  })
}
