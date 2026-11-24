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
import { AccountErrorCode } from '../../../main/ets/model/AccountErrorCode';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function errorCodeTest() {
  describe('ErrorCodeTest', () => {

    /**
     * @tc.name   testErrorCode0001
     * @tc.number SUB_ACCT_ERRCODE_0001
     * @tc.desc   code 12300001 maps to the documented message or the generic fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCode0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCode0001 begin');
      const result: string = AccountErrorCode.describe(12300001);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('system service exception'));
      expect(result).assertEqual('system service exception');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(24));
      expect(result.length).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('system')));
      expect(result.startsWith('system')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCode0001 end');
    })

    /**
     * @tc.name   testErrorCode0002
     * @tc.number SUB_ACCT_ERRCODE_0002
     * @tc.desc   code 12300002 maps to the documented message or the generic fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCode0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCode0002 begin');
      const result: string = AccountErrorCode.describe(12300002);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('invalid name, key or value'));
      expect(result).assertEqual('invalid name, key or value');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(26));
      expect(result.length).assertEqual(26);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('invalid')));
      expect(result.startsWith('invalid')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCode0002 end');
    })

    /**
     * @tc.name   testErrorCode0003
     * @tc.number SUB_ACCT_ERRCODE_0003
     * @tc.desc   code 12300003 maps to the documented message or the generic fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCode0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCode0003 begin');
      const result: string = AccountErrorCode.describe(12300003);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('account not found'));
      expect(result).assertEqual('account not found');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(17));
      expect(result.length).assertEqual(17);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('account')));
      expect(result.startsWith('account')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCode0003 end');
    })

    /**
     * @tc.name   testErrorCode0004
     * @tc.number SUB_ACCT_ERRCODE_0004
     * @tc.desc   code 12300004 maps to the documented message or the generic fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCode0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCode0004 begin');
      const result: string = AccountErrorCode.describe(12300004);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('account already exists'));
      expect(result).assertEqual('account already exists');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(22));
      expect(result.length).assertEqual(22);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('account')));
      expect(result.startsWith('account')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCode0004 end');
    })

    /**
     * @tc.name   testErrorCode0005
     * @tc.number SUB_ACCT_ERRCODE_0005
     * @tc.desc   code 12300007 maps to the documented message or the generic fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCode0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCode0005 begin');
      const result: string = AccountErrorCode.describe(12300007);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('the number of accounts reaches the upper limit'));
      expect(result).assertEqual('the number of accounts reaches the upper limit');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(46));
      expect(result.length).assertEqual(46);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('the')));
      expect(result.startsWith('the')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCode0005 end');
    })

    /**
     * @tc.name   testErrorCode0006
     * @tc.number SUB_ACCT_ERRCODE_0006
     * @tc.desc   code 0 maps to the documented message or the generic fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCode0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCode0006 begin');
      const result: string = AccountErrorCode.describe(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('unexpected account error, code is 0'));
      expect(result).assertEqual('unexpected account error, code is 0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(35));
      expect(result.length).assertEqual(35);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('unexpected')));
      expect(result.startsWith('unexpected')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCode0006 end');
    })

    /**
     * @tc.name   testErrorCode0007
     * @tc.number SUB_ACCT_ERRCODE_0007
     * @tc.desc   code 1 maps to the documented message or the generic fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCode0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCode0007 begin');
      const result: string = AccountErrorCode.describe(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('unexpected account error, code is 1'));
      expect(result).assertEqual('unexpected account error, code is 1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(35));
      expect(result.length).assertEqual(35);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('unexpected')));
      expect(result.startsWith('unexpected')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCode0007 end');
    })

    /**
     * @tc.name   testErrorCode0008
     * @tc.number SUB_ACCT_ERRCODE_0008
     * @tc.desc   code -1 maps to the documented message or the generic fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCode0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCode0008 begin');
      const result: string = AccountErrorCode.describe(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('unexpected account error, code is -1'));
      expect(result).assertEqual('unexpected account error, code is -1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(36));
      expect(result.length).assertEqual(36);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('unexpected')));
      expect(result.startsWith('unexpected')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCode0008 end');
    })

    /**
     * @tc.name   testErrorCode0009
     * @tc.number SUB_ACCT_ERRCODE_0009
     * @tc.desc   code 12300000 maps to the documented message or the generic fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCode0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCode0009 begin');
      const result: string = AccountErrorCode.describe(12300000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('unexpected account error, code is 12300000'));
      expect(result).assertEqual('unexpected account error, code is 12300000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(42));
      expect(result.length).assertEqual(42);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('unexpected')));
      expect(result.startsWith('unexpected')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCode0009 end');
    })

    /**
     * @tc.name   testErrorCode0010
     * @tc.number SUB_ACCT_ERRCODE_0010
     * @tc.desc   code 12300005 maps to the documented message or the generic fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCode0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCode0010 begin');
      const result: string = AccountErrorCode.describe(12300005);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('unexpected account error, code is 12300005'));
      expect(result).assertEqual('unexpected account error, code is 12300005');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(42));
      expect(result.length).assertEqual(42);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('unexpected')));
      expect(result.startsWith('unexpected')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCode0010 end');
    })

    /**
     * @tc.name   testErrorCode0011
     * @tc.number SUB_ACCT_ERRCODE_0011
     * @tc.desc   code 12300006 maps to the documented message or the generic fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCode0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCode0011 begin');
      const result: string = AccountErrorCode.describe(12300006);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('unexpected account error, code is 12300006'));
      expect(result).assertEqual('unexpected account error, code is 12300006');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(42));
      expect(result.length).assertEqual(42);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('unexpected')));
      expect(result.startsWith('unexpected')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCode0011 end');
    })

    /**
     * @tc.name   testErrorCode0012
     * @tc.number SUB_ACCT_ERRCODE_0012
     * @tc.desc   code 12300008 maps to the documented message or the generic fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCode0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCode0012 begin');
      const result: string = AccountErrorCode.describe(12300008);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('unexpected account error, code is 12300008'));
      expect(result).assertEqual('unexpected account error, code is 12300008');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(42));
      expect(result.length).assertEqual(42);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('unexpected')));
      expect(result.startsWith('unexpected')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCode0012 end');
    })

    /**
     * @tc.name   testErrorCode0013
     * @tc.number SUB_ACCT_ERRCODE_0013
     * @tc.desc   code 12300009 maps to the documented message or the generic fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCode0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCode0013 begin');
      const result: string = AccountErrorCode.describe(12300009);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('unexpected account error, code is 12300009'));
      expect(result).assertEqual('unexpected account error, code is 12300009');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(42));
      expect(result.length).assertEqual(42);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('unexpected')));
      expect(result.startsWith('unexpected')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCode0013 end');
    })

    /**
     * @tc.name   testErrorCode0014
     * @tc.number SUB_ACCT_ERRCODE_0014
     * @tc.desc   code 12300010 maps to the documented message or the generic fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCode0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCode0014 begin');
      const result: string = AccountErrorCode.describe(12300010);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('unexpected account error, code is 12300010'));
      expect(result).assertEqual('unexpected account error, code is 12300010');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(42));
      expect(result.length).assertEqual(42);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('unexpected')));
      expect(result.startsWith('unexpected')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCode0014 end');
    })

    /**
     * @tc.name   testErrorCode0015
     * @tc.number SUB_ACCT_ERRCODE_0015
     * @tc.desc   code 12300011 maps to the documented message or the generic fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCode0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCode0015 begin');
      const result: string = AccountErrorCode.describe(12300011);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('unexpected account error, code is 12300011'));
      expect(result).assertEqual('unexpected account error, code is 12300011');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(42));
      expect(result.length).assertEqual(42);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('unexpected')));
      expect(result.startsWith('unexpected')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCode0015 end');
    })

    /**
     * @tc.name   testErrorCode0016
     * @tc.number SUB_ACCT_ERRCODE_0016
     * @tc.desc   code 12300012 maps to the documented message or the generic fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCode0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCode0016 begin');
      const result: string = AccountErrorCode.describe(12300012);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('unexpected account error, code is 12300012'));
      expect(result).assertEqual('unexpected account error, code is 12300012');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(42));
      expect(result.length).assertEqual(42);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('unexpected')));
      expect(result.startsWith('unexpected')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCode0016 end');
    })

    /**
     * @tc.name   testErrorCode0017
     * @tc.number SUB_ACCT_ERRCODE_0017
     * @tc.desc   code 12300100 maps to the documented message or the generic fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCode0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCode0017 begin');
      const result: string = AccountErrorCode.describe(12300100);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('unexpected account error, code is 12300100'));
      expect(result).assertEqual('unexpected account error, code is 12300100');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(42));
      expect(result.length).assertEqual(42);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('unexpected')));
      expect(result.startsWith('unexpected')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCode0017 end');
    })

    /**
     * @tc.name   testErrorCode0018
     * @tc.number SUB_ACCT_ERRCODE_0018
     * @tc.desc   code 12300999 maps to the documented message or the generic fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCode0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCode0018 begin');
      const result: string = AccountErrorCode.describe(12300999);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('unexpected account error, code is 12300999'));
      expect(result).assertEqual('unexpected account error, code is 12300999');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(42));
      expect(result.length).assertEqual(42);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('unexpected')));
      expect(result.startsWith('unexpected')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCode0018 end');
    })

    /**
     * @tc.name   testErrorCode0019
     * @tc.number SUB_ACCT_ERRCODE_0019
     * @tc.desc   code 12400001 maps to the documented message or the generic fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCode0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCode0019 begin');
      const result: string = AccountErrorCode.describe(12400001);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('unexpected account error, code is 12400001'));
      expect(result).assertEqual('unexpected account error, code is 12400001');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(42));
      expect(result.length).assertEqual(42);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('unexpected')));
      expect(result.startsWith('unexpected')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCode0019 end');
    })

    /**
     * @tc.name   testErrorCode0020
     * @tc.number SUB_ACCT_ERRCODE_0020
     * @tc.desc   code 10000000 maps to the documented message or the generic fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCode0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCode0020 begin');
      const result: string = AccountErrorCode.describe(10000000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('unexpected account error, code is 10000000'));
      expect(result).assertEqual('unexpected account error, code is 10000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(42));
      expect(result.length).assertEqual(42);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('unexpected')));
      expect(result.startsWith('unexpected')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCode0020 end');
    })

    /**
     * @tc.name   testErrorCode0021
     * @tc.number SUB_ACCT_ERRCODE_0021
     * @tc.desc   code 20000000 maps to the documented message or the generic fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCode0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCode0021 begin');
      const result: string = AccountErrorCode.describe(20000000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('unexpected account error, code is 20000000'));
      expect(result).assertEqual('unexpected account error, code is 20000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(42));
      expect(result.length).assertEqual(42);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('unexpected')));
      expect(result.startsWith('unexpected')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCode0021 end');
    })

    /**
     * @tc.name   testErrorCode0022
     * @tc.number SUB_ACCT_ERRCODE_0022
     * @tc.desc   code 2147483647 maps to the documented message or the generic fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCode0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCode0022 begin');
      const result: string = AccountErrorCode.describe(2147483647);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('unexpected account error, code is 2147483647'));
      expect(result).assertEqual('unexpected account error, code is 2147483647');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(44));
      expect(result.length).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('unexpected')));
      expect(result.startsWith('unexpected')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCode0022 end');
    })

    /**
     * @tc.name   testErrorCode0023
     * @tc.number SUB_ACCT_ERRCODE_0023
     * @tc.desc   code -2147483648 maps to the documented message or the generic fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCode0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCode0023 begin');
      const result: string = AccountErrorCode.describe(-2147483648);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('unexpected account error, code is -2147483648'));
      expect(result).assertEqual('unexpected account error, code is -2147483648');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(45));
      expect(result.length).assertEqual(45);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('unexpected')));
      expect(result.startsWith('unexpected')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCode0023 end');
    })

    /**
     * @tc.name   testErrorCode0024
     * @tc.number SUB_ACCT_ERRCODE_0024
     * @tc.desc   code 2147483648 maps to the documented message or the generic fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCode0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCode0024 begin');
      const result: string = AccountErrorCode.describe(2147483648);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('unexpected account error, code is 2147483648'));
      expect(result).assertEqual('unexpected account error, code is 2147483648');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(44));
      expect(result.length).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('unexpected')));
      expect(result.startsWith('unexpected')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCode0024 end');
    })

    /**
     * @tc.name   testErrorCode0025
     * @tc.number SUB_ACCT_ERRCODE_0025
     * @tc.desc   code 4294967296 maps to the documented message or the generic fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCode0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCode0025 begin');
      const result: string = AccountErrorCode.describe(4294967296);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('unexpected account error, code is 4294967296'));
      expect(result).assertEqual('unexpected account error, code is 4294967296');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(44));
      expect(result.length).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('unexpected')));
      expect(result.startsWith('unexpected')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCode0025 end');
    })

    /**
     * @tc.name   testErrorCode0026
     * @tc.number SUB_ACCT_ERRCODE_0026
     * @tc.desc   code 9007199254740991 maps to the documented message or the generic fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCode0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCode0026 begin');
      const result: string = AccountErrorCode.describe(9007199254740991);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('unexpected account error, code is 9007199254740991'));
      expect(result).assertEqual('unexpected account error, code is 9007199254740991');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(50));
      expect(result.length).assertEqual(50);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('unexpected')));
      expect(result.startsWith('unexpected')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCode0026 end');
    })

    /**
     * @tc.name   testErrorCode0027
     * @tc.number SUB_ACCT_ERRCODE_0027
     * @tc.desc   code 2 maps to the documented message or the generic fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCode0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCode0027 begin');
      const result: string = AccountErrorCode.describe(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('unexpected account error, code is 2'));
      expect(result).assertEqual('unexpected account error, code is 2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(35));
      expect(result.length).assertEqual(35);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('unexpected')));
      expect(result.startsWith('unexpected')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCode0027 end');
    })

    /**
     * @tc.name   testErrorCode0028
     * @tc.number SUB_ACCT_ERRCODE_0028
     * @tc.desc   code 3 maps to the documented message or the generic fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCode0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCode0028 begin');
      const result: string = AccountErrorCode.describe(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('unexpected account error, code is 3'));
      expect(result).assertEqual('unexpected account error, code is 3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(35));
      expect(result.length).assertEqual(35);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('unexpected')));
      expect(result.startsWith('unexpected')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCode0028 end');
    })

    /**
     * @tc.name   testErrorCode0029
     * @tc.number SUB_ACCT_ERRCODE_0029
     * @tc.desc   code 4 maps to the documented message or the generic fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCode0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCode0029 begin');
      const result: string = AccountErrorCode.describe(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('unexpected account error, code is 4'));
      expect(result).assertEqual('unexpected account error, code is 4');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(35));
      expect(result.length).assertEqual(35);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('unexpected')));
      expect(result.startsWith('unexpected')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCode0029 end');
    })

    /**
     * @tc.name   testErrorCode0030
     * @tc.number SUB_ACCT_ERRCODE_0030
     * @tc.desc   code 5 maps to the documented message or the generic fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCode0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCode0030 begin');
      const result: string = AccountErrorCode.describe(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('unexpected account error, code is 5'));
      expect(result).assertEqual('unexpected account error, code is 5');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(35));
      expect(result.length).assertEqual(35);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('unexpected')));
      expect(result.startsWith('unexpected')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCode0030 end');
    })

    /**
     * @tc.name   testErrorCode0031
     * @tc.number SUB_ACCT_ERRCODE_0031
     * @tc.desc   code 6 maps to the documented message or the generic fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCode0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCode0031 begin');
      const result: string = AccountErrorCode.describe(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('unexpected account error, code is 6'));
      expect(result).assertEqual('unexpected account error, code is 6');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(35));
      expect(result.length).assertEqual(35);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('unexpected')));
      expect(result.startsWith('unexpected')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCode0031 end');
    })

    /**
     * @tc.name   testErrorCode0032
     * @tc.number SUB_ACCT_ERRCODE_0032
     * @tc.desc   code 7 maps to the documented message or the generic fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCode0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCode0032 begin');
      const result: string = AccountErrorCode.describe(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('unexpected account error, code is 7'));
      expect(result).assertEqual('unexpected account error, code is 7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(35));
      expect(result.length).assertEqual(35);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('unexpected')));
      expect(result.startsWith('unexpected')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCode0032 end');
    })

    /**
     * @tc.name   testErrorCode0033
     * @tc.number SUB_ACCT_ERRCODE_0033
     * @tc.desc   code 8 maps to the documented message or the generic fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCode0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCode0033 begin');
      const result: string = AccountErrorCode.describe(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('unexpected account error, code is 8'));
      expect(result).assertEqual('unexpected account error, code is 8');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(35));
      expect(result.length).assertEqual(35);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('unexpected')));
      expect(result.startsWith('unexpected')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCode0033 end');
    })

    /**
     * @tc.name   testErrorCode0034
     * @tc.number SUB_ACCT_ERRCODE_0034
     * @tc.desc   code 9 maps to the documented message or the generic fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCode0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCode0034 begin');
      const result: string = AccountErrorCode.describe(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('unexpected account error, code is 9'));
      expect(result).assertEqual('unexpected account error, code is 9');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(35));
      expect(result.length).assertEqual(35);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('unexpected')));
      expect(result.startsWith('unexpected')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCode0034 end');
    })

    /**
     * @tc.name   testErrorCode0035
     * @tc.number SUB_ACCT_ERRCODE_0035
     * @tc.desc   code 10 maps to the documented message or the generic fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCode0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCode0035 begin');
      const result: string = AccountErrorCode.describe(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('unexpected account error, code is 10'));
      expect(result).assertEqual('unexpected account error, code is 10');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(36));
      expect(result.length).assertEqual(36);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('unexpected')));
      expect(result.startsWith('unexpected')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCode0035 end');
    })

    /**
     * @tc.name   testErrorCode0036
     * @tc.number SUB_ACCT_ERRCODE_0036
     * @tc.desc   code 12300021 maps to the documented message or the generic fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCode0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCode0036 begin');
      const result: string = AccountErrorCode.describe(12300021);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('unexpected account error, code is 12300021'));
      expect(result).assertEqual('unexpected account error, code is 12300021');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(42));
      expect(result.length).assertEqual(42);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('unexpected')));
      expect(result.startsWith('unexpected')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCode0036 end');
    })

    /**
     * @tc.name   testErrorCode0037
     * @tc.number SUB_ACCT_ERRCODE_0037
     * @tc.desc   code 12300031 maps to the documented message or the generic fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCode0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCode0037 begin');
      const result: string = AccountErrorCode.describe(12300031);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('unexpected account error, code is 12300031'));
      expect(result).assertEqual('unexpected account error, code is 12300031');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(42));
      expect(result.length).assertEqual(42);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('unexpected')));
      expect(result.startsWith('unexpected')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCode0037 end');
    })

    /**
     * @tc.name   testErrorCode0038
     * @tc.number SUB_ACCT_ERRCODE_0038
     * @tc.desc   code 12300041 maps to the documented message or the generic fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCode0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCode0038 begin');
      const result: string = AccountErrorCode.describe(12300041);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('unexpected account error, code is 12300041'));
      expect(result).assertEqual('unexpected account error, code is 12300041');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(42));
      expect(result.length).assertEqual(42);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('unexpected')));
      expect(result.startsWith('unexpected')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCode0038 end');
    })

    /**
     * @tc.name   testErrorCode0039
     * @tc.number SUB_ACCT_ERRCODE_0039
     * @tc.desc   code 12300051 maps to the documented message or the generic fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCode0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCode0039 begin');
      const result: string = AccountErrorCode.describe(12300051);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('unexpected account error, code is 12300051'));
      expect(result).assertEqual('unexpected account error, code is 12300051');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(42));
      expect(result.length).assertEqual(42);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('unexpected')));
      expect(result.startsWith('unexpected')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCode0039 end');
    })

    /**
     * @tc.name   testErrorCode0040
     * @tc.number SUB_ACCT_ERRCODE_0040
     * @tc.desc   code 12300061 maps to the documented message or the generic fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCode0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCode0040 begin');
      const result: string = AccountErrorCode.describe(12300061);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('unexpected account error, code is 12300061'));
      expect(result).assertEqual('unexpected account error, code is 12300061');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(42));
      expect(result.length).assertEqual(42);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('unexpected')));
      expect(result.startsWith('unexpected')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCode0040 end');
    })

  })
}
