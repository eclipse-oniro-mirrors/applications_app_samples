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
import { AccountValidator, ModifyInput, ModifyResult } from '../../../main/ets/model/AccountValidator';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function modifyPriority01Test() {
  describe('ModifyPriority01Test', () => {

    /**
     * @tc.name   testModifyPriority010089
     * @tc.number SUB_ACCT_VALMOD_0089
     * @tc.desc   mailbox malformed alone -> EMAIL_INVALID -> EMAIL_INVALID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyPriority010089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010089 begin');
      const input: ModifyInput = { email: 'bad@', signature: 'sig', password: 'newpass1', confirmPassword: 'newpass1' };
      const stored: string = 'oldpass1';
      const result: ModifyResult = AccountValidator.validateModify(input, stored);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(ModifyResult.EMAIL_INVALID));
      expect(result).assertEqual(ModifyResult.EMAIL_INVALID);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(2));
      expect(Number(result)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateModify(input, 'zzz_other')), String(ModifyResult.EMAIL_INVALID));
      expect(AccountValidator.validateModify(input, 'zzz_other')).assertEqual(ModifyResult.EMAIL_INVALID);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010089 end');
    })

    /**
     * @tc.name   testModifyPriority010090
     * @tc.number SUB_ACCT_VALMOD_0090
     * @tc.desc   password of three alone -> PASSWORD_TOO_SHORT -> PASSWORD_TOO_SHORT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyPriority010090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010090 begin');
      const input: ModifyInput = { email: 'a@b.co', signature: 'sig', password: 'abc', confirmPassword: 'abc' };
      const stored: string = 'oldpass1';
      const result: ModifyResult = AccountValidator.validateModify(input, stored);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(ModifyResult.PASSWORD_TOO_SHORT));
      expect(result).assertEqual(ModifyResult.PASSWORD_TOO_SHORT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(3));
      expect(Number(result)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateModify(input, 'zzz_other')), String(ModifyResult.PASSWORD_TOO_SHORT));
      expect(AccountValidator.validateModify(input, 'zzz_other')).assertEqual(ModifyResult.PASSWORD_TOO_SHORT);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010090 end');
    })

    /**
     * @tc.name   testModifyPriority010091
     * @tc.number SUB_ACCT_VALMOD_0091
     * @tc.desc   password equals stored one -> SAME_AS_OLD -> PASSWORD_SAME_AS_OLD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyPriority010091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010091 begin');
      const input: ModifyInput = { email: 'a@b.co', signature: 'sig', password: 'oldpass1',
          confirmPassword: 'oldpass1' };
      const stored: string = 'oldpass1';
      const result: ModifyResult = AccountValidator.validateModify(input, stored);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(ModifyResult.PASSWORD_SAME_AS_OLD));
      expect(result).assertEqual(ModifyResult.PASSWORD_SAME_AS_OLD);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(4));
      expect(Number(result)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateModify(input, 'zzz_other')), String(ModifyResult.OK_WITH_PASSWORD));
      expect(AccountValidator.validateModify(input, 'zzz_other')).assertEqual(ModifyResult.OK_WITH_PASSWORD);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010091 end');
    })

    /**
     * @tc.name   testModifyPriority010092
     * @tc.number SUB_ACCT_VALMOD_0092
     * @tc.desc   confirm differs alone -> CONFIRM_MISMATCH -> CONFIRM_MISMATCH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyPriority010092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010092 begin');
      const input: ModifyInput = { email: 'a@b.co', signature: 'sig', password: 'newpass1',
          confirmPassword: 'newpass2' };
      const stored: string = 'oldpass1';
      const result: ModifyResult = AccountValidator.validateModify(input, stored);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(ModifyResult.CONFIRM_MISMATCH));
      expect(result).assertEqual(ModifyResult.CONFIRM_MISMATCH);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(5));
      expect(Number(result)).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateModify(input, 'zzz_other')), String(ModifyResult.CONFIRM_MISMATCH));
      expect(AccountValidator.validateModify(input, 'zzz_other')).assertEqual(ModifyResult.CONFIRM_MISMATCH);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010092 end');
    })

    /**
     * @tc.name   testModifyPriority010093
     * @tc.number SUB_ACCT_VALMOD_0093
     * @tc.desc   both password fields filled -> OK_WITH_PASSWORD -> OK_WITH_PASSWORD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyPriority010093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010093 begin');
      const input: ModifyInput = { email: 'a@b.co', signature: 'sig', password: 'newpass1',
          confirmPassword: 'newpass1' };
      const stored: string = 'oldpass1';
      const result: ModifyResult = AccountValidator.validateModify(input, stored);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(ModifyResult.OK_WITH_PASSWORD));
      expect(result).assertEqual(ModifyResult.OK_WITH_PASSWORD);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(0));
      expect(Number(result)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateModify(input, 'zzz_other')), String(ModifyResult.OK_WITH_PASSWORD));
      expect(AccountValidator.validateModify(input, 'zzz_other')).assertEqual(ModifyResult.OK_WITH_PASSWORD);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010093 end');
    })

    /**
     * @tc.name   testModifyPriority010094
     * @tc.number SUB_ACCT_VALMOD_0094
     * @tc.desc   both password fields blank -> OK_WITHOUT_PASSWORD -> OK_WITHOUT_PASSWORD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyPriority010094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010094 begin');
      const input: ModifyInput = { email: 'a@b.co', signature: 'sig', password: '', confirmPassword: '' };
      const stored: string = 'oldpass1';
      const result: ModifyResult = AccountValidator.validateModify(input, stored);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(ModifyResult.OK_WITHOUT_PASSWORD));
      expect(result).assertEqual(ModifyResult.OK_WITHOUT_PASSWORD);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(1));
      expect(Number(result)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateModify(input, 'zzz_other')), String(ModifyResult.OK_WITHOUT_PASSWORD));
      expect(AccountValidator.validateModify(input, 'zzz_other')).assertEqual(ModifyResult.OK_WITHOUT_PASSWORD);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010094 end');
    })

    /**
     * @tc.name   testModifyPriority010095
     * @tc.number SUB_ACCT_VALMOD_0095
     * @tc.desc   malformed mailbox beats short password -> EMAIL_INVALID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyPriority010095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010095 begin');
      const input: ModifyInput = { email: 'bad@', signature: 'sig', password: 'abc', confirmPassword: 'abc' };
      const stored: string = 'oldpass1';
      const result: ModifyResult = AccountValidator.validateModify(input, stored);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(ModifyResult.EMAIL_INVALID));
      expect(result).assertEqual(ModifyResult.EMAIL_INVALID);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(2));
      expect(Number(result)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateModify(input, 'zzz_other')), String(ModifyResult.EMAIL_INVALID));
      expect(AccountValidator.validateModify(input, 'zzz_other')).assertEqual(ModifyResult.EMAIL_INVALID);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010095 end');
    })

    /**
     * @tc.name   testModifyPriority010096
     * @tc.number SUB_ACCT_VALMOD_0096
     * @tc.desc   malformed mailbox beats same as stored -> EMAIL_INVALID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyPriority010096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010096 begin');
      const input: ModifyInput = { email: 'bad@', signature: 'sig', password: 'oldpass1', confirmPassword: 'oldpass1' };
      const stored: string = 'oldpass1';
      const result: ModifyResult = AccountValidator.validateModify(input, stored);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(ModifyResult.EMAIL_INVALID));
      expect(result).assertEqual(ModifyResult.EMAIL_INVALID);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(2));
      expect(Number(result)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateModify(input, 'zzz_other')), String(ModifyResult.EMAIL_INVALID));
      expect(AccountValidator.validateModify(input, 'zzz_other')).assertEqual(ModifyResult.EMAIL_INVALID);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010096 end');
    })

    /**
     * @tc.name   testModifyPriority010097
     * @tc.number SUB_ACCT_VALMOD_0097
     * @tc.desc   malformed mailbox beats mismatched confirm -> EMAIL_INVALID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyPriority010097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010097 begin');
      const input: ModifyInput = { email: 'bad@', signature: 'sig', password: 'newpass1', confirmPassword: 'newpass2' };
      const stored: string = 'oldpass1';
      const result: ModifyResult = AccountValidator.validateModify(input, stored);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(ModifyResult.EMAIL_INVALID));
      expect(result).assertEqual(ModifyResult.EMAIL_INVALID);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(2));
      expect(Number(result)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateModify(input, 'zzz_other')), String(ModifyResult.EMAIL_INVALID));
      expect(AccountValidator.validateModify(input, 'zzz_other')).assertEqual(ModifyResult.EMAIL_INVALID);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010097 end');
    })

    /**
     * @tc.name   testModifyPriority010098
     * @tc.number SUB_ACCT_VALMOD_0098
     * @tc.desc   malformed mailbox beats filled password -> EMAIL_INVALID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyPriority010098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010098 begin');
      const input: ModifyInput = { email: 'bad@', signature: 'sig', password: 'newpass1', confirmPassword: 'newpass1' };
      const stored: string = 'oldpass1';
      const result: ModifyResult = AccountValidator.validateModify(input, stored);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(ModifyResult.EMAIL_INVALID));
      expect(result).assertEqual(ModifyResult.EMAIL_INVALID);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(2));
      expect(Number(result)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateModify(input, 'zzz_other')), String(ModifyResult.EMAIL_INVALID));
      expect(AccountValidator.validateModify(input, 'zzz_other')).assertEqual(ModifyResult.EMAIL_INVALID);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010098 end');
    })

    /**
     * @tc.name   testModifyPriority010099
     * @tc.number SUB_ACCT_VALMOD_0099
     * @tc.desc   short password also equals the stored value -> PASSWORD_TOO_SHORT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyPriority010099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010099 begin');
      const input: ModifyInput = { email: 'a@b.co', signature: 'sig', password: 'abc', confirmPassword: 'abc' };
      const stored: string = 'abc';
      const result: ModifyResult = AccountValidator.validateModify(input, stored);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(ModifyResult.PASSWORD_TOO_SHORT));
      expect(result).assertEqual(ModifyResult.PASSWORD_TOO_SHORT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(3));
      expect(Number(result)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateModify(input, 'zzz_other')), String(ModifyResult.PASSWORD_TOO_SHORT));
      expect(AccountValidator.validateModify(input, 'zzz_other')).assertEqual(ModifyResult.PASSWORD_TOO_SHORT);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010099 end');
    })

    /**
     * @tc.name   testModifyPriority010100
     * @tc.number SUB_ACCT_VALMOD_0100
     * @tc.desc   short password with mismatched confirm -> PASSWORD_TOO_SHORT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyPriority010100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010100 begin');
      const input: ModifyInput = { email: 'a@b.co', signature: 'sig', password: 'abc', confirmPassword: 'xyz' };
      const stored: string = 'oldpass1';
      const result: ModifyResult = AccountValidator.validateModify(input, stored);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(ModifyResult.PASSWORD_TOO_SHORT));
      expect(result).assertEqual(ModifyResult.PASSWORD_TOO_SHORT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(3));
      expect(Number(result)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateModify(input, 'zzz_other')), String(ModifyResult.PASSWORD_TOO_SHORT));
      expect(AccountValidator.validateModify(input, 'zzz_other')).assertEqual(ModifyResult.PASSWORD_TOO_SHORT);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010100 end');
    })

    /**
     * @tc.name   testModifyPriority010101
     * @tc.number SUB_ACCT_VALMOD_0101
     * @tc.desc   short password with both fields filled -> PASSWORD_TOO_SHORT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyPriority010101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010101 begin');
      const input: ModifyInput = { email: 'a@b.co', signature: 'sig', password: 'abc', confirmPassword: 'abc' };
      const stored: string = 'oldpass1';
      const result: ModifyResult = AccountValidator.validateModify(input, stored);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(ModifyResult.PASSWORD_TOO_SHORT));
      expect(result).assertEqual(ModifyResult.PASSWORD_TOO_SHORT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(3));
      expect(Number(result)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateModify(input, 'zzz_other')), String(ModifyResult.PASSWORD_TOO_SHORT));
      expect(AccountValidator.validateModify(input, 'zzz_other')).assertEqual(ModifyResult.PASSWORD_TOO_SHORT);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010101 end');
    })

    /**
     * @tc.name   testModifyPriority010102
     * @tc.number SUB_ACCT_VALMOD_0102
     * @tc.desc   stored password repeated with mismatched confirm -> PASSWORD_SAME_AS_OLD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyPriority010102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010102 begin');
      const input: ModifyInput = { email: 'a@b.co', signature: 'sig', password: 'oldpass1', confirmPassword: 'xyz' };
      const stored: string = 'oldpass1';
      const result: ModifyResult = AccountValidator.validateModify(input, stored);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(ModifyResult.PASSWORD_SAME_AS_OLD));
      expect(result).assertEqual(ModifyResult.PASSWORD_SAME_AS_OLD);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(4));
      expect(Number(result)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateModify(input, 'zzz_other')), String(ModifyResult.CONFIRM_MISMATCH));
      expect(AccountValidator.validateModify(input, 'zzz_other')).assertEqual(ModifyResult.CONFIRM_MISMATCH);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010102 end');
    })

    /**
     * @tc.name   testModifyPriority010103
     * @tc.number SUB_ACCT_VALMOD_0103
     * @tc.desc   malformed mailbox with both password fields blank -> EMAIL_INVALID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyPriority010103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010103 begin');
      const input: ModifyInput = { email: 'bad@', signature: 'sig', password: '', confirmPassword: '' };
      const stored: string = 'oldpass1';
      const result: ModifyResult = AccountValidator.validateModify(input, stored);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(ModifyResult.EMAIL_INVALID));
      expect(result).assertEqual(ModifyResult.EMAIL_INVALID);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(2));
      expect(Number(result)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateModify(input, 'zzz_other')), String(ModifyResult.EMAIL_INVALID));
      expect(AccountValidator.validateModify(input, 'zzz_other')).assertEqual(ModifyResult.EMAIL_INVALID);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010103 end');
    })

    /**
     * @tc.name   testModifyPriority010104
     * @tc.number SUB_ACCT_VALMOD_0104
     * @tc.desc   blank password with a non blank confirm -> CONFIRM_MISMATCH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyPriority010104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010104 begin');
      const input: ModifyInput = { email: 'a@b.co', signature: 'sig', password: '', confirmPassword: 'xyz' };
      const stored: string = 'oldpass1';
      const result: ModifyResult = AccountValidator.validateModify(input, stored);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(ModifyResult.CONFIRM_MISMATCH));
      expect(result).assertEqual(ModifyResult.CONFIRM_MISMATCH);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(5));
      expect(Number(result)).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateModify(input, 'zzz_other')), String(ModifyResult.CONFIRM_MISMATCH));
      expect(AccountValidator.validateModify(input, 'zzz_other')).assertEqual(ModifyResult.CONFIRM_MISMATCH);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010104 end');
    })

    /**
     * @tc.name   testModifyPriority010105
     * @tc.number SUB_ACCT_VALMOD_0105
     * @tc.desc   malformed mailbox, short password, equals stored -> EMAIL_INVALID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyPriority010105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010105 begin');
      const input: ModifyInput = { email: 'bad@', signature: 'sig', password: 'abc', confirmPassword: 'abc' };
      const stored: string = 'abc';
      const result: ModifyResult = AccountValidator.validateModify(input, stored);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(ModifyResult.EMAIL_INVALID));
      expect(result).assertEqual(ModifyResult.EMAIL_INVALID);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(2));
      expect(Number(result)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateModify(input, 'zzz_other')), String(ModifyResult.EMAIL_INVALID));
      expect(AccountValidator.validateModify(input, 'zzz_other')).assertEqual(ModifyResult.EMAIL_INVALID);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010105 end');
    })

    /**
     * @tc.name   testModifyPriority010106
     * @tc.number SUB_ACCT_VALMOD_0106
     * @tc.desc   short password equals stored and confirm differs -> PASSWORD_TOO_SHORT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyPriority010106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010106 begin');
      const input: ModifyInput = { email: 'a@b.co', signature: 'sig', password: 'abc', confirmPassword: 'xyz' };
      const stored: string = 'abc';
      const result: ModifyResult = AccountValidator.validateModify(input, stored);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(ModifyResult.PASSWORD_TOO_SHORT));
      expect(result).assertEqual(ModifyResult.PASSWORD_TOO_SHORT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(3));
      expect(Number(result)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateModify(input, 'zzz_other')), String(ModifyResult.PASSWORD_TOO_SHORT));
      expect(AccountValidator.validateModify(input, 'zzz_other')).assertEqual(ModifyResult.PASSWORD_TOO_SHORT);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010106 end');
    })

    /**
     * @tc.name   testModifyPriority010107
     * @tc.number SUB_ACCT_VALMOD_0107
     * @tc.desc   malformed mailbox, blank password, non blank confirm -> EMAIL_INVALID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyPriority010107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010107 begin');
      const input: ModifyInput = { email: 'bad@', signature: 'sig', password: '', confirmPassword: 'xyz' };
      const stored: string = 'oldpass1';
      const result: ModifyResult = AccountValidator.validateModify(input, stored);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(ModifyResult.EMAIL_INVALID));
      expect(result).assertEqual(ModifyResult.EMAIL_INVALID);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(2));
      expect(Number(result)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateModify(input, 'zzz_other')), String(ModifyResult.EMAIL_INVALID));
      expect(AccountValidator.validateModify(input, 'zzz_other')).assertEqual(ModifyResult.EMAIL_INVALID);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010107 end');
    })

    /**
     * @tc.name   testModifyPriority010108
     * @tc.number SUB_ACCT_VALMOD_0108
     * @tc.desc   short password with both fields filled again -> PASSWORD_TOO_SHORT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyPriority010108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010108 begin');
      const input: ModifyInput = { email: 'a@b.co', signature: 'sig', password: 'abc', confirmPassword: 'abc' };
      const stored: string = 'oldpass1';
      const result: ModifyResult = AccountValidator.validateModify(input, stored);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(ModifyResult.PASSWORD_TOO_SHORT));
      expect(result).assertEqual(ModifyResult.PASSWORD_TOO_SHORT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(3));
      expect(Number(result)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateModify(input, 'zzz_other')), String(ModifyResult.PASSWORD_TOO_SHORT));
      expect(AccountValidator.validateModify(input, 'zzz_other')).assertEqual(ModifyResult.PASSWORD_TOO_SHORT);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010108 end');
    })

    /**
     * @tc.name   testModifyPriority010109
     * @tc.number SUB_ACCT_VALMOD_0109
     * @tc.desc   stored repeated with mismatched confirm again -> PASSWORD_SAME_AS_OLD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyPriority010109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010109 begin');
      const input: ModifyInput = { email: 'a@b.co', signature: 'sig', password: 'oldpass1', confirmPassword: 'xyz' };
      const stored: string = 'oldpass1';
      const result: ModifyResult = AccountValidator.validateModify(input, stored);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(ModifyResult.PASSWORD_SAME_AS_OLD));
      expect(result).assertEqual(ModifyResult.PASSWORD_SAME_AS_OLD);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(4));
      expect(Number(result)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateModify(input, 'zzz_other')), String(ModifyResult.CONFIRM_MISMATCH));
      expect(AccountValidator.validateModify(input, 'zzz_other')).assertEqual(ModifyResult.CONFIRM_MISMATCH);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010109 end');
    })

    /**
     * @tc.name   testModifyPriority010110
     * @tc.number SUB_ACCT_VALMOD_0110
     * @tc.desc   malformed mailbox with stored repeated -> EMAIL_INVALID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyPriority010110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010110 begin');
      const input: ModifyInput = { email: 'bad@', signature: 'sig', password: 'oldpass1', confirmPassword: 'oldpass1' };
      const stored: string = 'oldpass1';
      const result: ModifyResult = AccountValidator.validateModify(input, stored);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(ModifyResult.EMAIL_INVALID));
      expect(result).assertEqual(ModifyResult.EMAIL_INVALID);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(2));
      expect(Number(result)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateModify(input, 'zzz_other')), String(ModifyResult.EMAIL_INVALID));
      expect(AccountValidator.validateModify(input, 'zzz_other')).assertEqual(ModifyResult.EMAIL_INVALID);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010110 end');
    })

    /**
     * @tc.name   testModifyPriority010111
     * @tc.number SUB_ACCT_VALMOD_0111
     * @tc.desc   short password and mismatched confirm -> PASSWORD_TOO_SHORT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyPriority010111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010111 begin');
      const input: ModifyInput = { email: 'a@b.co', signature: 'sig', password: 'abc', confirmPassword: 'xyz' };
      const stored: string = 'oldpass1';
      const result: ModifyResult = AccountValidator.validateModify(input, stored);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(ModifyResult.PASSWORD_TOO_SHORT));
      expect(result).assertEqual(ModifyResult.PASSWORD_TOO_SHORT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(3));
      expect(Number(result)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateModify(input, 'zzz_other')), String(ModifyResult.PASSWORD_TOO_SHORT));
      expect(AccountValidator.validateModify(input, 'zzz_other')).assertEqual(ModifyResult.PASSWORD_TOO_SHORT);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010111 end');
    })

    /**
     * @tc.name   testModifyPriority010112
     * @tc.number SUB_ACCT_VALMOD_0112
     * @tc.desc   malformed mailbox with a valid new password -> EMAIL_INVALID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyPriority010112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010112 begin');
      const input: ModifyInput = { email: 'bad@', signature: 'sig', password: 'newpass1', confirmPassword: 'newpass1' };
      const stored: string = 'oldpass1';
      const result: ModifyResult = AccountValidator.validateModify(input, stored);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(ModifyResult.EMAIL_INVALID));
      expect(result).assertEqual(ModifyResult.EMAIL_INVALID);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(2));
      expect(Number(result)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateModify(input, 'zzz_other')), String(ModifyResult.EMAIL_INVALID));
      expect(AccountValidator.validateModify(input, 'zzz_other')).assertEqual(ModifyResult.EMAIL_INVALID);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010112 end');
    })

    /**
     * @tc.name   testModifyPriority010113
     * @tc.number SUB_ACCT_VALMOD_0113
     * @tc.desc   blank mailbox with blank password keeps only profile -> OK_WITHOUT_PASSWORD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyPriority010113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010113 begin');
      const input: ModifyInput = { email: '', signature: 'sig', password: '', confirmPassword: '' };
      const stored: string = 'oldpass1';
      const result: ModifyResult = AccountValidator.validateModify(input, stored);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(ModifyResult.OK_WITHOUT_PASSWORD));
      expect(result).assertEqual(ModifyResult.OK_WITHOUT_PASSWORD);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(1));
      expect(Number(result)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateModify(input, 'zzz_other')), String(ModifyResult.OK_WITHOUT_PASSWORD));
      expect(AccountValidator.validateModify(input, 'zzz_other')).assertEqual(ModifyResult.OK_WITHOUT_PASSWORD);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010113 end');
    })

    /**
     * @tc.name   testModifyPriority010114
     * @tc.number SUB_ACCT_VALMOD_0114
     * @tc.desc   blank mailbox with a new password -> OK_WITH_PASSWORD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyPriority010114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010114 begin');
      const input: ModifyInput = { email: '', signature: 'sig', password: 'newpass1', confirmPassword: 'newpass1' };
      const stored: string = 'oldpass1';
      const result: ModifyResult = AccountValidator.validateModify(input, stored);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(ModifyResult.OK_WITH_PASSWORD));
      expect(result).assertEqual(ModifyResult.OK_WITH_PASSWORD);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(0));
      expect(Number(result)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateModify(input, 'zzz_other')), String(ModifyResult.OK_WITH_PASSWORD));
      expect(AccountValidator.validateModify(input, 'zzz_other')).assertEqual(ModifyResult.OK_WITH_PASSWORD);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010114 end');
    })

    /**
     * @tc.name   testModifyPriority010115
     * @tc.number SUB_ACCT_VALMOD_0115
     * @tc.desc   five char password is rejected -> PASSWORD_TOO_SHORT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyPriority010115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010115 begin');
      const input: ModifyInput = { email: 'a@b.co', signature: 'sig', password: 'abcde', confirmPassword: 'abcde' };
      const stored: string = 'oldpass1';
      const result: ModifyResult = AccountValidator.validateModify(input, stored);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(ModifyResult.PASSWORD_TOO_SHORT));
      expect(result).assertEqual(ModifyResult.PASSWORD_TOO_SHORT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(3));
      expect(Number(result)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateModify(input, 'zzz_other')), String(ModifyResult.PASSWORD_TOO_SHORT));
      expect(AccountValidator.validateModify(input, 'zzz_other')).assertEqual(ModifyResult.PASSWORD_TOO_SHORT);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010115 end');
    })

    /**
     * @tc.name   testModifyPriority010116
     * @tc.number SUB_ACCT_VALMOD_0116
     * @tc.desc   six char password is accepted -> OK_WITH_PASSWORD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyPriority010116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010116 begin');
      const input: ModifyInput = { email: 'a@b.co', signature: 'sig', password: 'abcdef', confirmPassword: 'abcdef' };
      const stored: string = 'oldpass1';
      const result: ModifyResult = AccountValidator.validateModify(input, stored);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(ModifyResult.OK_WITH_PASSWORD));
      expect(result).assertEqual(ModifyResult.OK_WITH_PASSWORD);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(0));
      expect(Number(result)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateModify(input, 'zzz_other')), String(ModifyResult.OK_WITH_PASSWORD));
      expect(AccountValidator.validateModify(input, 'zzz_other')).assertEqual(ModifyResult.OK_WITH_PASSWORD);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010116 end');
    })

    /**
     * @tc.name   testModifyPriority010117
     * @tc.number SUB_ACCT_VALMOD_0117
     * @tc.desc   five char password equals a five char stored one -> PASSWORD_TOO_SHORT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyPriority010117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010117 begin');
      const input: ModifyInput = { email: 'a@b.co', signature: 'sig', password: 'abcde', confirmPassword: 'abcde' };
      const stored: string = 'abcde';
      const result: ModifyResult = AccountValidator.validateModify(input, stored);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(ModifyResult.PASSWORD_TOO_SHORT));
      expect(result).assertEqual(ModifyResult.PASSWORD_TOO_SHORT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(3));
      expect(Number(result)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateModify(input, 'zzz_other')), String(ModifyResult.PASSWORD_TOO_SHORT));
      expect(AccountValidator.validateModify(input, 'zzz_other')).assertEqual(ModifyResult.PASSWORD_TOO_SHORT);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010117 end');
    })

    /**
     * @tc.name   testModifyPriority010118
     * @tc.number SUB_ACCT_VALMOD_0118
     * @tc.desc   valid password equals the stored one -> PASSWORD_SAME_AS_OLD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyPriority010118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010118 begin');
      const input: ModifyInput = { email: 'a@b.co', signature: 'sig', password: 'newpass1',
          confirmPassword: 'newpass1' };
      const stored: string = 'newpass1';
      const result: ModifyResult = AccountValidator.validateModify(input, stored);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(ModifyResult.PASSWORD_SAME_AS_OLD));
      expect(result).assertEqual(ModifyResult.PASSWORD_SAME_AS_OLD);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(4));
      expect(Number(result)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateModify(input, 'zzz_other')), String(ModifyResult.OK_WITH_PASSWORD));
      expect(AccountValidator.validateModify(input, 'zzz_other')).assertEqual(ModifyResult.OK_WITH_PASSWORD);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010118 end');
    })

    /**
     * @tc.name   testModifyPriority010119
     * @tc.number SUB_ACCT_VALMOD_0119
     * @tc.desc   filled password with blank confirm -> CONFIRM_MISMATCH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyPriority010119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010119 begin');
      const input: ModifyInput = { email: 'a@b.co', signature: 'sig', password: 'newpass1', confirmPassword: '' };
      const stored: string = 'oldpass1';
      const result: ModifyResult = AccountValidator.validateModify(input, stored);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(ModifyResult.CONFIRM_MISMATCH));
      expect(result).assertEqual(ModifyResult.CONFIRM_MISMATCH);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(5));
      expect(Number(result)).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateModify(input, 'zzz_other')), String(ModifyResult.CONFIRM_MISMATCH));
      expect(AccountValidator.validateModify(input, 'zzz_other')).assertEqual(ModifyResult.CONFIRM_MISMATCH);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010119 end');
    })

    /**
     * @tc.name   testModifyPriority010120
     * @tc.number SUB_ACCT_VALMOD_0120
     * @tc.desc   blank password with one char confirm -> CONFIRM_MISMATCH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyPriority010120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010120 begin');
      const input: ModifyInput = { email: 'a@b.co', signature: 'sig', password: '', confirmPassword: 'x' };
      const stored: string = 'oldpass1';
      const result: ModifyResult = AccountValidator.validateModify(input, stored);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(ModifyResult.CONFIRM_MISMATCH));
      expect(result).assertEqual(ModifyResult.CONFIRM_MISMATCH);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(5));
      expect(Number(result)).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateModify(input, 'zzz_other')), String(ModifyResult.CONFIRM_MISMATCH));
      expect(AccountValidator.validateModify(input, 'zzz_other')).assertEqual(ModifyResult.CONFIRM_MISMATCH);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010120 end');
    })

    /**
     * @tc.name   testModifyPriority010121
     * @tc.number SUB_ACCT_VALMOD_0121
     * @tc.desc   malformed mailbox with everything else blank -> EMAIL_INVALID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyPriority010121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010121 begin');
      const input: ModifyInput = { email: 'bad@', signature: 'sig', password: '', confirmPassword: '' };
      const stored: string = 'oldpass1';
      const result: ModifyResult = AccountValidator.validateModify(input, stored);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(ModifyResult.EMAIL_INVALID));
      expect(result).assertEqual(ModifyResult.EMAIL_INVALID);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(2));
      expect(Number(result)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateModify(input, 'zzz_other')), String(ModifyResult.EMAIL_INVALID));
      expect(AccountValidator.validateModify(input, 'zzz_other')).assertEqual(ModifyResult.EMAIL_INVALID);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010121 end');
    })

    /**
     * @tc.name   testModifyPriority010122
     * @tc.number SUB_ACCT_VALMOD_0122
     * @tc.desc   blank signature keeps the password path -> OK_WITH_PASSWORD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyPriority010122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010122 begin');
      const input: ModifyInput = { email: 'a@b.co', signature: '', password: 'newpass1', confirmPassword: 'newpass1' };
      const stored: string = 'oldpass1';
      const result: ModifyResult = AccountValidator.validateModify(input, stored);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(ModifyResult.OK_WITH_PASSWORD));
      expect(result).assertEqual(ModifyResult.OK_WITH_PASSWORD);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(0));
      expect(Number(result)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateModify(input, 'zzz_other')), String(ModifyResult.OK_WITH_PASSWORD));
      expect(AccountValidator.validateModify(input, 'zzz_other')).assertEqual(ModifyResult.OK_WITH_PASSWORD);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010122 end');
    })

    /**
     * @tc.name   testModifyPriority010123
     * @tc.number SUB_ACCT_VALMOD_0123
     * @tc.desc   chinese signature keeps the password path -> OK_WITH_PASSWORD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyPriority010123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010123 begin');
      const input: ModifyInput = { email: 'a@b.co', signature: '签名', password: 'newpass1',
          confirmPassword: 'newpass1' };
      const stored: string = 'oldpass1';
      const result: ModifyResult = AccountValidator.validateModify(input, stored);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(ModifyResult.OK_WITH_PASSWORD));
      expect(result).assertEqual(ModifyResult.OK_WITH_PASSWORD);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(0));
      expect(Number(result)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateModify(input, 'zzz_other')), String(ModifyResult.OK_WITH_PASSWORD));
      expect(AccountValidator.validateModify(input, 'zzz_other')).assertEqual(ModifyResult.OK_WITH_PASSWORD);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010123 end');
    })

    /**
     * @tc.name   testModifyPriority010124
     * @tc.number SUB_ACCT_VALMOD_0124
     * @tc.desc   blank stored value accepts any new password -> OK_WITH_PASSWORD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyPriority010124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010124 begin');
      const input: ModifyInput = { email: 'a@b.co', signature: 'sig', password: 'newpass1',
          confirmPassword: 'newpass1' };
      const stored: string = '';
      const result: ModifyResult = AccountValidator.validateModify(input, stored);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(ModifyResult.OK_WITH_PASSWORD));
      expect(result).assertEqual(ModifyResult.OK_WITH_PASSWORD);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(0));
      expect(Number(result)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateModify(input, 'zzz_other')), String(ModifyResult.OK_WITH_PASSWORD));
      expect(AccountValidator.validateModify(input, 'zzz_other')).assertEqual(ModifyResult.OK_WITH_PASSWORD);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010124 end');
    })

    /**
     * @tc.name   testModifyPriority010125
     * @tc.number SUB_ACCT_VALMOD_0125
     * @tc.desc   blank password with blank stored value -> OK_WITHOUT_PASSWORD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyPriority010125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010125 begin');
      const input: ModifyInput = { email: 'a@b.co', signature: 'sig', password: '', confirmPassword: '' };
      const stored: string = '  ';
      const result: ModifyResult = AccountValidator.validateModify(input, stored);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(ModifyResult.OK_WITHOUT_PASSWORD));
      expect(result).assertEqual(ModifyResult.OK_WITHOUT_PASSWORD);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(1));
      expect(Number(result)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateModify(input, 'zzz_other')), String(ModifyResult.OK_WITHOUT_PASSWORD));
      expect(AccountValidator.validateModify(input, 'zzz_other')).assertEqual(ModifyResult.OK_WITHOUT_PASSWORD);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010125 end');
    })

    /**
     * @tc.name   testModifyPriority010126
     * @tc.number SUB_ACCT_VALMOD_0126
     * @tc.desc   one char top level domain is rejected -> EMAIL_INVALID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyPriority010126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010126 begin');
      const input: ModifyInput = { email: 'a@b.c', signature: 'sig', password: 'newpass1',
          confirmPassword: 'newpass1' };
      const stored: string = 'oldpass1';
      const result: ModifyResult = AccountValidator.validateModify(input, stored);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(ModifyResult.EMAIL_INVALID));
      expect(result).assertEqual(ModifyResult.EMAIL_INVALID);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(2));
      expect(Number(result)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateModify(input, 'zzz_other')), String(ModifyResult.EMAIL_INVALID));
      expect(AccountValidator.validateModify(input, 'zzz_other')).assertEqual(ModifyResult.EMAIL_INVALID);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010126 end');
    })

    /**
     * @tc.name   testModifyPriority010127
     * @tc.number SUB_ACCT_VALMOD_0127
     * @tc.desc   three char top level domain is accepted -> OK_WITH_PASSWORD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyPriority010127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010127 begin');
      const input: ModifyInput = { email: 'a@b.com', signature: 'sig', password: 'newpass1',
          confirmPassword: 'newpass1' };
      const stored: string = 'oldpass1';
      const result: ModifyResult = AccountValidator.validateModify(input, stored);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(ModifyResult.OK_WITH_PASSWORD));
      expect(result).assertEqual(ModifyResult.OK_WITH_PASSWORD);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(0));
      expect(Number(result)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateModify(input, 'zzz_other')), String(ModifyResult.OK_WITH_PASSWORD));
      expect(AccountValidator.validateModify(input, 'zzz_other')).assertEqual(ModifyResult.OK_WITH_PASSWORD);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010127 end');
    })

    /**
     * @tc.name   testModifyPriority010128
     * @tc.number SUB_ACCT_VALMOD_0128
     * @tc.desc   password with an inner space is accepted -> OK_WITH_PASSWORD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyPriority010128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010128 begin');
      const input: ModifyInput = { email: 'a@b.co', signature: 'sig', password: 'sec ret', confirmPassword: 'sec ret' };
      const stored: string = 'oldpass1';
      const result: ModifyResult = AccountValidator.validateModify(input, stored);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(ModifyResult.OK_WITH_PASSWORD));
      expect(result).assertEqual(ModifyResult.OK_WITH_PASSWORD);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(0));
      expect(Number(result)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateModify(input, 'zzz_other')), String(ModifyResult.OK_WITH_PASSWORD));
      expect(AccountValidator.validateModify(input, 'zzz_other')).assertEqual(ModifyResult.OK_WITH_PASSWORD);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010128 end');
    })

    /**
     * @tc.name   testModifyPriority010129
     * @tc.number SUB_ACCT_VALMOD_0129
     * @tc.desc   twenty char password is accepted -> OK_WITH_PASSWORD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyPriority010129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010129 begin');
      const input: ModifyInput = { email: 'a@b.co', signature: 'sig', password: 'secret12345678901234',
          confirmPassword: 'secret12345678901234' };
      const stored: string = 'oldpass1';
      const result: ModifyResult = AccountValidator.validateModify(input, stored);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(ModifyResult.OK_WITH_PASSWORD));
      expect(result).assertEqual(ModifyResult.OK_WITH_PASSWORD);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(0));
      expect(Number(result)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateModify(input, 'zzz_other')), String(ModifyResult.OK_WITH_PASSWORD));
      expect(AccountValidator.validateModify(input, 'zzz_other')).assertEqual(ModifyResult.OK_WITH_PASSWORD);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010129 end');
    })

    /**
     * @tc.name   testModifyPriority010130
     * @tc.number SUB_ACCT_VALMOD_0130
     * @tc.desc   stored differs by one trailing char -> OK_WITH_PASSWORD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyPriority010130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010130 begin');
      const input: ModifyInput = { email: 'a@b.co', signature: 'sig', password: 'newpass1',
          confirmPassword: 'newpass1' };
      const stored: string = 'newpass1x';
      const result: ModifyResult = AccountValidator.validateModify(input, stored);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(ModifyResult.OK_WITH_PASSWORD));
      expect(result).assertEqual(ModifyResult.OK_WITH_PASSWORD);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(0));
      expect(Number(result)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateModify(input, 'zzz_other')), String(ModifyResult.OK_WITH_PASSWORD));
      expect(AccountValidator.validateModify(input, 'zzz_other')).assertEqual(ModifyResult.OK_WITH_PASSWORD);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010130 end');
    })

    /**
     * @tc.name   testModifyPriority010131
     * @tc.number SUB_ACCT_VALMOD_0131
     * @tc.desc   confirm differs by case -> CONFIRM_MISMATCH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyPriority010131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010131 begin');
      const input: ModifyInput = { email: 'a@b.co', signature: 'sig', password: 'newpass1',
          confirmPassword: 'NewPass1' };
      const stored: string = 'oldpass1';
      const result: ModifyResult = AccountValidator.validateModify(input, stored);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(ModifyResult.CONFIRM_MISMATCH));
      expect(result).assertEqual(ModifyResult.CONFIRM_MISMATCH);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(5));
      expect(Number(result)).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateModify(input, 'zzz_other')), String(ModifyResult.CONFIRM_MISMATCH));
      expect(AccountValidator.validateModify(input, 'zzz_other')).assertEqual(ModifyResult.CONFIRM_MISMATCH);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010131 end');
    })

    /**
     * @tc.name   testModifyPriority010132
     * @tc.number SUB_ACCT_VALMOD_0132
     * @tc.desc   six char password with a one char confirm difference -> CONFIRM_MISMATCH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyPriority010132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010132 begin');
      const input: ModifyInput = { email: 'a@b.co', signature: 'sig', password: 'abcdef', confirmPassword: 'abcdeg' };
      const stored: string = 'oldpass1';
      const result: ModifyResult = AccountValidator.validateModify(input, stored);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
          String(ModifyResult.CONFIRM_MISMATCH));
      expect(result).assertEqual(ModifyResult.CONFIRM_MISMATCH);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Number(result)), String(5));
      expect(Number(result)).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
          String(AccountValidator.validateModify(input, 'zzz_other')), String(ModifyResult.CONFIRM_MISMATCH));
      expect(AccountValidator.validateModify(input, 'zzz_other')).assertEqual(ModifyResult.CONFIRM_MISMATCH);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010132 end');
    })


    /**
     * @tc.name   testModifyPriority010133
     * @tc.number SUB_ACCT_VALMOD_0133
     * @tc.desc   新密码五位且与旧密码相同，长度判定先于同名判定
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyPriority010133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010133 begin');
      const input: ModifyInput = { email: 'a@b.co', signature: 'sig', password: 'abcde', confirmPassword: 'abcde' };
      const result: ModifyResult = AccountValidator.validateModify(input, 'abcde');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), 'PASSWORD_TOO_SHORT');
      expect(result).assertEqual(ModifyResult.PASSWORD_TOO_SHORT);
      expect(result === ModifyResult.PASSWORD_SAME_AS_OLD).assertFalse();
      expect(Number(result)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010133 end');
    });

    /**
     * @tc.name   testModifyPriority010134
     * @tc.number SUB_ACCT_VALMOD_0134
     * @tc.desc   邮箱非法、密码留空、确认框非空同时成立时只返回 EMAIL_INVALID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyPriority010134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010134 begin');
      const input: ModifyInput = { email: 'bad@', signature: 'sig', password: '', confirmPassword: 'leftover' };
      const result: ModifyResult = AccountValidator.validateModify(input, 'oldpass1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), 'EMAIL_INVALID');
      expect(result).assertEqual(ModifyResult.EMAIL_INVALID);
      expect(result === ModifyResult.CONFIRM_MISMATCH).assertFalse();
      expect(Number(result)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010134 end');
    });

    /**
     * @tc.name   testModifyPriority010135
     * @tc.number SUB_ACCT_VALMOD_0135
     * @tc.desc   用例主流程：两个密码框都留空且邮箱合法时只更新资料
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModifyPriority010135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010135 begin');
      const input: ModifyInput = { email: 'a@b.co', signature: 'sig', password: '', confirmPassword: '' };
      const result: ModifyResult = AccountValidator.validateModify(input, 'oldpass1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), 'OK_WITHOUT_PASSWORD');
      expect(result).assertEqual(ModifyResult.OK_WITHOUT_PASSWORD);
      expect(result === ModifyResult.OK_WITH_PASSWORD).assertFalse();
      expect(Number(result)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModifyPriority010135 end');
    });
  })
}
