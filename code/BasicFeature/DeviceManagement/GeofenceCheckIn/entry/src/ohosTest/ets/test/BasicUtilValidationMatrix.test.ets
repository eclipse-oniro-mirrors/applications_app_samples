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


import { describe, it, expect, beforeAll, afterAll, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BasicUtil } from 'library';

const DOMAIN: number = 0xF811;
const SUITE_TAG: string = '[Sample_GeofenceCheckIn_BASICVAL]';

interface TextCase {
  input: string;
  expected: boolean;
}

const EMAIL_CASES: TextCase[] = [
  { input: 'a@b.com', expected: true },
  { input: 'user.name@example.com', expected: true },
  { input: 'user+tag@sub.example.org', expected: true },
  { input: 'x@y.cn', expected: true },
  { input: 'A1._%+-@b-c.de', expected: true },
  { input: 'first.last@example.co.uk', expected: true },
  { input: 'a_b@c_d.com', expected: false },
  { input: 'z9@q9.io', expected: true },
  { input: 'name@domain.travel', expected: true },
  { input: 'n@d.museum', expected: true },
  { input: 'a.b.c@d.e.f.gh', expected: true },
  { input: 'user-1@mail-2.com', expected: true },
  { input: 'UPPER@EXAMPLE.COM', expected: true },
  { input: 'n123@456.com', expected: true },
  { input: 'a@b.cd', expected: true },
  { input: 'a@b.cdef', expected: true },
  { input: 'a.b+tag@example.com', expected: true },
  { input: 'a@sub.domain.com', expected: true },
  { input: 'x@x.xx', expected: true },
  { input: 'q@w.er', expected: true },
  { input: '', expected: false },
  { input: 'bad', expected: false },
  { input: 'a@b', expected: false },
  { input: '@b.com', expected: false },
  { input: 'a@.com', expected: false },
  { input: 'a b@c.com', expected: false },
  { input: 'a@@b.com', expected: false },
  { input: 'a@b..com', expected: false },
  { input: 'a@b.c', expected: false },
  { input: 'a@b.c1', expected: false },
  { input: 'a@b.com ', expected: false },
  { input: ' a@b.com', expected: false },
  { input: 'a@b,com', expected: false },
  { input: 'a@b', expected: false },
  { input: 'a@.b.com', expected: false },
  { input: 'a#b@c.com', expected: false },
  { input: 'a@b#c.com', expected: false },
  { input: 'a@b.com\n', expected: false },
  { input: '中文@b.com', expected: false },
  { input: 'a@b.com.cn ', expected: false },
];

interface PhoneCase {
  input: string;
  expected: boolean;
}

const PHONE_CASES: PhoneCase[] = [
  { input: '13800138000', expected: true },
  { input: '13912345678', expected: true },
  { input: '15000000000', expected: true },
  { input: '17700000000', expected: true },
  { input: '18888888888', expected: true },
  { input: '19999999999', expected: true },
  { input: '13000000000', expected: true },
  { input: '13111111111', expected: true },
  { input: '14512345678', expected: true },
  { input: '16612345678', expected: true },
  { input: '17512345678', expected: true },
  { input: '17812345678', expected: true },
  { input: '18012345678', expected: true },
  { input: '18912345678', expected: true },
  { input: '13312345678', expected: true },
  { input: '15312345678', expected: true },
  { input: '17312345678', expected: true },
  { input: '19312345678', expected: true },
  { input: '', expected: false },
  { input: '12800138000', expected: false },
  { input: '1380013800', expected: false },
  { input: '138001380000', expected: false },
  { input: '23800138000', expected: false },
  { input: '1380013800a', expected: false },
  { input: ' 13800138000', expected: false },
  { input: '138-0013-8000', expected: false },
  { input: '+8613800138000', expected: false },
  { input: '1380013800 ', expected: false },
  { input: '1380013800O', expected: false },
  { input: '10000000000', expected: false },
  { input: '11000000000', expected: false },
  { input: '12000000000', expected: false },
  { input: '1300000000', expected: false },
  { input: '13000000000a', expected: false },
  { input: '１３８００１３８０００', expected: false },
  { input: '13800138000\n', expected: false },
];

interface IdCase {
  input: string;
  expected: boolean;
}

