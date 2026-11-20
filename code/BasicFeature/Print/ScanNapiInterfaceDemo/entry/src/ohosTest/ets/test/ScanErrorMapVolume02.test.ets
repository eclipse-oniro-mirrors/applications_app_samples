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

export default function scanErrorMapVolume02Test() {
  describe('ScanErrorMapVolume02', () => {

    /**
     * @tc.name   testErrorRetry0001
     * @tc.number SUB_SCAN_ERRMAP_02_0001
     * @tc.desc   code 201 maps to permission in the documented table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0001 begin');
      const result: boolean = ScanErrorMapper.isRetryable(201);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.isKnown(201)).assertEqual(true);
      expect(ScanErrorMapper.getCategory(201)).assertEqual(ScanErrorCategory.PERMISSION);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0001 end');
    });

    /**
     * @tc.name   testErrorRetry0002
     * @tc.number SUB_SCAN_ERRMAP_02_0002
     * @tc.desc   code 202 maps to framework in the documented table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0002 begin');
      const result: boolean = ScanErrorMapper.isRetryable(202);
      expect(result).assertEqual(true);
      expect(ScanErrorMapper.isKnown(202)).assertEqual(true);
      expect(ScanErrorMapper.getCategory(202)).assertEqual(ScanErrorCategory.FRAMEWORK);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0002 end');
    });

    /**
     * @tc.name   testErrorRetry0003
     * @tc.number SUB_SCAN_ERRMAP_02_0003
     * @tc.desc   code 401 maps to parameter in the documented table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0003 begin');
      const result: boolean = ScanErrorMapper.isRetryable(401);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.isKnown(401)).assertEqual(true);
      expect(ScanErrorMapper.getCategory(401)).assertEqual(ScanErrorCategory.PARAMETER);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0003 end');
    });

    /**
     * @tc.name   testErrorRetry0004
     * @tc.number SUB_SCAN_ERRMAP_02_0004
     * @tc.desc   code 13100001 maps to framework in the documented table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0004 begin');
      const result: boolean = ScanErrorMapper.isRetryable(13100001);
      expect(result).assertEqual(true);
      expect(ScanErrorMapper.isKnown(13100001)).assertEqual(true);
      expect(ScanErrorMapper.getCategory(13100001)).assertEqual(ScanErrorCategory.FRAMEWORK);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0004 end');
    });

    /**
     * @tc.name   testErrorRetry0005
     * @tc.number SUB_SCAN_ERRMAP_02_0005
     * @tc.desc   code 13100002 maps to framework in the documented table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0005 begin');
      const result: boolean = ScanErrorMapper.isRetryable(13100002);
      expect(result).assertEqual(true);
      expect(ScanErrorMapper.isKnown(13100002)).assertEqual(true);
      expect(ScanErrorMapper.getCategory(13100002)).assertEqual(ScanErrorCategory.FRAMEWORK);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0005 end');
    });

    /**
     * @tc.name   testErrorRetry0006
     * @tc.number SUB_SCAN_ERRMAP_02_0006
     * @tc.desc   code 13100003 maps to framework in the documented table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0006 begin');
      const result: boolean = ScanErrorMapper.isRetryable(13100003);
      expect(result).assertEqual(true);
      expect(ScanErrorMapper.isKnown(13100003)).assertEqual(true);
      expect(ScanErrorMapper.getCategory(13100003)).assertEqual(ScanErrorCategory.FRAMEWORK);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0006 end');
    });

    /**
     * @tc.name   testErrorRetry0007
     * @tc.number SUB_SCAN_ERRMAP_02_0007
     * @tc.desc   code 13100004 maps to framework in the documented table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0007 begin');
      const result: boolean = ScanErrorMapper.isRetryable(13100004);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.isKnown(13100004)).assertEqual(true);
      expect(ScanErrorMapper.getCategory(13100004)).assertEqual(ScanErrorCategory.FRAMEWORK);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0007 end');
    });

    /**
     * @tc.name   testErrorRetry0008
     * @tc.number SUB_SCAN_ERRMAP_02_0008
     * @tc.desc   code 13100005 maps to device in the documented table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0008 begin');
      const result: boolean = ScanErrorMapper.isRetryable(13100005);
      expect(result).assertEqual(true);
      expect(ScanErrorMapper.isKnown(13100005)).assertEqual(true);
      expect(ScanErrorMapper.getCategory(13100005)).assertEqual(ScanErrorCategory.DEVICE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0008 end');
    });

    /**
     * @tc.name   testErrorRetry0009
     * @tc.number SUB_SCAN_ERRMAP_02_0009
     * @tc.desc   code 13100006 maps to device in the documented table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0009 begin');
      const result: boolean = ScanErrorMapper.isRetryable(13100006);
      expect(result).assertEqual(true);
      expect(ScanErrorMapper.isKnown(13100006)).assertEqual(true);
      expect(ScanErrorMapper.getCategory(13100006)).assertEqual(ScanErrorCategory.DEVICE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0009 end');
    });

    /**
     * @tc.name   testErrorRetry0010
     * @tc.number SUB_SCAN_ERRMAP_02_0010
     * @tc.desc   code 13100007 maps to device in the documented table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0010 begin');
      const result: boolean = ScanErrorMapper.isRetryable(13100007);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.isKnown(13100007)).assertEqual(true);
      expect(ScanErrorMapper.getCategory(13100007)).assertEqual(ScanErrorCategory.DEVICE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0010 end');
    });

    /**
     * @tc.name   testErrorRetry0011
     * @tc.number SUB_SCAN_ERRMAP_02_0011
     * @tc.desc   code 13100008 maps to device in the documented table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0011 begin');
      const result: boolean = ScanErrorMapper.isRetryable(13100008);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.isKnown(13100008)).assertEqual(true);
      expect(ScanErrorMapper.getCategory(13100008)).assertEqual(ScanErrorCategory.DEVICE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0011 end');
    });

    /**
     * @tc.name   testErrorRetry0012
     * @tc.number SUB_SCAN_ERRMAP_02_0012
     * @tc.desc   code 13100009 maps to device in the documented table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0012 begin');
      const result: boolean = ScanErrorMapper.isRetryable(13100009);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.isKnown(13100009)).assertEqual(true);
      expect(ScanErrorMapper.getCategory(13100009)).assertEqual(ScanErrorCategory.DEVICE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0012 end');
    });

    /**
     * @tc.name   testErrorRetry0013
     * @tc.number SUB_SCAN_ERRMAP_02_0013
     * @tc.desc   code 13100010 maps to device in the documented table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0013 begin');
      const result: boolean = ScanErrorMapper.isRetryable(13100010);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.isKnown(13100010)).assertEqual(true);
      expect(ScanErrorMapper.getCategory(13100010)).assertEqual(ScanErrorCategory.DEVICE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0013 end');
    });

    /**
     * @tc.name   testErrorRetry0014
     * @tc.number SUB_SCAN_ERRMAP_02_0014
     * @tc.desc   code 13100011 maps to device in the documented table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0014 begin');
      const result: boolean = ScanErrorMapper.isRetryable(13100011);
      expect(result).assertEqual(true);
      expect(ScanErrorMapper.isKnown(13100011)).assertEqual(true);
      expect(ScanErrorMapper.getCategory(13100011)).assertEqual(ScanErrorCategory.DEVICE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0014 end');
    });

    /**
     * @tc.name   testErrorRetry0015
     * @tc.number SUB_SCAN_ERRMAP_02_0015
     * @tc.desc   code 13100012 maps to framework in the documented table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0015 begin');
      const result: boolean = ScanErrorMapper.isRetryable(13100012);
      expect(result).assertEqual(true);
      expect(ScanErrorMapper.isKnown(13100012)).assertEqual(true);
      expect(ScanErrorMapper.getCategory(13100012)).assertEqual(ScanErrorCategory.FRAMEWORK);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0015 end');
    });

    /**
     * @tc.name   testErrorRetry0016
     * @tc.number SUB_SCAN_ERRMAP_02_0016
     * @tc.desc   unknown code 0 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0016 begin');
      const result: boolean = ScanErrorMapper.isRetryable(0);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.isKnown(0)).assertEqual(false);
      expect(ScanErrorMapper.getCategory(0)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0016 end');
    });

    /**
     * @tc.name   testErrorRetry0017
     * @tc.number SUB_SCAN_ERRMAP_02_0017
     * @tc.desc   unknown code 1 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0017 begin');
      const result: boolean = ScanErrorMapper.isRetryable(1);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1)).assertEqual(false);
      expect(ScanErrorMapper.getCategory(1)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0017 end');
    });

    /**
     * @tc.name   testErrorRetry0018
     * @tc.number SUB_SCAN_ERRMAP_02_0018
     * @tc.desc   unknown code -1 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0018 begin');
      const result: boolean = ScanErrorMapper.isRetryable(-1);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.isKnown(-1)).assertEqual(false);
      expect(ScanErrorMapper.getCategory(-1)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0018 end');
    });

    /**
     * @tc.name   testErrorRetry0019
     * @tc.number SUB_SCAN_ERRMAP_02_0019
     * @tc.desc   unknown code 200 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0019 begin');
      const result: boolean = ScanErrorMapper.isRetryable(200);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.isKnown(200)).assertEqual(false);
      expect(ScanErrorMapper.getCategory(200)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0019 end');
    });

    /**
     * @tc.name   testErrorRetry0020
     * @tc.number SUB_SCAN_ERRMAP_02_0020
     * @tc.desc   unknown code 203 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0020 begin');
      const result: boolean = ScanErrorMapper.isRetryable(203);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.isKnown(203)).assertEqual(false);
      expect(ScanErrorMapper.getCategory(203)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0020 end');
    });

    /**
     * @tc.name   testErrorRetry0021
     * @tc.number SUB_SCAN_ERRMAP_02_0021
     * @tc.desc   unknown code 400 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0021 begin');
      const result: boolean = ScanErrorMapper.isRetryable(400);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.isKnown(400)).assertEqual(false);
      expect(ScanErrorMapper.getCategory(400)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0021 end');
    });

    /**
     * @tc.name   testErrorRetry0022
     * @tc.number SUB_SCAN_ERRMAP_02_0022
     * @tc.desc   unknown code 402 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0022 begin');
      const result: boolean = ScanErrorMapper.isRetryable(402);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.isKnown(402)).assertEqual(false);
      expect(ScanErrorMapper.getCategory(402)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0022 end');
    });

    /**
     * @tc.name   testErrorRetry0023
     * @tc.number SUB_SCAN_ERRMAP_02_0023
     * @tc.desc   unknown code 999 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0023 begin');
      const result: boolean = ScanErrorMapper.isRetryable(999);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.isKnown(999)).assertEqual(false);
      expect(ScanErrorMapper.getCategory(999)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0023 end');
    });

    /**
     * @tc.name   testErrorRetry0024
     * @tc.number SUB_SCAN_ERRMAP_02_0024
     * @tc.desc   unknown code 13100000 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0024 begin');
      const result: boolean = ScanErrorMapper.isRetryable(13100000);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.isKnown(13100000)).assertEqual(false);
      expect(ScanErrorMapper.getCategory(13100000)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0024 end');
    });

    /**
     * @tc.name   testErrorRetry0025
     * @tc.number SUB_SCAN_ERRMAP_02_0025
     * @tc.desc   unknown code 13100013 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0025 begin');
      const result: boolean = ScanErrorMapper.isRetryable(13100013);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.isKnown(13100013)).assertEqual(false);
      expect(ScanErrorMapper.getCategory(13100013)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0025 end');
    });

    /**
     * @tc.name   testErrorRetry0026
     * @tc.number SUB_SCAN_ERRMAP_02_0026
     * @tc.desc   unknown code 13100014 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0026 begin');
      const result: boolean = ScanErrorMapper.isRetryable(13100014);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.isKnown(13100014)).assertEqual(false);
      expect(ScanErrorMapper.getCategory(13100014)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0026 end');
    });

    /**
     * @tc.name   testErrorRetry0027
     * @tc.number SUB_SCAN_ERRMAP_02_0027
     * @tc.desc   unknown code 13100099 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0027 begin');
      const result: boolean = ScanErrorMapper.isRetryable(13100099);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.isKnown(13100099)).assertEqual(false);
      expect(ScanErrorMapper.getCategory(13100099)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0027 end');
    });

    /**
     * @tc.name   testErrorRetry0028
     * @tc.number SUB_SCAN_ERRMAP_02_0028
     * @tc.desc   unknown code 13100100 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0028 begin');
      const result: boolean = ScanErrorMapper.isRetryable(13100100);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.isKnown(13100100)).assertEqual(false);
      expect(ScanErrorMapper.getCategory(13100100)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0028 end');
    });

    /**
     * @tc.name   testErrorRetry0029
     * @tc.number SUB_SCAN_ERRMAP_02_0029
     * @tc.desc   unknown code 99999999 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0029 begin');
      const result: boolean = ScanErrorMapper.isRetryable(99999999);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.isKnown(99999999)).assertEqual(false);
      expect(ScanErrorMapper.getCategory(99999999)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0029 end');
    });

    /**
     * @tc.name   testErrorRetry0030
     * @tc.number SUB_SCAN_ERRMAP_02_0030
     * @tc.desc   unknown code -13100001 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0030 begin');
      const result: boolean = ScanErrorMapper.isRetryable(-13100001);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.isKnown(-13100001)).assertEqual(false);
      expect(ScanErrorMapper.getCategory(-13100001)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0030 end');
    });

    /**
     * @tc.name   testErrorRetry0031
     * @tc.number SUB_SCAN_ERRMAP_02_0031
     * @tc.desc   unknown code 1000 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0031 begin');
      const result: boolean = ScanErrorMapper.isRetryable(1000);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1000)).assertEqual(false);
      expect(ScanErrorMapper.getCategory(1000)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0031 end');
    });

    /**
     * @tc.name   testErrorRetry0032
     * @tc.number SUB_SCAN_ERRMAP_02_0032
     * @tc.desc   unknown code 1007 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0032 begin');
      const result: boolean = ScanErrorMapper.isRetryable(1007);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1007)).assertEqual(false);
      expect(ScanErrorMapper.getCategory(1007)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0032 end');
    });

    /**
     * @tc.name   testErrorRetry0033
     * @tc.number SUB_SCAN_ERRMAP_02_0033
     * @tc.desc   unknown code 1014 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0033 begin');
      const result: boolean = ScanErrorMapper.isRetryable(1014);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1014)).assertEqual(false);
      expect(ScanErrorMapper.getCategory(1014)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0033 end');
    });

    /**
     * @tc.name   testErrorRetry0034
     * @tc.number SUB_SCAN_ERRMAP_02_0034
     * @tc.desc   unknown code 1021 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0034 begin');
      const result: boolean = ScanErrorMapper.isRetryable(1021);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1021)).assertEqual(false);
      expect(ScanErrorMapper.getCategory(1021)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0034 end');
    });

    /**
     * @tc.name   testErrorRetry0035
     * @tc.number SUB_SCAN_ERRMAP_02_0035
     * @tc.desc   unknown code 1028 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0035 begin');
      const result: boolean = ScanErrorMapper.isRetryable(1028);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1028)).assertEqual(false);
      expect(ScanErrorMapper.getCategory(1028)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0035 end');
    });

    /**
     * @tc.name   testErrorRetry0036
     * @tc.number SUB_SCAN_ERRMAP_02_0036
     * @tc.desc   unknown code 1035 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0036 begin');
      const result: boolean = ScanErrorMapper.isRetryable(1035);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1035)).assertEqual(false);
      expect(ScanErrorMapper.getCategory(1035)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0036 end');
    });

    /**
     * @tc.name   testErrorRetry0037
     * @tc.number SUB_SCAN_ERRMAP_02_0037
     * @tc.desc   unknown code 1042 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0037 begin');
      const result: boolean = ScanErrorMapper.isRetryable(1042);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1042)).assertEqual(false);
      expect(ScanErrorMapper.getCategory(1042)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0037 end');
    });

    /**
     * @tc.name   testErrorRetry0038
     * @tc.number SUB_SCAN_ERRMAP_02_0038
     * @tc.desc   unknown code 1049 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0038 begin');
      const result: boolean = ScanErrorMapper.isRetryable(1049);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1049)).assertEqual(false);
      expect(ScanErrorMapper.getCategory(1049)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0038 end');
    });

    /**
     * @tc.name   testErrorRetry0039
     * @tc.number SUB_SCAN_ERRMAP_02_0039
     * @tc.desc   unknown code 1056 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0039 begin');
      const result: boolean = ScanErrorMapper.isRetryable(1056);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1056)).assertEqual(false);
      expect(ScanErrorMapper.getCategory(1056)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0039 end');
    });

    /**
     * @tc.name   testErrorRetry0040
     * @tc.number SUB_SCAN_ERRMAP_02_0040
     * @tc.desc   unknown code 1063 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0040 begin');
      const result: boolean = ScanErrorMapper.isRetryable(1063);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1063)).assertEqual(false);
      expect(ScanErrorMapper.getCategory(1063)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0040 end');
    });

    /**
     * @tc.name   testErrorRetry0041
     * @tc.number SUB_SCAN_ERRMAP_02_0041
     * @tc.desc   unknown code 1070 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0041 begin');
      const result: boolean = ScanErrorMapper.isRetryable(1070);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1070)).assertEqual(false);
      expect(ScanErrorMapper.getCategory(1070)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0041 end');
    });

    /**
     * @tc.name   testErrorRetry0042
     * @tc.number SUB_SCAN_ERRMAP_02_0042
     * @tc.desc   unknown code 1077 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0042 begin');
      const result: boolean = ScanErrorMapper.isRetryable(1077);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1077)).assertEqual(false);
      expect(ScanErrorMapper.getCategory(1077)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0042 end');
    });

    /**
     * @tc.name   testErrorRetry0043
     * @tc.number SUB_SCAN_ERRMAP_02_0043
     * @tc.desc   unknown code 1084 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0043 begin');
      const result: boolean = ScanErrorMapper.isRetryable(1084);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1084)).assertEqual(false);
      expect(ScanErrorMapper.getCategory(1084)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0043 end');
    });

    /**
     * @tc.name   testErrorRetry0044
     * @tc.number SUB_SCAN_ERRMAP_02_0044
     * @tc.desc   unknown code 1091 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0044 begin');
      const result: boolean = ScanErrorMapper.isRetryable(1091);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1091)).assertEqual(false);
      expect(ScanErrorMapper.getCategory(1091)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0044 end');
    });

    /**
     * @tc.name   testErrorRetry0045
     * @tc.number SUB_SCAN_ERRMAP_02_0045
     * @tc.desc   unknown code 1098 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0045 begin');
      const result: boolean = ScanErrorMapper.isRetryable(1098);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1098)).assertEqual(false);
      expect(ScanErrorMapper.getCategory(1098)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0045 end');
    });

    /**
     * @tc.name   testErrorRetry0046
     * @tc.number SUB_SCAN_ERRMAP_02_0046
     * @tc.desc   unknown code 1105 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0046 begin');
      const result: boolean = ScanErrorMapper.isRetryable(1105);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1105)).assertEqual(false);
      expect(ScanErrorMapper.getCategory(1105)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0046 end');
    });

    /**
     * @tc.name   testErrorRetry0047
     * @tc.number SUB_SCAN_ERRMAP_02_0047
     * @tc.desc   unknown code 1112 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0047 begin');
      const result: boolean = ScanErrorMapper.isRetryable(1112);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1112)).assertEqual(false);
      expect(ScanErrorMapper.getCategory(1112)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0047 end');
    });

    /**
     * @tc.name   testErrorRetry0048
     * @tc.number SUB_SCAN_ERRMAP_02_0048
     * @tc.desc   unknown code 1119 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0048 begin');
      const result: boolean = ScanErrorMapper.isRetryable(1119);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1119)).assertEqual(false);
      expect(ScanErrorMapper.getCategory(1119)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0048 end');
    });

    /**
     * @tc.name   testErrorRetry0049
     * @tc.number SUB_SCAN_ERRMAP_02_0049
     * @tc.desc   unknown code 1126 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0049 begin');
      const result: boolean = ScanErrorMapper.isRetryable(1126);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1126)).assertEqual(false);
      expect(ScanErrorMapper.getCategory(1126)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0049 end');
    });

    /**
     * @tc.name   testErrorRetry0050
     * @tc.number SUB_SCAN_ERRMAP_02_0050
     * @tc.desc   unknown code 1133 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0050 begin');
      const result: boolean = ScanErrorMapper.isRetryable(1133);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1133)).assertEqual(false);
      expect(ScanErrorMapper.getCategory(1133)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0050 end');
    });

    /**
     * @tc.name   testErrorRetry0051
     * @tc.number SUB_SCAN_ERRMAP_02_0051
     * @tc.desc   unknown code 1140 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0051 begin');
      const result: boolean = ScanErrorMapper.isRetryable(1140);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1140)).assertEqual(false);
      expect(ScanErrorMapper.getCategory(1140)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0051 end');
    });

    /**
     * @tc.name   testErrorRetry0052
     * @tc.number SUB_SCAN_ERRMAP_02_0052
     * @tc.desc   unknown code 1147 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0052 begin');
      const result: boolean = ScanErrorMapper.isRetryable(1147);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1147)).assertEqual(false);
      expect(ScanErrorMapper.getCategory(1147)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0052 end');
    });

    /**
     * @tc.name   testErrorRetry0053
     * @tc.number SUB_SCAN_ERRMAP_02_0053
     * @tc.desc   unknown code 1154 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0053 begin');
      const result: boolean = ScanErrorMapper.isRetryable(1154);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1154)).assertEqual(false);
      expect(ScanErrorMapper.getCategory(1154)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0053 end');
    });

    /**
     * @tc.name   testErrorRetry0054
     * @tc.number SUB_SCAN_ERRMAP_02_0054
     * @tc.desc   unknown code 1161 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0054 begin');
      const result: boolean = ScanErrorMapper.isRetryable(1161);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1161)).assertEqual(false);
      expect(ScanErrorMapper.getCategory(1161)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0054 end');
    });

    /**
     * @tc.name   testErrorRetry0055
     * @tc.number SUB_SCAN_ERRMAP_02_0055
     * @tc.desc   unknown code 1168 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0055 begin');
      const result: boolean = ScanErrorMapper.isRetryable(1168);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1168)).assertEqual(false);
      expect(ScanErrorMapper.getCategory(1168)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0055 end');
    });

    /**
     * @tc.name   testErrorRetry0056
     * @tc.number SUB_SCAN_ERRMAP_02_0056
     * @tc.desc   unknown code 1175 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0056 begin');
      const result: boolean = ScanErrorMapper.isRetryable(1175);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1175)).assertEqual(false);
      expect(ScanErrorMapper.getCategory(1175)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0056 end');
    });

    /**
     * @tc.name   testErrorRetry0057
     * @tc.number SUB_SCAN_ERRMAP_02_0057
     * @tc.desc   unknown code 1182 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0057 begin');
      const result: boolean = ScanErrorMapper.isRetryable(1182);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1182)).assertEqual(false);
      expect(ScanErrorMapper.getCategory(1182)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0057 end');
    });

    /**
     * @tc.name   testErrorRetry0058
     * @tc.number SUB_SCAN_ERRMAP_02_0058
     * @tc.desc   unknown code 1189 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0058 begin');
      const result: boolean = ScanErrorMapper.isRetryable(1189);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1189)).assertEqual(false);
      expect(ScanErrorMapper.getCategory(1189)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0058 end');
    });

    /**
     * @tc.name   testErrorRetry0059
     * @tc.number SUB_SCAN_ERRMAP_02_0059
     * @tc.desc   unknown code 1196 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0059 begin');
      const result: boolean = ScanErrorMapper.isRetryable(1196);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1196)).assertEqual(false);
      expect(ScanErrorMapper.getCategory(1196)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0059 end');
    });

    /**
     * @tc.name   testErrorRetry0060
     * @tc.number SUB_SCAN_ERRMAP_02_0060
     * @tc.desc   unknown code 1203 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0060 begin');
      const result: boolean = ScanErrorMapper.isRetryable(1203);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1203)).assertEqual(false);
      expect(ScanErrorMapper.getCategory(1203)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0060 end');
    });

    /**
     * @tc.name   testErrorRetry0061
     * @tc.number SUB_SCAN_ERRMAP_02_0061
     * @tc.desc   unknown code 1210 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0061 begin');
      const result: boolean = ScanErrorMapper.isRetryable(1210);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1210)).assertEqual(false);
      expect(ScanErrorMapper.getCategory(1210)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0061 end');
    });

    /**
     * @tc.name   testErrorRetry0062
     * @tc.number SUB_SCAN_ERRMAP_02_0062
     * @tc.desc   unknown code 1217 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0062 begin');
      const result: boolean = ScanErrorMapper.isRetryable(1217);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1217)).assertEqual(false);
      expect(ScanErrorMapper.getCategory(1217)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0062 end');
    });

    /**
     * @tc.name   testErrorRetry0063
     * @tc.number SUB_SCAN_ERRMAP_02_0063
     * @tc.desc   unknown code 1224 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0063 begin');
      const result: boolean = ScanErrorMapper.isRetryable(1224);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1224)).assertEqual(false);
      expect(ScanErrorMapper.getCategory(1224)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0063 end');
    });

    /**
     * @tc.name   testErrorRetry0064
     * @tc.number SUB_SCAN_ERRMAP_02_0064
     * @tc.desc   unknown code 1231 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0064 begin');
      const result: boolean = ScanErrorMapper.isRetryable(1231);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1231)).assertEqual(false);
      expect(ScanErrorMapper.getCategory(1231)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0064 end');
    });

    /**
     * @tc.name   testErrorRetry0065
     * @tc.number SUB_SCAN_ERRMAP_02_0065
     * @tc.desc   unknown code 1238 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0065 begin');
      const result: boolean = ScanErrorMapper.isRetryable(1238);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1238)).assertEqual(false);
      expect(ScanErrorMapper.getCategory(1238)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0065 end');
    });

    /**
     * @tc.name   testErrorRetry0066
     * @tc.number SUB_SCAN_ERRMAP_02_0066
     * @tc.desc   unknown code 1245 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0066 begin');
      const result: boolean = ScanErrorMapper.isRetryable(1245);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1245)).assertEqual(false);
      expect(ScanErrorMapper.getCategory(1245)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0066 end');
    });

    /**
     * @tc.name   testErrorRetry0067
     * @tc.number SUB_SCAN_ERRMAP_02_0067
     * @tc.desc   unknown code 1252 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0067 begin');
      const result: boolean = ScanErrorMapper.isRetryable(1252);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1252)).assertEqual(false);
      expect(ScanErrorMapper.getCategory(1252)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0067 end');
    });

    /**
     * @tc.name   testErrorRetry0068
     * @tc.number SUB_SCAN_ERRMAP_02_0068
     * @tc.desc   unknown code 1259 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0068 begin');
      const result: boolean = ScanErrorMapper.isRetryable(1259);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1259)).assertEqual(false);
      expect(ScanErrorMapper.getCategory(1259)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0068 end');
    });

    /**
     * @tc.name   testErrorRetry0069
     * @tc.number SUB_SCAN_ERRMAP_02_0069
     * @tc.desc   unknown code 1266 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0069 begin');
      const result: boolean = ScanErrorMapper.isRetryable(1266);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1266)).assertEqual(false);
      expect(ScanErrorMapper.getCategory(1266)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0069 end');
    });

    /**
     * @tc.name   testErrorRetry0070
     * @tc.number SUB_SCAN_ERRMAP_02_0070
     * @tc.desc   unknown code 1273 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0070 begin');
      const result: boolean = ScanErrorMapper.isRetryable(1273);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1273)).assertEqual(false);
      expect(ScanErrorMapper.getCategory(1273)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0070 end');
    });

    /**
     * @tc.name   testErrorRetry0071
     * @tc.number SUB_SCAN_ERRMAP_02_0071
     * @tc.desc   unknown code 1280 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0071 begin');
      const result: boolean = ScanErrorMapper.isRetryable(1280);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1280)).assertEqual(false);
      expect(ScanErrorMapper.getCategory(1280)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0071 end');
    });

    /**
     * @tc.name   testErrorRetry0072
     * @tc.number SUB_SCAN_ERRMAP_02_0072
     * @tc.desc   unknown code 1287 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0072 begin');
      const result: boolean = ScanErrorMapper.isRetryable(1287);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1287)).assertEqual(false);
      expect(ScanErrorMapper.getCategory(1287)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0072 end');
    });

    /**
     * @tc.name   testErrorRetry0073
     * @tc.number SUB_SCAN_ERRMAP_02_0073
     * @tc.desc   unknown code 1294 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0073 begin');
      const result: boolean = ScanErrorMapper.isRetryable(1294);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1294)).assertEqual(false);
      expect(ScanErrorMapper.getCategory(1294)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0073 end');
    });

    /**
     * @tc.name   testErrorRetry0074
     * @tc.number SUB_SCAN_ERRMAP_02_0074
     * @tc.desc   unknown code 1301 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0074 begin');
      const result: boolean = ScanErrorMapper.isRetryable(1301);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1301)).assertEqual(false);
      expect(ScanErrorMapper.getCategory(1301)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0074 end');
    });

    /**
     * @tc.name   testErrorRetry0075
     * @tc.number SUB_SCAN_ERRMAP_02_0075
     * @tc.desc   unknown code 1308 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0075 begin');
      const result: boolean = ScanErrorMapper.isRetryable(1308);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1308)).assertEqual(false);
      expect(ScanErrorMapper.getCategory(1308)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0075 end');
    });

    /**
     * @tc.name   testErrorRetry0076
     * @tc.number SUB_SCAN_ERRMAP_02_0076
     * @tc.desc   unknown code 1315 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0076 begin');
      const result: boolean = ScanErrorMapper.isRetryable(1315);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1315)).assertEqual(false);
      expect(ScanErrorMapper.getCategory(1315)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0076 end');
    });

    /**
     * @tc.name   testErrorRetry0077
     * @tc.number SUB_SCAN_ERRMAP_02_0077
     * @tc.desc   unknown code 1322 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0077 begin');
      const result: boolean = ScanErrorMapper.isRetryable(1322);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1322)).assertEqual(false);
      expect(ScanErrorMapper.getCategory(1322)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0077 end');
    });

    /**
     * @tc.name   testErrorRetry0078
     * @tc.number SUB_SCAN_ERRMAP_02_0078
     * @tc.desc   unknown code 1329 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0078 begin');
      const result: boolean = ScanErrorMapper.isRetryable(1329);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1329)).assertEqual(false);
      expect(ScanErrorMapper.getCategory(1329)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0078 end');
    });

    /**
     * @tc.name   testErrorRetry0079
     * @tc.number SUB_SCAN_ERRMAP_02_0079
     * @tc.desc   unknown code 1336 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0079 begin');
      const result: boolean = ScanErrorMapper.isRetryable(1336);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1336)).assertEqual(false);
      expect(ScanErrorMapper.getCategory(1336)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0079 end');
    });

    /**
     * @tc.name   testErrorRetry0080
     * @tc.number SUB_SCAN_ERRMAP_02_0080
     * @tc.desc   unknown code 1343 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0080 begin');
      const result: boolean = ScanErrorMapper.isRetryable(1343);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1343)).assertEqual(false);
      expect(ScanErrorMapper.getCategory(1343)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0080 end');
    });

    /**
     * @tc.name   testErrorRetry0081
     * @tc.number SUB_SCAN_ERRMAP_02_0081
     * @tc.desc   unknown code 1350 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0081 begin');
      const result: boolean = ScanErrorMapper.isRetryable(1350);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1350)).assertEqual(false);
      expect(ScanErrorMapper.getCategory(1350)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0081 end');
    });

    /**
     * @tc.name   testErrorRetry0082
     * @tc.number SUB_SCAN_ERRMAP_02_0082
     * @tc.desc   unknown code 1357 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0082 begin');
      const result: boolean = ScanErrorMapper.isRetryable(1357);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1357)).assertEqual(false);
      expect(ScanErrorMapper.getCategory(1357)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0082 end');
    });

    /**
     * @tc.name   testErrorRetry0083
     * @tc.number SUB_SCAN_ERRMAP_02_0083
     * @tc.desc   unknown code 1364 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0083 begin');
      const result: boolean = ScanErrorMapper.isRetryable(1364);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1364)).assertEqual(false);
      expect(ScanErrorMapper.getCategory(1364)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0083 end');
    });

    /**
     * @tc.name   testErrorRetry0084
     * @tc.number SUB_SCAN_ERRMAP_02_0084
     * @tc.desc   unknown code 1371 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0084 begin');
      const result: boolean = ScanErrorMapper.isRetryable(1371);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1371)).assertEqual(false);
      expect(ScanErrorMapper.getCategory(1371)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0084 end');
    });

    /**
     * @tc.name   testErrorRetry0085
     * @tc.number SUB_SCAN_ERRMAP_02_0085
     * @tc.desc   unknown code 1378 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0085 begin');
      const result: boolean = ScanErrorMapper.isRetryable(1378);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1378)).assertEqual(false);
      expect(ScanErrorMapper.getCategory(1378)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0085 end');
    });

    /**
     * @tc.name   testErrorRetry0086
     * @tc.number SUB_SCAN_ERRMAP_02_0086
     * @tc.desc   unknown code 1385 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0086 begin');
      const result: boolean = ScanErrorMapper.isRetryable(1385);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1385)).assertEqual(false);
      expect(ScanErrorMapper.getCategory(1385)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0086 end');
    });

    /**
     * @tc.name   testErrorRetry0087
     * @tc.number SUB_SCAN_ERRMAP_02_0087
     * @tc.desc   unknown code 1392 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0087 begin');
      const result: boolean = ScanErrorMapper.isRetryable(1392);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1392)).assertEqual(false);
      expect(ScanErrorMapper.getCategory(1392)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0087 end');
    });

    /**
     * @tc.name   testErrorRetry0088
     * @tc.number SUB_SCAN_ERRMAP_02_0088
     * @tc.desc   unknown code 1399 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0088 begin');
      const result: boolean = ScanErrorMapper.isRetryable(1399);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1399)).assertEqual(false);
      expect(ScanErrorMapper.getCategory(1399)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0088 end');
    });

    /**
     * @tc.name   testErrorRetry0089
     * @tc.number SUB_SCAN_ERRMAP_02_0089
     * @tc.desc   unknown code 1406 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0089 begin');
      const result: boolean = ScanErrorMapper.isRetryable(1406);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1406)).assertEqual(false);
      expect(ScanErrorMapper.getCategory(1406)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0089 end');
    });

    /**
     * @tc.name   testErrorRetry0090
     * @tc.number SUB_SCAN_ERRMAP_02_0090
     * @tc.desc   unknown code 1413 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorRetry0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0090 begin');
      const result: boolean = ScanErrorMapper.isRetryable(1413);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1413)).assertEqual(false);
      expect(ScanErrorMapper.getCategory(1413)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorRetry0090 end');
    });

  });
}
