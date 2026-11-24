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

export default function modifyValidateTest02() {
  describe('ModifyValidateTest02', () => {

    /**
     * @tc.name   testModifyValidate0045
     * @tc.number SUB_ACCT_VALMOD_0045
     * @tc.desc   a password equal to the stored one is reported as unchanged
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyValidate0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0045 begin');
      const MAIL: string = 'tom@example.org';
      const SIG: string = '';
      const PWD: string = 'qwerty';
      const CONF: string = 'qwerty';
      const STORED: string = 'qwerty';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.PASSWORD_SAME_AS_OLD');
      expect(CHECK).assertEqual(ModifyResult.PASSWORD_SAME_AS_OLD);
      expect(CHECK).assertEqual(4);
      expect(PWD === STORED).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0045 end');
    });

    /**
     * @tc.name   testModifyValidate0046
     * @tc.number SUB_ACCT_VALMOD_0046
     * @tc.desc   a password equal to the stored one is reported as unchanged
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyValidate0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0046 begin');
      const MAIL: string = '';
      const SIG: string = 'sig';
      const PWD: string = 'Abcdef';
      const CONF: string = 'Abcdef';
      const STORED: string = 'Abcdef';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.PASSWORD_SAME_AS_OLD');
      expect(CHECK).assertEqual(ModifyResult.PASSWORD_SAME_AS_OLD);
      expect(CHECK).assertEqual(4);
      expect(PWD === STORED).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0046 end');
    });

    /**
     * @tc.name   testModifyValidate0047
     * @tc.number SUB_ACCT_VALMOD_0047
     * @tc.desc   a password equal to the stored one is reported as unchanged
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyValidate0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0047 begin');
      const MAIL: string = '';
      const SIG: string = 'sig';
      const PWD: string = '      ';
      const CONF: string = '     ';
      const STORED: string = '      ';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.PASSWORD_SAME_AS_OLD');
      expect(CHECK).assertEqual(ModifyResult.PASSWORD_SAME_AS_OLD);
      expect(CHECK).assertEqual(4);
      expect(PWD === STORED).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0047 end');
    });

    /**
     * @tc.name   testModifyValidate0048
     * @tc.number SUB_ACCT_VALMOD_0048
     * @tc.desc   a password equal to the stored one is reported as unchanged
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyValidate0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0048 begin');
      const MAIL: string = '';
      const SIG: string = 'sig';
      const PWD: string = '12345678';
      const CONF: string = '';
      const STORED: string = '12345678';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.PASSWORD_SAME_AS_OLD');
      expect(CHECK).assertEqual(ModifyResult.PASSWORD_SAME_AS_OLD);
      expect(CHECK).assertEqual(4);
      expect(PWD === STORED).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0048 end');
    });

    /**
     * @tc.name   testModifyValidate0049
     * @tc.number SUB_ACCT_VALMOD_0049
     * @tc.desc   a password equal to the stored one is reported as unchanged
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyValidate0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0049 begin');
      const MAIL: string = '';
      const SIG: string = 'sig';
      const PWD: string = 'zzzzzz';
      const CONF: string = 'zzzzzz';
      const STORED: string = 'zzzzzz';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.PASSWORD_SAME_AS_OLD');
      expect(CHECK).assertEqual(ModifyResult.PASSWORD_SAME_AS_OLD);
      expect(CHECK).assertEqual(4);
      expect(PWD === STORED).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0049 end');
    });

    /**
     * @tc.name   testModifyValidate0050
     * @tc.number SUB_ACCT_VALMOD_0050
     * @tc.desc   a password equal to the stored one is reported as unchanged
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyValidate0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0050 begin');
      const MAIL: string = '';
      const SIG: string = 'sig';
      const PWD: string = '😀😀😀';
      const CONF: string = '😀😀😀';
      const STORED: string = '😀😀😀';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.PASSWORD_SAME_AS_OLD');
      expect(CHECK).assertEqual(ModifyResult.PASSWORD_SAME_AS_OLD);
      expect(CHECK).assertEqual(4);
      expect(PWD === STORED).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0050 end');
    });

    /**
     * @tc.name   testModifyValidate0051
     * @tc.number SUB_ACCT_VALMOD_0051
     * @tc.desc   a password equal to the stored one is reported as unchanged
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyValidate0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0051 begin');
      const MAIL: string = 'tom@example.org';
      const SIG: string = '';
      const PWD: string = 'abc123';
      const CONF: string = 'abc123';
      const STORED: string = 'abc123';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.PASSWORD_SAME_AS_OLD');
      expect(CHECK).assertEqual(ModifyResult.PASSWORD_SAME_AS_OLD);
      expect(CHECK).assertEqual(4);
      expect(PWD === STORED).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0051 end');
    });

    /**
     * @tc.name   testModifyValidate0052
     * @tc.number SUB_ACCT_VALMOD_0052
     * @tc.desc   a password equal to the stored one is reported as unchanged
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyValidate0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0052 begin');
      const MAIL: string = '';
      const SIG: string = 'sig';
      const PWD: string = 'hello1';
      const CONF: string = 'hello1';
      const STORED: string = 'hello1';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.PASSWORD_SAME_AS_OLD');
      expect(CHECK).assertEqual(ModifyResult.PASSWORD_SAME_AS_OLD);
      expect(CHECK).assertEqual(4);
      expect(PWD === STORED).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0052 end');
    });

    /**
     * @tc.name   testModifyValidate0053
     * @tc.number SUB_ACCT_VALMOD_0053
     * @tc.desc   confirm field must repeat the new password exactly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyValidate0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0053 begin');
      const MAIL: string = '';
      const SIG: string = 'sig';
      const PWD: string = 'pass123';
      const CONF: string = '';
      const STORED: string = 'stored-pass';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.CONFIRM_MISMATCH');
      expect(CHECK).assertEqual(ModifyResult.CONFIRM_MISMATCH);
      expect(CHECK).assertEqual(5);
      expect(PWD === CONF).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0053 end');
    });

    /**
     * @tc.name   testModifyValidate0054
     * @tc.number SUB_ACCT_VALMOD_0054
     * @tc.desc   confirm field must repeat the new password exactly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyValidate0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0054 begin');
      const MAIL: string = '';
      const SIG: string = 'sig';
      const PWD: string = 'pass123';
      const CONF: string = 'pass124';
      const STORED: string = 'stored-pass';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.CONFIRM_MISMATCH');
      expect(CHECK).assertEqual(ModifyResult.CONFIRM_MISMATCH);
      expect(CHECK).assertEqual(5);
      expect(PWD === CONF).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0054 end');
    });

    /**
     * @tc.name   testModifyValidate0055
     * @tc.number SUB_ACCT_VALMOD_0055
     * @tc.desc   confirm field must repeat the new password exactly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyValidate0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0055 begin');
      const MAIL: string = '';
      const SIG: string = 'sig';
      const PWD: string = 'pass123';
      const CONF: string = 'Pass123';
      const STORED: string = 'stored-pass';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.CONFIRM_MISMATCH');
      expect(CHECK).assertEqual(ModifyResult.CONFIRM_MISMATCH);
      expect(CHECK).assertEqual(5);
      expect(PWD === CONF).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0055 end');
    });

    /**
     * @tc.name   testModifyValidate0056
     * @tc.number SUB_ACCT_VALMOD_0056
     * @tc.desc   confirm field must repeat the new password exactly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyValidate0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0056 begin');
      const MAIL: string = '';
      const SIG: string = 'sig';
      const PWD: string = 'pass123';
      const CONF: string = 'pass123 ';
      const STORED: string = 'stored-pass';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.CONFIRM_MISMATCH');
      expect(CHECK).assertEqual(ModifyResult.CONFIRM_MISMATCH);
      expect(CHECK).assertEqual(5);
      expect(PWD === CONF).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0056 end');
    });

    /**
     * @tc.name   testModifyValidate0057
     * @tc.number SUB_ACCT_VALMOD_0057
     * @tc.desc   confirm field must repeat the new password exactly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyValidate0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0057 begin');
      const MAIL: string = '';
      const SIG: string = 'sig';
      const PWD: string = 'pass123';
      const CONF: string = ' pass123';
      const STORED: string = 'stored-pass';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.CONFIRM_MISMATCH');
      expect(CHECK).assertEqual(ModifyResult.CONFIRM_MISMATCH);
      expect(CHECK).assertEqual(5);
      expect(PWD === CONF).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0057 end');
    });

    /**
     * @tc.name   testModifyValidate0058
     * @tc.number SUB_ACCT_VALMOD_0058
     * @tc.desc   confirm field must repeat the new password exactly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyValidate0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0058 begin');
      const MAIL: string = '';
      const SIG: string = 'sig';
      const PWD: string = 'abcdef';
      const CONF: string = 'fedcba';
      const STORED: string = 'stored-pass';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.CONFIRM_MISMATCH');
      expect(CHECK).assertEqual(ModifyResult.CONFIRM_MISMATCH);
      expect(CHECK).assertEqual(5);
      expect(PWD === CONF).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0058 end');
    });

    /**
     * @tc.name   testModifyValidate0059
     * @tc.number SUB_ACCT_VALMOD_0059
     * @tc.desc   confirm field must repeat the new password exactly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyValidate0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0059 begin');
      const MAIL: string = '';
      const SIG: string = 'sig';
      const PWD: string = '123456';
      const CONF: string = '654321';
      const STORED: string = 'stored-pass';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.CONFIRM_MISMATCH');
      expect(CHECK).assertEqual(ModifyResult.CONFIRM_MISMATCH);
      expect(CHECK).assertEqual(5);
      expect(PWD === CONF).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0059 end');
    });

    /**
     * @tc.name   testModifyValidate0060
     * @tc.number SUB_ACCT_VALMOD_0060
     * @tc.desc   confirm field must repeat the new password exactly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyValidate0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0060 begin');
      const MAIL: string = '';
      const SIG: string = 'sig';
      const PWD: string = 'password';
      const CONF: string = 'password1';
      const STORED: string = 'stored-pass';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.CONFIRM_MISMATCH');
      expect(CHECK).assertEqual(ModifyResult.CONFIRM_MISMATCH);
      expect(CHECK).assertEqual(5);
      expect(PWD === CONF).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0060 end');
    });

    /**
     * @tc.name   testModifyValidate0061
     * @tc.number SUB_ACCT_VALMOD_0061
     * @tc.desc   confirm field must repeat the new password exactly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyValidate0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0061 begin');
      const MAIL: string = '';
      const SIG: string = 'sig';
      const PWD: string = 'Abc123';
      const CONF: string = 'abc123';
      const STORED: string = 'stored-pass';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.CONFIRM_MISMATCH');
      expect(CHECK).assertEqual(ModifyResult.CONFIRM_MISMATCH);
      expect(CHECK).assertEqual(5);
      expect(PWD === CONF).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0061 end');
    });

    /**
     * @tc.name   testModifyValidate0062
     * @tc.number SUB_ACCT_VALMOD_0062
     * @tc.desc   confirm field must repeat the new password exactly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyValidate0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0062 begin');
      const MAIL: string = '';
      const SIG: string = 'sig';
      const PWD: string = 'qqqqqqqqqqqqqqqqqqqq';
      const CONF: string = 'qqqqqqqqqqqqqqqqqqq';
      const STORED: string = 'stored-pass';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.CONFIRM_MISMATCH');
      expect(CHECK).assertEqual(ModifyResult.CONFIRM_MISMATCH);
      expect(CHECK).assertEqual(5);
      expect(PWD === CONF).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0062 end');
    });

    /**
     * @tc.name   testModifyValidate0063
     * @tc.number SUB_ACCT_VALMOD_0063
     * @tc.desc   confirm field must repeat the new password exactly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyValidate0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0063 begin');
      const MAIL: string = '';
      const SIG: string = 'sig';
      const PWD: string = 'secret!';
      const CONF: string = 'secret';
      const STORED: string = 'stored-pass';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.CONFIRM_MISMATCH');
      expect(CHECK).assertEqual(ModifyResult.CONFIRM_MISMATCH);
      expect(CHECK).assertEqual(5);
      expect(PWD === CONF).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0063 end');
    });

    /**
     * @tc.name   testModifyValidate0064
     * @tc.number SUB_ACCT_VALMOD_0064
     * @tc.desc   confirm field must repeat the new password exactly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyValidate0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0064 begin');
      const MAIL: string = '';
      const SIG: string = 'sig';
      const PWD: string = 'aaaaaa';
      const CONF: string = 'aaaaab';
      const STORED: string = 'stored-pass';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.CONFIRM_MISMATCH');
      expect(CHECK).assertEqual(ModifyResult.CONFIRM_MISMATCH);
      expect(CHECK).assertEqual(5);
      expect(PWD === CONF).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0064 end');
    });

    /**
     * @tc.name   testModifyValidate0065
     * @tc.number SUB_ACCT_VALMOD_0065
     * @tc.desc   confirm field must repeat the new password exactly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyValidate0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0065 begin');
      const MAIL: string = '';
      const SIG: string = 'sig';
      const PWD: string = '000000';
      const CONF: string = '000001';
      const STORED: string = 'stored-pass';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.CONFIRM_MISMATCH');
      expect(CHECK).assertEqual(ModifyResult.CONFIRM_MISMATCH);
      expect(CHECK).assertEqual(5);
      expect(PWD === CONF).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0065 end');
    });

    /**
     * @tc.name   testModifyValidate0066
     * @tc.number SUB_ACCT_VALMOD_0066
     * @tc.desc   confirm field must repeat the new password exactly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyValidate0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0066 begin');
      const MAIL: string = '';
      const SIG: string = '';
      const PWD: string = 'ABCdef';
      const CONF: string = 'ABCdefg';
      const STORED: string = 'stored-pass';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.CONFIRM_MISMATCH');
      expect(CHECK).assertEqual(ModifyResult.CONFIRM_MISMATCH);
      expect(CHECK).assertEqual(5);
      expect(PWD === CONF).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0066 end');
    });

    /**
     * @tc.name   testModifyValidate0067
     * @tc.number SUB_ACCT_VALMOD_0067
     * @tc.desc   confirm field must repeat the new password exactly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyValidate0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0067 begin');
      const MAIL: string = '';
      const SIG: string = 'sig';
      const PWD: string = '密码密码密码';
      const CONF: string = '密码密码密码码';
      const STORED: string = 'stored-pass';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.CONFIRM_MISMATCH');
      expect(CHECK).assertEqual(ModifyResult.CONFIRM_MISMATCH);
      expect(CHECK).assertEqual(5);
      expect(PWD === CONF).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0067 end');
    });

    /**
     * @tc.name   testModifyValidate0068
     * @tc.number SUB_ACCT_VALMOD_0068
     * @tc.desc   confirm field must repeat the new password exactly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyValidate0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0068 begin');
      const MAIL: string = '';
      const SIG: string = 'sig';
      const PWD: string = 'zzzzzz';
      const CONF: string = 'zzzzzZ';
      const STORED: string = 'stored-pass';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.CONFIRM_MISMATCH');
      expect(CHECK).assertEqual(ModifyResult.CONFIRM_MISMATCH);
      expect(CHECK).assertEqual(5);
      expect(PWD === CONF).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0068 end');
    });

    /**
     * @tc.name   testModifyValidate0069
     * @tc.number SUB_ACCT_VALMOD_0069
     * @tc.desc   a fresh password with a matching confirm switches the account password
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyValidate0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0069 begin');
      const MAIL: string = 'tom@example.com';
      const SIG: string = 'sig';
      const PWD: string = 'pass123';
      const CONF: string = 'pass123';
      const STORED: string = 'stored-pass';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.OK_WITH_PASSWORD');
      expect(CHECK).assertEqual(ModifyResult.OK_WITH_PASSWORD);
      expect(CHECK).assertEqual(0);
      expect(AccountValidator.isPasswordLongEnough(PWD)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0069 end');
    });

    /**
     * @tc.name   testModifyValidate0070
     * @tc.number SUB_ACCT_VALMOD_0070
     * @tc.desc   a fresh password with a matching confirm switches the account password
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyValidate0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0070 begin');
      const MAIL: string = 'tom@example.com';
      const SIG: string = '';
      const PWD: string = 'abcdef';
      const CONF: string = 'abcdef';
      const STORED: string = 'stored-pass';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.OK_WITH_PASSWORD');
      expect(CHECK).assertEqual(ModifyResult.OK_WITH_PASSWORD);
      expect(CHECK).assertEqual(0);
      expect(AccountValidator.isPasswordLongEnough(PWD)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0070 end');
    });

    /**
     * @tc.name   testModifyValidate0071
     * @tc.number SUB_ACCT_VALMOD_0071
     * @tc.desc   a fresh password with a matching confirm switches the account password
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyValidate0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0071 begin');
      const MAIL: string = 'tom@example.com';
      const SIG: string = 'sig';
      const PWD: string = '123456';
      const CONF: string = '123456';
      const STORED: string = 'stored-pass';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.OK_WITH_PASSWORD');
      expect(CHECK).assertEqual(ModifyResult.OK_WITH_PASSWORD);
      expect(CHECK).assertEqual(0);
      expect(AccountValidator.isPasswordLongEnough(PWD)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0071 end');
    });

    /**
     * @tc.name   testModifyValidate0072
     * @tc.number SUB_ACCT_VALMOD_0072
     * @tc.desc   a fresh password with a matching confirm switches the account password
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyValidate0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0072 begin');
      const MAIL: string = 'tom@example.com';
      const SIG: string = 'sig';
      const PWD: string = '      ';
      const CONF: string = '      ';
      const STORED: string = 'stored-pass';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.OK_WITH_PASSWORD');
      expect(CHECK).assertEqual(ModifyResult.OK_WITH_PASSWORD);
      expect(CHECK).assertEqual(0);
      expect(AccountValidator.isPasswordLongEnough(PWD)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0072 end');
    });

    /**
     * @tc.name   testModifyValidate0073
     * @tc.number SUB_ACCT_VALMOD_0073
     * @tc.desc   a fresh password with a matching confirm switches the account password
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyValidate0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0073 begin');
      const MAIL: string = 'tom@example.com';
      const SIG: string = 'sig';
      const PWD: string = '晴天晴天晴天';
      const CONF: string = '晴天晴天晴天';
      const STORED: string = 'stored-pass';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.OK_WITH_PASSWORD');
      expect(CHECK).assertEqual(ModifyResult.OK_WITH_PASSWORD);
      expect(CHECK).assertEqual(0);
      expect(AccountValidator.isPasswordLongEnough(PWD)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0073 end');
    });

    /**
     * @tc.name   testModifyValidate0074
     * @tc.number SUB_ACCT_VALMOD_0074
     * @tc.desc   a fresh password with a matching confirm switches the account password
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyValidate0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0074 begin');
      const MAIL: string = 'tom@example.com';
      const SIG: string = 'sig';
      const PWD: string = 'pppppppppppppppppppp';
      const CONF: string = 'pppppppppppppppppppp';
      const STORED: string = 'stored-pass';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.OK_WITH_PASSWORD');
      expect(CHECK).assertEqual(ModifyResult.OK_WITH_PASSWORD);
      expect(CHECK).assertEqual(0);
      expect(AccountValidator.isPasswordLongEnough(PWD)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0074 end');
    });

    /**
     * @tc.name   testModifyValidate0075
     * @tc.number SUB_ACCT_VALMOD_0075
     * @tc.desc   a fresh password with a matching confirm switches the account password
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyValidate0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0075 begin');
      const MAIL: string = 'tom@example.com';
      const SIG: string = 'sig';
      const PWD: string = 'Password1!';
      const CONF: string = 'Password1!';
      const STORED: string = 'stored-pass';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.OK_WITH_PASSWORD');
      expect(CHECK).assertEqual(ModifyResult.OK_WITH_PASSWORD);
      expect(CHECK).assertEqual(0);
      expect(AccountValidator.isPasswordLongEnough(PWD)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0075 end');
    });

    /**
     * @tc.name   testModifyValidate0076
     * @tc.number SUB_ACCT_VALMOD_0076
     * @tc.desc   a fresh password with a matching confirm switches the account password
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyValidate0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0076 begin');
      const MAIL: string = 'tom@example.com';
      const SIG: string = '';
      const PWD: string = 'qwerty';
      const CONF: string = 'qwerty';
      const STORED: string = 'stored-pass';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.OK_WITH_PASSWORD');
      expect(CHECK).assertEqual(ModifyResult.OK_WITH_PASSWORD);
      expect(CHECK).assertEqual(0);
      expect(AccountValidator.isPasswordLongEnough(PWD)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0076 end');
    });

    /**
     * @tc.name   testModifyValidate0077
     * @tc.number SUB_ACCT_VALMOD_0077
     * @tc.desc   a fresh password with a matching confirm switches the account password
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyValidate0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0077 begin');
      const MAIL: string = 'tom@example.com';
      const SIG: string = 'sig';
      const PWD: string = 'Abcdef';
      const CONF: string = 'Abcdef';
      const STORED: string = 'stored-pass';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.OK_WITH_PASSWORD');
      expect(CHECK).assertEqual(ModifyResult.OK_WITH_PASSWORD);
      expect(CHECK).assertEqual(0);
      expect(AccountValidator.isPasswordLongEnough(PWD)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0077 end');
    });

    /**
     * @tc.name   testModifyValidate0078
     * @tc.number SUB_ACCT_VALMOD_0078
     * @tc.desc   a fresh password with a matching confirm switches the account password
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyValidate0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0078 begin');
      const MAIL: string = 'tom@example.com';
      const SIG: string = 'sig';
      const PWD: string = '😀😀😀';
      const CONF: string = '😀😀😀';
      const STORED: string = 'stored-pass';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.OK_WITH_PASSWORD');
      expect(CHECK).assertEqual(ModifyResult.OK_WITH_PASSWORD);
      expect(CHECK).assertEqual(0);
      expect(AccountValidator.isPasswordLongEnough(PWD)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0078 end');
    });

    /**
     * @tc.name   testModifyValidate0079
     * @tc.number SUB_ACCT_VALMOD_0079
     * @tc.desc   a fresh password with a matching confirm switches the account password
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyValidate0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0079 begin');
      const MAIL: string = 'tom@example.com';
      const SIG: string = 'sig';
      const PWD: string = 'abc123';
      const CONF: string = 'abc123';
      const STORED: string = 'stored-pass';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.OK_WITH_PASSWORD');
      expect(CHECK).assertEqual(ModifyResult.OK_WITH_PASSWORD);
      expect(CHECK).assertEqual(0);
      expect(AccountValidator.isPasswordLongEnough(PWD)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0079 end');
    });

    /**
     * @tc.name   testModifyValidate0080
     * @tc.number SUB_ACCT_VALMOD_0080
     * @tc.desc   a fresh password with a matching confirm switches the account password
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyValidate0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0080 begin');
      const MAIL: string = 'tom@example.com';
      const SIG: string = 'sig';
      const PWD: string = 'hello1';
      const CONF: string = 'hello1';
      const STORED: string = 'stored-pass';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.OK_WITH_PASSWORD');
      expect(CHECK).assertEqual(ModifyResult.OK_WITH_PASSWORD);
      expect(CHECK).assertEqual(0);
      expect(AccountValidator.isPasswordLongEnough(PWD)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0080 end');
    });

    /**
     * @tc.name   testModifyValidate0081
     * @tc.number SUB_ACCT_VALMOD_0081
     * @tc.desc   an untouched password keeps the stored credential and only updates the profile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyValidate0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0081 begin');
      const MAIL: string = 'tom@example.com';
      const SIG: string = 'sig';
      const PWD: string = '';
      const CONF: string = '';
      const STORED: string = '';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.OK_WITHOUT_PASSWORD');
      expect(CHECK).assertEqual(ModifyResult.OK_WITHOUT_PASSWORD);
      expect(CHECK).assertEqual(1);
      expect(PWD === '').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0081 end');
    });

    /**
     * @tc.name   testModifyValidate0082
     * @tc.number SUB_ACCT_VALMOD_0082
     * @tc.desc   an untouched password keeps the stored credential and only updates the profile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyValidate0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0082 begin');
      const MAIL: string = '';
      const SIG: string = '';
      const PWD: string = '';
      const CONF: string = '';
      const STORED: string = 'stored-pass';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.OK_WITHOUT_PASSWORD');
      expect(CHECK).assertEqual(ModifyResult.OK_WITHOUT_PASSWORD);
      expect(CHECK).assertEqual(1);
      expect(PWD === '').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0082 end');
    });

    /**
     * @tc.name   testModifyValidate0083
     * @tc.number SUB_ACCT_VALMOD_0083
     * @tc.desc   an untouched password keeps the stored credential and only updates the profile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyValidate0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0083 begin');
      const MAIL: string = '';
      const SIG: string = 'long-signature-value-here';
      const PWD: string = '';
      const CONF: string = '';
      const STORED: string = 'stored-pass';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.OK_WITHOUT_PASSWORD');
      expect(CHECK).assertEqual(ModifyResult.OK_WITHOUT_PASSWORD);
      expect(CHECK).assertEqual(1);
      expect(PWD === '').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0083 end');
    });

    /**
     * @tc.name   testModifyValidate0084
     * @tc.number SUB_ACCT_VALMOD_0084
     * @tc.desc   an untouched password keeps the stored credential and only updates the profile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyValidate0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0084 begin');
      const MAIL: string = 'tom@example.com';
      const SIG: string = '中文签名';
      const PWD: string = '';
      const CONF: string = '';
      const STORED: string = 'stored-pass';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.OK_WITHOUT_PASSWORD');
      expect(CHECK).assertEqual(ModifyResult.OK_WITHOUT_PASSWORD);
      expect(CHECK).assertEqual(1);
      expect(PWD === '').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0084 end');
    });

    /**
     * @tc.name   testModifyValidate0085
     * @tc.number SUB_ACCT_VALMOD_0085
     * @tc.desc   an untouched password keeps the stored credential and only updates the profile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyValidate0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0085 begin');
      const MAIL: string = '';
      const SIG: string = 'sig';
      const PWD: string = '';
      const CONF: string = '';
      const STORED: string = '';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.OK_WITHOUT_PASSWORD');
      expect(CHECK).assertEqual(ModifyResult.OK_WITHOUT_PASSWORD);
      expect(CHECK).assertEqual(1);
      expect(PWD === '').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0085 end');
    });

    /**
     * @tc.name   testModifyValidate0086
     * @tc.number SUB_ACCT_VALMOD_0086
     * @tc.desc   an untouched password keeps the stored credential and only updates the profile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyValidate0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0086 begin');
      const MAIL: string = '';
      const SIG: string = '';
      const PWD: string = '';
      const CONF: string = '';
      const STORED: string = 'stored-pass';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.OK_WITHOUT_PASSWORD');
      expect(CHECK).assertEqual(ModifyResult.OK_WITHOUT_PASSWORD);
      expect(CHECK).assertEqual(1);
      expect(PWD === '').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0086 end');
    });

    /**
     * @tc.name   testModifyValidate0087
     * @tc.number SUB_ACCT_VALMOD_0087
     * @tc.desc   an untouched password keeps the stored credential and only updates the profile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyValidate0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0087 begin');
      const MAIL: string = 'tom@example.com';
      const SIG: string = 'sig';
      const PWD: string = '';
      const CONF: string = '';
      const STORED: string = 'stored-pass';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.OK_WITHOUT_PASSWORD');
      expect(CHECK).assertEqual(ModifyResult.OK_WITHOUT_PASSWORD);
      expect(CHECK).assertEqual(1);
      expect(PWD === '').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0087 end');
    });

    /**
     * @tc.name   testModifyValidate0088
     * @tc.number SUB_ACCT_VALMOD_0088
     * @tc.desc   an untouched password keeps the stored credential and only updates the profile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyValidate0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0088 begin');
      const MAIL: string = '';
      const SIG: string = '';
      const PWD: string = '';
      const CONF: string = '';
      const STORED: string = 'stored-pass';
      const CHECK: ModifyResult = AccountValidator.validateModify(modInput(MAIL, SIG, PWD, CONF), STORED);
      logPair(String(CHECK), 'ModifyResult.OK_WITHOUT_PASSWORD');
      expect(CHECK).assertEqual(ModifyResult.OK_WITHOUT_PASSWORD);
      expect(CHECK).assertEqual(1);
      expect(PWD === '').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyValidate0088 end');
    });

  });
}
