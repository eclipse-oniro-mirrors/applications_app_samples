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

export default function resourceUtilsB64B12Test() {
  describe('ResourceUtilsB64B12Test', () => {

    /**
     * @tc.name   testResourceUtilsB64B120001
     * @tc.number SUB_RESMGR_UTILS_12_0001
     * @tc.desc   expectedBase64Length(2000) is 2668
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120001 begin');
      const result: number = ResourceUtils.expectedBase64Length(2000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2668));
      expect(result).assertEqual(2668);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2668 - 1) + '='.repeat(1))), String(2000));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2668 - 1) + '='.repeat(1))).assertEqual(2000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120001 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120002
     * @tc.number SUB_RESMGR_UTILS_12_0002
     * @tc.desc   expectedBase64Length(2001) is 2668
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120002 begin');
      const result: number = ResourceUtils.expectedBase64Length(2001);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2668));
      expect(result).assertEqual(2668);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2668 - 0) + '='.repeat(0))), String(2001));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2668 - 0) + '='.repeat(0))).assertEqual(2001);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120002 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120003
     * @tc.number SUB_RESMGR_UTILS_12_0003
     * @tc.desc   expectedBase64Length(2002) is 2672
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120003 begin');
      const result: number = ResourceUtils.expectedBase64Length(2002);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2672));
      expect(result).assertEqual(2672);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2672 - 2) + '='.repeat(2))), String(2002));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2672 - 2) + '='.repeat(2))).assertEqual(2002);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120003 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120004
     * @tc.number SUB_RESMGR_UTILS_12_0004
     * @tc.desc   expectedBase64Length(2003) is 2672
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120004 begin');
      const result: number = ResourceUtils.expectedBase64Length(2003);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2672));
      expect(result).assertEqual(2672);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2672 - 1) + '='.repeat(1))), String(2003));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2672 - 1) + '='.repeat(1))).assertEqual(2003);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120004 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120005
     * @tc.number SUB_RESMGR_UTILS_12_0005
     * @tc.desc   expectedBase64Length(2004) is 2672
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120005 begin');
      const result: number = ResourceUtils.expectedBase64Length(2004);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2672));
      expect(result).assertEqual(2672);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2672 - 0) + '='.repeat(0))), String(2004));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2672 - 0) + '='.repeat(0))).assertEqual(2004);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120005 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120006
     * @tc.number SUB_RESMGR_UTILS_12_0006
     * @tc.desc   expectedBase64Length(2005) is 2676
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120006 begin');
      const result: number = ResourceUtils.expectedBase64Length(2005);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2676));
      expect(result).assertEqual(2676);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2676 - 2) + '='.repeat(2))), String(2005));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2676 - 2) + '='.repeat(2))).assertEqual(2005);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120006 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120007
     * @tc.number SUB_RESMGR_UTILS_12_0007
     * @tc.desc   expectedBase64Length(2006) is 2676
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120007 begin');
      const result: number = ResourceUtils.expectedBase64Length(2006);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2676));
      expect(result).assertEqual(2676);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2676 - 1) + '='.repeat(1))), String(2006));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2676 - 1) + '='.repeat(1))).assertEqual(2006);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120007 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120008
     * @tc.number SUB_RESMGR_UTILS_12_0008
     * @tc.desc   expectedBase64Length(2007) is 2676
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120008 begin');
      const result: number = ResourceUtils.expectedBase64Length(2007);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2676));
      expect(result).assertEqual(2676);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2676 - 0) + '='.repeat(0))), String(2007));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2676 - 0) + '='.repeat(0))).assertEqual(2007);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120008 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120009
     * @tc.number SUB_RESMGR_UTILS_12_0009
     * @tc.desc   expectedBase64Length(2008) is 2680
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120009 begin');
      const result: number = ResourceUtils.expectedBase64Length(2008);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2680));
      expect(result).assertEqual(2680);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2680 - 2) + '='.repeat(2))), String(2008));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2680 - 2) + '='.repeat(2))).assertEqual(2008);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120009 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120010
     * @tc.number SUB_RESMGR_UTILS_12_0010
     * @tc.desc   expectedBase64Length(2009) is 2680
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120010 begin');
      const result: number = ResourceUtils.expectedBase64Length(2009);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2680));
      expect(result).assertEqual(2680);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2680 - 1) + '='.repeat(1))), String(2009));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2680 - 1) + '='.repeat(1))).assertEqual(2009);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120010 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120011
     * @tc.number SUB_RESMGR_UTILS_12_0011
     * @tc.desc   expectedBase64Length(2010) is 2680
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120011 begin');
      const result: number = ResourceUtils.expectedBase64Length(2010);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2680));
      expect(result).assertEqual(2680);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2680 - 0) + '='.repeat(0))), String(2010));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2680 - 0) + '='.repeat(0))).assertEqual(2010);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120011 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120012
     * @tc.number SUB_RESMGR_UTILS_12_0012
     * @tc.desc   expectedBase64Length(2011) is 2684
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120012 begin');
      const result: number = ResourceUtils.expectedBase64Length(2011);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2684));
      expect(result).assertEqual(2684);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2684 - 2) + '='.repeat(2))), String(2011));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2684 - 2) + '='.repeat(2))).assertEqual(2011);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120012 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120013
     * @tc.number SUB_RESMGR_UTILS_12_0013
     * @tc.desc   expectedBase64Length(2012) is 2684
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120013 begin');
      const result: number = ResourceUtils.expectedBase64Length(2012);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2684));
      expect(result).assertEqual(2684);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2684 - 1) + '='.repeat(1))), String(2012));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2684 - 1) + '='.repeat(1))).assertEqual(2012);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120013 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120014
     * @tc.number SUB_RESMGR_UTILS_12_0014
     * @tc.desc   expectedBase64Length(2013) is 2684
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120014 begin');
      const result: number = ResourceUtils.expectedBase64Length(2013);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2684));
      expect(result).assertEqual(2684);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2684 - 0) + '='.repeat(0))), String(2013));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2684 - 0) + '='.repeat(0))).assertEqual(2013);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120014 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120015
     * @tc.number SUB_RESMGR_UTILS_12_0015
     * @tc.desc   expectedBase64Length(2014) is 2688
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120015 begin');
      const result: number = ResourceUtils.expectedBase64Length(2014);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2688));
      expect(result).assertEqual(2688);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2688 - 2) + '='.repeat(2))), String(2014));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2688 - 2) + '='.repeat(2))).assertEqual(2014);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120015 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120016
     * @tc.number SUB_RESMGR_UTILS_12_0016
     * @tc.desc   expectedBase64Length(2015) is 2688
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120016 begin');
      const result: number = ResourceUtils.expectedBase64Length(2015);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2688));
      expect(result).assertEqual(2688);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2688 - 1) + '='.repeat(1))), String(2015));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2688 - 1) + '='.repeat(1))).assertEqual(2015);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120016 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120017
     * @tc.number SUB_RESMGR_UTILS_12_0017
     * @tc.desc   expectedBase64Length(2016) is 2688
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120017 begin');
      const result: number = ResourceUtils.expectedBase64Length(2016);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2688));
      expect(result).assertEqual(2688);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2688 - 0) + '='.repeat(0))), String(2016));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2688 - 0) + '='.repeat(0))).assertEqual(2016);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120017 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120018
     * @tc.number SUB_RESMGR_UTILS_12_0018
     * @tc.desc   expectedBase64Length(2017) is 2692
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120018 begin');
      const result: number = ResourceUtils.expectedBase64Length(2017);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2692));
      expect(result).assertEqual(2692);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2692 - 2) + '='.repeat(2))), String(2017));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2692 - 2) + '='.repeat(2))).assertEqual(2017);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120018 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120019
     * @tc.number SUB_RESMGR_UTILS_12_0019
     * @tc.desc   expectedBase64Length(2018) is 2692
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120019 begin');
      const result: number = ResourceUtils.expectedBase64Length(2018);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2692));
      expect(result).assertEqual(2692);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2692 - 1) + '='.repeat(1))), String(2018));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2692 - 1) + '='.repeat(1))).assertEqual(2018);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120019 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120020
     * @tc.number SUB_RESMGR_UTILS_12_0020
     * @tc.desc   expectedBase64Length(2019) is 2692
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120020 begin');
      const result: number = ResourceUtils.expectedBase64Length(2019);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2692));
      expect(result).assertEqual(2692);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2692 - 0) + '='.repeat(0))), String(2019));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2692 - 0) + '='.repeat(0))).assertEqual(2019);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120020 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120021
     * @tc.number SUB_RESMGR_UTILS_12_0021
     * @tc.desc   expectedBase64Length(2020) is 2696
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120021 begin');
      const result: number = ResourceUtils.expectedBase64Length(2020);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2696));
      expect(result).assertEqual(2696);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2696 - 2) + '='.repeat(2))), String(2020));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2696 - 2) + '='.repeat(2))).assertEqual(2020);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120021 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120022
     * @tc.number SUB_RESMGR_UTILS_12_0022
     * @tc.desc   expectedBase64Length(2021) is 2696
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120022 begin');
      const result: number = ResourceUtils.expectedBase64Length(2021);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2696));
      expect(result).assertEqual(2696);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2696 - 1) + '='.repeat(1))), String(2021));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2696 - 1) + '='.repeat(1))).assertEqual(2021);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120022 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120023
     * @tc.number SUB_RESMGR_UTILS_12_0023
     * @tc.desc   expectedBase64Length(2022) is 2696
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120023 begin');
      const result: number = ResourceUtils.expectedBase64Length(2022);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2696));
      expect(result).assertEqual(2696);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2696 - 0) + '='.repeat(0))), String(2022));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2696 - 0) + '='.repeat(0))).assertEqual(2022);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120023 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120024
     * @tc.number SUB_RESMGR_UTILS_12_0024
     * @tc.desc   expectedBase64Length(2023) is 2700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120024 begin');
      const result: number = ResourceUtils.expectedBase64Length(2023);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2700));
      expect(result).assertEqual(2700);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2700 - 2) + '='.repeat(2))), String(2023));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2700 - 2) + '='.repeat(2))).assertEqual(2023);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120024 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120025
     * @tc.number SUB_RESMGR_UTILS_12_0025
     * @tc.desc   expectedBase64Length(2024) is 2700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120025 begin');
      const result: number = ResourceUtils.expectedBase64Length(2024);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2700));
      expect(result).assertEqual(2700);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2700 - 1) + '='.repeat(1))), String(2024));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2700 - 1) + '='.repeat(1))).assertEqual(2024);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120025 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120026
     * @tc.number SUB_RESMGR_UTILS_12_0026
     * @tc.desc   expectedBase64Length(2025) is 2700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120026 begin');
      const result: number = ResourceUtils.expectedBase64Length(2025);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2700));
      expect(result).assertEqual(2700);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2700 - 0) + '='.repeat(0))), String(2025));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2700 - 0) + '='.repeat(0))).assertEqual(2025);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120026 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120027
     * @tc.number SUB_RESMGR_UTILS_12_0027
     * @tc.desc   expectedBase64Length(2026) is 2704
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120027 begin');
      const result: number = ResourceUtils.expectedBase64Length(2026);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2704));
      expect(result).assertEqual(2704);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2704 - 2) + '='.repeat(2))), String(2026));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2704 - 2) + '='.repeat(2))).assertEqual(2026);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120027 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120028
     * @tc.number SUB_RESMGR_UTILS_12_0028
     * @tc.desc   expectedBase64Length(2027) is 2704
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120028 begin');
      const result: number = ResourceUtils.expectedBase64Length(2027);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2704));
      expect(result).assertEqual(2704);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2704 - 1) + '='.repeat(1))), String(2027));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2704 - 1) + '='.repeat(1))).assertEqual(2027);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120028 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120029
     * @tc.number SUB_RESMGR_UTILS_12_0029
     * @tc.desc   expectedBase64Length(2028) is 2704
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120029 begin');
      const result: number = ResourceUtils.expectedBase64Length(2028);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2704));
      expect(result).assertEqual(2704);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2704 - 0) + '='.repeat(0))), String(2028));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2704 - 0) + '='.repeat(0))).assertEqual(2028);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120029 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120030
     * @tc.number SUB_RESMGR_UTILS_12_0030
     * @tc.desc   expectedBase64Length(2029) is 2708
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120030 begin');
      const result: number = ResourceUtils.expectedBase64Length(2029);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2708));
      expect(result).assertEqual(2708);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2708 - 2) + '='.repeat(2))), String(2029));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2708 - 2) + '='.repeat(2))).assertEqual(2029);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120030 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120031
     * @tc.number SUB_RESMGR_UTILS_12_0031
     * @tc.desc   expectedBase64Length(2030) is 2708
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120031 begin');
      const result: number = ResourceUtils.expectedBase64Length(2030);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2708));
      expect(result).assertEqual(2708);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2708 - 1) + '='.repeat(1))), String(2030));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2708 - 1) + '='.repeat(1))).assertEqual(2030);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120031 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120032
     * @tc.number SUB_RESMGR_UTILS_12_0032
     * @tc.desc   expectedBase64Length(2031) is 2708
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120032 begin');
      const result: number = ResourceUtils.expectedBase64Length(2031);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2708));
      expect(result).assertEqual(2708);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2708 - 0) + '='.repeat(0))), String(2031));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2708 - 0) + '='.repeat(0))).assertEqual(2031);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120032 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120033
     * @tc.number SUB_RESMGR_UTILS_12_0033
     * @tc.desc   expectedBase64Length(2032) is 2712
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120033 begin');
      const result: number = ResourceUtils.expectedBase64Length(2032);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2712));
      expect(result).assertEqual(2712);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2712 - 2) + '='.repeat(2))), String(2032));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2712 - 2) + '='.repeat(2))).assertEqual(2032);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120033 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120034
     * @tc.number SUB_RESMGR_UTILS_12_0034
     * @tc.desc   expectedBase64Length(2033) is 2712
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120034 begin');
      const result: number = ResourceUtils.expectedBase64Length(2033);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2712));
      expect(result).assertEqual(2712);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2712 - 1) + '='.repeat(1))), String(2033));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2712 - 1) + '='.repeat(1))).assertEqual(2033);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120034 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120035
     * @tc.number SUB_RESMGR_UTILS_12_0035
     * @tc.desc   expectedBase64Length(2034) is 2712
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120035 begin');
      const result: number = ResourceUtils.expectedBase64Length(2034);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2712));
      expect(result).assertEqual(2712);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2712 - 0) + '='.repeat(0))), String(2034));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2712 - 0) + '='.repeat(0))).assertEqual(2034);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120035 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120036
     * @tc.number SUB_RESMGR_UTILS_12_0036
     * @tc.desc   expectedBase64Length(2035) is 2716
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120036 begin');
      const result: number = ResourceUtils.expectedBase64Length(2035);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2716));
      expect(result).assertEqual(2716);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2716 - 2) + '='.repeat(2))), String(2035));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2716 - 2) + '='.repeat(2))).assertEqual(2035);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120036 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120037
     * @tc.number SUB_RESMGR_UTILS_12_0037
     * @tc.desc   expectedBase64Length(2036) is 2716
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120037 begin');
      const result: number = ResourceUtils.expectedBase64Length(2036);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2716));
      expect(result).assertEqual(2716);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2716 - 1) + '='.repeat(1))), String(2036));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2716 - 1) + '='.repeat(1))).assertEqual(2036);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120037 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120038
     * @tc.number SUB_RESMGR_UTILS_12_0038
     * @tc.desc   expectedBase64Length(2037) is 2716
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120038 begin');
      const result: number = ResourceUtils.expectedBase64Length(2037);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2716));
      expect(result).assertEqual(2716);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2716 - 0) + '='.repeat(0))), String(2037));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2716 - 0) + '='.repeat(0))).assertEqual(2037);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120038 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120039
     * @tc.number SUB_RESMGR_UTILS_12_0039
     * @tc.desc   expectedBase64Length(2038) is 2720
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120039 begin');
      const result: number = ResourceUtils.expectedBase64Length(2038);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2720));
      expect(result).assertEqual(2720);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2720 - 2) + '='.repeat(2))), String(2038));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2720 - 2) + '='.repeat(2))).assertEqual(2038);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120039 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120040
     * @tc.number SUB_RESMGR_UTILS_12_0040
     * @tc.desc   expectedBase64Length(2039) is 2720
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120040 begin');
      const result: number = ResourceUtils.expectedBase64Length(2039);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2720));
      expect(result).assertEqual(2720);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2720 - 1) + '='.repeat(1))), String(2039));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2720 - 1) + '='.repeat(1))).assertEqual(2039);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120040 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120041
     * @tc.number SUB_RESMGR_UTILS_12_0041
     * @tc.desc   expectedBase64Length(2040) is 2720
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120041 begin');
      const result: number = ResourceUtils.expectedBase64Length(2040);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2720));
      expect(result).assertEqual(2720);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2720 - 0) + '='.repeat(0))), String(2040));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2720 - 0) + '='.repeat(0))).assertEqual(2040);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120041 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120042
     * @tc.number SUB_RESMGR_UTILS_12_0042
     * @tc.desc   expectedBase64Length(2041) is 2724
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120042 begin');
      const result: number = ResourceUtils.expectedBase64Length(2041);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2724));
      expect(result).assertEqual(2724);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2724 - 2) + '='.repeat(2))), String(2041));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2724 - 2) + '='.repeat(2))).assertEqual(2041);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120042 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120043
     * @tc.number SUB_RESMGR_UTILS_12_0043
     * @tc.desc   expectedBase64Length(2042) is 2724
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120043 begin');
      const result: number = ResourceUtils.expectedBase64Length(2042);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2724));
      expect(result).assertEqual(2724);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2724 - 1) + '='.repeat(1))), String(2042));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2724 - 1) + '='.repeat(1))).assertEqual(2042);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120043 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120044
     * @tc.number SUB_RESMGR_UTILS_12_0044
     * @tc.desc   expectedBase64Length(2043) is 2724
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120044 begin');
      const result: number = ResourceUtils.expectedBase64Length(2043);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2724));
      expect(result).assertEqual(2724);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2724 - 0) + '='.repeat(0))), String(2043));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2724 - 0) + '='.repeat(0))).assertEqual(2043);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120044 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120045
     * @tc.number SUB_RESMGR_UTILS_12_0045
     * @tc.desc   expectedBase64Length(2044) is 2728
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120045 begin');
      const result: number = ResourceUtils.expectedBase64Length(2044);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2728));
      expect(result).assertEqual(2728);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2728 - 2) + '='.repeat(2))), String(2044));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2728 - 2) + '='.repeat(2))).assertEqual(2044);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120045 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120046
     * @tc.number SUB_RESMGR_UTILS_12_0046
     * @tc.desc   expectedBase64Length(2045) is 2728
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120046 begin');
      const result: number = ResourceUtils.expectedBase64Length(2045);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2728));
      expect(result).assertEqual(2728);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2728 - 1) + '='.repeat(1))), String(2045));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2728 - 1) + '='.repeat(1))).assertEqual(2045);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120046 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120047
     * @tc.number SUB_RESMGR_UTILS_12_0047
     * @tc.desc   expectedBase64Length(2046) is 2728
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120047 begin');
      const result: number = ResourceUtils.expectedBase64Length(2046);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2728));
      expect(result).assertEqual(2728);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2728 - 0) + '='.repeat(0))), String(2046));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2728 - 0) + '='.repeat(0))).assertEqual(2046);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120047 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120048
     * @tc.number SUB_RESMGR_UTILS_12_0048
     * @tc.desc   expectedBase64Length(2047) is 2732
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120048 begin');
      const result: number = ResourceUtils.expectedBase64Length(2047);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2732));
      expect(result).assertEqual(2732);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2732 - 2) + '='.repeat(2))), String(2047));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2732 - 2) + '='.repeat(2))).assertEqual(2047);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120048 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120049
     * @tc.number SUB_RESMGR_UTILS_12_0049
     * @tc.desc   expectedBase64Length(2048) is 2732
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120049 begin');
      const result: number = ResourceUtils.expectedBase64Length(2048);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2732));
      expect(result).assertEqual(2732);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2732 - 1) + '='.repeat(1))), String(2048));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2732 - 1) + '='.repeat(1))).assertEqual(2048);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120049 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120050
     * @tc.number SUB_RESMGR_UTILS_12_0050
     * @tc.desc   expectedBase64Length(2049) is 2732
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120050 begin');
      const result: number = ResourceUtils.expectedBase64Length(2049);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2732));
      expect(result).assertEqual(2732);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2732 - 0) + '='.repeat(0))), String(2049));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2732 - 0) + '='.repeat(0))).assertEqual(2049);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120050 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120051
     * @tc.number SUB_RESMGR_UTILS_12_0051
     * @tc.desc   expectedBase64Length(2050) is 2736
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120051 begin');
      const result: number = ResourceUtils.expectedBase64Length(2050);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2736));
      expect(result).assertEqual(2736);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2736 - 2) + '='.repeat(2))), String(2050));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2736 - 2) + '='.repeat(2))).assertEqual(2050);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120051 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120052
     * @tc.number SUB_RESMGR_UTILS_12_0052
     * @tc.desc   expectedBase64Length(2051) is 2736
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120052 begin');
      const result: number = ResourceUtils.expectedBase64Length(2051);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2736));
      expect(result).assertEqual(2736);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2736 - 1) + '='.repeat(1))), String(2051));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2736 - 1) + '='.repeat(1))).assertEqual(2051);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120052 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120053
     * @tc.number SUB_RESMGR_UTILS_12_0053
     * @tc.desc   expectedBase64Length(2052) is 2736
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120053 begin');
      const result: number = ResourceUtils.expectedBase64Length(2052);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2736));
      expect(result).assertEqual(2736);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2736 - 0) + '='.repeat(0))), String(2052));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2736 - 0) + '='.repeat(0))).assertEqual(2052);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120053 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120054
     * @tc.number SUB_RESMGR_UTILS_12_0054
     * @tc.desc   expectedBase64Length(2053) is 2740
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120054 begin');
      const result: number = ResourceUtils.expectedBase64Length(2053);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2740));
      expect(result).assertEqual(2740);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2740 - 2) + '='.repeat(2))), String(2053));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2740 - 2) + '='.repeat(2))).assertEqual(2053);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120054 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120055
     * @tc.number SUB_RESMGR_UTILS_12_0055
     * @tc.desc   expectedBase64Length(2054) is 2740
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120055 begin');
      const result: number = ResourceUtils.expectedBase64Length(2054);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2740));
      expect(result).assertEqual(2740);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2740 - 1) + '='.repeat(1))), String(2054));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2740 - 1) + '='.repeat(1))).assertEqual(2054);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120055 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120056
     * @tc.number SUB_RESMGR_UTILS_12_0056
     * @tc.desc   expectedBase64Length(2055) is 2740
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120056 begin');
      const result: number = ResourceUtils.expectedBase64Length(2055);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2740));
      expect(result).assertEqual(2740);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2740 - 0) + '='.repeat(0))), String(2055));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2740 - 0) + '='.repeat(0))).assertEqual(2055);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120056 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120057
     * @tc.number SUB_RESMGR_UTILS_12_0057
     * @tc.desc   expectedBase64Length(2056) is 2744
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120057 begin');
      const result: number = ResourceUtils.expectedBase64Length(2056);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2744));
      expect(result).assertEqual(2744);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2744 - 2) + '='.repeat(2))), String(2056));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2744 - 2) + '='.repeat(2))).assertEqual(2056);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120057 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120058
     * @tc.number SUB_RESMGR_UTILS_12_0058
     * @tc.desc   expectedBase64Length(2057) is 2744
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120058 begin');
      const result: number = ResourceUtils.expectedBase64Length(2057);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2744));
      expect(result).assertEqual(2744);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2744 - 1) + '='.repeat(1))), String(2057));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2744 - 1) + '='.repeat(1))).assertEqual(2057);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120058 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120059
     * @tc.number SUB_RESMGR_UTILS_12_0059
     * @tc.desc   expectedBase64Length(2058) is 2744
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120059 begin');
      const result: number = ResourceUtils.expectedBase64Length(2058);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2744));
      expect(result).assertEqual(2744);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2744 - 0) + '='.repeat(0))), String(2058));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2744 - 0) + '='.repeat(0))).assertEqual(2058);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120059 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120060
     * @tc.number SUB_RESMGR_UTILS_12_0060
     * @tc.desc   expectedBase64Length(2059) is 2748
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120060 begin');
      const result: number = ResourceUtils.expectedBase64Length(2059);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2748));
      expect(result).assertEqual(2748);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2748 - 2) + '='.repeat(2))), String(2059));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2748 - 2) + '='.repeat(2))).assertEqual(2059);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120060 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120061
     * @tc.number SUB_RESMGR_UTILS_12_0061
     * @tc.desc   expectedBase64Length(2060) is 2748
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120061 begin');
      const result: number = ResourceUtils.expectedBase64Length(2060);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2748));
      expect(result).assertEqual(2748);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2748 - 1) + '='.repeat(1))), String(2060));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2748 - 1) + '='.repeat(1))).assertEqual(2060);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120061 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120062
     * @tc.number SUB_RESMGR_UTILS_12_0062
     * @tc.desc   expectedBase64Length(2061) is 2748
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120062 begin');
      const result: number = ResourceUtils.expectedBase64Length(2061);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2748));
      expect(result).assertEqual(2748);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2748 - 0) + '='.repeat(0))), String(2061));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2748 - 0) + '='.repeat(0))).assertEqual(2061);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120062 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120063
     * @tc.number SUB_RESMGR_UTILS_12_0063
     * @tc.desc   expectedBase64Length(2062) is 2752
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120063 begin');
      const result: number = ResourceUtils.expectedBase64Length(2062);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2752));
      expect(result).assertEqual(2752);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2752 - 2) + '='.repeat(2))), String(2062));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2752 - 2) + '='.repeat(2))).assertEqual(2062);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120063 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120064
     * @tc.number SUB_RESMGR_UTILS_12_0064
     * @tc.desc   expectedBase64Length(2063) is 2752
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120064 begin');
      const result: number = ResourceUtils.expectedBase64Length(2063);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2752));
      expect(result).assertEqual(2752);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2752 - 1) + '='.repeat(1))), String(2063));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2752 - 1) + '='.repeat(1))).assertEqual(2063);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120064 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120065
     * @tc.number SUB_RESMGR_UTILS_12_0065
     * @tc.desc   expectedBase64Length(2064) is 2752
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120065 begin');
      const result: number = ResourceUtils.expectedBase64Length(2064);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2752));
      expect(result).assertEqual(2752);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2752 - 0) + '='.repeat(0))), String(2064));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2752 - 0) + '='.repeat(0))).assertEqual(2064);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120065 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120066
     * @tc.number SUB_RESMGR_UTILS_12_0066
     * @tc.desc   expectedBase64Length(2065) is 2756
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120066 begin');
      const result: number = ResourceUtils.expectedBase64Length(2065);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2756));
      expect(result).assertEqual(2756);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2756 - 2) + '='.repeat(2))), String(2065));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2756 - 2) + '='.repeat(2))).assertEqual(2065);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120066 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120067
     * @tc.number SUB_RESMGR_UTILS_12_0067
     * @tc.desc   expectedBase64Length(2066) is 2756
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120067 begin');
      const result: number = ResourceUtils.expectedBase64Length(2066);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2756));
      expect(result).assertEqual(2756);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2756 - 1) + '='.repeat(1))), String(2066));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2756 - 1) + '='.repeat(1))).assertEqual(2066);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120067 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120068
     * @tc.number SUB_RESMGR_UTILS_12_0068
     * @tc.desc   expectedBase64Length(2067) is 2756
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120068 begin');
      const result: number = ResourceUtils.expectedBase64Length(2067);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2756));
      expect(result).assertEqual(2756);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2756 - 0) + '='.repeat(0))), String(2067));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2756 - 0) + '='.repeat(0))).assertEqual(2067);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120068 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120069
     * @tc.number SUB_RESMGR_UTILS_12_0069
     * @tc.desc   expectedBase64Length(2068) is 2760
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120069 begin');
      const result: number = ResourceUtils.expectedBase64Length(2068);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2760));
      expect(result).assertEqual(2760);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2760 - 2) + '='.repeat(2))), String(2068));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2760 - 2) + '='.repeat(2))).assertEqual(2068);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120069 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120070
     * @tc.number SUB_RESMGR_UTILS_12_0070
     * @tc.desc   expectedBase64Length(2069) is 2760
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120070 begin');
      const result: number = ResourceUtils.expectedBase64Length(2069);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2760));
      expect(result).assertEqual(2760);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2760 - 1) + '='.repeat(1))), String(2069));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2760 - 1) + '='.repeat(1))).assertEqual(2069);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120070 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120071
     * @tc.number SUB_RESMGR_UTILS_12_0071
     * @tc.desc   expectedBase64Length(2070) is 2760
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120071 begin');
      const result: number = ResourceUtils.expectedBase64Length(2070);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2760));
      expect(result).assertEqual(2760);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2760 - 0) + '='.repeat(0))), String(2070));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2760 - 0) + '='.repeat(0))).assertEqual(2070);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120071 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120072
     * @tc.number SUB_RESMGR_UTILS_12_0072
     * @tc.desc   expectedBase64Length(2071) is 2764
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120072 begin');
      const result: number = ResourceUtils.expectedBase64Length(2071);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2764));
      expect(result).assertEqual(2764);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2764 - 2) + '='.repeat(2))), String(2071));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2764 - 2) + '='.repeat(2))).assertEqual(2071);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120072 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120073
     * @tc.number SUB_RESMGR_UTILS_12_0073
     * @tc.desc   expectedBase64Length(2072) is 2764
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120073 begin');
      const result: number = ResourceUtils.expectedBase64Length(2072);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2764));
      expect(result).assertEqual(2764);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2764 - 1) + '='.repeat(1))), String(2072));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2764 - 1) + '='.repeat(1))).assertEqual(2072);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120073 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120074
     * @tc.number SUB_RESMGR_UTILS_12_0074
     * @tc.desc   expectedBase64Length(2073) is 2764
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120074 begin');
      const result: number = ResourceUtils.expectedBase64Length(2073);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2764));
      expect(result).assertEqual(2764);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2764 - 0) + '='.repeat(0))), String(2073));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2764 - 0) + '='.repeat(0))).assertEqual(2073);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120074 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120075
     * @tc.number SUB_RESMGR_UTILS_12_0075
     * @tc.desc   expectedBase64Length(2074) is 2768
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120075 begin');
      const result: number = ResourceUtils.expectedBase64Length(2074);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2768));
      expect(result).assertEqual(2768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2768 - 2) + '='.repeat(2))), String(2074));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2768 - 2) + '='.repeat(2))).assertEqual(2074);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120075 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120076
     * @tc.number SUB_RESMGR_UTILS_12_0076
     * @tc.desc   expectedBase64Length(2075) is 2768
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120076 begin');
      const result: number = ResourceUtils.expectedBase64Length(2075);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2768));
      expect(result).assertEqual(2768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2768 - 1) + '='.repeat(1))), String(2075));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2768 - 1) + '='.repeat(1))).assertEqual(2075);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120076 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120077
     * @tc.number SUB_RESMGR_UTILS_12_0077
     * @tc.desc   expectedBase64Length(2076) is 2768
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120077 begin');
      const result: number = ResourceUtils.expectedBase64Length(2076);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2768));
      expect(result).assertEqual(2768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2768 - 0) + '='.repeat(0))), String(2076));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2768 - 0) + '='.repeat(0))).assertEqual(2076);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120077 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120078
     * @tc.number SUB_RESMGR_UTILS_12_0078
     * @tc.desc   expectedBase64Length(2077) is 2772
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120078 begin');
      const result: number = ResourceUtils.expectedBase64Length(2077);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2772));
      expect(result).assertEqual(2772);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2772 - 2) + '='.repeat(2))), String(2077));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2772 - 2) + '='.repeat(2))).assertEqual(2077);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120078 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120079
     * @tc.number SUB_RESMGR_UTILS_12_0079
     * @tc.desc   expectedBase64Length(2078) is 2772
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120079 begin');
      const result: number = ResourceUtils.expectedBase64Length(2078);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2772));
      expect(result).assertEqual(2772);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2772 - 1) + '='.repeat(1))), String(2078));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2772 - 1) + '='.repeat(1))).assertEqual(2078);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120079 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120080
     * @tc.number SUB_RESMGR_UTILS_12_0080
     * @tc.desc   expectedBase64Length(2079) is 2772
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120080 begin');
      const result: number = ResourceUtils.expectedBase64Length(2079);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2772));
      expect(result).assertEqual(2772);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2772 - 0) + '='.repeat(0))), String(2079));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2772 - 0) + '='.repeat(0))).assertEqual(2079);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120080 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120081
     * @tc.number SUB_RESMGR_UTILS_12_0081
     * @tc.desc   expectedBase64Length(2080) is 2776
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120081 begin');
      const result: number = ResourceUtils.expectedBase64Length(2080);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2776));
      expect(result).assertEqual(2776);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2776 - 2) + '='.repeat(2))), String(2080));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2776 - 2) + '='.repeat(2))).assertEqual(2080);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120081 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120082
     * @tc.number SUB_RESMGR_UTILS_12_0082
     * @tc.desc   expectedBase64Length(2081) is 2776
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120082 begin');
      const result: number = ResourceUtils.expectedBase64Length(2081);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2776));
      expect(result).assertEqual(2776);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2776 - 1) + '='.repeat(1))), String(2081));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2776 - 1) + '='.repeat(1))).assertEqual(2081);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120082 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120083
     * @tc.number SUB_RESMGR_UTILS_12_0083
     * @tc.desc   expectedBase64Length(2082) is 2776
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120083 begin');
      const result: number = ResourceUtils.expectedBase64Length(2082);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2776));
      expect(result).assertEqual(2776);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2776 - 0) + '='.repeat(0))), String(2082));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2776 - 0) + '='.repeat(0))).assertEqual(2082);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120083 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120084
     * @tc.number SUB_RESMGR_UTILS_12_0084
     * @tc.desc   expectedBase64Length(2083) is 2780
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120084 begin');
      const result: number = ResourceUtils.expectedBase64Length(2083);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2780));
      expect(result).assertEqual(2780);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2780 - 2) + '='.repeat(2))), String(2083));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2780 - 2) + '='.repeat(2))).assertEqual(2083);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120084 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120085
     * @tc.number SUB_RESMGR_UTILS_12_0085
     * @tc.desc   expectedBase64Length(2084) is 2780
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120085 begin');
      const result: number = ResourceUtils.expectedBase64Length(2084);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2780));
      expect(result).assertEqual(2780);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2780 - 1) + '='.repeat(1))), String(2084));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2780 - 1) + '='.repeat(1))).assertEqual(2084);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120085 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120086
     * @tc.number SUB_RESMGR_UTILS_12_0086
     * @tc.desc   expectedBase64Length(2085) is 2780
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120086 begin');
      const result: number = ResourceUtils.expectedBase64Length(2085);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2780));
      expect(result).assertEqual(2780);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2780 - 0) + '='.repeat(0))), String(2085));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2780 - 0) + '='.repeat(0))).assertEqual(2085);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120086 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120087
     * @tc.number SUB_RESMGR_UTILS_12_0087
     * @tc.desc   expectedBase64Length(2086) is 2784
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120087 begin');
      const result: number = ResourceUtils.expectedBase64Length(2086);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2784));
      expect(result).assertEqual(2784);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2784 - 2) + '='.repeat(2))), String(2086));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2784 - 2) + '='.repeat(2))).assertEqual(2086);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120087 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120088
     * @tc.number SUB_RESMGR_UTILS_12_0088
     * @tc.desc   expectedBase64Length(2087) is 2784
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120088 begin');
      const result: number = ResourceUtils.expectedBase64Length(2087);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2784));
      expect(result).assertEqual(2784);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2784 - 1) + '='.repeat(1))), String(2087));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2784 - 1) + '='.repeat(1))).assertEqual(2087);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120088 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120089
     * @tc.number SUB_RESMGR_UTILS_12_0089
     * @tc.desc   expectedBase64Length(2088) is 2784
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120089 begin');
      const result: number = ResourceUtils.expectedBase64Length(2088);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2784));
      expect(result).assertEqual(2784);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2784 - 0) + '='.repeat(0))), String(2088));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2784 - 0) + '='.repeat(0))).assertEqual(2088);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120089 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120090
     * @tc.number SUB_RESMGR_UTILS_12_0090
     * @tc.desc   expectedBase64Length(2089) is 2788
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120090 begin');
      const result: number = ResourceUtils.expectedBase64Length(2089);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2788));
      expect(result).assertEqual(2788);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2788 - 2) + '='.repeat(2))), String(2089));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2788 - 2) + '='.repeat(2))).assertEqual(2089);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120090 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120091
     * @tc.number SUB_RESMGR_UTILS_12_0091
     * @tc.desc   expectedBase64Length(2090) is 2788
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120091 begin');
      const result: number = ResourceUtils.expectedBase64Length(2090);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2788));
      expect(result).assertEqual(2788);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2788 - 1) + '='.repeat(1))), String(2090));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2788 - 1) + '='.repeat(1))).assertEqual(2090);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120091 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120092
     * @tc.number SUB_RESMGR_UTILS_12_0092
     * @tc.desc   expectedBase64Length(2091) is 2788
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120092 begin');
      const result: number = ResourceUtils.expectedBase64Length(2091);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2788));
      expect(result).assertEqual(2788);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2788 - 0) + '='.repeat(0))), String(2091));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2788 - 0) + '='.repeat(0))).assertEqual(2091);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120092 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120093
     * @tc.number SUB_RESMGR_UTILS_12_0093
     * @tc.desc   expectedBase64Length(2092) is 2792
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120093 begin');
      const result: number = ResourceUtils.expectedBase64Length(2092);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2792));
      expect(result).assertEqual(2792);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2792 - 2) + '='.repeat(2))), String(2092));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2792 - 2) + '='.repeat(2))).assertEqual(2092);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120093 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120094
     * @tc.number SUB_RESMGR_UTILS_12_0094
     * @tc.desc   expectedBase64Length(2093) is 2792
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120094 begin');
      const result: number = ResourceUtils.expectedBase64Length(2093);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2792));
      expect(result).assertEqual(2792);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2792 - 1) + '='.repeat(1))), String(2093));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2792 - 1) + '='.repeat(1))).assertEqual(2093);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120094 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B120095
     * @tc.number SUB_RESMGR_UTILS_12_0095
     * @tc.desc   expectedBase64Length(2094) is 2792
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B120095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120095 begin');
      const result: number = ResourceUtils.expectedBase64Length(2094);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2792));
      expect(result).assertEqual(2792);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(2792 - 0) + '='.repeat(0))), String(2094));
      expect(ResourceUtils.decodedByteLength('A'.repeat(2792 - 0) + '='.repeat(0))).assertEqual(2094);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B120095 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B1296
     * @tc.number SUB_RESMGR_UTILS_12_0096
     * @tc.desc   千字节级图片的编码长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B1296', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B1296 begin');
      expect(ResourceUtils.expectedBase64Length(2000)).assertEqual(2668);
      expect(ResourceUtils.expectedBase64Length(2001)).assertEqual(2668);
      expect(ResourceUtils.expectedBase64Length(2004)).assertEqual(2672);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B1296 end');
    })
  })
}