const ID_CASES: IdCase[] = [
  { input: '11010519491231002X', expected: true },
  { input: '440524188001010014', expected: true },
  { input: '440524188001010014', expected: true },
  { input: '110101199003071233', expected: true },
  { input: '110101199003071233', expected: true },
  { input: '320102198506150014', expected: true },
  { input: '320102198506150014', expected: true },
  { input: '510104199512310021', expected: true },
  { input: '510104199512310021', expected: true },
  { input: '370102200001010015', expected: true },
  { input: '370102200001010015', expected: true },
  { input: '610113197808080019', expected: true },
  { input: '610113197808080019', expected: true },
  { input: '420106198811110026', expected: true },
  { input: '420106198811110026', expected: true },
  { input: '330106199909090011', expected: true },
  { input: '330106199909090011', expected: true },
  { input: '23010319840101001X', expected: true },
  { input: '500103199202020020', expected: true },
  { input: '500103199202020020', expected: true },
  { input: '21010219970707001X', expected: true },
  { input: '350102200102030011', expected: true },
  { input: '350102200102030011', expected: true },
  { input: '430104198303030029', expected: true },
  { input: '430104198303030029', expected: true },
  { input: '140105199404040017', expected: true },
  { input: '140105199404040017', expected: true },
  { input: '120101200505050018', expected: true },
  { input: '120101200505050018', expected: true },
  { input: '310101198606060026', expected: true },
  { input: '310101198606060026', expected: true },
  { input: '450103199808080015', expected: true },
  { input: '450103199808080015', expected: true },
  { input: '530102200209090018', expected: true },
  { input: '530102200209090018', expected: true },
  { input: '640104198110100018', expected: true },
  { input: '640104198110100018', expected: true },
  { input: '', expected: false },
  { input: '1101051949123100', expected: false },
  { input: '110105194912310021', expected: false },
  { input: '1101051949123100A', expected: false },
  { input: '1101051949123100X', expected: false },
  { input: 'abcdefghijklmnopq', expected: false },
  { input: '11010519491231002x ', expected: false },
  { input: ' 11010519491231002X', expected: false },
  { input: '11010519491231002X\n', expected: false },
  { input: '1101051949123100１', expected: false },
  { input: '110105194912310020', expected: false },
  { input: '440524188001010010', expected: false },
  { input: '110101199003071230', expected: false },
  { input: '320102198506150010', expected: false },
  { input: '510104199512310020', expected: false },
  { input: '370102200001010010', expected: false },
];

