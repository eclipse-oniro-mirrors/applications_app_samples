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

export default function emailTest01() {
  describe('EmailTest01', () => {

    /**
     * @tc.name   testEmail0001
     * @tc.number SUB_ACCT_EMAIL_0001
     * @tc.desc   top level label of 1 character(s) is judged by the 2..6 window
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEmail0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0001 begin');
      const MAIL: string = 'tom@example.' + 'a'.repeat(1);
      const PAIR: string = 'tom@example.' + 'a'.repeat(4);
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0001 end');
    });

    /**
     * @tc.name   testEmail0002
     * @tc.number SUB_ACCT_EMAIL_0002
     * @tc.desc   top level label of 2 character(s) is judged by the 2..6 window
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEmail0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0002 begin');
      const MAIL: string = 'tom@example.' + 'a'.repeat(2);
      const PAIR: string = 'tom@example.' + 'a'.repeat(7);
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0002 end');
    });

    /**
     * @tc.name   testEmail0003
     * @tc.number SUB_ACCT_EMAIL_0003
     * @tc.desc   top level label of 3 character(s) is judged by the 2..6 window
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEmail0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0003 begin');
      const MAIL: string = 'tom@example.' + 'a'.repeat(3);
      const PAIR: string = 'tom@example.' + 'a'.repeat(7);
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0003 end');
    });

    /**
     * @tc.name   testEmail0004
     * @tc.number SUB_ACCT_EMAIL_0004
     * @tc.desc   top level label of 4 character(s) is judged by the 2..6 window
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEmail0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0004 begin');
      const MAIL: string = 'tom@example.' + 'a'.repeat(4);
      const PAIR: string = 'tom@example.' + 'a'.repeat(7);
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0004 end');
    });

    /**
     * @tc.name   testEmail0005
     * @tc.number SUB_ACCT_EMAIL_0005
     * @tc.desc   top level label of 5 character(s) is judged by the 2..6 window
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEmail0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0005 begin');
      const MAIL: string = 'tom@example.' + 'a'.repeat(5);
      const PAIR: string = 'tom@example.' + 'a'.repeat(7);
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0005 end');
    });

    /**
     * @tc.name   testEmail0006
     * @tc.number SUB_ACCT_EMAIL_0006
     * @tc.desc   top level label of 6 character(s) is judged by the 2..6 window
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEmail0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0006 begin');
      const MAIL: string = 'tom@example.' + 'a'.repeat(6);
      const PAIR: string = 'tom@example.' + 'a'.repeat(7);
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0006 end');
    });

    /**
     * @tc.name   testEmail0007
     * @tc.number SUB_ACCT_EMAIL_0007
     * @tc.desc   top level label of 7 character(s) is judged by the 2..6 window
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEmail0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0007 begin');
      const MAIL: string = 'tom@example.' + 'a'.repeat(7);
      const PAIR: string = 'tom@example.' + 'a'.repeat(4);
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0007 end');
    });

    /**
     * @tc.name   testEmail0008
     * @tc.number SUB_ACCT_EMAIL_0008
     * @tc.desc   top level label of 8 character(s) is judged by the 2..6 window
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEmail0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0008 begin');
      const MAIL: string = 'tom@example.' + 'a'.repeat(8);
      const PAIR: string = 'tom@example.' + 'a'.repeat(4);
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0008 end');
    });

    /**
     * @tc.name   testEmail0009
     * @tc.number SUB_ACCT_EMAIL_0009
     * @tc.desc   top level label of 9 character(s) is judged by the 2..6 window
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEmail0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0009 begin');
      const MAIL: string = 'tom@example.' + 'a'.repeat(9);
      const PAIR: string = 'tom@example.' + 'a'.repeat(4);
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0009 end');
    });

    /**
     * @tc.name   testEmail0010
     * @tc.number SUB_ACCT_EMAIL_0010
     * @tc.desc   top level label of 10 character(s) is judged by the 2..6 window
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEmail0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0010 begin');
      const MAIL: string = 'tom@example.' + 'a'.repeat(10);
      const PAIR: string = 'tom@example.' + 'a'.repeat(4);
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0010 end');
    });

    /**
     * @tc.name   testEmail0011
     * @tc.number SUB_ACCT_EMAIL_0011
     * @tc.desc   top level label of 11 character(s) is judged by the 2..6 window
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEmail0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0011 begin');
      const MAIL: string = 'tom@example.' + 'a'.repeat(11);
      const PAIR: string = 'tom@example.' + 'a'.repeat(4);
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0011 end');
    });

    /**
     * @tc.name   testEmail0012
     * @tc.number SUB_ACCT_EMAIL_0012
     * @tc.desc   top level label of 12 character(s) is judged by the 2..6 window
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEmail0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0012 begin');
      const MAIL: string = 'tom@example.' + 'a'.repeat(12);
      const PAIR: string = 'tom@example.' + 'a'.repeat(4);
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0012 end');
    });

    /**
     * @tc.name   testEmail0013
     * @tc.number SUB_ACCT_EMAIL_0013
     * @tc.desc   top level label of 16 character(s) is judged by the 2..6 window
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEmail0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0013 begin');
      const MAIL: string = 'tom@example.' + 'a'.repeat(16);
      const PAIR: string = 'tom@example.' + 'a'.repeat(4);
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0013 end');
    });

    /**
     * @tc.name   testEmail0014
     * @tc.number SUB_ACCT_EMAIL_0014
     * @tc.desc   top level label of 20 character(s) is judged by the 2..6 window
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEmail0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0014 begin');
      const MAIL: string = 'tom@example.' + 'a'.repeat(20);
      const PAIR: string = 'tom@example.' + 'a'.repeat(4);
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0014 end');
    });

    /**
     * @tc.name   testEmail0015
     * @tc.number SUB_ACCT_EMAIL_0015
     * @tc.desc   top level label of 24 character(s) is judged by the 2..6 window
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEmail0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0015 begin');
      const MAIL: string = 'tom@example.' + 'a'.repeat(24);
      const PAIR: string = 'tom@example.' + 'a'.repeat(4);
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0015 end');
    });

    /**
     * @tc.name   testEmail0016
     * @tc.number SUB_ACCT_EMAIL_0016
     * @tc.desc   top level label of 32 character(s) is judged by the 2..6 window
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEmail0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0016 begin');
      const MAIL: string = 'tom@example.' + 'a'.repeat(32);
      const PAIR: string = 'tom@example.' + 'a'.repeat(4);
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0016 end');
    });

    /**
     * @tc.name   testEmail0017
     * @tc.number SUB_ACCT_EMAIL_0017
     * @tc.desc   top level label of 48 character(s) is judged by the 2..6 window
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEmail0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0017 begin');
      const MAIL: string = 'tom@example.' + 'a'.repeat(48);
      const PAIR: string = 'tom@example.' + 'a'.repeat(4);
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0017 end');
    });

    /**
     * @tc.name   testEmail0018
     * @tc.number SUB_ACCT_EMAIL_0018
     * @tc.desc   top level label of 64 character(s) is judged by the 2..6 window
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEmail0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0018 begin');
      const MAIL: string = 'tom@example.' + 'a'.repeat(64);
      const PAIR: string = 'tom@example.' + 'a'.repeat(4);
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0018 end');
    });

    /**
     * @tc.name   testEmail0019
     * @tc.number SUB_ACCT_EMAIL_0019
     * @tc.desc   top level label of 100 character(s) is judged by the 2..6 window
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEmail0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0019 begin');
      const MAIL: string = 'tom@example.' + 'a'.repeat(100);
      const PAIR: string = 'tom@example.' + 'a'.repeat(4);
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0019 end');
    });

    /**
     * @tc.name   testEmail0020
     * @tc.number SUB_ACCT_EMAIL_0020
     * @tc.desc   top level label of 200 character(s) is judged by the 2..6 window
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEmail0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0020 begin');
      const MAIL: string = 'tom@example.' + 'a'.repeat(200);
      const PAIR: string = 'tom@example.' + 'a'.repeat(4);
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0020 end');
    });

    /**
     * @tc.name   testEmail0021
     * @tc.number SUB_ACCT_EMAIL_0021
     * @tc.desc   multi label domain keeps every label non empty and ascii
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEmail0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0021 begin');
      const MAIL: string = 'tom@mail.example.com';
      const PAIR: string = 'tom@mail.example.c';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0021 end');
    });

    /**
     * @tc.name   testEmail0022
     * @tc.number SUB_ACCT_EMAIL_0022
     * @tc.desc   multi label domain keeps every label non empty and ascii
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEmail0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0022 begin');
      const MAIL: string = 'tom@a.b.com';
      const PAIR: string = 'tom@a.b.co';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0022 end');
    });

    /**
     * @tc.name   testEmail0023
     * @tc.number SUB_ACCT_EMAIL_0023
     * @tc.desc   multi label domain keeps every label non empty and ascii
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEmail0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0023 begin');
      const MAIL: string = 'tom@a.b.c.de';
      const PAIR: string = 'tom@a.b.c.d';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0023 end');
    });

    /**
     * @tc.name   testEmail0024
     * @tc.number SUB_ACCT_EMAIL_0024
     * @tc.desc   multi label domain keeps every label non empty and ascii
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEmail0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0024 begin');
      const MAIL: string = 'tom@a.b.c.abcdef';
      const PAIR: string = 'tom@a.b.c.abcdefg';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0024 end');
    });

    /**
     * @tc.name   testEmail0025
     * @tc.number SUB_ACCT_EMAIL_0025
     * @tc.desc   multi label domain keeps every label non empty and ascii
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEmail0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0025 begin');
      const MAIL: string = 'tom@example.co.uk';
      const PAIR: string = 'tom@example.co.u';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0025 end');
    });

    /**
     * @tc.name   testEmail0026
     * @tc.number SUB_ACCT_EMAIL_0026
     * @tc.desc   multi label domain keeps every label non empty and ascii
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEmail0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0026 begin');
      const MAIL: string = 'tom@example.com.cn';
      const PAIR: string = 'tom@example.com.c';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0026 end');
    });

    /**
     * @tc.name   testEmail0027
     * @tc.number SUB_ACCT_EMAIL_0027
     * @tc.desc   multi label domain keeps every label non empty and ascii
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEmail0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0027 begin');
      const MAIL: string = 'tom@x.y.z.w.co';
      const PAIR: string = 'tom@x.y.z.w.c';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0027 end');
    });

    /**
     * @tc.name   testEmail0028
     * @tc.number SUB_ACCT_EMAIL_0028
     * @tc.desc   multi label domain keeps every label non empty and ascii
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEmail0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0028 begin');
      const MAIL: string = 'tom@example..com';
      const PAIR: string = 'tom@example.x.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0028 end');
    });

    /**
     * @tc.name   testEmail0029
     * @tc.number SUB_ACCT_EMAIL_0029
     * @tc.desc   multi label domain keeps every label non empty and ascii
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEmail0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0029 begin');
      const MAIL: string = 'tom@.example.com';
      const PAIR: string = 'tom@a.example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0029 end');
    });

    /**
     * @tc.name   testEmail0030
     * @tc.number SUB_ACCT_EMAIL_0030
     * @tc.desc   multi label domain keeps every label non empty and ascii
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEmail0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0030 begin');
      const MAIL: string = 'tom@example.com.';
      const PAIR: string = 'tom@example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0030 end');
    });

    /**
     * @tc.name   testEmail0031
     * @tc.number SUB_ACCT_EMAIL_0031
     * @tc.desc   multi label domain keeps every label non empty and ascii
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEmail0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0031 begin');
      const MAIL: string = 'tom@-example.com';
      const PAIR: string = 'tom@example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0031 end');
    });

    /**
     * @tc.name   testEmail0032
     * @tc.number SUB_ACCT_EMAIL_0032
     * @tc.desc   multi label domain keeps every label non empty and ascii
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEmail0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0032 begin');
      const MAIL: string = 'tom@exa_mple.com';
      const PAIR: string = 'tom@example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0032 end');
    });

    /**
     * @tc.name   testEmail0033
     * @tc.number SUB_ACCT_EMAIL_0033
     * @tc.desc   multi label domain keeps every label non empty and ascii
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEmail0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0033 begin');
      const MAIL: string = 'tom@example-.com';
      const PAIR: string = 'tom@example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0033 end');
    });

    /**
     * @tc.name   testEmail0034
     * @tc.number SUB_ACCT_EMAIL_0034
     * @tc.desc   multi label domain keeps every label non empty and ascii
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEmail0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0034 begin');
      const MAIL: string = 'tom@exam ple.com';
      const PAIR: string = 'tom@example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0034 end');
    });

    /**
     * @tc.name   testEmail0035
     * @tc.number SUB_ACCT_EMAIL_0035
     * @tc.desc   local part accepts only letters digits underscore dot and hyphen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEmail0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0035 begin');
      const MAIL: string = 'tom@example.com';
      const PAIR: string = 'tom@example.org';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0035 end');
    });

    /**
     * @tc.name   testEmail0036
     * @tc.number SUB_ACCT_EMAIL_0036
     * @tc.desc   local part accepts only letters digits underscore dot and hyphen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEmail0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0036 begin');
      const MAIL: string = '123@example.com';
      const PAIR: string = 'abc@example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0036 end');
    });

    /**
     * @tc.name   testEmail0037
     * @tc.number SUB_ACCT_EMAIL_0037
     * @tc.desc   local part accepts only letters digits underscore dot and hyphen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEmail0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0037 begin');
      const MAIL: string = 'tom_smith@example.com';
      const PAIR: string = 'tom-smith@example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0037 end');
    });

    /**
     * @tc.name   testEmail0038
     * @tc.number SUB_ACCT_EMAIL_0038
     * @tc.desc   local part accepts only letters digits underscore dot and hyphen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEmail0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0038 begin');
      const MAIL: string = 'tom.smith@example.com';
      const PAIR: string = 'tom_smith@example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0038 end');
    });

    /**
     * @tc.name   testEmail0039
     * @tc.number SUB_ACCT_EMAIL_0039
     * @tc.desc   local part accepts only letters digits underscore dot and hyphen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEmail0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0039 begin');
      const MAIL: string = 'tom-smith@example.com';
      const PAIR: string = 'tom.smith@example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0039 end');
    });

    /**
     * @tc.name   testEmail0040
     * @tc.number SUB_ACCT_EMAIL_0040
     * @tc.desc   local part accepts only letters digits underscore dot and hyphen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEmail0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0040 begin');
      const MAIL: string = 'to.m_s-1@example.com';
      const PAIR: string = 'to.m_s_1@example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0040 end');
    });

    /**
     * @tc.name   testEmail0041
     * @tc.number SUB_ACCT_EMAIL_0041
     * @tc.desc   local part accepts only letters digits underscore dot and hyphen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEmail0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0041 begin');
      const MAIL: string = 'TOM@EXAMPLE.COM';
      const PAIR: string = 'tom@example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0041 end');
    });

    /**
     * @tc.name   testEmail0042
     * @tc.number SUB_ACCT_EMAIL_0042
     * @tc.desc   local part accepts only letters digits underscore dot and hyphen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEmail0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0042 begin');
      const MAIL: string = 'tom+tag@example.com';
      const PAIR: string = 'tomtag@example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0042 end');
    });

    /**
     * @tc.name   testEmail0043
     * @tc.number SUB_ACCT_EMAIL_0043
     * @tc.desc   local part accepts only letters digits underscore dot and hyphen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEmail0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0043 begin');
      const MAIL: string = 'tom!x@example.com';
      const PAIR: string = 'tomx@example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0043 end');
    });

    /**
     * @tc.name   testEmail0044
     * @tc.number SUB_ACCT_EMAIL_0044
     * @tc.desc   local part accepts only letters digits underscore dot and hyphen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEmail0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0044 begin');
      const MAIL: string = 'tom%x@example.com';
      const PAIR: string = 'tomx@example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0044 end');
    });

    /**
     * @tc.name   testEmail0045
     * @tc.number SUB_ACCT_EMAIL_0045
     * @tc.desc   local part accepts only letters digits underscore dot and hyphen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEmail0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0045 begin');
      const MAIL: string = 'tom/x@example.com';
      const PAIR: string = 'tomx@example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0045 end');
    });

    /**
     * @tc.name   testEmail0046
     * @tc.number SUB_ACCT_EMAIL_0046
     * @tc.desc   local part accepts only letters digits underscore dot and hyphen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEmail0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0046 begin');
      const MAIL: string = 'tom x@example.com';
      const PAIR: string = 'tomx@example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0046 end');
    });

    /**
     * @tc.name   testEmail0047
     * @tc.number SUB_ACCT_EMAIL_0047
     * @tc.desc   local part accepts only letters digits underscore dot and hyphen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEmail0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0047 begin');
      const MAIL: string = 'tom\tx@example.com';
      const PAIR: string = 'tomx@example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0047 end');
    });

    /**
     * @tc.name   testEmail0048
     * @tc.number SUB_ACCT_EMAIL_0048
     * @tc.desc   local part accepts only letters digits underscore dot and hyphen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEmail0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0048 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0048 end');
    });

    /**
     * @tc.name   testEmail0049
     * @tc.number SUB_ACCT_EMAIL_0049
     * @tc.desc   local part accepts only letters digits underscore dot and hyphen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEmail0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0049 begin');
      const MAIL: string = 'tom.@example.com';
      const PAIR: string = 'tom@example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'true');
      expect(result).assertTrue();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0049 end');
    });

    /**
     * @tc.name   testEmail0050
     * @tc.number SUB_ACCT_EMAIL_0050
     * @tc.desc   local part accepts only letters digits underscore dot and hyphen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEmail0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0050 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0050 end');
    });

    /**
     * @tc.name   testEmail0051
     * @tc.number SUB_ACCT_EMAIL_0051
     * @tc.desc   local part accepts only letters digits underscore dot and hyphen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEmail0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0051 begin');
      const MAIL: string = '@example.com';
      const PAIR: string = 'a@example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0051 end');
    });

    /**
     * @tc.name   testEmail0052
     * @tc.number SUB_ACCT_EMAIL_0052
     * @tc.desc   local part accepts only letters digits underscore dot and hyphen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEmail0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0052 begin');
      const MAIL: string = '中文@example.com';
      const PAIR: string = 'tom@example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0052 end');
    });

    /**
     * @tc.name   testEmail0053
     * @tc.number SUB_ACCT_EMAIL_0053
     * @tc.desc   local part accepts only letters digits underscore dot and hyphen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEmail0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0053 begin');
      const MAIL: string = '#tom@example.com';
      const PAIR: string = 'tom@example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0053 end');
    });

    /**
     * @tc.name   testEmail0054
     * @tc.number SUB_ACCT_EMAIL_0054
     * @tc.desc   local part accepts only letters digits underscore dot and hyphen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEmail0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0054 begin');
      const MAIL: string = 'tom*x@example.com';
      const PAIR: string = 'tomx@example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0054 end');
    });

    /**
     * @tc.name   testEmail0055
     * @tc.number SUB_ACCT_EMAIL_0055
     * @tc.desc   local part accepts only letters digits underscore dot and hyphen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEmail0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0055 begin');
      const MAIL: string = 'tom(x)@example.com';
      const PAIR: string = 'tomx@example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0055 end');
    });

    /**
     * @tc.name   testEmail0056
     * @tc.number SUB_ACCT_EMAIL_0056
     * @tc.desc   local part accepts only letters digits underscore dot and hyphen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEmail0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0056 begin');
      const MAIL: string = 'tom,x@example.com';
      const PAIR: string = 'tomx@example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0056 end');
    });

    /**
     * @tc.name   testEmail0057
     * @tc.number SUB_ACCT_EMAIL_0057
     * @tc.desc   local part accepts only letters digits underscore dot and hyphen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEmail0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0057 begin');
      const MAIL: string = 'tom<x>@example.com';
      const PAIR: string = 'tomx@example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0057 end');
    });

    /**
     * @tc.name   testEmail0058
     * @tc.number SUB_ACCT_EMAIL_0058
     * @tc.desc   local part accepts only letters digits underscore dot and hyphen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEmail0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0058 begin');
      const MAIL: string = 'tom|x@example.com';
      const PAIR: string = 'tomx@example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0058 end');
    });

    /**
     * @tc.name   testEmail0059
     * @tc.number SUB_ACCT_EMAIL_0059
     * @tc.desc   one local part one at sign and one dotted top level label are required
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEmail0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0059 begin');
      const MAIL: string = '';
      const PAIR: string = 'tom@example.com';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.OK');
      expect(CHECK).assertEqual(RegisterResult.OK);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0059 end');
    });

    /**
     * @tc.name   testEmail0060
     * @tc.number SUB_ACCT_EMAIL_0060
     * @tc.desc   one local part one at sign and one dotted top level label are required
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEmail0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0060 begin');
      const MAIL: string = '@';
      const PAIR: string = 'a@b.co';
      const result: boolean = AccountValidator.isEmailValid(MAIL);
      logPair(String(result), 'false');
      expect(result).assertFalse();
      const CHECK: RegisterResult = AccountValidator.validateRegister(
        regInput('mail_user', MAIL, 'sig', 'pass123', 'pass123'), false);
      logPair(String(CHECK), 'RegisterResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(RegisterResult.EMAIL_INVALID);
      expect(AccountValidator.isEmailValid(PAIR)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEmail0060 end');
    });

  });
}
