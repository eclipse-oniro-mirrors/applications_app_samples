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
import { AccountKeyBuilder } from '../../../main/ets/model/AccountKeyBuilder';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function keyBuildTest() {
  describe('KeyBuildTest', () => {

    /**
     * @tc.name   testKeyBuild0001
     * @tc.number SUB_ACCT_KEYCTRL_0001
     * @tc.desc   account name joins user "tom" and app "Music" with a single underscore
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testKeyBuild0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0001 begin');
      const result: string = AccountKeyBuilder.accountName('tom', 'Music');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('tom_Music'));
      expect(result).assertEqual('tom_Music');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(9));
      expect(result.length).assertEqual(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('tom_')));
      expect(result.startsWith('tom_')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0001 end');
    })

    /**
     * @tc.name   testKeyBuild0002
     * @tc.number SUB_ACCT_KEYCTRL_0002
     * @tc.desc   account name joins user "tom" and app "Video" with a single underscore
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testKeyBuild0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0002 begin');
      const result: string = AccountKeyBuilder.accountName('tom', 'Video');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('tom_Video'));
      expect(result).assertEqual('tom_Video');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(9));
      expect(result.length).assertEqual(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('tom_')));
      expect(result.startsWith('tom_')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0002 end');
    })

    /**
     * @tc.name   testKeyBuild0003
     * @tc.number SUB_ACCT_KEYCTRL_0003
     * @tc.desc   account name joins user "tom" and app "Map" with a single underscore
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testKeyBuild0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0003 begin');
      const result: string = AccountKeyBuilder.accountName('tom', 'Map');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('tom_Map'));
      expect(result).assertEqual('tom_Map');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(7));
      expect(result.length).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('tom_')));
      expect(result.startsWith('tom_')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0003 end');
    })

    /**
     * @tc.name   testKeyBuild0004
     * @tc.number SUB_ACCT_KEYCTRL_0004
     * @tc.desc   account name joins user "jerry" and app "Music" with a single underscore
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testKeyBuild0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0004 begin');
      const result: string = AccountKeyBuilder.accountName('jerry', 'Music');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('jerry_Music'));
      expect(result).assertEqual('jerry_Music');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(11));
      expect(result.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('jerry_')));
      expect(result.startsWith('jerry_')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0004 end');
    })

    /**
     * @tc.name   testKeyBuild0005
     * @tc.number SUB_ACCT_KEYCTRL_0005
     * @tc.desc   account name joins user "a" and app "Music" with a single underscore
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testKeyBuild0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0005 begin');
      const result: string = AccountKeyBuilder.accountName('a', 'Music');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('a_Music'));
      expect(result).assertEqual('a_Music');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(7));
      expect(result.length).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('a_')));
      expect(result.startsWith('a_')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0005 end');
    })

    /**
     * @tc.name   testKeyBuild0006
     * @tc.number SUB_ACCT_KEYCTRL_0006
     * @tc.desc   account name joins user "ab" and app "Video" with a single underscore
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testKeyBuild0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0006 begin');
      const result: string = AccountKeyBuilder.accountName('ab', 'Video');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('ab_Video'));
      expect(result).assertEqual('ab_Video');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(8));
      expect(result.length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('ab_')));
      expect(result.startsWith('ab_')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0006 end');
    })

    /**
     * @tc.name   testKeyBuild0007
     * @tc.number SUB_ACCT_KEYCTRL_0007
     * @tc.desc   account name joins user "abc" and app "Map" with a single underscore
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testKeyBuild0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0007 begin');
      const result: string = AccountKeyBuilder.accountName('abc', 'Map');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('abc_Map'));
      expect(result).assertEqual('abc_Map');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(7));
      expect(result.length).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('abc_')));
      expect(result.startsWith('abc_')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0007 end');
    })

    /**
     * @tc.name   testKeyBuild0008
     * @tc.number SUB_ACCT_KEYCTRL_0008
     * @tc.desc   account name joins user "user1" and app "Music" with a single underscore
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testKeyBuild0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0008 begin');
      const result: string = AccountKeyBuilder.accountName('user1', 'Music');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('user1_Music'));
      expect(result).assertEqual('user1_Music');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(11));
      expect(result.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('user1_')));
      expect(result.startsWith('user1_')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0008 end');
    })

    /**
     * @tc.name   testKeyBuild0009
     * @tc.number SUB_ACCT_KEYCTRL_0009
     * @tc.desc   account name joins user "user_1" and app "Music" with a single underscore
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testKeyBuild0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0009 begin');
      const result: string = AccountKeyBuilder.accountName('user_1', 'Music');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('user_1_Music'));
      expect(result).assertEqual('user_1_Music');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(12));
      expect(result.length).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('user_1_')));
      expect(result.startsWith('user_1_')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0009 end');
    })

    /**
     * @tc.name   testKeyBuild0010
     * @tc.number SUB_ACCT_KEYCTRL_0010
     * @tc.desc   account name joins user "USER" and app "Music" with a single underscore
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testKeyBuild0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0010 begin');
      const result: string = AccountKeyBuilder.accountName('USER', 'Music');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('USER_Music'));
      expect(result).assertEqual('USER_Music');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(10));
      expect(result.length).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('USER_')));
      expect(result.startsWith('USER_')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0010 end');
    })

    /**
     * @tc.name   testKeyBuild0011
     * @tc.number SUB_ACCT_KEYCTRL_0011
     * @tc.desc   account name joins user "x9" and app "Video" with a single underscore
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testKeyBuild0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0011 begin');
      const result: string = AccountKeyBuilder.accountName('x9', 'Video');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('x9_Video'));
      expect(result).assertEqual('x9_Video');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(8));
      expect(result.length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('x9_')));
      expect(result.startsWith('x9_')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0011 end');
    })

    /**
     * @tc.name   testKeyBuild0012
     * @tc.number SUB_ACCT_KEYCTRL_0012
     * @tc.desc   account name joins user "tom.smith" and app "Map" with a single underscore
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testKeyBuild0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0012 begin');
      const result: string = AccountKeyBuilder.accountName('tom.smith', 'Map');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('tom.smith_Map'));
      expect(result).assertEqual('tom.smith_Map');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(13));
      expect(result.length).assertEqual(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('tom.smith_')));
      expect(result.startsWith('tom.smith_')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0012 end');
    })

    /**
     * @tc.name   testKeyBuild0013
     * @tc.number SUB_ACCT_KEYCTRL_0013
     * @tc.desc   account name joins user "abcdefghijklmno" and app "Music" with a single underscore
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testKeyBuild0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0013 begin');
      const result: string = AccountKeyBuilder.accountName('abcdefghijklmno', 'Music');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('abcdefghijklmno_Music'));
      expect(result).assertEqual('abcdefghijklmno_Music');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(21));
      expect(result.length).assertEqual(21);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('abcdefghijklmno_')));
      expect(result.startsWith('abcdefghijklmno_')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0013 end');
    })

    /**
     * @tc.name   testKeyBuild0014
     * @tc.number SUB_ACCT_KEYCTRL_0014
     * @tc.desc   account name joins user "" and app "Music" with a single underscore
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testKeyBuild0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0014 begin');
      const result: string = AccountKeyBuilder.accountName('', 'Music');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('_Music'));
      expect(result).assertEqual('_Music');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(6));
      expect(result.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('_')));
      expect(result.startsWith('_')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0014 end');
    })

    /**
     * @tc.name   testKeyBuild0015
     * @tc.number SUB_ACCT_KEYCTRL_0015
     * @tc.desc   account name joins user "tom" and app "" with a single underscore
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testKeyBuild0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0015 begin');
      const result: string = AccountKeyBuilder.accountName('tom', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('tom_'));
      expect(result).assertEqual('tom_');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('tom_')));
      expect(result.startsWith('tom_')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0015 end');
    })

    /**
     * @tc.name   testKeyBuild0016
     * @tc.number SUB_ACCT_KEYCTRL_0016
     * @tc.desc   account name joins user "" and app "" with a single underscore
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testKeyBuild0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0016 begin');
      const result: string = AccountKeyBuilder.accountName('', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('_'));
      expect(result).assertEqual('_');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('_')));
      expect(result.startsWith('_')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0016 end');
    })

    /**
     * @tc.name   testKeyBuild0017
     * @tc.number SUB_ACCT_KEYCTRL_0017
     * @tc.desc   account name joins user "tom smith" and app "Music" with a single underscore
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testKeyBuild0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0017 begin');
      const result: string = AccountKeyBuilder.accountName('tom smith', 'Music');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('tom smith_Music'));
      expect(result).assertEqual('tom smith_Music');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(15));
      expect(result.length).assertEqual(15);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('tom smith_')));
      expect(result.startsWith('tom smith_')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0017 end');
    })

    /**
     * @tc.name   testKeyBuild0018
     * @tc.number SUB_ACCT_KEYCTRL_0018
     * @tc.desc   account name joins user "tom@x" and app "Music" with a single underscore
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testKeyBuild0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0018 begin');
      const result: string = AccountKeyBuilder.accountName('tom@x', 'Music');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('tom@x_Music'));
      expect(result).assertEqual('tom@x_Music');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(11));
      expect(result.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('tom@x_')));
      expect(result.startsWith('tom@x_')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0018 end');
    })

    /**
     * @tc.name   testKeyBuild0019
     * @tc.number SUB_ACCT_KEYCTRL_0019
     * @tc.desc   account name joins user "中文" and app "Music" with a single underscore
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testKeyBuild0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0019 begin');
      const result: string = AccountKeyBuilder.accountName('中文', 'Music');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('中文_Music'));
      expect(result).assertEqual('中文_Music');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(8));
      expect(result.length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('中文_')));
      expect(result.startsWith('中文_')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0019 end');
    })

    /**
     * @tc.name   testKeyBuild0020
     * @tc.number SUB_ACCT_KEYCTRL_0020
     * @tc.desc   account name joins user "tom-Jones" and app "Music" with a single underscore
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testKeyBuild0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0020 begin');
      const result: string = AccountKeyBuilder.accountName('tom-Jones', 'Music');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('tom-Jones_Music'));
      expect(result).assertEqual('tom-Jones_Music');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(15));
      expect(result.length).assertEqual(15);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('tom-Jones_')));
      expect(result.startsWith('tom-Jones_')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0020 end');
    })

    /**
     * @tc.name   testKeyBuild0021
     * @tc.number SUB_ACCT_KEYCTRL_0021
     * @tc.desc   account name joins user "t" and app "Map" with a single underscore
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testKeyBuild0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0021 begin');
      const result: string = AccountKeyBuilder.accountName('t', 'Map');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('t_Map'));
      expect(result).assertEqual('t_Map');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(5));
      expect(result.length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('t_')));
      expect(result.startsWith('t_')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0021 end');
    })

    /**
     * @tc.name   testKeyBuild0022
     * @tc.number SUB_ACCT_KEYCTRL_0022
     * @tc.desc   account name joins user "00" and app "Music" with a single underscore
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testKeyBuild0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0022 begin');
      const result: string = AccountKeyBuilder.accountName('00', 'Music');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00_Music'));
      expect(result).assertEqual('00_Music');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(8));
      expect(result.length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('00_')));
      expect(result.startsWith('00_')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0022 end');
    })

    /**
     * @tc.name   testKeyBuild0023
     * @tc.number SUB_ACCT_KEYCTRL_0023
     * @tc.desc   account name joins user "TOM_" and app "Music" with a single underscore
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testKeyBuild0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0023 begin');
      const result: string = AccountKeyBuilder.accountName('TOM_', 'Music');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('TOM__Music'));
      expect(result).assertEqual('TOM__Music');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(10));
      expect(result.length).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('TOM__')));
      expect(result.startsWith('TOM__')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0023 end');
    })

    /**
     * @tc.name   testKeyBuild0024
     * @tc.number SUB_ACCT_KEYCTRL_0024
     * @tc.desc   account name joins user "_tom" and app "Music" with a single underscore
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testKeyBuild0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0024 begin');
      const result: string = AccountKeyBuilder.accountName('_tom', 'Music');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('_tom_Music'));
      expect(result).assertEqual('_tom_Music');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(10));
      expect(result.length).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('_tom_')));
      expect(result.startsWith('_tom_')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0024 end');
    })

    /**
     * @tc.name   testKeyBuild0025
     * @tc.number SUB_ACCT_KEYCTRL_0025
     * @tc.desc   account name joins user "tom" and app "music" with a single underscore
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testKeyBuild0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0025 begin');
      const result: string = AccountKeyBuilder.accountName('tom', 'music');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('tom_music'));
      expect(result).assertEqual('tom_music');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(9));
      expect(result.length).assertEqual(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('tom_')));
      expect(result.startsWith('tom_')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0025 end');
    })

    /**
     * @tc.name   testKeyBuild0026
     * @tc.number SUB_ACCT_KEYCTRL_0026
     * @tc.desc   account name joins user "tom" and app "Music2" with a single underscore
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testKeyBuild0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0026 begin');
      const result: string = AccountKeyBuilder.accountName('tom', 'Music2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('tom_Music2'));
      expect(result).assertEqual('tom_Music2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(10));
      expect(result.length).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('tom_')));
      expect(result.startsWith('tom_')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0026 end');
    })

    /**
     * @tc.name   testKeyBuild0027
     * @tc.number SUB_ACCT_KEYCTRL_0027
     * @tc.desc   account name joins user "tom" and app "中文app" with a single underscore
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testKeyBuild0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0027 begin');
      const result: string = AccountKeyBuilder.accountName('tom', '中文app');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('tom_中文app'));
      expect(result).assertEqual('tom_中文app');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(9));
      expect(result.length).assertEqual(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('tom_')));
      expect(result.startsWith('tom_')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0027 end');
    })

    /**
     * @tc.name   testKeyBuild0028
     * @tc.number SUB_ACCT_KEYCTRL_0028
     * @tc.desc   account name joins user "tom" and app "M" with a single underscore
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testKeyBuild0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0028 begin');
      const result: string = AccountKeyBuilder.accountName('tom', 'M');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('tom_M'));
      expect(result).assertEqual('tom_M');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(5));
      expect(result.length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('tom_')));
      expect(result.startsWith('tom_')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0028 end');
    })

    /**
     * @tc.name   testKeyBuild0029
     * @tc.number SUB_ACCT_KEYCTRL_0029
     * @tc.desc   account name joins user "tom" and app "VideoApp" with a single underscore
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testKeyBuild0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0029 begin');
      const result: string = AccountKeyBuilder.accountName('tom', 'VideoApp');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('tom_VideoApp'));
      expect(result).assertEqual('tom_VideoApp');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(12));
      expect(result.length).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('tom_')));
      expect(result.startsWith('tom_')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0029 end');
    })

    /**
     * @tc.name   testKeyBuild0030
     * @tc.number SUB_ACCT_KEYCTRL_0030
     * @tc.desc   account name joins user "a1B2c3" and app "Map" with a single underscore
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testKeyBuild0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0030 begin');
      const result: string = AccountKeyBuilder.accountName('a1B2c3', 'Map');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('a1B2c3_Map'));
      expect(result).assertEqual('a1B2c3_Map');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(10));
      expect(result.length).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('a1B2c3_')));
      expect(result.startsWith('a1B2c3_')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0030 end');
    })

    /**
     * @tc.name   testKeyBuild0031
     * @tc.number SUB_ACCT_KEYCTRL_0031
     * @tc.desc   account name joins user "zzz" and app "Video" with a single underscore
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testKeyBuild0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0031 begin');
      const result: string = AccountKeyBuilder.accountName('zzz', 'Video');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('zzz_Video'));
      expect(result).assertEqual('zzz_Video');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(9));
      expect(result.length).assertEqual(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('zzz_')));
      expect(result.startsWith('zzz_')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0031 end');
    })

    /**
     * @tc.name   testKeyBuild0032
     * @tc.number SUB_ACCT_KEYCTRL_0032
     * @tc.desc   account name joins user "12345" and app "Map" with a single underscore
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testKeyBuild0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0032 begin');
      const result: string = AccountKeyBuilder.accountName('12345', 'Map');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('12345_Map'));
      expect(result).assertEqual('12345_Map');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(9));
      expect(result.length).assertEqual(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('12345_')));
      expect(result.startsWith('12345_')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0032 end');
    })

    /**
     * @tc.name   testKeyBuild0033
     * @tc.number SUB_ACCT_KEYCTRL_0033
     * @tc.desc   account name joins user "test_user" and app "Video" with a single underscore
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testKeyBuild0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0033 begin');
      const result: string = AccountKeyBuilder.accountName('test_user', 'Video');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('test_user_Video'));
      expect(result).assertEqual('test_user_Video');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(15));
      expect(result.length).assertEqual(15);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('test_user_')));
      expect(result.startsWith('test_user_')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0033 end');
    })

    /**
     * @tc.name   testKeyBuild0034
     * @tc.number SUB_ACCT_KEYCTRL_0034
     * @tc.desc   account name joins user "multi_word_name" and app "Map" with a single underscore
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testKeyBuild0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0034 begin');
      const result: string = AccountKeyBuilder.accountName('multi_word_name', 'Map');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('multi_word_name_Map'));
      expect(result).assertEqual('multi_word_name_Map');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('multi_word_name_')));
      expect(result.startsWith('multi_word_name_')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0034 end');
    })

    /**
     * @tc.name   testKeyBuild0035
     * @tc.number SUB_ACCT_KEYCTRL_0035
     * @tc.desc   account name joins user "T" and app "Music" with a single underscore
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testKeyBuild0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0035 begin');
      const result: string = AccountKeyBuilder.accountName('T', 'Music');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('T_Music'));
      expect(result).assertEqual('T_Music');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(7));
      expect(result.length).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('T_')));
      expect(result.startsWith('T_')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0035 end');
    })

    /**
     * @tc.name   testKeyBuild0036
     * @tc.number SUB_ACCT_KEYCTRL_0036
     * @tc.desc   account name joins user "9" and app "Music" with a single underscore
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testKeyBuild0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0036 begin');
      const result: string = AccountKeyBuilder.accountName('9', 'Music');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('9_Music'));
      expect(result).assertEqual('9_Music');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(7));
      expect(result.length).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('9_')));
      expect(result.startsWith('9_')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0036 end');
    })

    /**
     * @tc.name   testKeyBuild0037
     * @tc.number SUB_ACCT_KEYCTRL_0037
     * @tc.desc   account name joins user "0" and app "Map" with a single underscore
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testKeyBuild0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0037 begin');
      const result: string = AccountKeyBuilder.accountName('0', 'Map');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0_Map'));
      expect(result).assertEqual('0_Map');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(5));
      expect(result.length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('0_')));
      expect(result.startsWith('0_')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0037 end');
    })

    /**
     * @tc.name   testKeyBuild0038
     * @tc.number SUB_ACCT_KEYCTRL_0038
     * @tc.desc   account name joins user "q" and app "Video" with a single underscore
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testKeyBuild0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0038 begin');
      const result: string = AccountKeyBuilder.accountName('q', 'Video');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('q_Video'));
      expect(result).assertEqual('q_Video');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(7));
      expect(result.length).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('q_')));
      expect(result.startsWith('q_')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0038 end');
    })

    /**
     * @tc.name   testKeyBuild0039
     * @tc.number SUB_ACCT_KEYCTRL_0039
     * @tc.desc   account name joins user "tom" and app "MAP" with a single underscore
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testKeyBuild0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0039 begin');
      const result: string = AccountKeyBuilder.accountName('tom', 'MAP');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('tom_MAP'));
      expect(result).assertEqual('tom_MAP');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(7));
      expect(result.length).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('tom_')));
      expect(result.startsWith('tom_')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0039 end');
    })

    /**
     * @tc.name   testKeyBuild0040
     * @tc.number SUB_ACCT_KEYCTRL_0040
     * @tc.desc   account name joins user "tom" and app "mAp" with a single underscore
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testKeyBuild0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0040 begin');
      const result: string = AccountKeyBuilder.accountName('tom', 'mAp');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('tom_mAp'));
      expect(result).assertEqual('tom_mAp');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(7));
      expect(result.length).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('tom_')));
      expect(result.startsWith('tom_')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0040 end');
    })

    /**
     * @tc.name   testKeyBuild0041
     * @tc.number SUB_ACCT_KEYCTRL_0041
     * @tc.desc   account name joins user "é" and app "Music" with a single underscore
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testKeyBuild0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0041 begin');
      const result: string = AccountKeyBuilder.accountName('é', 'Music');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('é_Music'));
      expect(result).assertEqual('é_Music');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(7));
      expect(result.length).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('é_')));
      expect(result.startsWith('é_')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0041 end');
    })

    /**
     * @tc.name   testKeyBuild0042
     * @tc.number SUB_ACCT_KEYCTRL_0042
     * @tc.desc   account name joins user "tom" and app " " with a single underscore
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testKeyBuild0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0042 begin');
      const result: string = AccountKeyBuilder.accountName('tom', ' ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('tom_ '));
      expect(result).assertEqual('tom_ ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(5));
      expect(result.length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('tom_')));
      expect(result.startsWith('tom_')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0042 end');
    })

    /**
     * @tc.name   testKeyBuild0043
     * @tc.number SUB_ACCT_KEYCTRL_0043
     * @tc.desc   account name joins user " " and app "Music" with a single underscore
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testKeyBuild0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0043 begin');
      const result: string = AccountKeyBuilder.accountName(' ', 'Music');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(' _Music'));
      expect(result).assertEqual(' _Music');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(7));
      expect(result.length).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith(' _')));
      expect(result.startsWith(' _')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0043 end');
    })

    /**
     * @tc.name   testKeyBuild0044
     * @tc.number SUB_ACCT_KEYCTRL_0044
     * @tc.desc   account name joins user "ab" and app "ab" with a single underscore
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testKeyBuild0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0044 begin');
      const result: string = AccountKeyBuilder.accountName('ab', 'ab');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('ab_ab'));
      expect(result).assertEqual('ab_ab');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(5));
      expect(result.length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('ab_')));
      expect(result.startsWith('ab_')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0044 end');
    })

    /**
     * @tc.name   testKeyBuild0045
     * @tc.number SUB_ACCT_KEYCTRL_0045
     * @tc.desc   account name joins user "a_b" and app "c_d" with a single underscore
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testKeyBuild0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0045 begin');
      const result: string = AccountKeyBuilder.accountName('a_b', 'c_d');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('a_b_c_d'));
      expect(result).assertEqual('a_b_c_d');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(7));
      expect(result.length).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('a_b_')));
      expect(result.startsWith('a_b_')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0045 end');
    })

    /**
     * @tc.name   testKeyBuild0046
     * @tc.number SUB_ACCT_KEYCTRL_0046
     * @tc.desc   account name joins user "aaa" and app "bbb" with a single underscore
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testKeyBuild0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0046 begin');
      const result: string = AccountKeyBuilder.accountName('aaa', 'bbb');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('aaa_bbb'));
      expect(result).assertEqual('aaa_bbb');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(7));
      expect(result.length).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('aaa_')));
      expect(result.startsWith('aaa_')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0046 end');
    })

    /**
     * @tc.name   testKeyBuild0047
     * @tc.number SUB_ACCT_KEYCTRL_0047
     * @tc.desc   account name joins user "x" and app "y" with a single underscore
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testKeyBuild0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0047 begin');
      const result: string = AccountKeyBuilder.accountName('x', 'y');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('x_y'));
      expect(result).assertEqual('x_y');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('x_')));
      expect(result.startsWith('x_')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0047 end');
    })

    /**
     * @tc.name   testKeyBuild0048
     * @tc.number SUB_ACCT_KEYCTRL_0048
     * @tc.desc   account name joins user "ABCDEFGHIJKLMNO" and app "Music" with a single underscore
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testKeyBuild0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0048 begin');
      const result: string = AccountKeyBuilder.accountName('ABCDEFGHIJKLMNO', 'Music');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ABCDEFGHIJKLMNO_Music'));
      expect(result).assertEqual('ABCDEFGHIJKLMNO_Music');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(21));
      expect(result.length).assertEqual(21);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('ABCDEFGHIJKLMNO_')));
      expect(result.startsWith('ABCDEFGHIJKLMNO_')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0048 end');
    })

    /**
     * @tc.name   testKeyBuild0049
     * @tc.number SUB_ACCT_KEYCTRL_0049
     * @tc.desc   account name joins user "abcdefghijklmno" and app "Video" with a single underscore
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testKeyBuild0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0049 begin');
      const result: string = AccountKeyBuilder.accountName('abcdefghijklmno', 'Video');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('abcdefghijklmno_Video'));
      expect(result).assertEqual('abcdefghijklmno_Video');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(21));
      expect(result.length).assertEqual(21);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('abcdefghijklmno_')));
      expect(result.startsWith('abcdefghijklmno_')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0049 end');
    })

    /**
     * @tc.name   testKeyBuild0050
     * @tc.number SUB_ACCT_KEYCTRL_0050
     * @tc.desc   account name joins user "user.name+tag" and app "Map" with a single underscore
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testKeyBuild0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0050 begin');
      const result: string = AccountKeyBuilder.accountName('user.name+tag', 'Map');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('user.name+tag_Map'));
      expect(result).assertEqual('user.name+tag_Map');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(17));
      expect(result.length).assertEqual(17);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('user.name+tag_')));
      expect(result.startsWith('user.name+tag_')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyBuild0050 end');
    })

  })
}
