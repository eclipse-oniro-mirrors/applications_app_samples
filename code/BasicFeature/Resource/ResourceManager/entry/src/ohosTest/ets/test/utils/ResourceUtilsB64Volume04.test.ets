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

export default function resourceUtilsB64Test() {
  describe('ResourceUtilsB64Test', () => {

    /**
     * @tc.name   testResourceUtilsB64Pad0001
     * @tc.number SUB_RESMGR_UTILS_04_0001
     * @tc.desc   expectedBase64Length(-10) is 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64Pad0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0001 begin');
      const result: number = ResourceUtils.expectedBase64Length(-10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('')), String(-1));
      expect(ResourceUtils.decodedByteLength('')).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0001 end');
    })

    /**
     * @tc.name   testResourceUtilsB64Pad0002
     * @tc.number SUB_RESMGR_UTILS_04_0002
     * @tc.desc   expectedBase64Length(-3) is 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64Pad0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0002 begin');
      const result: number = ResourceUtils.expectedBase64Length(-3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('')), String(-1));
      expect(ResourceUtils.decodedByteLength('')).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0002 end');
    })

    /**
     * @tc.name   testResourceUtilsB64Pad0003
     * @tc.number SUB_RESMGR_UTILS_04_0003
     * @tc.desc   expectedBase64Length(-1) is 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64Pad0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0003 begin');
      const result: number = ResourceUtils.expectedBase64Length(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('')), String(-1));
      expect(ResourceUtils.decodedByteLength('')).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0003 end');
    })

    /**
     * @tc.name   testResourceUtilsB64Pad0004
     * @tc.number SUB_RESMGR_UTILS_04_0004
     * @tc.desc   expectedBase64Length(0) is 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64Pad0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0004 begin');
      const result: number = ResourceUtils.expectedBase64Length(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('')), String(-1));
      expect(ResourceUtils.decodedByteLength('')).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0004 end');
    })

    /**
     * @tc.name   testResourceUtilsB64Pad0005
     * @tc.number SUB_RESMGR_UTILS_04_0005
     * @tc.desc   expectedBase64Length(0.5) is 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64Pad0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0005 begin');
      const result: number = ResourceUtils.expectedBase64Length(0.5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('')), String(-1));
      expect(ResourceUtils.decodedByteLength('')).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0005 end');
    })

    /**
     * @tc.name   testResourceUtilsB64Pad0006
     * @tc.number SUB_RESMGR_UTILS_04_0006
     * @tc.desc   expectedBase64Length(1.5) is 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64Pad0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0006 begin');
      const result: number = ResourceUtils.expectedBase64Length(1.5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('')), String(-1));
      expect(ResourceUtils.decodedByteLength('')).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0006 end');
    })

    /**
     * @tc.name   testResourceUtilsB64Pad0007
     * @tc.number SUB_RESMGR_UTILS_04_0007
     * @tc.desc   expectedBase64Length(2.5) is 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64Pad0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0007 begin');
      const result: number = ResourceUtils.expectedBase64Length(2.5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('')), String(-1));
      expect(ResourceUtils.decodedByteLength('')).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0007 end');
    })

    /**
     * @tc.name   testResourceUtilsB64Pad0008
     * @tc.number SUB_RESMGR_UTILS_04_0008
     * @tc.desc   expectedBase64Length(1) is 4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64Pad0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0008 begin');
      const result: number = ResourceUtils.expectedBase64Length(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(4));
      expect(result).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(4 - 2) + '='.repeat(2))), String(1));
      expect(ResourceUtils.decodedByteLength('A'.repeat(4 - 2) + '='.repeat(2))).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0008 end');
    })

    /**
     * @tc.name   testResourceUtilsB64Pad0009
     * @tc.number SUB_RESMGR_UTILS_04_0009
     * @tc.desc   expectedBase64Length(2) is 4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64Pad0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0009 begin');
      const result: number = ResourceUtils.expectedBase64Length(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(4));
      expect(result).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(4 - 1) + '='.repeat(1))), String(2));
      expect(ResourceUtils.decodedByteLength('A'.repeat(4 - 1) + '='.repeat(1))).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0009 end');
    })

    /**
     * @tc.name   testResourceUtilsB64Pad0010
     * @tc.number SUB_RESMGR_UTILS_04_0010
     * @tc.desc   expectedBase64Length(3) is 4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64Pad0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0010 begin');
      const result: number = ResourceUtils.expectedBase64Length(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(4));
      expect(result).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(4 - 0) + '='.repeat(0))), String(3));
      expect(ResourceUtils.decodedByteLength('A'.repeat(4 - 0) + '='.repeat(0))).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0010 end');
    })

    /**
     * @tc.name   testResourceUtilsB64Pad0011
     * @tc.number SUB_RESMGR_UTILS_04_0011
     * @tc.desc   expectedBase64Length(4) is 8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64Pad0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0011 begin');
      const result: number = ResourceUtils.expectedBase64Length(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(8));
      expect(result).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(8 - 2) + '='.repeat(2))), String(4));
      expect(ResourceUtils.decodedByteLength('A'.repeat(8 - 2) + '='.repeat(2))).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0011 end');
    })

    /**
     * @tc.name   testResourceUtilsB64Pad0012
     * @tc.number SUB_RESMGR_UTILS_04_0012
     * @tc.desc   expectedBase64Length(5) is 8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64Pad0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0012 begin');
      const result: number = ResourceUtils.expectedBase64Length(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(8));
      expect(result).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(8 - 1) + '='.repeat(1))), String(5));
      expect(ResourceUtils.decodedByteLength('A'.repeat(8 - 1) + '='.repeat(1))).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0012 end');
    })

    /**
     * @tc.name   testResourceUtilsB64Pad0013
     * @tc.number SUB_RESMGR_UTILS_04_0013
     * @tc.desc   expectedBase64Length(6) is 8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64Pad0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0013 begin');
      const result: number = ResourceUtils.expectedBase64Length(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(8));
      expect(result).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(8 - 0) + '='.repeat(0))), String(6));
      expect(ResourceUtils.decodedByteLength('A'.repeat(8 - 0) + '='.repeat(0))).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0013 end');
    })

    /**
     * @tc.name   testResourceUtilsB64Pad0014
     * @tc.number SUB_RESMGR_UTILS_04_0014
     * @tc.desc   expectedBase64Length(7) is 12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64Pad0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0014 begin');
      const result: number = ResourceUtils.expectedBase64Length(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(12));
      expect(result).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(12 - 2) + '='.repeat(2))), String(7));
      expect(ResourceUtils.decodedByteLength('A'.repeat(12 - 2) + '='.repeat(2))).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0014 end');
    })

    /**
     * @tc.name   testResourceUtilsB64Pad0015
     * @tc.number SUB_RESMGR_UTILS_04_0015
     * @tc.desc   expectedBase64Length(8) is 12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64Pad0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0015 begin');
      const result: number = ResourceUtils.expectedBase64Length(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(12));
      expect(result).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(12 - 1) + '='.repeat(1))), String(8));
      expect(ResourceUtils.decodedByteLength('A'.repeat(12 - 1) + '='.repeat(1))).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0015 end');
    })

    /**
     * @tc.name   testResourceUtilsB64Pad0016
     * @tc.number SUB_RESMGR_UTILS_04_0016
     * @tc.desc   expectedBase64Length(9) is 12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64Pad0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0016 begin');
      const result: number = ResourceUtils.expectedBase64Length(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(12));
      expect(result).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(12 - 0) + '='.repeat(0))), String(9));
      expect(ResourceUtils.decodedByteLength('A'.repeat(12 - 0) + '='.repeat(0))).assertEqual(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0016 end');
    })

    /**
     * @tc.name   testResourceUtilsB64Pad0017
     * @tc.number SUB_RESMGR_UTILS_04_0017
     * @tc.desc   expectedBase64Length(10) is 16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64Pad0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0017 begin');
      const result: number = ResourceUtils.expectedBase64Length(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(16));
      expect(result).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(16 - 2) + '='.repeat(2))), String(10));
      expect(ResourceUtils.decodedByteLength('A'.repeat(16 - 2) + '='.repeat(2))).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0017 end');
    })

    /**
     * @tc.name   testResourceUtilsB64Pad0018
     * @tc.number SUB_RESMGR_UTILS_04_0018
     * @tc.desc   expectedBase64Length(11) is 16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64Pad0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0018 begin');
      const result: number = ResourceUtils.expectedBase64Length(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(16));
      expect(result).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(16 - 1) + '='.repeat(1))), String(11));
      expect(ResourceUtils.decodedByteLength('A'.repeat(16 - 1) + '='.repeat(1))).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0018 end');
    })

    /**
     * @tc.name   testResourceUtilsB64Pad0019
     * @tc.number SUB_RESMGR_UTILS_04_0019
     * @tc.desc   expectedBase64Length(12) is 16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64Pad0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0019 begin');
      const result: number = ResourceUtils.expectedBase64Length(12);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(16));
      expect(result).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(16 - 0) + '='.repeat(0))), String(12));
      expect(ResourceUtils.decodedByteLength('A'.repeat(16 - 0) + '='.repeat(0))).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0019 end');
    })

    /**
     * @tc.name   testResourceUtilsB64Pad0020
     * @tc.number SUB_RESMGR_UTILS_04_0020
     * @tc.desc   expectedBase64Length(13) is 20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64Pad0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0020 begin');
      const result: number = ResourceUtils.expectedBase64Length(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(20));
      expect(result).assertEqual(20);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(20 - 2) + '='.repeat(2))), String(13));
      expect(ResourceUtils.decodedByteLength('A'.repeat(20 - 2) + '='.repeat(2))).assertEqual(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0020 end');
    })

    /**
     * @tc.name   testResourceUtilsB64Pad0021
     * @tc.number SUB_RESMGR_UTILS_04_0021
     * @tc.desc   expectedBase64Length(14) is 20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64Pad0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0021 begin');
      const result: number = ResourceUtils.expectedBase64Length(14);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(20));
      expect(result).assertEqual(20);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(20 - 1) + '='.repeat(1))), String(14));
      expect(ResourceUtils.decodedByteLength('A'.repeat(20 - 1) + '='.repeat(1))).assertEqual(14);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0021 end');
    })

    /**
     * @tc.name   testResourceUtilsB64Pad0022
     * @tc.number SUB_RESMGR_UTILS_04_0022
     * @tc.desc   expectedBase64Length(15) is 20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64Pad0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0022 begin');
      const result: number = ResourceUtils.expectedBase64Length(15);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(20));
      expect(result).assertEqual(20);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(20 - 0) + '='.repeat(0))), String(15));
      expect(ResourceUtils.decodedByteLength('A'.repeat(20 - 0) + '='.repeat(0))).assertEqual(15);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0022 end');
    })

    /**
     * @tc.name   testResourceUtilsB64Pad0023
     * @tc.number SUB_RESMGR_UTILS_04_0023
     * @tc.desc   expectedBase64Length(16) is 24
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64Pad0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0023 begin');
      const result: number = ResourceUtils.expectedBase64Length(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(24));
      expect(result).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(24 - 2) + '='.repeat(2))), String(16));
      expect(ResourceUtils.decodedByteLength('A'.repeat(24 - 2) + '='.repeat(2))).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0023 end');
    })

    /**
     * @tc.name   testResourceUtilsB64Pad0024
     * @tc.number SUB_RESMGR_UTILS_04_0024
     * @tc.desc   expectedBase64Length(17) is 24
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64Pad0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0024 begin');
      const result: number = ResourceUtils.expectedBase64Length(17);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(24));
      expect(result).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(24 - 1) + '='.repeat(1))), String(17));
      expect(ResourceUtils.decodedByteLength('A'.repeat(24 - 1) + '='.repeat(1))).assertEqual(17);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0024 end');
    })

    /**
     * @tc.name   testResourceUtilsB64Pad0025
     * @tc.number SUB_RESMGR_UTILS_04_0025
     * @tc.desc   expectedBase64Length(18) is 24
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64Pad0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0025 begin');
      const result: number = ResourceUtils.expectedBase64Length(18);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(24));
      expect(result).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(24 - 0) + '='.repeat(0))), String(18));
      expect(ResourceUtils.decodedByteLength('A'.repeat(24 - 0) + '='.repeat(0))).assertEqual(18);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0025 end');
    })

    /**
     * @tc.name   testResourceUtilsB64Pad0026
     * @tc.number SUB_RESMGR_UTILS_04_0026
     * @tc.desc   expectedBase64Length(19) is 28
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64Pad0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0026 begin');
      const result: number = ResourceUtils.expectedBase64Length(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(28));
      expect(result).assertEqual(28);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(28 - 2) + '='.repeat(2))), String(19));
      expect(ResourceUtils.decodedByteLength('A'.repeat(28 - 2) + '='.repeat(2))).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0026 end');
    })

    /**
     * @tc.name   testResourceUtilsB64Pad0027
     * @tc.number SUB_RESMGR_UTILS_04_0027
     * @tc.desc   expectedBase64Length(20) is 28
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64Pad0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0027 begin');
      const result: number = ResourceUtils.expectedBase64Length(20);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(28));
      expect(result).assertEqual(28);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(28 - 1) + '='.repeat(1))), String(20));
      expect(ResourceUtils.decodedByteLength('A'.repeat(28 - 1) + '='.repeat(1))).assertEqual(20);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0027 end');
    })

    /**
     * @tc.name   testResourceUtilsB64Pad0028
     * @tc.number SUB_RESMGR_UTILS_04_0028
     * @tc.desc   expectedBase64Length(21) is 28
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64Pad0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0028 begin');
      const result: number = ResourceUtils.expectedBase64Length(21);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(28));
      expect(result).assertEqual(28);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(28 - 0) + '='.repeat(0))), String(21));
      expect(ResourceUtils.decodedByteLength('A'.repeat(28 - 0) + '='.repeat(0))).assertEqual(21);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0028 end');
    })

    /**
     * @tc.name   testResourceUtilsB64Pad0029
     * @tc.number SUB_RESMGR_UTILS_04_0029
     * @tc.desc   expectedBase64Length(22) is 32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64Pad0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0029 begin');
      const result: number = ResourceUtils.expectedBase64Length(22);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(32));
      expect(result).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(32 - 2) + '='.repeat(2))), String(22));
      expect(ResourceUtils.decodedByteLength('A'.repeat(32 - 2) + '='.repeat(2))).assertEqual(22);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0029 end');
    })

    /**
     * @tc.name   testResourceUtilsB64Pad0030
     * @tc.number SUB_RESMGR_UTILS_04_0030
     * @tc.desc   expectedBase64Length(23) is 32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64Pad0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0030 begin');
      const result: number = ResourceUtils.expectedBase64Length(23);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(32));
      expect(result).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(32 - 1) + '='.repeat(1))), String(23));
      expect(ResourceUtils.decodedByteLength('A'.repeat(32 - 1) + '='.repeat(1))).assertEqual(23);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0030 end');
    })

    /**
     * @tc.name   testResourceUtilsB64Pad0031
     * @tc.number SUB_RESMGR_UTILS_04_0031
     * @tc.desc   expectedBase64Length(24) is 32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64Pad0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0031 begin');
      const result: number = ResourceUtils.expectedBase64Length(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(32));
      expect(result).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(32 - 0) + '='.repeat(0))), String(24));
      expect(ResourceUtils.decodedByteLength('A'.repeat(32 - 0) + '='.repeat(0))).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0031 end');
    })

    /**
     * @tc.name   testResourceUtilsB64Pad0032
     * @tc.number SUB_RESMGR_UTILS_04_0032
     * @tc.desc   expectedBase64Length(25) is 36
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64Pad0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0032 begin');
      const result: number = ResourceUtils.expectedBase64Length(25);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(36));
      expect(result).assertEqual(36);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(36 - 2) + '='.repeat(2))), String(25));
      expect(ResourceUtils.decodedByteLength('A'.repeat(36 - 2) + '='.repeat(2))).assertEqual(25);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0032 end');
    })

    /**
     * @tc.name   testResourceUtilsB64Pad0033
     * @tc.number SUB_RESMGR_UTILS_04_0033
     * @tc.desc   expectedBase64Length(26) is 36
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64Pad0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0033 begin');
      const result: number = ResourceUtils.expectedBase64Length(26);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(36));
      expect(result).assertEqual(36);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(36 - 1) + '='.repeat(1))), String(26));
      expect(ResourceUtils.decodedByteLength('A'.repeat(36 - 1) + '='.repeat(1))).assertEqual(26);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0033 end');
    })

    /**
     * @tc.name   testResourceUtilsB64Pad0034
     * @tc.number SUB_RESMGR_UTILS_04_0034
     * @tc.desc   expectedBase64Length(27) is 36
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64Pad0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0034 begin');
      const result: number = ResourceUtils.expectedBase64Length(27);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(36));
      expect(result).assertEqual(36);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(36 - 0) + '='.repeat(0))), String(27));
      expect(ResourceUtils.decodedByteLength('A'.repeat(36 - 0) + '='.repeat(0))).assertEqual(27);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0034 end');
    })

    /**
     * @tc.name   testResourceUtilsB64Pad0035
     * @tc.number SUB_RESMGR_UTILS_04_0035
     * @tc.desc   expectedBase64Length(28) is 40
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64Pad0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0035 begin');
      const result: number = ResourceUtils.expectedBase64Length(28);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(40));
      expect(result).assertEqual(40);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(40 - 2) + '='.repeat(2))), String(28));
      expect(ResourceUtils.decodedByteLength('A'.repeat(40 - 2) + '='.repeat(2))).assertEqual(28);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0035 end');
    })

    /**
     * @tc.name   testResourceUtilsB64Pad0036
     * @tc.number SUB_RESMGR_UTILS_04_0036
     * @tc.desc   expectedBase64Length(29) is 40
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64Pad0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0036 begin');
      const result: number = ResourceUtils.expectedBase64Length(29);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(40));
      expect(result).assertEqual(40);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(40 - 1) + '='.repeat(1))), String(29));
      expect(ResourceUtils.decodedByteLength('A'.repeat(40 - 1) + '='.repeat(1))).assertEqual(29);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0036 end');
    })

    /**
     * @tc.name   testResourceUtilsB64Pad0037
     * @tc.number SUB_RESMGR_UTILS_04_0037
     * @tc.desc   expectedBase64Length(30) is 40
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64Pad0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0037 begin');
      const result: number = ResourceUtils.expectedBase64Length(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(40));
      expect(result).assertEqual(40);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(40 - 0) + '='.repeat(0))), String(30));
      expect(ResourceUtils.decodedByteLength('A'.repeat(40 - 0) + '='.repeat(0))).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0037 end');
    })

    /**
     * @tc.name   testResourceUtilsB64Pad0038
     * @tc.number SUB_RESMGR_UTILS_04_0038
     * @tc.desc   expectedBase64Length(31) is 44
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64Pad0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0038 begin');
      const result: number = ResourceUtils.expectedBase64Length(31);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(44));
      expect(result).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(44 - 2) + '='.repeat(2))), String(31));
      expect(ResourceUtils.decodedByteLength('A'.repeat(44 - 2) + '='.repeat(2))).assertEqual(31);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0038 end');
    })

    /**
     * @tc.name   testResourceUtilsB64Pad0039
     * @tc.number SUB_RESMGR_UTILS_04_0039
     * @tc.desc   expectedBase64Length(32) is 44
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64Pad0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0039 begin');
      const result: number = ResourceUtils.expectedBase64Length(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(44));
      expect(result).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(44 - 1) + '='.repeat(1))), String(32));
      expect(ResourceUtils.decodedByteLength('A'.repeat(44 - 1) + '='.repeat(1))).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0039 end');
    })

    /**
     * @tc.name   testResourceUtilsB64Pad0040
     * @tc.number SUB_RESMGR_UTILS_04_0040
     * @tc.desc   expectedBase64Length(33) is 44
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64Pad0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0040 begin');
      const result: number = ResourceUtils.expectedBase64Length(33);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(44));
      expect(result).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(44 - 0) + '='.repeat(0))), String(33));
      expect(ResourceUtils.decodedByteLength('A'.repeat(44 - 0) + '='.repeat(0))).assertEqual(33);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0040 end');
    })

    /**
     * @tc.name   testResourceUtilsB64Pad0041
     * @tc.number SUB_RESMGR_UTILS_04_0041
     * @tc.desc   expectedBase64Length(34) is 48
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64Pad0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0041 begin');
      const result: number = ResourceUtils.expectedBase64Length(34);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(48));
      expect(result).assertEqual(48);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(48 - 2) + '='.repeat(2))), String(34));
      expect(ResourceUtils.decodedByteLength('A'.repeat(48 - 2) + '='.repeat(2))).assertEqual(34);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0041 end');
    })

    /**
     * @tc.name   testResourceUtilsB64Pad0042
     * @tc.number SUB_RESMGR_UTILS_04_0042
     * @tc.desc   expectedBase64Length(35) is 48
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64Pad0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0042 begin');
      const result: number = ResourceUtils.expectedBase64Length(35);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(48));
      expect(result).assertEqual(48);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(48 - 1) + '='.repeat(1))), String(35));
      expect(ResourceUtils.decodedByteLength('A'.repeat(48 - 1) + '='.repeat(1))).assertEqual(35);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0042 end');
    })

    /**
     * @tc.name   testResourceUtilsB64Pad0043
     * @tc.number SUB_RESMGR_UTILS_04_0043
     * @tc.desc   expectedBase64Length(36) is 48
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64Pad0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0043 begin');
      const result: number = ResourceUtils.expectedBase64Length(36);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(48));
      expect(result).assertEqual(48);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(48 - 0) + '='.repeat(0))), String(36));
      expect(ResourceUtils.decodedByteLength('A'.repeat(48 - 0) + '='.repeat(0))).assertEqual(36);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0043 end');
    })

    /**
     * @tc.name   testResourceUtilsB64Pad0044
     * @tc.number SUB_RESMGR_UTILS_04_0044
     * @tc.desc   expectedBase64Length(37) is 52
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64Pad0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0044 begin');
      const result: number = ResourceUtils.expectedBase64Length(37);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(52));
      expect(result).assertEqual(52);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(52 - 2) + '='.repeat(2))), String(37));
      expect(ResourceUtils.decodedByteLength('A'.repeat(52 - 2) + '='.repeat(2))).assertEqual(37);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0044 end');
    })

    /**
     * @tc.name   testResourceUtilsB64Pad0045
     * @tc.number SUB_RESMGR_UTILS_04_0045
     * @tc.desc   expectedBase64Length(38) is 52
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64Pad0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0045 begin');
      const result: number = ResourceUtils.expectedBase64Length(38);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(52));
      expect(result).assertEqual(52);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(52 - 1) + '='.repeat(1))), String(38));
      expect(ResourceUtils.decodedByteLength('A'.repeat(52 - 1) + '='.repeat(1))).assertEqual(38);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0045 end');
    })

    /**
     * @tc.name   testResourceUtilsB64Pad0046
     * @tc.number SUB_RESMGR_UTILS_04_0046
     * @tc.desc   expectedBase64Length(39) is 52
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64Pad0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0046 begin');
      const result: number = ResourceUtils.expectedBase64Length(39);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(52));
      expect(result).assertEqual(52);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(52 - 0) + '='.repeat(0))), String(39));
      expect(ResourceUtils.decodedByteLength('A'.repeat(52 - 0) + '='.repeat(0))).assertEqual(39);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0046 end');
    })

    /**
     * @tc.name   testResourceUtilsB64Pad0047
     * @tc.number SUB_RESMGR_UTILS_04_0047
     * @tc.desc   expectedBase64Length(40) is 56
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64Pad0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0047 begin');
      const result: number = ResourceUtils.expectedBase64Length(40);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(56));
      expect(result).assertEqual(56);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(56 - 2) + '='.repeat(2))), String(40));
      expect(ResourceUtils.decodedByteLength('A'.repeat(56 - 2) + '='.repeat(2))).assertEqual(40);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0047 end');
    })

    /**
     * @tc.name   testResourceUtilsB64Pad0048
     * @tc.number SUB_RESMGR_UTILS_04_0048
     * @tc.desc   expectedBase64Length(41) is 56
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64Pad0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0048 begin');
      const result: number = ResourceUtils.expectedBase64Length(41);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(56));
      expect(result).assertEqual(56);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(56 - 1) + '='.repeat(1))), String(41));
      expect(ResourceUtils.decodedByteLength('A'.repeat(56 - 1) + '='.repeat(1))).assertEqual(41);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0048 end');
    })

    /**
     * @tc.name   testResourceUtilsB64Pad0049
     * @tc.number SUB_RESMGR_UTILS_04_0049
     * @tc.desc   expectedBase64Length(42) is 56
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64Pad0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0049 begin');
      const result: number = ResourceUtils.expectedBase64Length(42);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(56));
      expect(result).assertEqual(56);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(56 - 0) + '='.repeat(0))), String(42));
      expect(ResourceUtils.decodedByteLength('A'.repeat(56 - 0) + '='.repeat(0))).assertEqual(42);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0049 end');
    })

    /**
     * @tc.name   testResourceUtilsB64Pad0050
     * @tc.number SUB_RESMGR_UTILS_04_0050
     * @tc.desc   expectedBase64Length(43) is 60
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64Pad0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0050 begin');
      const result: number = ResourceUtils.expectedBase64Length(43);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(60));
      expect(result).assertEqual(60);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(60 - 2) + '='.repeat(2))), String(43));
      expect(ResourceUtils.decodedByteLength('A'.repeat(60 - 2) + '='.repeat(2))).assertEqual(43);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0050 end');
    })

    /**
     * @tc.name   testResourceUtilsB64Pad0051
     * @tc.number SUB_RESMGR_UTILS_04_0051
     * @tc.desc   expectedBase64Length(44) is 60
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64Pad0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0051 begin');
      const result: number = ResourceUtils.expectedBase64Length(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(60));
      expect(result).assertEqual(60);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(60 - 1) + '='.repeat(1))), String(44));
      expect(ResourceUtils.decodedByteLength('A'.repeat(60 - 1) + '='.repeat(1))).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0051 end');
    })

    /**
     * @tc.name   testResourceUtilsB64Pad0052
     * @tc.number SUB_RESMGR_UTILS_04_0052
     * @tc.desc   expectedBase64Length(45) is 60
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64Pad0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0052 begin');
      const result: number = ResourceUtils.expectedBase64Length(45);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(60));
      expect(result).assertEqual(60);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(60 - 0) + '='.repeat(0))), String(45));
      expect(ResourceUtils.decodedByteLength('A'.repeat(60 - 0) + '='.repeat(0))).assertEqual(45);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0052 end');
    })

    /**
     * @tc.name   testResourceUtilsB64Pad0053
     * @tc.number SUB_RESMGR_UTILS_04_0053
     * @tc.desc   expectedBase64Length(46) is 64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64Pad0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0053 begin');
      const result: number = ResourceUtils.expectedBase64Length(46);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(64));
      expect(result).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(64 - 2) + '='.repeat(2))), String(46));
      expect(ResourceUtils.decodedByteLength('A'.repeat(64 - 2) + '='.repeat(2))).assertEqual(46);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0053 end');
    })

    /**
     * @tc.name   testResourceUtilsB64Pad0054
     * @tc.number SUB_RESMGR_UTILS_04_0054
     * @tc.desc   expectedBase64Length(47) is 64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64Pad0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0054 begin');
      const result: number = ResourceUtils.expectedBase64Length(47);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(64));
      expect(result).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(64 - 1) + '='.repeat(1))), String(47));
      expect(ResourceUtils.decodedByteLength('A'.repeat(64 - 1) + '='.repeat(1))).assertEqual(47);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0054 end');
    })

    /**
     * @tc.name   testResourceUtilsB64Pad0055
     * @tc.number SUB_RESMGR_UTILS_04_0055
     * @tc.desc   expectedBase64Length(48) is 64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64Pad0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0055 begin');
      const result: number = ResourceUtils.expectedBase64Length(48);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(64));
      expect(result).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(64 - 0) + '='.repeat(0))), String(48));
      expect(ResourceUtils.decodedByteLength('A'.repeat(64 - 0) + '='.repeat(0))).assertEqual(48);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0055 end');
    })

    /**
     * @tc.name   testResourceUtilsB64Pad0056
     * @tc.number SUB_RESMGR_UTILS_04_0056
     * @tc.desc   expectedBase64Length(49) is 68
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64Pad0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0056 begin');
      const result: number = ResourceUtils.expectedBase64Length(49);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(68));
      expect(result).assertEqual(68);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(68 - 2) + '='.repeat(2))), String(49));
      expect(ResourceUtils.decodedByteLength('A'.repeat(68 - 2) + '='.repeat(2))).assertEqual(49);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0056 end');
    })

    /**
     * @tc.name   testResourceUtilsB64Pad0057
     * @tc.number SUB_RESMGR_UTILS_04_0057
     * @tc.desc   expectedBase64Length(50) is 68
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64Pad0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0057 begin');
      const result: number = ResourceUtils.expectedBase64Length(50);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(68));
      expect(result).assertEqual(68);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(68 - 1) + '='.repeat(1))), String(50));
      expect(ResourceUtils.decodedByteLength('A'.repeat(68 - 1) + '='.repeat(1))).assertEqual(50);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0057 end');
    })

    /**
     * @tc.name   testResourceUtilsB64Pad0058
     * @tc.number SUB_RESMGR_UTILS_04_0058
     * @tc.desc   expectedBase64Length(51) is 68
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64Pad0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0058 begin');
      const result: number = ResourceUtils.expectedBase64Length(51);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(68));
      expect(result).assertEqual(68);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(68 - 0) + '='.repeat(0))), String(51));
      expect(ResourceUtils.decodedByteLength('A'.repeat(68 - 0) + '='.repeat(0))).assertEqual(51);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0058 end');
    })

    /**
     * @tc.name   testResourceUtilsB64Pad0059
     * @tc.number SUB_RESMGR_UTILS_04_0059
     * @tc.desc   expectedBase64Length(52) is 72
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64Pad0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0059 begin');
      const result: number = ResourceUtils.expectedBase64Length(52);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(72));
      expect(result).assertEqual(72);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(72 - 2) + '='.repeat(2))), String(52));
      expect(ResourceUtils.decodedByteLength('A'.repeat(72 - 2) + '='.repeat(2))).assertEqual(52);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0059 end');
    })

    /**
     * @tc.name   testResourceUtilsB64Pad0060
     * @tc.number SUB_RESMGR_UTILS_04_0060
     * @tc.desc   expectedBase64Length(53) is 72
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64Pad0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0060 begin');
      const result: number = ResourceUtils.expectedBase64Length(53);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(72));
      expect(result).assertEqual(72);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(72 - 1) + '='.repeat(1))), String(53));
      expect(ResourceUtils.decodedByteLength('A'.repeat(72 - 1) + '='.repeat(1))).assertEqual(53);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0060 end');
    })

    /**
     * @tc.name   testResourceUtilsB64Pad0061
     * @tc.number SUB_RESMGR_UTILS_04_0061
     * @tc.desc   expectedBase64Length(54) is 72
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64Pad0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0061 begin');
      const result: number = ResourceUtils.expectedBase64Length(54);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(72));
      expect(result).assertEqual(72);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(72 - 0) + '='.repeat(0))), String(54));
      expect(ResourceUtils.decodedByteLength('A'.repeat(72 - 0) + '='.repeat(0))).assertEqual(54);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0061 end');
    })

    /**
     * @tc.name   testResourceUtilsB64Pad0062
     * @tc.number SUB_RESMGR_UTILS_04_0062
     * @tc.desc   expectedBase64Length(55) is 76
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64Pad0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0062 begin');
      const result: number = ResourceUtils.expectedBase64Length(55);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(76));
      expect(result).assertEqual(76);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(76 - 2) + '='.repeat(2))), String(55));
      expect(ResourceUtils.decodedByteLength('A'.repeat(76 - 2) + '='.repeat(2))).assertEqual(55);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0062 end');
    })

    /**
     * @tc.name   testResourceUtilsB64Pad0063
     * @tc.number SUB_RESMGR_UTILS_04_0063
     * @tc.desc   expectedBase64Length(56) is 76
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64Pad0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0063 begin');
      const result: number = ResourceUtils.expectedBase64Length(56);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(76));
      expect(result).assertEqual(76);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(76 - 1) + '='.repeat(1))), String(56));
      expect(ResourceUtils.decodedByteLength('A'.repeat(76 - 1) + '='.repeat(1))).assertEqual(56);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0063 end');
    })

    /**
     * @tc.name   testResourceUtilsB64Pad0064
     * @tc.number SUB_RESMGR_UTILS_04_0064
     * @tc.desc   expectedBase64Length(57) is 76
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64Pad0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0064 begin');
      const result: number = ResourceUtils.expectedBase64Length(57);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(76));
      expect(result).assertEqual(76);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(76 - 0) + '='.repeat(0))), String(57));
      expect(ResourceUtils.decodedByteLength('A'.repeat(76 - 0) + '='.repeat(0))).assertEqual(57);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0064 end');
    })

    /**
     * @tc.name   testResourceUtilsB64Pad0065
     * @tc.number SUB_RESMGR_UTILS_04_0065
     * @tc.desc   expectedBase64Length(58) is 80
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64Pad0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0065 begin');
      const result: number = ResourceUtils.expectedBase64Length(58);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(80));
      expect(result).assertEqual(80);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(80 - 2) + '='.repeat(2))), String(58));
      expect(ResourceUtils.decodedByteLength('A'.repeat(80 - 2) + '='.repeat(2))).assertEqual(58);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0065 end');
    })

    /**
     * @tc.name   testResourceUtilsB64Pad0066
     * @tc.number SUB_RESMGR_UTILS_04_0066
     * @tc.desc   expectedBase64Length(59) is 80
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64Pad0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0066 begin');
      const result: number = ResourceUtils.expectedBase64Length(59);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(80));
      expect(result).assertEqual(80);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(80 - 1) + '='.repeat(1))), String(59));
      expect(ResourceUtils.decodedByteLength('A'.repeat(80 - 1) + '='.repeat(1))).assertEqual(59);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0066 end');
    })

    /**
     * @tc.name   testResourceUtilsB64Pad0067
     * @tc.number SUB_RESMGR_UTILS_04_0067
     * @tc.desc   expectedBase64Length(60) is 80
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64Pad0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0067 begin');
      const result: number = ResourceUtils.expectedBase64Length(60);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(80));
      expect(result).assertEqual(80);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(80 - 0) + '='.repeat(0))), String(60));
      expect(ResourceUtils.decodedByteLength('A'.repeat(80 - 0) + '='.repeat(0))).assertEqual(60);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0067 end');
    })

    /**
     * @tc.name   testResourceUtilsB64Pad0068
     * @tc.number SUB_RESMGR_UTILS_04_0068
     * @tc.desc   expectedBase64Length(61) is 84
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64Pad0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0068 begin');
      const result: number = ResourceUtils.expectedBase64Length(61);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(84));
      expect(result).assertEqual(84);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(84 - 2) + '='.repeat(2))), String(61));
      expect(ResourceUtils.decodedByteLength('A'.repeat(84 - 2) + '='.repeat(2))).assertEqual(61);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0068 end');
    })

    /**
     * @tc.name   testResourceUtilsB64Pad0069
     * @tc.number SUB_RESMGR_UTILS_04_0069
     * @tc.desc   expectedBase64Length(62) is 84
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64Pad0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0069 begin');
      const result: number = ResourceUtils.expectedBase64Length(62);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(84));
      expect(result).assertEqual(84);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(84 - 1) + '='.repeat(1))), String(62));
      expect(ResourceUtils.decodedByteLength('A'.repeat(84 - 1) + '='.repeat(1))).assertEqual(62);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0069 end');
    })

    /**
     * @tc.name   testResourceUtilsB64Pad0070
     * @tc.number SUB_RESMGR_UTILS_04_0070
     * @tc.desc   expectedBase64Length(63) is 84
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64Pad0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0070 begin');
      const result: number = ResourceUtils.expectedBase64Length(63);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(84));
      expect(result).assertEqual(84);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(84 - 0) + '='.repeat(0))), String(63));
      expect(ResourceUtils.decodedByteLength('A'.repeat(84 - 0) + '='.repeat(0))).assertEqual(63);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0070 end');
    })

    /**
     * @tc.name   testResourceUtilsB64Pad0071
     * @tc.number SUB_RESMGR_UTILS_04_0071
     * @tc.desc   expectedBase64Length(64) is 88
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64Pad0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0071 begin');
      const result: number = ResourceUtils.expectedBase64Length(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(88));
      expect(result).assertEqual(88);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(88 - 2) + '='.repeat(2))), String(64));
      expect(ResourceUtils.decodedByteLength('A'.repeat(88 - 2) + '='.repeat(2))).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0071 end');
    })

    /**
     * @tc.name   testResourceUtilsB64Pad0072
     * @tc.number SUB_RESMGR_UTILS_04_0072
     * @tc.desc   expectedBase64Length(65) is 88
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64Pad0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0072 begin');
      const result: number = ResourceUtils.expectedBase64Length(65);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(88));
      expect(result).assertEqual(88);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(88 - 1) + '='.repeat(1))), String(65));
      expect(ResourceUtils.decodedByteLength('A'.repeat(88 - 1) + '='.repeat(1))).assertEqual(65);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0072 end');
    })

    /**
     * @tc.name   testResourceUtilsB64Pad0073
     * @tc.number SUB_RESMGR_UTILS_04_0073
     * @tc.desc   expectedBase64Length(66) is 88
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64Pad0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0073 begin');
      const result: number = ResourceUtils.expectedBase64Length(66);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(88));
      expect(result).assertEqual(88);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(88 - 0) + '='.repeat(0))), String(66));
      expect(ResourceUtils.decodedByteLength('A'.repeat(88 - 0) + '='.repeat(0))).assertEqual(66);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0073 end');
    })

    /**
     * @tc.name   testResourceUtilsB64Pad0074
     * @tc.number SUB_RESMGR_UTILS_04_0074
     * @tc.desc   expectedBase64Length(67) is 92
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64Pad0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0074 begin');
      const result: number = ResourceUtils.expectedBase64Length(67);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(92));
      expect(result).assertEqual(92);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(92 - 2) + '='.repeat(2))), String(67));
      expect(ResourceUtils.decodedByteLength('A'.repeat(92 - 2) + '='.repeat(2))).assertEqual(67);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0074 end');
    })

    /**
     * @tc.name   testResourceUtilsB64Pad0075
     * @tc.number SUB_RESMGR_UTILS_04_0075
     * @tc.desc   expectedBase64Length(68) is 92
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64Pad0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0075 begin');
      const result: number = ResourceUtils.expectedBase64Length(68);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(92));
      expect(result).assertEqual(92);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(92 - 1) + '='.repeat(1))), String(68));
      expect(ResourceUtils.decodedByteLength('A'.repeat(92 - 1) + '='.repeat(1))).assertEqual(68);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0075 end');
    })

    /**
     * @tc.name   testResourceUtilsB64Pad0076
     * @tc.number SUB_RESMGR_UTILS_04_0076
     * @tc.desc   expectedBase64Length(69) is 92
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64Pad0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0076 begin');
      const result: number = ResourceUtils.expectedBase64Length(69);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(92));
      expect(result).assertEqual(92);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(92 - 0) + '='.repeat(0))), String(69));
      expect(ResourceUtils.decodedByteLength('A'.repeat(92 - 0) + '='.repeat(0))).assertEqual(69);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0076 end');
    })

    /**
     * @tc.name   testResourceUtilsB64Pad0077
     * @tc.number SUB_RESMGR_UTILS_04_0077
     * @tc.desc   expectedBase64Length(70) is 96
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64Pad0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0077 begin');
      const result: number = ResourceUtils.expectedBase64Length(70);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(96));
      expect(result).assertEqual(96);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(96 - 2) + '='.repeat(2))), String(70));
      expect(ResourceUtils.decodedByteLength('A'.repeat(96 - 2) + '='.repeat(2))).assertEqual(70);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0077 end');
    })

    /**
     * @tc.name   testResourceUtilsB64Pad0078
     * @tc.number SUB_RESMGR_UTILS_04_0078
     * @tc.desc   expectedBase64Length(71) is 96
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64Pad0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0078 begin');
      const result: number = ResourceUtils.expectedBase64Length(71);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(96));
      expect(result).assertEqual(96);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(96 - 1) + '='.repeat(1))), String(71));
      expect(ResourceUtils.decodedByteLength('A'.repeat(96 - 1) + '='.repeat(1))).assertEqual(71);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0078 end');
    })

    /**
     * @tc.name   testResourceUtilsB64Pad0079
     * @tc.number SUB_RESMGR_UTILS_04_0079
     * @tc.desc   expectedBase64Length(72) is 96
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64Pad0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0079 begin');
      const result: number = ResourceUtils.expectedBase64Length(72);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(96));
      expect(result).assertEqual(96);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(96 - 0) + '='.repeat(0))), String(72));
      expect(ResourceUtils.decodedByteLength('A'.repeat(96 - 0) + '='.repeat(0))).assertEqual(72);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0079 end');
    })

    /**
     * @tc.name   testResourceUtilsB64Pad0080
     * @tc.number SUB_RESMGR_UTILS_04_0080
     * @tc.desc   expectedBase64Length(73) is 100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64Pad0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0080 begin');
      const result: number = ResourceUtils.expectedBase64Length(73);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(100));
      expect(result).assertEqual(100);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(100 - 2) + '='.repeat(2))), String(73));
      expect(ResourceUtils.decodedByteLength('A'.repeat(100 - 2) + '='.repeat(2))).assertEqual(73);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0080 end');
    })

    /**
     * @tc.name   testResourceUtilsB64Pad0081
     * @tc.number SUB_RESMGR_UTILS_04_0081
     * @tc.desc   expectedBase64Length(74) is 100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64Pad0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0081 begin');
      const result: number = ResourceUtils.expectedBase64Length(74);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(100));
      expect(result).assertEqual(100);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(100 - 1) + '='.repeat(1))), String(74));
      expect(ResourceUtils.decodedByteLength('A'.repeat(100 - 1) + '='.repeat(1))).assertEqual(74);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0081 end');
    })

    /**
     * @tc.name   testResourceUtilsB64Pad0082
     * @tc.number SUB_RESMGR_UTILS_04_0082
     * @tc.desc   expectedBase64Length(75) is 100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64Pad0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0082 begin');
      const result: number = ResourceUtils.expectedBase64Length(75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(100));
      expect(result).assertEqual(100);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(100 - 0) + '='.repeat(0))), String(75));
      expect(ResourceUtils.decodedByteLength('A'.repeat(100 - 0) + '='.repeat(0))).assertEqual(75);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0082 end');
    })

    /**
     * @tc.name   testResourceUtilsB64Pad0083
     * @tc.number SUB_RESMGR_UTILS_04_0083
     * @tc.desc   expectedBase64Length(76) is 104
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64Pad0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0083 begin');
      const result: number = ResourceUtils.expectedBase64Length(76);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(104));
      expect(result).assertEqual(104);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(104 - 2) + '='.repeat(2))), String(76));
      expect(ResourceUtils.decodedByteLength('A'.repeat(104 - 2) + '='.repeat(2))).assertEqual(76);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0083 end');
    })

    /**
     * @tc.name   testResourceUtilsB64Pad0084
     * @tc.number SUB_RESMGR_UTILS_04_0084
     * @tc.desc   expectedBase64Length(77) is 104
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64Pad0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0084 begin');
      const result: number = ResourceUtils.expectedBase64Length(77);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(104));
      expect(result).assertEqual(104);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(104 - 1) + '='.repeat(1))), String(77));
      expect(ResourceUtils.decodedByteLength('A'.repeat(104 - 1) + '='.repeat(1))).assertEqual(77);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0084 end');
    })

    /**
     * @tc.name   testResourceUtilsB64Pad0085
     * @tc.number SUB_RESMGR_UTILS_04_0085
     * @tc.desc   expectedBase64Length(78) is 104
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64Pad0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0085 begin');
      const result: number = ResourceUtils.expectedBase64Length(78);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(104));
      expect(result).assertEqual(104);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % 4 === 0));
      expect(result % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.decodedByteLength('A'.repeat(104 - 0) + '='.repeat(0))), String(78));
      expect(ResourceUtils.decodedByteLength('A'.repeat(104 - 0) + '='.repeat(0))).assertEqual(78);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0085 end');
    })

    /**
     * @tc.name   testResourceUtilsB64Pad0086
     * @tc.number SUB_RESMGR_UTILS_04_0086
     * @tc.desc   真实图片字节数的编码长度，以及非法 base64 串的反算边界
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64Pad0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0086 begin');
      // app_icon 为 6790 字节，向上取整到 2264 组，编码后 9056 个字符
      const iconLength: number = ResourceUtils.expectedBase64Length(6790);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(iconLength), String(9056));
      expect(iconLength).assertEqual(9056);
      // 9078 字节刚好被 3 整除，不能多补一组
      const alignedLength: number = ResourceUtils.expectedBase64Length(9078);
      expect(alignedLength).assertEqual(12104);
      // 无填充串反算回 3 字节，两字节填充串只反算回 1 字节
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.decodedByteLength('AAAA')));
      expect(ResourceUtils.decodedByteLength('AAAA')).assertEqual(3);
      expect(ResourceUtils.decodedByteLength('AAA=')).assertEqual(2);
      expect(ResourceUtils.decodedByteLength('BB==')).assertEqual(1);
      // 长度不是 4 的倍数或为空时无法反算，必须返回 -1
      expect(ResourceUtils.decodedByteLength('AAAAA')).assertEqual(-1);
      expect(ResourceUtils.decodedByteLength('')).assertEqual(-1);
      // 非法输入不产生长度，也不能返回负数
      expect(ResourceUtils.expectedBase64Length(0)).assertEqual(0);
      expect(ResourceUtils.expectedBase64Length(-3)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64Pad0086 end');
    })

  })
}
