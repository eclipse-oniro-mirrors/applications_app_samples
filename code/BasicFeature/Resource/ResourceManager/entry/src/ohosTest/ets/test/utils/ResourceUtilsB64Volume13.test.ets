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

export default function resourceUtilsB64B13Test() {
  describe('ResourceUtilsB64B13Test', () => {

    /**
     * @tc.name   testResourceUtilsB64B130001
     * @tc.number SUB_RESMGR_UTILS_13_0001
     * @tc.desc   expectedBase64Length(5000) is 6668
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130001 begin');
      const result: number = ResourceUtils.expectedBase64Length(5000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6668));
      expect(result).assertEqual(6668);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6668 - 1) + '='.repeat(1))), String(5000));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6668 - 1) + '='.repeat(1))).assertEqual(5000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130001 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130002
     * @tc.number SUB_RESMGR_UTILS_13_0002
     * @tc.desc   expectedBase64Length(5001) is 6668
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130002 begin');
      const result: number = ResourceUtils.expectedBase64Length(5001);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6668));
      expect(result).assertEqual(6668);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6668 - 0) + '='.repeat(0))), String(5001));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6668 - 0) + '='.repeat(0))).assertEqual(5001);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130002 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130003
     * @tc.number SUB_RESMGR_UTILS_13_0003
     * @tc.desc   expectedBase64Length(5002) is 6672
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130003 begin');
      const result: number = ResourceUtils.expectedBase64Length(5002);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6672));
      expect(result).assertEqual(6672);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6672 - 2) + '='.repeat(2))), String(5002));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6672 - 2) + '='.repeat(2))).assertEqual(5002);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130003 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130004
     * @tc.number SUB_RESMGR_UTILS_13_0004
     * @tc.desc   expectedBase64Length(5003) is 6672
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130004 begin');
      const result: number = ResourceUtils.expectedBase64Length(5003);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6672));
      expect(result).assertEqual(6672);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6672 - 1) + '='.repeat(1))), String(5003));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6672 - 1) + '='.repeat(1))).assertEqual(5003);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130004 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130005
     * @tc.number SUB_RESMGR_UTILS_13_0005
     * @tc.desc   expectedBase64Length(5004) is 6672
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130005 begin');
      const result: number = ResourceUtils.expectedBase64Length(5004);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6672));
      expect(result).assertEqual(6672);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6672 - 0) + '='.repeat(0))), String(5004));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6672 - 0) + '='.repeat(0))).assertEqual(5004);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130005 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130006
     * @tc.number SUB_RESMGR_UTILS_13_0006
     * @tc.desc   expectedBase64Length(5005) is 6676
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130006 begin');
      const result: number = ResourceUtils.expectedBase64Length(5005);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6676));
      expect(result).assertEqual(6676);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6676 - 2) + '='.repeat(2))), String(5005));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6676 - 2) + '='.repeat(2))).assertEqual(5005);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130006 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130007
     * @tc.number SUB_RESMGR_UTILS_13_0007
     * @tc.desc   expectedBase64Length(5006) is 6676
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130007 begin');
      const result: number = ResourceUtils.expectedBase64Length(5006);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6676));
      expect(result).assertEqual(6676);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6676 - 1) + '='.repeat(1))), String(5006));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6676 - 1) + '='.repeat(1))).assertEqual(5006);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130007 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130008
     * @tc.number SUB_RESMGR_UTILS_13_0008
     * @tc.desc   expectedBase64Length(5007) is 6676
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130008 begin');
      const result: number = ResourceUtils.expectedBase64Length(5007);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6676));
      expect(result).assertEqual(6676);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6676 - 0) + '='.repeat(0))), String(5007));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6676 - 0) + '='.repeat(0))).assertEqual(5007);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130008 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130009
     * @tc.number SUB_RESMGR_UTILS_13_0009
     * @tc.desc   expectedBase64Length(5008) is 6680
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130009 begin');
      const result: number = ResourceUtils.expectedBase64Length(5008);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6680));
      expect(result).assertEqual(6680);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6680 - 2) + '='.repeat(2))), String(5008));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6680 - 2) + '='.repeat(2))).assertEqual(5008);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130009 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130010
     * @tc.number SUB_RESMGR_UTILS_13_0010
     * @tc.desc   expectedBase64Length(5009) is 6680
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130010 begin');
      const result: number = ResourceUtils.expectedBase64Length(5009);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6680));
      expect(result).assertEqual(6680);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6680 - 1) + '='.repeat(1))), String(5009));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6680 - 1) + '='.repeat(1))).assertEqual(5009);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130010 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130011
     * @tc.number SUB_RESMGR_UTILS_13_0011
     * @tc.desc   expectedBase64Length(5010) is 6680
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130011 begin');
      const result: number = ResourceUtils.expectedBase64Length(5010);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6680));
      expect(result).assertEqual(6680);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6680 - 0) + '='.repeat(0))), String(5010));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6680 - 0) + '='.repeat(0))).assertEqual(5010);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130011 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130012
     * @tc.number SUB_RESMGR_UTILS_13_0012
     * @tc.desc   expectedBase64Length(5011) is 6684
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130012 begin');
      const result: number = ResourceUtils.expectedBase64Length(5011);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6684));
      expect(result).assertEqual(6684);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6684 - 2) + '='.repeat(2))), String(5011));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6684 - 2) + '='.repeat(2))).assertEqual(5011);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130012 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130013
     * @tc.number SUB_RESMGR_UTILS_13_0013
     * @tc.desc   expectedBase64Length(5012) is 6684
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130013 begin');
      const result: number = ResourceUtils.expectedBase64Length(5012);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6684));
      expect(result).assertEqual(6684);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6684 - 1) + '='.repeat(1))), String(5012));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6684 - 1) + '='.repeat(1))).assertEqual(5012);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130013 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130014
     * @tc.number SUB_RESMGR_UTILS_13_0014
     * @tc.desc   expectedBase64Length(5013) is 6684
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130014 begin');
      const result: number = ResourceUtils.expectedBase64Length(5013);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6684));
      expect(result).assertEqual(6684);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6684 - 0) + '='.repeat(0))), String(5013));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6684 - 0) + '='.repeat(0))).assertEqual(5013);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130014 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130015
     * @tc.number SUB_RESMGR_UTILS_13_0015
     * @tc.desc   expectedBase64Length(5014) is 6688
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130015 begin');
      const result: number = ResourceUtils.expectedBase64Length(5014);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6688));
      expect(result).assertEqual(6688);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6688 - 2) + '='.repeat(2))), String(5014));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6688 - 2) + '='.repeat(2))).assertEqual(5014);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130015 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130016
     * @tc.number SUB_RESMGR_UTILS_13_0016
     * @tc.desc   expectedBase64Length(5015) is 6688
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130016 begin');
      const result: number = ResourceUtils.expectedBase64Length(5015);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6688));
      expect(result).assertEqual(6688);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6688 - 1) + '='.repeat(1))), String(5015));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6688 - 1) + '='.repeat(1))).assertEqual(5015);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130016 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130017
     * @tc.number SUB_RESMGR_UTILS_13_0017
     * @tc.desc   expectedBase64Length(5016) is 6688
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130017 begin');
      const result: number = ResourceUtils.expectedBase64Length(5016);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6688));
      expect(result).assertEqual(6688);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6688 - 0) + '='.repeat(0))), String(5016));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6688 - 0) + '='.repeat(0))).assertEqual(5016);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130017 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130018
     * @tc.number SUB_RESMGR_UTILS_13_0018
     * @tc.desc   expectedBase64Length(5017) is 6692
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130018 begin');
      const result: number = ResourceUtils.expectedBase64Length(5017);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6692));
      expect(result).assertEqual(6692);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6692 - 2) + '='.repeat(2))), String(5017));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6692 - 2) + '='.repeat(2))).assertEqual(5017);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130018 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130019
     * @tc.number SUB_RESMGR_UTILS_13_0019
     * @tc.desc   expectedBase64Length(5018) is 6692
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130019 begin');
      const result: number = ResourceUtils.expectedBase64Length(5018);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6692));
      expect(result).assertEqual(6692);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6692 - 1) + '='.repeat(1))), String(5018));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6692 - 1) + '='.repeat(1))).assertEqual(5018);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130019 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130020
     * @tc.number SUB_RESMGR_UTILS_13_0020
     * @tc.desc   expectedBase64Length(5019) is 6692
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130020 begin');
      const result: number = ResourceUtils.expectedBase64Length(5019);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6692));
      expect(result).assertEqual(6692);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6692 - 0) + '='.repeat(0))), String(5019));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6692 - 0) + '='.repeat(0))).assertEqual(5019);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130020 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130021
     * @tc.number SUB_RESMGR_UTILS_13_0021
     * @tc.desc   expectedBase64Length(5020) is 6696
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130021 begin');
      const result: number = ResourceUtils.expectedBase64Length(5020);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6696));
      expect(result).assertEqual(6696);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6696 - 2) + '='.repeat(2))), String(5020));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6696 - 2) + '='.repeat(2))).assertEqual(5020);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130021 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130022
     * @tc.number SUB_RESMGR_UTILS_13_0022
     * @tc.desc   expectedBase64Length(5021) is 6696
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130022 begin');
      const result: number = ResourceUtils.expectedBase64Length(5021);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6696));
      expect(result).assertEqual(6696);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6696 - 1) + '='.repeat(1))), String(5021));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6696 - 1) + '='.repeat(1))).assertEqual(5021);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130022 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130023
     * @tc.number SUB_RESMGR_UTILS_13_0023
     * @tc.desc   expectedBase64Length(5022) is 6696
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130023 begin');
      const result: number = ResourceUtils.expectedBase64Length(5022);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6696));
      expect(result).assertEqual(6696);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6696 - 0) + '='.repeat(0))), String(5022));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6696 - 0) + '='.repeat(0))).assertEqual(5022);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130023 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130024
     * @tc.number SUB_RESMGR_UTILS_13_0024
     * @tc.desc   expectedBase64Length(5023) is 6700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130024 begin');
      const result: number = ResourceUtils.expectedBase64Length(5023);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6700));
      expect(result).assertEqual(6700);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6700 - 2) + '='.repeat(2))), String(5023));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6700 - 2) + '='.repeat(2))).assertEqual(5023);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130024 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130025
     * @tc.number SUB_RESMGR_UTILS_13_0025
     * @tc.desc   expectedBase64Length(5024) is 6700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130025 begin');
      const result: number = ResourceUtils.expectedBase64Length(5024);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6700));
      expect(result).assertEqual(6700);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6700 - 1) + '='.repeat(1))), String(5024));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6700 - 1) + '='.repeat(1))).assertEqual(5024);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130025 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130026
     * @tc.number SUB_RESMGR_UTILS_13_0026
     * @tc.desc   expectedBase64Length(5025) is 6700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130026 begin');
      const result: number = ResourceUtils.expectedBase64Length(5025);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6700));
      expect(result).assertEqual(6700);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6700 - 0) + '='.repeat(0))), String(5025));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6700 - 0) + '='.repeat(0))).assertEqual(5025);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130026 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130027
     * @tc.number SUB_RESMGR_UTILS_13_0027
     * @tc.desc   expectedBase64Length(5026) is 6704
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130027 begin');
      const result: number = ResourceUtils.expectedBase64Length(5026);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6704));
      expect(result).assertEqual(6704);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6704 - 2) + '='.repeat(2))), String(5026));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6704 - 2) + '='.repeat(2))).assertEqual(5026);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130027 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130028
     * @tc.number SUB_RESMGR_UTILS_13_0028
     * @tc.desc   expectedBase64Length(5027) is 6704
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130028 begin');
      const result: number = ResourceUtils.expectedBase64Length(5027);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6704));
      expect(result).assertEqual(6704);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6704 - 1) + '='.repeat(1))), String(5027));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6704 - 1) + '='.repeat(1))).assertEqual(5027);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130028 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130029
     * @tc.number SUB_RESMGR_UTILS_13_0029
     * @tc.desc   expectedBase64Length(5028) is 6704
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130029 begin');
      const result: number = ResourceUtils.expectedBase64Length(5028);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6704));
      expect(result).assertEqual(6704);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6704 - 0) + '='.repeat(0))), String(5028));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6704 - 0) + '='.repeat(0))).assertEqual(5028);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130029 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130030
     * @tc.number SUB_RESMGR_UTILS_13_0030
     * @tc.desc   expectedBase64Length(5029) is 6708
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130030 begin');
      const result: number = ResourceUtils.expectedBase64Length(5029);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6708));
      expect(result).assertEqual(6708);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6708 - 2) + '='.repeat(2))), String(5029));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6708 - 2) + '='.repeat(2))).assertEqual(5029);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130030 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130031
     * @tc.number SUB_RESMGR_UTILS_13_0031
     * @tc.desc   expectedBase64Length(5030) is 6708
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130031 begin');
      const result: number = ResourceUtils.expectedBase64Length(5030);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6708));
      expect(result).assertEqual(6708);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6708 - 1) + '='.repeat(1))), String(5030));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6708 - 1) + '='.repeat(1))).assertEqual(5030);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130031 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130032
     * @tc.number SUB_RESMGR_UTILS_13_0032
     * @tc.desc   expectedBase64Length(5031) is 6708
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130032 begin');
      const result: number = ResourceUtils.expectedBase64Length(5031);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6708));
      expect(result).assertEqual(6708);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6708 - 0) + '='.repeat(0))), String(5031));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6708 - 0) + '='.repeat(0))).assertEqual(5031);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130032 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130033
     * @tc.number SUB_RESMGR_UTILS_13_0033
     * @tc.desc   expectedBase64Length(5032) is 6712
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130033 begin');
      const result: number = ResourceUtils.expectedBase64Length(5032);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6712));
      expect(result).assertEqual(6712);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6712 - 2) + '='.repeat(2))), String(5032));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6712 - 2) + '='.repeat(2))).assertEqual(5032);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130033 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130034
     * @tc.number SUB_RESMGR_UTILS_13_0034
     * @tc.desc   expectedBase64Length(5033) is 6712
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130034 begin');
      const result: number = ResourceUtils.expectedBase64Length(5033);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6712));
      expect(result).assertEqual(6712);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6712 - 1) + '='.repeat(1))), String(5033));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6712 - 1) + '='.repeat(1))).assertEqual(5033);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130034 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130035
     * @tc.number SUB_RESMGR_UTILS_13_0035
     * @tc.desc   expectedBase64Length(5034) is 6712
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130035 begin');
      const result: number = ResourceUtils.expectedBase64Length(5034);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6712));
      expect(result).assertEqual(6712);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6712 - 0) + '='.repeat(0))), String(5034));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6712 - 0) + '='.repeat(0))).assertEqual(5034);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130035 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130036
     * @tc.number SUB_RESMGR_UTILS_13_0036
     * @tc.desc   expectedBase64Length(5035) is 6716
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130036 begin');
      const result: number = ResourceUtils.expectedBase64Length(5035);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6716));
      expect(result).assertEqual(6716);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6716 - 2) + '='.repeat(2))), String(5035));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6716 - 2) + '='.repeat(2))).assertEqual(5035);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130036 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130037
     * @tc.number SUB_RESMGR_UTILS_13_0037
     * @tc.desc   expectedBase64Length(5036) is 6716
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130037 begin');
      const result: number = ResourceUtils.expectedBase64Length(5036);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6716));
      expect(result).assertEqual(6716);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6716 - 1) + '='.repeat(1))), String(5036));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6716 - 1) + '='.repeat(1))).assertEqual(5036);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130037 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130038
     * @tc.number SUB_RESMGR_UTILS_13_0038
     * @tc.desc   expectedBase64Length(5037) is 6716
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130038 begin');
      const result: number = ResourceUtils.expectedBase64Length(5037);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6716));
      expect(result).assertEqual(6716);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6716 - 0) + '='.repeat(0))), String(5037));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6716 - 0) + '='.repeat(0))).assertEqual(5037);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130038 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130039
     * @tc.number SUB_RESMGR_UTILS_13_0039
     * @tc.desc   expectedBase64Length(5038) is 6720
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130039 begin');
      const result: number = ResourceUtils.expectedBase64Length(5038);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6720));
      expect(result).assertEqual(6720);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6720 - 2) + '='.repeat(2))), String(5038));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6720 - 2) + '='.repeat(2))).assertEqual(5038);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130039 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130040
     * @tc.number SUB_RESMGR_UTILS_13_0040
     * @tc.desc   expectedBase64Length(5039) is 6720
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130040 begin');
      const result: number = ResourceUtils.expectedBase64Length(5039);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6720));
      expect(result).assertEqual(6720);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6720 - 1) + '='.repeat(1))), String(5039));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6720 - 1) + '='.repeat(1))).assertEqual(5039);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130040 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130041
     * @tc.number SUB_RESMGR_UTILS_13_0041
     * @tc.desc   expectedBase64Length(5040) is 6720
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130041 begin');
      const result: number = ResourceUtils.expectedBase64Length(5040);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6720));
      expect(result).assertEqual(6720);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6720 - 0) + '='.repeat(0))), String(5040));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6720 - 0) + '='.repeat(0))).assertEqual(5040);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130041 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130042
     * @tc.number SUB_RESMGR_UTILS_13_0042
     * @tc.desc   expectedBase64Length(5041) is 6724
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130042 begin');
      const result: number = ResourceUtils.expectedBase64Length(5041);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6724));
      expect(result).assertEqual(6724);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6724 - 2) + '='.repeat(2))), String(5041));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6724 - 2) + '='.repeat(2))).assertEqual(5041);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130042 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130043
     * @tc.number SUB_RESMGR_UTILS_13_0043
     * @tc.desc   expectedBase64Length(5042) is 6724
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130043 begin');
      const result: number = ResourceUtils.expectedBase64Length(5042);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6724));
      expect(result).assertEqual(6724);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6724 - 1) + '='.repeat(1))), String(5042));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6724 - 1) + '='.repeat(1))).assertEqual(5042);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130043 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130044
     * @tc.number SUB_RESMGR_UTILS_13_0044
     * @tc.desc   expectedBase64Length(5043) is 6724
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130044 begin');
      const result: number = ResourceUtils.expectedBase64Length(5043);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6724));
      expect(result).assertEqual(6724);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6724 - 0) + '='.repeat(0))), String(5043));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6724 - 0) + '='.repeat(0))).assertEqual(5043);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130044 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130045
     * @tc.number SUB_RESMGR_UTILS_13_0045
     * @tc.desc   expectedBase64Length(5044) is 6728
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130045 begin');
      const result: number = ResourceUtils.expectedBase64Length(5044);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6728));
      expect(result).assertEqual(6728);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6728 - 2) + '='.repeat(2))), String(5044));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6728 - 2) + '='.repeat(2))).assertEqual(5044);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130045 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130046
     * @tc.number SUB_RESMGR_UTILS_13_0046
     * @tc.desc   expectedBase64Length(5045) is 6728
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130046 begin');
      const result: number = ResourceUtils.expectedBase64Length(5045);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6728));
      expect(result).assertEqual(6728);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6728 - 1) + '='.repeat(1))), String(5045));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6728 - 1) + '='.repeat(1))).assertEqual(5045);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130046 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130047
     * @tc.number SUB_RESMGR_UTILS_13_0047
     * @tc.desc   expectedBase64Length(5046) is 6728
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130047 begin');
      const result: number = ResourceUtils.expectedBase64Length(5046);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6728));
      expect(result).assertEqual(6728);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6728 - 0) + '='.repeat(0))), String(5046));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6728 - 0) + '='.repeat(0))).assertEqual(5046);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130047 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130048
     * @tc.number SUB_RESMGR_UTILS_13_0048
     * @tc.desc   expectedBase64Length(5047) is 6732
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130048 begin');
      const result: number = ResourceUtils.expectedBase64Length(5047);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6732));
      expect(result).assertEqual(6732);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6732 - 2) + '='.repeat(2))), String(5047));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6732 - 2) + '='.repeat(2))).assertEqual(5047);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130048 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130049
     * @tc.number SUB_RESMGR_UTILS_13_0049
     * @tc.desc   expectedBase64Length(5048) is 6732
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130049 begin');
      const result: number = ResourceUtils.expectedBase64Length(5048);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6732));
      expect(result).assertEqual(6732);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6732 - 1) + '='.repeat(1))), String(5048));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6732 - 1) + '='.repeat(1))).assertEqual(5048);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130049 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130050
     * @tc.number SUB_RESMGR_UTILS_13_0050
     * @tc.desc   expectedBase64Length(5049) is 6732
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130050 begin');
      const result: number = ResourceUtils.expectedBase64Length(5049);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6732));
      expect(result).assertEqual(6732);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6732 - 0) + '='.repeat(0))), String(5049));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6732 - 0) + '='.repeat(0))).assertEqual(5049);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130050 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130051
     * @tc.number SUB_RESMGR_UTILS_13_0051
     * @tc.desc   expectedBase64Length(5050) is 6736
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130051 begin');
      const result: number = ResourceUtils.expectedBase64Length(5050);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6736));
      expect(result).assertEqual(6736);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6736 - 2) + '='.repeat(2))), String(5050));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6736 - 2) + '='.repeat(2))).assertEqual(5050);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130051 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130052
     * @tc.number SUB_RESMGR_UTILS_13_0052
     * @tc.desc   expectedBase64Length(5051) is 6736
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130052 begin');
      const result: number = ResourceUtils.expectedBase64Length(5051);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6736));
      expect(result).assertEqual(6736);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6736 - 1) + '='.repeat(1))), String(5051));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6736 - 1) + '='.repeat(1))).assertEqual(5051);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130052 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130053
     * @tc.number SUB_RESMGR_UTILS_13_0053
     * @tc.desc   expectedBase64Length(5052) is 6736
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130053 begin');
      const result: number = ResourceUtils.expectedBase64Length(5052);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6736));
      expect(result).assertEqual(6736);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6736 - 0) + '='.repeat(0))), String(5052));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6736 - 0) + '='.repeat(0))).assertEqual(5052);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130053 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130054
     * @tc.number SUB_RESMGR_UTILS_13_0054
     * @tc.desc   expectedBase64Length(5053) is 6740
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130054 begin');
      const result: number = ResourceUtils.expectedBase64Length(5053);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6740));
      expect(result).assertEqual(6740);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6740 - 2) + '='.repeat(2))), String(5053));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6740 - 2) + '='.repeat(2))).assertEqual(5053);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130054 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130055
     * @tc.number SUB_RESMGR_UTILS_13_0055
     * @tc.desc   expectedBase64Length(5054) is 6740
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130055 begin');
      const result: number = ResourceUtils.expectedBase64Length(5054);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6740));
      expect(result).assertEqual(6740);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6740 - 1) + '='.repeat(1))), String(5054));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6740 - 1) + '='.repeat(1))).assertEqual(5054);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130055 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130056
     * @tc.number SUB_RESMGR_UTILS_13_0056
     * @tc.desc   expectedBase64Length(5055) is 6740
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130056 begin');
      const result: number = ResourceUtils.expectedBase64Length(5055);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6740));
      expect(result).assertEqual(6740);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6740 - 0) + '='.repeat(0))), String(5055));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6740 - 0) + '='.repeat(0))).assertEqual(5055);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130056 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130057
     * @tc.number SUB_RESMGR_UTILS_13_0057
     * @tc.desc   expectedBase64Length(5056) is 6744
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130057 begin');
      const result: number = ResourceUtils.expectedBase64Length(5056);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6744));
      expect(result).assertEqual(6744);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6744 - 2) + '='.repeat(2))), String(5056));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6744 - 2) + '='.repeat(2))).assertEqual(5056);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130057 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130058
     * @tc.number SUB_RESMGR_UTILS_13_0058
     * @tc.desc   expectedBase64Length(5057) is 6744
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130058 begin');
      const result: number = ResourceUtils.expectedBase64Length(5057);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6744));
      expect(result).assertEqual(6744);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6744 - 1) + '='.repeat(1))), String(5057));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6744 - 1) + '='.repeat(1))).assertEqual(5057);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130058 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130059
     * @tc.number SUB_RESMGR_UTILS_13_0059
     * @tc.desc   expectedBase64Length(5058) is 6744
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130059 begin');
      const result: number = ResourceUtils.expectedBase64Length(5058);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6744));
      expect(result).assertEqual(6744);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6744 - 0) + '='.repeat(0))), String(5058));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6744 - 0) + '='.repeat(0))).assertEqual(5058);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130059 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130060
     * @tc.number SUB_RESMGR_UTILS_13_0060
     * @tc.desc   expectedBase64Length(5059) is 6748
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130060 begin');
      const result: number = ResourceUtils.expectedBase64Length(5059);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6748));
      expect(result).assertEqual(6748);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6748 - 2) + '='.repeat(2))), String(5059));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6748 - 2) + '='.repeat(2))).assertEqual(5059);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130060 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130061
     * @tc.number SUB_RESMGR_UTILS_13_0061
     * @tc.desc   expectedBase64Length(5060) is 6748
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130061 begin');
      const result: number = ResourceUtils.expectedBase64Length(5060);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6748));
      expect(result).assertEqual(6748);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6748 - 1) + '='.repeat(1))), String(5060));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6748 - 1) + '='.repeat(1))).assertEqual(5060);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130061 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130062
     * @tc.number SUB_RESMGR_UTILS_13_0062
     * @tc.desc   expectedBase64Length(5061) is 6748
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130062 begin');
      const result: number = ResourceUtils.expectedBase64Length(5061);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6748));
      expect(result).assertEqual(6748);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6748 - 0) + '='.repeat(0))), String(5061));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6748 - 0) + '='.repeat(0))).assertEqual(5061);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130062 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130063
     * @tc.number SUB_RESMGR_UTILS_13_0063
     * @tc.desc   expectedBase64Length(5062) is 6752
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130063 begin');
      const result: number = ResourceUtils.expectedBase64Length(5062);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6752));
      expect(result).assertEqual(6752);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6752 - 2) + '='.repeat(2))), String(5062));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6752 - 2) + '='.repeat(2))).assertEqual(5062);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130063 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130064
     * @tc.number SUB_RESMGR_UTILS_13_0064
     * @tc.desc   expectedBase64Length(5063) is 6752
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130064 begin');
      const result: number = ResourceUtils.expectedBase64Length(5063);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6752));
      expect(result).assertEqual(6752);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6752 - 1) + '='.repeat(1))), String(5063));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6752 - 1) + '='.repeat(1))).assertEqual(5063);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130064 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130065
     * @tc.number SUB_RESMGR_UTILS_13_0065
     * @tc.desc   expectedBase64Length(5064) is 6752
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130065 begin');
      const result: number = ResourceUtils.expectedBase64Length(5064);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6752));
      expect(result).assertEqual(6752);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6752 - 0) + '='.repeat(0))), String(5064));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6752 - 0) + '='.repeat(0))).assertEqual(5064);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130065 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130066
     * @tc.number SUB_RESMGR_UTILS_13_0066
     * @tc.desc   expectedBase64Length(5065) is 6756
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130066 begin');
      const result: number = ResourceUtils.expectedBase64Length(5065);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6756));
      expect(result).assertEqual(6756);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6756 - 2) + '='.repeat(2))), String(5065));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6756 - 2) + '='.repeat(2))).assertEqual(5065);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130066 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130067
     * @tc.number SUB_RESMGR_UTILS_13_0067
     * @tc.desc   expectedBase64Length(5066) is 6756
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130067 begin');
      const result: number = ResourceUtils.expectedBase64Length(5066);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6756));
      expect(result).assertEqual(6756);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6756 - 1) + '='.repeat(1))), String(5066));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6756 - 1) + '='.repeat(1))).assertEqual(5066);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130067 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130068
     * @tc.number SUB_RESMGR_UTILS_13_0068
     * @tc.desc   expectedBase64Length(5067) is 6756
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130068 begin');
      const result: number = ResourceUtils.expectedBase64Length(5067);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6756));
      expect(result).assertEqual(6756);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6756 - 0) + '='.repeat(0))), String(5067));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6756 - 0) + '='.repeat(0))).assertEqual(5067);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130068 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130069
     * @tc.number SUB_RESMGR_UTILS_13_0069
     * @tc.desc   expectedBase64Length(5068) is 6760
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130069 begin');
      const result: number = ResourceUtils.expectedBase64Length(5068);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6760));
      expect(result).assertEqual(6760);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6760 - 2) + '='.repeat(2))), String(5068));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6760 - 2) + '='.repeat(2))).assertEqual(5068);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130069 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130070
     * @tc.number SUB_RESMGR_UTILS_13_0070
     * @tc.desc   expectedBase64Length(5069) is 6760
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130070 begin');
      const result: number = ResourceUtils.expectedBase64Length(5069);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6760));
      expect(result).assertEqual(6760);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6760 - 1) + '='.repeat(1))), String(5069));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6760 - 1) + '='.repeat(1))).assertEqual(5069);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130070 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130071
     * @tc.number SUB_RESMGR_UTILS_13_0071
     * @tc.desc   expectedBase64Length(5070) is 6760
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130071 begin');
      const result: number = ResourceUtils.expectedBase64Length(5070);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6760));
      expect(result).assertEqual(6760);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6760 - 0) + '='.repeat(0))), String(5070));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6760 - 0) + '='.repeat(0))).assertEqual(5070);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130071 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130072
     * @tc.number SUB_RESMGR_UTILS_13_0072
     * @tc.desc   expectedBase64Length(5071) is 6764
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130072 begin');
      const result: number = ResourceUtils.expectedBase64Length(5071);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6764));
      expect(result).assertEqual(6764);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6764 - 2) + '='.repeat(2))), String(5071));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6764 - 2) + '='.repeat(2))).assertEqual(5071);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130072 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130073
     * @tc.number SUB_RESMGR_UTILS_13_0073
     * @tc.desc   expectedBase64Length(5072) is 6764
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130073 begin');
      const result: number = ResourceUtils.expectedBase64Length(5072);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6764));
      expect(result).assertEqual(6764);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6764 - 1) + '='.repeat(1))), String(5072));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6764 - 1) + '='.repeat(1))).assertEqual(5072);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130073 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130074
     * @tc.number SUB_RESMGR_UTILS_13_0074
     * @tc.desc   expectedBase64Length(5073) is 6764
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130074 begin');
      const result: number = ResourceUtils.expectedBase64Length(5073);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6764));
      expect(result).assertEqual(6764);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6764 - 0) + '='.repeat(0))), String(5073));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6764 - 0) + '='.repeat(0))).assertEqual(5073);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130074 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130075
     * @tc.number SUB_RESMGR_UTILS_13_0075
     * @tc.desc   expectedBase64Length(5074) is 6768
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130075 begin');
      const result: number = ResourceUtils.expectedBase64Length(5074);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6768));
      expect(result).assertEqual(6768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6768 - 2) + '='.repeat(2))), String(5074));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6768 - 2) + '='.repeat(2))).assertEqual(5074);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130075 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130076
     * @tc.number SUB_RESMGR_UTILS_13_0076
     * @tc.desc   expectedBase64Length(5075) is 6768
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130076 begin');
      const result: number = ResourceUtils.expectedBase64Length(5075);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6768));
      expect(result).assertEqual(6768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6768 - 1) + '='.repeat(1))), String(5075));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6768 - 1) + '='.repeat(1))).assertEqual(5075);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130076 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130077
     * @tc.number SUB_RESMGR_UTILS_13_0077
     * @tc.desc   expectedBase64Length(5076) is 6768
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130077 begin');
      const result: number = ResourceUtils.expectedBase64Length(5076);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6768));
      expect(result).assertEqual(6768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6768 - 0) + '='.repeat(0))), String(5076));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6768 - 0) + '='.repeat(0))).assertEqual(5076);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130077 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130078
     * @tc.number SUB_RESMGR_UTILS_13_0078
     * @tc.desc   expectedBase64Length(5077) is 6772
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130078 begin');
      const result: number = ResourceUtils.expectedBase64Length(5077);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6772));
      expect(result).assertEqual(6772);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6772 - 2) + '='.repeat(2))), String(5077));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6772 - 2) + '='.repeat(2))).assertEqual(5077);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130078 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130079
     * @tc.number SUB_RESMGR_UTILS_13_0079
     * @tc.desc   expectedBase64Length(5078) is 6772
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130079 begin');
      const result: number = ResourceUtils.expectedBase64Length(5078);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6772));
      expect(result).assertEqual(6772);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6772 - 1) + '='.repeat(1))), String(5078));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6772 - 1) + '='.repeat(1))).assertEqual(5078);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130079 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130080
     * @tc.number SUB_RESMGR_UTILS_13_0080
     * @tc.desc   expectedBase64Length(5079) is 6772
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130080 begin');
      const result: number = ResourceUtils.expectedBase64Length(5079);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6772));
      expect(result).assertEqual(6772);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6772 - 0) + '='.repeat(0))), String(5079));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6772 - 0) + '='.repeat(0))).assertEqual(5079);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130080 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130081
     * @tc.number SUB_RESMGR_UTILS_13_0081
     * @tc.desc   expectedBase64Length(5080) is 6776
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130081 begin');
      const result: number = ResourceUtils.expectedBase64Length(5080);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6776));
      expect(result).assertEqual(6776);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6776 - 2) + '='.repeat(2))), String(5080));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6776 - 2) + '='.repeat(2))).assertEqual(5080);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130081 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130082
     * @tc.number SUB_RESMGR_UTILS_13_0082
     * @tc.desc   expectedBase64Length(5081) is 6776
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130082 begin');
      const result: number = ResourceUtils.expectedBase64Length(5081);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6776));
      expect(result).assertEqual(6776);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6776 - 1) + '='.repeat(1))), String(5081));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6776 - 1) + '='.repeat(1))).assertEqual(5081);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130082 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130083
     * @tc.number SUB_RESMGR_UTILS_13_0083
     * @tc.desc   expectedBase64Length(5082) is 6776
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130083 begin');
      const result: number = ResourceUtils.expectedBase64Length(5082);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6776));
      expect(result).assertEqual(6776);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6776 - 0) + '='.repeat(0))), String(5082));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6776 - 0) + '='.repeat(0))).assertEqual(5082);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130083 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130084
     * @tc.number SUB_RESMGR_UTILS_13_0084
     * @tc.desc   expectedBase64Length(5083) is 6780
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130084 begin');
      const result: number = ResourceUtils.expectedBase64Length(5083);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6780));
      expect(result).assertEqual(6780);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6780 - 2) + '='.repeat(2))), String(5083));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6780 - 2) + '='.repeat(2))).assertEqual(5083);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130084 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130085
     * @tc.number SUB_RESMGR_UTILS_13_0085
     * @tc.desc   expectedBase64Length(5084) is 6780
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130085 begin');
      const result: number = ResourceUtils.expectedBase64Length(5084);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6780));
      expect(result).assertEqual(6780);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6780 - 1) + '='.repeat(1))), String(5084));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6780 - 1) + '='.repeat(1))).assertEqual(5084);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130085 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130086
     * @tc.number SUB_RESMGR_UTILS_13_0086
     * @tc.desc   expectedBase64Length(5085) is 6780
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130086 begin');
      const result: number = ResourceUtils.expectedBase64Length(5085);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6780));
      expect(result).assertEqual(6780);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6780 - 0) + '='.repeat(0))), String(5085));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6780 - 0) + '='.repeat(0))).assertEqual(5085);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130086 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130087
     * @tc.number SUB_RESMGR_UTILS_13_0087
     * @tc.desc   expectedBase64Length(5086) is 6784
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130087 begin');
      const result: number = ResourceUtils.expectedBase64Length(5086);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6784));
      expect(result).assertEqual(6784);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6784 - 2) + '='.repeat(2))), String(5086));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6784 - 2) + '='.repeat(2))).assertEqual(5086);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130087 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130088
     * @tc.number SUB_RESMGR_UTILS_13_0088
     * @tc.desc   expectedBase64Length(5087) is 6784
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130088 begin');
      const result: number = ResourceUtils.expectedBase64Length(5087);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6784));
      expect(result).assertEqual(6784);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6784 - 1) + '='.repeat(1))), String(5087));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6784 - 1) + '='.repeat(1))).assertEqual(5087);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130088 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130089
     * @tc.number SUB_RESMGR_UTILS_13_0089
     * @tc.desc   expectedBase64Length(5088) is 6784
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130089 begin');
      const result: number = ResourceUtils.expectedBase64Length(5088);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6784));
      expect(result).assertEqual(6784);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6784 - 0) + '='.repeat(0))), String(5088));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6784 - 0) + '='.repeat(0))).assertEqual(5088);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130089 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130090
     * @tc.number SUB_RESMGR_UTILS_13_0090
     * @tc.desc   expectedBase64Length(5089) is 6788
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130090 begin');
      const result: number = ResourceUtils.expectedBase64Length(5089);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6788));
      expect(result).assertEqual(6788);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6788 - 2) + '='.repeat(2))), String(5089));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6788 - 2) + '='.repeat(2))).assertEqual(5089);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130090 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130091
     * @tc.number SUB_RESMGR_UTILS_13_0091
     * @tc.desc   expectedBase64Length(5090) is 6788
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130091 begin');
      const result: number = ResourceUtils.expectedBase64Length(5090);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6788));
      expect(result).assertEqual(6788);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6788 - 1) + '='.repeat(1))), String(5090));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6788 - 1) + '='.repeat(1))).assertEqual(5090);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130091 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130092
     * @tc.number SUB_RESMGR_UTILS_13_0092
     * @tc.desc   expectedBase64Length(5091) is 6788
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130092 begin');
      const result: number = ResourceUtils.expectedBase64Length(5091);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6788));
      expect(result).assertEqual(6788);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6788 - 0) + '='.repeat(0))), String(5091));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6788 - 0) + '='.repeat(0))).assertEqual(5091);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130092 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130093
     * @tc.number SUB_RESMGR_UTILS_13_0093
     * @tc.desc   expectedBase64Length(5092) is 6792
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130093 begin');
      const result: number = ResourceUtils.expectedBase64Length(5092);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6792));
      expect(result).assertEqual(6792);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6792 - 2) + '='.repeat(2))), String(5092));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6792 - 2) + '='.repeat(2))).assertEqual(5092);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130093 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130094
     * @tc.number SUB_RESMGR_UTILS_13_0094
     * @tc.desc   expectedBase64Length(5093) is 6792
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130094 begin');
      const result: number = ResourceUtils.expectedBase64Length(5093);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6792));
      expect(result).assertEqual(6792);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6792 - 1) + '='.repeat(1))), String(5093));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6792 - 1) + '='.repeat(1))).assertEqual(5093);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130094 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B130095
     * @tc.number SUB_RESMGR_UTILS_13_0095
     * @tc.desc   expectedBase64Length(5094) is 6792
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B130095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130095 begin');
      const result: number = ResourceUtils.expectedBase64Length(5094);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6792));
      expect(result).assertEqual(6792);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(6792 - 0) + '='.repeat(0))), String(5094));
      expect(ResourceUtils.decodedByteLength('A'.repeat(6792 - 0) + '='.repeat(0))).assertEqual(5094);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B130095 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B1396
     * @tc.number SUB_RESMGR_UTILS_13_0096
     * @tc.desc   五千字节以上仍按 4 字符一组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B1396', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B1396 begin');
      expect(ResourceUtils.expectedBase64Length(5000)).assertEqual(6668);
      expect(ResourceUtils.expectedBase64Length(5001)).assertEqual(6668);
      expect(ResourceUtils.expectedBase64Length(5004)).assertEqual(6672);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B1396 end');
    })
  })
}
