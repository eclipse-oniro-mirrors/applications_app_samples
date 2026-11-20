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

export default function emailTest02() {
  describe('EmailTest02', () => {

    /**
     * @tc.name   testEmail0061
     * @tc.number SUB_ACCT_EMAIL_0061
     * @tc.desc   one local part one at sign and one dotted top level label are required
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0061 begin');
      const MAIL: string = 'tom';
      const PAIR: string = 'tom@b.co';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0061 end');
    });

    /**
     * @tc.name   testEmail0062
     * @tc.number SUB_ACCT_EMAIL_0062
     * @tc.desc   one local part one at sign and one dotted top level label are required
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0062 begin');
      const MAIL: string = 'tom@';
      const PAIR: string = 'tom@b.co';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0062 end');
    });

    /**
     * @tc.name   testEmail0063
     * @tc.number SUB_ACCT_EMAIL_0063
     * @tc.desc   one local part one at sign and one dotted top level label are required
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0063 begin');
      const MAIL: string = 'tom@@example.com';
      const PAIR: string = 'tom@example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0063 end');
    });

    /**
     * @tc.name   testEmail0064
     * @tc.number SUB_ACCT_EMAIL_0064
     * @tc.desc   one local part one at sign and one dotted top level label are required
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0064 begin');
      const MAIL: string = 'tom@example@com';
      const PAIR: string = 'tom@example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0064 end');
    });

    /**
     * @tc.name   testEmail0065
     * @tc.number SUB_ACCT_EMAIL_0065
     * @tc.desc   one local part one at sign and one dotted top level label are required
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0065 begin');
      const MAIL: string = 'tom@example';
      const PAIR: string = 'tom@example.co';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0065 end');
    });

    /**
     * @tc.name   testEmail0066
     * @tc.number SUB_ACCT_EMAIL_0066
     * @tc.desc   one local part one at sign and one dotted top level label are required
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0066 begin');
      const MAIL: string = 'tom@.com';
      const PAIR: string = 'tom@a.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0066 end');
    });

    /**
     * @tc.name   testEmail0067
     * @tc.number SUB_ACCT_EMAIL_0067
     * @tc.desc   one local part one at sign and one dotted top level label are required
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0067 begin');
      const MAIL: string = 'tom@com.';
      const PAIR: string = 'tom@com.co';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0067 end');
    });

    /**
     * @tc.name   testEmail0068
     * @tc.number SUB_ACCT_EMAIL_0068
     * @tc.desc   one local part one at sign and one dotted top level label are required
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0068 begin');
      const MAIL: string = ' tom@example.com';
      const PAIR: string = 'tom@example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0068 end');
    });

    /**
     * @tc.name   testEmail0069
     * @tc.number SUB_ACCT_EMAIL_0069
     * @tc.desc   one local part one at sign and one dotted top level label are required
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0069 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0069 end');
    });

    /**
     * @tc.name   testEmail0070
     * @tc.number SUB_ACCT_EMAIL_0070
     * @tc.desc   one local part one at sign and one dotted top level label are required
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0070 begin');
      const MAIL: string = '\ttom@example.com';
      const PAIR: string = 'tom@example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0070 end');
    });

    /**
     * @tc.name   testEmail0071
     * @tc.number SUB_ACCT_EMAIL_0071
     * @tc.desc   one local part one at sign and one dotted top level label are required
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0071 begin');
      const MAIL: string = 'tom@example.com\t';
      const PAIR: string = 'tom@example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0071 end');
    });

    /**
     * @tc.name   testEmail0072
     * @tc.number SUB_ACCT_EMAIL_0072
     * @tc.desc   one local part one at sign and one dotted top level label are required
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0072 begin');
      const MAIL: string = 'tom @example.com';
      const PAIR: string = 'tom@example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0072 end');
    });

    /**
     * @tc.name   testEmail0073
     * @tc.number SUB_ACCT_EMAIL_0073
     * @tc.desc   one local part one at sign and one dotted top level label are required
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0073 begin');
      const MAIL: string = 'tom@ example.com';
      const PAIR: string = 'tom@example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0073 end');
    });

    /**
     * @tc.name   testEmail0074
     * @tc.number SUB_ACCT_EMAIL_0074
     * @tc.desc   one local part one at sign and one dotted top level label are required
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0074 begin');
      const MAIL: string = 'tom@example.com;';
      const PAIR: string = 'tom@example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0074 end');
    });

    /**
     * @tc.name   testEmail0075
     * @tc.number SUB_ACCT_EMAIL_0075
     * @tc.desc   one local part one at sign and one dotted top level label are required
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0075 begin');
      const MAIL: string = 'tom@example.com,';
      const PAIR: string = 'tom@example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0075 end');
    });

    /**
     * @tc.name   testEmail0076
     * @tc.number SUB_ACCT_EMAIL_0076
     * @tc.desc   one local part one at sign and one dotted top level label are required
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0076 begin');
      const MAIL: string = 'tom@example.com/';
      const PAIR: string = 'tom@example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0076 end');
    });

    /**
     * @tc.name   testEmail0077
     * @tc.number SUB_ACCT_EMAIL_0077
     * @tc.desc   one local part one at sign and one dotted top level label are required
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0077 begin');
      const MAIL: string = 'tom@@';
      const PAIR: string = 'tom@a.co';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0077 end');
    });

    /**
     * @tc.name   testEmail0078
     * @tc.number SUB_ACCT_EMAIL_0078
     * @tc.desc   one local part one at sign and one dotted top level label are required
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0078 begin');
      const MAIL: string = '@@example.com';
      const PAIR: string = 'a@example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0078 end');
    });

    /**
     * @tc.name   testEmail0079
     * @tc.number SUB_ACCT_EMAIL_0079
     * @tc.desc   letter case never changes the verdict of the address rule
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0079 begin');
      const MAIL: string = 'Tom@Example.Com';
      const PAIR: string = 'tom@example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0079 end');
    });

    /**
     * @tc.name   testEmail0080
     * @tc.number SUB_ACCT_EMAIL_0080
     * @tc.desc   letter case never changes the verdict of the address rule
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0080 begin');
      const MAIL: string = 'tOm@eXaMpLe.CoM';
      const PAIR: string = 'tom@example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0080 end');
    });

    /**
     * @tc.name   testEmail0081
     * @tc.number SUB_ACCT_EMAIL_0081
     * @tc.desc   letter case never changes the verdict of the address rule
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0081 begin');
      const MAIL: string = 'TOM@EXAMPLE.CO';
      const PAIR: string = 'tom@example.co';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0081 end');
    });

    /**
     * @tc.name   testEmail0082
     * @tc.number SUB_ACCT_EMAIL_0082
     * @tc.desc   letter case never changes the verdict of the address rule
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0082 begin');
      const MAIL: string = 'tom@EXAMPLE.com';
      const PAIR: string = 'tom@example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0082 end');
    });

    /**
     * @tc.name   testEmail0083
     * @tc.number SUB_ACCT_EMAIL_0083
     * @tc.desc   letter case never changes the verdict of the address rule
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0083 begin');
      const MAIL: string = 'TOM@example.COM';
      const PAIR: string = 'tom@example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0083 end');
    });

    /**
     * @tc.name   testEmail0084
     * @tc.number SUB_ACCT_EMAIL_0084
     * @tc.desc   letter case never changes the verdict of the address rule
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0084 begin');
      const MAIL: string = 'ToM@ExAmPlE.cOm';
      const PAIR: string = 'tom@example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0084 end');
    });

    /**
     * @tc.name   testEmail0085
     * @tc.number SUB_ACCT_EMAIL_0085
     * @tc.desc   letter case never changes the verdict of the address rule
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0085 begin');
      const MAIL: string = 'tom@EXAMPLE.ABC';
      const PAIR: string = 'tom@example.abc';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0085 end');
    });

    /**
     * @tc.name   testEmail0086
     * @tc.number SUB_ACCT_EMAIL_0086
     * @tc.desc   letter case never changes the verdict of the address rule
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0086 begin');
      const MAIL: string = 'TOM@example.abc';
      const PAIR: string = 'tom@example.abc';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0086 end');
    });

    /**
     * @tc.name   testEmail0087
     * @tc.number SUB_ACCT_EMAIL_0087
     * @tc.desc   local part of 1 character(s) stays inside the unlimited local part class
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0087 begin');
      const MAIL: string = 'u'.repeat(1) + '@example.com';
      const PAIR: string = 'u'.repeat(2) + '@example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0087 end');
    });

    /**
     * @tc.name   testEmail0088
     * @tc.number SUB_ACCT_EMAIL_0088
     * @tc.desc   local part of 2 character(s) stays inside the unlimited local part class
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0088 begin');
      const MAIL: string = 'u'.repeat(2) + '@example.com';
      const PAIR: string = 'u'.repeat(3) + '@example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0088 end');
    });

    /**
     * @tc.name   testEmail0089
     * @tc.number SUB_ACCT_EMAIL_0089
     * @tc.desc   local part of 3 character(s) stays inside the unlimited local part class
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0089 begin');
      const MAIL: string = 'u'.repeat(3) + '@example.com';
      const PAIR: string = 'u'.repeat(4) + '@example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0089 end');
    });

    /**
     * @tc.name   testEmail0090
     * @tc.number SUB_ACCT_EMAIL_0090
     * @tc.desc   local part of 4 character(s) stays inside the unlimited local part class
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0090 begin');
      const MAIL: string = 'u'.repeat(4) + '@example.com';
      const PAIR: string = 'u'.repeat(5) + '@example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0090 end');
    });

    /**
     * @tc.name   testEmail0091
     * @tc.number SUB_ACCT_EMAIL_0091
     * @tc.desc   local part of 5 character(s) stays inside the unlimited local part class
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0091 begin');
      const MAIL: string = 'u'.repeat(5) + '@example.com';
      const PAIR: string = 'u'.repeat(6) + '@example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0091 end');
    });

    /**
     * @tc.name   testEmail0092
     * @tc.number SUB_ACCT_EMAIL_0092
     * @tc.desc   local part of 6 character(s) stays inside the unlimited local part class
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0092 begin');
      const MAIL: string = 'u'.repeat(6) + '@example.com';
      const PAIR: string = 'u'.repeat(7) + '@example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0092 end');
    });

    /**
     * @tc.name   testEmail0093
     * @tc.number SUB_ACCT_EMAIL_0093
     * @tc.desc   local part of 7 character(s) stays inside the unlimited local part class
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0093 begin');
      const MAIL: string = 'u'.repeat(7) + '@example.com';
      const PAIR: string = 'u'.repeat(8) + '@example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0093 end');
    });

    /**
     * @tc.name   testEmail0094
     * @tc.number SUB_ACCT_EMAIL_0094
     * @tc.desc   local part of 8 character(s) stays inside the unlimited local part class
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0094 begin');
      const MAIL: string = 'u'.repeat(8) + '@example.com';
      const PAIR: string = 'u'.repeat(9) + '@example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0094 end');
    });

    /**
     * @tc.name   testEmail0095
     * @tc.number SUB_ACCT_EMAIL_0095
     * @tc.desc   local part of 10 character(s) stays inside the unlimited local part class
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0095 begin');
      const MAIL: string = 'u'.repeat(10) + '@example.com';
      const PAIR: string = 'u'.repeat(11) + '@example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0095 end');
    });

    /**
     * @tc.name   testEmail0096
     * @tc.number SUB_ACCT_EMAIL_0096
     * @tc.desc   local part of 12 character(s) stays inside the unlimited local part class
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0096 begin');
      const MAIL: string = 'u'.repeat(12) + '@example.com';
      const PAIR: string = 'u'.repeat(13) + '@example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0096 end');
    });

    /**
     * @tc.name   testEmail0097
     * @tc.number SUB_ACCT_EMAIL_0097
     * @tc.desc   local part of 15 character(s) stays inside the unlimited local part class
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0097 begin');
      const MAIL: string = 'u'.repeat(15) + '@example.com';
      const PAIR: string = 'u'.repeat(16) + '@example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0097 end');
    });

    /**
     * @tc.name   testEmail0098
     * @tc.number SUB_ACCT_EMAIL_0098
     * @tc.desc   local part of 16 character(s) stays inside the unlimited local part class
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0098 begin');
      const MAIL: string = 'u'.repeat(16) + '@example.com';
      const PAIR: string = 'u'.repeat(17) + '@example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0098 end');
    });

    /**
     * @tc.name   testEmail0099
     * @tc.number SUB_ACCT_EMAIL_0099
     * @tc.desc   local part of 18 character(s) stays inside the unlimited local part class
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0099 begin');
      const MAIL: string = 'u'.repeat(18) + '@example.com';
      const PAIR: string = 'u'.repeat(19) + '@example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0099 end');
    });

    /**
     * @tc.name   testEmail0100
     * @tc.number SUB_ACCT_EMAIL_0100
     * @tc.desc   local part of 20 character(s) stays inside the unlimited local part class
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0100 begin');
      const MAIL: string = 'u'.repeat(20) + '@example.com';
      const PAIR: string = 'u'.repeat(21) + '@example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0100 end');
    });

    /**
     * @tc.name   testEmail0101
     * @tc.number SUB_ACCT_EMAIL_0101
     * @tc.desc   local part of 24 character(s) stays inside the unlimited local part class
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0101 begin');
      const MAIL: string = 'u'.repeat(24) + '@example.com';
      const PAIR: string = 'u'.repeat(25) + '@example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0101 end');
    });

    /**
     * @tc.name   testEmail0102
     * @tc.number SUB_ACCT_EMAIL_0102
     * @tc.desc   local part of 30 character(s) stays inside the unlimited local part class
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0102 begin');
      const MAIL: string = 'u'.repeat(30) + '@example.com';
      const PAIR: string = 'u'.repeat(31) + '@example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0102 end');
    });

    /**
     * @tc.name   testEmail0103
     * @tc.number SUB_ACCT_EMAIL_0103
     * @tc.desc   domain label of 1 character(s) is measured without a label length cap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0103 begin');
      const MAIL: string = 'tom@' + 'd'.repeat(1) + '.com';
      const PAIR: string = 'tom@' + 'd'.repeat(2) + '.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0103 end');
    });

    /**
     * @tc.name   testEmail0104
     * @tc.number SUB_ACCT_EMAIL_0104
     * @tc.desc   domain label of 2 character(s) is measured without a label length cap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0104 begin');
      const MAIL: string = 'tom@' + 'd'.repeat(2) + '.com';
      const PAIR: string = 'tom@' + 'd'.repeat(3) + '.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0104 end');
    });

    /**
     * @tc.name   testEmail0105
     * @tc.number SUB_ACCT_EMAIL_0105
     * @tc.desc   domain label of 3 character(s) is measured without a label length cap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0105 begin');
      const MAIL: string = 'tom@' + 'd'.repeat(3) + '.com';
      const PAIR: string = 'tom@' + 'd'.repeat(4) + '.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0105 end');
    });

    /**
     * @tc.name   testEmail0106
     * @tc.number SUB_ACCT_EMAIL_0106
     * @tc.desc   domain label of 4 character(s) is measured without a label length cap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0106 begin');
      const MAIL: string = 'tom@' + 'd'.repeat(4) + '.com';
      const PAIR: string = 'tom@' + 'd'.repeat(5) + '.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0106 end');
    });

    /**
     * @tc.name   testEmail0107
     * @tc.number SUB_ACCT_EMAIL_0107
     * @tc.desc   domain label of 5 character(s) is measured without a label length cap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0107 begin');
      const MAIL: string = 'tom@' + 'd'.repeat(5) + '.com';
      const PAIR: string = 'tom@' + 'd'.repeat(6) + '.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0107 end');
    });

    /**
     * @tc.name   testEmail0108
     * @tc.number SUB_ACCT_EMAIL_0108
     * @tc.desc   domain label of 6 character(s) is measured without a label length cap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0108 begin');
      const MAIL: string = 'tom@' + 'd'.repeat(6) + '.com';
      const PAIR: string = 'tom@' + 'd'.repeat(7) + '.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0108 end');
    });

    /**
     * @tc.name   testEmail0109
     * @tc.number SUB_ACCT_EMAIL_0109
     * @tc.desc   domain label of 7 character(s) is measured without a label length cap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0109 begin');
      const MAIL: string = 'tom@' + 'd'.repeat(7) + '.com';
      const PAIR: string = 'tom@' + 'd'.repeat(8) + '.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0109 end');
    });

    /**
     * @tc.name   testEmail0110
     * @tc.number SUB_ACCT_EMAIL_0110
     * @tc.desc   domain label of 8 character(s) is measured without a label length cap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0110 begin');
      const MAIL: string = 'tom@' + 'd'.repeat(8) + '.com';
      const PAIR: string = 'tom@' + 'd'.repeat(9) + '.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0110 end');
    });

    /**
     * @tc.name   testEmail0111
     * @tc.number SUB_ACCT_EMAIL_0111
     * @tc.desc   domain label of 10 character(s) is measured without a label length cap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0111 begin');
      const MAIL: string = 'tom@' + 'd'.repeat(10) + '.com';
      const PAIR: string = 'tom@' + 'd'.repeat(11) + '.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0111 end');
    });

    /**
     * @tc.name   testEmail0112
     * @tc.number SUB_ACCT_EMAIL_0112
     * @tc.desc   domain label of 12 character(s) is measured without a label length cap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0112 begin');
      const MAIL: string = 'tom@' + 'd'.repeat(12) + '.com';
      const PAIR: string = 'tom@' + 'd'.repeat(13) + '.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0112 end');
    });

    /**
     * @tc.name   testEmail0113
     * @tc.number SUB_ACCT_EMAIL_0113
     * @tc.desc   domain label of 16 character(s) is measured without a label length cap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0113 begin');
      const MAIL: string = 'tom@' + 'd'.repeat(16) + '.com';
      const PAIR: string = 'tom@' + 'd'.repeat(17) + '.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0113 end');
    });

    /**
     * @tc.name   testEmail0114
     * @tc.number SUB_ACCT_EMAIL_0114
     * @tc.desc   domain label of 18 character(s) is measured without a label length cap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0114 begin');
      const MAIL: string = 'tom@' + 'd'.repeat(18) + '.com';
      const PAIR: string = 'tom@' + 'd'.repeat(19) + '.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0114 end');
    });

    /**
     * @tc.name   testEmail0115
     * @tc.number SUB_ACCT_EMAIL_0115
     * @tc.desc   domain label of 20 character(s) is measured without a label length cap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0115 begin');
      const MAIL: string = 'tom@' + 'd'.repeat(20) + '.com';
      const PAIR: string = 'tom@' + 'd'.repeat(21) + '.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0115 end');
    });

    /**
     * @tc.name   testEmail0116
     * @tc.number SUB_ACCT_EMAIL_0116
     * @tc.desc   domain label of 24 character(s) is measured without a label length cap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0116 begin');
      const MAIL: string = 'tom@' + 'd'.repeat(24) + '.com';
      const PAIR: string = 'tom@' + 'd'.repeat(25) + '.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0116 end');
    });

    /**
     * @tc.name   testEmail0117
     * @tc.number SUB_ACCT_EMAIL_0117
     * @tc.desc   domain label of 30 character(s) is measured without a label length cap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0117 begin');
      const MAIL: string = 'tom@' + 'd'.repeat(30) + '.com';
      const PAIR: string = 'tom@' + 'd'.repeat(31) + '.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0117 end');
    });

    /**
     * @tc.name   testEmail0118
     * @tc.number SUB_ACCT_EMAIL_0118
     * @tc.desc   domain label of 40 character(s) is measured without a label length cap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0118 begin');
      const MAIL: string = 'tom@' + 'd'.repeat(40) + '.com';
      const PAIR: string = 'tom@' + 'd'.repeat(41) + '.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0118 end');
    });

    /**
     * @tc.name   testEmail0119
     * @tc.number SUB_ACCT_EMAIL_0119
     * @tc.desc   top level label allows digits but never a hyphen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0119 begin');
      const MAIL: string = 'tom@example.12';
      const PAIR: string = 'tom@example.1';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0119 end');
    });

    /**
     * @tc.name   testEmail0120
     * @tc.number SUB_ACCT_EMAIL_0120
     * @tc.desc   top level label allows digits but never a hyphen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmail0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0120 begin');
      const MAIL: string = 'tom@example.a1';
      const PAIR: string = 'tom@example.a';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0120 end');
    });

  });
}
