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
import { ScanErrorMapper, ScanErrorCategory } from '../../../main/ets/scan/model/ScanErrorInfo';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_ScanNapiInterfaceDemo]';

export default function scanErrorMapVolume01Test() {
  describe('ScanErrorMapVolume01', () => {

    /**
     * @tc.name   testErrorCat0001
     * @tc.number SUB_SCAN_ERRMAP_01_0001
     * @tc.desc   code 201 maps to permission in the documented table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0001 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(201);
      expect(result).assertEqual(ScanErrorCategory.PERMISSION);
      expect(ScanErrorMapper.isKnown(201)).assertEqual(true);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0001 end');
    });

    /**
     * @tc.name   testErrorCat0002
     * @tc.number SUB_SCAN_ERRMAP_01_0002
     * @tc.desc   code 202 maps to framework in the documented table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0002 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(202);
      expect(result).assertEqual(ScanErrorCategory.FRAMEWORK);
      expect(ScanErrorMapper.isKnown(202)).assertEqual(true);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0002 end');
    });

    /**
     * @tc.name   testErrorCat0003
     * @tc.number SUB_SCAN_ERRMAP_01_0003
     * @tc.desc   code 401 maps to parameter in the documented table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0003 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(401);
      expect(result).assertEqual(ScanErrorCategory.PARAMETER);
      expect(ScanErrorMapper.isKnown(401)).assertEqual(true);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0003 end');
    });

    /**
     * @tc.name   testErrorCat0004
     * @tc.number SUB_SCAN_ERRMAP_01_0004
     * @tc.desc   code 13100001 maps to framework in the documented table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0004 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(13100001);
      expect(result).assertEqual(ScanErrorCategory.FRAMEWORK);
      expect(ScanErrorMapper.isKnown(13100001)).assertEqual(true);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0004 end');
    });

    /**
     * @tc.name   testErrorCat0005
     * @tc.number SUB_SCAN_ERRMAP_01_0005
     * @tc.desc   code 13100002 maps to framework in the documented table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0005 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(13100002);
      expect(result).assertEqual(ScanErrorCategory.FRAMEWORK);
      expect(ScanErrorMapper.isKnown(13100002)).assertEqual(true);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0005 end');
    });

    /**
     * @tc.name   testErrorCat0006
     * @tc.number SUB_SCAN_ERRMAP_01_0006
     * @tc.desc   code 13100003 maps to framework in the documented table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0006 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(13100003);
      expect(result).assertEqual(ScanErrorCategory.FRAMEWORK);
      expect(ScanErrorMapper.isKnown(13100003)).assertEqual(true);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0006 end');
    });

    /**
     * @tc.name   testErrorCat0007
     * @tc.number SUB_SCAN_ERRMAP_01_0007
     * @tc.desc   code 13100004 maps to framework in the documented table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0007 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(13100004);
      expect(result).assertEqual(ScanErrorCategory.FRAMEWORK);
      expect(ScanErrorMapper.isKnown(13100004)).assertEqual(true);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0007 end');
    });

    /**
     * @tc.name   testErrorCat0008
     * @tc.number SUB_SCAN_ERRMAP_01_0008
     * @tc.desc   code 13100005 maps to device in the documented table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0008 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(13100005);
      expect(result).assertEqual(ScanErrorCategory.DEVICE);
      expect(ScanErrorMapper.isKnown(13100005)).assertEqual(true);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0008 end');
    });

    /**
     * @tc.name   testErrorCat0009
     * @tc.number SUB_SCAN_ERRMAP_01_0009
     * @tc.desc   code 13100006 maps to device in the documented table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0009 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(13100006);
      expect(result).assertEqual(ScanErrorCategory.DEVICE);
      expect(ScanErrorMapper.isKnown(13100006)).assertEqual(true);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0009 end');
    });

    /**
     * @tc.name   testErrorCat0010
     * @tc.number SUB_SCAN_ERRMAP_01_0010
     * @tc.desc   code 13100007 maps to device in the documented table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0010 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(13100007);
      expect(result).assertEqual(ScanErrorCategory.DEVICE);
      expect(ScanErrorMapper.isKnown(13100007)).assertEqual(true);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0010 end');
    });

    /**
     * @tc.name   testErrorCat0011
     * @tc.number SUB_SCAN_ERRMAP_01_0011
     * @tc.desc   code 13100008 maps to device in the documented table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0011 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(13100008);
      expect(result).assertEqual(ScanErrorCategory.DEVICE);
      expect(ScanErrorMapper.isKnown(13100008)).assertEqual(true);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0011 end');
    });

    /**
     * @tc.name   testErrorCat0012
     * @tc.number SUB_SCAN_ERRMAP_01_0012
     * @tc.desc   code 13100009 maps to device in the documented table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0012 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(13100009);
      expect(result).assertEqual(ScanErrorCategory.DEVICE);
      expect(ScanErrorMapper.isKnown(13100009)).assertEqual(true);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0012 end');
    });

    /**
     * @tc.name   testErrorCat0013
     * @tc.number SUB_SCAN_ERRMAP_01_0013
     * @tc.desc   code 13100010 maps to device in the documented table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0013 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(13100010);
      expect(result).assertEqual(ScanErrorCategory.DEVICE);
      expect(ScanErrorMapper.isKnown(13100010)).assertEqual(true);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0013 end');
    });

    /**
     * @tc.name   testErrorCat0014
     * @tc.number SUB_SCAN_ERRMAP_01_0014
     * @tc.desc   code 13100011 maps to device in the documented table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0014 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(13100011);
      expect(result).assertEqual(ScanErrorCategory.DEVICE);
      expect(ScanErrorMapper.isKnown(13100011)).assertEqual(true);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0014 end');
    });

    /**
     * @tc.name   testErrorCat0015
     * @tc.number SUB_SCAN_ERRMAP_01_0015
     * @tc.desc   code 13100012 maps to framework in the documented table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0015 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(13100012);
      expect(result).assertEqual(ScanErrorCategory.FRAMEWORK);
      expect(ScanErrorMapper.isKnown(13100012)).assertEqual(true);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0015 end');
    });

    /**
     * @tc.name   testErrorCat0016
     * @tc.number SUB_SCAN_ERRMAP_01_0016
     * @tc.desc   unknown code 0 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0016 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(0);
      expect(result).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(ScanErrorMapper.isKnown(0)).assertEqual(false);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0016 end');
    });

    /**
     * @tc.name   testErrorCat0017
     * @tc.number SUB_SCAN_ERRMAP_01_0017
     * @tc.desc   unknown code 1 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0017 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(1);
      expect(result).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(ScanErrorMapper.isKnown(1)).assertEqual(false);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0017 end');
    });

    /**
     * @tc.name   testErrorCat0018
     * @tc.number SUB_SCAN_ERRMAP_01_0018
     * @tc.desc   unknown code -1 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0018 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(-1);
      expect(result).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(ScanErrorMapper.isKnown(-1)).assertEqual(false);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0018 end');
    });

    /**
     * @tc.name   testErrorCat0019
     * @tc.number SUB_SCAN_ERRMAP_01_0019
     * @tc.desc   unknown code 200 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0019 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(200);
      expect(result).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(ScanErrorMapper.isKnown(200)).assertEqual(false);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0019 end');
    });

    /**
     * @tc.name   testErrorCat0020
     * @tc.number SUB_SCAN_ERRMAP_01_0020
     * @tc.desc   unknown code 203 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0020 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(203);
      expect(result).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(ScanErrorMapper.isKnown(203)).assertEqual(false);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0020 end');
    });

    /**
     * @tc.name   testErrorCat0021
     * @tc.number SUB_SCAN_ERRMAP_01_0021
     * @tc.desc   unknown code 400 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0021 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(400);
      expect(result).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(ScanErrorMapper.isKnown(400)).assertEqual(false);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0021 end');
    });

    /**
     * @tc.name   testErrorCat0022
     * @tc.number SUB_SCAN_ERRMAP_01_0022
     * @tc.desc   unknown code 402 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0022 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(402);
      expect(result).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(ScanErrorMapper.isKnown(402)).assertEqual(false);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0022 end');
    });

    /**
     * @tc.name   testErrorCat0023
     * @tc.number SUB_SCAN_ERRMAP_01_0023
     * @tc.desc   unknown code 999 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0023 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(999);
      expect(result).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(ScanErrorMapper.isKnown(999)).assertEqual(false);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0023 end');
    });

    /**
     * @tc.name   testErrorCat0024
     * @tc.number SUB_SCAN_ERRMAP_01_0024
     * @tc.desc   unknown code 13100000 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0024 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(13100000);
      expect(result).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(ScanErrorMapper.isKnown(13100000)).assertEqual(false);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0024 end');
    });

    /**
     * @tc.name   testErrorCat0025
     * @tc.number SUB_SCAN_ERRMAP_01_0025
     * @tc.desc   unknown code 13100013 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0025 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(13100013);
      expect(result).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(ScanErrorMapper.isKnown(13100013)).assertEqual(false);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0025 end');
    });

    /**
     * @tc.name   testErrorCat0026
     * @tc.number SUB_SCAN_ERRMAP_01_0026
     * @tc.desc   unknown code 13100014 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0026 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(13100014);
      expect(result).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(ScanErrorMapper.isKnown(13100014)).assertEqual(false);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0026 end');
    });

    /**
     * @tc.name   testErrorCat0027
     * @tc.number SUB_SCAN_ERRMAP_01_0027
     * @tc.desc   unknown code 13100099 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0027 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(13100099);
      expect(result).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(ScanErrorMapper.isKnown(13100099)).assertEqual(false);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0027 end');
    });

    /**
     * @tc.name   testErrorCat0028
     * @tc.number SUB_SCAN_ERRMAP_01_0028
     * @tc.desc   unknown code 13100100 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0028 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(13100100);
      expect(result).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(ScanErrorMapper.isKnown(13100100)).assertEqual(false);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0028 end');
    });

    /**
     * @tc.name   testErrorCat0029
     * @tc.number SUB_SCAN_ERRMAP_01_0029
     * @tc.desc   unknown code 99999999 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0029 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(99999999);
      expect(result).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(ScanErrorMapper.isKnown(99999999)).assertEqual(false);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0029 end');
    });

    /**
     * @tc.name   testErrorCat0030
     * @tc.number SUB_SCAN_ERRMAP_01_0030
     * @tc.desc   unknown code -13100001 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0030 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(-13100001);
      expect(result).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(ScanErrorMapper.isKnown(-13100001)).assertEqual(false);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0030 end');
    });

    /**
     * @tc.name   testErrorCat0031
     * @tc.number SUB_SCAN_ERRMAP_01_0031
     * @tc.desc   unknown code 1000 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0031 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(1000);
      expect(result).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(ScanErrorMapper.isKnown(1000)).assertEqual(false);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0031 end');
    });

    /**
     * @tc.name   testErrorCat0032
     * @tc.number SUB_SCAN_ERRMAP_01_0032
     * @tc.desc   unknown code 1007 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0032 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(1007);
      expect(result).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(ScanErrorMapper.isKnown(1007)).assertEqual(false);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0032 end');
    });

    /**
     * @tc.name   testErrorCat0033
     * @tc.number SUB_SCAN_ERRMAP_01_0033
     * @tc.desc   unknown code 1014 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0033 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(1014);
      expect(result).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(ScanErrorMapper.isKnown(1014)).assertEqual(false);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0033 end');
    });

    /**
     * @tc.name   testErrorCat0034
     * @tc.number SUB_SCAN_ERRMAP_01_0034
     * @tc.desc   unknown code 1021 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0034 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(1021);
      expect(result).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(ScanErrorMapper.isKnown(1021)).assertEqual(false);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0034 end');
    });

    /**
     * @tc.name   testErrorCat0035
     * @tc.number SUB_SCAN_ERRMAP_01_0035
     * @tc.desc   unknown code 1028 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0035 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(1028);
      expect(result).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(ScanErrorMapper.isKnown(1028)).assertEqual(false);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0035 end');
    });

    /**
     * @tc.name   testErrorCat0036
     * @tc.number SUB_SCAN_ERRMAP_01_0036
     * @tc.desc   unknown code 1035 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0036 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(1035);
      expect(result).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(ScanErrorMapper.isKnown(1035)).assertEqual(false);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0036 end');
    });

    /**
     * @tc.name   testErrorCat0037
     * @tc.number SUB_SCAN_ERRMAP_01_0037
     * @tc.desc   unknown code 1042 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0037 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(1042);
      expect(result).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(ScanErrorMapper.isKnown(1042)).assertEqual(false);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0037 end');
    });

    /**
     * @tc.name   testErrorCat0038
     * @tc.number SUB_SCAN_ERRMAP_01_0038
     * @tc.desc   unknown code 1049 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0038 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(1049);
      expect(result).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(ScanErrorMapper.isKnown(1049)).assertEqual(false);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0038 end');
    });

    /**
     * @tc.name   testErrorCat0039
     * @tc.number SUB_SCAN_ERRMAP_01_0039
     * @tc.desc   unknown code 1056 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0039 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(1056);
      expect(result).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(ScanErrorMapper.isKnown(1056)).assertEqual(false);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0039 end');
    });

    /**
     * @tc.name   testErrorCat0040
     * @tc.number SUB_SCAN_ERRMAP_01_0040
     * @tc.desc   unknown code 1063 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0040 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(1063);
      expect(result).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(ScanErrorMapper.isKnown(1063)).assertEqual(false);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0040 end');
    });

    /**
     * @tc.name   testErrorCat0041
     * @tc.number SUB_SCAN_ERRMAP_01_0041
     * @tc.desc   unknown code 1070 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0041 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(1070);
      expect(result).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(ScanErrorMapper.isKnown(1070)).assertEqual(false);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0041 end');
    });

    /**
     * @tc.name   testErrorCat0042
     * @tc.number SUB_SCAN_ERRMAP_01_0042
     * @tc.desc   unknown code 1077 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0042 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(1077);
      expect(result).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(ScanErrorMapper.isKnown(1077)).assertEqual(false);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0042 end');
    });

    /**
     * @tc.name   testErrorCat0043
     * @tc.number SUB_SCAN_ERRMAP_01_0043
     * @tc.desc   unknown code 1084 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0043 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(1084);
      expect(result).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(ScanErrorMapper.isKnown(1084)).assertEqual(false);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0043 end');
    });

    /**
     * @tc.name   testErrorCat0044
     * @tc.number SUB_SCAN_ERRMAP_01_0044
     * @tc.desc   unknown code 1091 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0044 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(1091);
      expect(result).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(ScanErrorMapper.isKnown(1091)).assertEqual(false);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0044 end');
    });

    /**
     * @tc.name   testErrorCat0045
     * @tc.number SUB_SCAN_ERRMAP_01_0045
     * @tc.desc   unknown code 1098 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0045 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(1098);
      expect(result).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(ScanErrorMapper.isKnown(1098)).assertEqual(false);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0045 end');
    });

    /**
     * @tc.name   testErrorCat0046
     * @tc.number SUB_SCAN_ERRMAP_01_0046
     * @tc.desc   unknown code 1105 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0046 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(1105);
      expect(result).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(ScanErrorMapper.isKnown(1105)).assertEqual(false);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0046 end');
    });

    /**
     * @tc.name   testErrorCat0047
     * @tc.number SUB_SCAN_ERRMAP_01_0047
     * @tc.desc   unknown code 1112 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0047 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(1112);
      expect(result).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(ScanErrorMapper.isKnown(1112)).assertEqual(false);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0047 end');
    });

    /**
     * @tc.name   testErrorCat0048
     * @tc.number SUB_SCAN_ERRMAP_01_0048
     * @tc.desc   unknown code 1119 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0048 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(1119);
      expect(result).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(ScanErrorMapper.isKnown(1119)).assertEqual(false);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0048 end');
    });

    /**
     * @tc.name   testErrorCat0049
     * @tc.number SUB_SCAN_ERRMAP_01_0049
     * @tc.desc   unknown code 1126 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0049 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(1126);
      expect(result).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(ScanErrorMapper.isKnown(1126)).assertEqual(false);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0049 end');
    });

    /**
     * @tc.name   testErrorCat0050
     * @tc.number SUB_SCAN_ERRMAP_01_0050
     * @tc.desc   unknown code 1133 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0050 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(1133);
      expect(result).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(ScanErrorMapper.isKnown(1133)).assertEqual(false);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0050 end');
    });

    /**
     * @tc.name   testErrorCat0051
     * @tc.number SUB_SCAN_ERRMAP_01_0051
     * @tc.desc   unknown code 1140 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0051 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(1140);
      expect(result).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(ScanErrorMapper.isKnown(1140)).assertEqual(false);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0051 end');
    });

    /**
     * @tc.name   testErrorCat0052
     * @tc.number SUB_SCAN_ERRMAP_01_0052
     * @tc.desc   unknown code 1147 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0052 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(1147);
      expect(result).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(ScanErrorMapper.isKnown(1147)).assertEqual(false);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0052 end');
    });

    /**
     * @tc.name   testErrorCat0053
     * @tc.number SUB_SCAN_ERRMAP_01_0053
     * @tc.desc   unknown code 1154 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0053 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(1154);
      expect(result).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(ScanErrorMapper.isKnown(1154)).assertEqual(false);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0053 end');
    });

    /**
     * @tc.name   testErrorCat0054
     * @tc.number SUB_SCAN_ERRMAP_01_0054
     * @tc.desc   unknown code 1161 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0054 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(1161);
      expect(result).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(ScanErrorMapper.isKnown(1161)).assertEqual(false);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0054 end');
    });

    /**
     * @tc.name   testErrorCat0055
     * @tc.number SUB_SCAN_ERRMAP_01_0055
     * @tc.desc   unknown code 1168 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0055 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(1168);
      expect(result).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(ScanErrorMapper.isKnown(1168)).assertEqual(false);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0055 end');
    });

    /**
     * @tc.name   testErrorCat0056
     * @tc.number SUB_SCAN_ERRMAP_01_0056
     * @tc.desc   unknown code 1175 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0056 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(1175);
      expect(result).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(ScanErrorMapper.isKnown(1175)).assertEqual(false);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0056 end');
    });

    /**
     * @tc.name   testErrorCat0057
     * @tc.number SUB_SCAN_ERRMAP_01_0057
     * @tc.desc   unknown code 1182 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0057 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(1182);
      expect(result).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(ScanErrorMapper.isKnown(1182)).assertEqual(false);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0057 end');
    });

    /**
     * @tc.name   testErrorCat0058
     * @tc.number SUB_SCAN_ERRMAP_01_0058
     * @tc.desc   unknown code 1189 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0058 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(1189);
      expect(result).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(ScanErrorMapper.isKnown(1189)).assertEqual(false);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0058 end');
    });

    /**
     * @tc.name   testErrorCat0059
     * @tc.number SUB_SCAN_ERRMAP_01_0059
     * @tc.desc   unknown code 1196 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0059 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(1196);
      expect(result).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(ScanErrorMapper.isKnown(1196)).assertEqual(false);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0059 end');
    });

    /**
     * @tc.name   testErrorCat0060
     * @tc.number SUB_SCAN_ERRMAP_01_0060
     * @tc.desc   unknown code 1203 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0060 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(1203);
      expect(result).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(ScanErrorMapper.isKnown(1203)).assertEqual(false);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0060 end');
    });

    /**
     * @tc.name   testErrorCat0061
     * @tc.number SUB_SCAN_ERRMAP_01_0061
     * @tc.desc   unknown code 1210 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0061 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(1210);
      expect(result).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(ScanErrorMapper.isKnown(1210)).assertEqual(false);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0061 end');
    });

    /**
     * @tc.name   testErrorCat0062
     * @tc.number SUB_SCAN_ERRMAP_01_0062
     * @tc.desc   unknown code 1217 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0062 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(1217);
      expect(result).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(ScanErrorMapper.isKnown(1217)).assertEqual(false);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0062 end');
    });

    /**
     * @tc.name   testErrorCat0063
     * @tc.number SUB_SCAN_ERRMAP_01_0063
     * @tc.desc   unknown code 1224 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0063 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(1224);
      expect(result).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(ScanErrorMapper.isKnown(1224)).assertEqual(false);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0063 end');
    });

    /**
     * @tc.name   testErrorCat0064
     * @tc.number SUB_SCAN_ERRMAP_01_0064
     * @tc.desc   unknown code 1231 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0064 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(1231);
      expect(result).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(ScanErrorMapper.isKnown(1231)).assertEqual(false);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0064 end');
    });

    /**
     * @tc.name   testErrorCat0065
     * @tc.number SUB_SCAN_ERRMAP_01_0065
     * @tc.desc   unknown code 1238 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0065 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(1238);
      expect(result).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(ScanErrorMapper.isKnown(1238)).assertEqual(false);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0065 end');
    });

    /**
     * @tc.name   testErrorCat0066
     * @tc.number SUB_SCAN_ERRMAP_01_0066
     * @tc.desc   unknown code 1245 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0066 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(1245);
      expect(result).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(ScanErrorMapper.isKnown(1245)).assertEqual(false);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0066 end');
    });

    /**
     * @tc.name   testErrorCat0067
     * @tc.number SUB_SCAN_ERRMAP_01_0067
     * @tc.desc   unknown code 1252 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0067 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(1252);
      expect(result).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(ScanErrorMapper.isKnown(1252)).assertEqual(false);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0067 end');
    });

    /**
     * @tc.name   testErrorCat0068
     * @tc.number SUB_SCAN_ERRMAP_01_0068
     * @tc.desc   unknown code 1259 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0068 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(1259);
      expect(result).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(ScanErrorMapper.isKnown(1259)).assertEqual(false);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0068 end');
    });

    /**
     * @tc.name   testErrorCat0069
     * @tc.number SUB_SCAN_ERRMAP_01_0069
     * @tc.desc   unknown code 1266 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0069 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(1266);
      expect(result).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(ScanErrorMapper.isKnown(1266)).assertEqual(false);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0069 end');
    });

    /**
     * @tc.name   testErrorCat0070
     * @tc.number SUB_SCAN_ERRMAP_01_0070
     * @tc.desc   unknown code 1273 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0070 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(1273);
      expect(result).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(ScanErrorMapper.isKnown(1273)).assertEqual(false);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0070 end');
    });

    /**
     * @tc.name   testErrorCat0071
     * @tc.number SUB_SCAN_ERRMAP_01_0071
     * @tc.desc   unknown code 1280 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0071 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(1280);
      expect(result).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(ScanErrorMapper.isKnown(1280)).assertEqual(false);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0071 end');
    });

    /**
     * @tc.name   testErrorCat0072
     * @tc.number SUB_SCAN_ERRMAP_01_0072
     * @tc.desc   unknown code 1287 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0072 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(1287);
      expect(result).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(ScanErrorMapper.isKnown(1287)).assertEqual(false);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0072 end');
    });

    /**
     * @tc.name   testErrorCat0073
     * @tc.number SUB_SCAN_ERRMAP_01_0073
     * @tc.desc   unknown code 1294 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0073 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(1294);
      expect(result).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(ScanErrorMapper.isKnown(1294)).assertEqual(false);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0073 end');
    });

    /**
     * @tc.name   testErrorCat0074
     * @tc.number SUB_SCAN_ERRMAP_01_0074
     * @tc.desc   unknown code 1301 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0074 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(1301);
      expect(result).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(ScanErrorMapper.isKnown(1301)).assertEqual(false);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0074 end');
    });

    /**
     * @tc.name   testErrorCat0075
     * @tc.number SUB_SCAN_ERRMAP_01_0075
     * @tc.desc   unknown code 1308 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0075 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(1308);
      expect(result).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(ScanErrorMapper.isKnown(1308)).assertEqual(false);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0075 end');
    });

    /**
     * @tc.name   testErrorCat0076
     * @tc.number SUB_SCAN_ERRMAP_01_0076
     * @tc.desc   unknown code 1315 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0076 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(1315);
      expect(result).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(ScanErrorMapper.isKnown(1315)).assertEqual(false);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0076 end');
    });

    /**
     * @tc.name   testErrorCat0077
     * @tc.number SUB_SCAN_ERRMAP_01_0077
     * @tc.desc   unknown code 1322 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0077 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(1322);
      expect(result).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(ScanErrorMapper.isKnown(1322)).assertEqual(false);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0077 end');
    });

    /**
     * @tc.name   testErrorCat0078
     * @tc.number SUB_SCAN_ERRMAP_01_0078
     * @tc.desc   unknown code 1329 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0078 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(1329);
      expect(result).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(ScanErrorMapper.isKnown(1329)).assertEqual(false);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0078 end');
    });

    /**
     * @tc.name   testErrorCat0079
     * @tc.number SUB_SCAN_ERRMAP_01_0079
     * @tc.desc   unknown code 1336 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0079 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(1336);
      expect(result).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(ScanErrorMapper.isKnown(1336)).assertEqual(false);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0079 end');
    });

    /**
     * @tc.name   testErrorCat0080
     * @tc.number SUB_SCAN_ERRMAP_01_0080
     * @tc.desc   unknown code 1343 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0080 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(1343);
      expect(result).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(ScanErrorMapper.isKnown(1343)).assertEqual(false);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0080 end');
    });

    /**
     * @tc.name   testErrorCat0081
     * @tc.number SUB_SCAN_ERRMAP_01_0081
     * @tc.desc   unknown code 1350 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0081 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(1350);
      expect(result).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(ScanErrorMapper.isKnown(1350)).assertEqual(false);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0081 end');
    });

    /**
     * @tc.name   testErrorCat0082
     * @tc.number SUB_SCAN_ERRMAP_01_0082
     * @tc.desc   unknown code 1357 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0082 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(1357);
      expect(result).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(ScanErrorMapper.isKnown(1357)).assertEqual(false);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0082 end');
    });

    /**
     * @tc.name   testErrorCat0083
     * @tc.number SUB_SCAN_ERRMAP_01_0083
     * @tc.desc   unknown code 1364 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0083 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(1364);
      expect(result).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(ScanErrorMapper.isKnown(1364)).assertEqual(false);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0083 end');
    });

    /**
     * @tc.name   testErrorCat0084
     * @tc.number SUB_SCAN_ERRMAP_01_0084
     * @tc.desc   unknown code 1371 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0084 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(1371);
      expect(result).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(ScanErrorMapper.isKnown(1371)).assertEqual(false);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0084 end');
    });

    /**
     * @tc.name   testErrorCat0085
     * @tc.number SUB_SCAN_ERRMAP_01_0085
     * @tc.desc   unknown code 1378 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0085 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(1378);
      expect(result).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(ScanErrorMapper.isKnown(1378)).assertEqual(false);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0085 end');
    });

    /**
     * @tc.name   testErrorCat0086
     * @tc.number SUB_SCAN_ERRMAP_01_0086
     * @tc.desc   unknown code 1385 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0086 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(1385);
      expect(result).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(ScanErrorMapper.isKnown(1385)).assertEqual(false);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0086 end');
    });

    /**
     * @tc.name   testErrorCat0087
     * @tc.number SUB_SCAN_ERRMAP_01_0087
     * @tc.desc   unknown code 1392 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0087 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(1392);
      expect(result).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(ScanErrorMapper.isKnown(1392)).assertEqual(false);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0087 end');
    });

    /**
     * @tc.name   testErrorCat0088
     * @tc.number SUB_SCAN_ERRMAP_01_0088
     * @tc.desc   unknown code 1399 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0088 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(1399);
      expect(result).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(ScanErrorMapper.isKnown(1399)).assertEqual(false);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0088 end');
    });

    /**
     * @tc.name   testErrorCat0089
     * @tc.number SUB_SCAN_ERRMAP_01_0089
     * @tc.desc   unknown code 1406 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0089 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(1406);
      expect(result).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(ScanErrorMapper.isKnown(1406)).assertEqual(false);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0089 end');
    });

    /**
     * @tc.name   testErrorCat0090
     * @tc.number SUB_SCAN_ERRMAP_01_0090
     * @tc.desc   unknown code 1413 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorCat0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0090 begin');
      const result: ScanErrorCategory = ScanErrorMapper.getCategory(1413);
      expect(result).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(ScanErrorMapper.isKnown(1413)).assertEqual(false);
      expect(result === ScanErrorCategory.UNKNOWN).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorCat0090 end');
    });

  });
}
