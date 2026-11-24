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

export default function resourceUtilsB64B11Test() {
  describe('ResourceUtilsB64B11Test', () => {

    /**
     * @tc.name   testResourceUtilsB64B110001
     * @tc.number SUB_RESMGR_UTILS_11_0001
     * @tc.desc   expectedBase64Length(100) is 136
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110001 begin');
      const result: number = ResourceUtils.expectedBase64Length(100);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(136));
      expect(result).assertEqual(136);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(136 - 2) + '='.repeat(2))), String(100));
      expect(ResourceUtils.decodedByteLength('A'.repeat(136 - 2) + '='.repeat(2))).assertEqual(100);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110001 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110002
     * @tc.number SUB_RESMGR_UTILS_11_0002
     * @tc.desc   expectedBase64Length(101) is 136
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110002 begin');
      const result: number = ResourceUtils.expectedBase64Length(101);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(136));
      expect(result).assertEqual(136);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(136 - 1) + '='.repeat(1))), String(101));
      expect(ResourceUtils.decodedByteLength('A'.repeat(136 - 1) + '='.repeat(1))).assertEqual(101);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110002 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110003
     * @tc.number SUB_RESMGR_UTILS_11_0003
     * @tc.desc   expectedBase64Length(102) is 136
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110003 begin');
      const result: number = ResourceUtils.expectedBase64Length(102);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(136));
      expect(result).assertEqual(136);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(136 - 0) + '='.repeat(0))), String(102));
      expect(ResourceUtils.decodedByteLength('A'.repeat(136 - 0) + '='.repeat(0))).assertEqual(102);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110003 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110004
     * @tc.number SUB_RESMGR_UTILS_11_0004
     * @tc.desc   expectedBase64Length(103) is 140
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110004 begin');
      const result: number = ResourceUtils.expectedBase64Length(103);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(140));
      expect(result).assertEqual(140);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(140 - 2) + '='.repeat(2))), String(103));
      expect(ResourceUtils.decodedByteLength('A'.repeat(140 - 2) + '='.repeat(2))).assertEqual(103);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110004 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110005
     * @tc.number SUB_RESMGR_UTILS_11_0005
     * @tc.desc   expectedBase64Length(104) is 140
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110005 begin');
      const result: number = ResourceUtils.expectedBase64Length(104);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(140));
      expect(result).assertEqual(140);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(140 - 1) + '='.repeat(1))), String(104));
      expect(ResourceUtils.decodedByteLength('A'.repeat(140 - 1) + '='.repeat(1))).assertEqual(104);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110005 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110006
     * @tc.number SUB_RESMGR_UTILS_11_0006
     * @tc.desc   expectedBase64Length(105) is 140
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110006 begin');
      const result: number = ResourceUtils.expectedBase64Length(105);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(140));
      expect(result).assertEqual(140);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(140 - 0) + '='.repeat(0))), String(105));
      expect(ResourceUtils.decodedByteLength('A'.repeat(140 - 0) + '='.repeat(0))).assertEqual(105);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110006 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110007
     * @tc.number SUB_RESMGR_UTILS_11_0007
     * @tc.desc   expectedBase64Length(106) is 144
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110007 begin');
      const result: number = ResourceUtils.expectedBase64Length(106);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(144));
      expect(result).assertEqual(144);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(144 - 2) + '='.repeat(2))), String(106));
      expect(ResourceUtils.decodedByteLength('A'.repeat(144 - 2) + '='.repeat(2))).assertEqual(106);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110007 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110008
     * @tc.number SUB_RESMGR_UTILS_11_0008
     * @tc.desc   expectedBase64Length(107) is 144
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110008 begin');
      const result: number = ResourceUtils.expectedBase64Length(107);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(144));
      expect(result).assertEqual(144);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(144 - 1) + '='.repeat(1))), String(107));
      expect(ResourceUtils.decodedByteLength('A'.repeat(144 - 1) + '='.repeat(1))).assertEqual(107);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110008 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110009
     * @tc.number SUB_RESMGR_UTILS_11_0009
     * @tc.desc   expectedBase64Length(108) is 144
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110009 begin');
      const result: number = ResourceUtils.expectedBase64Length(108);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(144));
      expect(result).assertEqual(144);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(144 - 0) + '='.repeat(0))), String(108));
      expect(ResourceUtils.decodedByteLength('A'.repeat(144 - 0) + '='.repeat(0))).assertEqual(108);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110009 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110010
     * @tc.number SUB_RESMGR_UTILS_11_0010
     * @tc.desc   expectedBase64Length(109) is 148
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110010 begin');
      const result: number = ResourceUtils.expectedBase64Length(109);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(148));
      expect(result).assertEqual(148);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(148 - 2) + '='.repeat(2))), String(109));
      expect(ResourceUtils.decodedByteLength('A'.repeat(148 - 2) + '='.repeat(2))).assertEqual(109);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110010 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110011
     * @tc.number SUB_RESMGR_UTILS_11_0011
     * @tc.desc   expectedBase64Length(110) is 148
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110011 begin');
      const result: number = ResourceUtils.expectedBase64Length(110);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(148));
      expect(result).assertEqual(148);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(148 - 1) + '='.repeat(1))), String(110));
      expect(ResourceUtils.decodedByteLength('A'.repeat(148 - 1) + '='.repeat(1))).assertEqual(110);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110011 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110012
     * @tc.number SUB_RESMGR_UTILS_11_0012
     * @tc.desc   expectedBase64Length(111) is 148
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110012 begin');
      const result: number = ResourceUtils.expectedBase64Length(111);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(148));
      expect(result).assertEqual(148);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(148 - 0) + '='.repeat(0))), String(111));
      expect(ResourceUtils.decodedByteLength('A'.repeat(148 - 0) + '='.repeat(0))).assertEqual(111);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110012 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110013
     * @tc.number SUB_RESMGR_UTILS_11_0013
     * @tc.desc   expectedBase64Length(112) is 152
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110013 begin');
      const result: number = ResourceUtils.expectedBase64Length(112);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(152));
      expect(result).assertEqual(152);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(152 - 2) + '='.repeat(2))), String(112));
      expect(ResourceUtils.decodedByteLength('A'.repeat(152 - 2) + '='.repeat(2))).assertEqual(112);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110013 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110014
     * @tc.number SUB_RESMGR_UTILS_11_0014
     * @tc.desc   expectedBase64Length(113) is 152
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110014 begin');
      const result: number = ResourceUtils.expectedBase64Length(113);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(152));
      expect(result).assertEqual(152);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(152 - 1) + '='.repeat(1))), String(113));
      expect(ResourceUtils.decodedByteLength('A'.repeat(152 - 1) + '='.repeat(1))).assertEqual(113);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110014 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110015
     * @tc.number SUB_RESMGR_UTILS_11_0015
     * @tc.desc   expectedBase64Length(114) is 152
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110015 begin');
      const result: number = ResourceUtils.expectedBase64Length(114);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(152));
      expect(result).assertEqual(152);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(152 - 0) + '='.repeat(0))), String(114));
      expect(ResourceUtils.decodedByteLength('A'.repeat(152 - 0) + '='.repeat(0))).assertEqual(114);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110015 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110016
     * @tc.number SUB_RESMGR_UTILS_11_0016
     * @tc.desc   expectedBase64Length(115) is 156
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110016 begin');
      const result: number = ResourceUtils.expectedBase64Length(115);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(156));
      expect(result).assertEqual(156);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(156 - 2) + '='.repeat(2))), String(115));
      expect(ResourceUtils.decodedByteLength('A'.repeat(156 - 2) + '='.repeat(2))).assertEqual(115);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110016 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110017
     * @tc.number SUB_RESMGR_UTILS_11_0017
     * @tc.desc   expectedBase64Length(116) is 156
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110017 begin');
      const result: number = ResourceUtils.expectedBase64Length(116);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(156));
      expect(result).assertEqual(156);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(156 - 1) + '='.repeat(1))), String(116));
      expect(ResourceUtils.decodedByteLength('A'.repeat(156 - 1) + '='.repeat(1))).assertEqual(116);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110017 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110018
     * @tc.number SUB_RESMGR_UTILS_11_0018
     * @tc.desc   expectedBase64Length(117) is 156
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110018 begin');
      const result: number = ResourceUtils.expectedBase64Length(117);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(156));
      expect(result).assertEqual(156);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(156 - 0) + '='.repeat(0))), String(117));
      expect(ResourceUtils.decodedByteLength('A'.repeat(156 - 0) + '='.repeat(0))).assertEqual(117);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110018 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110019
     * @tc.number SUB_RESMGR_UTILS_11_0019
     * @tc.desc   expectedBase64Length(118) is 160
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110019 begin');
      const result: number = ResourceUtils.expectedBase64Length(118);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(160));
      expect(result).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(160 - 2) + '='.repeat(2))), String(118));
      expect(ResourceUtils.decodedByteLength('A'.repeat(160 - 2) + '='.repeat(2))).assertEqual(118);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110019 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110020
     * @tc.number SUB_RESMGR_UTILS_11_0020
     * @tc.desc   expectedBase64Length(119) is 160
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110020 begin');
      const result: number = ResourceUtils.expectedBase64Length(119);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(160));
      expect(result).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(160 - 1) + '='.repeat(1))), String(119));
      expect(ResourceUtils.decodedByteLength('A'.repeat(160 - 1) + '='.repeat(1))).assertEqual(119);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110020 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110021
     * @tc.number SUB_RESMGR_UTILS_11_0021
     * @tc.desc   expectedBase64Length(120) is 160
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110021 begin');
      const result: number = ResourceUtils.expectedBase64Length(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(160));
      expect(result).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(160 - 0) + '='.repeat(0))), String(120));
      expect(ResourceUtils.decodedByteLength('A'.repeat(160 - 0) + '='.repeat(0))).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110021 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110022
     * @tc.number SUB_RESMGR_UTILS_11_0022
     * @tc.desc   expectedBase64Length(121) is 164
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110022 begin');
      const result: number = ResourceUtils.expectedBase64Length(121);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(164));
      expect(result).assertEqual(164);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(164 - 2) + '='.repeat(2))), String(121));
      expect(ResourceUtils.decodedByteLength('A'.repeat(164 - 2) + '='.repeat(2))).assertEqual(121);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110022 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110023
     * @tc.number SUB_RESMGR_UTILS_11_0023
     * @tc.desc   expectedBase64Length(122) is 164
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110023 begin');
      const result: number = ResourceUtils.expectedBase64Length(122);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(164));
      expect(result).assertEqual(164);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(164 - 1) + '='.repeat(1))), String(122));
      expect(ResourceUtils.decodedByteLength('A'.repeat(164 - 1) + '='.repeat(1))).assertEqual(122);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110023 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110024
     * @tc.number SUB_RESMGR_UTILS_11_0024
     * @tc.desc   expectedBase64Length(123) is 164
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110024 begin');
      const result: number = ResourceUtils.expectedBase64Length(123);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(164));
      expect(result).assertEqual(164);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(164 - 0) + '='.repeat(0))), String(123));
      expect(ResourceUtils.decodedByteLength('A'.repeat(164 - 0) + '='.repeat(0))).assertEqual(123);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110024 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110025
     * @tc.number SUB_RESMGR_UTILS_11_0025
     * @tc.desc   expectedBase64Length(124) is 168
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110025 begin');
      const result: number = ResourceUtils.expectedBase64Length(124);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(168));
      expect(result).assertEqual(168);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(168 - 2) + '='.repeat(2))), String(124));
      expect(ResourceUtils.decodedByteLength('A'.repeat(168 - 2) + '='.repeat(2))).assertEqual(124);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110025 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110026
     * @tc.number SUB_RESMGR_UTILS_11_0026
     * @tc.desc   expectedBase64Length(125) is 168
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110026 begin');
      const result: number = ResourceUtils.expectedBase64Length(125);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(168));
      expect(result).assertEqual(168);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(168 - 1) + '='.repeat(1))), String(125));
      expect(ResourceUtils.decodedByteLength('A'.repeat(168 - 1) + '='.repeat(1))).assertEqual(125);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110026 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110027
     * @tc.number SUB_RESMGR_UTILS_11_0027
     * @tc.desc   expectedBase64Length(126) is 168
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110027 begin');
      const result: number = ResourceUtils.expectedBase64Length(126);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(168));
      expect(result).assertEqual(168);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(168 - 0) + '='.repeat(0))), String(126));
      expect(ResourceUtils.decodedByteLength('A'.repeat(168 - 0) + '='.repeat(0))).assertEqual(126);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110027 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110028
     * @tc.number SUB_RESMGR_UTILS_11_0028
     * @tc.desc   expectedBase64Length(127) is 172
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110028 begin');
      const result: number = ResourceUtils.expectedBase64Length(127);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(172));
      expect(result).assertEqual(172);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(172 - 2) + '='.repeat(2))), String(127));
      expect(ResourceUtils.decodedByteLength('A'.repeat(172 - 2) + '='.repeat(2))).assertEqual(127);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110028 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110029
     * @tc.number SUB_RESMGR_UTILS_11_0029
     * @tc.desc   expectedBase64Length(128) is 172
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110029 begin');
      const result: number = ResourceUtils.expectedBase64Length(128);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(172));
      expect(result).assertEqual(172);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(172 - 1) + '='.repeat(1))), String(128));
      expect(ResourceUtils.decodedByteLength('A'.repeat(172 - 1) + '='.repeat(1))).assertEqual(128);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110029 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110030
     * @tc.number SUB_RESMGR_UTILS_11_0030
     * @tc.desc   expectedBase64Length(129) is 172
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110030 begin');
      const result: number = ResourceUtils.expectedBase64Length(129);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(172));
      expect(result).assertEqual(172);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(172 - 0) + '='.repeat(0))), String(129));
      expect(ResourceUtils.decodedByteLength('A'.repeat(172 - 0) + '='.repeat(0))).assertEqual(129);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110030 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110031
     * @tc.number SUB_RESMGR_UTILS_11_0031
     * @tc.desc   expectedBase64Length(130) is 176
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110031 begin');
      const result: number = ResourceUtils.expectedBase64Length(130);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(176));
      expect(result).assertEqual(176);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(176 - 2) + '='.repeat(2))), String(130));
      expect(ResourceUtils.decodedByteLength('A'.repeat(176 - 2) + '='.repeat(2))).assertEqual(130);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110031 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110032
     * @tc.number SUB_RESMGR_UTILS_11_0032
     * @tc.desc   expectedBase64Length(131) is 176
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110032 begin');
      const result: number = ResourceUtils.expectedBase64Length(131);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(176));
      expect(result).assertEqual(176);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(176 - 1) + '='.repeat(1))), String(131));
      expect(ResourceUtils.decodedByteLength('A'.repeat(176 - 1) + '='.repeat(1))).assertEqual(131);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110032 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110033
     * @tc.number SUB_RESMGR_UTILS_11_0033
     * @tc.desc   expectedBase64Length(132) is 176
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110033 begin');
      const result: number = ResourceUtils.expectedBase64Length(132);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(176));
      expect(result).assertEqual(176);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(176 - 0) + '='.repeat(0))), String(132));
      expect(ResourceUtils.decodedByteLength('A'.repeat(176 - 0) + '='.repeat(0))).assertEqual(132);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110033 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110034
     * @tc.number SUB_RESMGR_UTILS_11_0034
     * @tc.desc   expectedBase64Length(133) is 180
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110034 begin');
      const result: number = ResourceUtils.expectedBase64Length(133);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(180));
      expect(result).assertEqual(180);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(180 - 2) + '='.repeat(2))), String(133));
      expect(ResourceUtils.decodedByteLength('A'.repeat(180 - 2) + '='.repeat(2))).assertEqual(133);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110034 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110035
     * @tc.number SUB_RESMGR_UTILS_11_0035
     * @tc.desc   expectedBase64Length(134) is 180
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110035 begin');
      const result: number = ResourceUtils.expectedBase64Length(134);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(180));
      expect(result).assertEqual(180);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(180 - 1) + '='.repeat(1))), String(134));
      expect(ResourceUtils.decodedByteLength('A'.repeat(180 - 1) + '='.repeat(1))).assertEqual(134);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110035 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110036
     * @tc.number SUB_RESMGR_UTILS_11_0036
     * @tc.desc   expectedBase64Length(135) is 180
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110036 begin');
      const result: number = ResourceUtils.expectedBase64Length(135);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(180));
      expect(result).assertEqual(180);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(180 - 0) + '='.repeat(0))), String(135));
      expect(ResourceUtils.decodedByteLength('A'.repeat(180 - 0) + '='.repeat(0))).assertEqual(135);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110036 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110037
     * @tc.number SUB_RESMGR_UTILS_11_0037
     * @tc.desc   expectedBase64Length(136) is 184
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110037 begin');
      const result: number = ResourceUtils.expectedBase64Length(136);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(184));
      expect(result).assertEqual(184);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(184 - 2) + '='.repeat(2))), String(136));
      expect(ResourceUtils.decodedByteLength('A'.repeat(184 - 2) + '='.repeat(2))).assertEqual(136);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110037 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110038
     * @tc.number SUB_RESMGR_UTILS_11_0038
     * @tc.desc   expectedBase64Length(137) is 184
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110038 begin');
      const result: number = ResourceUtils.expectedBase64Length(137);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(184));
      expect(result).assertEqual(184);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(184 - 1) + '='.repeat(1))), String(137));
      expect(ResourceUtils.decodedByteLength('A'.repeat(184 - 1) + '='.repeat(1))).assertEqual(137);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110038 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110039
     * @tc.number SUB_RESMGR_UTILS_11_0039
     * @tc.desc   expectedBase64Length(138) is 184
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110039 begin');
      const result: number = ResourceUtils.expectedBase64Length(138);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(184));
      expect(result).assertEqual(184);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(184 - 0) + '='.repeat(0))), String(138));
      expect(ResourceUtils.decodedByteLength('A'.repeat(184 - 0) + '='.repeat(0))).assertEqual(138);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110039 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110040
     * @tc.number SUB_RESMGR_UTILS_11_0040
     * @tc.desc   expectedBase64Length(139) is 188
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110040 begin');
      const result: number = ResourceUtils.expectedBase64Length(139);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(188));
      expect(result).assertEqual(188);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(188 - 2) + '='.repeat(2))), String(139));
      expect(ResourceUtils.decodedByteLength('A'.repeat(188 - 2) + '='.repeat(2))).assertEqual(139);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110040 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110041
     * @tc.number SUB_RESMGR_UTILS_11_0041
     * @tc.desc   expectedBase64Length(140) is 188
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110041 begin');
      const result: number = ResourceUtils.expectedBase64Length(140);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(188));
      expect(result).assertEqual(188);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(188 - 1) + '='.repeat(1))), String(140));
      expect(ResourceUtils.decodedByteLength('A'.repeat(188 - 1) + '='.repeat(1))).assertEqual(140);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110041 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110042
     * @tc.number SUB_RESMGR_UTILS_11_0042
     * @tc.desc   expectedBase64Length(141) is 188
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110042 begin');
      const result: number = ResourceUtils.expectedBase64Length(141);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(188));
      expect(result).assertEqual(188);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(188 - 0) + '='.repeat(0))), String(141));
      expect(ResourceUtils.decodedByteLength('A'.repeat(188 - 0) + '='.repeat(0))).assertEqual(141);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110042 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110043
     * @tc.number SUB_RESMGR_UTILS_11_0043
     * @tc.desc   expectedBase64Length(142) is 192
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110043 begin');
      const result: number = ResourceUtils.expectedBase64Length(142);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(192));
      expect(result).assertEqual(192);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(192 - 2) + '='.repeat(2))), String(142));
      expect(ResourceUtils.decodedByteLength('A'.repeat(192 - 2) + '='.repeat(2))).assertEqual(142);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110043 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110044
     * @tc.number SUB_RESMGR_UTILS_11_0044
     * @tc.desc   expectedBase64Length(143) is 192
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110044 begin');
      const result: number = ResourceUtils.expectedBase64Length(143);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(192));
      expect(result).assertEqual(192);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(192 - 1) + '='.repeat(1))), String(143));
      expect(ResourceUtils.decodedByteLength('A'.repeat(192 - 1) + '='.repeat(1))).assertEqual(143);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110044 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110045
     * @tc.number SUB_RESMGR_UTILS_11_0045
     * @tc.desc   expectedBase64Length(144) is 192
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110045 begin');
      const result: number = ResourceUtils.expectedBase64Length(144);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(192));
      expect(result).assertEqual(192);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(192 - 0) + '='.repeat(0))), String(144));
      expect(ResourceUtils.decodedByteLength('A'.repeat(192 - 0) + '='.repeat(0))).assertEqual(144);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110045 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110046
     * @tc.number SUB_RESMGR_UTILS_11_0046
     * @tc.desc   expectedBase64Length(145) is 196
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110046 begin');
      const result: number = ResourceUtils.expectedBase64Length(145);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(196));
      expect(result).assertEqual(196);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(196 - 2) + '='.repeat(2))), String(145));
      expect(ResourceUtils.decodedByteLength('A'.repeat(196 - 2) + '='.repeat(2))).assertEqual(145);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110046 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110047
     * @tc.number SUB_RESMGR_UTILS_11_0047
     * @tc.desc   expectedBase64Length(146) is 196
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110047 begin');
      const result: number = ResourceUtils.expectedBase64Length(146);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(196));
      expect(result).assertEqual(196);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(196 - 1) + '='.repeat(1))), String(146));
      expect(ResourceUtils.decodedByteLength('A'.repeat(196 - 1) + '='.repeat(1))).assertEqual(146);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110047 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110048
     * @tc.number SUB_RESMGR_UTILS_11_0048
     * @tc.desc   expectedBase64Length(147) is 196
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110048 begin');
      const result: number = ResourceUtils.expectedBase64Length(147);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(196));
      expect(result).assertEqual(196);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(196 - 0) + '='.repeat(0))), String(147));
      expect(ResourceUtils.decodedByteLength('A'.repeat(196 - 0) + '='.repeat(0))).assertEqual(147);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110048 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110049
     * @tc.number SUB_RESMGR_UTILS_11_0049
     * @tc.desc   expectedBase64Length(148) is 200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110049 begin');
      const result: number = ResourceUtils.expectedBase64Length(148);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(200));
      expect(result).assertEqual(200);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(200 - 2) + '='.repeat(2))), String(148));
      expect(ResourceUtils.decodedByteLength('A'.repeat(200 - 2) + '='.repeat(2))).assertEqual(148);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110049 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110050
     * @tc.number SUB_RESMGR_UTILS_11_0050
     * @tc.desc   expectedBase64Length(149) is 200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110050 begin');
      const result: number = ResourceUtils.expectedBase64Length(149);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(200));
      expect(result).assertEqual(200);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(200 - 1) + '='.repeat(1))), String(149));
      expect(ResourceUtils.decodedByteLength('A'.repeat(200 - 1) + '='.repeat(1))).assertEqual(149);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110050 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110051
     * @tc.number SUB_RESMGR_UTILS_11_0051
     * @tc.desc   expectedBase64Length(150) is 200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110051 begin');
      const result: number = ResourceUtils.expectedBase64Length(150);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(200));
      expect(result).assertEqual(200);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(200 - 0) + '='.repeat(0))), String(150));
      expect(ResourceUtils.decodedByteLength('A'.repeat(200 - 0) + '='.repeat(0))).assertEqual(150);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110051 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110052
     * @tc.number SUB_RESMGR_UTILS_11_0052
     * @tc.desc   expectedBase64Length(151) is 204
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110052 begin');
      const result: number = ResourceUtils.expectedBase64Length(151);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(204));
      expect(result).assertEqual(204);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(204 - 2) + '='.repeat(2))), String(151));
      expect(ResourceUtils.decodedByteLength('A'.repeat(204 - 2) + '='.repeat(2))).assertEqual(151);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110052 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110053
     * @tc.number SUB_RESMGR_UTILS_11_0053
     * @tc.desc   expectedBase64Length(152) is 204
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110053 begin');
      const result: number = ResourceUtils.expectedBase64Length(152);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(204));
      expect(result).assertEqual(204);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(204 - 1) + '='.repeat(1))), String(152));
      expect(ResourceUtils.decodedByteLength('A'.repeat(204 - 1) + '='.repeat(1))).assertEqual(152);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110053 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110054
     * @tc.number SUB_RESMGR_UTILS_11_0054
     * @tc.desc   expectedBase64Length(153) is 204
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110054 begin');
      const result: number = ResourceUtils.expectedBase64Length(153);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(204));
      expect(result).assertEqual(204);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(204 - 0) + '='.repeat(0))), String(153));
      expect(ResourceUtils.decodedByteLength('A'.repeat(204 - 0) + '='.repeat(0))).assertEqual(153);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110054 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110055
     * @tc.number SUB_RESMGR_UTILS_11_0055
     * @tc.desc   expectedBase64Length(154) is 208
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110055 begin');
      const result: number = ResourceUtils.expectedBase64Length(154);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(208));
      expect(result).assertEqual(208);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(208 - 2) + '='.repeat(2))), String(154));
      expect(ResourceUtils.decodedByteLength('A'.repeat(208 - 2) + '='.repeat(2))).assertEqual(154);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110055 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110056
     * @tc.number SUB_RESMGR_UTILS_11_0056
     * @tc.desc   expectedBase64Length(155) is 208
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110056 begin');
      const result: number = ResourceUtils.expectedBase64Length(155);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(208));
      expect(result).assertEqual(208);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(208 - 1) + '='.repeat(1))), String(155));
      expect(ResourceUtils.decodedByteLength('A'.repeat(208 - 1) + '='.repeat(1))).assertEqual(155);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110056 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110057
     * @tc.number SUB_RESMGR_UTILS_11_0057
     * @tc.desc   expectedBase64Length(156) is 208
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110057 begin');
      const result: number = ResourceUtils.expectedBase64Length(156);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(208));
      expect(result).assertEqual(208);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(208 - 0) + '='.repeat(0))), String(156));
      expect(ResourceUtils.decodedByteLength('A'.repeat(208 - 0) + '='.repeat(0))).assertEqual(156);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110057 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110058
     * @tc.number SUB_RESMGR_UTILS_11_0058
     * @tc.desc   expectedBase64Length(157) is 212
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110058 begin');
      const result: number = ResourceUtils.expectedBase64Length(157);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(212));
      expect(result).assertEqual(212);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(212 - 2) + '='.repeat(2))), String(157));
      expect(ResourceUtils.decodedByteLength('A'.repeat(212 - 2) + '='.repeat(2))).assertEqual(157);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110058 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110059
     * @tc.number SUB_RESMGR_UTILS_11_0059
     * @tc.desc   expectedBase64Length(158) is 212
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110059 begin');
      const result: number = ResourceUtils.expectedBase64Length(158);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(212));
      expect(result).assertEqual(212);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(212 - 1) + '='.repeat(1))), String(158));
      expect(ResourceUtils.decodedByteLength('A'.repeat(212 - 1) + '='.repeat(1))).assertEqual(158);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110059 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110060
     * @tc.number SUB_RESMGR_UTILS_11_0060
     * @tc.desc   expectedBase64Length(159) is 212
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110060 begin');
      const result: number = ResourceUtils.expectedBase64Length(159);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(212));
      expect(result).assertEqual(212);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(212 - 0) + '='.repeat(0))), String(159));
      expect(ResourceUtils.decodedByteLength('A'.repeat(212 - 0) + '='.repeat(0))).assertEqual(159);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110060 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110061
     * @tc.number SUB_RESMGR_UTILS_11_0061
     * @tc.desc   expectedBase64Length(160) is 216
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110061 begin');
      const result: number = ResourceUtils.expectedBase64Length(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(216));
      expect(result).assertEqual(216);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(216 - 2) + '='.repeat(2))), String(160));
      expect(ResourceUtils.decodedByteLength('A'.repeat(216 - 2) + '='.repeat(2))).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110061 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110062
     * @tc.number SUB_RESMGR_UTILS_11_0062
     * @tc.desc   expectedBase64Length(161) is 216
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110062 begin');
      const result: number = ResourceUtils.expectedBase64Length(161);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(216));
      expect(result).assertEqual(216);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(216 - 1) + '='.repeat(1))), String(161));
      expect(ResourceUtils.decodedByteLength('A'.repeat(216 - 1) + '='.repeat(1))).assertEqual(161);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110062 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110063
     * @tc.number SUB_RESMGR_UTILS_11_0063
     * @tc.desc   expectedBase64Length(162) is 216
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110063 begin');
      const result: number = ResourceUtils.expectedBase64Length(162);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(216));
      expect(result).assertEqual(216);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(216 - 0) + '='.repeat(0))), String(162));
      expect(ResourceUtils.decodedByteLength('A'.repeat(216 - 0) + '='.repeat(0))).assertEqual(162);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110063 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110064
     * @tc.number SUB_RESMGR_UTILS_11_0064
     * @tc.desc   expectedBase64Length(163) is 220
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110064 begin');
      const result: number = ResourceUtils.expectedBase64Length(163);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(220));
      expect(result).assertEqual(220);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(220 - 2) + '='.repeat(2))), String(163));
      expect(ResourceUtils.decodedByteLength('A'.repeat(220 - 2) + '='.repeat(2))).assertEqual(163);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110064 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110065
     * @tc.number SUB_RESMGR_UTILS_11_0065
     * @tc.desc   expectedBase64Length(164) is 220
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110065 begin');
      const result: number = ResourceUtils.expectedBase64Length(164);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(220));
      expect(result).assertEqual(220);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(220 - 1) + '='.repeat(1))), String(164));
      expect(ResourceUtils.decodedByteLength('A'.repeat(220 - 1) + '='.repeat(1))).assertEqual(164);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110065 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110066
     * @tc.number SUB_RESMGR_UTILS_11_0066
     * @tc.desc   expectedBase64Length(165) is 220
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110066 begin');
      const result: number = ResourceUtils.expectedBase64Length(165);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(220));
      expect(result).assertEqual(220);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(220 - 0) + '='.repeat(0))), String(165));
      expect(ResourceUtils.decodedByteLength('A'.repeat(220 - 0) + '='.repeat(0))).assertEqual(165);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110066 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110067
     * @tc.number SUB_RESMGR_UTILS_11_0067
     * @tc.desc   expectedBase64Length(166) is 224
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110067 begin');
      const result: number = ResourceUtils.expectedBase64Length(166);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(224));
      expect(result).assertEqual(224);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(224 - 2) + '='.repeat(2))), String(166));
      expect(ResourceUtils.decodedByteLength('A'.repeat(224 - 2) + '='.repeat(2))).assertEqual(166);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110067 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110068
     * @tc.number SUB_RESMGR_UTILS_11_0068
     * @tc.desc   expectedBase64Length(167) is 224
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110068 begin');
      const result: number = ResourceUtils.expectedBase64Length(167);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(224));
      expect(result).assertEqual(224);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(224 - 1) + '='.repeat(1))), String(167));
      expect(ResourceUtils.decodedByteLength('A'.repeat(224 - 1) + '='.repeat(1))).assertEqual(167);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110068 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110069
     * @tc.number SUB_RESMGR_UTILS_11_0069
     * @tc.desc   expectedBase64Length(168) is 224
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110069 begin');
      const result: number = ResourceUtils.expectedBase64Length(168);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(224));
      expect(result).assertEqual(224);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(224 - 0) + '='.repeat(0))), String(168));
      expect(ResourceUtils.decodedByteLength('A'.repeat(224 - 0) + '='.repeat(0))).assertEqual(168);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110069 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110070
     * @tc.number SUB_RESMGR_UTILS_11_0070
     * @tc.desc   expectedBase64Length(169) is 228
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110070 begin');
      const result: number = ResourceUtils.expectedBase64Length(169);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(228));
      expect(result).assertEqual(228);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(228 - 2) + '='.repeat(2))), String(169));
      expect(ResourceUtils.decodedByteLength('A'.repeat(228 - 2) + '='.repeat(2))).assertEqual(169);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110070 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110071
     * @tc.number SUB_RESMGR_UTILS_11_0071
     * @tc.desc   expectedBase64Length(170) is 228
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110071 begin');
      const result: number = ResourceUtils.expectedBase64Length(170);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(228));
      expect(result).assertEqual(228);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(228 - 1) + '='.repeat(1))), String(170));
      expect(ResourceUtils.decodedByteLength('A'.repeat(228 - 1) + '='.repeat(1))).assertEqual(170);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110071 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110072
     * @tc.number SUB_RESMGR_UTILS_11_0072
     * @tc.desc   expectedBase64Length(171) is 228
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110072 begin');
      const result: number = ResourceUtils.expectedBase64Length(171);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(228));
      expect(result).assertEqual(228);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(228 - 0) + '='.repeat(0))), String(171));
      expect(ResourceUtils.decodedByteLength('A'.repeat(228 - 0) + '='.repeat(0))).assertEqual(171);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110072 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110073
     * @tc.number SUB_RESMGR_UTILS_11_0073
     * @tc.desc   expectedBase64Length(172) is 232
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110073 begin');
      const result: number = ResourceUtils.expectedBase64Length(172);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(232));
      expect(result).assertEqual(232);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(232 - 2) + '='.repeat(2))), String(172));
      expect(ResourceUtils.decodedByteLength('A'.repeat(232 - 2) + '='.repeat(2))).assertEqual(172);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110073 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110074
     * @tc.number SUB_RESMGR_UTILS_11_0074
     * @tc.desc   expectedBase64Length(173) is 232
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110074 begin');
      const result: number = ResourceUtils.expectedBase64Length(173);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(232));
      expect(result).assertEqual(232);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(232 - 1) + '='.repeat(1))), String(173));
      expect(ResourceUtils.decodedByteLength('A'.repeat(232 - 1) + '='.repeat(1))).assertEqual(173);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110074 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110075
     * @tc.number SUB_RESMGR_UTILS_11_0075
     * @tc.desc   expectedBase64Length(174) is 232
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110075 begin');
      const result: number = ResourceUtils.expectedBase64Length(174);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(232));
      expect(result).assertEqual(232);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(232 - 0) + '='.repeat(0))), String(174));
      expect(ResourceUtils.decodedByteLength('A'.repeat(232 - 0) + '='.repeat(0))).assertEqual(174);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110075 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110076
     * @tc.number SUB_RESMGR_UTILS_11_0076
     * @tc.desc   expectedBase64Length(175) is 236
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110076 begin');
      const result: number = ResourceUtils.expectedBase64Length(175);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(236));
      expect(result).assertEqual(236);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(236 - 2) + '='.repeat(2))), String(175));
      expect(ResourceUtils.decodedByteLength('A'.repeat(236 - 2) + '='.repeat(2))).assertEqual(175);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110076 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110077
     * @tc.number SUB_RESMGR_UTILS_11_0077
     * @tc.desc   expectedBase64Length(176) is 236
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110077 begin');
      const result: number = ResourceUtils.expectedBase64Length(176);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(236));
      expect(result).assertEqual(236);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(236 - 1) + '='.repeat(1))), String(176));
      expect(ResourceUtils.decodedByteLength('A'.repeat(236 - 1) + '='.repeat(1))).assertEqual(176);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110077 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110078
     * @tc.number SUB_RESMGR_UTILS_11_0078
     * @tc.desc   expectedBase64Length(177) is 236
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110078 begin');
      const result: number = ResourceUtils.expectedBase64Length(177);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(236));
      expect(result).assertEqual(236);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(236 - 0) + '='.repeat(0))), String(177));
      expect(ResourceUtils.decodedByteLength('A'.repeat(236 - 0) + '='.repeat(0))).assertEqual(177);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110078 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110079
     * @tc.number SUB_RESMGR_UTILS_11_0079
     * @tc.desc   expectedBase64Length(178) is 240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110079 begin');
      const result: number = ResourceUtils.expectedBase64Length(178);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(240));
      expect(result).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(240 - 2) + '='.repeat(2))), String(178));
      expect(ResourceUtils.decodedByteLength('A'.repeat(240 - 2) + '='.repeat(2))).assertEqual(178);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110079 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110080
     * @tc.number SUB_RESMGR_UTILS_11_0080
     * @tc.desc   expectedBase64Length(179) is 240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110080 begin');
      const result: number = ResourceUtils.expectedBase64Length(179);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(240));
      expect(result).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(240 - 1) + '='.repeat(1))), String(179));
      expect(ResourceUtils.decodedByteLength('A'.repeat(240 - 1) + '='.repeat(1))).assertEqual(179);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110080 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110081
     * @tc.number SUB_RESMGR_UTILS_11_0081
     * @tc.desc   expectedBase64Length(180) is 240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110081 begin');
      const result: number = ResourceUtils.expectedBase64Length(180);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(240));
      expect(result).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(240 - 0) + '='.repeat(0))), String(180));
      expect(ResourceUtils.decodedByteLength('A'.repeat(240 - 0) + '='.repeat(0))).assertEqual(180);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110081 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110082
     * @tc.number SUB_RESMGR_UTILS_11_0082
     * @tc.desc   expectedBase64Length(181) is 244
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110082 begin');
      const result: number = ResourceUtils.expectedBase64Length(181);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(244));
      expect(result).assertEqual(244);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(244 - 2) + '='.repeat(2))), String(181));
      expect(ResourceUtils.decodedByteLength('A'.repeat(244 - 2) + '='.repeat(2))).assertEqual(181);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110082 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110083
     * @tc.number SUB_RESMGR_UTILS_11_0083
     * @tc.desc   expectedBase64Length(182) is 244
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110083 begin');
      const result: number = ResourceUtils.expectedBase64Length(182);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(244));
      expect(result).assertEqual(244);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(244 - 1) + '='.repeat(1))), String(182));
      expect(ResourceUtils.decodedByteLength('A'.repeat(244 - 1) + '='.repeat(1))).assertEqual(182);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110083 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110084
     * @tc.number SUB_RESMGR_UTILS_11_0084
     * @tc.desc   expectedBase64Length(183) is 244
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110084 begin');
      const result: number = ResourceUtils.expectedBase64Length(183);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(244));
      expect(result).assertEqual(244);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(244 - 0) + '='.repeat(0))), String(183));
      expect(ResourceUtils.decodedByteLength('A'.repeat(244 - 0) + '='.repeat(0))).assertEqual(183);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110084 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110085
     * @tc.number SUB_RESMGR_UTILS_11_0085
     * @tc.desc   expectedBase64Length(184) is 248
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110085 begin');
      const result: number = ResourceUtils.expectedBase64Length(184);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(248));
      expect(result).assertEqual(248);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(248 - 2) + '='.repeat(2))), String(184));
      expect(ResourceUtils.decodedByteLength('A'.repeat(248 - 2) + '='.repeat(2))).assertEqual(184);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110085 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110086
     * @tc.number SUB_RESMGR_UTILS_11_0086
     * @tc.desc   expectedBase64Length(185) is 248
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110086 begin');
      const result: number = ResourceUtils.expectedBase64Length(185);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(248));
      expect(result).assertEqual(248);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(248 - 1) + '='.repeat(1))), String(185));
      expect(ResourceUtils.decodedByteLength('A'.repeat(248 - 1) + '='.repeat(1))).assertEqual(185);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110086 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110087
     * @tc.number SUB_RESMGR_UTILS_11_0087
     * @tc.desc   expectedBase64Length(186) is 248
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110087 begin');
      const result: number = ResourceUtils.expectedBase64Length(186);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(248));
      expect(result).assertEqual(248);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(248 - 0) + '='.repeat(0))), String(186));
      expect(ResourceUtils.decodedByteLength('A'.repeat(248 - 0) + '='.repeat(0))).assertEqual(186);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110087 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110088
     * @tc.number SUB_RESMGR_UTILS_11_0088
     * @tc.desc   expectedBase64Length(187) is 252
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110088 begin');
      const result: number = ResourceUtils.expectedBase64Length(187);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(252));
      expect(result).assertEqual(252);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(252 - 2) + '='.repeat(2))), String(187));
      expect(ResourceUtils.decodedByteLength('A'.repeat(252 - 2) + '='.repeat(2))).assertEqual(187);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110088 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110089
     * @tc.number SUB_RESMGR_UTILS_11_0089
     * @tc.desc   expectedBase64Length(188) is 252
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110089 begin');
      const result: number = ResourceUtils.expectedBase64Length(188);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(252));
      expect(result).assertEqual(252);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(252 - 1) + '='.repeat(1))), String(188));
      expect(ResourceUtils.decodedByteLength('A'.repeat(252 - 1) + '='.repeat(1))).assertEqual(188);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110089 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110090
     * @tc.number SUB_RESMGR_UTILS_11_0090
     * @tc.desc   expectedBase64Length(189) is 252
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110090 begin');
      const result: number = ResourceUtils.expectedBase64Length(189);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(252));
      expect(result).assertEqual(252);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(252 - 0) + '='.repeat(0))), String(189));
      expect(ResourceUtils.decodedByteLength('A'.repeat(252 - 0) + '='.repeat(0))).assertEqual(189);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110090 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110091
     * @tc.number SUB_RESMGR_UTILS_11_0091
     * @tc.desc   expectedBase64Length(190) is 256
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110091 begin');
      const result: number = ResourceUtils.expectedBase64Length(190);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(256));
      expect(result).assertEqual(256);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(256 - 2) + '='.repeat(2))), String(190));
      expect(ResourceUtils.decodedByteLength('A'.repeat(256 - 2) + '='.repeat(2))).assertEqual(190);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110091 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110092
     * @tc.number SUB_RESMGR_UTILS_11_0092
     * @tc.desc   expectedBase64Length(191) is 256
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110092 begin');
      const result: number = ResourceUtils.expectedBase64Length(191);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(256));
      expect(result).assertEqual(256);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(256 - 1) + '='.repeat(1))), String(191));
      expect(ResourceUtils.decodedByteLength('A'.repeat(256 - 1) + '='.repeat(1))).assertEqual(191);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110092 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110093
     * @tc.number SUB_RESMGR_UTILS_11_0093
     * @tc.desc   expectedBase64Length(192) is 256
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110093 begin');
      const result: number = ResourceUtils.expectedBase64Length(192);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(256));
      expect(result).assertEqual(256);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(256 - 0) + '='.repeat(0))), String(192));
      expect(ResourceUtils.decodedByteLength('A'.repeat(256 - 0) + '='.repeat(0))).assertEqual(192);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110093 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110094
     * @tc.number SUB_RESMGR_UTILS_11_0094
     * @tc.desc   expectedBase64Length(193) is 260
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110094 begin');
      const result: number = ResourceUtils.expectedBase64Length(193);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(260));
      expect(result).assertEqual(260);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(260 - 2) + '='.repeat(2))), String(193));
      expect(ResourceUtils.decodedByteLength('A'.repeat(260 - 2) + '='.repeat(2))).assertEqual(193);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110094 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B110095
     * @tc.number SUB_RESMGR_UTILS_11_0095
     * @tc.desc   expectedBase64Length(194) is 260
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B110095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110095 begin');
      const result: number = ResourceUtils.expectedBase64Length(194);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(260));
      expect(result).assertEqual(260);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(260 - 1) + '='.repeat(1))), String(194));
      expect(ResourceUtils.decodedByteLength('A'.repeat(260 - 1) + '='.repeat(1))).assertEqual(194);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B110095 end');
    })

    /**
     * @tc.name   testResourceUtilsB64B1196
     * @tc.number SUB_RESMGR_UTILS_11_0096
     * @tc.desc   3 字节一组的补齐规律
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64B1196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B1196 begin');
      expect(ResourceUtils.expectedBase64Length(1)).assertEqual(4);
      expect(ResourceUtils.expectedBase64Length(3)).assertEqual(4);
      expect(ResourceUtils.expectedBase64Length(4)).assertEqual(8);
      expect(ResourceUtils.expectedBase64Length(6)).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64B1196 end');
    })
  })
}
