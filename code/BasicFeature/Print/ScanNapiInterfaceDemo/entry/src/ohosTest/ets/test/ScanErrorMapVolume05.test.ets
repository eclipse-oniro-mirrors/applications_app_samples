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
import type { ScanErrorInfo } from '../../../main/ets/scan/model/ScanErrorInfo';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_ScanNapiInterfaceDemo]';

export default function scanErrorMapVolume05Test() {
  describe('ScanErrorMapVolume05', () => {

    /**
     * @tc.name   testErrorDescribe0001
     * @tc.number SUB_SCAN_ERRMAP_05_0001
     * @tc.desc   code 201 maps to permission in the documented table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0001 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(201);
      expect(result.code).assertEqual(201);
      expect(result.category).assertEqual(ScanErrorCategory.PERMISSION);
      expect(result.retryable).assertEqual(false);
      expect(result.messageKey).assertEqual('scan_error_no_permission');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0001 end');
    });

    /**
     * @tc.name   testErrorDescribe0002
     * @tc.number SUB_SCAN_ERRMAP_05_0002
     * @tc.desc   code 202 maps to framework in the documented table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0002 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(202);
      expect(result.code).assertEqual(202);
      expect(result.category).assertEqual(ScanErrorCategory.FRAMEWORK);
      expect(result.retryable).assertEqual(true);
      expect(result.messageKey).assertEqual('scan_error_not_system_application');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0002 end');
    });

    /**
     * @tc.name   testErrorDescribe0003
     * @tc.number SUB_SCAN_ERRMAP_05_0003
     * @tc.desc   code 401 maps to parameter in the documented table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0003 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(401);
      expect(result.code).assertEqual(401);
      expect(result.category).assertEqual(ScanErrorCategory.PARAMETER);
      expect(result.retryable).assertEqual(false);
      expect(result.messageKey).assertEqual('scan_error_invalid_parameter');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0003 end');
    });

    /**
     * @tc.name   testErrorDescribe0004
     * @tc.number SUB_SCAN_ERRMAP_05_0004
     * @tc.desc   code 13100001 maps to framework in the documented table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0004 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(13100001);
      expect(result.code).assertEqual(13100001);
      expect(result.category).assertEqual(ScanErrorCategory.FRAMEWORK);
      expect(result.retryable).assertEqual(true);
      expect(result.messageKey).assertEqual('scan_error_generic_failure');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0004 end');
    });

    /**
     * @tc.name   testErrorDescribe0005
     * @tc.number SUB_SCAN_ERRMAP_05_0005
     * @tc.desc   code 13100002 maps to framework in the documented table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0005 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(13100002);
      expect(result.code).assertEqual(13100002);
      expect(result.category).assertEqual(ScanErrorCategory.FRAMEWORK);
      expect(result.retryable).assertEqual(true);
      expect(result.messageKey).assertEqual('scan_error_rpc_failure');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0005 end');
    });

    /**
     * @tc.name   testErrorDescribe0006
     * @tc.number SUB_SCAN_ERRMAP_05_0006
     * @tc.desc   code 13100003 maps to framework in the documented table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0006 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(13100003);
      expect(result.code).assertEqual(13100003);
      expect(result.category).assertEqual(ScanErrorCategory.FRAMEWORK);
      expect(result.retryable).assertEqual(true);
      expect(result.messageKey).assertEqual('scan_error_server_failure');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0006 end');
    });

    /**
     * @tc.name   testErrorDescribe0007
     * @tc.number SUB_SCAN_ERRMAP_05_0007
     * @tc.desc   code 13100004 maps to framework in the documented table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0007 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(13100004);
      expect(result.code).assertEqual(13100004);
      expect(result.category).assertEqual(ScanErrorCategory.FRAMEWORK);
      expect(result.retryable).assertEqual(false);
      expect(result.messageKey).assertEqual('scan_error_unsupported');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0007 end');
    });

    /**
     * @tc.name   testErrorDescribe0008
     * @tc.number SUB_SCAN_ERRMAP_05_0008
     * @tc.desc   code 13100005 maps to device in the documented table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0008 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(13100005);
      expect(result.code).assertEqual(13100005);
      expect(result.category).assertEqual(ScanErrorCategory.DEVICE);
      expect(result.retryable).assertEqual(true);
      expect(result.messageKey).assertEqual('scan_error_canceled');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0008 end');
    });

    /**
     * @tc.name   testErrorDescribe0009
     * @tc.number SUB_SCAN_ERRMAP_05_0009
     * @tc.desc   code 13100006 maps to device in the documented table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0009 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(13100006);
      expect(result.code).assertEqual(13100006);
      expect(result.category).assertEqual(ScanErrorCategory.DEVICE);
      expect(result.retryable).assertEqual(true);
      expect(result.messageKey).assertEqual('scan_error_device_busy');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0009 end');
    });

    /**
     * @tc.name   testErrorDescribe0010
     * @tc.number SUB_SCAN_ERRMAP_05_0010
     * @tc.desc   code 13100007 maps to device in the documented table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0010 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(13100007);
      expect(result.code).assertEqual(13100007);
      expect(result.category).assertEqual(ScanErrorCategory.DEVICE);
      expect(result.retryable).assertEqual(false);
      expect(result.messageKey).assertEqual('scan_error_invalid');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0010 end');
    });

    /**
     * @tc.name   testErrorDescribe0011
     * @tc.number SUB_SCAN_ERRMAP_05_0011
     * @tc.desc   code 13100008 maps to device in the documented table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0011 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(13100008);
      expect(result.code).assertEqual(13100008);
      expect(result.category).assertEqual(ScanErrorCategory.DEVICE);
      expect(result.retryable).assertEqual(false);
      expect(result.messageKey).assertEqual('scan_error_jammed');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0011 end');
    });

    /**
     * @tc.name   testErrorDescribe0012
     * @tc.number SUB_SCAN_ERRMAP_05_0012
     * @tc.desc   code 13100009 maps to device in the documented table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0012 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(13100009);
      expect(result.code).assertEqual(13100009);
      expect(result.category).assertEqual(ScanErrorCategory.DEVICE);
      expect(result.retryable).assertEqual(false);
      expect(result.messageKey).assertEqual('scan_error_no_docs');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0012 end');
    });

    /**
     * @tc.name   testErrorDescribe0013
     * @tc.number SUB_SCAN_ERRMAP_05_0013
     * @tc.desc   code 13100010 maps to device in the documented table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0013 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(13100010);
      expect(result.code).assertEqual(13100010);
      expect(result.category).assertEqual(ScanErrorCategory.DEVICE);
      expect(result.retryable).assertEqual(false);
      expect(result.messageKey).assertEqual('scan_error_cover_open');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0013 end');
    });

    /**
     * @tc.name   testErrorDescribe0014
     * @tc.number SUB_SCAN_ERRMAP_05_0014
     * @tc.desc   code 13100011 maps to device in the documented table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0014 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(13100011);
      expect(result.code).assertEqual(13100011);
      expect(result.category).assertEqual(ScanErrorCategory.DEVICE);
      expect(result.retryable).assertEqual(true);
      expect(result.messageKey).assertEqual('scan_error_io_error');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0014 end');
    });

    /**
     * @tc.name   testErrorDescribe0015
     * @tc.number SUB_SCAN_ERRMAP_05_0015
     * @tc.desc   code 13100012 maps to framework in the documented table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0015 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(13100012);
      expect(result.code).assertEqual(13100012);
      expect(result.category).assertEqual(ScanErrorCategory.FRAMEWORK);
      expect(result.retryable).assertEqual(true);
      expect(result.messageKey).assertEqual('scan_error_no_memory');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0015 end');
    });

    /**
     * @tc.name   testErrorDescribe0016
     * @tc.number SUB_SCAN_ERRMAP_05_0016
     * @tc.desc   unknown code 0 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0016 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(0);
      expect(result.code).assertEqual(0);
      expect(result.category).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(result.retryable).assertEqual(false);
      expect(result.messageKey).assertEqual('scan_error_unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0016 end');
    });

    /**
     * @tc.name   testErrorDescribe0017
     * @tc.number SUB_SCAN_ERRMAP_05_0017
     * @tc.desc   unknown code 1 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0017 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(1);
      expect(result.code).assertEqual(1);
      expect(result.category).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(result.retryable).assertEqual(false);
      expect(result.messageKey).assertEqual('scan_error_unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0017 end');
    });

    /**
     * @tc.name   testErrorDescribe0018
     * @tc.number SUB_SCAN_ERRMAP_05_0018
     * @tc.desc   unknown code -1 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0018 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(-1);
      expect(result.code).assertEqual(-1);
      expect(result.category).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(result.retryable).assertEqual(false);
      expect(result.messageKey).assertEqual('scan_error_unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0018 end');
    });

    /**
     * @tc.name   testErrorDescribe0019
     * @tc.number SUB_SCAN_ERRMAP_05_0019
     * @tc.desc   unknown code 200 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0019 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(200);
      expect(result.code).assertEqual(200);
      expect(result.category).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(result.retryable).assertEqual(false);
      expect(result.messageKey).assertEqual('scan_error_unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0019 end');
    });

    /**
     * @tc.name   testErrorDescribe0020
     * @tc.number SUB_SCAN_ERRMAP_05_0020
     * @tc.desc   unknown code 203 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0020 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(203);
      expect(result.code).assertEqual(203);
      expect(result.category).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(result.retryable).assertEqual(false);
      expect(result.messageKey).assertEqual('scan_error_unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0020 end');
    });

    /**
     * @tc.name   testErrorDescribe0021
     * @tc.number SUB_SCAN_ERRMAP_05_0021
     * @tc.desc   unknown code 400 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0021 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(400);
      expect(result.code).assertEqual(400);
      expect(result.category).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(result.retryable).assertEqual(false);
      expect(result.messageKey).assertEqual('scan_error_unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0021 end');
    });

    /**
     * @tc.name   testErrorDescribe0022
     * @tc.number SUB_SCAN_ERRMAP_05_0022
     * @tc.desc   unknown code 402 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0022 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(402);
      expect(result.code).assertEqual(402);
      expect(result.category).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(result.retryable).assertEqual(false);
      expect(result.messageKey).assertEqual('scan_error_unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0022 end');
    });

    /**
     * @tc.name   testErrorDescribe0023
     * @tc.number SUB_SCAN_ERRMAP_05_0023
     * @tc.desc   unknown code 999 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0023 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(999);
      expect(result.code).assertEqual(999);
      expect(result.category).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(result.retryable).assertEqual(false);
      expect(result.messageKey).assertEqual('scan_error_unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0023 end');
    });

    /**
     * @tc.name   testErrorDescribe0024
     * @tc.number SUB_SCAN_ERRMAP_05_0024
     * @tc.desc   unknown code 13100000 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0024 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(13100000);
      expect(result.code).assertEqual(13100000);
      expect(result.category).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(result.retryable).assertEqual(false);
      expect(result.messageKey).assertEqual('scan_error_unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0024 end');
    });

    /**
     * @tc.name   testErrorDescribe0025
     * @tc.number SUB_SCAN_ERRMAP_05_0025
     * @tc.desc   unknown code 13100013 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0025 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(13100013);
      expect(result.code).assertEqual(13100013);
      expect(result.category).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(result.retryable).assertEqual(false);
      expect(result.messageKey).assertEqual('scan_error_unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0025 end');
    });

    /**
     * @tc.name   testErrorDescribe0026
     * @tc.number SUB_SCAN_ERRMAP_05_0026
     * @tc.desc   unknown code 13100014 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0026 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(13100014);
      expect(result.code).assertEqual(13100014);
      expect(result.category).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(result.retryable).assertEqual(false);
      expect(result.messageKey).assertEqual('scan_error_unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0026 end');
    });

    /**
     * @tc.name   testErrorDescribe0027
     * @tc.number SUB_SCAN_ERRMAP_05_0027
     * @tc.desc   unknown code 13100099 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0027 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(13100099);
      expect(result.code).assertEqual(13100099);
      expect(result.category).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(result.retryable).assertEqual(false);
      expect(result.messageKey).assertEqual('scan_error_unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0027 end');
    });

    /**
     * @tc.name   testErrorDescribe0028
     * @tc.number SUB_SCAN_ERRMAP_05_0028
     * @tc.desc   unknown code 13100100 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0028 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(13100100);
      expect(result.code).assertEqual(13100100);
      expect(result.category).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(result.retryable).assertEqual(false);
      expect(result.messageKey).assertEqual('scan_error_unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0028 end');
    });

    /**
     * @tc.name   testErrorDescribe0029
     * @tc.number SUB_SCAN_ERRMAP_05_0029
     * @tc.desc   unknown code 99999999 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0029 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(99999999);
      expect(result.code).assertEqual(99999999);
      expect(result.category).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(result.retryable).assertEqual(false);
      expect(result.messageKey).assertEqual('scan_error_unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0029 end');
    });

    /**
     * @tc.name   testErrorDescribe0030
     * @tc.number SUB_SCAN_ERRMAP_05_0030
     * @tc.desc   unknown code -13100001 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0030 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(-13100001);
      expect(result.code).assertEqual(-13100001);
      expect(result.category).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(result.retryable).assertEqual(false);
      expect(result.messageKey).assertEqual('scan_error_unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0030 end');
    });

    /**
     * @tc.name   testErrorDescribe0031
     * @tc.number SUB_SCAN_ERRMAP_05_0031
     * @tc.desc   unknown code 1000 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0031 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(1000);
      expect(result.code).assertEqual(1000);
      expect(result.category).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(result.retryable).assertEqual(false);
      expect(result.messageKey).assertEqual('scan_error_unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0031 end');
    });

    /**
     * @tc.name   testErrorDescribe0032
     * @tc.number SUB_SCAN_ERRMAP_05_0032
     * @tc.desc   unknown code 1007 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0032 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(1007);
      expect(result.code).assertEqual(1007);
      expect(result.category).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(result.retryable).assertEqual(false);
      expect(result.messageKey).assertEqual('scan_error_unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0032 end');
    });

    /**
     * @tc.name   testErrorDescribe0033
     * @tc.number SUB_SCAN_ERRMAP_05_0033
     * @tc.desc   unknown code 1014 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0033 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(1014);
      expect(result.code).assertEqual(1014);
      expect(result.category).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(result.retryable).assertEqual(false);
      expect(result.messageKey).assertEqual('scan_error_unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0033 end');
    });

    /**
     * @tc.name   testErrorDescribe0034
     * @tc.number SUB_SCAN_ERRMAP_05_0034
     * @tc.desc   unknown code 1021 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0034 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(1021);
      expect(result.code).assertEqual(1021);
      expect(result.category).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(result.retryable).assertEqual(false);
      expect(result.messageKey).assertEqual('scan_error_unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0034 end');
    });

    /**
     * @tc.name   testErrorDescribe0035
     * @tc.number SUB_SCAN_ERRMAP_05_0035
     * @tc.desc   unknown code 1028 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0035 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(1028);
      expect(result.code).assertEqual(1028);
      expect(result.category).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(result.retryable).assertEqual(false);
      expect(result.messageKey).assertEqual('scan_error_unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0035 end');
    });

    /**
     * @tc.name   testErrorDescribe0036
     * @tc.number SUB_SCAN_ERRMAP_05_0036
     * @tc.desc   unknown code 1035 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0036 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(1035);
      expect(result.code).assertEqual(1035);
      expect(result.category).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(result.retryable).assertEqual(false);
      expect(result.messageKey).assertEqual('scan_error_unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0036 end');
    });

    /**
     * @tc.name   testErrorDescribe0037
     * @tc.number SUB_SCAN_ERRMAP_05_0037
     * @tc.desc   unknown code 1042 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0037 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(1042);
      expect(result.code).assertEqual(1042);
      expect(result.category).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(result.retryable).assertEqual(false);
      expect(result.messageKey).assertEqual('scan_error_unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0037 end');
    });

    /**
     * @tc.name   testErrorDescribe0038
     * @tc.number SUB_SCAN_ERRMAP_05_0038
     * @tc.desc   unknown code 1049 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0038 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(1049);
      expect(result.code).assertEqual(1049);
      expect(result.category).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(result.retryable).assertEqual(false);
      expect(result.messageKey).assertEqual('scan_error_unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0038 end');
    });

    /**
     * @tc.name   testErrorDescribe0039
     * @tc.number SUB_SCAN_ERRMAP_05_0039
     * @tc.desc   unknown code 1056 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0039 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(1056);
      expect(result.code).assertEqual(1056);
      expect(result.category).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(result.retryable).assertEqual(false);
      expect(result.messageKey).assertEqual('scan_error_unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0039 end');
    });

    /**
     * @tc.name   testErrorDescribe0040
     * @tc.number SUB_SCAN_ERRMAP_05_0040
     * @tc.desc   unknown code 1063 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0040 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(1063);
      expect(result.code).assertEqual(1063);
      expect(result.category).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(result.retryable).assertEqual(false);
      expect(result.messageKey).assertEqual('scan_error_unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0040 end');
    });

    /**
     * @tc.name   testErrorDescribe0041
     * @tc.number SUB_SCAN_ERRMAP_05_0041
     * @tc.desc   unknown code 1070 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0041 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(1070);
      expect(result.code).assertEqual(1070);
      expect(result.category).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(result.retryable).assertEqual(false);
      expect(result.messageKey).assertEqual('scan_error_unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0041 end');
    });

    /**
     * @tc.name   testErrorDescribe0042
     * @tc.number SUB_SCAN_ERRMAP_05_0042
     * @tc.desc   unknown code 1077 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0042 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(1077);
      expect(result.code).assertEqual(1077);
      expect(result.category).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(result.retryable).assertEqual(false);
      expect(result.messageKey).assertEqual('scan_error_unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0042 end');
    });

    /**
     * @tc.name   testErrorDescribe0043
     * @tc.number SUB_SCAN_ERRMAP_05_0043
     * @tc.desc   unknown code 1084 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0043 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(1084);
      expect(result.code).assertEqual(1084);
      expect(result.category).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(result.retryable).assertEqual(false);
      expect(result.messageKey).assertEqual('scan_error_unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0043 end');
    });

    /**
     * @tc.name   testErrorDescribe0044
     * @tc.number SUB_SCAN_ERRMAP_05_0044
     * @tc.desc   unknown code 1091 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0044 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(1091);
      expect(result.code).assertEqual(1091);
      expect(result.category).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(result.retryable).assertEqual(false);
      expect(result.messageKey).assertEqual('scan_error_unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0044 end');
    });

    /**
     * @tc.name   testErrorDescribe0045
     * @tc.number SUB_SCAN_ERRMAP_05_0045
     * @tc.desc   unknown code 1098 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0045 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(1098);
      expect(result.code).assertEqual(1098);
      expect(result.category).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(result.retryable).assertEqual(false);
      expect(result.messageKey).assertEqual('scan_error_unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0045 end');
    });

    /**
     * @tc.name   testErrorDescribe0046
     * @tc.number SUB_SCAN_ERRMAP_05_0046
     * @tc.desc   unknown code 1105 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0046 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(1105);
      expect(result.code).assertEqual(1105);
      expect(result.category).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(result.retryable).assertEqual(false);
      expect(result.messageKey).assertEqual('scan_error_unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0046 end');
    });

    /**
     * @tc.name   testErrorDescribe0047
     * @tc.number SUB_SCAN_ERRMAP_05_0047
     * @tc.desc   unknown code 1112 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0047 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(1112);
      expect(result.code).assertEqual(1112);
      expect(result.category).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(result.retryable).assertEqual(false);
      expect(result.messageKey).assertEqual('scan_error_unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0047 end');
    });

    /**
     * @tc.name   testErrorDescribe0048
     * @tc.number SUB_SCAN_ERRMAP_05_0048
     * @tc.desc   unknown code 1119 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0048 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(1119);
      expect(result.code).assertEqual(1119);
      expect(result.category).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(result.retryable).assertEqual(false);
      expect(result.messageKey).assertEqual('scan_error_unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0048 end');
    });

    /**
     * @tc.name   testErrorDescribe0049
     * @tc.number SUB_SCAN_ERRMAP_05_0049
     * @tc.desc   unknown code 1126 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0049 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(1126);
      expect(result.code).assertEqual(1126);
      expect(result.category).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(result.retryable).assertEqual(false);
      expect(result.messageKey).assertEqual('scan_error_unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0049 end');
    });

    /**
     * @tc.name   testErrorDescribe0050
     * @tc.number SUB_SCAN_ERRMAP_05_0050
     * @tc.desc   unknown code 1133 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0050 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(1133);
      expect(result.code).assertEqual(1133);
      expect(result.category).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(result.retryable).assertEqual(false);
      expect(result.messageKey).assertEqual('scan_error_unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0050 end');
    });

    /**
     * @tc.name   testErrorDescribe0051
     * @tc.number SUB_SCAN_ERRMAP_05_0051
     * @tc.desc   unknown code 1140 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0051 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(1140);
      expect(result.code).assertEqual(1140);
      expect(result.category).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(result.retryable).assertEqual(false);
      expect(result.messageKey).assertEqual('scan_error_unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0051 end');
    });

    /**
     * @tc.name   testErrorDescribe0052
     * @tc.number SUB_SCAN_ERRMAP_05_0052
     * @tc.desc   unknown code 1147 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0052 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(1147);
      expect(result.code).assertEqual(1147);
      expect(result.category).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(result.retryable).assertEqual(false);
      expect(result.messageKey).assertEqual('scan_error_unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0052 end');
    });

    /**
     * @tc.name   testErrorDescribe0053
     * @tc.number SUB_SCAN_ERRMAP_05_0053
     * @tc.desc   unknown code 1154 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0053 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(1154);
      expect(result.code).assertEqual(1154);
      expect(result.category).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(result.retryable).assertEqual(false);
      expect(result.messageKey).assertEqual('scan_error_unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0053 end');
    });

    /**
     * @tc.name   testErrorDescribe0054
     * @tc.number SUB_SCAN_ERRMAP_05_0054
     * @tc.desc   unknown code 1161 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0054 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(1161);
      expect(result.code).assertEqual(1161);
      expect(result.category).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(result.retryable).assertEqual(false);
      expect(result.messageKey).assertEqual('scan_error_unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0054 end');
    });

    /**
     * @tc.name   testErrorDescribe0055
     * @tc.number SUB_SCAN_ERRMAP_05_0055
     * @tc.desc   unknown code 1168 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0055 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(1168);
      expect(result.code).assertEqual(1168);
      expect(result.category).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(result.retryable).assertEqual(false);
      expect(result.messageKey).assertEqual('scan_error_unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0055 end');
    });

    /**
     * @tc.name   testErrorDescribe0056
     * @tc.number SUB_SCAN_ERRMAP_05_0056
     * @tc.desc   unknown code 1175 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0056 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(1175);
      expect(result.code).assertEqual(1175);
      expect(result.category).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(result.retryable).assertEqual(false);
      expect(result.messageKey).assertEqual('scan_error_unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0056 end');
    });

    /**
     * @tc.name   testErrorDescribe0057
     * @tc.number SUB_SCAN_ERRMAP_05_0057
     * @tc.desc   unknown code 1182 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0057 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(1182);
      expect(result.code).assertEqual(1182);
      expect(result.category).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(result.retryable).assertEqual(false);
      expect(result.messageKey).assertEqual('scan_error_unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0057 end');
    });

    /**
     * @tc.name   testErrorDescribe0058
     * @tc.number SUB_SCAN_ERRMAP_05_0058
     * @tc.desc   unknown code 1189 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0058 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(1189);
      expect(result.code).assertEqual(1189);
      expect(result.category).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(result.retryable).assertEqual(false);
      expect(result.messageKey).assertEqual('scan_error_unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0058 end');
    });

    /**
     * @tc.name   testErrorDescribe0059
     * @tc.number SUB_SCAN_ERRMAP_05_0059
     * @tc.desc   unknown code 1196 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0059 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(1196);
      expect(result.code).assertEqual(1196);
      expect(result.category).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(result.retryable).assertEqual(false);
      expect(result.messageKey).assertEqual('scan_error_unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0059 end');
    });

    /**
     * @tc.name   testErrorDescribe0060
     * @tc.number SUB_SCAN_ERRMAP_05_0060
     * @tc.desc   unknown code 1203 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0060 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(1203);
      expect(result.code).assertEqual(1203);
      expect(result.category).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(result.retryable).assertEqual(false);
      expect(result.messageKey).assertEqual('scan_error_unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0060 end');
    });

    /**
     * @tc.name   testErrorDescribe0061
     * @tc.number SUB_SCAN_ERRMAP_05_0061
     * @tc.desc   unknown code 1210 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0061 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(1210);
      expect(result.code).assertEqual(1210);
      expect(result.category).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(result.retryable).assertEqual(false);
      expect(result.messageKey).assertEqual('scan_error_unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0061 end');
    });

    /**
     * @tc.name   testErrorDescribe0062
     * @tc.number SUB_SCAN_ERRMAP_05_0062
     * @tc.desc   unknown code 1217 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0062 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(1217);
      expect(result.code).assertEqual(1217);
      expect(result.category).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(result.retryable).assertEqual(false);
      expect(result.messageKey).assertEqual('scan_error_unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0062 end');
    });

    /**
     * @tc.name   testErrorDescribe0063
     * @tc.number SUB_SCAN_ERRMAP_05_0063
     * @tc.desc   unknown code 1224 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0063 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(1224);
      expect(result.code).assertEqual(1224);
      expect(result.category).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(result.retryable).assertEqual(false);
      expect(result.messageKey).assertEqual('scan_error_unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0063 end');
    });

    /**
     * @tc.name   testErrorDescribe0064
     * @tc.number SUB_SCAN_ERRMAP_05_0064
     * @tc.desc   unknown code 1231 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0064 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(1231);
      expect(result.code).assertEqual(1231);
      expect(result.category).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(result.retryable).assertEqual(false);
      expect(result.messageKey).assertEqual('scan_error_unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0064 end');
    });

    /**
     * @tc.name   testErrorDescribe0065
     * @tc.number SUB_SCAN_ERRMAP_05_0065
     * @tc.desc   unknown code 1238 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0065 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(1238);
      expect(result.code).assertEqual(1238);
      expect(result.category).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(result.retryable).assertEqual(false);
      expect(result.messageKey).assertEqual('scan_error_unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0065 end');
    });

    /**
     * @tc.name   testErrorDescribe0066
     * @tc.number SUB_SCAN_ERRMAP_05_0066
     * @tc.desc   unknown code 1245 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0066 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(1245);
      expect(result.code).assertEqual(1245);
      expect(result.category).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(result.retryable).assertEqual(false);
      expect(result.messageKey).assertEqual('scan_error_unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0066 end');
    });

    /**
     * @tc.name   testErrorDescribe0067
     * @tc.number SUB_SCAN_ERRMAP_05_0067
     * @tc.desc   unknown code 1252 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0067 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(1252);
      expect(result.code).assertEqual(1252);
      expect(result.category).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(result.retryable).assertEqual(false);
      expect(result.messageKey).assertEqual('scan_error_unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0067 end');
    });

    /**
     * @tc.name   testErrorDescribe0068
     * @tc.number SUB_SCAN_ERRMAP_05_0068
     * @tc.desc   unknown code 1259 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0068 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(1259);
      expect(result.code).assertEqual(1259);
      expect(result.category).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(result.retryable).assertEqual(false);
      expect(result.messageKey).assertEqual('scan_error_unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0068 end');
    });

    /**
     * @tc.name   testErrorDescribe0069
     * @tc.number SUB_SCAN_ERRMAP_05_0069
     * @tc.desc   unknown code 1266 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0069 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(1266);
      expect(result.code).assertEqual(1266);
      expect(result.category).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(result.retryable).assertEqual(false);
      expect(result.messageKey).assertEqual('scan_error_unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0069 end');
    });

    /**
     * @tc.name   testErrorDescribe0070
     * @tc.number SUB_SCAN_ERRMAP_05_0070
     * @tc.desc   unknown code 1273 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0070 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(1273);
      expect(result.code).assertEqual(1273);
      expect(result.category).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(result.retryable).assertEqual(false);
      expect(result.messageKey).assertEqual('scan_error_unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0070 end');
    });

    /**
     * @tc.name   testErrorDescribe0071
     * @tc.number SUB_SCAN_ERRMAP_05_0071
     * @tc.desc   unknown code 1280 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0071 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(1280);
      expect(result.code).assertEqual(1280);
      expect(result.category).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(result.retryable).assertEqual(false);
      expect(result.messageKey).assertEqual('scan_error_unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0071 end');
    });

    /**
     * @tc.name   testErrorDescribe0072
     * @tc.number SUB_SCAN_ERRMAP_05_0072
     * @tc.desc   unknown code 1287 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0072 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(1287);
      expect(result.code).assertEqual(1287);
      expect(result.category).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(result.retryable).assertEqual(false);
      expect(result.messageKey).assertEqual('scan_error_unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0072 end');
    });

    /**
     * @tc.name   testErrorDescribe0073
     * @tc.number SUB_SCAN_ERRMAP_05_0073
     * @tc.desc   unknown code 1294 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0073 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(1294);
      expect(result.code).assertEqual(1294);
      expect(result.category).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(result.retryable).assertEqual(false);
      expect(result.messageKey).assertEqual('scan_error_unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0073 end');
    });

    /**
     * @tc.name   testErrorDescribe0074
     * @tc.number SUB_SCAN_ERRMAP_05_0074
     * @tc.desc   unknown code 1301 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0074 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(1301);
      expect(result.code).assertEqual(1301);
      expect(result.category).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(result.retryable).assertEqual(false);
      expect(result.messageKey).assertEqual('scan_error_unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0074 end');
    });

    /**
     * @tc.name   testErrorDescribe0075
     * @tc.number SUB_SCAN_ERRMAP_05_0075
     * @tc.desc   unknown code 1308 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0075 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(1308);
      expect(result.code).assertEqual(1308);
      expect(result.category).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(result.retryable).assertEqual(false);
      expect(result.messageKey).assertEqual('scan_error_unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0075 end');
    });

    /**
     * @tc.name   testErrorDescribe0076
     * @tc.number SUB_SCAN_ERRMAP_05_0076
     * @tc.desc   unknown code 1315 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0076 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(1315);
      expect(result.code).assertEqual(1315);
      expect(result.category).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(result.retryable).assertEqual(false);
      expect(result.messageKey).assertEqual('scan_error_unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0076 end');
    });

    /**
     * @tc.name   testErrorDescribe0077
     * @tc.number SUB_SCAN_ERRMAP_05_0077
     * @tc.desc   unknown code 1322 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0077 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(1322);
      expect(result.code).assertEqual(1322);
      expect(result.category).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(result.retryable).assertEqual(false);
      expect(result.messageKey).assertEqual('scan_error_unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0077 end');
    });

    /**
     * @tc.name   testErrorDescribe0078
     * @tc.number SUB_SCAN_ERRMAP_05_0078
     * @tc.desc   unknown code 1329 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0078 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(1329);
      expect(result.code).assertEqual(1329);
      expect(result.category).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(result.retryable).assertEqual(false);
      expect(result.messageKey).assertEqual('scan_error_unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0078 end');
    });

    /**
     * @tc.name   testErrorDescribe0079
     * @tc.number SUB_SCAN_ERRMAP_05_0079
     * @tc.desc   unknown code 1336 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0079 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(1336);
      expect(result.code).assertEqual(1336);
      expect(result.category).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(result.retryable).assertEqual(false);
      expect(result.messageKey).assertEqual('scan_error_unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0079 end');
    });

    /**
     * @tc.name   testErrorDescribe0080
     * @tc.number SUB_SCAN_ERRMAP_05_0080
     * @tc.desc   unknown code 1343 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0080 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(1343);
      expect(result.code).assertEqual(1343);
      expect(result.category).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(result.retryable).assertEqual(false);
      expect(result.messageKey).assertEqual('scan_error_unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0080 end');
    });

    /**
     * @tc.name   testErrorDescribe0081
     * @tc.number SUB_SCAN_ERRMAP_05_0081
     * @tc.desc   unknown code 1350 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0081 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(1350);
      expect(result.code).assertEqual(1350);
      expect(result.category).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(result.retryable).assertEqual(false);
      expect(result.messageKey).assertEqual('scan_error_unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0081 end');
    });

    /**
     * @tc.name   testErrorDescribe0082
     * @tc.number SUB_SCAN_ERRMAP_05_0082
     * @tc.desc   unknown code 1357 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0082 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(1357);
      expect(result.code).assertEqual(1357);
      expect(result.category).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(result.retryable).assertEqual(false);
      expect(result.messageKey).assertEqual('scan_error_unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0082 end');
    });

    /**
     * @tc.name   testErrorDescribe0083
     * @tc.number SUB_SCAN_ERRMAP_05_0083
     * @tc.desc   unknown code 1364 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0083 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(1364);
      expect(result.code).assertEqual(1364);
      expect(result.category).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(result.retryable).assertEqual(false);
      expect(result.messageKey).assertEqual('scan_error_unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0083 end');
    });

    /**
     * @tc.name   testErrorDescribe0084
     * @tc.number SUB_SCAN_ERRMAP_05_0084
     * @tc.desc   unknown code 1371 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0084 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(1371);
      expect(result.code).assertEqual(1371);
      expect(result.category).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(result.retryable).assertEqual(false);
      expect(result.messageKey).assertEqual('scan_error_unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0084 end');
    });

    /**
     * @tc.name   testErrorDescribe0085
     * @tc.number SUB_SCAN_ERRMAP_05_0085
     * @tc.desc   unknown code 1378 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0085 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(1378);
      expect(result.code).assertEqual(1378);
      expect(result.category).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(result.retryable).assertEqual(false);
      expect(result.messageKey).assertEqual('scan_error_unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0085 end');
    });

    /**
     * @tc.name   testErrorDescribe0086
     * @tc.number SUB_SCAN_ERRMAP_05_0086
     * @tc.desc   unknown code 1385 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0086 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(1385);
      expect(result.code).assertEqual(1385);
      expect(result.category).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(result.retryable).assertEqual(false);
      expect(result.messageKey).assertEqual('scan_error_unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0086 end');
    });

    /**
     * @tc.name   testErrorDescribe0087
     * @tc.number SUB_SCAN_ERRMAP_05_0087
     * @tc.desc   unknown code 1392 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0087 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(1392);
      expect(result.code).assertEqual(1392);
      expect(result.category).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(result.retryable).assertEqual(false);
      expect(result.messageKey).assertEqual('scan_error_unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0087 end');
    });

    /**
     * @tc.name   testErrorDescribe0088
     * @tc.number SUB_SCAN_ERRMAP_05_0088
     * @tc.desc   unknown code 1399 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0088 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(1399);
      expect(result.code).assertEqual(1399);
      expect(result.category).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(result.retryable).assertEqual(false);
      expect(result.messageKey).assertEqual('scan_error_unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0088 end');
    });

    /**
     * @tc.name   testErrorDescribe0089
     * @tc.number SUB_SCAN_ERRMAP_05_0089
     * @tc.desc   unknown code 1406 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0089 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(1406);
      expect(result.code).assertEqual(1406);
      expect(result.category).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(result.retryable).assertEqual(false);
      expect(result.messageKey).assertEqual('scan_error_unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0089 end');
    });

    /**
     * @tc.name   testErrorDescribe0090
     * @tc.number SUB_SCAN_ERRMAP_05_0090
     * @tc.desc   unknown code 1413 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorDescribe0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0090 begin');
      const result: ScanErrorInfo = ScanErrorMapper.describe(1413);
      expect(result.code).assertEqual(1413);
      expect(result.category).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(result.retryable).assertEqual(false);
      expect(result.messageKey).assertEqual('scan_error_unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorDescribe0090 end');
    });

  });
}
