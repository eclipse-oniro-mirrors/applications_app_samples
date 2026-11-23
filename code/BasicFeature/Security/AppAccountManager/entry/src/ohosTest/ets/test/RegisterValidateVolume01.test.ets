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

export default function registerValidateTest01() {
  describe('RegisterValidateTest01', () => {

    /**
     * @tc.name   testRegisterValidate0001
     * @tc.number SUB_ACCT_VALREG_0001
     * @tc.desc   empty username short circuits before every other register branch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegisterValidate0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0001 begin');
      const U: string = '';
      const MAIL: string = 'tom@example.com';
      const SIG: string = 'hello';
      const PWD: string = 'pass123';
      const CONF: string = 'pass123';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.USERNAME_EMPTY');
      expect(CHECK).assertEqual(RegisterResult.USERNAME_EMPTY);
      expect(CHECK).assertEqual(1);
      expect(AccountValidator.isUsernameValid(U)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0001 end');
    });

    /**
     * @tc.name   testRegisterValidate0002
     * @tc.number SUB_ACCT_VALREG_0002
     * @tc.desc   empty username short circuits before every other register branch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegisterValidate0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0002 begin');
      const U: string = '';
      const MAIL: string = '';
      const SIG: string = '';
      const PWD: string = '';
      const CONF: string = '';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.USERNAME_EMPTY');
      expect(CHECK).assertEqual(RegisterResult.USERNAME_EMPTY);
      expect(CHECK).assertEqual(1);
      expect(AccountValidator.isUsernameValid(U)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0002 end');
    });

    /**
     * @tc.name   testRegisterValidate0003
     * @tc.number SUB_ACCT_VALREG_0003
     * @tc.desc   empty username short circuits before every other register branch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegisterValidate0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0003 begin');
      const U: string = '';
      const MAIL: string = '';
      const SIG: string = '';
      const PWD: string = '';
      const CONF: string = '';
      const HAS: boolean = true;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.USERNAME_EMPTY');
      expect(CHECK).assertEqual(RegisterResult.USERNAME_EMPTY);
      expect(CHECK).assertEqual(1);
      expect(AccountValidator.isUsernameValid(U)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0003 end');
    });

    /**
     * @tc.name   testRegisterValidate0004
     * @tc.number SUB_ACCT_VALREG_0004
     * @tc.desc   empty username short circuits before every other register branch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegisterValidate0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0004 begin');
      const U: string = '';
      const MAIL: string = 'bad-email';
      const SIG: string = 'hello';
      const PWD: string = 'pass123';
      const CONF: string = 'pass123';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.USERNAME_EMPTY');
      expect(CHECK).assertEqual(RegisterResult.USERNAME_EMPTY);
      expect(CHECK).assertEqual(1);
      expect(AccountValidator.isUsernameValid(U)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0004 end');
    });

    /**
     * @tc.name   testRegisterValidate0005
     * @tc.number SUB_ACCT_VALREG_0005
     * @tc.desc   empty username short circuits before every other register branch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegisterValidate0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0005 begin');
      const U: string = '';
      const MAIL: string = 'tom@example.com';
      const SIG: string = 'hello';
      const PWD: string = 'pass123';
      const CONF: string = 'pass999';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.USERNAME_EMPTY');
      expect(CHECK).assertEqual(RegisterResult.USERNAME_EMPTY);
      expect(CHECK).assertEqual(1);
      expect(AccountValidator.isUsernameValid(U)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0005 end');
    });

    /**
     * @tc.name   testRegisterValidate0006
     * @tc.number SUB_ACCT_VALREG_0006
     * @tc.desc   empty username short circuits before every other register branch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegisterValidate0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0006 begin');
      const U: string = '';
      const MAIL: string = 'tom@example.com';
      const SIG: string = 'hello';
      const PWD: string = '';
      const CONF: string = 'pass123';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.USERNAME_EMPTY');
      expect(CHECK).assertEqual(RegisterResult.USERNAME_EMPTY);
      expect(CHECK).assertEqual(1);
      expect(AccountValidator.isUsernameValid(U)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0006 end');
    });

    /**
     * @tc.name   testRegisterValidate0007
     * @tc.number SUB_ACCT_VALREG_0007
     * @tc.desc   empty username short circuits before every other register branch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegisterValidate0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0007 begin');
      const U: string = '';
      const MAIL: string = 'tom@example.com';
      const SIG: string = '';
      const PWD: string = 'abc';
      const CONF: string = 'abc';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.USERNAME_EMPTY');
      expect(CHECK).assertEqual(RegisterResult.USERNAME_EMPTY);
      expect(CHECK).assertEqual(1);
      expect(AccountValidator.isUsernameValid(U)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0007 end');
    });

    /**
     * @tc.name   testRegisterValidate0008
     * @tc.number SUB_ACCT_VALREG_0008
     * @tc.desc   empty username short circuits before every other register branch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegisterValidate0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0008 begin');
      const U: string = '';
      const MAIL: string = 'x@y.com';
      const SIG: string = 'sig';
      const PWD: string = 'pppppppppppppppppppp';
      const CONF: string = 'pppppppppppppppppppp';
      const HAS: boolean = true;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.USERNAME_EMPTY');
      expect(CHECK).assertEqual(RegisterResult.USERNAME_EMPTY);
      expect(CHECK).assertEqual(1);
      expect(AccountValidator.isUsernameValid(U)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0008 end');
    });

    /**
     * @tc.name   testRegisterValidate0009
     * @tc.number SUB_ACCT_VALREG_0009
     * @tc.desc   empty username short circuits before every other register branch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegisterValidate0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0009 begin');
      const U: string = '';
      const MAIL: string = '中文';
      const SIG: string = '';
      const PWD: string = '密码密码';
      const CONF: string = '密码密码';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.USERNAME_EMPTY');
      expect(CHECK).assertEqual(RegisterResult.USERNAME_EMPTY);
      expect(CHECK).assertEqual(1);
      expect(AccountValidator.isUsernameValid(U)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0009 end');
    });

    /**
     * @tc.name   testRegisterValidate0010
     * @tc.number SUB_ACCT_VALREG_0010
     * @tc.desc   empty username short circuits before every other register branch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegisterValidate0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0010 begin');
      const U: string = '';
      const MAIL: string = 'tom@example.com';
      const SIG: string = 's';
      const PWD: string = ' ';
      const CONF: string = ' ';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.USERNAME_EMPTY');
      expect(CHECK).assertEqual(RegisterResult.USERNAME_EMPTY);
      expect(CHECK).assertEqual(1);
      expect(AccountValidator.isUsernameValid(U)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0010 end');
    });

    /**
     * @tc.name   testRegisterValidate0011
     * @tc.number SUB_ACCT_VALREG_0011
     * @tc.desc   empty username short circuits before every other register branch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegisterValidate0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0011 begin');
      const U: string = '';
      const MAIL: string = 'tom@example.com';
      const SIG: string = 's';
      const PWD: string = 'pass123';
      const CONF: string = '';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.USERNAME_EMPTY');
      expect(CHECK).assertEqual(RegisterResult.USERNAME_EMPTY);
      expect(CHECK).assertEqual(1);
      expect(AccountValidator.isUsernameValid(U)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0011 end');
    });

    /**
     * @tc.name   testRegisterValidate0012
     * @tc.number SUB_ACCT_VALREG_0012
     * @tc.desc   empty username short circuits before every other register branch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegisterValidate0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0012 begin');
      const U: string = '';
      const MAIL: string = 'tom@example.com';
      const SIG: string = 's';
      const PWD: string = '123456';
      const CONF: string = '123455';
      const HAS: boolean = true;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.USERNAME_EMPTY');
      expect(CHECK).assertEqual(RegisterResult.USERNAME_EMPTY);
      expect(CHECK).assertEqual(1);
      expect(AccountValidator.isUsernameValid(U)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0012 end');
    });

    /**
     * @tc.name   testRegisterValidate0013
     * @tc.number SUB_ACCT_VALREG_0013
     * @tc.desc   empty username short circuits before every other register branch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegisterValidate0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0013 begin');
      const U: string = '';
      const MAIL: string = 'tom@example.c';
      const SIG: string = '';
      const PWD: string = 'abcdef';
      const CONF: string = 'abcdef';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.USERNAME_EMPTY');
      expect(CHECK).assertEqual(RegisterResult.USERNAME_EMPTY);
      expect(CHECK).assertEqual(1);
      expect(AccountValidator.isUsernameValid(U)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0013 end');
    });

    /**
     * @tc.name   testRegisterValidate0014
     * @tc.number SUB_ACCT_VALREG_0014
     * @tc.desc   empty username short circuits before every other register branch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegisterValidate0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0014 begin');
      const U: string = '';
      const MAIL: string = 'tom@example.com';
      const SIG: string = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa';
      const PWD: string = 'pass123';
      const CONF: string = 'pass123';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.USERNAME_EMPTY');
      expect(CHECK).assertEqual(RegisterResult.USERNAME_EMPTY);
      expect(CHECK).assertEqual(1);
      expect(AccountValidator.isUsernameValid(U)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0014 end');
    });

    /**
     * @tc.name   testRegisterValidate0015
     * @tc.number SUB_ACCT_VALREG_0015
     * @tc.desc   empty username short circuits before every other register branch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegisterValidate0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0015 begin');
      const U: string = '';
      const MAIL: string = 'tom@example.com';
      const SIG: string = '';
      const PWD: string = 'qqqqqq';
      const CONF: string = 'qqqqqqq';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.USERNAME_EMPTY');
      expect(CHECK).assertEqual(RegisterResult.USERNAME_EMPTY);
      expect(CHECK).assertEqual(1);
      expect(AccountValidator.isUsernameValid(U)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0015 end');
    });

    /**
     * @tc.name   testRegisterValidate0016
     * @tc.number SUB_ACCT_VALREG_0016
     * @tc.desc   empty username short circuits before every other register branch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegisterValidate0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0016 begin');
      const U: string = '';
      const MAIL: string = 'tom@example.abcdefg';
      const SIG: string = 'x';
      const PWD: string = 'pass123';
      const CONF: string = 'pass123';
      const HAS: boolean = true;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.USERNAME_EMPTY');
      expect(CHECK).assertEqual(RegisterResult.USERNAME_EMPTY);
      expect(CHECK).assertEqual(1);
      expect(AccountValidator.isUsernameValid(U)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0016 end');
    });

    /**
     * @tc.name   testRegisterValidate0017
     * @tc.number SUB_ACCT_VALREG_0017
     * @tc.desc   existing account is reported before any form field is inspected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegisterValidate0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0017 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@example.com';
      const SIG: string = 'hello';
      const PWD: string = 'pass123';
      const CONF: string = 'pass123';
      const HAS: boolean = true;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.ACCOUNT_EXISTS');
      expect(CHECK).assertEqual(RegisterResult.ACCOUNT_EXISTS);
      expect(CHECK).assertEqual(2);
      expect(AccountValidator.isUsernameValid(U)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0017 end');
    });

    /**
     * @tc.name   testRegisterValidate0018
     * @tc.number SUB_ACCT_VALREG_0018
     * @tc.desc   existing account is reported before any form field is inspected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegisterValidate0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0018 begin');
      const U: string = 'tom';
      const MAIL: string = '';
      const SIG: string = '';
      const PWD: string = '';
      const CONF: string = '';
      const HAS: boolean = true;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.ACCOUNT_EXISTS');
      expect(CHECK).assertEqual(RegisterResult.ACCOUNT_EXISTS);
      expect(CHECK).assertEqual(2);
      expect(AccountValidator.isUsernameValid(U)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0018 end');
    });

    /**
     * @tc.name   testRegisterValidate0019
     * @tc.number SUB_ACCT_VALREG_0019
     * @tc.desc   existing account is reported before any form field is inspected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegisterValidate0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0019 begin');
      const U: string = 'tom';
      const MAIL: string = 'bad-email';
      const SIG: string = 'hello';
      const PWD: string = 'pass123';
      const CONF: string = 'pass123';
      const HAS: boolean = true;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.ACCOUNT_EXISTS');
      expect(CHECK).assertEqual(RegisterResult.ACCOUNT_EXISTS);
      expect(CHECK).assertEqual(2);
      expect(AccountValidator.isUsernameValid(U)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0019 end');
    });

    /**
     * @tc.name   testRegisterValidate0020
     * @tc.number SUB_ACCT_VALREG_0020
     * @tc.desc   existing account is reported before any form field is inspected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegisterValidate0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0020 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@example.com';
      const SIG: string = 'hello';
      const PWD: string = 'abc';
      const CONF: string = 'abc';
      const HAS: boolean = true;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.ACCOUNT_EXISTS');
      expect(CHECK).assertEqual(RegisterResult.ACCOUNT_EXISTS);
      expect(CHECK).assertEqual(2);
      expect(AccountValidator.isUsernameValid(U)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0020 end');
    });

    /**
     * @tc.name   testRegisterValidate0021
     * @tc.number SUB_ACCT_VALREG_0021
     * @tc.desc   existing account is reported before any form field is inspected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegisterValidate0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0021 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@example.com';
      const SIG: string = 'hello';
      const PWD: string = '';
      const CONF: string = '';
      const HAS: boolean = true;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.ACCOUNT_EXISTS');
      expect(CHECK).assertEqual(RegisterResult.ACCOUNT_EXISTS);
      expect(CHECK).assertEqual(2);
      expect(AccountValidator.isUsernameValid(U)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0021 end');
    });

    /**
     * @tc.name   testRegisterValidate0022
     * @tc.number SUB_ACCT_VALREG_0022
     * @tc.desc   existing account is reported before any form field is inspected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegisterValidate0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0022 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@example.com';
      const SIG: string = 'hello';
      const PWD: string = 'pass123';
      const CONF: string = 'pass999';
      const HAS: boolean = true;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.ACCOUNT_EXISTS');
      expect(CHECK).assertEqual(RegisterResult.ACCOUNT_EXISTS);
      expect(CHECK).assertEqual(2);
      expect(AccountValidator.isUsernameValid(U)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0022 end');
    });

    /**
     * @tc.name   testRegisterValidate0023
     * @tc.number SUB_ACCT_VALREG_0023
     * @tc.desc   existing account is reported before any form field is inspected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegisterValidate0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0023 begin');
      const U: string = 'tom_2';
      const MAIL: string = 'tom@example.com';
      const SIG: string = 'hello';
      const PWD: string = 'pass123';
      const CONF: string = 'pass123';
      const HAS: boolean = true;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.ACCOUNT_EXISTS');
      expect(CHECK).assertEqual(RegisterResult.ACCOUNT_EXISTS);
      expect(CHECK).assertEqual(2);
      expect(AccountValidator.isUsernameValid(U)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0023 end');
    });

    /**
     * @tc.name   testRegisterValidate0024
     * @tc.number SUB_ACCT_VALREG_0024
     * @tc.desc   existing account is reported before any form field is inspected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegisterValidate0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0024 begin');
      const U: string = 'a';
      const MAIL: string = 'tom@example.com';
      const SIG: string = 'hello';
      const PWD: string = 'pass123';
      const CONF: string = 'pass123';
      const HAS: boolean = true;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.ACCOUNT_EXISTS');
      expect(CHECK).assertEqual(RegisterResult.ACCOUNT_EXISTS);
      expect(CHECK).assertEqual(2);
      expect(AccountValidator.isUsernameValid(U)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0024 end');
    });

    /**
     * @tc.name   testRegisterValidate0025
     * @tc.number SUB_ACCT_VALREG_0025
     * @tc.desc   existing account is reported before any form field is inspected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegisterValidate0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0025 begin');
      const U: string = 'abcdefghijklmno';
      const MAIL: string = 'tom@example.com';
      const SIG: string = 'hello';
      const PWD: string = 'pass123';
      const CONF: string = 'pass123';
      const HAS: boolean = true;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.ACCOUNT_EXISTS');
      expect(CHECK).assertEqual(RegisterResult.ACCOUNT_EXISTS);
      expect(CHECK).assertEqual(2);
      expect(AccountValidator.isUsernameValid(U)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0025 end');
    });

    /**
     * @tc.name   testRegisterValidate0026
     * @tc.number SUB_ACCT_VALREG_0026
     * @tc.desc   existing account is reported before any form field is inspected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegisterValidate0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0026 begin');
      const U: string = 'TOM';
      const MAIL: string = 'tom@example.com';
      const SIG: string = 'hello';
      const PWD: string = 'pass123';
      const CONF: string = 'pass123';
      const HAS: boolean = true;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.ACCOUNT_EXISTS');
      expect(CHECK).assertEqual(RegisterResult.ACCOUNT_EXISTS);
      expect(CHECK).assertEqual(2);
      expect(AccountValidator.isUsernameValid(U)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0026 end');
    });

    /**
     * @tc.name   testRegisterValidate0027
     * @tc.number SUB_ACCT_VALREG_0027
     * @tc.desc   existing account is reported before any form field is inspected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegisterValidate0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0027 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@example.c';
      const SIG: string = 'hello';
      const PWD: string = 'pass123';
      const CONF: string = 'pass123';
      const HAS: boolean = true;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.ACCOUNT_EXISTS');
      expect(CHECK).assertEqual(RegisterResult.ACCOUNT_EXISTS);
      expect(CHECK).assertEqual(2);
      expect(AccountValidator.isUsernameValid(U)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0027 end');
    });

    /**
     * @tc.name   testRegisterValidate0028
     * @tc.number SUB_ACCT_VALREG_0028
     * @tc.desc   existing account is reported before any form field is inspected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegisterValidate0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0028 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@example.abcdefg';
      const SIG: string = 'hello';
      const PWD: string = 'pass123';
      const CONF: string = 'pass123';
      const HAS: boolean = true;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.ACCOUNT_EXISTS');
      expect(CHECK).assertEqual(RegisterResult.ACCOUNT_EXISTS);
      expect(CHECK).assertEqual(2);
      expect(AccountValidator.isUsernameValid(U)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0028 end');
    });

    /**
     * @tc.name   testRegisterValidate0029
     * @tc.number SUB_ACCT_VALREG_0029
     * @tc.desc   existing account is reported before any form field is inspected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegisterValidate0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0029 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom example.com';
      const SIG: string = '';
      const PWD: string = 'ppppppppp';
      const CONF: string = 'ppppppppp';
      const HAS: boolean = true;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.ACCOUNT_EXISTS');
      expect(CHECK).assertEqual(RegisterResult.ACCOUNT_EXISTS);
      expect(CHECK).assertEqual(2);
      expect(AccountValidator.isUsernameValid(U)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0029 end');
    });

    /**
     * @tc.name   testRegisterValidate0030
     * @tc.number SUB_ACCT_VALREG_0030
     * @tc.desc   existing account is reported before any form field is inspected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegisterValidate0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0030 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@example.com';
      const SIG: string = '';
      const PWD: string = ' ';
      const CONF: string = ' ';
      const HAS: boolean = true;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.ACCOUNT_EXISTS');
      expect(CHECK).assertEqual(RegisterResult.ACCOUNT_EXISTS);
      expect(CHECK).assertEqual(2);
      expect(AccountValidator.isUsernameValid(U)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0030 end');
    });

    /**
     * @tc.name   testRegisterValidate0031
     * @tc.number SUB_ACCT_VALREG_0031
     * @tc.desc   existing account is reported before any form field is inspected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegisterValidate0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0031 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@example.com';
      const SIG: string = 'sig';
      const PWD: string = '123456';
      const CONF: string = '';
      const HAS: boolean = true;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.ACCOUNT_EXISTS');
      expect(CHECK).assertEqual(RegisterResult.ACCOUNT_EXISTS);
      expect(CHECK).assertEqual(2);
      expect(AccountValidator.isUsernameValid(U)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0031 end');
    });

    /**
     * @tc.name   testRegisterValidate0032
     * @tc.number SUB_ACCT_VALREG_0032
     * @tc.desc   existing account is reported before any form field is inspected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegisterValidate0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0032 begin');
      const U: string = 'user_1';
      const MAIL: string = 'tom@example.com';
      const SIG: string = 'sig';
      const PWD: string = '';
      const CONF: string = 'pass123';
      const HAS: boolean = true;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.ACCOUNT_EXISTS');
      expect(CHECK).assertEqual(RegisterResult.ACCOUNT_EXISTS);
      expect(CHECK).assertEqual(2);
      expect(AccountValidator.isUsernameValid(U)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0032 end');
    });

    /**
     * @tc.name   testRegisterValidate0033
     * @tc.number SUB_ACCT_VALREG_0033
     * @tc.desc   existing account is reported before any form field is inspected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegisterValidate0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0033 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@@example.com';
      const SIG: string = 'sig';
      const PWD: string = 'abcde';
      const CONF: string = 'abcde';
      const HAS: boolean = true;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.ACCOUNT_EXISTS');
      expect(CHECK).assertEqual(RegisterResult.ACCOUNT_EXISTS);
      expect(CHECK).assertEqual(2);
      expect(AccountValidator.isUsernameValid(U)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0033 end');
    });

    /**
     * @tc.name   testRegisterValidate0034
     * @tc.number SUB_ACCT_VALREG_0034
     * @tc.desc   existing account is reported before any form field is inspected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegisterValidate0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0034 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@';
      const SIG: string = 'sig';
      const PWD: string = 'pass123';
      const CONF: string = 'pass123';
      const HAS: boolean = true;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.ACCOUNT_EXISTS');
      expect(CHECK).assertEqual(RegisterResult.ACCOUNT_EXISTS);
      expect(CHECK).assertEqual(2);
      expect(AccountValidator.isUsernameValid(U)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0034 end');
    });

    /**
     * @tc.name   testRegisterValidate0035
     * @tc.number SUB_ACCT_VALREG_0035
     * @tc.desc   existing account is reported before any form field is inspected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegisterValidate0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0035 begin');
      const U: string = 'tom';
      const MAIL: string = '';
      const SIG: string = 'sig';
      const PWD: string = 'pass123';
      const CONF: string = 'pass123';
      const HAS: boolean = true;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.ACCOUNT_EXISTS');
      expect(CHECK).assertEqual(RegisterResult.ACCOUNT_EXISTS);
      expect(CHECK).assertEqual(2);
      expect(AccountValidator.isUsernameValid(U)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0035 end');
    });

    /**
     * @tc.name   testRegisterValidate0036
     * @tc.number SUB_ACCT_VALREG_0036
     * @tc.desc   existing account is reported before any form field is inspected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegisterValidate0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0036 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@example.com';
      const SIG: string = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa';
      const PWD: string = 'qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq';
      const CONF: string = 'qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq';
      const HAS: boolean = true;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.ACCOUNT_EXISTS');
      expect(CHECK).assertEqual(RegisterResult.ACCOUNT_EXISTS);
      expect(CHECK).assertEqual(2);
      expect(AccountValidator.isUsernameValid(U)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0036 end');
    });

    /**
     * @tc.name   testRegisterValidate0037
     * @tc.number SUB_ACCT_VALREG_0037
     * @tc.desc   malformed address blocks registration even when password fields agree
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegisterValidate0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0037 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@';
      const SIG: string = 'hello';
      const PWD: string = 'pass123';
      const CONF: string = 'pass123';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(CHECK).assertEqual(3);
      expect(AccountValidator.isEmailValid(MAIL)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0037 end');
    });

    /**
     * @tc.name   testRegisterValidate0038
     * @tc.number SUB_ACCT_VALREG_0038
     * @tc.desc   malformed address blocks registration even when password fields agree
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegisterValidate0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0038 begin');
      const U: string = 'tom';
      const MAIL: string = '@example.com';
      const SIG: string = 'hello';
      const PWD: string = 'pass123';
      const CONF: string = 'pass123';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(CHECK).assertEqual(3);
      expect(AccountValidator.isEmailValid(MAIL)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0038 end');
    });

    /**
     * @tc.name   testRegisterValidate0039
     * @tc.number SUB_ACCT_VALREG_0039
     * @tc.desc   malformed address blocks registration even when password fields agree
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegisterValidate0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0039 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@example';
      const SIG: string = 'hello';
      const PWD: string = 'pass123';
      const CONF: string = 'pass123';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(CHECK).assertEqual(3);
      expect(AccountValidator.isEmailValid(MAIL)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0039 end');
    });

    /**
     * @tc.name   testRegisterValidate0040
     * @tc.number SUB_ACCT_VALREG_0040
     * @tc.desc   malformed address blocks registration even when password fields agree
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegisterValidate0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0040 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@example.c';
      const SIG: string = 'hello';
      const PWD: string = 'pass123';
      const CONF: string = 'pass123';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(CHECK).assertEqual(3);
      expect(AccountValidator.isEmailValid(MAIL)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0040 end');
    });

    /**
     * @tc.name   testRegisterValidate0041
     * @tc.number SUB_ACCT_VALREG_0041
     * @tc.desc   malformed address blocks registration even when password fields agree
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegisterValidate0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0041 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@example.abcdefg';
      const SIG: string = 'hello';
      const PWD: string = 'pass123';
      const CONF: string = 'pass123';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(CHECK).assertEqual(3);
      expect(AccountValidator.isEmailValid(MAIL)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0041 end');
    });

    /**
     * @tc.name   testRegisterValidate0042
     * @tc.number SUB_ACCT_VALREG_0042
     * @tc.desc   malformed address blocks registration even when password fields agree
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegisterValidate0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0042 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom example.com';
      const SIG: string = 'hello';
      const PWD: string = 'pass123';
      const CONF: string = 'pass123';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(CHECK).assertEqual(3);
      expect(AccountValidator.isEmailValid(MAIL)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0042 end');
    });

    /**
     * @tc.name   testRegisterValidate0043
     * @tc.number SUB_ACCT_VALREG_0043
     * @tc.desc   malformed address blocks registration even when password fields agree
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegisterValidate0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0043 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@exa mple.com';
      const SIG: string = 'hello';
      const PWD: string = 'pass123';
      const CONF: string = 'pass123';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(CHECK).assertEqual(3);
      expect(AccountValidator.isEmailValid(MAIL)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0043 end');
    });

    /**
     * @tc.name   testRegisterValidate0044
     * @tc.number SUB_ACCT_VALREG_0044
     * @tc.desc   malformed address blocks registration even when password fields agree
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegisterValidate0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0044 begin');
      const U: string = 'tom';
      const MAIL: string = '中文@example.com';
      const SIG: string = 'hello';
      const PWD: string = 'pass123';
      const CONF: string = 'pass123';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(CHECK).assertEqual(3);
      expect(AccountValidator.isEmailValid(MAIL)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0044 end');
    });

    /**
     * @tc.name   testRegisterValidate0045
     * @tc.number SUB_ACCT_VALREG_0045
     * @tc.desc   malformed address blocks registration even when password fields agree
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegisterValidate0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0045 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom+tag@example.com';
      const SIG: string = 'hello';
      const PWD: string = 'pass123';
      const CONF: string = 'pass123';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(CHECK).assertEqual(3);
      expect(AccountValidator.isEmailValid(MAIL)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0045 end');
    });

    /**
     * @tc.name   testRegisterValidate0046
     * @tc.number SUB_ACCT_VALREG_0046
     * @tc.desc   malformed address blocks registration even when password fields agree
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegisterValidate0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0046 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@.com';
      const SIG: string = 'hello';
      const PWD: string = 'pass123';
      const CONF: string = 'pass123';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(CHECK).assertEqual(3);
      expect(AccountValidator.isEmailValid(MAIL)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0046 end');
    });

    /**
     * @tc.name   testRegisterValidate0047
     * @tc.number SUB_ACCT_VALREG_0047
     * @tc.desc   malformed address blocks registration even when password fields agree
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegisterValidate0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0047 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@@example.com';
      const SIG: string = 'hello';
      const PWD: string = 'pass123';
      const CONF: string = 'pass123';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(CHECK).assertEqual(3);
      expect(AccountValidator.isEmailValid(MAIL)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0047 end');
    });

    /**
     * @tc.name   testRegisterValidate0048
     * @tc.number SUB_ACCT_VALREG_0048
     * @tc.desc   malformed address blocks registration even when password fields agree
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegisterValidate0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0048 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@example..com';
      const SIG: string = 'hello';
      const PWD: string = 'pass123';
      const CONF: string = 'pass123';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(CHECK).assertEqual(3);
      expect(AccountValidator.isEmailValid(MAIL)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0048 end');
    });

    /**
     * @tc.name   testRegisterValidate0049
     * @tc.number SUB_ACCT_VALREG_0049
     * @tc.desc   malformed address blocks registration even when password fields agree
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegisterValidate0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0049 begin');
      const U: string = 'tom';
      const MAIL: string = '.@example.com';
      const SIG: string = 'hello';
      const PWD: string = 'pass123';
      const CONF: string = 'pass123';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(CHECK).assertEqual(0);
      expect(AccountValidator.isPasswordLongEnough(PWD)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0049 end');
    });

    /**
     * @tc.name   testRegisterValidate0050
     * @tc.number SUB_ACCT_VALREG_0050
     * @tc.desc   malformed address blocks registration even when password fields agree
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegisterValidate0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0050 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@@';
      const SIG: string = 'hello';
      const PWD: string = 'pass123';
      const CONF: string = 'pass123';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(CHECK).assertEqual(3);
      expect(AccountValidator.isEmailValid(MAIL)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0050 end');
    });

  });
}
