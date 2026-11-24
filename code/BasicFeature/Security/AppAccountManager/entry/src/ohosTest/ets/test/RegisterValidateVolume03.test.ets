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

export default function registerValidateTest03() {
  describe('RegisterValidateTest03', () => {

    /**
     * @tc.name   testRegisterValidate0101
     * @tc.number SUB_ACCT_VALREG_0101
     * @tc.desc   confirm field must repeat the password byte for byte
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0101 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@example.com';
      const SIG: string = 'hello';
      const PWD: string = 'pass123';
      const CONF: string = ' pass123';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.CONFIRM_MISMATCH');
      expect(CHECK).assertEqual(RegisterResult.CONFIRM_MISMATCH);
      expect(CHECK).assertEqual(6);
      expect(PWD === CONF).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0101 end');
    });

    /**
     * @tc.name   testRegisterValidate0102
     * @tc.number SUB_ACCT_VALREG_0102
     * @tc.desc   confirm field must repeat the password byte for byte
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0102 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@example.com';
      const SIG: string = 'hello';
      const PWD: string = 'pass123';
      const CONF: string = 'pass12';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.CONFIRM_MISMATCH');
      expect(CHECK).assertEqual(RegisterResult.CONFIRM_MISMATCH);
      expect(CHECK).assertEqual(6);
      expect(PWD === CONF).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0102 end');
    });

    /**
     * @tc.name   testRegisterValidate0103
     * @tc.number SUB_ACCT_VALREG_0103
     * @tc.desc   confirm field must repeat the password byte for byte
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0103 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@example.com';
      const SIG: string = 'hello';
      const PWD: string = 'pass123';
      const CONF: string = 'pass1234';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.CONFIRM_MISMATCH');
      expect(CHECK).assertEqual(RegisterResult.CONFIRM_MISMATCH);
      expect(CHECK).assertEqual(6);
      expect(PWD === CONF).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0103 end');
    });

    /**
     * @tc.name   testRegisterValidate0104
     * @tc.number SUB_ACCT_VALREG_0104
     * @tc.desc   confirm field must repeat the password byte for byte
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0104 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@example.com';
      const SIG: string = 'hello';
      const PWD: string = 'abcdef';
      const CONF: string = 'fedcba';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.CONFIRM_MISMATCH');
      expect(CHECK).assertEqual(RegisterResult.CONFIRM_MISMATCH);
      expect(CHECK).assertEqual(6);
      expect(PWD === CONF).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0104 end');
    });

    /**
     * @tc.name   testRegisterValidate0105
     * @tc.number SUB_ACCT_VALREG_0105
     * @tc.desc   confirm field must repeat the password byte for byte
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0105 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@example.com';
      const SIG: string = 'hello';
      const PWD: string = '123456';
      const CONF: string = '654321';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.CONFIRM_MISMATCH');
      expect(CHECK).assertEqual(RegisterResult.CONFIRM_MISMATCH);
      expect(CHECK).assertEqual(6);
      expect(PWD === CONF).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0105 end');
    });

    /**
     * @tc.name   testRegisterValidate0106
     * @tc.number SUB_ACCT_VALREG_0106
     * @tc.desc   confirm field must repeat the password byte for byte
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0106 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@example.com';
      const SIG: string = 'hello';
      const PWD: string = 'pppppppppppppppppppp';
      const CONF: string = 'ppppppppppppppppppp';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.CONFIRM_MISMATCH');
      expect(CHECK).assertEqual(RegisterResult.CONFIRM_MISMATCH);
      expect(CHECK).assertEqual(6);
      expect(PWD === CONF).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0106 end');
    });

    /**
     * @tc.name   testRegisterValidate0107
     * @tc.number SUB_ACCT_VALREG_0107
     * @tc.desc   confirm field must repeat the password byte for byte
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0107 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@example.com';
      const SIG: string = 'hello';
      const PWD: string = 'password';
      const CONF: string = 'password1';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.CONFIRM_MISMATCH');
      expect(CHECK).assertEqual(RegisterResult.CONFIRM_MISMATCH);
      expect(CHECK).assertEqual(6);
      expect(PWD === CONF).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0107 end');
    });

    /**
     * @tc.name   testRegisterValidate0108
     * @tc.number SUB_ACCT_VALREG_0108
     * @tc.desc   confirm field must repeat the password byte for byte
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0108 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@example.com';
      const SIG: string = 'hello';
      const PWD: string = '中文密码验证';
      const CONF: string = '中文密码验证!';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.CONFIRM_MISMATCH');
      expect(CHECK).assertEqual(RegisterResult.CONFIRM_MISMATCH);
      expect(CHECK).assertEqual(6);
      expect(PWD === CONF).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0108 end');
    });

    /**
     * @tc.name   testRegisterValidate0109
     * @tc.number SUB_ACCT_VALREG_0109
     * @tc.desc   confirm field must repeat the password byte for byte
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0109 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@example.com';
      const SIG: string = 'hello';
      const PWD: string = 'pass word';
      const CONF: string = 'pass-word';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.CONFIRM_MISMATCH');
      expect(CHECK).assertEqual(RegisterResult.CONFIRM_MISMATCH);
      expect(CHECK).assertEqual(6);
      expect(PWD === CONF).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0109 end');
    });

    /**
     * @tc.name   testRegisterValidate0110
     * @tc.number SUB_ACCT_VALREG_0110
     * @tc.desc   confirm field must repeat the password byte for byte
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0110 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@example.com';
      const SIG: string = 'hello';
      const PWD: string = 'Abc123';
      const CONF: string = 'abc123';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.CONFIRM_MISMATCH');
      expect(CHECK).assertEqual(RegisterResult.CONFIRM_MISMATCH);
      expect(CHECK).assertEqual(6);
      expect(PWD === CONF).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0110 end');
    });

    /**
     * @tc.name   testRegisterValidate0111
     * @tc.number SUB_ACCT_VALREG_0111
     * @tc.desc   confirm field must repeat the password byte for byte
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0111 begin');
      const U: string = 'tom';
      const MAIL: string = '';
      const SIG: string = 'hello';
      const PWD: string = 'qweasd';
      const CONF: string = 'qweasdz';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.CONFIRM_MISMATCH');
      expect(CHECK).assertEqual(RegisterResult.CONFIRM_MISMATCH);
      expect(CHECK).assertEqual(6);
      expect(PWD === CONF).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0111 end');
    });

    /**
     * @tc.name   testRegisterValidate0112
     * @tc.number SUB_ACCT_VALREG_0112
     * @tc.desc   confirm field must repeat the password byte for byte
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0112 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@example.com';
      const SIG: string = 'hello';
      const PWD: string = 'qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq';
      const CONF: string = 'qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.CONFIRM_MISMATCH');
      expect(CHECK).assertEqual(RegisterResult.CONFIRM_MISMATCH);
      expect(CHECK).assertEqual(6);
      expect(PWD === CONF).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0112 end');
    });

    /**
     * @tc.name   testRegisterValidate0113
     * @tc.number SUB_ACCT_VALREG_0113
     * @tc.desc   confirm field must repeat the password byte for byte
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0113 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@example.com';
      const SIG: string = 'hello';
      const PWD: string = 'secret!';
      const CONF: string = 'secret';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.CONFIRM_MISMATCH');
      expect(CHECK).assertEqual(RegisterResult.CONFIRM_MISMATCH);
      expect(CHECK).assertEqual(6);
      expect(PWD === CONF).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0113 end');
    });

    /**
     * @tc.name   testRegisterValidate0114
     * @tc.number SUB_ACCT_VALREG_0114
     * @tc.desc   confirm field must repeat the password byte for byte
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0114 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@example.com';
      const SIG: string = 'hello';
      const PWD: string = 'aaaaaa';
      const CONF: string = 'aaaaab';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.CONFIRM_MISMATCH');
      expect(CHECK).assertEqual(RegisterResult.CONFIRM_MISMATCH);
      expect(CHECK).assertEqual(6);
      expect(PWD === CONF).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0114 end');
    });

    /**
     * @tc.name   testRegisterValidate0115
     * @tc.number SUB_ACCT_VALREG_0115
     * @tc.desc   confirm field must repeat the password byte for byte
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0115 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@example.com';
      const SIG: string = 'hello';
      const PWD: string = '000000';
      const CONF: string = '000001';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.CONFIRM_MISMATCH');
      expect(CHECK).assertEqual(RegisterResult.CONFIRM_MISMATCH);
      expect(CHECK).assertEqual(6);
      expect(PWD === CONF).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0115 end');
    });

    /**
     * @tc.name   testRegisterValidate0116
     * @tc.number SUB_ACCT_VALREG_0116
     * @tc.desc   confirm field must repeat the password byte for byte
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0116 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@example.com';
      const SIG: string = 'hello';
      const PWD: string = 'pass123';
      const CONF: string = 'pass 123';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.CONFIRM_MISMATCH');
      expect(CHECK).assertEqual(RegisterResult.CONFIRM_MISMATCH);
      expect(CHECK).assertEqual(6);
      expect(PWD === CONF).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0116 end');
    });

    /**
     * @tc.name   testRegisterValidate0117
     * @tc.number SUB_ACCT_VALREG_0117
     * @tc.desc   confirm field must repeat the password byte for byte
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0117 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@example.com';
      const SIG: string = 'hello';
      const PWD: string = 'ABCdef';
      const CONF: string = 'ABCdefg';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.CONFIRM_MISMATCH');
      expect(CHECK).assertEqual(RegisterResult.CONFIRM_MISMATCH);
      expect(CHECK).assertEqual(6);
      expect(PWD === CONF).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0117 end');
    });

    /**
     * @tc.name   testRegisterValidate0118
     * @tc.number SUB_ACCT_VALREG_0118
     * @tc.desc   confirm field must repeat the password byte for byte
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0118 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@example.com';
      const SIG: string = 'hello';
      const PWD: string = '12345678';
      const CONF: string = '1234567';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.CONFIRM_MISMATCH');
      expect(CHECK).assertEqual(RegisterResult.CONFIRM_MISMATCH);
      expect(CHECK).assertEqual(6);
      expect(PWD === CONF).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0118 end');
    });

    /**
     * @tc.name   testRegisterValidate0119
     * @tc.number SUB_ACCT_VALREG_0119
     * @tc.desc   confirm field must repeat the password byte for byte
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0119 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@example.com';
      const SIG: string = 'hello';
      const PWD: string = 'password';
      const CONF: string = 'Password';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.CONFIRM_MISMATCH');
      expect(CHECK).assertEqual(RegisterResult.CONFIRM_MISMATCH);
      expect(CHECK).assertEqual(6);
      expect(PWD === CONF).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0119 end');
    });

    /**
     * @tc.name   testRegisterValidate0120
     * @tc.number SUB_ACCT_VALREG_0120
     * @tc.desc   confirm field must repeat the password byte for byte
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0120 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@example.com';
      const SIG: string = 'hello';
      const PWD: string = 'zzzzzz';
      const CONF: string = 'zzzzzZ';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.CONFIRM_MISMATCH');
      expect(CHECK).assertEqual(RegisterResult.CONFIRM_MISMATCH);
      expect(CHECK).assertEqual(6);
      expect(PWD === CONF).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0120 end');
    });

    /**
     * @tc.name   testRegisterValidate0121
     * @tc.number SUB_ACCT_VALREG_0121
     * @tc.desc   every accepted field together reaches the success branch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0121 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@example.com';
      const SIG: string = 'hello';
      const PWD: string = 'pass123';
      const CONF: string = 'pass123';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(CHECK).assertEqual(0);
      expect(AccountValidator.isPasswordLongEnough(PWD)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0121 end');
    });

    /**
     * @tc.name   testRegisterValidate0122
     * @tc.number SUB_ACCT_VALREG_0122
     * @tc.desc   every accepted field together reaches the success branch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0122 begin');
      const U: string = 'tom';
      const MAIL: string = '';
      const SIG: string = '';
      const PWD: string = 'pass123';
      const CONF: string = 'pass123';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(CHECK).assertEqual(0);
      expect(AccountValidator.isPasswordLongEnough(PWD)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0122 end');
    });

    /**
     * @tc.name   testRegisterValidate0123
     * @tc.number SUB_ACCT_VALREG_0123
     * @tc.desc   every accepted field together reaches the success branch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0123 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@example.com';
      const SIG: string = '';
      const PWD: string = 'abcdef';
      const CONF: string = 'abcdef';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(CHECK).assertEqual(0);
      expect(AccountValidator.isPasswordLongEnough(PWD)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0123 end');
    });

    /**
     * @tc.name   testRegisterValidate0124
     * @tc.number SUB_ACCT_VALREG_0124
     * @tc.desc   every accepted field together reaches the success branch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0124 begin');
      const U: string = 'tom_2';
      const MAIL: string = 'tom2@example.org';
      const SIG: string = 'sig';
      const PWD: string = '123456';
      const CONF: string = '123456';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(CHECK).assertEqual(0);
      expect(AccountValidator.isPasswordLongEnough(PWD)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0124 end');
    });

    /**
     * @tc.name   testRegisterValidate0125
     * @tc.number SUB_ACCT_VALREG_0125
     * @tc.desc   every accepted field together reaches the success branch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0125 begin');
      const U: string = 'TOM';
      const MAIL: string = 'TOM@EXAMPLE.COM';
      const SIG: string = 'SIG';
      const PWD: string = 'AAAAAA';
      const CONF: string = 'AAAAAA';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(CHECK).assertEqual(0);
      expect(AccountValidator.isPasswordLongEnough(PWD)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0125 end');
    });

    /**
     * @tc.name   testRegisterValidate0126
     * @tc.number SUB_ACCT_VALREG_0126
     * @tc.desc   every accepted field together reaches the success branch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0126 begin');
      const U: string = 'a';
      const MAIL: string = 'a@b.co';
      const SIG: string = '';
      const PWD: string = 'pppppp';
      const CONF: string = 'pppppp';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(CHECK).assertEqual(0);
      expect(AccountValidator.isPasswordLongEnough(PWD)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0126 end');
    });

    /**
     * @tc.name   testRegisterValidate0127
     * @tc.number SUB_ACCT_VALREG_0127
     * @tc.desc   every accepted field together reaches the success branch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0127 begin');
      const U: string = 'abcdefghijklmno';
      const MAIL: string = 'user@example.net';
      const SIG: string = 'x';
      const PWD: string = 'qqqqqqqqqqqqqqqqqqqq';
      const CONF: string = 'qqqqqqqqqqqqqqqqqqqq';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(CHECK).assertEqual(0);
      expect(AccountValidator.isPasswordLongEnough(PWD)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0127 end');
    });

    /**
     * @tc.name   testRegisterValidate0128
     * @tc.number SUB_ACCT_VALREG_0128
     * @tc.desc   every accepted field together reaches the success branch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0128 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom.smith@mail.example.com';
      const SIG: string = 'hello world';
      const PWD: string = '中文密码验证';
      const CONF: string = '中文密码验证';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(CHECK).assertEqual(0);
      expect(AccountValidator.isPasswordLongEnough(PWD)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0128 end');
    });

    /**
     * @tc.name   testRegisterValidate0129
     * @tc.number SUB_ACCT_VALREG_0129
     * @tc.desc   every accepted field together reaches the success branch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0129 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@example.com';
      const SIG: string = 'signature with spaces';
      const PWD: string = 'pass word';
      const CONF: string = 'pass word';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(CHECK).assertEqual(0);
      expect(AccountValidator.isPasswordLongEnough(PWD)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0129 end');
    });

    /**
     * @tc.name   testRegisterValidate0130
     * @tc.number SUB_ACCT_VALREG_0130
     * @tc.desc   every accepted field together reaches the success branch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0130 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@example.com';
      const SIG: string = '😀';
      const PWD: string = '😀😀😀';
      const CONF: string = '😀😀😀';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(CHECK).assertEqual(0);
      expect(AccountValidator.isPasswordLongEnough(PWD)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0130 end');
    });

    /**
     * @tc.name   testRegisterValidate0131
     * @tc.number SUB_ACCT_VALREG_0131
     * @tc.desc   every accepted field together reaches the success branch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0131 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@example.com';
      const SIG: string = '';
      const PWD: string = '      ';
      const CONF: string = '      ';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(CHECK).assertEqual(0);
      expect(AccountValidator.isPasswordLongEnough(PWD)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0131 end');
    });

    /**
     * @tc.name   testRegisterValidate0132
     * @tc.number SUB_ACCT_VALREG_0132
     * @tc.desc   every accepted field together reaches the success branch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0132 begin');
      const U: string = 'tom';
      const MAIL: string = '';
      const SIG: string = 'sig';
      const PWD: string = '\t\t\t\t\t\t';
      const CONF: string = '\t\t\t\t\t\t';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(CHECK).assertEqual(0);
      expect(AccountValidator.isPasswordLongEnough(PWD)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0132 end');
    });

    /**
     * @tc.name   testRegisterValidate0133
     * @tc.number SUB_ACCT_VALREG_0133
     * @tc.desc   every accepted field together reaches the success branch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0133 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@example.com';
      const SIG: string = 'sig';
      const PWD: string = 'qqqqqqqqqqqqqqqqqqqq';
      const CONF: string = 'qqqqqqqqqqqqqqqqqqqq';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(CHECK).assertEqual(0);
      expect(AccountValidator.isPasswordLongEnough(PWD)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0133 end');
    });

    /**
     * @tc.name   testRegisterValidate0134
     * @tc.number SUB_ACCT_VALREG_0134
     * @tc.desc   every accepted field together reaches the success branch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0134 begin');
      const U: string = 'tom';
      const MAIL: string = 'x@y.com';
      const SIG: string = '';
      const PWD: string = 'Ab1!xy';
      const CONF: string = 'Ab1!xy';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(CHECK).assertEqual(0);
      expect(AccountValidator.isPasswordLongEnough(PWD)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0134 end');
    });

    /**
     * @tc.name   testRegisterValidate0135
     * @tc.number SUB_ACCT_VALREG_0135
     * @tc.desc   every accepted field together reaches the success branch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0135 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@example.com';
      const SIG: string = 'sig';
      const PWD: string = 'password';
      const CONF: string = 'password';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(CHECK).assertEqual(0);
      expect(AccountValidator.isPasswordLongEnough(PWD)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0135 end');
    });

    /**
     * @tc.name   testRegisterValidate0136
     * @tc.number SUB_ACCT_VALREG_0136
     * @tc.desc   every accepted field together reaches the success branch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0136 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@example.com';
      const SIG: string = 'sig';
      const PWD: string = '12345678901234567890';
      const CONF: string = '12345678901234567890';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(CHECK).assertEqual(0);
      expect(AccountValidator.isPasswordLongEnough(PWD)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0136 end');
    });

    /**
     * @tc.name   testRegisterValidate0137
     * @tc.number SUB_ACCT_VALREG_0137
     * @tc.desc   every accepted field together reaches the success branch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0137 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@example.co';
      const SIG: string = 'sig';
      const PWD: string = 'ffffff';
      const CONF: string = 'ffffff';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(CHECK).assertEqual(0);
      expect(AccountValidator.isPasswordLongEnough(PWD)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0137 end');
    });

    /**
     * @tc.name   testRegisterValidate0138
     * @tc.number SUB_ACCT_VALREG_0138
     * @tc.desc   every accepted field together reaches the success branch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0138 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@a.b.c.de';
      const SIG: string = '';
      const PWD: string = 'gggggg';
      const CONF: string = 'gggggg';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(CHECK).assertEqual(0);
      expect(AccountValidator.isPasswordLongEnough(PWD)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0138 end');
    });

    /**
     * @tc.name   testRegisterValidate0139
     * @tc.number SUB_ACCT_VALREG_0139
     * @tc.desc   every accepted field together reaches the success branch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0139 begin');
      const U: string = 'tom';
      const MAIL: string = '';
      const SIG: string = 'sig';
      const PWD: string = 'hhhhhh';
      const CONF: string = 'hhhhhh';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(CHECK).assertEqual(0);
      expect(AccountValidator.isPasswordLongEnough(PWD)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0139 end');
    });

    /**
     * @tc.name   testRegisterValidate0140
     * @tc.number SUB_ACCT_VALREG_0140
     * @tc.desc   every accepted field together reaches the success branch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0140 begin');
      const U: string = 'user_1';
      const MAIL: string = 'user_1@example.io';
      const SIG: string = 'sig';
      const PWD: string = 'aaaaaa';
      const CONF: string = 'aaaaaa';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(CHECK).assertEqual(0);
      expect(AccountValidator.isPasswordLongEnough(PWD)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0140 end');
    });

    /**
     * @tc.name   testRegisterValidate0141
     * @tc.number SUB_ACCT_VALREG_0141
     * @tc.desc   address check runs before the empty password check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0141 begin');
      const U: string = 'tom';
      const MAIL: string = 'bad-email';
      const SIG: string = 'hello';
      const PWD: string = '';
      const CONF: string = '';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(CHECK).assertEqual(3);
      expect(AccountValidator.isEmailValid(MAIL)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0141 end');
    });

    /**
     * @tc.name   testRegisterValidate0142
     * @tc.number SUB_ACCT_VALREG_0142
     * @tc.desc   empty username outranks the existing account check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0142 begin');
      const U: string = '';
      const MAIL: string = 'bad-email';
      const SIG: string = 'hello';
      const PWD: string = '';
      const CONF: string = 'x';
      const HAS: boolean = true;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.USERNAME_EMPTY');
      expect(CHECK).assertEqual(RegisterResult.USERNAME_EMPTY);
      expect(CHECK).assertEqual(1);
      expect(AccountValidator.isUsernameValid(U)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0142 end');
    });

    /**
     * @tc.name   testRegisterValidate0143
     * @tc.number SUB_ACCT_VALREG_0143
     * @tc.desc   existing account outranks short password and mismatch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0143 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@example.com';
      const SIG: string = 'hello';
      const PWD: string = 'abc';
      const CONF: string = 'abcd';
      const HAS: boolean = true;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.ACCOUNT_EXISTS');
      expect(CHECK).assertEqual(RegisterResult.ACCOUNT_EXISTS);
      expect(CHECK).assertEqual(2);
      expect(AccountValidator.isUsernameValid(U)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0143 end');
    });

    /**
     * @tc.name   testRegisterValidate0144
     * @tc.number SUB_ACCT_VALREG_0144
     * @tc.desc   short password outranks the confirm mismatch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0144 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@example.com';
      const SIG: string = 'hello';
      const PWD: string = 'abc';
      const CONF: string = 'abcd';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.PASSWORD_TOO_SHORT');
      expect(CHECK).assertEqual(RegisterResult.PASSWORD_TOO_SHORT);
      expect(CHECK).assertEqual(5);
      expect(AccountValidator.isPasswordLongEnough(PWD)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0144 end');
    });

    /**
     * @tc.name   testRegisterValidate0145
     * @tc.number SUB_ACCT_VALREG_0145
     * @tc.desc   empty password outranks the confirm mismatch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0145 begin');
      const U: string = 'tom';
      const MAIL: string = '';
      const SIG: string = 'hello';
      const PWD: string = '';
      const CONF: string = 'abc';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.PASSWORD_EMPTY');
      expect(CHECK).assertEqual(RegisterResult.PASSWORD_EMPTY);
      expect(CHECK).assertEqual(4);
      expect(PWD.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0145 end');
    });

    /**
     * @tc.name   testRegisterValidate0146
     * @tc.number SUB_ACCT_VALREG_0146
     * @tc.desc   mismatch is reported when nothing earlier fires
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0146 begin');
      const U: string = 'tom';
      const MAIL: string = 'tom@example.com';
      const SIG: string = 'hello';
      const PWD: string = 'pass123';
      const CONF: string = 'pass999';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.CONFIRM_MISMATCH');
      expect(CHECK).assertEqual(RegisterResult.CONFIRM_MISMATCH);
      expect(CHECK).assertEqual(6);
      expect(PWD === CONF).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0146 end');
    });

    /**
     * @tc.name   testRegisterValidate0147
     * @tc.number SUB_ACCT_VALREG_0147
     * @tc.desc   second account name still hits the existing branch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0147 begin');
      const U: string = 'jerry';
      const MAIL: string = 'jerry@example.com';
      const SIG: string = 'hello';
      const PWD: string = 'pass123';
      const CONF: string = 'pass123';
      const HAS: boolean = true;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.ACCOUNT_EXISTS');
      expect(CHECK).assertEqual(RegisterResult.ACCOUNT_EXISTS);
      expect(CHECK).assertEqual(2);
      expect(AccountValidator.isUsernameValid(U)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0147 end');
    });

    /**
     * @tc.name   testRegisterValidate0148
     * @tc.number SUB_ACCT_VALREG_0148
     * @tc.desc   address check runs before the short password check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterValidate0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0148 begin');
      const U: string = 'tom';
      const MAIL: string = 'bad-email';
      const SIG: string = 'hello';
      const PWD: string = 'abc';
      const CONF: string = 'abcd';
      const HAS: boolean = false;
      const CHECK: RegisterResult = AccountValidator.validateRegister(regInput(U, MAIL, SIG, PWD, CONF), HAS);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(CHECK).assertEqual(3);
      expect(AccountValidator.isEmailValid(MAIL)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterValidate0148 end');
    });

  });
}
