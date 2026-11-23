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

function modInput(email: string, signature: string, password: string, confirmPassword: string): ModifyInput {
  let input: ModifyInput = {
    email: email, signature: signature, password: password, confirmPassword: confirmPassword
  };
  return input;
}

export default function passwordTest02() {
  describe('PasswordTest02', () => {

    /**
     * @tc.name   testPassword0041
     * @tc.number SUB_ACCT_PWD_0041
     * @tc.desc   password of 1 character(s) is measured by its code unit count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPassword0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0041 begin');
      const PWD: string = ' ';
      const result: boolean = AccountValidator.isPasswordLongEnough(PWD);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const REG: RegisterResult = AccountValidator.validateRegister(
        regInput('pwd_user', '', 'sig', PWD, PWD), false);
      logPair(String(REG), 'RegisterResult.PASSWORD_TOO_SHORT');
      expect(REG).assertEqual(RegisterResult.PASSWORD_TOO_SHORT);
      const MOD: ModifyResult = AccountValidator.validateModify(modInput('', 'sig', PWD, PWD), 'stored-pass');
      logPair(String(MOD), 'ModifyResult.PASSWORD_TOO_SHORT');
      expect(MOD).assertEqual(ModifyResult.PASSWORD_TOO_SHORT);
      expect(AccountValidator.isPasswordLongEnough(PWD + 'x')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0041 end');
    });

    /**
     * @tc.name   testPassword0042
     * @tc.number SUB_ACCT_PWD_0042
     * @tc.desc   password of 9 character(s) is measured by its code unit count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPassword0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0042 begin');
      const PWD: string = 'pass word';
      const result: boolean = AccountValidator.isPasswordLongEnough(PWD);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const REG: RegisterResult = AccountValidator.validateRegister(
        regInput('pwd_user', '', 'sig', PWD, PWD), false);
      logPair(String(REG), 'RegisterResult.OK');
      expect(REG).assertEqual(RegisterResult.OK);
      const MOD: ModifyResult = AccountValidator.validateModify(modInput('', 'sig', PWD, PWD), 'stored-pass');
      logPair(String(MOD), 'ModifyResult.OK_WITH_PASSWORD');
      expect(MOD).assertEqual(ModifyResult.OK_WITH_PASSWORD);
      expect(AccountValidator.isPasswordLongEnough(PWD + 'x')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0042 end');
    });

    /**
     * @tc.name   testPassword0043
     * @tc.number SUB_ACCT_PWD_0043
     * @tc.desc   password of 6 character(s) is measured by its code unit count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPassword0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0043 begin');
      const PWD: string = 'Pass@1';
      const result: boolean = AccountValidator.isPasswordLongEnough(PWD);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const REG: RegisterResult = AccountValidator.validateRegister(
        regInput('pwd_user', '', 'sig', PWD, PWD), false);
      logPair(String(REG), 'RegisterResult.OK');
      expect(REG).assertEqual(RegisterResult.OK);
      const MOD: ModifyResult = AccountValidator.validateModify(modInput('', 'sig', PWD, PWD), 'stored-pass');
      logPair(String(MOD), 'ModifyResult.OK_WITH_PASSWORD');
      expect(MOD).assertEqual(ModifyResult.OK_WITH_PASSWORD);
      expect(AccountValidator.isPasswordLongEnough(PWD + 'x')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0043 end');
    });

    /**
     * @tc.name   testPassword0044
     * @tc.number SUB_ACCT_PWD_0044
     * @tc.desc   password of 6 character(s) is measured by its code unit count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPassword0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0044 begin');
      const PWD: string = 'aB3$xY';
      const result: boolean = AccountValidator.isPasswordLongEnough(PWD);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const REG: RegisterResult = AccountValidator.validateRegister(
        regInput('pwd_user', '', 'sig', PWD, PWD), false);
      logPair(String(REG), 'RegisterResult.OK');
      expect(REG).assertEqual(RegisterResult.OK);
      const MOD: ModifyResult = AccountValidator.validateModify(modInput('', 'sig', PWD, PWD), 'stored-pass');
      logPair(String(MOD), 'ModifyResult.OK_WITH_PASSWORD');
      expect(MOD).assertEqual(ModifyResult.OK_WITH_PASSWORD);
      expect(AccountValidator.isPasswordLongEnough(PWD + 'x')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0044 end');
    });

    /**
     * @tc.name   testPassword0045
     * @tc.number SUB_ACCT_PWD_0045
     * @tc.desc   password of 6 character(s) is measured by its code unit count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPassword0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0045 begin');
      const PWD: string = 'aaaaaa';
      const result: boolean = AccountValidator.isPasswordLongEnough(PWD);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const REG: RegisterResult = AccountValidator.validateRegister(
        regInput('pwd_user', '', 'sig', PWD, PWD), false);
      logPair(String(REG), 'RegisterResult.OK');
      expect(REG).assertEqual(RegisterResult.OK);
      const MOD: ModifyResult = AccountValidator.validateModify(modInput('', 'sig', PWD, PWD), 'stored-pass');
      logPair(String(MOD), 'ModifyResult.OK_WITH_PASSWORD');
      expect(MOD).assertEqual(ModifyResult.OK_WITH_PASSWORD);
      expect(AccountValidator.isPasswordLongEnough(PWD + 'x')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0045 end');
    });

    /**
     * @tc.name   testPassword0046
     * @tc.number SUB_ACCT_PWD_0046
     * @tc.desc   password of 6 character(s) is measured by its code unit count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPassword0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0046 begin');
      const PWD: string = 'AAAAAA';
      const result: boolean = AccountValidator.isPasswordLongEnough(PWD);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const REG: RegisterResult = AccountValidator.validateRegister(
        regInput('pwd_user', '', 'sig', PWD, PWD), false);
      logPair(String(REG), 'RegisterResult.OK');
      expect(REG).assertEqual(RegisterResult.OK);
      const MOD: ModifyResult = AccountValidator.validateModify(modInput('', 'sig', PWD, PWD), 'stored-pass');
      logPair(String(MOD), 'ModifyResult.OK_WITH_PASSWORD');
      expect(MOD).assertEqual(ModifyResult.OK_WITH_PASSWORD);
      expect(AccountValidator.isPasswordLongEnough(PWD + 'x')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0046 end');
    });

    /**
     * @tc.name   testPassword0047
     * @tc.number SUB_ACCT_PWD_0047
     * @tc.desc   password of 7 character(s) is measured by its code unit count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPassword0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0047 begin');
      const PWD: string = 'abcdefg';
      const result: boolean = AccountValidator.isPasswordLongEnough(PWD);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const REG: RegisterResult = AccountValidator.validateRegister(
        regInput('pwd_user', '', 'sig', PWD, PWD), false);
      logPair(String(REG), 'RegisterResult.OK');
      expect(REG).assertEqual(RegisterResult.OK);
      const MOD: ModifyResult = AccountValidator.validateModify(modInput('', 'sig', PWD, PWD), 'stored-pass');
      logPair(String(MOD), 'ModifyResult.OK_WITH_PASSWORD');
      expect(MOD).assertEqual(ModifyResult.OK_WITH_PASSWORD);
      expect(AccountValidator.isPasswordLongEnough(PWD + 'x')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0047 end');
    });

    /**
     * @tc.name   testPassword0048
     * @tc.number SUB_ACCT_PWD_0048
     * @tc.desc   password of 5 character(s) is measured by its code unit count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPassword0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0048 begin');
      const PWD: string = '12345';
      const result: boolean = AccountValidator.isPasswordLongEnough(PWD);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const REG: RegisterResult = AccountValidator.validateRegister(
        regInput('pwd_user', '', 'sig', PWD, PWD), false);
      logPair(String(REG), 'RegisterResult.PASSWORD_TOO_SHORT');
      expect(REG).assertEqual(RegisterResult.PASSWORD_TOO_SHORT);
      const MOD: ModifyResult = AccountValidator.validateModify(modInput('', 'sig', PWD, PWD), 'stored-pass');
      logPair(String(MOD), 'ModifyResult.PASSWORD_TOO_SHORT');
      expect(MOD).assertEqual(ModifyResult.PASSWORD_TOO_SHORT);
      expect(AccountValidator.isPasswordLongEnough(PWD + 'x')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0048 end');
    });

    /**
     * @tc.name   testPassword0049
     * @tc.number SUB_ACCT_PWD_0049
     * @tc.desc   password of 4 character(s) is measured by its code unit count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPassword0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0049 begin');
      const PWD: string = '1234';
      const result: boolean = AccountValidator.isPasswordLongEnough(PWD);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const REG: RegisterResult = AccountValidator.validateRegister(
        regInput('pwd_user', '', 'sig', PWD, PWD), false);
      logPair(String(REG), 'RegisterResult.PASSWORD_TOO_SHORT');
      expect(REG).assertEqual(RegisterResult.PASSWORD_TOO_SHORT);
      const MOD: ModifyResult = AccountValidator.validateModify(modInput('', 'sig', PWD, PWD), 'stored-pass');
      logPair(String(MOD), 'ModifyResult.PASSWORD_TOO_SHORT');
      expect(MOD).assertEqual(ModifyResult.PASSWORD_TOO_SHORT);
      expect(AccountValidator.isPasswordLongEnough(PWD + 'x')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0049 end');
    });

    /**
     * @tc.name   testPassword0050
     * @tc.number SUB_ACCT_PWD_0050
     * @tc.desc   password of 9 character(s) is measured by its code unit count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPassword0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0050 begin');
      const PWD: string = 'password1';
      const result: boolean = AccountValidator.isPasswordLongEnough(PWD);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const REG: RegisterResult = AccountValidator.validateRegister(
        regInput('pwd_user', '', 'sig', PWD, PWD), false);
      logPair(String(REG), 'RegisterResult.OK');
      expect(REG).assertEqual(RegisterResult.OK);
      const MOD: ModifyResult = AccountValidator.validateModify(modInput('', 'sig', PWD, PWD), 'stored-pass');
      logPair(String(MOD), 'ModifyResult.OK_WITH_PASSWORD');
      expect(MOD).assertEqual(ModifyResult.OK_WITH_PASSWORD);
      expect(AccountValidator.isPasswordLongEnough(PWD + 'x')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0050 end');
    });

    /**
     * @tc.name   testPassword0051
     * @tc.number SUB_ACCT_PWD_0051
     * @tc.desc   password of 10 character(s) is measured by its code unit count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPassword0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0051 begin');
      const PWD: string = 'Password1!';
      const result: boolean = AccountValidator.isPasswordLongEnough(PWD);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const REG: RegisterResult = AccountValidator.validateRegister(
        regInput('pwd_user', '', 'sig', PWD, PWD), false);
      logPair(String(REG), 'RegisterResult.OK');
      expect(REG).assertEqual(RegisterResult.OK);
      const MOD: ModifyResult = AccountValidator.validateModify(modInput('', 'sig', PWD, PWD), 'stored-pass');
      logPair(String(MOD), 'ModifyResult.OK_WITH_PASSWORD');
      expect(MOD).assertEqual(ModifyResult.OK_WITH_PASSWORD);
      expect(AccountValidator.isPasswordLongEnough(PWD + 'x')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0051 end');
    });

    /**
     * @tc.name   testPassword0052
     * @tc.number SUB_ACCT_PWD_0052
     * @tc.desc   password of 7 character(s) is measured by its code unit count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPassword0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0052 begin');
      const PWD: string = '  abc  ';
      const result: boolean = AccountValidator.isPasswordLongEnough(PWD);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const REG: RegisterResult = AccountValidator.validateRegister(
        regInput('pwd_user', '', 'sig', PWD, PWD), false);
      logPair(String(REG), 'RegisterResult.OK');
      expect(REG).assertEqual(RegisterResult.OK);
      const MOD: ModifyResult = AccountValidator.validateModify(modInput('', 'sig', PWD, PWD), 'stored-pass');
      logPair(String(MOD), 'ModifyResult.OK_WITH_PASSWORD');
      expect(MOD).assertEqual(ModifyResult.OK_WITH_PASSWORD);
      expect(AccountValidator.isPasswordLongEnough(PWD + 'x')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0052 end');
    });

    /**
     * @tc.name   testPassword0053
     * @tc.number SUB_ACCT_PWD_0053
     * @tc.desc   password of 5 character(s) is measured by its code unit count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPassword0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0053 begin');
      const PWD: string = 'ab cd';
      const result: boolean = AccountValidator.isPasswordLongEnough(PWD);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const REG: RegisterResult = AccountValidator.validateRegister(
        regInput('pwd_user', '', 'sig', PWD, PWD), false);
      logPair(String(REG), 'RegisterResult.PASSWORD_TOO_SHORT');
      expect(REG).assertEqual(RegisterResult.PASSWORD_TOO_SHORT);
      const MOD: ModifyResult = AccountValidator.validateModify(modInput('', 'sig', PWD, PWD), 'stored-pass');
      logPair(String(MOD), 'ModifyResult.PASSWORD_TOO_SHORT');
      expect(MOD).assertEqual(ModifyResult.PASSWORD_TOO_SHORT);
      expect(AccountValidator.isPasswordLongEnough(PWD + 'x')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0053 end');
    });

    /**
     * @tc.name   testPassword0054
     * @tc.number SUB_ACCT_PWD_0054
     * @tc.desc   password of 6 character(s) is measured by its code unit count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPassword0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0054 begin');
      const PWD: string = '  1234';
      const result: boolean = AccountValidator.isPasswordLongEnough(PWD);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const REG: RegisterResult = AccountValidator.validateRegister(
        regInput('pwd_user', '', 'sig', PWD, PWD), false);
      logPair(String(REG), 'RegisterResult.OK');
      expect(REG).assertEqual(RegisterResult.OK);
      const MOD: ModifyResult = AccountValidator.validateModify(modInput('', 'sig', PWD, PWD), 'stored-pass');
      logPair(String(MOD), 'ModifyResult.OK_WITH_PASSWORD');
      expect(MOD).assertEqual(ModifyResult.OK_WITH_PASSWORD);
      expect(AccountValidator.isPasswordLongEnough(PWD + 'x')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0054 end');
    });

    /**
     * @tc.name   testPassword0055
     * @tc.number SUB_ACCT_PWD_0055
     * @tc.desc   password of 6 character(s) is measured by its code unit count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPassword0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0055 begin');
      const PWD: string = '\t\t\t\t\t\t';
      const result: boolean = AccountValidator.isPasswordLongEnough(PWD);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const REG: RegisterResult = AccountValidator.validateRegister(
        regInput('pwd_user', '', 'sig', PWD, PWD), false);
      logPair(String(REG), 'RegisterResult.OK');
      expect(REG).assertEqual(RegisterResult.OK);
      const MOD: ModifyResult = AccountValidator.validateModify(modInput('', 'sig', PWD, PWD), 'stored-pass');
      logPair(String(MOD), 'ModifyResult.OK_WITH_PASSWORD');
      expect(MOD).assertEqual(ModifyResult.OK_WITH_PASSWORD);
      expect(AccountValidator.isPasswordLongEnough(PWD + 'x')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0055 end');
    });

    /**
     * @tc.name   testPassword0056
     * @tc.number SUB_ACCT_PWD_0056
     * @tc.desc   password of 6 character(s) is measured by its code unit count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPassword0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0056 begin');
      const PWD: string = '\n\n\n\n\n\n';
      const result: boolean = AccountValidator.isPasswordLongEnough(PWD);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const REG: RegisterResult = AccountValidator.validateRegister(
        regInput('pwd_user', '', 'sig', PWD, PWD), false);
      logPair(String(REG), 'RegisterResult.OK');
      expect(REG).assertEqual(RegisterResult.OK);
      const MOD: ModifyResult = AccountValidator.validateModify(modInput('', 'sig', PWD, PWD), 'stored-pass');
      logPair(String(MOD), 'ModifyResult.OK_WITH_PASSWORD');
      expect(MOD).assertEqual(ModifyResult.OK_WITH_PASSWORD);
      expect(AccountValidator.isPasswordLongEnough(PWD + 'x')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0056 end');
    });

    /**
     * @tc.name   testPassword0057
     * @tc.number SUB_ACCT_PWD_0057
     * @tc.desc   password of 5 character(s) is measured by its code unit count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPassword0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0057 begin');
      const PWD: string = '\t\t\t\t\t';
      const result: boolean = AccountValidator.isPasswordLongEnough(PWD);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const REG: RegisterResult = AccountValidator.validateRegister(
        regInput('pwd_user', '', 'sig', PWD, PWD), false);
      logPair(String(REG), 'RegisterResult.PASSWORD_TOO_SHORT');
      expect(REG).assertEqual(RegisterResult.PASSWORD_TOO_SHORT);
      const MOD: ModifyResult = AccountValidator.validateModify(modInput('', 'sig', PWD, PWD), 'stored-pass');
      logPair(String(MOD), 'ModifyResult.PASSWORD_TOO_SHORT');
      expect(MOD).assertEqual(ModifyResult.PASSWORD_TOO_SHORT);
      expect(AccountValidator.isPasswordLongEnough(PWD + 'x')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0057 end');
    });

    /**
     * @tc.name   testPassword0058
     * @tc.number SUB_ACCT_PWD_0058
     * @tc.desc   password of 4 character(s) is measured by its code unit count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPassword0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0058 begin');
      const PWD: string = '晴天晴天';
      const result: boolean = AccountValidator.isPasswordLongEnough(PWD);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const REG: RegisterResult = AccountValidator.validateRegister(
        regInput('pwd_user', '', 'sig', PWD, PWD), false);
      logPair(String(REG), 'RegisterResult.PASSWORD_TOO_SHORT');
      expect(REG).assertEqual(RegisterResult.PASSWORD_TOO_SHORT);
      const MOD: ModifyResult = AccountValidator.validateModify(modInput('', 'sig', PWD, PWD), 'stored-pass');
      logPair(String(MOD), 'ModifyResult.PASSWORD_TOO_SHORT');
      expect(MOD).assertEqual(ModifyResult.PASSWORD_TOO_SHORT);
      expect(AccountValidator.isPasswordLongEnough(PWD + 'x')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0058 end');
    });

    /**
     * @tc.name   testPassword0059
     * @tc.number SUB_ACCT_PWD_0059
     * @tc.desc   password of 5 character(s) is measured by its code unit count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPassword0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0059 begin');
      const PWD: string = '晴天晴天晴';
      const result: boolean = AccountValidator.isPasswordLongEnough(PWD);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const REG: RegisterResult = AccountValidator.validateRegister(
        regInput('pwd_user', '', 'sig', PWD, PWD), false);
      logPair(String(REG), 'RegisterResult.PASSWORD_TOO_SHORT');
      expect(REG).assertEqual(RegisterResult.PASSWORD_TOO_SHORT);
      const MOD: ModifyResult = AccountValidator.validateModify(modInput('', 'sig', PWD, PWD), 'stored-pass');
      logPair(String(MOD), 'ModifyResult.PASSWORD_TOO_SHORT');
      expect(MOD).assertEqual(ModifyResult.PASSWORD_TOO_SHORT);
      expect(AccountValidator.isPasswordLongEnough(PWD + 'x')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0059 end');
    });

    /**
     * @tc.name   testPassword0060
     * @tc.number SUB_ACCT_PWD_0060
     * @tc.desc   password of 6 character(s) is measured by its code unit count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPassword0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0060 begin');
      const PWD: string = '晴天晴天晴天';
      const result: boolean = AccountValidator.isPasswordLongEnough(PWD);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const REG: RegisterResult = AccountValidator.validateRegister(
        regInput('pwd_user', '', 'sig', PWD, PWD), false);
      logPair(String(REG), 'RegisterResult.OK');
      expect(REG).assertEqual(RegisterResult.OK);
      const MOD: ModifyResult = AccountValidator.validateModify(modInput('', 'sig', PWD, PWD), 'stored-pass');
      logPair(String(MOD), 'ModifyResult.OK_WITH_PASSWORD');
      expect(MOD).assertEqual(ModifyResult.OK_WITH_PASSWORD);
      expect(AccountValidator.isPasswordLongEnough(PWD + 'x')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0060 end');
    });

    /**
     * @tc.name   testPassword0061
     * @tc.number SUB_ACCT_PWD_0061
     * @tc.desc   password of 6 character(s) is measured by its code unit count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPassword0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0061 begin');
      const PWD: string = '中文密码验证';
      const result: boolean = AccountValidator.isPasswordLongEnough(PWD);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const REG: RegisterResult = AccountValidator.validateRegister(
        regInput('pwd_user', '', 'sig', PWD, PWD), false);
      logPair(String(REG), 'RegisterResult.OK');
      expect(REG).assertEqual(RegisterResult.OK);
      const MOD: ModifyResult = AccountValidator.validateModify(modInput('', 'sig', PWD, PWD), 'stored-pass');
      logPair(String(MOD), 'ModifyResult.OK_WITH_PASSWORD');
      expect(MOD).assertEqual(ModifyResult.OK_WITH_PASSWORD);
      expect(AccountValidator.isPasswordLongEnough(PWD + 'x')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0061 end');
    });

    /**
     * @tc.name   testPassword0062
     * @tc.number SUB_ACCT_PWD_0062
     * @tc.desc   password of 4 character(s) is measured by its code unit count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPassword0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0062 begin');
      const PWD: string = '😀😀';
      const result: boolean = AccountValidator.isPasswordLongEnough(PWD);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const REG: RegisterResult = AccountValidator.validateRegister(
        regInput('pwd_user', '', 'sig', PWD, PWD), false);
      logPair(String(REG), 'RegisterResult.PASSWORD_TOO_SHORT');
      expect(REG).assertEqual(RegisterResult.PASSWORD_TOO_SHORT);
      const MOD: ModifyResult = AccountValidator.validateModify(modInput('', 'sig', PWD, PWD), 'stored-pass');
      logPair(String(MOD), 'ModifyResult.PASSWORD_TOO_SHORT');
      expect(MOD).assertEqual(ModifyResult.PASSWORD_TOO_SHORT);
      expect(AccountValidator.isPasswordLongEnough(PWD + 'x')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0062 end');
    });

    /**
     * @tc.name   testPassword0063
     * @tc.number SUB_ACCT_PWD_0063
     * @tc.desc   password of 6 character(s) is measured by its code unit count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPassword0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0063 begin');
      const PWD: string = '😀😀😀';
      const result: boolean = AccountValidator.isPasswordLongEnough(PWD);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const REG: RegisterResult = AccountValidator.validateRegister(
        regInput('pwd_user', '', 'sig', PWD, PWD), false);
      logPair(String(REG), 'RegisterResult.OK');
      expect(REG).assertEqual(RegisterResult.OK);
      const MOD: ModifyResult = AccountValidator.validateModify(modInput('', 'sig', PWD, PWD), 'stored-pass');
      logPair(String(MOD), 'ModifyResult.OK_WITH_PASSWORD');
      expect(MOD).assertEqual(ModifyResult.OK_WITH_PASSWORD);
      expect(AccountValidator.isPasswordLongEnough(PWD + 'x')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0063 end');
    });

    /**
     * @tc.name   testPassword0064
     * @tc.number SUB_ACCT_PWD_0064
     * @tc.desc   password of 8 character(s) is measured by its code unit count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPassword0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0064 begin');
      const PWD: string = '😀😀😀😀';
      const result: boolean = AccountValidator.isPasswordLongEnough(PWD);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const REG: RegisterResult = AccountValidator.validateRegister(
        regInput('pwd_user', '', 'sig', PWD, PWD), false);
      logPair(String(REG), 'RegisterResult.OK');
      expect(REG).assertEqual(RegisterResult.OK);
      const MOD: ModifyResult = AccountValidator.validateModify(modInput('', 'sig', PWD, PWD), 'stored-pass');
      logPair(String(MOD), 'ModifyResult.OK_WITH_PASSWORD');
      expect(MOD).assertEqual(ModifyResult.OK_WITH_PASSWORD);
      expect(AccountValidator.isPasswordLongEnough(PWD + 'x')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0064 end');
    });

    /**
     * @tc.name   testPassword0065
     * @tc.number SUB_ACCT_PWD_0065
     * @tc.desc   password of 7 character(s) is measured by its code unit count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPassword0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0065 begin');
      const PWD: string = '😀😀😀a';
      const result: boolean = AccountValidator.isPasswordLongEnough(PWD);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const REG: RegisterResult = AccountValidator.validateRegister(
        regInput('pwd_user', '', 'sig', PWD, PWD), false);
      logPair(String(REG), 'RegisterResult.OK');
      expect(REG).assertEqual(RegisterResult.OK);
      const MOD: ModifyResult = AccountValidator.validateModify(modInput('', 'sig', PWD, PWD), 'stored-pass');
      logPair(String(MOD), 'ModifyResult.OK_WITH_PASSWORD');
      expect(MOD).assertEqual(ModifyResult.OK_WITH_PASSWORD);
      expect(AccountValidator.isPasswordLongEnough(PWD + 'x')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0065 end');
    });

    /**
     * @tc.name   testPassword0066
     * @tc.number SUB_ACCT_PWD_0066
     * @tc.desc   password of 7 character(s) is measured by its code unit count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPassword0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0066 begin');
      const PWD: string = 'a😀😀😀';
      const result: boolean = AccountValidator.isPasswordLongEnough(PWD);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const REG: RegisterResult = AccountValidator.validateRegister(
        regInput('pwd_user', '', 'sig', PWD, PWD), false);
      logPair(String(REG), 'RegisterResult.OK');
      expect(REG).assertEqual(RegisterResult.OK);
      const MOD: ModifyResult = AccountValidator.validateModify(modInput('', 'sig', PWD, PWD), 'stored-pass');
      logPair(String(MOD), 'ModifyResult.OK_WITH_PASSWORD');
      expect(MOD).assertEqual(ModifyResult.OK_WITH_PASSWORD);
      expect(AccountValidator.isPasswordLongEnough(PWD + 'x')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0066 end');
    });

    /**
     * @tc.name   testPassword0067
     * @tc.number SUB_ACCT_PWD_0067
     * @tc.desc   password of 4 character(s) is measured by its code unit count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPassword0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0067 begin');
      const PWD: string = 'päss';
      const result: boolean = AccountValidator.isPasswordLongEnough(PWD);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const REG: RegisterResult = AccountValidator.validateRegister(
        regInput('pwd_user', '', 'sig', PWD, PWD), false);
      logPair(String(REG), 'RegisterResult.PASSWORD_TOO_SHORT');
      expect(REG).assertEqual(RegisterResult.PASSWORD_TOO_SHORT);
      const MOD: ModifyResult = AccountValidator.validateModify(modInput('', 'sig', PWD, PWD), 'stored-pass');
      logPair(String(MOD), 'ModifyResult.PASSWORD_TOO_SHORT');
      expect(MOD).assertEqual(ModifyResult.PASSWORD_TOO_SHORT);
      expect(AccountValidator.isPasswordLongEnough(PWD + 'x')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0067 end');
    });

    /**
     * @tc.name   testPassword0068
     * @tc.number SUB_ACCT_PWD_0068
     * @tc.desc   password of 6 character(s) is measured by its code unit count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPassword0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0068 begin');
      const PWD: string = 'pässwö';
      const result: boolean = AccountValidator.isPasswordLongEnough(PWD);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const REG: RegisterResult = AccountValidator.validateRegister(
        regInput('pwd_user', '', 'sig', PWD, PWD), false);
      logPair(String(REG), 'RegisterResult.OK');
      expect(REG).assertEqual(RegisterResult.OK);
      const MOD: ModifyResult = AccountValidator.validateModify(modInput('', 'sig', PWD, PWD), 'stored-pass');
      logPair(String(MOD), 'ModifyResult.OK_WITH_PASSWORD');
      expect(MOD).assertEqual(ModifyResult.OK_WITH_PASSWORD);
      expect(AccountValidator.isPasswordLongEnough(PWD + 'x')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0068 end');
    });

    /**
     * @tc.name   testPassword0069
     * @tc.number SUB_ACCT_PWD_0069
     * @tc.desc   password of 8 character(s) is measured by its code unit count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPassword0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0069 begin');
      const PWD: string = 'pässwörd';
      const result: boolean = AccountValidator.isPasswordLongEnough(PWD);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const REG: RegisterResult = AccountValidator.validateRegister(
        regInput('pwd_user', '', 'sig', PWD, PWD), false);
      logPair(String(REG), 'RegisterResult.OK');
      expect(REG).assertEqual(RegisterResult.OK);
      const MOD: ModifyResult = AccountValidator.validateModify(modInput('', 'sig', PWD, PWD), 'stored-pass');
      logPair(String(MOD), 'ModifyResult.OK_WITH_PASSWORD');
      expect(MOD).assertEqual(ModifyResult.OK_WITH_PASSWORD);
      expect(AccountValidator.isPasswordLongEnough(PWD + 'x')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0069 end');
    });

    /**
     * @tc.name   testPassword0070
     * @tc.number SUB_ACCT_PWD_0070
     * @tc.desc   password of 5 character(s) is measured by its code unit count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPassword0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0070 begin');
      const PWD: string = 'àéîõü';
      const result: boolean = AccountValidator.isPasswordLongEnough(PWD);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const REG: RegisterResult = AccountValidator.validateRegister(
        regInput('pwd_user', '', 'sig', PWD, PWD), false);
      logPair(String(REG), 'RegisterResult.PASSWORD_TOO_SHORT');
      expect(REG).assertEqual(RegisterResult.PASSWORD_TOO_SHORT);
      const MOD: ModifyResult = AccountValidator.validateModify(modInput('', 'sig', PWD, PWD), 'stored-pass');
      logPair(String(MOD), 'ModifyResult.PASSWORD_TOO_SHORT');
      expect(MOD).assertEqual(ModifyResult.PASSWORD_TOO_SHORT);
      expect(AccountValidator.isPasswordLongEnough(PWD + 'x')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0070 end');
    });

    /**
     * @tc.name   testPassword0071
     * @tc.number SUB_ACCT_PWD_0071
     * @tc.desc   password of 6 character(s) is measured by its code unit count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPassword0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0071 begin');
      const PWD: string = 'àéîõüÀ';
      const result: boolean = AccountValidator.isPasswordLongEnough(PWD);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const REG: RegisterResult = AccountValidator.validateRegister(
        regInput('pwd_user', '', 'sig', PWD, PWD), false);
      logPair(String(REG), 'RegisterResult.OK');
      expect(REG).assertEqual(RegisterResult.OK);
      const MOD: ModifyResult = AccountValidator.validateModify(modInput('', 'sig', PWD, PWD), 'stored-pass');
      logPair(String(MOD), 'ModifyResult.OK_WITH_PASSWORD');
      expect(MOD).assertEqual(ModifyResult.OK_WITH_PASSWORD);
      expect(AccountValidator.isPasswordLongEnough(PWD + 'x')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0071 end');
    });

    /**
     * @tc.name   testPassword0072
     * @tc.number SUB_ACCT_PWD_0072
     * @tc.desc   password of 5 character(s) is measured by its code unit count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPassword0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0072 begin');
      const PWD: string = 'ßßßßß';
      const result: boolean = AccountValidator.isPasswordLongEnough(PWD);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const REG: RegisterResult = AccountValidator.validateRegister(
        regInput('pwd_user', '', 'sig', PWD, PWD), false);
      logPair(String(REG), 'RegisterResult.PASSWORD_TOO_SHORT');
      expect(REG).assertEqual(RegisterResult.PASSWORD_TOO_SHORT);
      const MOD: ModifyResult = AccountValidator.validateModify(modInput('', 'sig', PWD, PWD), 'stored-pass');
      logPair(String(MOD), 'ModifyResult.PASSWORD_TOO_SHORT');
      expect(MOD).assertEqual(ModifyResult.PASSWORD_TOO_SHORT);
      expect(AccountValidator.isPasswordLongEnough(PWD + 'x')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0072 end');
    });

    /**
     * @tc.name   testPassword0073
     * @tc.number SUB_ACCT_PWD_0073
     * @tc.desc   password of 6 character(s) is measured by its code unit count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPassword0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0073 begin');
      const PWD: string = 'ΩΩΩΩΩΩ';
      const result: boolean = AccountValidator.isPasswordLongEnough(PWD);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const REG: RegisterResult = AccountValidator.validateRegister(
        regInput('pwd_user', '', 'sig', PWD, PWD), false);
      logPair(String(REG), 'RegisterResult.OK');
      expect(REG).assertEqual(RegisterResult.OK);
      const MOD: ModifyResult = AccountValidator.validateModify(modInput('', 'sig', PWD, PWD), 'stored-pass');
      logPair(String(MOD), 'ModifyResult.OK_WITH_PASSWORD');
      expect(MOD).assertEqual(ModifyResult.OK_WITH_PASSWORD);
      expect(AccountValidator.isPasswordLongEnough(PWD + 'x')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0073 end');
    });

    /**
     * @tc.name   testPassword0074
     * @tc.number SUB_ACCT_PWD_0074
     * @tc.desc   password of 6 character(s) is measured by its code unit count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPassword0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0074 begin');
      const PWD: string = 'абвгде';
      const result: boolean = AccountValidator.isPasswordLongEnough(PWD);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const REG: RegisterResult = AccountValidator.validateRegister(
        regInput('pwd_user', '', 'sig', PWD, PWD), false);
      logPair(String(REG), 'RegisterResult.OK');
      expect(REG).assertEqual(RegisterResult.OK);
      const MOD: ModifyResult = AccountValidator.validateModify(modInput('', 'sig', PWD, PWD), 'stored-pass');
      logPair(String(MOD), 'ModifyResult.OK_WITH_PASSWORD');
      expect(MOD).assertEqual(ModifyResult.OK_WITH_PASSWORD);
      expect(AccountValidator.isPasswordLongEnough(PWD + 'x')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0074 end');
    });

    /**
     * @tc.name   testPassword0075
     * @tc.number SUB_ACCT_PWD_0075
     * @tc.desc   password of 5 character(s) is measured by its code unit count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPassword0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0075 begin');
      const PWD: string = 'абвгд';
      const result: boolean = AccountValidator.isPasswordLongEnough(PWD);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const REG: RegisterResult = AccountValidator.validateRegister(
        regInput('pwd_user', '', 'sig', PWD, PWD), false);
      logPair(String(REG), 'RegisterResult.PASSWORD_TOO_SHORT');
      expect(REG).assertEqual(RegisterResult.PASSWORD_TOO_SHORT);
      const MOD: ModifyResult = AccountValidator.validateModify(modInput('', 'sig', PWD, PWD), 'stored-pass');
      logPair(String(MOD), 'ModifyResult.PASSWORD_TOO_SHORT');
      expect(MOD).assertEqual(ModifyResult.PASSWORD_TOO_SHORT);
      expect(AccountValidator.isPasswordLongEnough(PWD + 'x')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0075 end');
    });

    /**
     * @tc.name   testPassword0076
     * @tc.number SUB_ACCT_PWD_0076
     * @tc.desc   password of 7 character(s) is measured by its code unit count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPassword0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0076 begin');
      const PWD: string = '한국어비밀번호';
      const result: boolean = AccountValidator.isPasswordLongEnough(PWD);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const REG: RegisterResult = AccountValidator.validateRegister(
        regInput('pwd_user', '', 'sig', PWD, PWD), false);
      logPair(String(REG), 'RegisterResult.OK');
      expect(REG).assertEqual(RegisterResult.OK);
      const MOD: ModifyResult = AccountValidator.validateModify(modInput('', 'sig', PWD, PWD), 'stored-pass');
      logPair(String(MOD), 'ModifyResult.OK_WITH_PASSWORD');
      expect(MOD).assertEqual(ModifyResult.OK_WITH_PASSWORD);
      expect(AccountValidator.isPasswordLongEnough(PWD + 'x')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0076 end');
    });

  });
}
