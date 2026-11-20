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
import { AccountValidator, LoginInput, LoginResult } from '../../../main/ets/model/AccountValidator';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function loginMatrix01Test() {
  describe('LoginMatrix01Test', () => {

    /**
     * @tc.name   testLoginMatrix010001
     * @tc.number SUB_ACCT_VALLOG_0001
     * @tc.desc   blank name with a coherent password -> NAME_EMPTY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLoginMatrix010001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLoginMatrix010001 begin');
      const input: LoginInput = { name: '', password: 'secret1' };
      const stored: string = 'secret1';
      const flag: string = 'true';
      const result: LoginResult = AccountValidator.validateLogin(input, stored, flag);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(LoginResult.NAME_EMPTY));
      expect(result).assertEqual(LoginResult.NAME_EMPTY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(1));
      expect(Number(result)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateLogin(input, stored, 'false')), String(LoginResult.NAME_EMPTY));
      expect(AccountValidator.validateLogin(input, stored, 'false')).assertEqual(LoginResult.NAME_EMPTY);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLoginMatrix010001 end');
    })

    /**
     * @tc.name   testLoginMatrix010002
     * @tc.number SUB_ACCT_VALLOG_0002
     * @tc.desc   blank name and blank password -> NAME_EMPTY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLoginMatrix010002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLoginMatrix010002 begin');
      const input: LoginInput = { name: '', password: '' };
      const stored: string = '';
      const flag: string = '  ';
      const result: LoginResult = AccountValidator.validateLogin(input, stored, flag);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(LoginResult.NAME_EMPTY));
      expect(result).assertEqual(LoginResult.NAME_EMPTY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(1));
      expect(Number(result)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateLogin(input, stored, 'true')), String(LoginResult.NAME_EMPTY));
      expect(AccountValidator.validateLogin(input, stored, 'true')).assertEqual(LoginResult.NAME_EMPTY);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLoginMatrix010002 end');
    })

    /**
     * @tc.name   testLoginMatrix010003
     * @tc.number SUB_ACCT_VALLOG_0003
     * @tc.desc   blank password with a coherent stored value -> PASSWORD_EMPTY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLoginMatrix010003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLoginMatrix010003 begin');
      const input: LoginInput = { name: 'alice01', password: '' };
      const stored: string = 'secret1';
      const flag: string = 'true';
      const result: LoginResult = AccountValidator.validateLogin(input, stored, flag);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(LoginResult.PASSWORD_EMPTY));
      expect(result).assertEqual(LoginResult.PASSWORD_EMPTY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(2));
      expect(Number(result)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateLogin(input, stored, 'false')), String(LoginResult.PASSWORD_EMPTY));
      expect(AccountValidator.validateLogin(input, stored, 'false')).assertEqual(LoginResult.PASSWORD_EMPTY);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLoginMatrix010003 end');
    })

    /**
     * @tc.name   testLoginMatrix010004
     * @tc.number SUB_ACCT_VALLOG_0004
     * @tc.desc   blank password and blank stored value -> PASSWORD_EMPTY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLoginMatrix010004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLoginMatrix010004 begin');
      const input: LoginInput = { name: 'alice01', password: '' };
      const stored: string = '';
      const flag: string = '  ';
      const result: LoginResult = AccountValidator.validateLogin(input, stored, flag);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(LoginResult.PASSWORD_EMPTY));
      expect(result).assertEqual(LoginResult.PASSWORD_EMPTY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(2));
      expect(Number(result)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateLogin(input, stored, 'true')), String(LoginResult.PASSWORD_EMPTY));
      expect(AccountValidator.validateLogin(input, stored, 'true')).assertEqual(LoginResult.PASSWORD_EMPTY);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLoginMatrix010004 end');
    })

    /**
     * @tc.name   testLoginMatrix010005
     * @tc.number SUB_ACCT_VALLOG_0005
     * @tc.desc   matching password and true flag -> OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLoginMatrix010005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLoginMatrix010005 begin');
      const input: LoginInput = { name: 'alice01', password: 'secret1' };
      const stored: string = 'secret1';
      const flag: string = 'true';
      const result: LoginResult = AccountValidator.validateLogin(input, stored, flag);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(LoginResult.OK));
      expect(result).assertEqual(LoginResult.OK);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(0));
      expect(Number(result)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateLogin(input, stored, 'false')), String(LoginResult.FAILED));
      expect(AccountValidator.validateLogin(input, stored, 'false')).assertEqual(LoginResult.FAILED);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLoginMatrix010005 end');
    })

    /**
     * @tc.name   testLoginMatrix010006
     * @tc.number SUB_ACCT_VALLOG_0006
     * @tc.desc   matching password but false flag -> FAILED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLoginMatrix010006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLoginMatrix010006 begin');
      const input: LoginInput = { name: 'alice01', password: 'secret1' };
      const stored: string = 'secret1';
      const flag: string = 'false';
      const result: LoginResult = AccountValidator.validateLogin(input, stored, flag);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(LoginResult.FAILED));
      expect(result).assertEqual(LoginResult.FAILED);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(3));
      expect(Number(result)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateLogin(input, stored, 'true')), String(LoginResult.OK));
      expect(AccountValidator.validateLogin(input, stored, 'true')).assertEqual(LoginResult.OK);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLoginMatrix010006 end');
    })

    /**
     * @tc.name   testLoginMatrix010007
     * @tc.number SUB_ACCT_VALLOG_0007
     * @tc.desc   matching password but blank flag -> FAILED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLoginMatrix010007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLoginMatrix010007 begin');
      const input: LoginInput = { name: 'alice01', password: 'secret1' };
      const stored: string = 'secret1';
      const flag: string = '';
      const result: LoginResult = AccountValidator.validateLogin(input, stored, flag);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(LoginResult.FAILED));
      expect(result).assertEqual(LoginResult.FAILED);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(3));
      expect(Number(result)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateLogin(input, stored, 'true')), String(LoginResult.OK));
      expect(AccountValidator.validateLogin(input, stored, 'true')).assertEqual(LoginResult.OK);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLoginMatrix010007 end');
    })

    /**
     * @tc.name   testLoginMatrix010008
     * @tc.number SUB_ACCT_VALLOG_0008
     * @tc.desc   matching password but upper case flag -> FAILED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLoginMatrix010008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLoginMatrix010008 begin');
      const input: LoginInput = { name: 'alice01', password: 'secret1' };
      const stored: string = 'secret1';
      const flag: string = 'TRUE';
      const result: LoginResult = AccountValidator.validateLogin(input, stored, flag);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(LoginResult.FAILED));
      expect(result).assertEqual(LoginResult.FAILED);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(3));
      expect(Number(result)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateLogin(input, stored, 'true')), String(LoginResult.OK));
      expect(AccountValidator.validateLogin(input, stored, 'true')).assertEqual(LoginResult.OK);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLoginMatrix010008 end');
    })

    /**
     * @tc.name   testLoginMatrix010009
     * @tc.number SUB_ACCT_VALLOG_0009
     * @tc.desc   stored value differs -> FAILED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLoginMatrix010009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLoginMatrix010009 begin');
      const input: LoginInput = { name: 'alice01', password: 'secret1' };
      const stored: string = 'other99';
      const flag: string = 'true';
      const result: LoginResult = AccountValidator.validateLogin(input, stored, flag);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(LoginResult.FAILED));
      expect(result).assertEqual(LoginResult.FAILED);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(3));
      expect(Number(result)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateLogin(input, stored, 'false')), String(LoginResult.FAILED));
      expect(AccountValidator.validateLogin(input, stored, 'false')).assertEqual(LoginResult.FAILED);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLoginMatrix010009 end');
    })

    /**
     * @tc.name   testLoginMatrix010010
     * @tc.number SUB_ACCT_VALLOG_0010
     * @tc.desc   stored value blank -> FAILED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLoginMatrix010010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLoginMatrix010010 begin');
      const input: LoginInput = { name: 'alice01', password: 'secret1' };
      const stored: string = '';
      const flag: string = 'true';
      const result: LoginResult = AccountValidator.validateLogin(input, stored, flag);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(LoginResult.FAILED));
      expect(result).assertEqual(LoginResult.FAILED);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(3));
      expect(Number(result)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateLogin(input, stored, 'false')), String(LoginResult.FAILED));
      expect(AccountValidator.validateLogin(input, stored, 'false')).assertEqual(LoginResult.FAILED);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLoginMatrix010010 end');
    })

    /**
     * @tc.name   testLoginMatrix010011
     * @tc.number SUB_ACCT_VALLOG_0011
     * @tc.desc   stored value has one extra char -> FAILED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLoginMatrix010011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLoginMatrix010011 begin');
      const input: LoginInput = { name: 'alice01', password: 'secret1' };
      const stored: string = 'secret1x';
      const flag: string = 'true';
      const result: LoginResult = AccountValidator.validateLogin(input, stored, flag);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(LoginResult.FAILED));
      expect(result).assertEqual(LoginResult.FAILED);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(3));
      expect(Number(result)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateLogin(input, stored, 'false')), String(LoginResult.FAILED));
      expect(AccountValidator.validateLogin(input, stored, 'false')).assertEqual(LoginResult.FAILED);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLoginMatrix010011 end');
    })

    /**
     * @tc.name   testLoginMatrix010012
     * @tc.number SUB_ACCT_VALLOG_0012
     * @tc.desc   both stored and flag differ -> FAILED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLoginMatrix010012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLoginMatrix010012 begin');
      const input: LoginInput = { name: 'alice01', password: 'secret1' };
      const stored: string = 'secret2';
      const flag: string = 'false';
      const result: LoginResult = AccountValidator.validateLogin(input, stored, flag);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(LoginResult.FAILED));
      expect(result).assertEqual(LoginResult.FAILED);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(3));
      expect(Number(result)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateLogin(input, stored, 'true')), String(LoginResult.FAILED));
      expect(AccountValidator.validateLogin(input, stored, 'true')).assertEqual(LoginResult.FAILED);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLoginMatrix010012 end');
    })

    /**
     * @tc.name   testLoginMatrix010013
     * @tc.number SUB_ACCT_VALLOG_0013
     * @tc.desc   single char password with blank stored -> FAILED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLoginMatrix010013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLoginMatrix010013 begin');
      const input: LoginInput = { name: 'alice01', password: 'a' };
      const stored: string = '';
      const flag: string = 'true';
      const result: LoginResult = AccountValidator.validateLogin(input, stored, flag);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(LoginResult.FAILED));
      expect(result).assertEqual(LoginResult.FAILED);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(3));
      expect(Number(result)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateLogin(input, stored, 'false')), String(LoginResult.FAILED));
      expect(AccountValidator.validateLogin(input, stored, 'false')).assertEqual(LoginResult.FAILED);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLoginMatrix010013 end');
    })

    /**
     * @tc.name   testLoginMatrix010014
     * @tc.number SUB_ACCT_VALLOG_0014
     * @tc.desc   six char password matches -> OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLoginMatrix010014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLoginMatrix010014 begin');
      const input: LoginInput = { name: 'alice01', password: 'abcdef' };
      const stored: string = 'abcdef';
      const flag: string = 'true';
      const result: LoginResult = AccountValidator.validateLogin(input, stored, flag);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(LoginResult.OK));
      expect(result).assertEqual(LoginResult.OK);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(0));
      expect(Number(result)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateLogin(input, stored, 'false')), String(LoginResult.FAILED));
      expect(AccountValidator.validateLogin(input, stored, 'false')).assertEqual(LoginResult.FAILED);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLoginMatrix010014 end');
    })

    /**
     * @tc.name   testLoginMatrix010015
     * @tc.number SUB_ACCT_VALLOG_0015
     * @tc.desc   six cjk chars match -> OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLoginMatrix010015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLoginMatrix010015 begin');
      const input: LoginInput = { name: 'alice01', password: '密码密码密码' };
      const stored: string = '密码密码密码';
      const flag: string = 'true';
      const result: LoginResult = AccountValidator.validateLogin(input, stored, flag);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(LoginResult.OK));
      expect(result).assertEqual(LoginResult.OK);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(0));
      expect(Number(result)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateLogin(input, stored, 'false')), String(LoginResult.FAILED));
      expect(AccountValidator.validateLogin(input, stored, 'false')).assertEqual(LoginResult.FAILED);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLoginMatrix010015 end');
    })

    /**
     * @tc.name   testLoginMatrix010016
     * @tc.number SUB_ACCT_VALLOG_0016
     * @tc.desc   trailing space kept on both sides -> OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLoginMatrix010016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLoginMatrix010016 begin');
      const input: LoginInput = { name: 'alice01', password: 'secret1 ' };
      const stored: string = 'secret1 ';
      const flag: string = 'true';
      const result: LoginResult = AccountValidator.validateLogin(input, stored, flag);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(LoginResult.OK));
      expect(result).assertEqual(LoginResult.OK);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(0));
      expect(Number(result)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateLogin(input, stored, 'false')), String(LoginResult.FAILED));
      expect(AccountValidator.validateLogin(input, stored, 'false')).assertEqual(LoginResult.FAILED);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLoginMatrix010016 end');
    })

    /**
     * @tc.name   testLoginMatrix010017
     * @tc.number SUB_ACCT_VALLOG_0017
     * @tc.desc   trailing space only on the stored value -> FAILED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLoginMatrix010017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLoginMatrix010017 begin');
      const input: LoginInput = { name: 'alice01', password: 'secret1' };
      const stored: string = 'secret1 ';
      const flag: string = 'true';
      const result: LoginResult = AccountValidator.validateLogin(input, stored, flag);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(LoginResult.FAILED));
      expect(result).assertEqual(LoginResult.FAILED);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(3));
      expect(Number(result)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateLogin(input, stored, 'false')), String(LoginResult.FAILED));
      expect(AccountValidator.validateLogin(input, stored, 'false')).assertEqual(LoginResult.FAILED);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLoginMatrix010017 end');
    })

    /**
     * @tc.name   testLoginMatrix010018
     * @tc.number SUB_ACCT_VALLOG_0018
     * @tc.desc   mixed case password matches -> OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLoginMatrix010018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLoginMatrix010018 begin');
      const input: LoginInput = { name: 'alice01', password: 'Abc123' };
      const stored: string = 'Abc123';
      const flag: string = 'true';
      const result: LoginResult = AccountValidator.validateLogin(input, stored, flag);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(LoginResult.OK));
      expect(result).assertEqual(LoginResult.OK);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(0));
      expect(Number(result)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateLogin(input, stored, 'false')), String(LoginResult.FAILED));
      expect(AccountValidator.validateLogin(input, stored, 'false')).assertEqual(LoginResult.FAILED);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLoginMatrix010018 end');
    })

    /**
     * @tc.name   testLoginMatrix010019
     * @tc.number SUB_ACCT_VALLOG_0019
     * @tc.desc   mixed case mismatch is rejected -> FAILED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLoginMatrix010019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLoginMatrix010019 begin');
      const input: LoginInput = { name: 'alice01', password: 'abc123' };
      const stored: string = 'Abc123';
      const flag: string = 'true';
      const result: LoginResult = AccountValidator.validateLogin(input, stored, flag);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(LoginResult.FAILED));
      expect(result).assertEqual(LoginResult.FAILED);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(3));
      expect(Number(result)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateLogin(input, stored, 'false')), String(LoginResult.FAILED));
      expect(AccountValidator.validateLogin(input, stored, 'false')).assertEqual(LoginResult.FAILED);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLoginMatrix010019 end');
    })

    /**
     * @tc.name   testLoginMatrix010020
     * @tc.number SUB_ACCT_VALLOG_0020
     * @tc.desc   flag with a leading space is not true -> FAILED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLoginMatrix010020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLoginMatrix010020 begin');
      const input: LoginInput = { name: 'alice01', password: 'secret1' };
      const stored: string = 'secret1';
      const flag: string = ' true';
      const result: LoginResult = AccountValidator.validateLogin(input, stored, flag);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(LoginResult.FAILED));
      expect(result).assertEqual(LoginResult.FAILED);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(3));
      expect(Number(result)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateLogin(input, stored, 'true')), String(LoginResult.OK));
      expect(AccountValidator.validateLogin(input, stored, 'true')).assertEqual(LoginResult.OK);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLoginMatrix010020 end');
    })

    /**
     * @tc.name   testLoginMatrix010021
     * @tc.number SUB_ACCT_VALLOG_0021
     * @tc.desc   flag with a capital first letter is not true -> FAILED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLoginMatrix010021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLoginMatrix010021 begin');
      const input: LoginInput = { name: 'alice01', password: 'secret1' };
      const stored: string = 'secret1';
      const flag: string = 'True';
      const result: LoginResult = AccountValidator.validateLogin(input, stored, flag);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(LoginResult.FAILED));
      expect(result).assertEqual(LoginResult.FAILED);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(3));
      expect(Number(result)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateLogin(input, stored, 'true')), String(LoginResult.OK));
      expect(AccountValidator.validateLogin(input, stored, 'true')).assertEqual(LoginResult.OK);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLoginMatrix010021 end');
    })

    /**
     * @tc.name   testLoginMatrix010022
     * @tc.number SUB_ACCT_VALLOG_0022
     * @tc.desc   six digits match -> OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLoginMatrix010022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLoginMatrix010022 begin');
      const input: LoginInput = { name: 'alice01', password: '123456' };
      const stored: string = '123456';
      const flag: string = 'true';
      const result: LoginResult = AccountValidator.validateLogin(input, stored, flag);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(LoginResult.OK));
      expect(result).assertEqual(LoginResult.OK);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(0));
      expect(Number(result)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateLogin(input, stored, 'false')), String(LoginResult.FAILED));
      expect(AccountValidator.validateLogin(input, stored, 'false')).assertEqual(LoginResult.FAILED);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLoginMatrix010022 end');
    })

    /**
     * @tc.name   testLoginMatrix010023
     * @tc.number SUB_ACCT_VALLOG_0023
     * @tc.desc   six symbols match -> OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLoginMatrix010023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLoginMatrix010023 begin');
      const input: LoginInput = { name: 'alice01', password: '!@#$%^' };
      const stored: string = '!@#$%^';
      const flag: string = 'true';
      const result: LoginResult = AccountValidator.validateLogin(input, stored, flag);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(LoginResult.OK));
      expect(result).assertEqual(LoginResult.OK);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(0));
      expect(Number(result)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateLogin(input, stored, 'false')), String(LoginResult.FAILED));
      expect(AccountValidator.validateLogin(input, stored, 'false')).assertEqual(LoginResult.FAILED);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLoginMatrix010023 end');
    })

    /**
     * @tc.name   testLoginMatrix010024
     * @tc.number SUB_ACCT_VALLOG_0024
     * @tc.desc   flag with a suffix is not true -> FAILED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLoginMatrix010024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLoginMatrix010024 begin');
      const input: LoginInput = { name: 'alice01', password: 'secret1' };
      const stored: string = 'secret1';
      const flag: string = 'true1';
      const result: LoginResult = AccountValidator.validateLogin(input, stored, flag);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(LoginResult.FAILED));
      expect(result).assertEqual(LoginResult.FAILED);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(3));
      expect(Number(result)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateLogin(input, stored, 'true')), String(LoginResult.OK));
      expect(AccountValidator.validateLogin(input, stored, 'true')).assertEqual(LoginResult.OK);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLoginMatrix010024 end');
    })

    /**
     * @tc.name   testLoginMatrix010025
     * @tc.number SUB_ACCT_VALLOG_0025
     * @tc.desc   single char zero matches -> OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLoginMatrix010025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLoginMatrix010025 begin');
      const input: LoginInput = { name: 'alice01', password: '0' };
      const stored: string = '0';
      const flag: string = 'true';
      const result: LoginResult = AccountValidator.validateLogin(input, stored, flag);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(LoginResult.OK));
      expect(result).assertEqual(LoginResult.OK);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(0));
      expect(Number(result)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateLogin(input, stored, 'false')), String(LoginResult.FAILED));
      expect(AccountValidator.validateLogin(input, stored, 'false')).assertEqual(LoginResult.FAILED);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLoginMatrix010025 end');
    })

    /**
     * @tc.name   testLoginMatrix010026
     * @tc.number SUB_ACCT_VALLOG_0026
     * @tc.desc   flag with a trailing space is not true -> FAILED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLoginMatrix010026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLoginMatrix010026 begin');
      const input: LoginInput = { name: 'alice01', password: 'secret1' };
      const stored: string = 'secret1';
      const flag: string = 'TRUE ';
      const result: LoginResult = AccountValidator.validateLogin(input, stored, flag);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(LoginResult.FAILED));
      expect(result).assertEqual(LoginResult.FAILED);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(3));
      expect(Number(result)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateLogin(input, stored, 'true')), String(LoginResult.OK));
      expect(AccountValidator.validateLogin(input, stored, 'true')).assertEqual(LoginResult.OK);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLoginMatrix010026 end');
    })

    /**
     * @tc.name   testLoginMatrix010027
     * @tc.number SUB_ACCT_VALLOG_0027
     * @tc.desc   blank password and blank stored value again -> PASSWORD_EMPTY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLoginMatrix010027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLoginMatrix010027 begin');
      const input: LoginInput = { name: 'alice01', password: '' };
      const stored: string = '';
      const flag: string = 'false';
      const result: LoginResult = AccountValidator.validateLogin(input, stored, flag);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(LoginResult.PASSWORD_EMPTY));
      expect(result).assertEqual(LoginResult.PASSWORD_EMPTY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(2));
      expect(Number(result)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateLogin(input, stored, 'true')), String(LoginResult.PASSWORD_EMPTY));
      expect(AccountValidator.validateLogin(input, stored, 'true')).assertEqual(LoginResult.PASSWORD_EMPTY);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLoginMatrix010027 end');
    })

    /**
     * @tc.name   testLoginMatrix010028
     * @tc.number SUB_ACCT_VALLOG_0028
     * @tc.desc   blank name with unrelated stored value -> NAME_EMPTY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLoginMatrix010028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLoginMatrix010028 begin');
      const input: LoginInput = { name: '', password: 'secret1' };
      const stored: string = 'other99';
      const flag: string = 'false';
      const result: LoginResult = AccountValidator.validateLogin(input, stored, flag);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(LoginResult.NAME_EMPTY));
      expect(result).assertEqual(LoginResult.NAME_EMPTY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(1));
      expect(Number(result)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateLogin(input, stored, 'true')), String(LoginResult.NAME_EMPTY));
      expect(AccountValidator.validateLogin(input, stored, 'true')).assertEqual(LoginResult.NAME_EMPTY);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLoginMatrix010028 end');
    })

    /**
     * @tc.name   testLoginMatrix010029
     * @tc.number SUB_ACCT_VALLOG_0029
     * @tc.desc   blank name precedes blank password -> NAME_EMPTY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLoginMatrix010029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLoginMatrix010029 begin');
      const input: LoginInput = { name: '', password: '' };
      const stored: string = 'secret1';
      const flag: string = 'true';
      const result: LoginResult = AccountValidator.validateLogin(input, stored, flag);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(LoginResult.NAME_EMPTY));
      expect(result).assertEqual(LoginResult.NAME_EMPTY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(1));
      expect(Number(result)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateLogin(input, stored, 'false')), String(LoginResult.NAME_EMPTY));
      expect(AccountValidator.validateLogin(input, stored, 'false')).assertEqual(LoginResult.NAME_EMPTY);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLoginMatrix010029 end');
    })

    /**
     * @tc.name   testLoginMatrix010030
     * @tc.number SUB_ACCT_VALLOG_0030
     * @tc.desc   concatenated flag is not true -> FAILED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLoginMatrix010030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLoginMatrix010030 begin');
      const input: LoginInput = { name: 'alice01', password: 'secret1' };
      const stored: string = 'secret1';
      const flag: string = 'falsetrue';
      const result: LoginResult = AccountValidator.validateLogin(input, stored, flag);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(LoginResult.FAILED));
      expect(result).assertEqual(LoginResult.FAILED);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(3));
      expect(Number(result)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateLogin(input, stored, 'true')), String(LoginResult.OK));
      expect(AccountValidator.validateLogin(input, stored, 'true')).assertEqual(LoginResult.OK);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLoginMatrix010030 end');
    })

    /**
     * @tc.name   testLoginMatrix010031
     * @tc.number SUB_ACCT_VALLOG_0031
     * @tc.desc   two spaces match -> OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLoginMatrix010031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLoginMatrix010031 begin');
      const input: LoginInput = { name: 'alice01', password: '  ' };
      const stored: string = '  ';
      const flag: string = 'true';
      const result: LoginResult = AccountValidator.validateLogin(input, stored, flag);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(LoginResult.OK));
      expect(result).assertEqual(LoginResult.OK);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(0));
      expect(Number(result)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateLogin(input, stored, 'false')), String(LoginResult.FAILED));
      expect(AccountValidator.validateLogin(input, stored, 'false')).assertEqual(LoginResult.FAILED);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLoginMatrix010031 end');
    })

    /**
     * @tc.name   testLoginMatrix010032
     * @tc.number SUB_ACCT_VALLOG_0032
     * @tc.desc   stored differs only by case -> FAILED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLoginMatrix010032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLoginMatrix010032 begin');
      const input: LoginInput = { name: 'alice01', password: 'secret1' };
      const stored: string = 'Secret1';
      const flag: string = 'true';
      const result: LoginResult = AccountValidator.validateLogin(input, stored, flag);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(LoginResult.FAILED));
      expect(result).assertEqual(LoginResult.FAILED);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(3));
      expect(Number(result)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateLogin(input, stored, 'false')), String(LoginResult.FAILED));
      expect(AccountValidator.validateLogin(input, stored, 'false')).assertEqual(LoginResult.FAILED);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLoginMatrix010032 end');
    })

    /**
     * @tc.name   testLoginMatrix010033
     * @tc.number SUB_ACCT_VALLOG_0033
     * @tc.desc   twenty four char password matches -> OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLoginMatrix010033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLoginMatrix010033 begin');
      const input: LoginInput = { name: 'alice01', password: 'longpasswordlongpassword' };
      const stored: string = 'longpasswordlongpassword';
      const flag: string = 'true';
      const result: LoginResult = AccountValidator.validateLogin(input, stored, flag);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(LoginResult.OK));
      expect(result).assertEqual(LoginResult.OK);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(0));
      expect(Number(result)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateLogin(input, stored, 'false')), String(LoginResult.FAILED));
      expect(AccountValidator.validateLogin(input, stored, 'false')).assertEqual(LoginResult.FAILED);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLoginMatrix010033 end');
    })

    /**
     * @tc.name   testLoginMatrix010034
     * @tc.number SUB_ACCT_VALLOG_0034
     * @tc.desc   numbered flag is not true -> FAILED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLoginMatrix010034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLoginMatrix010034 begin');
      const input: LoginInput = { name: 'alice01', password: 'secret1' };
      const stored: string = 'secret1';
      const flag: string = '1true';
      const result: LoginResult = AccountValidator.validateLogin(input, stored, flag);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(LoginResult.FAILED));
      expect(result).assertEqual(LoginResult.FAILED);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(3));
      expect(Number(result)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateLogin(input, stored, 'true')), String(LoginResult.OK));
      expect(AccountValidator.validateLogin(input, stored, 'true')).assertEqual(LoginResult.OK);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLoginMatrix010034 end');
    })

    /**
     * @tc.name   testLoginMatrix010035
     * @tc.number SUB_ACCT_VALLOG_0035
     * @tc.desc   two char password matches -> OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLoginMatrix010035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLoginMatrix010035 begin');
      const input: LoginInput = { name: 'alice01', password: 'bb' };
      const stored: string = 'bb';
      const flag: string = 'true';
      const result: LoginResult = AccountValidator.validateLogin(input, stored, flag);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(LoginResult.OK));
      expect(result).assertEqual(LoginResult.OK);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(0));
      expect(Number(result)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateLogin(input, stored, 'false')), String(LoginResult.FAILED));
      expect(AccountValidator.validateLogin(input, stored, 'false')).assertEqual(LoginResult.FAILED);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLoginMatrix010035 end');
    })

    /**
     * @tc.name   testLoginMatrix010036
     * @tc.number SUB_ACCT_VALLOG_0036
     * @tc.desc   stored is one char shorter -> FAILED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLoginMatrix010036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLoginMatrix010036 begin');
      const input: LoginInput = { name: 'alice01', password: 'secret1' };
      const stored: string = 'secret';
      const flag: string = 'true';
      const result: LoginResult = AccountValidator.validateLogin(input, stored, flag);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(LoginResult.FAILED));
      expect(result).assertEqual(LoginResult.FAILED);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(3));
      expect(Number(result)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateLogin(input, stored, 'false')), String(LoginResult.FAILED));
      expect(AccountValidator.validateLogin(input, stored, 'false')).assertEqual(LoginResult.FAILED);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLoginMatrix010036 end');
    })

    /**
     * @tc.name   testLoginMatrix010037
     * @tc.number SUB_ACCT_VALLOG_0037
     * @tc.desc   password is one char shorter -> FAILED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLoginMatrix010037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLoginMatrix010037 begin');
      const input: LoginInput = { name: 'alice01', password: 'secret' };
      const stored: string = 'secret1';
      const flag: string = 'true';
      const result: LoginResult = AccountValidator.validateLogin(input, stored, flag);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(LoginResult.FAILED));
      expect(result).assertEqual(LoginResult.FAILED);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(3));
      expect(Number(result)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateLogin(input, stored, 'false')), String(LoginResult.FAILED));
      expect(AccountValidator.validateLogin(input, stored, 'false')).assertEqual(LoginResult.FAILED);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLoginMatrix010037 end');
    })

    /**
     * @tc.name   testLoginMatrix010038
     * @tc.number SUB_ACCT_VALLOG_0038
     * @tc.desc   blank name with a valid stored pair -> NAME_EMPTY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLoginMatrix010038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLoginMatrix010038 begin');
      const input: LoginInput = { name: '', password: 'alice01' };
      const stored: string = 'alice01';
      const flag: string = 'true';
      const result: LoginResult = AccountValidator.validateLogin(input, stored, flag);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(LoginResult.NAME_EMPTY));
      expect(result).assertEqual(LoginResult.NAME_EMPTY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(1));
      expect(Number(result)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateLogin(input, stored, 'false')), String(LoginResult.NAME_EMPTY));
      expect(AccountValidator.validateLogin(input, stored, 'false')).assertEqual(LoginResult.NAME_EMPTY);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLoginMatrix010038 end');
    })

    /**
     * @tc.name   testLoginMatrix010039
     * @tc.number SUB_ACCT_VALLOG_0039
     * @tc.desc   blank password with blank stored value and true flag -> PASSWORD_EMPTY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLoginMatrix010039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLoginMatrix010039 begin');
      const input: LoginInput = { name: 'alice01', password: '' };
      const stored: string = '';
      const flag: string = 'true';
      const result: LoginResult = AccountValidator.validateLogin(input, stored, flag);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(LoginResult.PASSWORD_EMPTY));
      expect(result).assertEqual(LoginResult.PASSWORD_EMPTY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(2));
      expect(Number(result)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateLogin(input, stored, 'false')), String(LoginResult.PASSWORD_EMPTY));
      expect(AccountValidator.validateLogin(input, stored, 'false')).assertEqual(LoginResult.PASSWORD_EMPTY);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLoginMatrix010039 end');
    })

    /**
     * @tc.name   testLoginMatrix010040
     * @tc.number SUB_ACCT_VALLOG_0040
     * @tc.desc   flag with a capital last letter is not true -> FAILED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLoginMatrix010040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLoginMatrix010040 begin');
      const input: LoginInput = { name: 'alice01', password: 'secret1' };
      const stored: string = 'secret1';
      const flag: string = 'truE';
      const result: LoginResult = AccountValidator.validateLogin(input, stored, flag);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(LoginResult.FAILED));
      expect(result).assertEqual(LoginResult.FAILED);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(3));
      expect(Number(result)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateLogin(input, stored, 'true')), String(LoginResult.OK));
      expect(AccountValidator.validateLogin(input, stored, 'true')).assertEqual(LoginResult.OK);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLoginMatrix010040 end');
    })


    /**
     * @tc.name   testLoginMatrix010041
     * @tc.number SUB_ACCT_VALLOG_0041
     * @tc.desc   登录标记为大写 TRUE 时不视为已登录
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLoginMatrix010041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLoginMatrix010041 begin');
      const input: LoginInput = { name: 'alice01', password: 'secret1' };
      const result: LoginResult = AccountValidator.validateLogin(input, 'secret1', 'TRUE');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), 'FAILED');
      expect(result).assertEqual(LoginResult.FAILED);
      expect(result === LoginResult.OK).assertFalse();
      expect(Number(result)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLoginMatrix010041 end');
    });

    /**
     * @tc.name   testLoginMatrix010042
     * @tc.number SUB_ACCT_VALLOG_0042
     * @tc.desc   用户名与密码都为空时只返回 NAME_EMPTY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLoginMatrix010042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLoginMatrix010042 begin');
      const input: LoginInput = { name: '', password: '' };
      const result: LoginResult = AccountValidator.validateLogin(input, '', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), 'NAME_EMPTY');
      expect(result).assertEqual(LoginResult.NAME_EMPTY);
      expect(result === LoginResult.PASSWORD_EMPTY).assertFalse();
      expect(Number(result)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLoginMatrix010042 end');
    });

    /**
     * @tc.name   testLoginMatrix010043
     * @tc.number SUB_ACCT_VALLOG_0043
     * @tc.desc   用例主流程：密码与已存值一致且标记恰为 true 时才允许登录
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLoginMatrix010043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLoginMatrix010043 begin');
      const input: LoginInput = { name: 'alice01', password: 'secret1' };
      const result: LoginResult = AccountValidator.validateLogin(input, 'secret1', 'true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), 'OK');
      expect(result).assertEqual(LoginResult.OK);
      expect(result === LoginResult.FAILED).assertFalse();
      expect(Number(result)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLoginMatrix010043 end');
    });
  })
}
