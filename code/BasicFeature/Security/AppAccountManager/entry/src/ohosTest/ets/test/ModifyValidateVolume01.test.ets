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

function modInput(email: string, signature: string, password: string, confirmPassword: string): ModifyInput {
  let input: ModifyInput = {
    email: email, signature: signature, password: password, confirmPassword: confirmPassword
  };
  return input;
}

export default function modifyValidateTest01() {
  describe('ModifyValidateTest01', () => {

    /**
     * @tc.name   testModifyValidate0001
     * @tc.number SUB_ACCT_VALMOD_0001
     * @tc.desc   malformed address blocks the modify form before any password rule
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testModifyValidate0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0001 begin');
      const MAIL: string = 'tom@';
      const SIG: string = 'sig';
      const PWD: string = '';
      const CONF: string = '';
      const STORED: string = 'stored-pass';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(ModifyResult.EMAIL_INVALID);
      expect(CHECK).assertEqual(2);
      expect(AccountValidator.isEmailValid(MAIL)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0001 end');
    });

    /**
     * @tc.name   testModifyValidate0002
     * @tc.number SUB_ACCT_VALMOD_0002
     * @tc.desc   malformed address blocks the modify form before any password rule
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testModifyValidate0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0002 begin');
      const MAIL: string = '@example.com';
      const SIG: string = 'sig';
      const PWD: string = '';
      const CONF: string = '';
      const STORED: string = 'stored-pass';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(ModifyResult.EMAIL_INVALID);
      expect(CHECK).assertEqual(2);
      expect(AccountValidator.isEmailValid(MAIL)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0002 end');
    });

    /**
     * @tc.name   testModifyValidate0003
     * @tc.number SUB_ACCT_VALMOD_0003
     * @tc.desc   malformed address blocks the modify form before any password rule
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testModifyValidate0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0003 begin');
      const MAIL: string = 'tom@example';
      const SIG: string = 'sig';
      const PWD: string = '';
      const CONF: string = '';
      const STORED: string = 'stored-pass';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(ModifyResult.EMAIL_INVALID);
      expect(CHECK).assertEqual(2);
      expect(AccountValidator.isEmailValid(MAIL)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0003 end');
    });

    /**
     * @tc.name   testModifyValidate0004
     * @tc.number SUB_ACCT_VALMOD_0004
     * @tc.desc   malformed address blocks the modify form before any password rule
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testModifyValidate0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0004 begin');
      const MAIL: string = 'tom@example.c';
      const SIG: string = 'sig';
      const PWD: string = '';
      const CONF: string = '';
      const STORED: string = 'stored-pass';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(ModifyResult.EMAIL_INVALID);
      expect(CHECK).assertEqual(2);
      expect(AccountValidator.isEmailValid(MAIL)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0004 end');
    });

    /**
     * @tc.name   testModifyValidate0005
     * @tc.number SUB_ACCT_VALMOD_0005
     * @tc.desc   malformed address blocks the modify form before any password rule
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testModifyValidate0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0005 begin');
      const MAIL: string = 'tom@example.abcdefg';
      const SIG: string = 'sig';
      const PWD: string = '';
      const CONF: string = '';
      const STORED: string = 'stored-pass';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(ModifyResult.EMAIL_INVALID);
      expect(CHECK).assertEqual(2);
      expect(AccountValidator.isEmailValid(MAIL)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0005 end');
    });

    /**
     * @tc.name   testModifyValidate0006
     * @tc.number SUB_ACCT_VALMOD_0006
     * @tc.desc   malformed address blocks the modify form before any password rule
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testModifyValidate0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0006 begin');
      const MAIL: string = 'tom example.com';
      const SIG: string = 'sig';
      const PWD: string = '';
      const CONF: string = '';
      const STORED: string = 'stored-pass';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(ModifyResult.EMAIL_INVALID);
      expect(CHECK).assertEqual(2);
      expect(AccountValidator.isEmailValid(MAIL)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0006 end');
    });

    /**
     * @tc.name   testModifyValidate0007
     * @tc.number SUB_ACCT_VALMOD_0007
     * @tc.desc   malformed address blocks the modify form before any password rule
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testModifyValidate0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0007 begin');
      const MAIL: string = 'tom@exa mple.com';
      const SIG: string = 'sig';
      const PWD: string = '';
      const CONF: string = '';
      const STORED: string = 'stored-pass';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(ModifyResult.EMAIL_INVALID);
      expect(CHECK).assertEqual(2);
      expect(AccountValidator.isEmailValid(MAIL)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0007 end');
    });

    /**
     * @tc.name   testModifyValidate0008
     * @tc.number SUB_ACCT_VALMOD_0008
     * @tc.desc   malformed address blocks the modify form before any password rule
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testModifyValidate0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0008 begin');
      const MAIL: string = '中文@example.com';
      const SIG: string = 'sig';
      const PWD: string = '';
      const CONF: string = '';
      const STORED: string = 'stored-pass';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(ModifyResult.EMAIL_INVALID);
      expect(CHECK).assertEqual(2);
      expect(AccountValidator.isEmailValid(MAIL)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0008 end');
    });

    /**
     * @tc.name   testModifyValidate0009
     * @tc.number SUB_ACCT_VALMOD_0009
     * @tc.desc   malformed address blocks the modify form before any password rule
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testModifyValidate0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0009 begin');
      const MAIL: string = 'tom+tag@example.com';
      const SIG: string = 'sig';
      const PWD: string = '';
      const CONF: string = '';
      const STORED: string = 'stored-pass';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(ModifyResult.EMAIL_INVALID);
      expect(CHECK).assertEqual(2);
      expect(AccountValidator.isEmailValid(MAIL)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0009 end');
    });

    /**
     * @tc.name   testModifyValidate0010
     * @tc.number SUB_ACCT_VALMOD_0010
     * @tc.desc   malformed address blocks the modify form before any password rule
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testModifyValidate0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0010 begin');
      const MAIL: string = 'tom@.com';
      const SIG: string = 'sig';
      const PWD: string = '';
      const CONF: string = '';
      const STORED: string = 'stored-pass';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(ModifyResult.EMAIL_INVALID);
      expect(CHECK).assertEqual(2);
      expect(AccountValidator.isEmailValid(MAIL)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0010 end');
    });

    /**
     * @tc.name   testModifyValidate0011
     * @tc.number SUB_ACCT_VALMOD_0011
     * @tc.desc   malformed address blocks the modify form before any password rule
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testModifyValidate0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0011 begin');
      const MAIL: string = 'tom@@example.com';
      const SIG: string = 'sig';
      const PWD: string = '';
      const CONF: string = '';
      const STORED: string = 'stored-pass';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(ModifyResult.EMAIL_INVALID);
      expect(CHECK).assertEqual(2);
      expect(AccountValidator.isEmailValid(MAIL)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0011 end');
    });

    /**
     * @tc.name   testModifyValidate0012
     * @tc.number SUB_ACCT_VALMOD_0012
     * @tc.desc   malformed address blocks the modify form before any password rule
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testModifyValidate0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0012 begin');
      const MAIL: string = 'tom@example..com';
      const SIG: string = 'sig';
      const PWD: string = '';
      const CONF: string = '';
      const STORED: string = 'stored-pass';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(ModifyResult.EMAIL_INVALID);
      expect(CHECK).assertEqual(2);
      expect(AccountValidator.isEmailValid(MAIL)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0012 end');
    });

    /**
     * @tc.name   testModifyValidate0013
     * @tc.number SUB_ACCT_VALMOD_0013
     * @tc.desc   malformed address blocks the modify form before any password rule
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testModifyValidate0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0013 begin');
      const MAIL: string = '.@example.com';
      const SIG: string = 'sig';
      const PWD: string = '';
      const CONF: string = '';
      const STORED: string = 'stored-pass';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.OK_WITHOUT_PASSWORD');
      expect(CHECK).assertEqual(ModifyResult.OK_WITHOUT_PASSWORD);
      expect(CHECK).assertEqual(1);
      expect(PWD === '').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0013 end');
    });

    /**
     * @tc.name   testModifyValidate0014
     * @tc.number SUB_ACCT_VALMOD_0014
     * @tc.desc   malformed address blocks the modify form before any password rule
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testModifyValidate0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0014 begin');
      const MAIL: string = 'tom@example.com.';
      const SIG: string = 'sig';
      const PWD: string = '';
      const CONF: string = '';
      const STORED: string = 'stored-pass';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(ModifyResult.EMAIL_INVALID);
      expect(CHECK).assertEqual(2);
      expect(AccountValidator.isEmailValid(MAIL)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0014 end');
    });

    /**
     * @tc.name   testModifyValidate0015
     * @tc.number SUB_ACCT_VALMOD_0015
     * @tc.desc   malformed address blocks the modify form before any password rule
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testModifyValidate0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0015 begin');
      const MAIL: string = 'tom@example.com ';
      const SIG: string = 'sig';
      const PWD: string = '';
      const CONF: string = '';
      const STORED: string = 'stored-pass';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(ModifyResult.EMAIL_INVALID);
      expect(CHECK).assertEqual(2);
      expect(AccountValidator.isEmailValid(MAIL)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0015 end');
    });

    /**
     * @tc.name   testModifyValidate0016
     * @tc.number SUB_ACCT_VALMOD_0016
     * @tc.desc   malformed address blocks the modify form before any password rule
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testModifyValidate0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0016 begin');
      const MAIL: string = 'tom@例子.com';
      const SIG: string = 'sig';
      const PWD: string = '';
      const CONF: string = '';
      const STORED: string = 'stored-pass';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(ModifyResult.EMAIL_INVALID);
      expect(CHECK).assertEqual(2);
      expect(AccountValidator.isEmailValid(MAIL)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0016 end');
    });

    /**
     * @tc.name   testModifyValidate0017
     * @tc.number SUB_ACCT_VALMOD_0017
     * @tc.desc   malformed address blocks the modify form before any password rule
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testModifyValidate0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0017 begin');
      const MAIL: string = 'tom＠example.com';
      const SIG: string = 'sig';
      const PWD: string = '';
      const CONF: string = '';
      const STORED: string = 'stored-pass';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(ModifyResult.EMAIL_INVALID);
      expect(CHECK).assertEqual(2);
      expect(AccountValidator.isEmailValid(MAIL)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0017 end');
    });

    /**
     * @tc.name   testModifyValidate0018
     * @tc.number SUB_ACCT_VALMOD_0018
     * @tc.desc   malformed address blocks the modify form before any password rule
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testModifyValidate0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0018 begin');
      const MAIL: string = 'tom';
      const SIG: string = 'sig';
      const PWD: string = '';
      const CONF: string = '';
      const STORED: string = 'stored-pass';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(ModifyResult.EMAIL_INVALID);
      expect(CHECK).assertEqual(2);
      expect(AccountValidator.isEmailValid(MAIL)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0018 end');
    });

    /**
     * @tc.name   testModifyValidate0019
     * @tc.number SUB_ACCT_VALMOD_0019
     * @tc.desc   malformed address blocks the modify form before any password rule
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testModifyValidate0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0019 begin');
      const MAIL: string = '@';
      const SIG: string = 'sig';
      const PWD: string = '';
      const CONF: string = '';
      const STORED: string = 'stored-pass';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(ModifyResult.EMAIL_INVALID);
      expect(CHECK).assertEqual(2);
      expect(AccountValidator.isEmailValid(MAIL)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0019 end');
    });

    /**
     * @tc.name   testModifyValidate0020
     * @tc.number SUB_ACCT_VALMOD_0020
     * @tc.desc   malformed address blocks the modify form before any password rule
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testModifyValidate0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0020 begin');
      const MAIL: string = 'tom@...';
      const SIG: string = 'sig';
      const PWD: string = '';
      const CONF: string = '';
      const STORED: string = 'stored-pass';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.EMAIL_INVALID');
      expect(CHECK).assertEqual(ModifyResult.EMAIL_INVALID);
      expect(CHECK).assertEqual(2);
      expect(AccountValidator.isEmailValid(MAIL)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0020 end');
    });

    /**
     * @tc.name   testModifyValidate0021
     * @tc.number SUB_ACCT_VALMOD_0021
     * @tc.desc   a provided password below six characters is rejected before the stored compare
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testModifyValidate0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0021 begin');
      const MAIL: string = '';
      const SIG: string = 'sig';
      const PWD: string = 'a';
      const CONF: string = 'a';
      const STORED: string = 'stored-pass';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.PASSWORD_TOO_SHORT');
      expect(CHECK).assertEqual(ModifyResult.PASSWORD_TOO_SHORT);
      expect(CHECK).assertEqual(3);
      expect(AccountValidator.isPasswordLongEnough(PWD)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0021 end');
    });

    /**
     * @tc.name   testModifyValidate0022
     * @tc.number SUB_ACCT_VALMOD_0022
     * @tc.desc   a provided password below six characters is rejected before the stored compare
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testModifyValidate0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0022 begin');
      const MAIL: string = '';
      const SIG: string = '';
      const PWD: string = 'ab';
      const CONF: string = 'ab';
      const STORED: string = 'stored-pass';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.PASSWORD_TOO_SHORT');
      expect(CHECK).assertEqual(ModifyResult.PASSWORD_TOO_SHORT);
      expect(CHECK).assertEqual(3);
      expect(AccountValidator.isPasswordLongEnough(PWD)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0022 end');
    });

    /**
     * @tc.name   testModifyValidate0023
     * @tc.number SUB_ACCT_VALMOD_0023
     * @tc.desc   a provided password below six characters is rejected before the stored compare
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testModifyValidate0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0023 begin');
      const MAIL: string = '';
      const SIG: string = 'sig';
      const PWD: string = 'abc';
      const CONF: string = 'abc';
      const STORED: string = 'stored-pass';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.PASSWORD_TOO_SHORT');
      expect(CHECK).assertEqual(ModifyResult.PASSWORD_TOO_SHORT);
      expect(CHECK).assertEqual(3);
      expect(AccountValidator.isPasswordLongEnough(PWD)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0023 end');
    });

    /**
     * @tc.name   testModifyValidate0024
     * @tc.number SUB_ACCT_VALMOD_0024
     * @tc.desc   a provided password below six characters is rejected before the stored compare
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testModifyValidate0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0024 begin');
      const MAIL: string = '';
      const SIG: string = 'sig';
      const PWD: string = 'abcd';
      const CONF: string = 'abcd';
      const STORED: string = 'stored-pass';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.PASSWORD_TOO_SHORT');
      expect(CHECK).assertEqual(ModifyResult.PASSWORD_TOO_SHORT);
      expect(CHECK).assertEqual(3);
      expect(AccountValidator.isPasswordLongEnough(PWD)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0024 end');
    });

    /**
     * @tc.name   testModifyValidate0025
     * @tc.number SUB_ACCT_VALMOD_0025
     * @tc.desc   a provided password below six characters is rejected before the stored compare
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testModifyValidate0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0025 begin');
      const MAIL: string = '';
      const SIG: string = 'sig';
      const PWD: string = 'abcde';
      const CONF: string = 'abcde';
      const STORED: string = 'stored-pass';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.PASSWORD_TOO_SHORT');
      expect(CHECK).assertEqual(ModifyResult.PASSWORD_TOO_SHORT);
      expect(CHECK).assertEqual(3);
      expect(AccountValidator.isPasswordLongEnough(PWD)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0025 end');
    });

    /**
     * @tc.name   testModifyValidate0026
     * @tc.number SUB_ACCT_VALMOD_0026
     * @tc.desc   a provided password below six characters is rejected before the stored compare
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testModifyValidate0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0026 begin');
      const MAIL: string = '';
      const SIG: string = 'sig';
      const PWD: string = '12345';
      const CONF: string = '12345';
      const STORED: string = 'stored-pass';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.PASSWORD_TOO_SHORT');
      expect(CHECK).assertEqual(ModifyResult.PASSWORD_TOO_SHORT);
      expect(CHECK).assertEqual(3);
      expect(AccountValidator.isPasswordLongEnough(PWD)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0026 end');
    });

    /**
     * @tc.name   testModifyValidate0027
     * @tc.number SUB_ACCT_VALMOD_0027
     * @tc.desc   a provided password below six characters is rejected before the stored compare
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testModifyValidate0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0027 begin');
      const MAIL: string = '';
      const SIG: string = 'sig';
      const PWD: string = '     ';
      const CONF: string = '     ';
      const STORED: string = 'stored-pass';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.PASSWORD_TOO_SHORT');
      expect(CHECK).assertEqual(ModifyResult.PASSWORD_TOO_SHORT);
      expect(CHECK).assertEqual(3);
      expect(AccountValidator.isPasswordLongEnough(PWD)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0027 end');
    });

    /**
     * @tc.name   testModifyValidate0028
     * @tc.number SUB_ACCT_VALMOD_0028
     * @tc.desc   a provided password below six characters is rejected before the stored compare
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testModifyValidate0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0028 begin');
      const MAIL: string = '';
      const SIG: string = 'sig';
      const PWD: string = '晴天晴天';
      const CONF: string = '晴天晴天';
      const STORED: string = 'stored-pass';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.PASSWORD_TOO_SHORT');
      expect(CHECK).assertEqual(ModifyResult.PASSWORD_TOO_SHORT);
      expect(CHECK).assertEqual(3);
      expect(AccountValidator.isPasswordLongEnough(PWD)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0028 end');
    });

    /**
     * @tc.name   testModifyValidate0029
     * @tc.number SUB_ACCT_VALMOD_0029
     * @tc.desc   a provided password below six characters is rejected before the stored compare
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testModifyValidate0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0029 begin');
      const MAIL: string = '';
      const SIG: string = 'sig';
      const PWD: string = 'p';
      const CONF: string = 'p';
      const STORED: string = 'p';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.PASSWORD_TOO_SHORT');
      expect(CHECK).assertEqual(ModifyResult.PASSWORD_TOO_SHORT);
      expect(CHECK).assertEqual(3);
      expect(AccountValidator.isPasswordLongEnough(PWD)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0029 end');
    });

    /**
     * @tc.name   testModifyValidate0030
     * @tc.number SUB_ACCT_VALMOD_0030
     * @tc.desc   a provided password below six characters is rejected before the stored compare
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testModifyValidate0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0030 begin');
      const MAIL: string = '';
      const SIG: string = 'sig';
      const PWD: string = '1234';
      const CONF: string = '1234';
      const STORED: string = 'stored-pass';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.PASSWORD_TOO_SHORT');
      expect(CHECK).assertEqual(ModifyResult.PASSWORD_TOO_SHORT);
      expect(CHECK).assertEqual(3);
      expect(AccountValidator.isPasswordLongEnough(PWD)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0030 end');
    });

    /**
     * @tc.name   testModifyValidate0031
     * @tc.number SUB_ACCT_VALMOD_0031
     * @tc.desc   a provided password below six characters is rejected before the stored compare
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testModifyValidate0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0031 begin');
      const MAIL: string = '';
      const SIG: string = '';
      const PWD: string = '\t\t';
      const CONF: string = '\t\t';
      const STORED: string = 'stored-pass';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.PASSWORD_TOO_SHORT');
      expect(CHECK).assertEqual(ModifyResult.PASSWORD_TOO_SHORT);
      expect(CHECK).assertEqual(3);
      expect(AccountValidator.isPasswordLongEnough(PWD)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0031 end');
    });

    /**
     * @tc.name   testModifyValidate0032
     * @tc.number SUB_ACCT_VALMOD_0032
     * @tc.desc   a provided password below six characters is rejected before the stored compare
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testModifyValidate0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0032 begin');
      const MAIL: string = '';
      const SIG: string = 'sig';
      const PWD: string = '😀😀';
      const CONF: string = '😀😀';
      const STORED: string = 'stored-pass';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.PASSWORD_TOO_SHORT');
      expect(CHECK).assertEqual(ModifyResult.PASSWORD_TOO_SHORT);
      expect(CHECK).assertEqual(3);
      expect(AccountValidator.isPasswordLongEnough(PWD)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0032 end');
    });

    /**
     * @tc.name   testModifyValidate0033
     * @tc.number SUB_ACCT_VALMOD_0033
     * @tc.desc   a provided password below six characters is rejected before the stored compare
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testModifyValidate0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0033 begin');
      const MAIL: string = '';
      const SIG: string = 'sig';
      const PWD: string = 'abc';
      const CONF: string = 'xyz';
      const STORED: string = 'stored-pass';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.PASSWORD_TOO_SHORT');
      expect(CHECK).assertEqual(ModifyResult.PASSWORD_TOO_SHORT);
      expect(CHECK).assertEqual(3);
      expect(AccountValidator.isPasswordLongEnough(PWD)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0033 end');
    });

    /**
     * @tc.name   testModifyValidate0034
     * @tc.number SUB_ACCT_VALMOD_0034
     * @tc.desc   a provided password below six characters is rejected before the stored compare
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testModifyValidate0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0034 begin');
      const MAIL: string = '';
      const SIG: string = 'sig';
      const PWD: string = 'abcde';
      const CONF: string = 'abcde';
      const STORED: string = 'stored-pass';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.PASSWORD_TOO_SHORT');
      expect(CHECK).assertEqual(ModifyResult.PASSWORD_TOO_SHORT);
      expect(CHECK).assertEqual(3);
      expect(AccountValidator.isPasswordLongEnough(PWD)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0034 end');
    });

    /**
     * @tc.name   testModifyValidate0035
     * @tc.number SUB_ACCT_VALMOD_0035
     * @tc.desc   a provided password below six characters is rejected before the stored compare
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testModifyValidate0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0035 begin');
      const MAIL: string = '';
      const SIG: string = 'sig';
      const PWD: string = 'aB1!';
      const CONF: string = 'aB1!';
      const STORED: string = 'stored-pass';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.PASSWORD_TOO_SHORT');
      expect(CHECK).assertEqual(ModifyResult.PASSWORD_TOO_SHORT);
      expect(CHECK).assertEqual(3);
      expect(AccountValidator.isPasswordLongEnough(PWD)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0035 end');
    });

    /**
     * @tc.name   testModifyValidate0036
     * @tc.number SUB_ACCT_VALMOD_0036
     * @tc.desc   a provided password below six characters is rejected before the stored compare
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testModifyValidate0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0036 begin');
      const MAIL: string = '';
      const SIG: string = 'sig';
      const PWD: string = 'q';
      const CONF: string = '';
      const STORED: string = 'stored-pass';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.PASSWORD_TOO_SHORT');
      expect(CHECK).assertEqual(ModifyResult.PASSWORD_TOO_SHORT);
      expect(CHECK).assertEqual(3);
      expect(AccountValidator.isPasswordLongEnough(PWD)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0036 end');
    });

    /**
     * @tc.name   testModifyValidate0037
     * @tc.number SUB_ACCT_VALMOD_0037
     * @tc.desc   a password equal to the stored one is reported as unchanged
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testModifyValidate0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0037 begin');
      const MAIL: string = '';
      const SIG: string = 'sig';
      const PWD: string = 'pass123';
      const CONF: string = 'pass123';
      const STORED: string = 'pass123';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.PASSWORD_SAME_AS_OLD');
      expect(CHECK).assertEqual(ModifyResult.PASSWORD_SAME_AS_OLD);
      expect(CHECK).assertEqual(4);
      expect(PWD === STORED).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0037 end');
    });

    /**
     * @tc.name   testModifyValidate0038
     * @tc.number SUB_ACCT_VALMOD_0038
     * @tc.desc   a password equal to the stored one is reported as unchanged
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testModifyValidate0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0038 begin');
      const MAIL: string = 'tom@example.org';
      const SIG: string = '';
      const PWD: string = 'pass123';
      const CONF: string = 'pass123';
      const STORED: string = 'pass123';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.PASSWORD_SAME_AS_OLD');
      expect(CHECK).assertEqual(ModifyResult.PASSWORD_SAME_AS_OLD);
      expect(CHECK).assertEqual(4);
      expect(PWD === STORED).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0038 end');
    });

    /**
     * @tc.name   testModifyValidate0039
     * @tc.number SUB_ACCT_VALMOD_0039
     * @tc.desc   a password equal to the stored one is reported as unchanged
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testModifyValidate0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0039 begin');
      const MAIL: string = '';
      const SIG: string = 'sig';
      const PWD: string = 'abcdef';
      const CONF: string = 'abcdef';
      const STORED: string = 'abcdef';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.PASSWORD_SAME_AS_OLD');
      expect(CHECK).assertEqual(ModifyResult.PASSWORD_SAME_AS_OLD);
      expect(CHECK).assertEqual(4);
      expect(PWD === STORED).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0039 end');
    });

    /**
     * @tc.name   testModifyValidate0040
     * @tc.number SUB_ACCT_VALMOD_0040
     * @tc.desc   a password equal to the stored one is reported as unchanged
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testModifyValidate0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0040 begin');
      const MAIL: string = '';
      const SIG: string = 'sig';
      const PWD: string = '123456';
      const CONF: string = '123456';
      const STORED: string = '123456';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.PASSWORD_SAME_AS_OLD');
      expect(CHECK).assertEqual(ModifyResult.PASSWORD_SAME_AS_OLD);
      expect(CHECK).assertEqual(4);
      expect(PWD === STORED).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0040 end');
    });

    /**
     * @tc.name   testModifyValidate0041
     * @tc.number SUB_ACCT_VALMOD_0041
     * @tc.desc   a password equal to the stored one is reported as unchanged
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testModifyValidate0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0041 begin');
      const MAIL: string = '';
      const SIG: string = 'sig';
      const PWD: string = '      ';
      const CONF: string = '      ';
      const STORED: string = '      ';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.PASSWORD_SAME_AS_OLD');
      expect(CHECK).assertEqual(ModifyResult.PASSWORD_SAME_AS_OLD);
      expect(CHECK).assertEqual(4);
      expect(PWD === STORED).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0041 end');
    });

    /**
     * @tc.name   testModifyValidate0042
     * @tc.number SUB_ACCT_VALMOD_0042
     * @tc.desc   a password equal to the stored one is reported as unchanged
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testModifyValidate0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0042 begin');
      const MAIL: string = '';
      const SIG: string = 'sig';
      const PWD: string = '晴天晴天晴天';
      const CONF: string = '晴天晴天晴天';
      const STORED: string = '晴天晴天晴天';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.PASSWORD_SAME_AS_OLD');
      expect(CHECK).assertEqual(ModifyResult.PASSWORD_SAME_AS_OLD);
      expect(CHECK).assertEqual(4);
      expect(PWD === STORED).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0042 end');
    });

    /**
     * @tc.name   testModifyValidate0043
     * @tc.number SUB_ACCT_VALMOD_0043
     * @tc.desc   a password equal to the stored one is reported as unchanged
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testModifyValidate0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0043 begin');
      const MAIL: string = '';
      const SIG: string = 'sig';
      const PWD: string = 'pppppppppppppppppppp';
      const CONF: string = 'pppppppppppppppppppp';
      const STORED: string = 'pppppppppppppppppppp';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.PASSWORD_SAME_AS_OLD');
      expect(CHECK).assertEqual(ModifyResult.PASSWORD_SAME_AS_OLD);
      expect(CHECK).assertEqual(4);
      expect(PWD === STORED).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0043 end');
    });

    /**
     * @tc.name   testModifyValidate0044
     * @tc.number SUB_ACCT_VALMOD_0044
     * @tc.desc   a password equal to the stored one is reported as unchanged
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testModifyValidate0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0044 begin');
      const MAIL: string = '';
      const SIG: string = 'sig';
      const PWD: string = 'Password1!';
      const CONF: string = 'Password1!';
      const STORED: string = 'Password1!';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.PASSWORD_SAME_AS_OLD');
      expect(CHECK).assertEqual(ModifyResult.PASSWORD_SAME_AS_OLD);
      expect(CHECK).assertEqual(4);
      expect(PWD === STORED).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0044 end');
    });

  });
}
