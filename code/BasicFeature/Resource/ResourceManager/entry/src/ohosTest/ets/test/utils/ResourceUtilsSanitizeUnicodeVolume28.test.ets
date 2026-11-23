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

export default function resourceUtilsSanitizeUnicodeTest() {
  describe('ResourceUtilsSanitizeUnicodeTest', () => {

    /**
     * @tc.name   testResourceUtilsSanitizeUnicode0001
     * @tc.number SUB_RESMGR_UTILS28_0001
     * @tc.desc   ascii word of length 1 is kept unchanged
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeUnicode0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0001 begin');
      const result: string = ResourceUtils.sanitizeWorld('a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('a'));
      expect(result).assertEqual('a');
      const resultLength: number = result.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resultLength), String(1));
      expect(resultLength).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.sanitizeWorld(result)), String('a'));
      expect(ResourceUtils.sanitizeWorld(result)).assertEqual('a');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0001 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeUnicode0002
     * @tc.number SUB_RESMGR_UTILS28_0002
     * @tc.desc   ascii word of length 2 is kept unchanged
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeUnicode0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0002 begin');
      const result: string = ResourceUtils.sanitizeWorld('bb');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('bb'));
      expect(result).assertEqual('bb');
      const resultLength: number = result.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resultLength), String(2));
      expect(resultLength).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.sanitizeWorld(result)), String('bb'));
      expect(ResourceUtils.sanitizeWorld(result)).assertEqual('bb');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0002 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeUnicode0003
     * @tc.number SUB_RESMGR_UTILS28_0003
     * @tc.desc   ascii word of length 3 is kept unchanged
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeUnicode0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0003 begin');
      const result: string = ResourceUtils.sanitizeWorld('aaa');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('aaa'));
      expect(result).assertEqual('aaa');
      const resultLength: number = result.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resultLength), String(3));
      expect(resultLength).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.sanitizeWorld(result)), String('aaa'));
      expect(ResourceUtils.sanitizeWorld(result)).assertEqual('aaa');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0003 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeUnicode0004
     * @tc.number SUB_RESMGR_UTILS28_0004
     * @tc.desc   ascii word of length 4 is kept unchanged
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeUnicode0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0004 begin');
      const result: string = ResourceUtils.sanitizeWorld('aaaa');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('aaaa'));
      expect(result).assertEqual('aaaa');
      const resultLength: number = result.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resultLength), String(4));
      expect(resultLength).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.sanitizeWorld(result)), String('aaaa'));
      expect(ResourceUtils.sanitizeWorld(result)).assertEqual('aaaa');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0004 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeUnicode0005
     * @tc.number SUB_RESMGR_UTILS28_0005
     * @tc.desc   ascii word of length 5 is kept unchanged
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeUnicode0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0005 begin');
      const result: string = ResourceUtils.sanitizeWorld('aaaaa');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('aaaaa'));
      expect(result).assertEqual('aaaaa');
      const resultLength: number = result.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resultLength), String(5));
      expect(resultLength).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.sanitizeWorld(result)), String('aaaaa'));
      expect(ResourceUtils.sanitizeWorld(result)).assertEqual('aaaaa');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0005 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeUnicode0006
     * @tc.number SUB_RESMGR_UTILS28_0006
     * @tc.desc   ascii word of length 6 is kept unchanged
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeUnicode0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0006 begin');
      const result: string = ResourceUtils.sanitizeWorld('aaaaaa');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('aaaaaa'));
      expect(result).assertEqual('aaaaaa');
      const resultLength: number = result.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resultLength), String(6));
      expect(resultLength).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.sanitizeWorld(result)), String('aaaaaa'));
      expect(ResourceUtils.sanitizeWorld(result)).assertEqual('aaaaaa');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0006 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeUnicode0007
     * @tc.number SUB_RESMGR_UTILS28_0007
     * @tc.desc   ascii word of length 7 is kept unchanged
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeUnicode0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0007 begin');
      const result: string = ResourceUtils.sanitizeWorld('aaaaaaa');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('aaaaaaa'));
      expect(result).assertEqual('aaaaaaa');
      const resultLength: number = result.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resultLength), String(7));
      expect(resultLength).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.sanitizeWorld(result)), String('aaaaaaa'));
      expect(ResourceUtils.sanitizeWorld(result)).assertEqual('aaaaaaa');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0007 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeUnicode0008
     * @tc.number SUB_RESMGR_UTILS28_0008
     * @tc.desc   ascii word of length 8 is kept unchanged
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeUnicode0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0008 begin');
      const result: string = ResourceUtils.sanitizeWorld('aaaaaaaa');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('aaaaaaaa'));
      expect(result).assertEqual('aaaaaaaa');
      const resultLength: number = result.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resultLength), String(8));
      expect(resultLength).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.sanitizeWorld(result)), String('aaaaaaaa'));
      expect(ResourceUtils.sanitizeWorld(result)).assertEqual('aaaaaaaa');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0008 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeUnicode0009
     * @tc.number SUB_RESMGR_UTILS28_0009
     * @tc.desc   ascii word of length 9 is kept unchanged
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeUnicode0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0009 begin');
      const result: string = ResourceUtils.sanitizeWorld('aaaaaaaaa');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('aaaaaaaaa'));
      expect(result).assertEqual('aaaaaaaaa');
      const resultLength: number = result.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resultLength), String(9));
      expect(resultLength).assertEqual(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.sanitizeWorld(result)), String('aaaaaaaaa'));
      expect(ResourceUtils.sanitizeWorld(result)).assertEqual('aaaaaaaaa');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0009 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeUnicode0010
     * @tc.number SUB_RESMGR_UTILS28_0010
     * @tc.desc   ascii word of length 10 is kept unchanged
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeUnicode0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0010 begin');
      const result: string = ResourceUtils.sanitizeWorld('aaaaaaaaaa');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('aaaaaaaaaa'));
      expect(result).assertEqual('aaaaaaaaaa');
      const resultLength: number = result.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resultLength), String(10));
      expect(resultLength).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.sanitizeWorld(result)), String('aaaaaaaaaa'));
      expect(ResourceUtils.sanitizeWorld(result)).assertEqual('aaaaaaaaaa');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0010 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeUnicode0011
     * @tc.number SUB_RESMGR_UTILS28_0011
     * @tc.desc   ascii word of length 11 is kept unchanged
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeUnicode0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0011 begin');
      const result: string = ResourceUtils.sanitizeWorld('aaaaaaaaaaa');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('aaaaaaaaaaa'));
      expect(result).assertEqual('aaaaaaaaaaa');
      const resultLength: number = result.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resultLength), String(11));
      expect(resultLength).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.sanitizeWorld(result)), String('aaaaaaaaaaa'));
      expect(ResourceUtils.sanitizeWorld(result)).assertEqual('aaaaaaaaaaa');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0011 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeUnicode0012
     * @tc.number SUB_RESMGR_UTILS28_0012
     * @tc.desc   ascii word of length 12 is kept unchanged
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeUnicode0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0012 begin');
      const result: string = ResourceUtils.sanitizeWorld('aaaaaaaaaaaa');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('aaaaaaaaaaaa'));
      expect(result).assertEqual('aaaaaaaaaaaa');
      const resultLength: number = result.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resultLength), String(12));
      expect(resultLength).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.sanitizeWorld(result)), String('aaaaaaaaaaaa'));
      expect(ResourceUtils.sanitizeWorld(result)).assertEqual('aaaaaaaaaaaa');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0012 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeUnicode0013
     * @tc.number SUB_RESMGR_UTILS28_0013
     * @tc.desc   ascii word of length 13 is kept unchanged
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeUnicode0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0013 begin');
      const result: string = ResourceUtils.sanitizeWorld('aaaaaaaaaaaaa');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('aaaaaaaaaaaaa'));
      expect(result).assertEqual('aaaaaaaaaaaaa');
      const resultLength: number = result.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resultLength), String(13));
      expect(resultLength).assertEqual(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.sanitizeWorld(result)), String('aaaaaaaaaaaaa'));
      expect(ResourceUtils.sanitizeWorld(result)).assertEqual('aaaaaaaaaaaaa');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0013 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeUnicode0014
     * @tc.number SUB_RESMGR_UTILS28_0014
     * @tc.desc   ascii word of length 14 is kept unchanged
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeUnicode0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0014 begin');
      const result: string = ResourceUtils.sanitizeWorld('aaaaaaaaaaaaaa');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('aaaaaaaaaaaaaa'));
      expect(result).assertEqual('aaaaaaaaaaaaaa');
      const resultLength: number = result.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resultLength), String(14));
      expect(resultLength).assertEqual(14);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.sanitizeWorld(result)), String('aaaaaaaaaaaaaa'));
      expect(ResourceUtils.sanitizeWorld(result)).assertEqual('aaaaaaaaaaaaaa');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0014 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeUnicode0015
     * @tc.number SUB_RESMGR_UTILS28_0015
     * @tc.desc   ascii word of length 15 is kept unchanged
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeUnicode0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0015 begin');
      const result: string = ResourceUtils.sanitizeWorld('aaaaaaaaaaaaaaa');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('aaaaaaaaaaaaaaa'));
      expect(result).assertEqual('aaaaaaaaaaaaaaa');
      const resultLength: number = result.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resultLength), String(15));
      expect(resultLength).assertEqual(15);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.sanitizeWorld(result)), String('aaaaaaaaaaaaaaa'));
      expect(ResourceUtils.sanitizeWorld(result)).assertEqual('aaaaaaaaaaaaaaa');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0015 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeUnicode0016
     * @tc.number SUB_RESMGR_UTILS28_0016
     * @tc.desc   ascii word of length 16 is kept unchanged
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeUnicode0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0016 begin');
      const result: string = ResourceUtils.sanitizeWorld('aaaaaaaaaaaaaaaa');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('aaaaaaaaaaaaaaaa'));
      expect(result).assertEqual('aaaaaaaaaaaaaaaa');
      const resultLength: number = result.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resultLength), String(16));
      expect(resultLength).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.sanitizeWorld(result)), String('aaaaaaaaaaaaaaaa'));
      expect(ResourceUtils.sanitizeWorld(result)).assertEqual('aaaaaaaaaaaaaaaa');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0016 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeUnicode0017
     * @tc.number SUB_RESMGR_UTILS28_0017
     * @tc.desc   ascii word of length 17 is truncated at 16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeUnicode0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0017 begin');
      const result: string = ResourceUtils.sanitizeWorld('aaaaaaaaaaaaaaaaa');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('aaaaaaaaaaaaaaaa...'));
      expect(result).assertEqual('aaaaaaaaaaaaaaaa...');
      const resultLength: number = result.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resultLength), String(19));
      expect(resultLength).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.sanitizeWorld(result)), String('aaaaaaaaaaaaaaaa...'));
      expect(ResourceUtils.sanitizeWorld(result)).assertEqual('aaaaaaaaaaaaaaaa...');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0017 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeUnicode0018
     * @tc.number SUB_RESMGR_UTILS28_0018
     * @tc.desc   ascii word of length 18 is truncated at 16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeUnicode0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0018 begin');
      const result: string = ResourceUtils.sanitizeWorld('aaaaaaaaaaaaaaaaaa');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('aaaaaaaaaaaaaaaa...'));
      expect(result).assertEqual('aaaaaaaaaaaaaaaa...');
      const resultLength: number = result.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resultLength), String(19));
      expect(resultLength).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.sanitizeWorld(result)), String('aaaaaaaaaaaaaaaa...'));
      expect(ResourceUtils.sanitizeWorld(result)).assertEqual('aaaaaaaaaaaaaaaa...');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0018 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeUnicode0019
     * @tc.number SUB_RESMGR_UTILS28_0019
     * @tc.desc   ascii word of length 20 is truncated at 16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeUnicode0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0019 begin');
      const result: string = ResourceUtils.sanitizeWorld('aaaaaaaaaaaaaaaaaaaa');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('aaaaaaaaaaaaaaaa...'));
      expect(result).assertEqual('aaaaaaaaaaaaaaaa...');
      const resultLength: number = result.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resultLength), String(19));
      expect(resultLength).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.sanitizeWorld(result)), String('aaaaaaaaaaaaaaaa...'));
      expect(ResourceUtils.sanitizeWorld(result)).assertEqual('aaaaaaaaaaaaaaaa...');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0019 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeUnicode0020
     * @tc.number SUB_RESMGR_UTILS28_0020
     * @tc.desc   ascii word of length 24 is truncated at 16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeUnicode0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0020 begin');
      const result: string = ResourceUtils.sanitizeWorld('aaaaaaaaaaaaaaaaaaaaaaaa');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('aaaaaaaaaaaaaaaa...'));
      expect(result).assertEqual('aaaaaaaaaaaaaaaa...');
      const resultLength: number = result.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resultLength), String(19));
      expect(resultLength).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.sanitizeWorld(result)), String('aaaaaaaaaaaaaaaa...'));
      expect(ResourceUtils.sanitizeWorld(result)).assertEqual('aaaaaaaaaaaaaaaa...');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0020 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeUnicode0021
     * @tc.number SUB_RESMGR_UTILS28_0021
     * @tc.desc   ascii word of length 32 is truncated at 16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeUnicode0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0021 begin');
      const result: string = ResourceUtils.sanitizeWorld('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('aaaaaaaaaaaaaaaa...'));
      expect(result).assertEqual('aaaaaaaaaaaaaaaa...');
      const resultLength: number = result.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resultLength), String(19));
      expect(resultLength).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.sanitizeWorld(result)), String('aaaaaaaaaaaaaaaa...'));
      expect(ResourceUtils.sanitizeWorld(result)).assertEqual('aaaaaaaaaaaaaaaa...');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0021 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeUnicode0022
     * @tc.number SUB_RESMGR_UTILS28_0022
     * @tc.desc   ascii word of length 40 is truncated at 16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeUnicode0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0022 begin');
      const result: string = ResourceUtils.sanitizeWorld('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('aaaaaaaaaaaaaaaa...'));
      expect(result).assertEqual('aaaaaaaaaaaaaaaa...');
      const resultLength: number = result.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resultLength), String(19));
      expect(resultLength).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.sanitizeWorld(result)), String('aaaaaaaaaaaaaaaa...'));
      expect(ResourceUtils.sanitizeWorld(result)).assertEqual('aaaaaaaaaaaaaaaa...');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0022 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeUnicode0023
     * @tc.number SUB_RESMGR_UTILS28_0023
     * @tc.desc   ascii word of length 64 is truncated at 16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeUnicode0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0023 begin');
      const result: string = ResourceUtils.sanitizeWorld('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('aaaaaaaaaaaaaaaa...'));
      expect(result).assertEqual('aaaaaaaaaaaaaaaa...');
      const resultLength: number = result.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resultLength), String(19));
      expect(resultLength).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.sanitizeWorld(result)), String('aaaaaaaaaaaaaaaa...'));
      expect(ResourceUtils.sanitizeWorld(result)).assertEqual('aaaaaaaaaaaaaaaa...');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0023 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeUnicode0024
     * @tc.number SUB_RESMGR_UTILS28_0024
     * @tc.desc   ascii word of length 100 is truncated at 16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeUnicode0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0024 begin');
      const result: string = ResourceUtils.sanitizeWorld('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('aaaaaaaaaaaaaaaa...'));
      expect(result).assertEqual('aaaaaaaaaaaaaaaa...');
      const resultLength: number = result.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resultLength), String(19));
      expect(resultLength).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.sanitizeWorld(result)), String('aaaaaaaaaaaaaaaa...'));
      expect(ResourceUtils.sanitizeWorld(result)).assertEqual('aaaaaaaaaaaaaaaa...');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0024 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeUnicode0025
     * @tc.number SUB_RESMGR_UTILS28_0025
     * @tc.desc   1 emoji stay whole because 2 utf-16 units fit the cap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeUnicode0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0025 begin');
      const result: string = ResourceUtils.sanitizeWorld('\uD83D\uDE00'.repeat(1));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('\ud83d\ude00'));
      expect(result).assertEqual('\ud83d\ude00');
      const resultLength: number = result.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resultLength), String(2));
      expect(resultLength).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.sanitizeWorld(result)), String('\ud83d\ude00'));
      expect(ResourceUtils.sanitizeWorld(result)).assertEqual('\ud83d\ude00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0025 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeUnicode0026
     * @tc.number SUB_RESMGR_UTILS28_0026
     * @tc.desc   2 emoji stay whole because 4 utf-16 units fit the cap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeUnicode0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0026 begin');
      const result: string = ResourceUtils.sanitizeWorld('\uD83D\uDE00'.repeat(2));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('\ud83d\ude00\ud83d\ude00'));
      expect(result).assertEqual('\ud83d\ude00\ud83d\ude00');
      const resultLength: number = result.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resultLength), String(4));
      expect(resultLength).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.sanitizeWorld(result)), String('\ud83d\ude00\ud83d\ude00'));
      expect(ResourceUtils.sanitizeWorld(result)).assertEqual('\ud83d\ude00\ud83d\ude00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0026 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeUnicode0027
     * @tc.number SUB_RESMGR_UTILS28_0027
     * @tc.desc   3 emoji stay whole because 6 utf-16 units fit the cap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeUnicode0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0027 begin');
      const result: string = ResourceUtils.sanitizeWorld('\uD83D\uDE00'.repeat(3));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('\ud83d\ude00\ud83d\ude00\ud83d\ude00'));
      expect(result).assertEqual('\ud83d\ude00\ud83d\ude00\ud83d\ude00');
      const resultLength: number = result.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resultLength), String(6));
      expect(resultLength).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.sanitizeWorld(result)), String('\ud83d\ude00\ud83d\ude00\ud83d\ude00'));
      expect(ResourceUtils.sanitizeWorld(result)).assertEqual('\ud83d\ude00\ud83d\ude00\ud83d\ude00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0027 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeUnicode0028
     * @tc.number SUB_RESMGR_UTILS28_0028
     * @tc.desc   4 emoji stay whole because 8 utf-16 units fit the cap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeUnicode0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0028 begin');
      const result: string = ResourceUtils.sanitizeWorld('\uD83D\uDE00'.repeat(4));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00'));
      expect(result).assertEqual('\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00');
      const resultLength: number = result.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resultLength), String(8));
      expect(resultLength).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.sanitizeWorld(result)), String('\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00'));
      expect(ResourceUtils.sanitizeWorld(result)).assertEqual('\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0028 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeUnicode0029
     * @tc.number SUB_RESMGR_UTILS28_0029
     * @tc.desc   5 emoji stay whole because 10 utf-16 units fit the cap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeUnicode0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0029 begin');
      const result: string = ResourceUtils.sanitizeWorld('\uD83D\uDE00'.repeat(5));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00'));
      expect(result).assertEqual('\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00');
      const resultLength: number = result.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resultLength), String(10));
      expect(resultLength).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.sanitizeWorld(result)),
          String('\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00'));
      expect(ResourceUtils.sanitizeWorld(result))
        .assertEqual('\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0029 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeUnicode0030
     * @tc.number SUB_RESMGR_UTILS28_0030
     * @tc.desc   6 emoji stay whole because 12 utf-16 units fit the cap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeUnicode0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0030 begin');
      const result: string = ResourceUtils.sanitizeWorld('\uD83D\uDE00'.repeat(6));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00'));
      expect(result).assertEqual('\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00');
      const resultLength: number = result.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resultLength), String(12));
      expect(resultLength).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.sanitizeWorld(result)),
          String('\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00'));
      expect(ResourceUtils.sanitizeWorld(result))
        .assertEqual('\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0030 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeUnicode0031
     * @tc.number SUB_RESMGR_UTILS28_0031
     * @tc.desc   7 emoji stay whole because 14 utf-16 units fit the cap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeUnicode0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0031 begin');
      const result: string = ResourceUtils.sanitizeWorld('\uD83D\uDE00'.repeat(7));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00'));
      expect(result)
        .assertEqual('\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00');
      const resultLength: number = result.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resultLength), String(14));
      expect(resultLength).assertEqual(14);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.sanitizeWorld(result)),
          String('\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00'));
      expect(ResourceUtils.sanitizeWorld(result))
        .assertEqual('\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0031 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeUnicode0032
     * @tc.number SUB_RESMGR_UTILS28_0032
     * @tc.desc   8 emoji stay whole because 16 utf-16 units fit the cap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeUnicode0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0032 begin');
      const result: string = ResourceUtils.sanitizeWorld('\uD83D\uDE00'.repeat(8));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result),
          String('\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00'));
      expect(result)
        .assertEqual(
          '\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00');
      const resultLength: number = result.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resultLength), String(16));
      expect(resultLength).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.sanitizeWorld(result)),
          String('\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00'));
      expect(ResourceUtils.sanitizeWorld(result))
        .assertEqual(
          '\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0032 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeUnicode0033
     * @tc.number SUB_RESMGR_UTILS28_0033
     * @tc.desc   9 emoji are cut at 8 whole emoji plus an ellipsis
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeUnicode0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0033 begin');
      const result: string = ResourceUtils.sanitizeWorld('\uD83D\uDE00'.repeat(9));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result),
          String('\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d' +
            '\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00...'));
      expect(result)
        .assertEqual(
          '\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00...');
      const resultLength: number = result.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resultLength), String(19));
      expect(resultLength).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.sanitizeWorld(result)),
          String('\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d' +
            '\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00...'));
      expect(ResourceUtils.sanitizeWorld(result))
        .assertEqual(
          '\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00...');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0033 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeUnicode0034
     * @tc.number SUB_RESMGR_UTILS28_0034
     * @tc.desc   10 emoji are cut at 8 whole emoji plus an ellipsis
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeUnicode0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0034 begin');
      const result: string = ResourceUtils.sanitizeWorld('\uD83D\uDE00'.repeat(10));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result),
          String('\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d' +
            '\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00...'));
      expect(result)
        .assertEqual(
          '\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00...');
      const resultLength: number = result.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resultLength), String(19));
      expect(resultLength).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.sanitizeWorld(result)),
          String('\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d' +
            '\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00...'));
      expect(ResourceUtils.sanitizeWorld(result))
        .assertEqual(
          '\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00...');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0034 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeUnicode0035
     * @tc.number SUB_RESMGR_UTILS28_0035
     * @tc.desc   12 emoji are cut at 8 whole emoji plus an ellipsis
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeUnicode0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0035 begin');
      const result: string = ResourceUtils.sanitizeWorld('\uD83D\uDE00'.repeat(12));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result),
          String('\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d' +
            '\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00...'));
      expect(result)
        .assertEqual(
          '\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00...');
      const resultLength: number = result.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resultLength), String(19));
      expect(resultLength).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.sanitizeWorld(result)),
          String('\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d' +
            '\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00...'));
      expect(ResourceUtils.sanitizeWorld(result))
        .assertEqual(
          '\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00...');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0035 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeUnicode0036
     * @tc.number SUB_RESMGR_UTILS28_0036
     * @tc.desc   16 emoji are cut at 8 whole emoji plus an ellipsis
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeUnicode0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0036 begin');
      const result: string = ResourceUtils.sanitizeWorld('\uD83D\uDE00'.repeat(16));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result),
          String('\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d' +
            '\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00...'));
      expect(result)
        .assertEqual(
          '\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00...');
      const resultLength: number = result.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resultLength), String(19));
      expect(resultLength).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.sanitizeWorld(result)),
          String('\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d' +
            '\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00...'));
      expect(ResourceUtils.sanitizeWorld(result))
        .assertEqual(
          '\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00\ud83d\ude00...');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0036 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeUnicode0037
     * @tc.number SUB_RESMGR_UTILS28_0037
     * @tc.desc   plain spaces are trimmed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeUnicode0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0037 begin');
      const result: string = ResourceUtils.sanitizeWorld(' a ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('a'));
      expect(result).assertEqual('a');
      const resultLength: number = result.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resultLength), String(1));
      expect(resultLength).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.sanitizeWorld(result)), String('a'));
      expect(ResourceUtils.sanitizeWorld(result)).assertEqual('a');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0037 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeUnicode0038
     * @tc.number SUB_RESMGR_UTILS28_0038
     * @tc.desc   tabs are trimmed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeUnicode0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0038 begin');
      const result: string = ResourceUtils.sanitizeWorld('\ta\t');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('a'));
      expect(result).assertEqual('a');
      const resultLength: number = result.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resultLength), String(1));
      expect(resultLength).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.sanitizeWorld(result)), String('a'));
      expect(ResourceUtils.sanitizeWorld(result)).assertEqual('a');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0038 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeUnicode0039
     * @tc.number SUB_RESMGR_UTILS28_0039
     * @tc.desc   new lines are trimmed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeUnicode0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0039 begin');
      const result: string = ResourceUtils.sanitizeWorld('\na\n');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('a'));
      expect(result).assertEqual('a');
      const resultLength: number = result.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resultLength), String(1));
      expect(resultLength).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.sanitizeWorld(result)), String('a'));
      expect(ResourceUtils.sanitizeWorld(result)).assertEqual('a');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0039 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeUnicode0040
     * @tc.number SUB_RESMGR_UTILS28_0040
     * @tc.desc   carriage returns are trimmed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeUnicode0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0040 begin');
      const result: string = ResourceUtils.sanitizeWorld('\ra\r');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('a'));
      expect(result).assertEqual('a');
      const resultLength: number = result.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resultLength), String(1));
      expect(resultLength).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.sanitizeWorld(result)), String('a'));
      expect(ResourceUtils.sanitizeWorld(result)).assertEqual('a');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0040 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeUnicode0041
     * @tc.number SUB_RESMGR_UTILS28_0041
     * @tc.desc   non breaking spaces are trimmed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeUnicode0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0041 begin');
      const result: string = ResourceUtils.sanitizeWorld('\u00a0a\u00a0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('a'));
      expect(result).assertEqual('a');
      const resultLength: number = result.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resultLength), String(1));
      expect(resultLength).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.sanitizeWorld(result)), String('a'));
      expect(ResourceUtils.sanitizeWorld(result)).assertEqual('a');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0041 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeUnicode0042
     * @tc.number SUB_RESMGR_UTILS28_0042
     * @tc.desc   ideographic spaces are trimmed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeUnicode0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0042 begin');
      const result: string = ResourceUtils.sanitizeWorld('\u3000a\u3000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('a'));
      expect(result).assertEqual('a');
      const resultLength: number = result.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resultLength), String(1));
      expect(resultLength).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.sanitizeWorld(result)), String('a'));
      expect(ResourceUtils.sanitizeWorld(result)).assertEqual('a');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0042 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeUnicode0043
     * @tc.number SUB_RESMGR_UTILS28_0043
     * @tc.desc   multiple plain spaces are trimmed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeUnicode0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0043 begin');
      const result: string = ResourceUtils.sanitizeWorld('  abc  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('abc'));
      expect(result).assertEqual('abc');
      const resultLength: number = result.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resultLength), String(3));
      expect(resultLength).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.sanitizeWorld(result)), String('abc'));
      expect(ResourceUtils.sanitizeWorld(result)).assertEqual('abc');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0043 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeUnicode0044
     * @tc.number SUB_RESMGR_UTILS28_0044
     * @tc.desc   mixed white spaces are trimmed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeUnicode0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0044 begin');
      const result: string = ResourceUtils.sanitizeWorld(' \t\n abc \r\n ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('abc'));
      expect(result).assertEqual('abc');
      const resultLength: number = result.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resultLength), String(3));
      expect(resultLength).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.sanitizeWorld(result)), String('abc'));
      expect(ResourceUtils.sanitizeWorld(result)).assertEqual('abc');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0044 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeUnicode0045
     * @tc.number SUB_RESMGR_UTILS28_0045
     * @tc.desc   empty input falls back to world
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeUnicode0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0045 begin');
      const result: string = ResourceUtils.sanitizeWorld('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('world'));
      expect(result).assertEqual('world');
      const resultLength: number = result.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resultLength), String(5));
      expect(resultLength).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.sanitizeWorld(result)), String('world'));
      expect(ResourceUtils.sanitizeWorld(result)).assertEqual('world');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0045 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeUnicode0046
     * @tc.number SUB_RESMGR_UTILS28_0046
     * @tc.desc   spaces only fall back to world
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeUnicode0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0046 begin');
      const result: string = ResourceUtils.sanitizeWorld('   ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('world'));
      expect(result).assertEqual('world');
      const resultLength: number = result.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resultLength), String(5));
      expect(resultLength).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.sanitizeWorld(result)), String('world'));
      expect(ResourceUtils.sanitizeWorld(result)).assertEqual('world');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0046 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeUnicode0047
     * @tc.number SUB_RESMGR_UTILS28_0047
     * @tc.desc   tabs only fall back to world
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeUnicode0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0047 begin');
      const result: string = ResourceUtils.sanitizeWorld('\t\t');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('world'));
      expect(result).assertEqual('world');
      const resultLength: number = result.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resultLength), String(5));
      expect(resultLength).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.sanitizeWorld(result)), String('world'));
      expect(ResourceUtils.sanitizeWorld(result)).assertEqual('world');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0047 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeUnicode0048
     * @tc.number SUB_RESMGR_UTILS28_0048
     * @tc.desc   ideographic spaces only fall back to world
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeUnicode0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0048 begin');
      const result: string = ResourceUtils.sanitizeWorld('\u3000\u3000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('world'));
      expect(result).assertEqual('world');
      const resultLength: number = result.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resultLength), String(5));
      expect(resultLength).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.sanitizeWorld(result)), String('world'));
      expect(ResourceUtils.sanitizeWorld(result)).assertEqual('world');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0048 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeUnicode0049
     * @tc.number SUB_RESMGR_UTILS28_0049
     * @tc.desc   full width word of length 1 follows the same 16 unit cap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeUnicode0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0049 begin');
      const result: string = ResourceUtils.sanitizeWorld('\uff57');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('\uff57'));
      expect(result).assertEqual('\uff57');
      const resultLength: number = result.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resultLength), String(1));
      expect(resultLength).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.sanitizeWorld(result)), String('\uff57'));
      expect(ResourceUtils.sanitizeWorld(result)).assertEqual('\uff57');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0049 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeUnicode0050
     * @tc.number SUB_RESMGR_UTILS28_0050
     * @tc.desc   full width word of length 3 follows the same 16 unit cap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeUnicode0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0050 begin');
      const result: string = ResourceUtils.sanitizeWorld('\uff57\uff57\uff57');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('\uff57\uff57\uff57'));
      expect(result).assertEqual('\uff57\uff57\uff57');
      const resultLength: number = result.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resultLength), String(3));
      expect(resultLength).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.sanitizeWorld(result)), String('\uff57\uff57\uff57'));
      expect(ResourceUtils.sanitizeWorld(result)).assertEqual('\uff57\uff57\uff57');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0050 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeUnicode0051
     * @tc.number SUB_RESMGR_UTILS28_0051
     * @tc.desc   full width word of length 5 follows the same 16 unit cap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeUnicode0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0051 begin');
      const result: string = ResourceUtils.sanitizeWorld('\uff57\uff57\uff57\uff57\uff57');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('\uff57\uff57\uff57\uff57\uff57'));
      expect(result).assertEqual('\uff57\uff57\uff57\uff57\uff57');
      const resultLength: number = result.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resultLength), String(5));
      expect(resultLength).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.sanitizeWorld(result)), String('\uff57\uff57\uff57\uff57\uff57'));
      expect(ResourceUtils.sanitizeWorld(result)).assertEqual('\uff57\uff57\uff57\uff57\uff57');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0051 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeUnicode0052
     * @tc.number SUB_RESMGR_UTILS28_0052
     * @tc.desc   full width word of length 8 follows the same 16 unit cap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeUnicode0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0052 begin');
      const result: string = ResourceUtils.sanitizeWorld('\uff57\uff57\uff57\uff57\uff57\uff57\uff57\uff57');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('\uff57\uff57\uff57\uff57\uff57\uff57\uff57\uff57'));
      expect(result).assertEqual('\uff57\uff57\uff57\uff57\uff57\uff57\uff57\uff57');
      const resultLength: number = result.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resultLength), String(8));
      expect(resultLength).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.sanitizeWorld(result)), String('\uff57\uff57\uff57\uff57\uff57\uff57\uff57\uff57'));
      expect(ResourceUtils.sanitizeWorld(result)).assertEqual('\uff57\uff57\uff57\uff57\uff57\uff57\uff57\uff57');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0052 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeUnicode0053
     * @tc.number SUB_RESMGR_UTILS28_0053
     * @tc.desc   full width word of length 16 follows the same 16 unit cap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeUnicode0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0053 begin');
      const result: string = ResourceUtils.sanitizeWorld('\uff57\uff57\uff57\uff57\uff57\uff57\uff57\uff57' +
        '\uff57\uff57\uff57\uff57\uff57\uff57\uff57\uff57');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result),
          String('\uff57\uff57\uff57\uff57\uff57\uff57\uff57\uff57\uff57\uff57\uff57\uff57\uff57\uff57\uff57\uff57'));
      expect(result)
        .assertEqual(
          '\uff57\uff57\uff57\uff57\uff57\uff57\uff57\uff57\uff57\uff57\uff57\uff57\uff57\uff57\uff57\uff57');
      const resultLength: number = result.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resultLength), String(16));
      expect(resultLength).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.sanitizeWorld(result)),
          String('\uff57\uff57\uff57\uff57\uff57\uff57\uff57\uff57\uff57\uff57\uff57\uff57\uff57\uff57\uff57\uff57'));
      expect(ResourceUtils.sanitizeWorld(result))
        .assertEqual(
          '\uff57\uff57\uff57\uff57\uff57\uff57\uff57\uff57\uff57\uff57\uff57\uff57\uff57\uff57\uff57\uff57');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0053 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeUnicode0054
     * @tc.number SUB_RESMGR_UTILS28_0054
     * @tc.desc   full width word of length 17 follows the same 16 unit cap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeUnicode0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0054 begin');
      const result: string = ResourceUtils.sanitizeWorld('\uff57\uff57\uff57\uff57\uff57\uff57\uff57\uff57\uff57' +
        '\uff57\uff57\uff57\uff57\uff57\uff57\uff57\uff57');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result),
          String('\uff57\uff57\uff57\uff57\uff57\uff57\uff57\uff57\uff57' +
            '\uff57\uff57\uff57\uff57\uff57\uff57\uff57...'));
      expect(result)
        .assertEqual(
          '\uff57\uff57\uff57\uff57\uff57\uff57\uff57\uff57\uff57\uff57\uff57\uff57\uff57\uff57\uff57\uff57...');
      const resultLength: number = result.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resultLength), String(19));
      expect(resultLength).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.sanitizeWorld(result)),
          String('\uff57\uff57\uff57\uff57\uff57\uff57\uff57\uff57\uff57' +
            '\uff57\uff57\uff57\uff57\uff57\uff57\uff57...'));
      expect(ResourceUtils.sanitizeWorld(result))
        .assertEqual(
          '\uff57\uff57\uff57\uff57\uff57\uff57\uff57\uff57\uff57\uff57\uff57\uff57\uff57\uff57\uff57\uff57...');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0054 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeUnicode0055
     * @tc.number SUB_RESMGR_UTILS28_0055
     * @tc.desc   1 combining pairs (2 units) follow the 16 unit cap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeUnicode0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0055 begin');
      const result: string = ResourceUtils.sanitizeWorld('e\u0301');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('e\u0301'));
      expect(result).assertEqual('e\u0301');
      const resultLength: number = result.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resultLength), String(2));
      expect(resultLength).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.sanitizeWorld(result)), String('e\u0301'));
      expect(ResourceUtils.sanitizeWorld(result)).assertEqual('e\u0301');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0055 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeUnicode0056
     * @tc.number SUB_RESMGR_UTILS28_0056
     * @tc.desc   4 combining pairs (8 units) follow the 16 unit cap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeUnicode0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0056 begin');
      const result: string = ResourceUtils.sanitizeWorld('e\u0301e\u0301e\u0301e\u0301');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('e\u0301e\u0301e\u0301e\u0301'));
      expect(result).assertEqual('e\u0301e\u0301e\u0301e\u0301');
      const resultLength: number = result.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resultLength), String(8));
      expect(resultLength).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.sanitizeWorld(result)), String('e\u0301e\u0301e\u0301e\u0301'));
      expect(ResourceUtils.sanitizeWorld(result)).assertEqual('e\u0301e\u0301e\u0301e\u0301');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0056 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeUnicode0057
     * @tc.number SUB_RESMGR_UTILS28_0057
     * @tc.desc   8 combining pairs (16 units) follow the 16 unit cap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeUnicode0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0057 begin');
      const result: string = ResourceUtils.sanitizeWorld('e\u0301e\u0301e\u0301e\u0301e\u0301e\u0301e\u0301e\u0301');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('e\u0301e\u0301e\u0301e\u0301e\u0301e\u0301e\u0301e\u0301'));
      expect(result).assertEqual('e\u0301e\u0301e\u0301e\u0301e\u0301e\u0301e\u0301e\u0301');
      const resultLength: number = result.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resultLength), String(16));
      expect(resultLength).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.sanitizeWorld(result)),
          String('e\u0301e\u0301e\u0301e\u0301e\u0301e\u0301e\u0301e\u0301'));
      expect(ResourceUtils.sanitizeWorld(result))
        .assertEqual('e\u0301e\u0301e\u0301e\u0301e\u0301e\u0301e\u0301e\u0301');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0057 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeUnicode0058
     * @tc.number SUB_RESMGR_UTILS28_0058
     * @tc.desc   9 combining pairs (18 units) follow the 16 unit cap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeUnicode0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0058 begin');
      const result: string = ResourceUtils.sanitizeWorld('e\u0301e\u0301e\u0301e\u0301e\u0301e' +
        '\u0301e\u0301e\u0301e\u0301');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('e\u0301e\u0301e\u0301e\u0301e\u0301e\u0301e\u0301e\u0301...'));
      expect(result).assertEqual('e\u0301e\u0301e\u0301e\u0301e\u0301e\u0301e\u0301e\u0301...');
      const resultLength: number = result.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resultLength), String(19));
      expect(resultLength).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.sanitizeWorld(result)),
          String('e\u0301e\u0301e\u0301e\u0301e\u0301e\u0301e\u0301e\u0301...'));
      expect(ResourceUtils.sanitizeWorld(result))
        .assertEqual('e\u0301e\u0301e\u0301e\u0301e\u0301e\u0301e\u0301e\u0301...');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0058 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeUnicode0059
     * @tc.number SUB_RESMGR_UTILS28_0059
     * @tc.desc   zero width spaces are kept and counted for 1 pairs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeUnicode0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0059 begin');
      const result: string = ResourceUtils.sanitizeWorld('\u200ba');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('\u200ba'));
      expect(result).assertEqual('\u200ba');
      const resultLength: number = result.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resultLength), String(2));
      expect(resultLength).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.sanitizeWorld(result)), String('\u200ba'));
      expect(ResourceUtils.sanitizeWorld(result)).assertEqual('\u200ba');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0059 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeUnicode0060
     * @tc.number SUB_RESMGR_UTILS28_0060
     * @tc.desc   zero width spaces are kept and counted for 5 pairs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeUnicode0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0060 begin');
      const result: string = ResourceUtils.sanitizeWorld('\u200ba\u200ba\u200ba\u200ba\u200ba');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('\u200ba\u200ba\u200ba\u200ba\u200ba'));
      expect(result).assertEqual('\u200ba\u200ba\u200ba\u200ba\u200ba');
      const resultLength: number = result.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resultLength), String(10));
      expect(resultLength).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.sanitizeWorld(result)), String('\u200ba\u200ba\u200ba\u200ba\u200ba'));
      expect(ResourceUtils.sanitizeWorld(result)).assertEqual('\u200ba\u200ba\u200ba\u200ba\u200ba');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0060 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeUnicode0061
     * @tc.number SUB_RESMGR_UTILS28_0061
     * @tc.desc   zero width spaces are kept and counted for 8 pairs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeUnicode0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0061 begin');
      const result: string = ResourceUtils.sanitizeWorld('\u200ba\u200ba\u200ba\u200ba\u200ba\u200ba\u200ba\u200ba');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('\u200ba\u200ba\u200ba\u200ba\u200ba\u200ba\u200ba\u200ba'));
      expect(result).assertEqual('\u200ba\u200ba\u200ba\u200ba\u200ba\u200ba\u200ba\u200ba');
      const resultLength: number = result.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resultLength), String(16));
      expect(resultLength).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.sanitizeWorld(result)),
          String('\u200ba\u200ba\u200ba\u200ba\u200ba\u200ba\u200ba\u200ba'));
      expect(ResourceUtils.sanitizeWorld(result))
        .assertEqual('\u200ba\u200ba\u200ba\u200ba\u200ba\u200ba\u200ba\u200ba');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0061 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeUnicode0062
     * @tc.number SUB_RESMGR_UTILS28_0062
     * @tc.desc   zero width spaces are kept and counted for 9 pairs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeUnicode0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0062 begin');
      const result: string = ResourceUtils.sanitizeWorld('\u200ba\u200ba\u200ba\u200ba\u200ba' +
        '\u200ba\u200ba\u200ba\u200ba');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('\u200ba\u200ba\u200ba\u200ba\u200ba\u200ba\u200ba\u200ba...'));
      expect(result).assertEqual('\u200ba\u200ba\u200ba\u200ba\u200ba\u200ba\u200ba\u200ba...');
      const resultLength: number = result.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resultLength), String(19));
      expect(resultLength).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.sanitizeWorld(result)),
          String('\u200ba\u200ba\u200ba\u200ba\u200ba\u200ba\u200ba\u200ba...'));
      expect(ResourceUtils.sanitizeWorld(result))
        .assertEqual('\u200ba\u200ba\u200ba\u200ba\u200ba\u200ba\u200ba\u200ba...');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0062 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeUnicode0063
     * @tc.number SUB_RESMGR_UTILS28_0063
     * @tc.desc   mixed ascii and emoji word of 4 units follows the cap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeUnicode0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0063 begin');
      const result: string = ResourceUtils.sanitizeWorld('a\ud83d\ude00b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('a\ud83d\ude00b'));
      expect(result).assertEqual('a\ud83d\ude00b');
      const resultLength: number = result.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resultLength), String(4));
      expect(resultLength).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.sanitizeWorld(result)), String('a\ud83d\ude00b'));
      expect(ResourceUtils.sanitizeWorld(result)).assertEqual('a\ud83d\ude00b');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0063 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeUnicode0064
     * @tc.number SUB_RESMGR_UTILS28_0064
     * @tc.desc   mixed ascii and emoji word of 6 units follows the cap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeUnicode0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0064 begin');
      const result: string = ResourceUtils.sanitizeWorld('ab\ud83d\ude00cd');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ab\ud83d\ude00cd'));
      expect(result).assertEqual('ab\ud83d\ude00cd');
      const resultLength: number = result.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resultLength), String(6));
      expect(resultLength).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.sanitizeWorld(result)), String('ab\ud83d\ude00cd'));
      expect(ResourceUtils.sanitizeWorld(result)).assertEqual('ab\ud83d\ude00cd');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0064 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeUnicode0065
     * @tc.number SUB_RESMGR_UTILS28_0065
     * @tc.desc   mixed ascii and emoji word of 17 units follows the cap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeUnicode0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0065 begin');
      const result: string = ResourceUtils.sanitizeWorld('\ud83d\ude00abcdefghijklmno');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('\ud83d\ude00abcdefghijklmn...'));
      expect(result).assertEqual('\ud83d\ude00abcdefghijklmn...');
      const resultLength: number = result.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resultLength), String(19));
      expect(resultLength).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.sanitizeWorld(result)), String('\ud83d\ude00abcdefghijklmn...'));
      expect(ResourceUtils.sanitizeWorld(result)).assertEqual('\ud83d\ude00abcdefghijklmn...');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0065 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeUnicode0066
     * @tc.number SUB_RESMGR_UTILS28_0066
     * @tc.desc   mixed ascii and emoji word of 17 units follows the cap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeUnicode0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0066 begin');
      const result: string = ResourceUtils.sanitizeWorld('abcdefghijklmno\ud83d\ude00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('abcdefghijklmno\ud83d...'));
      expect(result).assertEqual('abcdefghijklmno\ud83d...');
      const resultLength: number = result.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resultLength), String(19));
      expect(resultLength).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.sanitizeWorld(result)), String('abcdefghijklmno\ud83d...'));
      expect(ResourceUtils.sanitizeWorld(result)).assertEqual('abcdefghijklmno\ud83d...');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0066 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeUnicode0067
     * @tc.number SUB_RESMGR_UTILS28_0067
     * @tc.desc   repeated sanitize is stable for length 17
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeUnicode0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0067 begin');
      const result: string = ResourceUtils.sanitizeWorld('b'.repeat(17));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('bbbbbbbbbbbbbbbb...'));
      expect(result).assertEqual('bbbbbbbbbbbbbbbb...');
      const resultLength: number = result.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resultLength), String(19));
      expect(resultLength).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.sanitizeWorld(result)), String('bbbbbbbbbbbbbbbb...'));
      expect(ResourceUtils.sanitizeWorld(result)).assertEqual('bbbbbbbbbbbbbbbb...');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0067 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeUnicode0068
     * @tc.number SUB_RESMGR_UTILS28_0068
     * @tc.desc   repeated sanitize is stable for length 20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeUnicode0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0068 begin');
      const result: string = ResourceUtils.sanitizeWorld('b'.repeat(20));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('bbbbbbbbbbbbbbbb...'));
      expect(result).assertEqual('bbbbbbbbbbbbbbbb...');
      const resultLength: number = result.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resultLength), String(19));
      expect(resultLength).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.sanitizeWorld(result)), String('bbbbbbbbbbbbbbbb...'));
      expect(ResourceUtils.sanitizeWorld(result)).assertEqual('bbbbbbbbbbbbbbbb...');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0068 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeUnicode0069
     * @tc.number SUB_RESMGR_UTILS28_0069
     * @tc.desc   repeated sanitize is stable for length 33
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeUnicode0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0069 begin');
      const result: string = ResourceUtils.sanitizeWorld('b'.repeat(33));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('bbbbbbbbbbbbbbbb...'));
      expect(result).assertEqual('bbbbbbbbbbbbbbbb...');
      const resultLength: number = result.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resultLength), String(19));
      expect(resultLength).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.sanitizeWorld(result)), String('bbbbbbbbbbbbbbbb...'));
      expect(ResourceUtils.sanitizeWorld(result)).assertEqual('bbbbbbbbbbbbbbbb...');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0069 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeUnicode0070
     * @tc.number SUB_RESMGR_UTILS28_0070
     * @tc.desc   repeated sanitize is stable for length 64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeUnicode0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0070 begin');
      const result: string = ResourceUtils.sanitizeWorld('b'.repeat(64));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('bbbbbbbbbbbbbbbb...'));
      expect(result).assertEqual('bbbbbbbbbbbbbbbb...');
      const resultLength: number = result.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resultLength), String(19));
      expect(resultLength).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.sanitizeWorld(result)), String('bbbbbbbbbbbbbbbb...'));
      expect(ResourceUtils.sanitizeWorld(result)).assertEqual('bbbbbbbbbbbbbbbb...');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0070 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeUnicode0071
     * @tc.number SUB_RESMGR_UTILS28_0071
     * @tc.desc   boundary sweep at length 15
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeUnicode0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0071 begin');
      const result: string = ResourceUtils.sanitizeWorld('c'.repeat(15));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ccccccccccccccc'));
      expect(result).assertEqual('ccccccccccccccc');
      const resultLength: number = result.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resultLength), String(15));
      expect(resultLength).assertEqual(15);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.sanitizeWorld(result)), String('ccccccccccccccc'));
      expect(ResourceUtils.sanitizeWorld(result)).assertEqual('ccccccccccccccc');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0071 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeUnicode0072
     * @tc.number SUB_RESMGR_UTILS28_0072
     * @tc.desc   boundary sweep at length 16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeUnicode0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0072 begin');
      const result: string = ResourceUtils.sanitizeWorld('c'.repeat(16));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('cccccccccccccccc'));
      expect(result).assertEqual('cccccccccccccccc');
      const resultLength: number = result.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resultLength), String(16));
      expect(resultLength).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.sanitizeWorld(result)), String('cccccccccccccccc'));
      expect(ResourceUtils.sanitizeWorld(result)).assertEqual('cccccccccccccccc');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0072 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeUnicode0073
     * @tc.number SUB_RESMGR_UTILS28_0073
     * @tc.desc   boundary sweep at length 17
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeUnicode0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0073 begin');
      const result: string = ResourceUtils.sanitizeWorld('c'.repeat(17));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('cccccccccccccccc...'));
      expect(result).assertEqual('cccccccccccccccc...');
      const resultLength: number = result.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resultLength), String(19));
      expect(resultLength).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.sanitizeWorld(result)), String('cccccccccccccccc...'));
      expect(ResourceUtils.sanitizeWorld(result)).assertEqual('cccccccccccccccc...');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0073 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeUnicode0074
     * @tc.number SUB_RESMGR_UTILS28_0074
     * @tc.desc   boundary sweep at length 18
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeUnicode0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0074 begin');
      const result: string = ResourceUtils.sanitizeWorld('c'.repeat(18));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('cccccccccccccccc...'));
      expect(result).assertEqual('cccccccccccccccc...');
      const resultLength: number = result.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resultLength), String(19));
      expect(resultLength).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.sanitizeWorld(result)), String('cccccccccccccccc...'));
      expect(ResourceUtils.sanitizeWorld(result)).assertEqual('cccccccccccccccc...');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0074 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeUnicode0075
     * @tc.number SUB_RESMGR_UTILS28_0075
     * @tc.desc   boundary sweep at length 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeUnicode0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0075 begin');
      const result: string = ResourceUtils.sanitizeWorld('c'.repeat(19));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('cccccccccccccccc...'));
      expect(result).assertEqual('cccccccccccccccc...');
      const resultLength: number = result.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resultLength), String(19));
      expect(resultLength).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.sanitizeWorld(result)), String('cccccccccccccccc...'));
      expect(ResourceUtils.sanitizeWorld(result)).assertEqual('cccccccccccccccc...');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0075 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeUnicode0076
     * @tc.number SUB_RESMGR_UTILS28_0076
     * @tc.desc   boundary sweep at length 21
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeUnicode0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0076 begin');
      const result: string = ResourceUtils.sanitizeWorld('c'.repeat(21));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('cccccccccccccccc...'));
      expect(result).assertEqual('cccccccccccccccc...');
      const resultLength: number = result.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resultLength), String(19));
      expect(resultLength).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.sanitizeWorld(result)), String('cccccccccccccccc...'));
      expect(ResourceUtils.sanitizeWorld(result)).assertEqual('cccccccccccccccc...');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0076 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeUnicode0077
     * @tc.number SUB_RESMGR_UTILS28_0077
     * @tc.desc   boundary sweep at length 23
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeUnicode0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0077 begin');
      const result: string = ResourceUtils.sanitizeWorld('c'.repeat(23));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('cccccccccccccccc...'));
      expect(result).assertEqual('cccccccccccccccc...');
      const resultLength: number = result.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resultLength), String(19));
      expect(resultLength).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.sanitizeWorld(result)), String('cccccccccccccccc...'));
      expect(ResourceUtils.sanitizeWorld(result)).assertEqual('cccccccccccccccc...');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0077 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeUnicode0078
     * @tc.number SUB_RESMGR_UTILS28_0078
     * @tc.desc   boundary sweep at length 25
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeUnicode0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0078 begin');
      const result: string = ResourceUtils.sanitizeWorld('c'.repeat(25));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('cccccccccccccccc...'));
      expect(result).assertEqual('cccccccccccccccc...');
      const resultLength: number = result.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resultLength), String(19));
      expect(resultLength).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.sanitizeWorld(result)), String('cccccccccccccccc...'));
      expect(ResourceUtils.sanitizeWorld(result)).assertEqual('cccccccccccccccc...');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0078 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeUnicode0079
     * @tc.number SUB_RESMGR_UTILS28_0079
     * @tc.desc   boundary sweep at length 31
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeUnicode0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0079 begin');
      const result: string = ResourceUtils.sanitizeWorld('c'.repeat(31));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('cccccccccccccccc...'));
      expect(result).assertEqual('cccccccccccccccc...');
      const resultLength: number = result.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resultLength), String(19));
      expect(resultLength).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.sanitizeWorld(result)), String('cccccccccccccccc...'));
      expect(ResourceUtils.sanitizeWorld(result)).assertEqual('cccccccccccccccc...');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0079 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeUnicode0080
     * @tc.number SUB_RESMGR_UTILS28_0080
     * @tc.desc   boundary sweep at length 39
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeUnicode0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0080 begin');
      const result: string = ResourceUtils.sanitizeWorld('c'.repeat(39));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('cccccccccccccccc...'));
      expect(result).assertEqual('cccccccccccccccc...');
      const resultLength: number = result.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resultLength), String(19));
      expect(resultLength).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.sanitizeWorld(result)), String('cccccccccccccccc...'));
      expect(ResourceUtils.sanitizeWorld(result)).assertEqual('cccccccccccccccc...');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0080 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeUnicode0081
     * @tc.number SUB_RESMGR_UTILS28_0081
     * @tc.desc   截断正好落在代理对边界上，零宽空格不被 trim
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeUnicode0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0081 begin');
      const eightEmoji: string = '\uD83D\uDE00'.repeat(8);
      const nineEmoji: string = '\uD83D\uDE00'.repeat(9);
      const kept: string = ResourceUtils.sanitizeWorld(eightEmoji);
      const cut: string = ResourceUtils.sanitizeWorld(nineEmoji);
      const zeroWidth: string = ResourceUtils.sanitizeWorld('\u200B');
      const keptLength: number = kept.length;
      const cutLength: number = cut.length;
      const zeroWidthLength: number = zeroWidth.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(keptLength), String(16));
      expect(kept).assertEqual(eightEmoji);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(cutLength), String(19));
      expect(cutLength).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(cut.substring(0, 16)),
        String(eightEmoji));
      expect(cut.substring(0, 16)).assertEqual(eightEmoji);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(cut.endsWith('...')));
      expect(cut.endsWith('...')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(zeroWidthLength), String(1));
      expect(zeroWidthLength).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeUnicode0081 end');
    })

  })
}
