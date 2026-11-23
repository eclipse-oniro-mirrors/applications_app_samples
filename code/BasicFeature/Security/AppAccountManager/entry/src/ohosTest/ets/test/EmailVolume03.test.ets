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
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import {
  AccountValidator, ModifyInput, ModifyResult, RegisterInput, RegisterResult
} from '../../../main/ets/model/AccountValidator';

const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

function logPair(actual: string, expected: string): void {
  hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', actual, expected);
}

function regInput(username: string, email: string, signature: string, password: string,
  confirmPassword: string): RegisterInput {
  let input: RegisterInput = {
    username: username, email: email, signature: signature,
    password: password, confirmPassword: confirmPassword
  };
  return input;
}

export default function emailTest03() {
  describe('EmailTest03', () => {

    /**
     * @tc.name   testEmail0121
     * @tc.number SUB_ACCT_EMAIL_0121
     * @tc.desc   top level label allows digits but never a hyphen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0121 begin');
      const MAIL: string = 'tom@example.1a';
      const PAIR: string = 'tom@example.1';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0121 end');
    });

    /**
     * @tc.name   testEmail0122
     * @tc.number SUB_ACCT_EMAIL_0122
     * @tc.desc   top level label allows digits but never a hyphen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0122 begin');
      const MAIL: string = 'tom@example.abc123';
      const PAIR: string = 'tom@example.abc1234';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0122 end');
    });

    /**
     * @tc.name   testEmail0123
     * @tc.number SUB_ACCT_EMAIL_0123
     * @tc.desc   top level label allows digits but never a hyphen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0123 begin');
      const MAIL: string = 'tom@example.000000';
      const PAIR: string = 'tom@example.0000000';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0123 end');
    });

    /**
     * @tc.name   testEmail0124
     * @tc.number SUB_ACCT_EMAIL_0124
     * @tc.desc   top level label allows digits but never a hyphen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0124 begin');
      const MAIL: string = 'tom@example.--';
      const PAIR: string = 'tom@example.ab';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0124 end');
    });

    /**
     * @tc.name   testEmail0125
     * @tc.number SUB_ACCT_EMAIL_0125
     * @tc.desc   top level label allows digits but never a hyphen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0125 begin');
      const MAIL: string = 'tom@example.a-';
      const PAIR: string = 'tom@example.ab';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0125 end');
    });

    /**
     * @tc.name   testEmail0126
     * @tc.number SUB_ACCT_EMAIL_0126
     * @tc.desc   top level label allows digits but never a hyphen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0126 begin');
      const MAIL: string = 'tom@example.-a';
      const PAIR: string = 'tom@example.ab';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0126 end');
    });

    /**
     * @tc.name   testEmail0127
     * @tc.number SUB_ACCT_EMAIL_0127
     * @tc.desc   top level label allows digits but never a hyphen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0127 begin');
      const MAIL: string = 'tom@example.ab-';
      const PAIR: string = 'tom@example.ab';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0127 end');
    });

    /**
     * @tc.name   testEmail0128
     * @tc.number SUB_ACCT_EMAIL_0128
     * @tc.desc   top level label allows digits but never a hyphen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0128 begin');
      const MAIL: string = 'tom@example.A1B2';
      const PAIR: string = 'tom@example.A1B2C';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0128 end');
    });

    /**
     * @tc.name   testEmail0129
     * @tc.number SUB_ACCT_EMAIL_0129
     * @tc.desc   top level label allows digits but never a hyphen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0129 begin');
      const MAIL: string = 'tom@example.99';
      const PAIR: string = 'tom@example.9';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0129 end');
    });

    /**
     * @tc.name   testEmail0130
     * @tc.number SUB_ACCT_EMAIL_0130
     * @tc.desc   top level label allows digits but never a hyphen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0130 begin');
      const MAIL: string = 'tom@example.zz';
      const PAIR: string = 'tom@example.z';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0130 end');
    });

    /**
     * @tc.name   testEmail0131
     * @tc.number SUB_ACCT_EMAIL_0131
     * @tc.desc   top level label allows digits but never a hyphen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0131 begin');
      const MAIL: string = 'tom@example.mm2026';
      const PAIR: string = 'tom@example.mm2026x';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0131 end');
    });

    /**
     * @tc.name   testEmail0132
     * @tc.number SUB_ACCT_EMAIL_0132
     * @tc.desc   top level label allows digits but never a hyphen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0132 begin');
      const MAIL: string = 'tom@example.x0';
      const PAIR: string = 'tom@example.x';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0132 end');
    });

    /**
     * @tc.name   testEmail0133
     * @tc.number SUB_ACCT_EMAIL_0133
     * @tc.desc   top level label allows digits but never a hyphen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0133 begin');
      const MAIL: string = 'tom@example.0x';
      const PAIR: string = 'tom@example.0';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0133 end');
    });

    /**
     * @tc.name   testEmail0134
     * @tc.number SUB_ACCT_EMAIL_0134
     * @tc.desc   top level label allows digits but never a hyphen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0134 begin');
      const MAIL: string = 'tom@example.q9Z';
      const PAIR: string = 'tom@example.q9Zq';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0134 end');
    });

    /**
     * @tc.name   testEmail0135
     * @tc.number SUB_ACCT_EMAIL_0135
     * @tc.desc   non ascii code points are rejected by every address segment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0135 begin');
      const MAIL: string = 'tom@例子.com';
      const PAIR: string = 'tom@lizi.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0135 end');
    });

    /**
     * @tc.name   testEmail0136
     * @tc.number SUB_ACCT_EMAIL_0136
     * @tc.desc   non ascii code points are rejected by every address segment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0136 begin');
      const MAIL: string = 'tom@example。com';
      const PAIR: string = 'tom@example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0136 end');
    });

    /**
     * @tc.name   testEmail0137
     * @tc.number SUB_ACCT_EMAIL_0137
     * @tc.desc   non ascii code points are rejected by every address segment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0137 begin');
      const MAIL: string = 'tom@example.cöm';
      const PAIR: string = 'tom@example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0137 end');
    });

    /**
     * @tc.name   testEmail0138
     * @tc.number SUB_ACCT_EMAIL_0138
     * @tc.desc   non ascii code points are rejected by every address segment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0138 begin');
      const MAIL: string = 'tom@example.COM。';
      const PAIR: string = 'tom@example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0138 end');
    });

    /**
     * @tc.name   testEmail0139
     * @tc.number SUB_ACCT_EMAIL_0139
     * @tc.desc   non ascii code points are rejected by every address segment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0139 begin');
      const MAIL: string = 'tom＠example.com';
      const PAIR: string = 'tom@example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0139 end');
    });

    /**
     * @tc.name   testEmail0140
     * @tc.number SUB_ACCT_EMAIL_0140
     * @tc.desc   non ascii code points are rejected by every address segment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0140 begin');
      const MAIL: string = 'tom@ｅxample.com';
      const PAIR: string = 'tom@example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0140 end');
    });

    /**
     * @tc.name   testEmail0141
     * @tc.number SUB_ACCT_EMAIL_0141
     * @tc.desc   non ascii code points are rejected by every address segment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0141 begin');
      const MAIL: string = '晴天@example.com';
      const PAIR: string = 'tom@example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0141 end');
    });

    /**
     * @tc.name   testEmail0142
     * @tc.number SUB_ACCT_EMAIL_0142
     * @tc.desc   non ascii code points are rejected by every address segment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0142 begin');
      const MAIL: string = 'tom@example.com😀';
      const PAIR: string = 'tom@example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0142 end');
    });

    /**
     * @tc.name   testEmail0143
     * @tc.number SUB_ACCT_EMAIL_0143
     * @tc.desc   whitespace at either edge breaks the anchored address rule
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0143 begin');
      const MAIL: string = '\ntom@example.com';
      const PAIR: string = 'tom@example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0143 end');
    });

    /**
     * @tc.name   testEmail0144
     * @tc.number SUB_ACCT_EMAIL_0144
     * @tc.desc   whitespace at either edge breaks the anchored address rule
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0144 begin');
      const MAIL: string = 'tom@example.com\n';
      const PAIR: string = 'tom@example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0144 end');
    });

    /**
     * @tc.name   testEmail0145
     * @tc.number SUB_ACCT_EMAIL_0145
     * @tc.desc   whitespace at either edge breaks the anchored address rule
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0145 begin');
      const MAIL: string = 'tom@exa\tmple.com';
      const PAIR: string = 'tom@example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0145 end');
    });

    /**
     * @tc.name   testEmail0146
     * @tc.number SUB_ACCT_EMAIL_0146
     * @tc.desc   whitespace at either edge breaks the anchored address rule
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0146 begin');
      const MAIL: string = 'tom@example.com ';
      const PAIR: string = 'tom@example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0146 end');
    });

    /**
     * @tc.name   testEmail0147
     * @tc.number SUB_ACCT_EMAIL_0147
     * @tc.desc   whitespace at either edge breaks the anchored address rule
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0147 begin');
      const MAIL: string = 'to m@example.com';
      const PAIR: string = 'tom@example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0147 end');
    });

    /**
     * @tc.name   testEmail0148
     * @tc.number SUB_ACCT_EMAIL_0148
     * @tc.desc   whitespace at either edge breaks the anchored address rule
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0148 begin');
      const MAIL: string = 'tom\n@example.com';
      const PAIR: string = 'tom@example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0148 end');
    });

    /**
     * @tc.name   testEmail0149
     * @tc.number SUB_ACCT_EMAIL_0149
     * @tc.desc   whitespace at either edge breaks the anchored address rule
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0149 begin');
      const MAIL: string = 'tom@\nexample.com';
      const PAIR: string = 'tom@example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0149 end');
    });

    /**
     * @tc.name   testEmail0150
     * @tc.number SUB_ACCT_EMAIL_0150
     * @tc.desc   whitespace at either edge breaks the anchored address rule
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0150 begin');
      const MAIL: string = 'tom@example.com ';
      const PAIR: string = 'tom@example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0150 end');
    });

    /**
     * @tc.name   testEmail0151
     * @tc.number SUB_ACCT_EMAIL_0151
     * @tc.desc   whitespace at either edge breaks the anchored address rule
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0151 begin');
      const MAIL: string = ' tom@example.com';
      const PAIR: string = 'tom@example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0151 end');
    });

    /**
     * @tc.name   testEmail0152
     * @tc.number SUB_ACCT_EMAIL_0152
     * @tc.desc   whitespace at either edge breaks the anchored address rule
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0152 begin');
      const MAIL: string = 'tom@example.com·';
      const PAIR: string = 'tom@example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0152 end');
    });

    /**
     * @tc.name   testEmail0153
     * @tc.number SUB_ACCT_EMAIL_0153
     * @tc.desc   ordinary corporate address shapes resolve by the same rule
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0153 begin');
      const MAIL: string = 'tom.smith@email.example.com';
      const PAIR: string = 'tom.smith@email.example.c';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0153 end');
    });

    /**
     * @tc.name   testEmail0154
     * @tc.number SUB_ACCT_EMAIL_0154
     * @tc.desc   ordinary corporate address shapes resolve by the same rule
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0154 begin');
      const MAIL: string = 'tom_2026@example.org';
      const PAIR: string = 'tom-2026@example.org';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0154 end');
    });

    /**
     * @tc.name   testEmail0155
     * @tc.number SUB_ACCT_EMAIL_0155
     * @tc.desc   ordinary corporate address shapes resolve by the same rule
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0155 begin');
      const MAIL: string = 'admin@example.net';
      const PAIR: string = 'admin@example.ne';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0155 end');
    });

    /**
     * @tc.name   testEmail0156
     * @tc.number SUB_ACCT_EMAIL_0156
     * @tc.desc   ordinary corporate address shapes resolve by the same rule
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0156 begin');
      const MAIL: string = 'support@mail.example.io';
      const PAIR: string = 'support@mail.example.i';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0156 end');
    });

    /**
     * @tc.name   testEmail0157
     * @tc.number SUB_ACCT_EMAIL_0157
     * @tc.desc   ordinary corporate address shapes resolve by the same rule
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0157 begin');
      const MAIL: string = 'a@b.co';
      const PAIR: string = 'a@b.c';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0157 end');
    });

    /**
     * @tc.name   testEmail0158
     * @tc.number SUB_ACCT_EMAIL_0158
     * @tc.desc   ordinary corporate address shapes resolve by the same rule
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0158 begin');
      const MAIL: string = 'a.b.c@d.e.f';
      const PAIR: string = 'a.b.c@d.e.ff';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0158 end');
    });

    /**
     * @tc.name   testEmail0159
     * @tc.number SUB_ACCT_EMAIL_0159
     * @tc.desc   ordinary corporate address shapes resolve by the same rule
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0159 begin');
      const MAIL: string = 'tom@sub.example.com';
      const PAIR: string = 'tom@sub.example.comm';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0159 end');
    });

    /**
     * @tc.name   testEmail0160
     * @tc.number SUB_ACCT_EMAIL_0160
     * @tc.desc   ordinary corporate address shapes resolve by the same rule
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0160 begin');
      const MAIL: string = 'first.last@corp.example.cn';
      const PAIR: string = 'first.last@corp.example.c';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0160 end');
    });

    /**
     * @tc.name   testEmail0161
     * @tc.number SUB_ACCT_EMAIL_0161
     * @tc.desc   ordinary corporate address shapes resolve by the same rule
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0161 begin');
      const MAIL: string = 'no-reply@example.com';
      const PAIR: string = 'noreply@example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0161 end');
    });

    /**
     * @tc.name   testEmail0162
     * @tc.number SUB_ACCT_EMAIL_0162
     * @tc.desc   ordinary corporate address shapes resolve by the same rule
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0162 begin');
      const MAIL: string = 'u1@e1.com';
      const PAIR: string = 'u1@e1.co';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0162 end');
    });

    /**
     * @tc.name   testEmail0163
     * @tc.number SUB_ACCT_EMAIL_0163
     * @tc.desc   ordinary corporate address shapes resolve by the same rule
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0163 begin');
      const MAIL: string = 'T.Smith@Example.ORG';
      const PAIR: string = 't.smith@example.org';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0163 end');
    });

    /**
     * @tc.name   testEmail0164
     * @tc.number SUB_ACCT_EMAIL_0164
     * @tc.desc   ordinary corporate address shapes resolve by the same rule
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0164 begin');
      const MAIL: string = 'tom123@example321.com';
      const PAIR: string = 'tom123@example321.co';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0164 end');
    });

    /**
     * @tc.name   testEmail0165
     * @tc.number SUB_ACCT_EMAIL_0165
     * @tc.desc   a dot inside the domain still needs a following label character
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0165 begin');
      const MAIL: string = '.tom.smith@example.com';
      const PAIR: string = 'tom.smith@example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0165 end');
    });

    /**
     * @tc.name   testEmail0166
     * @tc.number SUB_ACCT_EMAIL_0166
     * @tc.desc   a dot inside the domain still needs a following label character
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0166 begin');
      const MAIL: string = 'tom.smith.@example.com';
      const PAIR: string = 'tom.smith@example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0166 end');
    });

    /**
     * @tc.name   testEmail0167
     * @tc.number SUB_ACCT_EMAIL_0167
     * @tc.desc   a dot inside the domain still needs a following label character
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0167 begin');
      const MAIL: string = 'tom..smith@example.com';
      const PAIR: string = 'tom.smith@example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0167 end');
    });

    /**
     * @tc.name   testEmail0168
     * @tc.number SUB_ACCT_EMAIL_0168
     * @tc.desc   a dot inside the domain still needs a following label character
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0168 begin');
      const MAIL: string = 'tom...smith@example.com';
      const PAIR: string = 'tom.smith@example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0168 end');
    });

    /**
     * @tc.name   testEmail0169
     * @tc.number SUB_ACCT_EMAIL_0169
     * @tc.desc   a dot inside the domain still needs a following label character
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0169 begin');
      const MAIL: string = 'tom.smith@sub..example.com';
      const PAIR: string = 'tom.smith@sub.example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0169 end');
    });

    /**
     * @tc.name   testEmail0170
     * @tc.number SUB_ACCT_EMAIL_0170
     * @tc.desc   a dot inside the domain still needs a following label character
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0170 begin');
      const MAIL: string = 'tom.smith@sub.example..com';
      const PAIR: string = 'tom.smith@sub.example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0170 end');
    });

    /**
     * @tc.name   testEmail0171
     * @tc.number SUB_ACCT_EMAIL_0171
     * @tc.desc   a dot inside the domain still needs a following label character
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0171 begin');
      const MAIL: string = 'tom.smith@.sub.example.com';
      const PAIR: string = 'tom.smith@sub.example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0171 end');
    });

    /**
     * @tc.name   testEmail0172
     * @tc.number SUB_ACCT_EMAIL_0172
     * @tc.desc   a dot inside the domain still needs a following label character
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0172 begin');
      const MAIL: string = 'tom.smith@sub.example.com.';
      const PAIR: string = 'tom.smith@sub.example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0172 end');
    });

    /**
     * @tc.name   testEmail0173
     * @tc.number SUB_ACCT_EMAIL_0173
     * @tc.desc   a dot inside the domain still needs a following label character
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0173 begin');
      const MAIL: string = '.tom@example.com';
      const PAIR: string = 'tom@example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0173 end');
    });

    /**
     * @tc.name   testEmail0174
     * @tc.number SUB_ACCT_EMAIL_0174
     * @tc.desc   a dot inside the domain still needs a following label character
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0174 begin');
      const MAIL: string = '...@example.com';
      const PAIR: string = 'a@example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0174 end');
    });

    /**
     * @tc.name   testEmail0175
     * @tc.number SUB_ACCT_EMAIL_0175
     * @tc.desc   a dot inside the domain still needs a following label character
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0175 begin');
      const MAIL: string = 'tom@...com';
      const PAIR: string = 'tom@a.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0175 end');
    });

    /**
     * @tc.name   testEmail0176
     * @tc.number SUB_ACCT_EMAIL_0176
     * @tc.desc   a dot inside the domain still needs a following label character
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0176 begin');
      const MAIL: string = 'tom@a..b.com';
      const PAIR: string = 'tom@a.b.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0176 end');
    });

  });
}
