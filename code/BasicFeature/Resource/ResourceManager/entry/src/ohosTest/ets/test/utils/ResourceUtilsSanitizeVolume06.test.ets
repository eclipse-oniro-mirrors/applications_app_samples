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
import { ResourceUtils } from '../../../../main/ets/utils/ResourceUtils';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_ResourceManager]';

export default function resourceUtilsSanitizeTest() {
  describe('ResourceUtilsSanitizeTest', () => {

    /**
     * @tc.name   testResourceUtilsSanitize0001
     * @tc.number SUB_RESMGR_UTILS_06_0001
     * @tc.desc   sanitizeWorld('') keeps 5 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitize0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0001 begin');
      const result: string = ResourceUtils.sanitizeWorld('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('world'));
      expect(result).assertEqual('world');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0001 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitize0002
     * @tc.number SUB_RESMGR_UTILS_06_0002
     * @tc.desc   sanitizeWorld('   ') keeps 5 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitize0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0002 begin');
      const result: string = ResourceUtils.sanitizeWorld('   ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('world'));
      expect(result).assertEqual('world');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0002 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitize0003
     * @tc.number SUB_RESMGR_UTILS_06_0003
     * @tc.desc   sanitizeWorld('\t\n') keeps 5 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitize0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0003 begin');
      const result: string = ResourceUtils.sanitizeWorld('\t\n');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('world'));
      expect(result).assertEqual('world');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0003 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitize0004
     * @tc.number SUB_RESMGR_UTILS_06_0004
     * @tc.desc   sanitizeWorld('\n') keeps 5 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitize0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0004 begin');
      const result: string = ResourceUtils.sanitizeWorld('\n');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('world'));
      expect(result).assertEqual('world');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0004 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitize0005
     * @tc.number SUB_RESMGR_UTILS_06_0005
     * @tc.desc   sanitizeWorld(' world ') keeps 5 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitize0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0005 begin');
      const result: string = ResourceUtils.sanitizeWorld(' world ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('world'));
      expect(result).assertEqual('world');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0005 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitize0006
     * @tc.number SUB_RESMGR_UTILS_06_0006
     * @tc.desc   sanitizeWorld('world') keeps 5 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitize0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0006 begin');
      const result: string = ResourceUtils.sanitizeWorld('world');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('world'));
      expect(result).assertEqual('world');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0006 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitize0007
     * @tc.number SUB_RESMGR_UTILS_06_0007
     * @tc.desc   sanitizeWorld('  hello  ') keeps 5 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitize0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0007 begin');
      const result: string = ResourceUtils.sanitizeWorld('  hello  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('hello'));
      expect(result).assertEqual('hello');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0007 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitize0008
     * @tc.number SUB_RESMGR_UTILS_06_0008
     * @tc.desc   sanitizeWorld('hello world') keeps 11 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitize0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0008 begin');
      const result: string = ResourceUtils.sanitizeWorld('hello world');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('hello world'));
      expect(result).assertEqual('hello world');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0008 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitize0009
     * @tc.number SUB_RESMGR_UTILS_06_0009
     * @tc.desc   sanitizeWorld('  hello world  ') keeps 11 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitize0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0009 begin');
      const result: string = ResourceUtils.sanitizeWorld('  hello world  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('hello world'));
      expect(result).assertEqual('hello world');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0009 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitize0010
     * @tc.number SUB_RESMGR_UTILS_06_0010
     * @tc.desc   sanitizeWorld('helloworld') keeps 10 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitize0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0010 begin');
      const result: string = ResourceUtils.sanitizeWorld('helloworld');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('helloworld'));
      expect(result).assertEqual('helloworld');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0010 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitize0011
     * @tc.number SUB_RESMGR_UTILS_06_0011
     * @tc.desc   sanitizeWorld('a') keeps 1 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitize0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0011 begin');
      const result: string = ResourceUtils.sanitizeWorld('a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('a'));
      expect(result).assertEqual('a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0011 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitize0012
     * @tc.number SUB_RESMGR_UTILS_06_0012
     * @tc.desc   sanitizeWorld('ab') keeps 2 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitize0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0012 begin');
      const result: string = ResourceUtils.sanitizeWorld('ab');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('ab'));
      expect(result).assertEqual('ab');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0012 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitize0013
     * @tc.number SUB_RESMGR_UTILS_06_0013
     * @tc.desc   sanitizeWorld('abc') keeps 3 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitize0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0013 begin');
      const result: string = ResourceUtils.sanitizeWorld('abc');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('abc'));
      expect(result).assertEqual('abc');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0013 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitize0014
     * @tc.number SUB_RESMGR_UTILS_06_0014
     * @tc.desc   sanitizeWorld('abcd') keeps 4 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitize0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0014 begin');
      const result: string = ResourceUtils.sanitizeWorld('abcd');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('abcd'));
      expect(result).assertEqual('abcd');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0014 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitize0015
     * @tc.number SUB_RESMGR_UTILS_06_0015
     * @tc.desc   sanitizeWorld('abcde') keeps 5 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitize0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0015 begin');
      const result: string = ResourceUtils.sanitizeWorld('abcde');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('abcde'));
      expect(result).assertEqual('abcde');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0015 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitize0016
     * @tc.number SUB_RESMGR_UTILS_06_0016
     * @tc.desc   sanitizeWorld('abcdef') keeps 6 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitize0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0016 begin');
      const result: string = ResourceUtils.sanitizeWorld('abcdef');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('abcdef'));
      expect(result).assertEqual('abcdef');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0016 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitize0017
     * @tc.number SUB_RESMGR_UTILS_06_0017
     * @tc.desc   sanitizeWorld('abcdefg') keeps 7 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitize0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0017 begin');
      const result: string = ResourceUtils.sanitizeWorld('abcdefg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('abcdefg'));
      expect(result).assertEqual('abcdefg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0017 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitize0018
     * @tc.number SUB_RESMGR_UTILS_06_0018
     * @tc.desc   sanitizeWorld('abcdefgh') keeps 8 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitize0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0018 begin');
      const result: string = ResourceUtils.sanitizeWorld('abcdefgh');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('abcdefgh'));
      expect(result).assertEqual('abcdefgh');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0018 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitize0019
     * @tc.number SUB_RESMGR_UTILS_06_0019
     * @tc.desc   sanitizeWorld('abcdefghi') keeps 9 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitize0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0019 begin');
      const result: string = ResourceUtils.sanitizeWorld('abcdefghi');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('abcdefghi'));
      expect(result).assertEqual('abcdefghi');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0019 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitize0020
     * @tc.number SUB_RESMGR_UTILS_06_0020
     * @tc.desc   sanitizeWorld('abcdefghij') keeps 10 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitize0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0020 begin');
      const result: string = ResourceUtils.sanitizeWorld('abcdefghij');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('abcdefghij'));
      expect(result).assertEqual('abcdefghij');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0020 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitize0021
     * @tc.number SUB_RESMGR_UTILS_06_0021
     * @tc.desc   sanitizeWorld('abcdefghijk') keeps 11 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitize0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0021 begin');
      const result: string = ResourceUtils.sanitizeWorld('abcdefghijk');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('abcdefghijk'));
      expect(result).assertEqual('abcdefghijk');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0021 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitize0022
     * @tc.number SUB_RESMGR_UTILS_06_0022
     * @tc.desc   sanitizeWorld('abcdefghijkl') keeps 12 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitize0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0022 begin');
      const result: string = ResourceUtils.sanitizeWorld('abcdefghijkl');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('abcdefghijkl'));
      expect(result).assertEqual('abcdefghijkl');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0022 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitize0023
     * @tc.number SUB_RESMGR_UTILS_06_0023
     * @tc.desc   sanitizeWorld('abcdefghijklm') keeps 13 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitize0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0023 begin');
      const result: string = ResourceUtils.sanitizeWorld('abcdefghijklm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('abcdefghijklm'));
      expect(result).assertEqual('abcdefghijklm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0023 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitize0024
     * @tc.number SUB_RESMGR_UTILS_06_0024
     * @tc.desc   sanitizeWorld('abcdefghijklmn') keeps 14 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitize0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0024 begin');
      const result: string = ResourceUtils.sanitizeWorld('abcdefghijklmn');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('abcdefghijklmn'));
      expect(result).assertEqual('abcdefghijklmn');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0024 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitize0025
     * @tc.number SUB_RESMGR_UTILS_06_0025
     * @tc.desc   sanitizeWorld('abcdefghijklmno') keeps 15 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitize0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0025 begin');
      const result: string = ResourceUtils.sanitizeWorld('abcdefghijklmno');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('abcdefghijklmno'));
      expect(result).assertEqual('abcdefghijklmno');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0025 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitize0026
     * @tc.number SUB_RESMGR_UTILS_06_0026
     * @tc.desc   sanitizeWorld('abcdefghijklmnop') keeps 16 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitize0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0026 begin');
      const result: string = ResourceUtils.sanitizeWorld('abcdefghijklmnop');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('abcdefghijklmnop'));
      expect(result).assertEqual('abcdefghijklmnop');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0026 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitize0027
     * @tc.number SUB_RESMGR_UTILS_06_0027
     * @tc.desc   sanitizeWorld('abcdefghijklmnopq') keeps 19 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitize0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0027 begin');
      const result: string = ResourceUtils.sanitizeWorld('abcdefghijklmnopq');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('abcdefghijklmnop...'));
      expect(result).assertEqual('abcdefghijklmnop...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0027 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitize0028
     * @tc.number SUB_RESMGR_UTILS_06_0028
     * @tc.desc   sanitizeWorld('abcdefghijklmnopqr') keeps 19 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitize0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0028 begin');
      const result: string = ResourceUtils.sanitizeWorld('abcdefghijklmnopqr');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('abcdefghijklmnop...'));
      expect(result).assertEqual('abcdefghijklmnop...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0028 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitize0029
     * @tc.number SUB_RESMGR_UTILS_06_0029
     * @tc.desc   sanitizeWorld('abcdefghijklmnopqrst') keeps 19 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitize0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0029 begin');
      const result: string = ResourceUtils.sanitizeWorld('abcdefghijklmnopqrst');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('abcdefghijklmnop...'));
      expect(result).assertEqual('abcdefghijklmnop...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0029 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitize0030
     * @tc.number SUB_RESMGR_UTILS_06_0030
     * @tc.desc   sanitizeWorld('abcdefghijklmnopqrstuvwxyz0123456789') keeps 19 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitize0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0030 begin');
      const result: string = ResourceUtils.sanitizeWorld('abcdefghijklmnopqrstuvwxyz0123456789');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('abcdefghijklmnop...'));
      expect(result).assertEqual('abcdefghijklmnop...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0030 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitize0031
     * @tc.number SUB_RESMGR_UTILS_06_0031
     * @tc.desc   sanitizeWorld('你好世界') keeps 4 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitize0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0031 begin');
      const result: string = ResourceUtils.sanitizeWorld('你好世界');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('你好世界'));
      expect(result).assertEqual('你好世界');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0031 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitize0032
     * @tc.number SUB_RESMGR_UTILS_06_0032
     * @tc.desc   sanitizeWorld('  你好世界  ') keeps 4 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitize0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0032 begin');
      const result: string = ResourceUtils.sanitizeWorld('  你好世界  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('你好世界'));
      expect(result).assertEqual('你好世界');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0032 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitize0033
     * @tc.number SUB_RESMGR_UTILS_06_0033
     * @tc.desc   sanitizeWorld('APPLE') keeps 5 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitize0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0033 begin');
      const result: string = ResourceUtils.sanitizeWorld('APPLE');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('APPLE'));
      expect(result).assertEqual('APPLE');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0033 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitize0034
     * @tc.number SUB_RESMGR_UTILS_06_0034
     * @tc.desc   sanitizeWorld('apple') keeps 5 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitize0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0034 begin');
      const result: string = ResourceUtils.sanitizeWorld('apple');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('apple'));
      expect(result).assertEqual('apple');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0034 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitize0035
     * @tc.number SUB_RESMGR_UTILS_06_0035
     * @tc.desc   sanitizeWorld('A1') keeps 2 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitize0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0035 begin');
      const result: string = ResourceUtils.sanitizeWorld('A1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('A1'));
      expect(result).assertEqual('A1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0035 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitize0036
     * @tc.number SUB_RESMGR_UTILS_06_0036
     * @tc.desc   sanitizeWorld('1') keeps 1 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitize0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0036 begin');
      const result: string = ResourceUtils.sanitizeWorld('1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1'));
      expect(result).assertEqual('1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0036 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitize0037
     * @tc.number SUB_RESMGR_UTILS_06_0037
     * @tc.desc   sanitizeWorld('0') keeps 1 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitize0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0037 begin');
      const result: string = ResourceUtils.sanitizeWorld('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(result).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0037 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitize0038
     * @tc.number SUB_RESMGR_UTILS_06_0038
     * @tc.desc   sanitizeWorld(' 1 ') keeps 1 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitize0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0038 begin');
      const result: string = ResourceUtils.sanitizeWorld(' 1 ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1'));
      expect(result).assertEqual('1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0038 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitize0039
     * @tc.number SUB_RESMGR_UTILS_06_0039
     * @tc.desc   sanitizeWorld('x y z') keeps 5 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitize0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0039 begin');
      const result: string = ResourceUtils.sanitizeWorld('x y z');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('x y z'));
      expect(result).assertEqual('x y z');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0039 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitize0040
     * @tc.number SUB_RESMGR_UTILS_06_0040
     * @tc.desc   sanitizeWorld('  x y z  ') keeps 5 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitize0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0040 begin');
      const result: string = ResourceUtils.sanitizeWorld('  x y z  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('x y z'));
      expect(result).assertEqual('x y z');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0040 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitize0041
     * @tc.number SUB_RESMGR_UTILS_06_0041
     * @tc.desc   sanitizeWorld('..') keeps 2 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitize0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0041 begin');
      const result: string = ResourceUtils.sanitizeWorld('..');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('..'));
      expect(result).assertEqual('..');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0041 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitize0042
     * @tc.number SUB_RESMGR_UTILS_06_0042
     * @tc.desc   sanitizeWorld('---') keeps 3 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitize0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0042 begin');
      const result: string = ResourceUtils.sanitizeWorld('---');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('---'));
      expect(result).assertEqual('---');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0042 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitize0043
     * @tc.number SUB_RESMGR_UTILS_06_0043
     * @tc.desc   sanitizeWorld('__') keeps 2 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitize0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0043 begin');
      const result: string = ResourceUtils.sanitizeWorld('__');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('__'));
      expect(result).assertEqual('__');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0043 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitize0044
     * @tc.number SUB_RESMGR_UTILS_06_0044
     * @tc.desc   sanitizeWorld('  -  ') keeps 1 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitize0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0044 begin');
      const result: string = ResourceUtils.sanitizeWorld('  -  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('-'));
      expect(result).assertEqual('-');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0044 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitize0045
     * @tc.number SUB_RESMGR_UTILS_06_0045
     * @tc.desc   sanitizeWorld('\t') keeps 5 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitize0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0045 begin');
      const result: string = ResourceUtils.sanitizeWorld('\t');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('world'));
      expect(result).assertEqual('world');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0045 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitize0046
     * @tc.number SUB_RESMGR_UTILS_06_0046
     * @tc.desc   sanitizeWorld('\t\t') keeps 5 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitize0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0046 begin');
      const result: string = ResourceUtils.sanitizeWorld('\t\t');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('world'));
      expect(result).assertEqual('world');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0046 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitize0047
     * @tc.number SUB_RESMGR_UTILS_06_0047
     * @tc.desc   sanitizeWorld('a b') keeps 3 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitize0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0047 begin');
      const result: string = ResourceUtils.sanitizeWorld('a b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('a b'));
      expect(result).assertEqual('a b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0047 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitize0048
     * @tc.number SUB_RESMGR_UTILS_06_0048
     * @tc.desc   sanitizeWorld('a  b') keeps 4 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitize0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0048 begin');
      const result: string = ResourceUtils.sanitizeWorld('a  b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('a  b'));
      expect(result).assertEqual('a  b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0048 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitize0049
     * @tc.number SUB_RESMGR_UTILS_06_0049
     * @tc.desc   sanitizeWorld(' spaced ') keeps 6 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitize0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0049 begin');
      const result: string = ResourceUtils.sanitizeWorld(' spaced ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('spaced'));
      expect(result).assertEqual('spaced');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0049 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitize0050
     * @tc.number SUB_RESMGR_UTILS_06_0050
     * @tc.desc   sanitizeWorld('0123456789') keeps 10 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitize0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0050 begin');
      const result: string = ResourceUtils.sanitizeWorld('0123456789');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0123456789'));
      expect(result).assertEqual('0123456789');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0050 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitize0051
     * @tc.number SUB_RESMGR_UTILS_06_0051
     * @tc.desc   sanitizeWorld('0123456789abcde') keeps 15 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitize0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0051 begin');
      const result: string = ResourceUtils.sanitizeWorld('0123456789abcde');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('0123456789abcde'));
      expect(result).assertEqual('0123456789abcde');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0051 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitize0052
     * @tc.number SUB_RESMGR_UTILS_06_0052
     * @tc.desc   sanitizeWorld('0123456789abcdef') keeps 16 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitize0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0052 begin');
      const result: string = ResourceUtils.sanitizeWorld('0123456789abcdef');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('0123456789abcdef'));
      expect(result).assertEqual('0123456789abcdef');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0052 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitize0053
     * @tc.number SUB_RESMGR_UTILS_06_0053
     * @tc.desc   sanitizeWorld('0123456789abcdefg') keeps 19 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitize0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0053 begin');
      const result: string = ResourceUtils.sanitizeWorld('0123456789abcdefg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('0123456789abcdef...'));
      expect(result).assertEqual('0123456789abcdef...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0053 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitize0054
     * @tc.number SUB_RESMGR_UTILS_06_0054
     * @tc.desc   sanitizeWorld('Z') keeps 1 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitize0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0054 begin');
      const result: string = ResourceUtils.sanitizeWorld('Z');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('Z'));
      expect(result).assertEqual('Z');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0054 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitize0055
     * @tc.number SUB_RESMGR_UTILS_06_0055
     * @tc.desc   sanitizeWorld('zz') keeps 2 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitize0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0055 begin');
      const result: string = ResourceUtils.sanitizeWorld('zz');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('zz'));
      expect(result).assertEqual('zz');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0055 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitize0056
     * @tc.number SUB_RESMGR_UTILS_06_0056
     * @tc.desc   sanitizeWorld('zzz') keeps 3 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitize0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0056 begin');
      const result: string = ResourceUtils.sanitizeWorld('zzz');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('zzz'));
      expect(result).assertEqual('zzz');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0056 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitize0057
     * @tc.number SUB_RESMGR_UTILS_06_0057
     * @tc.desc   sanitizeWorld('world  ') keeps 5 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitize0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0057 begin');
      const result: string = ResourceUtils.sanitizeWorld('world  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('world'));
      expect(result).assertEqual('world');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0057 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitize0058
     * @tc.number SUB_RESMGR_UTILS_06_0058
     * @tc.desc   sanitizeWorld('  world') keeps 5 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitize0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0058 begin');
      const result: string = ResourceUtils.sanitizeWorld('  world');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('world'));
      expect(result).assertEqual('world');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0058 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitize0059
     * @tc.number SUB_RESMGR_UTILS_06_0059
     * @tc.desc   sanitizeWorld('W o r l d') keeps 9 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitize0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0059 begin');
      const result: string = ResourceUtils.sanitizeWorld('W o r l d');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('W o r l d'));
      expect(result).assertEqual('W o r l d');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0059 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitize0060
     * @tc.number SUB_RESMGR_UTILS_06_0060
     * @tc.desc   sanitizeWorld('multi word text here') keeps 19 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitize0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0060 begin');
      const result: string = ResourceUtils.sanitizeWorld('multi word text here');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('multi word text ...'));
      expect(result).assertEqual('multi word text ...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0060 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitize0061
     * @tc.number SUB_RESMGR_UTILS_06_0061
     * @tc.desc   空白占位符回落与 16 字符截断的左右边界
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitize0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0061 begin');
      // 空串与纯空白都要换成默认词，不能把空串拼进 formatStr
      const empty: string = ResourceUtils.sanitizeWorld('');
      const blanks: string = ResourceUtils.sanitizeWorld('   ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', empty, 'world');
      expect(empty).assertEqual('world');
      expect(blanks).assertEqual('world');
      // 首尾空白必须去掉，中间空白保留
      const padded: string = ResourceUtils.sanitizeWorld('  Apple  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', padded, 'Apple');
      expect(padded).assertEqual('Apple');
      expect(ResourceUtils.sanitizeWorld('a b')).assertEqual('a b');
      // 恰好 16 个字符不截断，第 17 个字符开始截断并补三个点
      const exactly16: string = ResourceUtils.sanitizeWorld('abcdefghijklmnop');
      const seventeen: string = ResourceUtils.sanitizeWorld('abcdefghijklmnopq');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', exactly16, 'abcdefghijklmnop');
      expect(exactly16).assertEqual('abcdefghijklmnop');
      expect(seventeen).assertEqual('abcdefghijklmnop...');
      expect(seventeen.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitize0061 end');
    })

  })
}
