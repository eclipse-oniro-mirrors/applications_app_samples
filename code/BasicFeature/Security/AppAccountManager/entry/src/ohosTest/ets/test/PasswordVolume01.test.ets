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

export default function passwordTest01() {
  describe('PasswordTest01', () => {

    /**
     * @tc.name   testPassword0001
     * @tc.number SUB_ACCT_PWD_0001
     * @tc.desc   password of 0 character(s) is compared with the 6 character floor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPassword0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0001 begin');
      const PWD: string = 'p'.repeat(0);
      const result: boolean = AccountValidator.isPasswordLongEnough(PWD);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const REG: RegisterResult = AccountValidator.validateRegister(
        regInput('pwd_user', '', 'sig', PWD, PWD), false);
      logPair(String(REG), 'RegisterResult.PASSWORD_EMPTY');
      expect(REG).assertEqual(RegisterResult.PASSWORD_EMPTY);
      const MOD: ModifyResult = AccountValidator.validateModify(modInput('', 'sig', PWD, PWD), 'stored-pass');
      logPair(String(MOD), 'ModifyResult.OK_WITHOUT_PASSWORD');
      expect(MOD).assertEqual(ModifyResult.OK_WITHOUT_PASSWORD);
      expect(AccountValidator.isPasswordLongEnough(PWD + 'x')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0001 end');
    });

    /**
     * @tc.name   testPassword0002
     * @tc.number SUB_ACCT_PWD_0002
     * @tc.desc   password of 1 character(s) is compared with the 6 character floor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPassword0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0002 begin');
      const PWD: string = 'p'.repeat(1);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0002 end');
    });

    /**
     * @tc.name   testPassword0003
     * @tc.number SUB_ACCT_PWD_0003
     * @tc.desc   password of 2 character(s) is compared with the 6 character floor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPassword0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0003 begin');
      const PWD: string = 'p'.repeat(2);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0003 end');
    });

    /**
     * @tc.name   testPassword0004
     * @tc.number SUB_ACCT_PWD_0004
     * @tc.desc   password of 3 character(s) is compared with the 6 character floor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPassword0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0004 begin');
      const PWD: string = 'p'.repeat(3);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0004 end');
    });

    /**
     * @tc.name   testPassword0005
     * @tc.number SUB_ACCT_PWD_0005
     * @tc.desc   password of 4 character(s) is compared with the 6 character floor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPassword0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0005 begin');
      const PWD: string = 'p'.repeat(4);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0005 end');
    });

    /**
     * @tc.name   testPassword0006
     * @tc.number SUB_ACCT_PWD_0006
     * @tc.desc   password of 5 character(s) is compared with the 6 character floor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPassword0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0006 begin');
      const PWD: string = 'p'.repeat(5);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0006 end');
    });

    /**
     * @tc.name   testPassword0007
     * @tc.number SUB_ACCT_PWD_0007
     * @tc.desc   password of 6 character(s) is compared with the 6 character floor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPassword0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0007 begin');
      const PWD: string = 'p'.repeat(6);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0007 end');
    });

    /**
     * @tc.name   testPassword0008
     * @tc.number SUB_ACCT_PWD_0008
     * @tc.desc   password of 7 character(s) is compared with the 6 character floor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPassword0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0008 begin');
      const PWD: string = 'p'.repeat(7);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0008 end');
    });

    /**
     * @tc.name   testPassword0009
     * @tc.number SUB_ACCT_PWD_0009
     * @tc.desc   password of 8 character(s) is compared with the 6 character floor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPassword0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0009 begin');
      const PWD: string = 'p'.repeat(8);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0009 end');
    });

    /**
     * @tc.name   testPassword0010
     * @tc.number SUB_ACCT_PWD_0010
     * @tc.desc   password of 9 character(s) is compared with the 6 character floor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPassword0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0010 begin');
      const PWD: string = 'p'.repeat(9);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0010 end');
    });

    /**
     * @tc.name   testPassword0011
     * @tc.number SUB_ACCT_PWD_0011
     * @tc.desc   password of 10 character(s) is compared with the 6 character floor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPassword0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0011 begin');
      const PWD: string = 'p'.repeat(10);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0011 end');
    });

    /**
     * @tc.name   testPassword0012
     * @tc.number SUB_ACCT_PWD_0012
     * @tc.desc   password of 11 character(s) is compared with the 6 character floor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPassword0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0012 begin');
      const PWD: string = 'p'.repeat(11);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0012 end');
    });

    /**
     * @tc.name   testPassword0013
     * @tc.number SUB_ACCT_PWD_0013
     * @tc.desc   password of 12 character(s) is compared with the 6 character floor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPassword0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0013 begin');
      const PWD: string = 'p'.repeat(12);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0013 end');
    });

    /**
     * @tc.name   testPassword0014
     * @tc.number SUB_ACCT_PWD_0014
     * @tc.desc   password of 13 character(s) is compared with the 6 character floor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPassword0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0014 begin');
      const PWD: string = 'p'.repeat(13);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0014 end');
    });

    /**
     * @tc.name   testPassword0015
     * @tc.number SUB_ACCT_PWD_0015
     * @tc.desc   password of 14 character(s) is compared with the 6 character floor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPassword0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0015 begin');
      const PWD: string = 'p'.repeat(14);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0015 end');
    });

    /**
     * @tc.name   testPassword0016
     * @tc.number SUB_ACCT_PWD_0016
     * @tc.desc   password of 15 character(s) is compared with the 6 character floor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPassword0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0016 begin');
      const PWD: string = 'p'.repeat(15);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0016 end');
    });

    /**
     * @tc.name   testPassword0017
     * @tc.number SUB_ACCT_PWD_0017
     * @tc.desc   password of 16 character(s) is compared with the 6 character floor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPassword0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0017 begin');
      const PWD: string = 'p'.repeat(16);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0017 end');
    });

    /**
     * @tc.name   testPassword0018
     * @tc.number SUB_ACCT_PWD_0018
     * @tc.desc   password of 17 character(s) is compared with the 6 character floor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPassword0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0018 begin');
      const PWD: string = 'p'.repeat(17);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0018 end');
    });

    /**
     * @tc.name   testPassword0019
     * @tc.number SUB_ACCT_PWD_0019
     * @tc.desc   password of 18 character(s) is compared with the 6 character floor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPassword0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0019 begin');
      const PWD: string = 'p'.repeat(18);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0019 end');
    });

    /**
     * @tc.name   testPassword0020
     * @tc.number SUB_ACCT_PWD_0020
     * @tc.desc   password of 19 character(s) is compared with the 6 character floor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPassword0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0020 begin');
      const PWD: string = 'p'.repeat(19);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0020 end');
    });

    /**
     * @tc.name   testPassword0021
     * @tc.number SUB_ACCT_PWD_0021
     * @tc.desc   password of 20 character(s) is compared with the 6 character floor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPassword0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0021 begin');
      const PWD: string = 'p'.repeat(20);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0021 end');
    });

    /**
     * @tc.name   testPassword0022
     * @tc.number SUB_ACCT_PWD_0022
     * @tc.desc   password of 32 character(s) stays above the length floor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPassword0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0022 begin');
      const PWD: string = 'p'.repeat(32);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0022 end');
    });

    /**
     * @tc.name   testPassword0023
     * @tc.number SUB_ACCT_PWD_0023
     * @tc.desc   password of 64 character(s) stays above the length floor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPassword0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0023 begin');
      const PWD: string = 'p'.repeat(64);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0023 end');
    });

    /**
     * @tc.name   testPassword0024
     * @tc.number SUB_ACCT_PWD_0024
     * @tc.desc   password of 65 character(s) stays above the length floor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPassword0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0024 begin');
      const PWD: string = 'p'.repeat(65);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0024 end');
    });

    /**
     * @tc.name   testPassword0025
     * @tc.number SUB_ACCT_PWD_0025
     * @tc.desc   password of 100 character(s) stays above the length floor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPassword0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0025 begin');
      const PWD: string = 'p'.repeat(100);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0025 end');
    });

    /**
     * @tc.name   testPassword0026
     * @tc.number SUB_ACCT_PWD_0026
     * @tc.desc   password of 128 character(s) stays above the length floor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPassword0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0026 begin');
      const PWD: string = 'p'.repeat(128);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0026 end');
    });

    /**
     * @tc.name   testPassword0027
     * @tc.number SUB_ACCT_PWD_0027
     * @tc.desc   password of 129 character(s) stays above the length floor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPassword0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0027 begin');
      const PWD: string = 'p'.repeat(129);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0027 end');
    });

    /**
     * @tc.name   testPassword0028
     * @tc.number SUB_ACCT_PWD_0028
     * @tc.desc   password of 200 character(s) stays above the length floor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPassword0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0028 begin');
      const PWD: string = 'p'.repeat(200);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0028 end');
    });

    /**
     * @tc.name   testPassword0029
     * @tc.number SUB_ACCT_PWD_0029
     * @tc.desc   password of 256 character(s) stays above the length floor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPassword0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0029 begin');
      const PWD: string = 'p'.repeat(256);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0029 end');
    });

    /**
     * @tc.name   testPassword0030
     * @tc.number SUB_ACCT_PWD_0030
     * @tc.desc   password of 1000 character(s) stays above the length floor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPassword0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0030 begin');
      const PWD: string = 'p'.repeat(1000);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0030 end');
    });

    /**
     * @tc.name   testPassword0031
     * @tc.number SUB_ACCT_PWD_0031
     * @tc.desc   password of 6 character(s) is measured by its code unit count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPassword0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0031 begin');
      const PWD: string = '123456';
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0031 end');
    });

    /**
     * @tc.name   testPassword0032
     * @tc.number SUB_ACCT_PWD_0032
     * @tc.desc   password of 6 character(s) is measured by its code unit count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPassword0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0032 begin');
      const PWD: string = '000000';
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0032 end');
    });

    /**
     * @tc.name   testPassword0033
     * @tc.number SUB_ACCT_PWD_0033
     * @tc.desc   password of 6 character(s) is measured by its code unit count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPassword0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0033 begin');
      const PWD: string = '111111';
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0033 end');
    });

    /**
     * @tc.name   testPassword0034
     * @tc.number SUB_ACCT_PWD_0034
     * @tc.desc   password of 6 character(s) is measured by its code unit count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPassword0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0034 begin');
      const PWD: string = '!!!!!!';
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0034 end');
    });

    /**
     * @tc.name   testPassword0035
     * @tc.number SUB_ACCT_PWD_0035
     * @tc.desc   password of 6 character(s) is measured by its code unit count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPassword0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0035 begin');
      const PWD: string = '......';
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0035 end');
    });

    /**
     * @tc.name   testPassword0036
     * @tc.number SUB_ACCT_PWD_0036
     * @tc.desc   password of 6 character(s) is measured by its code unit count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPassword0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0036 begin');
      const PWD: string = '------';
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0036 end');
    });

    /**
     * @tc.name   testPassword0037
     * @tc.number SUB_ACCT_PWD_0037
     * @tc.desc   password of 6 character(s) is measured by its code unit count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPassword0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0037 begin');
      const PWD: string = '______';
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0037 end');
    });

    /**
     * @tc.name   testPassword0038
     * @tc.number SUB_ACCT_PWD_0038
     * @tc.desc   password of 6 character(s) is measured by its code unit count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPassword0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0038 begin');
      const PWD: string = '      ';
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0038 end');
    });

    /**
     * @tc.name   testPassword0039
     * @tc.number SUB_ACCT_PWD_0039
     * @tc.desc   password of 5 character(s) is measured by its code unit count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPassword0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0039 begin');
      const PWD: string = '     ';
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0039 end');
    });

    /**
     * @tc.name   testPassword0040
     * @tc.number SUB_ACCT_PWD_0040
     * @tc.desc   password of 2 character(s) is measured by its code unit count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPassword0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0040 begin');
      const PWD: string = '  ';
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPassword0040 end');
    });

  });
}
