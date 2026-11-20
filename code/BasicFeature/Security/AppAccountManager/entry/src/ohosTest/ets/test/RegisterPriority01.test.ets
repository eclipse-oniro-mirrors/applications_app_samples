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
import { AccountValidator, RegisterInput, RegisterResult } from '../../../main/ets/model/AccountValidator';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function registerPriority01Test() {
  describe('RegisterPriority01Test', () => {

    /**
     * @tc.name   testRegisterPriority010149
     * @tc.number SUB_ACCT_VALREG_0149
     * @tc.desc   username blank alone -> USERNAME_EMPTY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterPriority010149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010149 begin');
      const input: RegisterInput = { username: '', email: 'a@b.co', signature: 'sig', password: 'secret1',
          confirmPassword: 'secret1' };
      const exists: boolean = false;
      const result: RegisterResult = AccountValidator.validateRegister(input, exists);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(RegisterResult.USERNAME_EMPTY));
      expect(result).assertEqual(RegisterResult.USERNAME_EMPTY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(1));
      expect(Number(result)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateRegister(input, true)), String(RegisterResult.USERNAME_EMPTY));
      expect(AccountValidator.validateRegister(input, true)).assertEqual(RegisterResult.USERNAME_EMPTY);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010149 end');
    })

    /**
     * @tc.name   testRegisterPriority010150
     * @tc.number SUB_ACCT_VALREG_0150
     * @tc.desc   account exists alone -> ACCOUNT_EXISTS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterPriority010150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010150 begin');
      const input: RegisterInput = { username: 'alice01', email: 'a@b.co', signature: 'sig', password: 'secret1',
          confirmPassword: 'secret1' };
      const exists: boolean = true;
      const result: RegisterResult = AccountValidator.validateRegister(input, exists);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(RegisterResult.ACCOUNT_EXISTS));
      expect(result).assertEqual(RegisterResult.ACCOUNT_EXISTS);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(2));
      expect(Number(result)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateRegister(input, false)), String(RegisterResult.OK));
      expect(AccountValidator.validateRegister(input, false)).assertEqual(RegisterResult.OK);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010150 end');
    })

    /**
     * @tc.name   testRegisterPriority010151
     * @tc.number SUB_ACCT_VALREG_0151
     * @tc.desc   mailbox malformed alone -> EMAIL_INVALID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterPriority010151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010151 begin');
      const input: RegisterInput = { username: 'alice01', email: 'bad@', signature: 'sig', password: 'secret1',
          confirmPassword: 'secret1' };
      const exists: boolean = false;
      const result: RegisterResult = AccountValidator.validateRegister(input, exists);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(RegisterResult.EMAIL_INVALID));
      expect(result).assertEqual(RegisterResult.EMAIL_INVALID);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(3));
      expect(Number(result)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateRegister(input, true)), String(RegisterResult.ACCOUNT_EXISTS));
      expect(AccountValidator.validateRegister(input, true)).assertEqual(RegisterResult.ACCOUNT_EXISTS);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010151 end');
    })

    /**
     * @tc.name   testRegisterPriority010152
     * @tc.number SUB_ACCT_VALREG_0152
     * @tc.desc   password blank alone -> PASSWORD_EMPTY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterPriority010152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010152 begin');
      const input: RegisterInput = { username: 'alice01', email: 'a@b.co', signature: 'sig', password: '',
          confirmPassword: '' };
      const exists: boolean = false;
      const result: RegisterResult = AccountValidator.validateRegister(input, exists);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(RegisterResult.PASSWORD_EMPTY));
      expect(result).assertEqual(RegisterResult.PASSWORD_EMPTY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(4));
      expect(Number(result)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateRegister(input, true)), String(RegisterResult.ACCOUNT_EXISTS));
      expect(AccountValidator.validateRegister(input, true)).assertEqual(RegisterResult.ACCOUNT_EXISTS);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010152 end');
    })

    /**
     * @tc.name   testRegisterPriority010153
     * @tc.number SUB_ACCT_VALREG_0153
     * @tc.desc   password of five chars alone -> PASSWORD_TOO_SHORT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterPriority010153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010153 begin');
      const input: RegisterInput = { username: 'alice01', email: 'a@b.co', signature: 'sig', password: 'abcde',
          confirmPassword: 'abcde' };
      const exists: boolean = false;
      const result: RegisterResult = AccountValidator.validateRegister(input, exists);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(RegisterResult.PASSWORD_TOO_SHORT));
      expect(result).assertEqual(RegisterResult.PASSWORD_TOO_SHORT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(5));
      expect(Number(result)).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateRegister(input, true)), String(RegisterResult.ACCOUNT_EXISTS));
      expect(AccountValidator.validateRegister(input, true)).assertEqual(RegisterResult.ACCOUNT_EXISTS);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010153 end');
    })

    /**
     * @tc.name   testRegisterPriority010154
     * @tc.number SUB_ACCT_VALREG_0154
     * @tc.desc   confirm differs alone -> CONFIRM_MISMATCH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterPriority010154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010154 begin');
      const input: RegisterInput = { username: 'alice01', email: 'a@b.co', signature: 'sig', password: 'secret1',
          confirmPassword: 'secret2' };
      const exists: boolean = false;
      const result: RegisterResult = AccountValidator.validateRegister(input, exists);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(RegisterResult.CONFIRM_MISMATCH));
      expect(result).assertEqual(RegisterResult.CONFIRM_MISMATCH);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(6));
      expect(Number(result)).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateRegister(input, true)), String(RegisterResult.ACCOUNT_EXISTS));
      expect(AccountValidator.validateRegister(input, true)).assertEqual(RegisterResult.ACCOUNT_EXISTS);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010154 end');
    })

    /**
     * @tc.name   testRegisterPriority010155
     * @tc.number SUB_ACCT_VALREG_0155
     * @tc.desc   all fields valid -> OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterPriority010155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010155 begin');
      const input: RegisterInput = { username: 'alice01', email: 'a@b.co', signature: 'sig', password: 'secret1',
          confirmPassword: 'secret1' };
      const exists: boolean = false;
      const result: RegisterResult = AccountValidator.validateRegister(input, exists);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(RegisterResult.OK));
      expect(result).assertEqual(RegisterResult.OK);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(0));
      expect(Number(result)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateRegister(input, true)), String(RegisterResult.ACCOUNT_EXISTS));
      expect(AccountValidator.validateRegister(input, true)).assertEqual(RegisterResult.ACCOUNT_EXISTS);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010155 end');
    })

    /**
     * @tc.name   testRegisterPriority010156
     * @tc.number SUB_ACCT_VALREG_0156
     * @tc.desc   blank username with existing account -> USERNAME_EMPTY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterPriority010156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010156 begin');
      const input: RegisterInput = { username: '', email: 'a@b.co', signature: 'sig', password: 'secret1',
          confirmPassword: 'secret1' };
      const exists: boolean = true;
      const result: RegisterResult = AccountValidator.validateRegister(input, exists);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(RegisterResult.USERNAME_EMPTY));
      expect(result).assertEqual(RegisterResult.USERNAME_EMPTY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(1));
      expect(Number(result)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateRegister(input, false)), String(RegisterResult.USERNAME_EMPTY));
      expect(AccountValidator.validateRegister(input, false)).assertEqual(RegisterResult.USERNAME_EMPTY);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010156 end');
    })

    /**
     * @tc.name   testRegisterPriority010157
     * @tc.number SUB_ACCT_VALREG_0157
     * @tc.desc   blank username with malformed mailbox -> USERNAME_EMPTY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterPriority010157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010157 begin');
      const input: RegisterInput = { username: '', email: 'bad@', signature: 'sig', password: 'secret1',
          confirmPassword: 'secret1' };
      const exists: boolean = false;
      const result: RegisterResult = AccountValidator.validateRegister(input, exists);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(RegisterResult.USERNAME_EMPTY));
      expect(result).assertEqual(RegisterResult.USERNAME_EMPTY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(1));
      expect(Number(result)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateRegister(input, true)), String(RegisterResult.USERNAME_EMPTY));
      expect(AccountValidator.validateRegister(input, true)).assertEqual(RegisterResult.USERNAME_EMPTY);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010157 end');
    })

    /**
     * @tc.name   testRegisterPriority010158
     * @tc.number SUB_ACCT_VALREG_0158
     * @tc.desc   blank username with blank password -> USERNAME_EMPTY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterPriority010158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010158 begin');
      const input: RegisterInput = { username: '', email: 'a@b.co', signature: 'sig', password: '',
          confirmPassword: '' };
      const exists: boolean = false;
      const result: RegisterResult = AccountValidator.validateRegister(input, exists);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(RegisterResult.USERNAME_EMPTY));
      expect(result).assertEqual(RegisterResult.USERNAME_EMPTY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(1));
      expect(Number(result)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateRegister(input, true)), String(RegisterResult.USERNAME_EMPTY));
      expect(AccountValidator.validateRegister(input, true)).assertEqual(RegisterResult.USERNAME_EMPTY);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010158 end');
    })

    /**
     * @tc.name   testRegisterPriority010159
     * @tc.number SUB_ACCT_VALREG_0159
     * @tc.desc   blank username with short password -> USERNAME_EMPTY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterPriority010159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010159 begin');
      const input: RegisterInput = { username: '', email: 'a@b.co', signature: 'sig', password: 'abcde',
          confirmPassword: 'abcde' };
      const exists: boolean = false;
      const result: RegisterResult = AccountValidator.validateRegister(input, exists);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(RegisterResult.USERNAME_EMPTY));
      expect(result).assertEqual(RegisterResult.USERNAME_EMPTY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(1));
      expect(Number(result)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateRegister(input, true)), String(RegisterResult.USERNAME_EMPTY));
      expect(AccountValidator.validateRegister(input, true)).assertEqual(RegisterResult.USERNAME_EMPTY);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010159 end');
    })

    /**
     * @tc.name   testRegisterPriority010160
     * @tc.number SUB_ACCT_VALREG_0160
     * @tc.desc   blank username with mismatched confirm -> USERNAME_EMPTY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterPriority010160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010160 begin');
      const input: RegisterInput = { username: '', email: 'a@b.co', signature: 'sig', password: 'secret1',
          confirmPassword: 'secret2' };
      const exists: boolean = false;
      const result: RegisterResult = AccountValidator.validateRegister(input, exists);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(RegisterResult.USERNAME_EMPTY));
      expect(result).assertEqual(RegisterResult.USERNAME_EMPTY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(1));
      expect(Number(result)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateRegister(input, true)), String(RegisterResult.USERNAME_EMPTY));
      expect(AccountValidator.validateRegister(input, true)).assertEqual(RegisterResult.USERNAME_EMPTY);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010160 end');
    })

    /**
     * @tc.name   testRegisterPriority010161
     * @tc.number SUB_ACCT_VALREG_0161
     * @tc.desc   existing account with malformed mailbox -> ACCOUNT_EXISTS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterPriority010161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010161 begin');
      const input: RegisterInput = { username: 'alice01', email: 'bad@', signature: 'sig', password: 'secret1',
          confirmPassword: 'secret1' };
      const exists: boolean = true;
      const result: RegisterResult = AccountValidator.validateRegister(input, exists);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(RegisterResult.ACCOUNT_EXISTS));
      expect(result).assertEqual(RegisterResult.ACCOUNT_EXISTS);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(2));
      expect(Number(result)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateRegister(input, false)), String(RegisterResult.EMAIL_INVALID));
      expect(AccountValidator.validateRegister(input, false)).assertEqual(RegisterResult.EMAIL_INVALID);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010161 end');
    })

    /**
     * @tc.name   testRegisterPriority010162
     * @tc.number SUB_ACCT_VALREG_0162
     * @tc.desc   existing account with blank password -> ACCOUNT_EXISTS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterPriority010162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010162 begin');
      const input: RegisterInput = { username: 'alice01', email: 'a@b.co', signature: 'sig', password: '',
          confirmPassword: '' };
      const exists: boolean = true;
      const result: RegisterResult = AccountValidator.validateRegister(input, exists);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(RegisterResult.ACCOUNT_EXISTS));
      expect(result).assertEqual(RegisterResult.ACCOUNT_EXISTS);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(2));
      expect(Number(result)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateRegister(input, false)), String(RegisterResult.PASSWORD_EMPTY));
      expect(AccountValidator.validateRegister(input, false)).assertEqual(RegisterResult.PASSWORD_EMPTY);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010162 end');
    })

    /**
     * @tc.name   testRegisterPriority010163
     * @tc.number SUB_ACCT_VALREG_0163
     * @tc.desc   existing account with short password -> ACCOUNT_EXISTS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterPriority010163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010163 begin');
      const input: RegisterInput = { username: 'alice01', email: 'a@b.co', signature: 'sig', password: 'abcde',
          confirmPassword: 'abcde' };
      const exists: boolean = true;
      const result: RegisterResult = AccountValidator.validateRegister(input, exists);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(RegisterResult.ACCOUNT_EXISTS));
      expect(result).assertEqual(RegisterResult.ACCOUNT_EXISTS);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(2));
      expect(Number(result)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateRegister(input, false)), String(RegisterResult.PASSWORD_TOO_SHORT));
      expect(AccountValidator.validateRegister(input, false)).assertEqual(RegisterResult.PASSWORD_TOO_SHORT);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010163 end');
    })

    /**
     * @tc.name   testRegisterPriority010164
     * @tc.number SUB_ACCT_VALREG_0164
     * @tc.desc   existing account with mismatched confirm -> ACCOUNT_EXISTS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterPriority010164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010164 begin');
      const input: RegisterInput = { username: 'alice01', email: 'a@b.co', signature: 'sig', password: 'secret1',
          confirmPassword: 'secret2' };
      const exists: boolean = true;
      const result: RegisterResult = AccountValidator.validateRegister(input, exists);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(RegisterResult.ACCOUNT_EXISTS));
      expect(result).assertEqual(RegisterResult.ACCOUNT_EXISTS);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(2));
      expect(Number(result)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateRegister(input, false)), String(RegisterResult.CONFIRM_MISMATCH));
      expect(AccountValidator.validateRegister(input, false)).assertEqual(RegisterResult.CONFIRM_MISMATCH);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010164 end');
    })

    /**
     * @tc.name   testRegisterPriority010165
     * @tc.number SUB_ACCT_VALREG_0165
     * @tc.desc   malformed mailbox with blank password -> EMAIL_INVALID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterPriority010165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010165 begin');
      const input: RegisterInput = { username: 'alice01', email: 'bad@', signature: 'sig', password: '',
          confirmPassword: '' };
      const exists: boolean = false;
      const result: RegisterResult = AccountValidator.validateRegister(input, exists);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(RegisterResult.EMAIL_INVALID));
      expect(result).assertEqual(RegisterResult.EMAIL_INVALID);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(3));
      expect(Number(result)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateRegister(input, true)), String(RegisterResult.ACCOUNT_EXISTS));
      expect(AccountValidator.validateRegister(input, true)).assertEqual(RegisterResult.ACCOUNT_EXISTS);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010165 end');
    })

    /**
     * @tc.name   testRegisterPriority010166
     * @tc.number SUB_ACCT_VALREG_0166
     * @tc.desc   malformed mailbox with short password -> EMAIL_INVALID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterPriority010166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010166 begin');
      const input: RegisterInput = { username: 'alice01', email: 'bad@', signature: 'sig', password: 'abcde',
          confirmPassword: 'abcde' };
      const exists: boolean = false;
      const result: RegisterResult = AccountValidator.validateRegister(input, exists);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(RegisterResult.EMAIL_INVALID));
      expect(result).assertEqual(RegisterResult.EMAIL_INVALID);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(3));
      expect(Number(result)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateRegister(input, true)), String(RegisterResult.ACCOUNT_EXISTS));
      expect(AccountValidator.validateRegister(input, true)).assertEqual(RegisterResult.ACCOUNT_EXISTS);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010166 end');
    })

    /**
     * @tc.name   testRegisterPriority010167
     * @tc.number SUB_ACCT_VALREG_0167
     * @tc.desc   malformed mailbox with mismatched confirm -> EMAIL_INVALID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterPriority010167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010167 begin');
      const input: RegisterInput = { username: 'alice01', email: 'bad@', signature: 'sig', password: 'secret1',
          confirmPassword: 'secret2' };
      const exists: boolean = false;
      const result: RegisterResult = AccountValidator.validateRegister(input, exists);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(RegisterResult.EMAIL_INVALID));
      expect(result).assertEqual(RegisterResult.EMAIL_INVALID);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(3));
      expect(Number(result)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateRegister(input, true)), String(RegisterResult.ACCOUNT_EXISTS));
      expect(AccountValidator.validateRegister(input, true)).assertEqual(RegisterResult.ACCOUNT_EXISTS);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010167 end');
    })

    /**
     * @tc.name   testRegisterPriority010168
     * @tc.number SUB_ACCT_VALREG_0168
     * @tc.desc   blank password is also shorter than six -> PASSWORD_EMPTY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterPriority010168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010168 begin');
      const input: RegisterInput = { username: 'alice01', email: 'a@b.co', signature: 'sig', password: '',
          confirmPassword: '' };
      const exists: boolean = false;
      const result: RegisterResult = AccountValidator.validateRegister(input, exists);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(RegisterResult.PASSWORD_EMPTY));
      expect(result).assertEqual(RegisterResult.PASSWORD_EMPTY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(4));
      expect(Number(result)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateRegister(input, true)), String(RegisterResult.ACCOUNT_EXISTS));
      expect(AccountValidator.validateRegister(input, true)).assertEqual(RegisterResult.ACCOUNT_EXISTS);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010168 end');
    })

    /**
     * @tc.name   testRegisterPriority010169
     * @tc.number SUB_ACCT_VALREG_0169
     * @tc.desc   blank password with mismatched confirm -> PASSWORD_EMPTY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterPriority010169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010169 begin');
      const input: RegisterInput = { username: 'alice01', email: 'a@b.co', signature: 'sig', password: '',
          confirmPassword: 'abc' };
      const exists: boolean = false;
      const result: RegisterResult = AccountValidator.validateRegister(input, exists);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(RegisterResult.PASSWORD_EMPTY));
      expect(result).assertEqual(RegisterResult.PASSWORD_EMPTY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(4));
      expect(Number(result)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateRegister(input, true)), String(RegisterResult.ACCOUNT_EXISTS));
      expect(AccountValidator.validateRegister(input, true)).assertEqual(RegisterResult.ACCOUNT_EXISTS);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010169 end');
    })

    /**
     * @tc.name   testRegisterPriority010170
     * @tc.number SUB_ACCT_VALREG_0170
     * @tc.desc   short password with mismatched confirm -> PASSWORD_TOO_SHORT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterPriority010170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010170 begin');
      const input: RegisterInput = { username: 'alice01', email: 'a@b.co', signature: 'sig', password: 'abcde',
          confirmPassword: 'xyz' };
      const exists: boolean = false;
      const result: RegisterResult = AccountValidator.validateRegister(input, exists);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(RegisterResult.PASSWORD_TOO_SHORT));
      expect(result).assertEqual(RegisterResult.PASSWORD_TOO_SHORT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(5));
      expect(Number(result)).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateRegister(input, true)), String(RegisterResult.ACCOUNT_EXISTS));
      expect(AccountValidator.validateRegister(input, true)).assertEqual(RegisterResult.ACCOUNT_EXISTS);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010170 end');
    })

    /**
     * @tc.name   testRegisterPriority010171
     * @tc.number SUB_ACCT_VALREG_0171
     * @tc.desc   blank username, malformed mailbox, existing account -> USERNAME_EMPTY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterPriority010171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010171 begin');
      const input: RegisterInput = { username: '', email: 'bad@', signature: 'sig', password: 'secret1',
          confirmPassword: 'secret1' };
      const exists: boolean = true;
      const result: RegisterResult = AccountValidator.validateRegister(input, exists);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(RegisterResult.USERNAME_EMPTY));
      expect(result).assertEqual(RegisterResult.USERNAME_EMPTY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(1));
      expect(Number(result)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateRegister(input, false)), String(RegisterResult.USERNAME_EMPTY));
      expect(AccountValidator.validateRegister(input, false)).assertEqual(RegisterResult.USERNAME_EMPTY);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010171 end');
    })

    /**
     * @tc.name   testRegisterPriority010172
     * @tc.number SUB_ACCT_VALREG_0172
     * @tc.desc   existing account, malformed mailbox, blank password -> ACCOUNT_EXISTS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterPriority010172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010172 begin');
      const input: RegisterInput = { username: 'alice01', email: 'bad@', signature: 'sig', password: '',
          confirmPassword: '' };
      const exists: boolean = true;
      const result: RegisterResult = AccountValidator.validateRegister(input, exists);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(RegisterResult.ACCOUNT_EXISTS));
      expect(result).assertEqual(RegisterResult.ACCOUNT_EXISTS);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(2));
      expect(Number(result)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateRegister(input, false)), String(RegisterResult.EMAIL_INVALID));
      expect(AccountValidator.validateRegister(input, false)).assertEqual(RegisterResult.EMAIL_INVALID);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010172 end');
    })

    /**
     * @tc.name   testRegisterPriority010173
     * @tc.number SUB_ACCT_VALREG_0173
     * @tc.desc   existing account with blank mailbox and password -> ACCOUNT_EXISTS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterPriority010173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010173 begin');
      const input: RegisterInput = { username: 'alice01', email: '', signature: 'sig', password: '',
          confirmPassword: '' };
      const exists: boolean = true;
      const result: RegisterResult = AccountValidator.validateRegister(input, exists);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(RegisterResult.ACCOUNT_EXISTS));
      expect(result).assertEqual(RegisterResult.ACCOUNT_EXISTS);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(2));
      expect(Number(result)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateRegister(input, false)), String(RegisterResult.PASSWORD_EMPTY));
      expect(AccountValidator.validateRegister(input, false)).assertEqual(RegisterResult.PASSWORD_EMPTY);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010173 end');
    })

    /**
     * @tc.name   testRegisterPriority010174
     * @tc.number SUB_ACCT_VALREG_0174
     * @tc.desc   malformed mailbox, blank password, mismatch -> EMAIL_INVALID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterPriority010174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010174 begin');
      const input: RegisterInput = { username: 'alice01', email: 'bad@', signature: 'sig', password: '',
          confirmPassword: 'x' };
      const exists: boolean = false;
      const result: RegisterResult = AccountValidator.validateRegister(input, exists);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(RegisterResult.EMAIL_INVALID));
      expect(result).assertEqual(RegisterResult.EMAIL_INVALID);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(3));
      expect(Number(result)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateRegister(input, true)), String(RegisterResult.ACCOUNT_EXISTS));
      expect(AccountValidator.validateRegister(input, true)).assertEqual(RegisterResult.ACCOUNT_EXISTS);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010174 end');
    })

    /**
     * @tc.name   testRegisterPriority010175
     * @tc.number SUB_ACCT_VALREG_0175
     * @tc.desc   malformed mailbox, short password, mismatch -> EMAIL_INVALID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterPriority010175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010175 begin');
      const input: RegisterInput = { username: 'alice01', email: 'bad@', signature: 'sig', password: 'abcde',
          confirmPassword: 'x' };
      const exists: boolean = false;
      const result: RegisterResult = AccountValidator.validateRegister(input, exists);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(RegisterResult.EMAIL_INVALID));
      expect(result).assertEqual(RegisterResult.EMAIL_INVALID);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(3));
      expect(Number(result)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateRegister(input, true)), String(RegisterResult.ACCOUNT_EXISTS));
      expect(AccountValidator.validateRegister(input, true)).assertEqual(RegisterResult.ACCOUNT_EXISTS);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010175 end');
    })

    /**
     * @tc.name   testRegisterPriority010176
     * @tc.number SUB_ACCT_VALREG_0176
     * @tc.desc   blank password with mismatch under valid mailbox -> PASSWORD_EMPTY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterPriority010176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010176 begin');
      const input: RegisterInput = { username: 'alice01', email: 'a@b.co', signature: 'sig', password: '',
          confirmPassword: 'x' };
      const exists: boolean = false;
      const result: RegisterResult = AccountValidator.validateRegister(input, exists);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(RegisterResult.PASSWORD_EMPTY));
      expect(result).assertEqual(RegisterResult.PASSWORD_EMPTY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(4));
      expect(Number(result)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateRegister(input, true)), String(RegisterResult.ACCOUNT_EXISTS));
      expect(AccountValidator.validateRegister(input, true)).assertEqual(RegisterResult.ACCOUNT_EXISTS);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010176 end');
    })

    /**
     * @tc.name   testRegisterPriority010177
     * @tc.number SUB_ACCT_VALREG_0177
     * @tc.desc   blank username and password with existing account -> USERNAME_EMPTY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterPriority010177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010177 begin');
      const input: RegisterInput = { username: '', email: '', signature: 'sig', password: '', confirmPassword: '' };
      const exists: boolean = true;
      const result: RegisterResult = AccountValidator.validateRegister(input, exists);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(RegisterResult.USERNAME_EMPTY));
      expect(result).assertEqual(RegisterResult.USERNAME_EMPTY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(1));
      expect(Number(result)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateRegister(input, false)), String(RegisterResult.USERNAME_EMPTY));
      expect(AccountValidator.validateRegister(input, false)).assertEqual(RegisterResult.USERNAME_EMPTY);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010177 end');
    })

    /**
     * @tc.name   testRegisterPriority010178
     * @tc.number SUB_ACCT_VALREG_0178
     * @tc.desc   existing account, malformed mailbox, mismatch -> ACCOUNT_EXISTS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterPriority010178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010178 begin');
      const input: RegisterInput = { username: 'alice01', email: 'bad@', signature: 'sig', password: 'secret1',
          confirmPassword: 'x' };
      const exists: boolean = true;
      const result: RegisterResult = AccountValidator.validateRegister(input, exists);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(RegisterResult.ACCOUNT_EXISTS));
      expect(result).assertEqual(RegisterResult.ACCOUNT_EXISTS);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(2));
      expect(Number(result)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateRegister(input, false)), String(RegisterResult.EMAIL_INVALID));
      expect(AccountValidator.validateRegister(input, false)).assertEqual(RegisterResult.EMAIL_INVALID);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010178 end');
    })

    /**
     * @tc.name   testRegisterPriority010179
     * @tc.number SUB_ACCT_VALREG_0179
     * @tc.desc   blank username, malformed mailbox, short password -> USERNAME_EMPTY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterPriority010179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010179 begin');
      const input: RegisterInput = { username: '', email: 'bad@', signature: 'sig', password: 'abcde',
          confirmPassword: 'abcde' };
      const exists: boolean = false;
      const result: RegisterResult = AccountValidator.validateRegister(input, exists);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(RegisterResult.USERNAME_EMPTY));
      expect(result).assertEqual(RegisterResult.USERNAME_EMPTY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(1));
      expect(Number(result)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateRegister(input, true)), String(RegisterResult.USERNAME_EMPTY));
      expect(AccountValidator.validateRegister(input, true)).assertEqual(RegisterResult.USERNAME_EMPTY);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010179 end');
    })

    /**
     * @tc.name   testRegisterPriority010180
     * @tc.number SUB_ACCT_VALREG_0180
     * @tc.desc   existing account, short password, mismatch -> ACCOUNT_EXISTS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterPriority010180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010180 begin');
      const input: RegisterInput = { username: 'alice01', email: 'a@b.co', signature: 'sig', password: 'abcde',
          confirmPassword: 'x' };
      const exists: boolean = true;
      const result: RegisterResult = AccountValidator.validateRegister(input, exists);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(RegisterResult.ACCOUNT_EXISTS));
      expect(result).assertEqual(RegisterResult.ACCOUNT_EXISTS);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(2));
      expect(Number(result)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateRegister(input, false)), String(RegisterResult.PASSWORD_TOO_SHORT));
      expect(AccountValidator.validateRegister(input, false)).assertEqual(RegisterResult.PASSWORD_TOO_SHORT);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010180 end');
    })

    /**
     * @tc.name   testRegisterPriority010181
     * @tc.number SUB_ACCT_VALREG_0181
     * @tc.desc   password of one char -> PASSWORD_TOO_SHORT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterPriority010181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010181 begin');
      const input: RegisterInput = { username: 'alice01', email: 'a@b.co', signature: 'sig', password: 'a',
          confirmPassword: 'a' };
      const exists: boolean = false;
      const result: RegisterResult = AccountValidator.validateRegister(input, exists);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(RegisterResult.PASSWORD_TOO_SHORT));
      expect(result).assertEqual(RegisterResult.PASSWORD_TOO_SHORT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(5));
      expect(Number(result)).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateRegister(input, true)), String(RegisterResult.ACCOUNT_EXISTS));
      expect(AccountValidator.validateRegister(input, true)).assertEqual(RegisterResult.ACCOUNT_EXISTS);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010181 end');
    })

    /**
     * @tc.name   testRegisterPriority010182
     * @tc.number SUB_ACCT_VALREG_0182
     * @tc.desc   password of two chars -> PASSWORD_TOO_SHORT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterPriority010182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010182 begin');
      const input: RegisterInput = { username: 'alice01', email: 'a@b.co', signature: 'sig', password: 'ab',
          confirmPassword: 'ab' };
      const exists: boolean = false;
      const result: RegisterResult = AccountValidator.validateRegister(input, exists);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(RegisterResult.PASSWORD_TOO_SHORT));
      expect(result).assertEqual(RegisterResult.PASSWORD_TOO_SHORT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(5));
      expect(Number(result)).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateRegister(input, true)), String(RegisterResult.ACCOUNT_EXISTS));
      expect(AccountValidator.validateRegister(input, true)).assertEqual(RegisterResult.ACCOUNT_EXISTS);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010182 end');
    })

    /**
     * @tc.name   testRegisterPriority010183
     * @tc.number SUB_ACCT_VALREG_0183
     * @tc.desc   password of three chars -> PASSWORD_TOO_SHORT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterPriority010183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010183 begin');
      const input: RegisterInput = { username: 'alice01', email: 'a@b.co', signature: 'sig', password: 'abc',
          confirmPassword: 'abc' };
      const exists: boolean = false;
      const result: RegisterResult = AccountValidator.validateRegister(input, exists);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(RegisterResult.PASSWORD_TOO_SHORT));
      expect(result).assertEqual(RegisterResult.PASSWORD_TOO_SHORT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(5));
      expect(Number(result)).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateRegister(input, true)), String(RegisterResult.ACCOUNT_EXISTS));
      expect(AccountValidator.validateRegister(input, true)).assertEqual(RegisterResult.ACCOUNT_EXISTS);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010183 end');
    })

    /**
     * @tc.name   testRegisterPriority010184
     * @tc.number SUB_ACCT_VALREG_0184
     * @tc.desc   password of four chars -> PASSWORD_TOO_SHORT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterPriority010184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010184 begin');
      const input: RegisterInput = { username: 'alice01', email: 'a@b.co', signature: 'sig', password: 'abcd',
          confirmPassword: 'abcd' };
      const exists: boolean = false;
      const result: RegisterResult = AccountValidator.validateRegister(input, exists);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(RegisterResult.PASSWORD_TOO_SHORT));
      expect(result).assertEqual(RegisterResult.PASSWORD_TOO_SHORT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(5));
      expect(Number(result)).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateRegister(input, true)), String(RegisterResult.ACCOUNT_EXISTS));
      expect(AccountValidator.validateRegister(input, true)).assertEqual(RegisterResult.ACCOUNT_EXISTS);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010184 end');
    })

    /**
     * @tc.name   testRegisterPriority010185
     * @tc.number SUB_ACCT_VALREG_0185
     * @tc.desc   password of six chars reaches the limit -> OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterPriority010185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010185 begin');
      const input: RegisterInput = { username: 'alice01', email: 'a@b.co', signature: 'sig', password: 'abcdef',
          confirmPassword: 'abcdef' };
      const exists: boolean = false;
      const result: RegisterResult = AccountValidator.validateRegister(input, exists);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(RegisterResult.OK));
      expect(result).assertEqual(RegisterResult.OK);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(0));
      expect(Number(result)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateRegister(input, true)), String(RegisterResult.ACCOUNT_EXISTS));
      expect(AccountValidator.validateRegister(input, true)).assertEqual(RegisterResult.ACCOUNT_EXISTS);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010185 end');
    })

    /**
     * @tc.name   testRegisterPriority010186
     * @tc.number SUB_ACCT_VALREG_0186
     * @tc.desc   password of seven chars -> OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterPriority010186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010186 begin');
      const input: RegisterInput = { username: 'alice01', email: 'a@b.co', signature: 'sig', password: 'abcdefg',
          confirmPassword: 'abcdefg' };
      const exists: boolean = false;
      const result: RegisterResult = AccountValidator.validateRegister(input, exists);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(RegisterResult.OK));
      expect(result).assertEqual(RegisterResult.OK);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(0));
      expect(Number(result)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateRegister(input, true)), String(RegisterResult.ACCOUNT_EXISTS));
      expect(AccountValidator.validateRegister(input, true)).assertEqual(RegisterResult.ACCOUNT_EXISTS);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010186 end');
    })

    /**
     * @tc.name   testRegisterPriority010187
     * @tc.number SUB_ACCT_VALREG_0187
     * @tc.desc   password with an inner space -> OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterPriority010187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010187 begin');
      const input: RegisterInput = { username: 'alice01', email: 'a@b.co', signature: 'sig', password: 'sec ret',
          confirmPassword: 'sec ret' };
      const exists: boolean = false;
      const result: RegisterResult = AccountValidator.validateRegister(input, exists);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(RegisterResult.OK));
      expect(result).assertEqual(RegisterResult.OK);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(0));
      expect(Number(result)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateRegister(input, true)), String(RegisterResult.ACCOUNT_EXISTS));
      expect(AccountValidator.validateRegister(input, true)).assertEqual(RegisterResult.ACCOUNT_EXISTS);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010187 end');
    })

    /**
     * @tc.name   testRegisterPriority010188
     * @tc.number SUB_ACCT_VALREG_0188
     * @tc.desc   password of six ascii chars -> OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterPriority010188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010188 begin');
      const input: RegisterInput = { username: 'alice01', email: 'a@b.co', signature: 'sig', password: 'abcdef',
          confirmPassword: 'abcdef' };
      const exists: boolean = false;
      const result: RegisterResult = AccountValidator.validateRegister(input, exists);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(RegisterResult.OK));
      expect(result).assertEqual(RegisterResult.OK);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(0));
      expect(Number(result)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateRegister(input, true)), String(RegisterResult.ACCOUNT_EXISTS));
      expect(AccountValidator.validateRegister(input, true)).assertEqual(RegisterResult.ACCOUNT_EXISTS);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010188 end');
    })

    /**
     * @tc.name   testRegisterPriority010189
     * @tc.number SUB_ACCT_VALREG_0189
     * @tc.desc   top level domain of one char is rejected -> EMAIL_INVALID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterPriority010189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010189 begin');
      const input: RegisterInput = { username: 'alice01', email: 'a@b.c', signature: 'sig', password: 'secret1',
          confirmPassword: 'secret1' };
      const exists: boolean = false;
      const result: RegisterResult = AccountValidator.validateRegister(input, exists);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(RegisterResult.EMAIL_INVALID));
      expect(result).assertEqual(RegisterResult.EMAIL_INVALID);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(3));
      expect(Number(result)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateRegister(input, true)), String(RegisterResult.ACCOUNT_EXISTS));
      expect(AccountValidator.validateRegister(input, true)).assertEqual(RegisterResult.ACCOUNT_EXISTS);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010189 end');
    })

    /**
     * @tc.name   testRegisterPriority010190
     * @tc.number SUB_ACCT_VALREG_0190
     * @tc.desc   top level domain of two chars is accepted -> OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterPriority010190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010190 begin');
      const input: RegisterInput = { username: 'alice01', email: 'a@b.co', signature: 'sig', password: 'secret1',
          confirmPassword: 'secret1' };
      const exists: boolean = false;
      const result: RegisterResult = AccountValidator.validateRegister(input, exists);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(RegisterResult.OK));
      expect(result).assertEqual(RegisterResult.OK);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(0));
      expect(Number(result)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateRegister(input, true)), String(RegisterResult.ACCOUNT_EXISTS));
      expect(AccountValidator.validateRegister(input, true)).assertEqual(RegisterResult.ACCOUNT_EXISTS);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010190 end');
    })

    /**
     * @tc.name   testRegisterPriority010191
     * @tc.number SUB_ACCT_VALREG_0191
     * @tc.desc   top level domain of three chars is accepted -> OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterPriority010191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010191 begin');
      const input: RegisterInput = { username: 'alice01', email: 'a@b.com', signature: 'sig', password: 'secret1',
          confirmPassword: 'secret1' };
      const exists: boolean = false;
      const result: RegisterResult = AccountValidator.validateRegister(input, exists);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(RegisterResult.OK));
      expect(result).assertEqual(RegisterResult.OK);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(0));
      expect(Number(result)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateRegister(input, true)), String(RegisterResult.ACCOUNT_EXISTS));
      expect(AccountValidator.validateRegister(input, true)).assertEqual(RegisterResult.ACCOUNT_EXISTS);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010191 end');
    })

    /**
     * @tc.name   testRegisterPriority010192
     * @tc.number SUB_ACCT_VALREG_0192
     * @tc.desc   top level domain of five chars is accepted -> OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterPriority010192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010192 begin');
      const input: RegisterInput = { username: 'alice01', email: 'a@b.abcde', signature: 'sig', password: 'secret1',
          confirmPassword: 'secret1' };
      const exists: boolean = false;
      const result: RegisterResult = AccountValidator.validateRegister(input, exists);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(RegisterResult.OK));
      expect(result).assertEqual(RegisterResult.OK);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(0));
      expect(Number(result)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateRegister(input, true)), String(RegisterResult.ACCOUNT_EXISTS));
      expect(AccountValidator.validateRegister(input, true)).assertEqual(RegisterResult.ACCOUNT_EXISTS);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010192 end');
    })

    /**
     * @tc.name   testRegisterPriority010193
     * @tc.number SUB_ACCT_VALREG_0193
     * @tc.desc   top level domain of seven chars is rejected -> EMAIL_INVALID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterPriority010193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010193 begin');
      const input: RegisterInput = { username: 'alice01', email: 'a@b.abcdefg', signature: 'sig', password: 'secret1',
          confirmPassword: 'secret1' };
      const exists: boolean = false;
      const result: RegisterResult = AccountValidator.validateRegister(input, exists);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(RegisterResult.EMAIL_INVALID));
      expect(result).assertEqual(RegisterResult.EMAIL_INVALID);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(3));
      expect(Number(result)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateRegister(input, true)), String(RegisterResult.ACCOUNT_EXISTS));
      expect(AccountValidator.validateRegister(input, true)).assertEqual(RegisterResult.ACCOUNT_EXISTS);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010193 end');
    })

    /**
     * @tc.name   testRegisterPriority010194
     * @tc.number SUB_ACCT_VALREG_0194
     * @tc.desc   two at signs are rejected -> EMAIL_INVALID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterPriority010194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010194 begin');
      const input: RegisterInput = { username: 'alice01', email: 'a@b@c.co', signature: 'sig', password: 'secret1',
          confirmPassword: 'secret1' };
      const exists: boolean = false;
      const result: RegisterResult = AccountValidator.validateRegister(input, exists);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(RegisterResult.EMAIL_INVALID));
      expect(result).assertEqual(RegisterResult.EMAIL_INVALID);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(3));
      expect(Number(result)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateRegister(input, true)), String(RegisterResult.ACCOUNT_EXISTS));
      expect(AccountValidator.validateRegister(input, true)).assertEqual(RegisterResult.ACCOUNT_EXISTS);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010194 end');
    })

    /**
     * @tc.name   testRegisterPriority010195
     * @tc.number SUB_ACCT_VALREG_0195
     * @tc.desc   dots and hyphens on both sides -> OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterPriority010195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010195 begin');
      const input: RegisterInput = { username: 'alice01', email: 'a.b-c@d-e.fg', signature: 'sig', password: 'secret1',
          confirmPassword: 'secret1' };
      const exists: boolean = false;
      const result: RegisterResult = AccountValidator.validateRegister(input, exists);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(RegisterResult.OK));
      expect(result).assertEqual(RegisterResult.OK);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(0));
      expect(Number(result)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateRegister(input, true)), String(RegisterResult.ACCOUNT_EXISTS));
      expect(AccountValidator.validateRegister(input, true)).assertEqual(RegisterResult.ACCOUNT_EXISTS);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010195 end');
    })

    /**
     * @tc.name   testRegisterPriority010196
     * @tc.number SUB_ACCT_VALREG_0196
     * @tc.desc   subdomain with underscore local part -> OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterPriority010196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010196 begin');
      const input: RegisterInput = { username: 'alice01', email: 'x_1@sub.example.co', signature: 'sig',
          password: 'secret1', confirmPassword: 'secret1' };
      const exists: boolean = false;
      const result: RegisterResult = AccountValidator.validateRegister(input, exists);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(RegisterResult.OK));
      expect(result).assertEqual(RegisterResult.OK);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(0));
      expect(Number(result)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateRegister(input, true)), String(RegisterResult.ACCOUNT_EXISTS));
      expect(AccountValidator.validateRegister(input, true)).assertEqual(RegisterResult.ACCOUNT_EXISTS);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010196 end');
    })

    /**
     * @tc.name   testRegisterPriority010197
     * @tc.number SUB_ACCT_VALREG_0197
     * @tc.desc   single char username is accepted by the rule -> OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterPriority010197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010197 begin');
      const input: RegisterInput = { username: 'a', email: 'a@b.co', signature: 'sig', password: 'secret1',
          confirmPassword: 'secret1' };
      const exists: boolean = false;
      const result: RegisterResult = AccountValidator.validateRegister(input, exists);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(RegisterResult.OK));
      expect(result).assertEqual(RegisterResult.OK);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(0));
      expect(Number(result)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateRegister(input, true)), String(RegisterResult.ACCOUNT_EXISTS));
      expect(AccountValidator.validateRegister(input, true)).assertEqual(RegisterResult.ACCOUNT_EXISTS);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010197 end');
    })

    /**
     * @tc.name   testRegisterPriority010198
     * @tc.number SUB_ACCT_VALREG_0198
     * @tc.desc   fifteen char username stays valid -> OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterPriority010198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010198 begin');
      const input: RegisterInput = { username: 'abcdefghijklmno', email: 'a@b.co', signature: 'sig',
          password: 'secret1', confirmPassword: 'secret1' };
      const exists: boolean = false;
      const result: RegisterResult = AccountValidator.validateRegister(input, exists);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(RegisterResult.OK));
      expect(result).assertEqual(RegisterResult.OK);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(0));
      expect(Number(result)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateRegister(input, true)), String(RegisterResult.ACCOUNT_EXISTS));
      expect(AccountValidator.validateRegister(input, true)).assertEqual(RegisterResult.ACCOUNT_EXISTS);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010198 end');
    })

    /**
     * @tc.name   testRegisterPriority010199
     * @tc.number SUB_ACCT_VALREG_0199
     * @tc.desc   sixteen char username is not length checked here -> OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterPriority010199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010199 begin');
      const input: RegisterInput = { username: 'abcdefghijklmnop', email: 'a@b.co', signature: 'sig',
          password: 'secret1', confirmPassword: 'secret1' };
      const exists: boolean = false;
      const result: RegisterResult = AccountValidator.validateRegister(input, exists);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(RegisterResult.OK));
      expect(result).assertEqual(RegisterResult.OK);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(0));
      expect(Number(result)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateRegister(input, true)), String(RegisterResult.ACCOUNT_EXISTS));
      expect(AccountValidator.validateRegister(input, true)).assertEqual(RegisterResult.ACCOUNT_EXISTS);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010199 end');
    })

    /**
     * @tc.name   testRegisterPriority010200
     * @tc.number SUB_ACCT_VALREG_0200
     * @tc.desc   confirm differs only by case -> CONFIRM_MISMATCH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterPriority010200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010200 begin');
      const input: RegisterInput = { username: 'alice01', email: 'a@b.co', signature: 'sig', password: 'Secret1',
          confirmPassword: 'secret1' };
      const exists: boolean = false;
      const result: RegisterResult = AccountValidator.validateRegister(input, exists);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(RegisterResult.CONFIRM_MISMATCH));
      expect(result).assertEqual(RegisterResult.CONFIRM_MISMATCH);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(6));
      expect(Number(result)).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateRegister(input, true)), String(RegisterResult.ACCOUNT_EXISTS));
      expect(AccountValidator.validateRegister(input, true)).assertEqual(RegisterResult.ACCOUNT_EXISTS);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010200 end');
    })

    /**
     * @tc.name   testRegisterPriority010201
     * @tc.number SUB_ACCT_VALREG_0201
     * @tc.desc   blank signature keeps the result -> OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterPriority010201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010201 begin');
      const input: RegisterInput = { username: 'alice01', email: 'a@b.co', signature: '', password: 'secret1',
          confirmPassword: 'secret1' };
      const exists: boolean = false;
      const result: RegisterResult = AccountValidator.validateRegister(input, exists);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(RegisterResult.OK));
      expect(result).assertEqual(RegisterResult.OK);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(0));
      expect(Number(result)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateRegister(input, true)), String(RegisterResult.ACCOUNT_EXISTS));
      expect(AccountValidator.validateRegister(input, true)).assertEqual(RegisterResult.ACCOUNT_EXISTS);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010201 end');
    })

    /**
     * @tc.name   testRegisterPriority010202
     * @tc.number SUB_ACCT_VALREG_0202
     * @tc.desc   signature with chinese chars keeps the result -> OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterPriority010202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010202 begin');
      const input: RegisterInput = { username: 'alice01', email: 'a@b.co', signature: '签名', password: 'secret1',
          confirmPassword: 'secret1' };
      const exists: boolean = false;
      const result: RegisterResult = AccountValidator.validateRegister(input, exists);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(RegisterResult.OK));
      expect(result).assertEqual(RegisterResult.OK);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(0));
      expect(Number(result)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateRegister(input, true)), String(RegisterResult.ACCOUNT_EXISTS));
      expect(AccountValidator.validateRegister(input, true)).assertEqual(RegisterResult.ACCOUNT_EXISTS);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010202 end');
    })

    /**
     * @tc.name   testRegisterPriority010203
     * @tc.number SUB_ACCT_VALREG_0203
     * @tc.desc   six cjk chars satisfy the length rule -> OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterPriority010203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010203 begin');
      const input: RegisterInput = { username: 'alice01', email: 'a@b.co', signature: 'sig', password: '密码密码密码',
          confirmPassword: '密码密码密码' };
      const exists: boolean = false;
      const result: RegisterResult = AccountValidator.validateRegister(input, exists);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(RegisterResult.OK));
      expect(result).assertEqual(RegisterResult.OK);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(0));
      expect(Number(result)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateRegister(input, true)), String(RegisterResult.ACCOUNT_EXISTS));
      expect(AccountValidator.validateRegister(input, true)).assertEqual(RegisterResult.ACCOUNT_EXISTS);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010203 end');
    })

    /**
     * @tc.name   testRegisterPriority010204
     * @tc.number SUB_ACCT_VALREG_0204
     * @tc.desc   five ascii plus cjk stays short -> OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterPriority010204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010204 begin');
      const input: RegisterInput = { username: 'alice01', email: 'a@b.co', signature: 'sig', password: 'abcde密码',
          confirmPassword: 'abcde密码' };
      const exists: boolean = false;
      const result: RegisterResult = AccountValidator.validateRegister(input, exists);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(RegisterResult.OK));
      expect(result).assertEqual(RegisterResult.OK);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(0));
      expect(Number(result)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateRegister(input, true)), String(RegisterResult.ACCOUNT_EXISTS));
      expect(AccountValidator.validateRegister(input, true)).assertEqual(RegisterResult.ACCOUNT_EXISTS);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010204 end');
    })

    /**
     * @tc.name   testRegisterPriority010205
     * @tc.number SUB_ACCT_VALREG_0205
     * @tc.desc   upper case mailbox is accepted -> OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterPriority010205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010205 begin');
      const input: RegisterInput = { username: 'alice01', email: 'A@B.CO', signature: 'sig', password: 'secret1',
          confirmPassword: 'secret1' };
      const exists: boolean = false;
      const result: RegisterResult = AccountValidator.validateRegister(input, exists);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(RegisterResult.OK));
      expect(result).assertEqual(RegisterResult.OK);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(0));
      expect(Number(result)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateRegister(input, true)), String(RegisterResult.ACCOUNT_EXISTS));
      expect(AccountValidator.validateRegister(input, true)).assertEqual(RegisterResult.ACCOUNT_EXISTS);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010205 end');
    })

    /**
     * @tc.name   testRegisterPriority010206
     * @tc.number SUB_ACCT_VALREG_0206
     * @tc.desc   trailing space inside password is kept -> OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterPriority010206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010206 begin');
      const input: RegisterInput = { username: 'alice01', email: 'a@b.co', signature: 'sig', password: 'secret1 ',
          confirmPassword: 'secret1 ' };
      const exists: boolean = false;
      const result: RegisterResult = AccountValidator.validateRegister(input, exists);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(RegisterResult.OK));
      expect(result).assertEqual(RegisterResult.OK);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(0));
      expect(Number(result)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateRegister(input, true)), String(RegisterResult.ACCOUNT_EXISTS));
      expect(AccountValidator.validateRegister(input, true)).assertEqual(RegisterResult.ACCOUNT_EXISTS);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010206 end');
    })

    /**
     * @tc.name   testRegisterPriority010207
     * @tc.number SUB_ACCT_VALREG_0207
     * @tc.desc   twenty char password is accepted -> OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterPriority010207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010207 begin');
      const input: RegisterInput = { username: 'alice01', email: 'a@b.co', signature: 'sig',
          password: 'secret12345678901234', confirmPassword: 'secret12345678901234' };
      const exists: boolean = false;
      const result: RegisterResult = AccountValidator.validateRegister(input, exists);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(RegisterResult.OK));
      expect(result).assertEqual(RegisterResult.OK);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(0));
      expect(Number(result)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateRegister(input, true)), String(RegisterResult.ACCOUNT_EXISTS));
      expect(AccountValidator.validateRegister(input, true)).assertEqual(RegisterResult.ACCOUNT_EXISTS);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010207 end');
    })

    /**
     * @tc.name   testRegisterPriority010208
     * @tc.number SUB_ACCT_VALREG_0208
     * @tc.desc   confirm with an extra char is rejected -> CONFIRM_MISMATCH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterPriority010208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010208 begin');
      const input: RegisterInput = { username: 'alice01', email: 'a@b.co', signature: 'sig', password: 'secret1',
          confirmPassword: 'secret1x' };
      const exists: boolean = false;
      const result: RegisterResult = AccountValidator.validateRegister(input, exists);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(RegisterResult.CONFIRM_MISMATCH));
      expect(result).assertEqual(RegisterResult.CONFIRM_MISMATCH);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(6));
      expect(Number(result)).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateRegister(input, true)), String(RegisterResult.ACCOUNT_EXISTS));
      expect(AccountValidator.validateRegister(input, true)).assertEqual(RegisterResult.ACCOUNT_EXISTS);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010208 end');
    })


    /**
     * @tc.name   testRegisterPriority010209
     * @tc.number SUB_ACCT_VALREG_0209
     * @tc.desc   用户名空、账号已存在、邮箱非法、密码过短同时成立时只返回 USERNAME_EMPTY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterPriority010209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010209 begin');
      const input: RegisterInput = { username: '', email: 'bad@', signature: 'sig', password: 'abc',
          confirmPassword: 'xyz' };
      const result: RegisterResult = AccountValidator.validateRegister(input, true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), 'USERNAME_EMPTY');
      expect(result).assertEqual(RegisterResult.USERNAME_EMPTY);
      expect(Number(result)).assertEqual(1);
      expect(result === RegisterResult.ACCOUNT_EXISTS).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010209 end');
    });

    /**
     * @tc.name   testRegisterPriority010210
     * @tc.number SUB_ACCT_VALREG_0210
     * @tc.desc   密码五位且两次输入不一致时，长度判定先于一致性判定
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterPriority010210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010210 begin');
      const input: RegisterInput = { username: 'bob01', email: 'b@c.de', signature: 'sig', password: 'abcde',
          confirmPassword: 'abcdf' };
      const result: RegisterResult = AccountValidator.validateRegister(input, false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), 'PASSWORD_TOO_SHORT');
      expect(result).assertEqual(RegisterResult.PASSWORD_TOO_SHORT);
      expect(result === RegisterResult.CONFIRM_MISMATCH).assertFalse();
      expect(Number(result)).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010210 end');
    });

    /**
     * @tc.name   testRegisterPriority010211
     * @tc.number SUB_ACCT_VALREG_0211
     * @tc.desc   用例主流程：邮箱留空时跳过邮箱校验，密码为空则只报 PASSWORD_EMPTY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterPriority010211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010211 begin');
      const input: RegisterInput = { username: 'bob02', email: '', signature: '', password: '', confirmPassword: '' };
      const result: RegisterResult = AccountValidator.validateRegister(input, false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), 'PASSWORD_EMPTY');
      expect(result).assertEqual(RegisterResult.PASSWORD_EMPTY);
      expect(result === RegisterResult.EMAIL_INVALID).assertFalse();
      expect(Number(result)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRegisterPriority010211 end');
    });
  })
}