export default function basicUtilValidationMatrixTest() {
  describe('BasicUtilValidationMatrixTest', () => {
    beforeAll(() => {
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'BasicUtilValidationMatrixTest suite start');
    });

    afterAll(() => {
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'BasicUtilValidationMatrixTest suite end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_BASICVAL_0100
     * @tc.name      testEmailValidity0001
     * @tc.desc      Verify the email validator accepts common address shapes and rejects malformed text.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testEmailValidity0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testEmailValidity0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let checked: number = 0;
      for (let i = 0; i < EMAIL_CASES.length; i++) {
        const row: TextCase = EMAIL_CASES[i];
        expect(BasicUtil.isValidEmail(row.input)).assertEqual(row.expected);
        checked = checked + 1;
      }
      expect(checked).assertEqual(EMAIL_CASES.length);
      expect(EMAIL_CASES.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'email rows checked: ' + checked);
      expect(BasicUtil.isValidEmail('a@b.com')).assertTrue();
      expect(BasicUtil.isValidEmail('')).assertFalse();
      expect(BasicUtil.isValidEmail('a@b')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_BASICVAL_0200
     * @tc.name      testEmailLocalPart0002
     * @tc.desc      Verify the email validator keeps the documented local part character set.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testEmailLocalPart0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testEmailLocalPart0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const accepted: string[] = ['a.b@c.com', 'a+b@c.com', 'a_b@c.com', 'a-b@c.com', 'a%b@c.com'];
      for (let i = 0; i < accepted.length; i++) {
        expect(BasicUtil.isValidEmail(accepted[i])).assertTrue();
      }
      const rejected: string[] = ['a b@c.com', 'a#b@c.com', 'a/b@c.com', 'a(b)@c.com'];
      for (let i = 0; i < rejected.length; i++) {
        expect(BasicUtil.isValidEmail(rejected[i])).assertFalse();
      }
      expect(accepted.length).assertEqual(5);
      expect(rejected.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_BASICVAL_0300
     * @tc.name      testPhoneValidity0003
     * @tc.desc      Verify the mainland mobile validator accepts the supported prefixes only.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPhoneValidity0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testPhoneValidity0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let checked: number = 0;
      for (let i = 0; i < PHONE_CASES.length; i++) {
        const row: PhoneCase = PHONE_CASES[i];
        expect(BasicUtil.isValidPhoneCN(row.input)).assertEqual(row.expected);
        checked = checked + 1;
      }
      expect(checked).assertEqual(PHONE_CASES.length);
      expect(PHONE_CASES.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'phone rows checked: ' + checked);
      expect(BasicUtil.isValidPhoneCN('13800138000')).assertTrue();
      expect(BasicUtil.isValidPhoneCN('12800138000')).assertFalse();
      expect(BasicUtil.isValidPhoneCN('1380013800')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_BASICVAL_0400
     * @tc.name      testPhonePrefixes0004
     * @tc.desc      Verify every supported second digit prefix is accepted by the phone validator.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPhonePrefixes0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testPhonePrefixes0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const prefixes: string[] = ['3', '4', '5', '6', '7', '8', '9'];
      for (let i = 0; i < prefixes.length; i++) {
        const phone: string = '1' + prefixes[i] + '800138000';
        expect(BasicUtil.isValidPhoneCN(phone)).assertTrue();
      }
      expect(BasicUtil.isValidPhoneCN('10800138000')).assertFalse();
      expect(BasicUtil.isValidPhoneCN('11800138000')).assertFalse();
      expect(BasicUtil.isValidPhoneCN('12800138000')).assertFalse();
      expect(prefixes.length).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_BASICVAL_0500
     * @tc.name      testIdCardValidity0005
     * @tc.desc      Verify the ID card validator accepts checksum correct identifiers and rejects broken ones.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIdCardValidity0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIdCardValidity0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let checked: number = 0;
      for (let i = 0; i < ID_CASES.length; i++) {
        const row: IdCase = ID_CASES[i];
        expect(BasicUtil.isValidIdCardCN(row.input)).assertEqual(row.expected);
        checked = checked + 1;
      }
      expect(checked).assertEqual(ID_CASES.length);
      expect(ID_CASES.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'idCard rows checked: ' + checked);
      expect(BasicUtil.isValidIdCardCN('11010519491231002X')).assertTrue();
      expect(BasicUtil.isValidIdCardCN('11010519491231002x')).assertTrue();
      expect(BasicUtil.isValidIdCardCN('110105194912310021')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_BASICVAL_0600
     * @tc.name      testIdCardChecksum0006
     * @tc.desc      Verify the weighted checksum of the ID card validator over a list of base numbers.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIdCardChecksum0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIdCardChecksum0006';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const bases: string[] = ['11010519491231002', '44052418800101001', '32010219850615001',
        '51010419951231002', '37010220000101001', '42010619881111002'];
      let accepted: number = 0;
      for (let i = 0; i < bases.length; i++) {
        const base: string = bases[i];
        const codes: string = '10X98765432';
        const weights: number[] = [7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2];
        let sum: number = 0;
        for (let j = 0; j < weights.length; j++) {
          sum = sum + Number(base.charAt(j)) * weights[j];
        }
        const expected: string = codes.charAt(sum % 11);
        const candidate: string = base + expected;
        expect(BasicUtil.isValidIdCardCN(candidate)).assertTrue();
        const wrongCode: string = expected === '0' ? '1' : '0';
        expect(BasicUtil.isValidIdCardCN(base + wrongCode)).assertFalse();
        accepted = accepted + 1;
      }
      expect(accepted).assertEqual(bases.length);
      expect(bases.length).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_BASICVAL_0700
     * @tc.name      testValidationDeterminism0007
     * @tc.desc      Verify repeated validation of the same text keeps returning the same answer.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testValidationDeterminism0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testValidationDeterminism0007';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const sampleEmail: string = 'user.name@example.com';
      const samplePhone: string = '13800138000';
      const sampleId: string = '11010519491231002X';
      let stable: number = 0;
      for (let i = 0; i < 20; i++) {
        expect(BasicUtil.isValidEmail(sampleEmail)).assertTrue();
        expect(BasicUtil.isValidPhoneCN(samplePhone)).assertTrue();
        expect(BasicUtil.isValidIdCardCN(sampleId)).assertTrue();
        stable = stable + 1;
      }
      expect(stable).assertEqual(20);
      expect(BasicUtil.isValidEmail(sampleEmail)).assertEqual(BasicUtil.isValidEmail(sampleEmail));
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_BASICVAL_0800
     * @tc.name      testValidationBoundaries0008
     * @tc.desc      Verify the validators handle empty, blank and very long inputs without throwing.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testValidationBoundaries0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testValidationBoundaries0008';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const blanks: string[] = ['', ' ', '   ', '\t', '\n', '\r\n'];
      for (let i = 0; i < blanks.length; i++) {
        expect(BasicUtil.isValidEmail(blanks[i])).assertFalse();
        expect(BasicUtil.isValidPhoneCN(blanks[i])).assertFalse();
        expect(BasicUtil.isValidIdCardCN(blanks[i])).assertFalse();
      }
      let longText: string = '';
      for (let i = 0; i < 50; i++) {
        longText = longText + 'a';
      }
      expect(BasicUtil.isValidEmail(longText)).assertFalse();
      expect(BasicUtil.isValidPhoneCN(longText)).assertFalse();
      expect(BasicUtil.isValidIdCardCN(longText)).assertFalse();
      expect(blanks.length).assertEqual(6);
      expect(longText.length).assertEqual(50);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_BASICVAL_0900
     * @tc.name      testValidationShape0009
     * @tc.desc      Verify the validators accept the shortest and reject the longest unsupported shapes.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testValidationShape0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testValidationShape0009';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(BasicUtil.isValidEmail('a@b.cd')).assertTrue();
      expect(BasicUtil.isValidEmail('a@b.c')).assertFalse();
      expect(BasicUtil.isValidPhoneCN('13000000000')).assertTrue();
      expect(BasicUtil.isValidPhoneCN('1300000000')).assertFalse();
      expect(BasicUtil.isValidPhoneCN('130000000000')).assertFalse();
      expect(BasicUtil.isValidIdCardCN('11010519491231002X')).assertTrue();
      expect(BasicUtil.isValidIdCardCN('11010519491231002')).assertFalse();
      expect(BasicUtil.isValidIdCardCN('1101051949123100X')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

  });
}
