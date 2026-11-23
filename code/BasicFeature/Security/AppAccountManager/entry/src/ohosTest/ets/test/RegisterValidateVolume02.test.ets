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

export default function registerValidateTest02() {
  describe('RegisterValidateTest02', () => {

    /**
     * @tc.name   testRegisterValidate0051
     * @tc.number SUB_ACCT_VALREG_0051
     * @tc.desc   malformed address blocks registration even when password fields agree
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0051 begin');
      const U: string = 'tom';
      const MAIL: string = '@@example.com';
      const SIG: string = 'hello';
      const PWD: string = 'pass123';
      const CONF: string = 'pass123';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(CHECK).assertEqual(3);
      expect(AccountValidator.isEmailValid(MAIL)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0051 end');
    });

    /**
     * @tc.name   testRegisterValidate0052
     * @tc.number SUB_ACCT_VALREG_0052
     * @tc.desc   malformed address blocks registration even when password fields agree
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0052 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@example.com.';
      const SIG: string = 'hello';
      const PWD: string = 'pass123';
      const CONF: string = 'pass123';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(CHECK).assertEqual(3);
      expect(AccountValidator.isEmailValid(MAIL)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0052 end');
    });

    /**
     * @tc.name   testRegisterValidate0053
     * @tc.number SUB_ACCT_VALREG_0053
     * @tc.desc   malformed address blocks registration even when password fields agree
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0053 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@example.com ';
      const SIG: string = 'hello';
      const PWD: string = 'pass123';
      const CONF: string = 'pass123';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(CHECK).assertEqual(3);
      expect(AccountValidator.isEmailValid(MAIL)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0053 end');
    });

    /**
     * @tc.name   testRegisterValidate0054
     * @tc.number SUB_ACCT_VALREG_0054
     * @tc.desc   malformed address blocks registration even when password fields agree
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0054 begin');
      const U: string = 'tom';
      const MAIL: string = ' tom@example.com';
      const SIG: string = 'hello';
      const PWD: string = 'pass123';
      const CONF: string = 'pass123';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(CHECK).assertEqual(3);
      expect(AccountValidator.isEmailValid(MAIL)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0054 end');
    });

    /**
     * @tc.name   testRegisterValidate0055
     * @tc.number SUB_ACCT_VALREG_0055
     * @tc.desc   malformed address blocks registration even when password fields agree
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0055 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@example.com\t';
      const SIG: string = 'hello';
      const PWD: string = 'pass123';
      const CONF: string = 'pass123';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(CHECK).assertEqual(3);
      expect(AccountValidator.isEmailValid(MAIL)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0055 end');
    });

    /**
     * @tc.name   testRegisterValidate0056
     * @tc.number SUB_ACCT_VALREG_0056
     * @tc.desc   malformed address blocks registration even when password fields agree
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0056 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@例子.com';
      const SIG: string = 'hello';
      const PWD: string = 'pass123';
      const CONF: string = 'pass123';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(CHECK).assertEqual(3);
      expect(AccountValidator.isEmailValid(MAIL)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0056 end');
    });

    /**
     * @tc.name   testRegisterValidate0057
     * @tc.number SUB_ACCT_VALREG_0057
     * @tc.desc   malformed address blocks registration even when password fields agree
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0057 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@example。com';
      const SIG: string = 'hello';
      const PWD: string = 'pass123';
      const CONF: string = 'pass123';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(CHECK).assertEqual(3);
      expect(AccountValidator.isEmailValid(MAIL)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0057 end');
    });

    /**
     * @tc.name   testRegisterValidate0058
     * @tc.number SUB_ACCT_VALREG_0058
     * @tc.desc   malformed address blocks registration even when password fields agree
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0058 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@example.COＭ';
      const SIG: string = 'hello';
      const PWD: string = 'pass123';
      const CONF: string = 'pass123';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(CHECK).assertEqual(3);
      expect(AccountValidator.isEmailValid(MAIL)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0058 end');
    });

    /**
     * @tc.name   testRegisterValidate0059
     * @tc.number SUB_ACCT_VALREG_0059
     * @tc.desc   malformed address blocks registration even when password fields agree
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0059 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom＠example.com';
      const SIG: string = 'hello';
      const PWD: string = 'pass123';
      const CONF: string = 'pass123';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(CHECK).assertEqual(3);
      expect(AccountValidator.isEmailValid(MAIL)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0059 end');
    });

    /**
     * @tc.name   testRegisterValidate0060
     * @tc.number SUB_ACCT_VALREG_0060
     * @tc.desc   malformed address blocks registration even when password fields agree
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0060 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom';
      const SIG: string = 'hello';
      const PWD: string = 'pass123';
      const CONF: string = 'pass123';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(CHECK).assertEqual(3);
      expect(AccountValidator.isEmailValid(MAIL)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0060 end');
    });

    /**
     * @tc.name   testRegisterValidate0061
     * @tc.number SUB_ACCT_VALREG_0061
     * @tc.desc   malformed address blocks registration even when password fields agree
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0061 begin');
      const U: string = 'tom';
      const MAIL: string = '@';
      const SIG: string = 'hello';
      const PWD: string = 'pass123';
      const CONF: string = 'pass123';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(CHECK).assertEqual(3);
      expect(AccountValidator.isEmailValid(MAIL)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0061 end');
    });

    /**
     * @tc.name   testRegisterValidate0062
     * @tc.number SUB_ACCT_VALREG_0062
     * @tc.desc   malformed address blocks registration even when password fields agree
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0062 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@-';
      const SIG: string = 'hello';
      const PWD: string = 'pass123';
      const CONF: string = 'pass123';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(CHECK).assertEqual(3);
      expect(AccountValidator.isEmailValid(MAIL)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0062 end');
    });

    /**
     * @tc.name   testRegisterValidate0063
     * @tc.number SUB_ACCT_VALREG_0063
     * @tc.desc   malformed address blocks registration even when password fields agree
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0063 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@.';
      const SIG: string = 'hello';
      const PWD: string = 'pass123';
      const CONF: string = 'pass123';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(CHECK).assertEqual(3);
      expect(AccountValidator.isEmailValid(MAIL)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0063 end');
    });

    /**
     * @tc.name   testRegisterValidate0064
     * @tc.number SUB_ACCT_VALREG_0064
     * @tc.desc   malformed address blocks registration even when password fields agree
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0064 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@...';
      const SIG: string = 'hello';
      const PWD: string = 'pass123';
      const CONF: string = 'pass123';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(CHECK).assertEqual(3);
      expect(AccountValidator.isEmailValid(MAIL)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0064 end');
    });

    /**
     * @tc.name   testRegisterValidate0065
     * @tc.number SUB_ACCT_VALREG_0065
     * @tc.desc   malformed address blocks registration even when password fields agree
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0065 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@a..b.com';
      const SIG: string = 'hello';
      const PWD: string = 'pass123';
      const CONF: string = 'pass123';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(CHECK).assertEqual(3);
      expect(AccountValidator.isEmailValid(MAIL)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0065 end');
    });

    /**
     * @tc.name   testRegisterValidate0066
     * @tc.number SUB_ACCT_VALREG_0066
     * @tc.desc   malformed address blocks registration even when password fields agree
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0066 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@example.com/';
      const SIG: string = 'hello';
      const PWD: string = 'pass123';
      const CONF: string = 'pass123';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(CHECK).assertEqual(3);
      expect(AccountValidator.isEmailValid(MAIL)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0066 end');
    });

    /**
     * @tc.name   testRegisterValidate0067
     * @tc.number SUB_ACCT_VALREG_0067
     * @tc.desc   empty password is separated from a password that is merely too short
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0067 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@example.com';
      const SIG: string = 'hello';
      const PWD: string = '';
      const CONF: string = '';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.PASSWORD_EMPTY');
      expect(CHECK).assertEqual(RegisterResult.PASSWORD_EMPTY);
      expect(CHECK).assertEqual(4);
      expect(PWD.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0067 end');
    });

    /**
     * @tc.name   testRegisterValidate0068
     * @tc.number SUB_ACCT_VALREG_0068
     * @tc.desc   empty password is separated from a password that is merely too short
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0068 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@example.com';
      const SIG: string = 'hello';
      const PWD: string = '';
      const CONF: string = 'pass123';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.PASSWORD_EMPTY');
      expect(CHECK).assertEqual(RegisterResult.PASSWORD_EMPTY);
      expect(CHECK).assertEqual(4);
      expect(PWD.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0068 end');
    });

    /**
     * @tc.name   testRegisterValidate0069
     * @tc.number SUB_ACCT_VALREG_0069
     * @tc.desc   empty password is separated from a password that is merely too short
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0069 begin');
      const U: string = 'tom';
      const MAIL: string = '';
      const SIG: string = '';
      const PWD: string = '';
      const CONF: string = '';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.PASSWORD_EMPTY');
      expect(CHECK).assertEqual(RegisterResult.PASSWORD_EMPTY);
      expect(CHECK).assertEqual(4);
      expect(PWD.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0069 end');
    });

    /**
     * @tc.name   testRegisterValidate0070
     * @tc.number SUB_ACCT_VALREG_0070
     * @tc.desc   empty password is separated from a password that is merely too short
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0070 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@example.com';
      const SIG: string = '';
      const PWD: string = '';
      const CONF: string = '';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.PASSWORD_EMPTY');
      expect(CHECK).assertEqual(RegisterResult.PASSWORD_EMPTY);
      expect(CHECK).assertEqual(4);
      expect(PWD.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0070 end');
    });

    /**
     * @tc.name   testRegisterValidate0071
     * @tc.number SUB_ACCT_VALREG_0071
     * @tc.desc   empty password is separated from a password that is merely too short
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0071 begin');
      const U: string = 'jerry';
      const MAIL: string = 'tom@example.com';
      const SIG: string = 'hello';
      const PWD: string = '';
      const CONF: string = 'x';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.PASSWORD_EMPTY');
      expect(CHECK).assertEqual(RegisterResult.PASSWORD_EMPTY);
      expect(CHECK).assertEqual(4);
      expect(PWD.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0071 end');
    });

    /**
     * @tc.name   testRegisterValidate0072
     * @tc.number SUB_ACCT_VALREG_0072
     * @tc.desc   empty password is separated from a password that is merely too short
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0072 begin');
      const U: string = 'tom_2';
      const MAIL: string = 'tom@example.com';
      const SIG: string = 'hello';
      const PWD: string = '';
      const CONF: string = '';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.PASSWORD_EMPTY');
      expect(CHECK).assertEqual(RegisterResult.PASSWORD_EMPTY);
      expect(CHECK).assertEqual(4);
      expect(PWD.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0072 end');
    });

    /**
     * @tc.name   testRegisterValidate0073
     * @tc.number SUB_ACCT_VALREG_0073
     * @tc.desc   empty password is separated from a password that is merely too short
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0073 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@example.org';
      const SIG: string = 'hello';
      const PWD: string = '';
      const CONF: string = 'pass999';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.PASSWORD_EMPTY');
      expect(CHECK).assertEqual(RegisterResult.PASSWORD_EMPTY);
      expect(CHECK).assertEqual(4);
      expect(PWD.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0073 end');
    });

    /**
     * @tc.name   testRegisterValidate0074
     * @tc.number SUB_ACCT_VALREG_0074
     * @tc.desc   empty password is separated from a password that is merely too short
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0074 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@example.com';
      const SIG: string = 'aaaaaaaaaaaaaaaaaaaa';
      const PWD: string = '';
      const CONF: string = '';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.PASSWORD_EMPTY');
      expect(CHECK).assertEqual(RegisterResult.PASSWORD_EMPTY);
      expect(CHECK).assertEqual(4);
      expect(PWD.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0074 end');
    });

    /**
     * @tc.name   testRegisterValidate0075
     * @tc.number SUB_ACCT_VALREG_0075
     * @tc.desc   empty password is separated from a password that is merely too short
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0075 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@example.com';
      const SIG: string = 'hello';
      const PWD: string = '';
      const CONF: string = 'abc';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.PASSWORD_EMPTY');
      expect(CHECK).assertEqual(RegisterResult.PASSWORD_EMPTY);
      expect(CHECK).assertEqual(4);
      expect(PWD.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0075 end');
    });

    /**
     * @tc.name   testRegisterValidate0076
     * @tc.number SUB_ACCT_VALREG_0076
     * @tc.desc   empty password is separated from a password that is merely too short
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0076 begin');
      const U: string = 'tom';
      const MAIL: string = '';
      const SIG: string = 'hello';
      const PWD: string = '';
      const CONF: string = '123456';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.PASSWORD_EMPTY');
      expect(CHECK).assertEqual(RegisterResult.PASSWORD_EMPTY);
      expect(CHECK).assertEqual(4);
      expect(PWD.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0076 end');
    });

    /**
     * @tc.name   testRegisterValidate0077
     * @tc.number SUB_ACCT_VALREG_0077
     * @tc.desc   empty password is separated from a password that is merely too short
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0077 begin');
      const U: string = 'abcdefghijklmno';
      const MAIL: string = 'tom@example.com';
      const SIG: string = '';
      const PWD: string = '';
      const CONF: string = '';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.PASSWORD_EMPTY');
      expect(CHECK).assertEqual(RegisterResult.PASSWORD_EMPTY);
      expect(CHECK).assertEqual(4);
      expect(PWD.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0077 end');
    });

    /**
     * @tc.name   testRegisterValidate0078
     * @tc.number SUB_ACCT_VALREG_0078
     * @tc.desc   empty password is separated from a password that is merely too short
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0078 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@example.com';
      const SIG: string = '中文';
      const PWD: string = '';
      const CONF: string = '';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.PASSWORD_EMPTY');
      expect(CHECK).assertEqual(RegisterResult.PASSWORD_EMPTY);
      expect(CHECK).assertEqual(4);
      expect(PWD.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0078 end');
    });

    /**
     * @tc.name   testRegisterValidate0079
     * @tc.number SUB_ACCT_VALREG_0079
     * @tc.desc   empty password is separated from a password that is merely too short
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0079 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@example.com';
      const SIG: string = 'hello';
      const PWD: string = '';
      const CONF: string = ' ';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.PASSWORD_EMPTY');
      expect(CHECK).assertEqual(RegisterResult.PASSWORD_EMPTY);
      expect(CHECK).assertEqual(4);
      expect(PWD.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0079 end');
    });

    /**
     * @tc.name   testRegisterValidate0080
     * @tc.number SUB_ACCT_VALREG_0080
     * @tc.desc   empty password is separated from a password that is merely too short
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0080 begin');
      const U: string = 'T';
      const MAIL: string = 'tom@example.com';
      const SIG: string = 'hello';
      const PWD: string = '';
      const CONF: string = '';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.PASSWORD_EMPTY');
      expect(CHECK).assertEqual(RegisterResult.PASSWORD_EMPTY);
      expect(CHECK).assertEqual(4);
      expect(PWD.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0080 end');
    });

    /**
     * @tc.name   testRegisterValidate0081
     * @tc.number SUB_ACCT_VALREG_0081
     * @tc.desc   a password below the six character floor stops before the confirm check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0081 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@example.com';
      const SIG: string = 'hello';
      const PWD: string = 'a';
      const CONF: string = 'a';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.PASSWORD_TOO_SHORT');
      expect(CHECK).assertEqual(RegisterResult.PASSWORD_TOO_SHORT);
      expect(CHECK).assertEqual(5);
      expect(AccountValidator.isPasswordLongEnough(PWD)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0081 end');
    });

    /**
     * @tc.name   testRegisterValidate0082
     * @tc.number SUB_ACCT_VALREG_0082
     * @tc.desc   a password below the six character floor stops before the confirm check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0082 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@example.com';
      const SIG: string = 'hello';
      const PWD: string = 'ab';
      const CONF: string = 'ab';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.PASSWORD_TOO_SHORT');
      expect(CHECK).assertEqual(RegisterResult.PASSWORD_TOO_SHORT);
      expect(CHECK).assertEqual(5);
      expect(AccountValidator.isPasswordLongEnough(PWD)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0082 end');
    });

    /**
     * @tc.name   testRegisterValidate0083
     * @tc.number SUB_ACCT_VALREG_0083
     * @tc.desc   a password below the six character floor stops before the confirm check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0083 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@example.com';
      const SIG: string = 'hello';
      const PWD: string = 'abc';
      const CONF: string = 'abc';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.PASSWORD_TOO_SHORT');
      expect(CHECK).assertEqual(RegisterResult.PASSWORD_TOO_SHORT);
      expect(CHECK).assertEqual(5);
      expect(AccountValidator.isPasswordLongEnough(PWD)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0083 end');
    });

    /**
     * @tc.name   testRegisterValidate0084
     * @tc.number SUB_ACCT_VALREG_0084
     * @tc.desc   a password below the six character floor stops before the confirm check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0084 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@example.com';
      const SIG: string = 'hello';
      const PWD: string = 'abcd';
      const CONF: string = 'abcd';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.PASSWORD_TOO_SHORT');
      expect(CHECK).assertEqual(RegisterResult.PASSWORD_TOO_SHORT);
      expect(CHECK).assertEqual(5);
      expect(AccountValidator.isPasswordLongEnough(PWD)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0084 end');
    });

    /**
     * @tc.name   testRegisterValidate0085
     * @tc.number SUB_ACCT_VALREG_0085
     * @tc.desc   a password below the six character floor stops before the confirm check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0085 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@example.com';
      const SIG: string = 'hello';
      const PWD: string = 'abcde';
      const CONF: string = 'abcde';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.PASSWORD_TOO_SHORT');
      expect(CHECK).assertEqual(RegisterResult.PASSWORD_TOO_SHORT);
      expect(CHECK).assertEqual(5);
      expect(AccountValidator.isPasswordLongEnough(PWD)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0085 end');
    });

    /**
     * @tc.name   testRegisterValidate0086
     * @tc.number SUB_ACCT_VALREG_0086
     * @tc.desc   a password below the six character floor stops before the confirm check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0086 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@example.com';
      const SIG: string = 'hello';
      const PWD: string = '12345';
      const CONF: string = '12345';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.PASSWORD_TOO_SHORT');
      expect(CHECK).assertEqual(RegisterResult.PASSWORD_TOO_SHORT);
      expect(CHECK).assertEqual(5);
      expect(AccountValidator.isPasswordLongEnough(PWD)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0086 end');
    });

    /**
     * @tc.name   testRegisterValidate0087
     * @tc.number SUB_ACCT_VALREG_0087
     * @tc.desc   a password below the six character floor stops before the confirm check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0087 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@example.com';
      const SIG: string = 'hello';
      const PWD: string = '     ';
      const CONF: string = '     ';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.PASSWORD_TOO_SHORT');
      expect(CHECK).assertEqual(RegisterResult.PASSWORD_TOO_SHORT);
      expect(CHECK).assertEqual(5);
      expect(AccountValidator.isPasswordLongEnough(PWD)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0087 end');
    });

    /**
     * @tc.name   testRegisterValidate0088
     * @tc.number SUB_ACCT_VALREG_0088
     * @tc.desc   a password below the six character floor stops before the confirm check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0088 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@example.com';
      const SIG: string = 'hello';
      const PWD: string = '晴天晴天';
      const CONF: string = '晴天晴天';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.PASSWORD_TOO_SHORT');
      expect(CHECK).assertEqual(RegisterResult.PASSWORD_TOO_SHORT);
      expect(CHECK).assertEqual(5);
      expect(AccountValidator.isPasswordLongEnough(PWD)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0088 end');
    });

    /**
     * @tc.name   testRegisterValidate0089
     * @tc.number SUB_ACCT_VALREG_0089
     * @tc.desc   a password below the six character floor stops before the confirm check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0089 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@example.com';
      const SIG: string = 'hello';
      const PWD: string = 'p';
      const CONF: string = 'pass123';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.PASSWORD_TOO_SHORT');
      expect(CHECK).assertEqual(RegisterResult.PASSWORD_TOO_SHORT);
      expect(CHECK).assertEqual(5);
      expect(AccountValidator.isPasswordLongEnough(PWD)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0089 end');
    });

    /**
     * @tc.name   testRegisterValidate0090
     * @tc.number SUB_ACCT_VALREG_0090
     * @tc.desc   a password below the six character floor stops before the confirm check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0090 begin');
      const U: string = 'tom';
      const MAIL: string = '';
      const SIG: string = '';
      const PWD: string = 'ab';
      const CONF: string = 'ab';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.PASSWORD_TOO_SHORT');
      expect(CHECK).assertEqual(RegisterResult.PASSWORD_TOO_SHORT);
      expect(CHECK).assertEqual(5);
      expect(AccountValidator.isPasswordLongEnough(PWD)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0090 end');
    });

    /**
     * @tc.name   testRegisterValidate0091
     * @tc.number SUB_ACCT_VALREG_0091
     * @tc.desc   a password below the six character floor stops before the confirm check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0091 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@example.com';
      const SIG: string = 'hello';
      const PWD: string = '😀😀';
      const CONF: string = '😀😀';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.PASSWORD_TOO_SHORT');
      expect(CHECK).assertEqual(RegisterResult.PASSWORD_TOO_SHORT);
      expect(CHECK).assertEqual(5);
      expect(AccountValidator.isPasswordLongEnough(PWD)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0091 end');
    });

    /**
     * @tc.name   testRegisterValidate0092
     * @tc.number SUB_ACCT_VALREG_0092
     * @tc.desc   a password below the six character floor stops before the confirm check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0092 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@example.com';
      const SIG: string = 'hello';
      const PWD: string = 'abcde';
      const CONF: string = 'abcdef';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.PASSWORD_TOO_SHORT');
      expect(CHECK).assertEqual(RegisterResult.PASSWORD_TOO_SHORT);
      expect(CHECK).assertEqual(5);
      expect(AccountValidator.isPasswordLongEnough(PWD)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0092 end');
    });

    /**
     * @tc.name   testRegisterValidate0093
     * @tc.number SUB_ACCT_VALREG_0093
     * @tc.desc   a password below the six character floor stops before the confirm check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0093 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@example.com';
      const SIG: string = 'hello';
      const PWD: string = 'aaaaa';
      const CONF: string = 'aaaaa';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.PASSWORD_TOO_SHORT');
      expect(CHECK).assertEqual(RegisterResult.PASSWORD_TOO_SHORT);
      expect(CHECK).assertEqual(5);
      expect(AccountValidator.isPasswordLongEnough(PWD)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0093 end');
    });

    /**
     * @tc.name   testRegisterValidate0094
     * @tc.number SUB_ACCT_VALREG_0094
     * @tc.desc   a password below the six character floor stops before the confirm check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0094 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@example.com';
      const SIG: string = 'hello';
      const PWD: string = 'Ab1!';
      const CONF: string = 'Ab1!';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.PASSWORD_TOO_SHORT');
      expect(CHECK).assertEqual(RegisterResult.PASSWORD_TOO_SHORT);
      expect(CHECK).assertEqual(5);
      expect(AccountValidator.isPasswordLongEnough(PWD)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0094 end');
    });

    /**
     * @tc.name   testRegisterValidate0095
     * @tc.number SUB_ACCT_VALREG_0095
     * @tc.desc   a password below the six character floor stops before the confirm check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0095 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@example.com';
      const SIG: string = 'hello';
      const PWD: string = '1234';
      const CONF: string = '1234';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.PASSWORD_TOO_SHORT');
      expect(CHECK).assertEqual(RegisterResult.PASSWORD_TOO_SHORT);
      expect(CHECK).assertEqual(5);
      expect(AccountValidator.isPasswordLongEnough(PWD)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0095 end');
    });

    /**
     * @tc.name   testRegisterValidate0096
     * @tc.number SUB_ACCT_VALREG_0096
     * @tc.desc   a password below the six character floor stops before the confirm check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0096 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@example.com';
      const SIG: string = 'hello';
      const PWD: string = '\t\t\t';
      const CONF: string = '\t\t\t';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.PASSWORD_TOO_SHORT');
      expect(CHECK).assertEqual(RegisterResult.PASSWORD_TOO_SHORT);
      expect(CHECK).assertEqual(5);
      expect(AccountValidator.isPasswordLongEnough(PWD)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0096 end');
    });

    /**
     * @tc.name   testRegisterValidate0097
     * @tc.number SUB_ACCT_VALREG_0097
     * @tc.desc   confirm field must repeat the password byte for byte
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0097 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@example.com';
      const SIG: string = 'hello';
      const PWD: string = 'pass123';
      const CONF: string = '';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.CONFIRM_MISMATCH');
      expect(CHECK).assertEqual(RegisterResult.CONFIRM_MISMATCH);
      expect(CHECK).assertEqual(6);
      expect(PWD === CONF).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0097 end');
    });

    /**
     * @tc.name   testRegisterValidate0098
     * @tc.number SUB_ACCT_VALREG_0098
     * @tc.desc   confirm field must repeat the password byte for byte
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0098 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@example.com';
      const SIG: string = 'hello';
      const PWD: string = 'pass123';
      const CONF: string = 'pass124';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.CONFIRM_MISMATCH');
      expect(CHECK).assertEqual(RegisterResult.CONFIRM_MISMATCH);
      expect(CHECK).assertEqual(6);
      expect(PWD === CONF).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0098 end');
    });

    /**
     * @tc.name   testRegisterValidate0099
     * @tc.number SUB_ACCT_VALREG_0099
     * @tc.desc   confirm field must repeat the password byte for byte
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0099 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@example.com';
      const SIG: string = 'hello';
      const PWD: string = 'pass123';
      const CONF: string = 'Pass123';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.CONFIRM_MISMATCH');
      expect(CHECK).assertEqual(RegisterResult.CONFIRM_MISMATCH);
      expect(CHECK).assertEqual(6);
      expect(PWD === CONF).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0099 end');
    });

    /**
     * @tc.name   testRegisterValidate0100
     * @tc.number SUB_ACCT_VALREG_0100
     * @tc.desc   confirm field must repeat the password byte for byte
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0100 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@example.com';
      const SIG: string = 'hello';
      const PWD: string = 'pass123';
      const CONF: string = 'pass123 ';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.CONFIRM_MISMATCH');
      expect(CHECK).assertEqual(RegisterResult.CONFIRM_MISMATCH);
      expect(CHECK).assertEqual(6);
      expect(PWD === CONF).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0100 end');
    });

  });
}
