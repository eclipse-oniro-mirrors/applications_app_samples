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

export default function scanErrorMapVolume04Test() {
  describe('ScanErrorMapVolume04', () => {

    /**
     * @tc.name   testErrorKey0001
     * @tc.number SUB_SCAN_ERRMAP_04_0001
     * @tc.desc   code 201 maps to permission in the documented table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0001 begin');
      const result: string = ScanErrorMapper.getMessageKey(201);
      expect(result).assertEqual('scan_error_no_permission');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(false);
      expect(ScanErrorMapper.getCategory(201)).assertEqual(ScanErrorCategory.PERMISSION);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0001 end');
    });

    /**
     * @tc.name   testErrorKey0002
     * @tc.number SUB_SCAN_ERRMAP_04_0002
     * @tc.desc   code 202 maps to framework in the documented table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0002 begin');
      const result: string = ScanErrorMapper.getMessageKey(202);
      expect(result).assertEqual('scan_error_not_system_application');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(false);
      expect(ScanErrorMapper.getCategory(202)).assertEqual(ScanErrorCategory.FRAMEWORK);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0002 end');
    });

    /**
     * @tc.name   testErrorKey0003
     * @tc.number SUB_SCAN_ERRMAP_04_0003
     * @tc.desc   code 401 maps to parameter in the documented table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0003 begin');
      const result: string = ScanErrorMapper.getMessageKey(401);
      expect(result).assertEqual('scan_error_invalid_parameter');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(false);
      expect(ScanErrorMapper.getCategory(401)).assertEqual(ScanErrorCategory.PARAMETER);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0003 end');
    });

    /**
     * @tc.name   testErrorKey0004
     * @tc.number SUB_SCAN_ERRMAP_04_0004
     * @tc.desc   code 13100001 maps to framework in the documented table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0004 begin');
      const result: string = ScanErrorMapper.getMessageKey(13100001);
      expect(result).assertEqual('scan_error_generic_failure');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(false);
      expect(ScanErrorMapper.getCategory(13100001)).assertEqual(ScanErrorCategory.FRAMEWORK);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0004 end');
    });

    /**
     * @tc.name   testErrorKey0005
     * @tc.number SUB_SCAN_ERRMAP_04_0005
     * @tc.desc   code 13100002 maps to framework in the documented table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0005 begin');
      const result: string = ScanErrorMapper.getMessageKey(13100002);
      expect(result).assertEqual('scan_error_rpc_failure');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(false);
      expect(ScanErrorMapper.getCategory(13100002)).assertEqual(ScanErrorCategory.FRAMEWORK);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0005 end');
    });

    /**
     * @tc.name   testErrorKey0006
     * @tc.number SUB_SCAN_ERRMAP_04_0006
     * @tc.desc   code 13100003 maps to framework in the documented table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0006 begin');
      const result: string = ScanErrorMapper.getMessageKey(13100003);
      expect(result).assertEqual('scan_error_server_failure');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(false);
      expect(ScanErrorMapper.getCategory(13100003)).assertEqual(ScanErrorCategory.FRAMEWORK);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0006 end');
    });

    /**
     * @tc.name   testErrorKey0007
     * @tc.number SUB_SCAN_ERRMAP_04_0007
     * @tc.desc   code 13100004 maps to framework in the documented table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0007 begin');
      const result: string = ScanErrorMapper.getMessageKey(13100004);
      expect(result).assertEqual('scan_error_unsupported');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(false);
      expect(ScanErrorMapper.getCategory(13100004)).assertEqual(ScanErrorCategory.FRAMEWORK);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0007 end');
    });

    /**
     * @tc.name   testErrorKey0008
     * @tc.number SUB_SCAN_ERRMAP_04_0008
     * @tc.desc   code 13100005 maps to device in the documented table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0008 begin');
      const result: string = ScanErrorMapper.getMessageKey(13100005);
      expect(result).assertEqual('scan_error_canceled');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(false);
      expect(ScanErrorMapper.getCategory(13100005)).assertEqual(ScanErrorCategory.DEVICE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0008 end');
    });

    /**
     * @tc.name   testErrorKey0009
     * @tc.number SUB_SCAN_ERRMAP_04_0009
     * @tc.desc   code 13100006 maps to device in the documented table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0009 begin');
      const result: string = ScanErrorMapper.getMessageKey(13100006);
      expect(result).assertEqual('scan_error_device_busy');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(false);
      expect(ScanErrorMapper.getCategory(13100006)).assertEqual(ScanErrorCategory.DEVICE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0009 end');
    });

    /**
     * @tc.name   testErrorKey0010
     * @tc.number SUB_SCAN_ERRMAP_04_0010
     * @tc.desc   code 13100007 maps to device in the documented table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0010 begin');
      const result: string = ScanErrorMapper.getMessageKey(13100007);
      expect(result).assertEqual('scan_error_invalid');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(false);
      expect(ScanErrorMapper.getCategory(13100007)).assertEqual(ScanErrorCategory.DEVICE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0010 end');
    });

    /**
     * @tc.name   testErrorKey0011
     * @tc.number SUB_SCAN_ERRMAP_04_0011
     * @tc.desc   code 13100008 maps to device in the documented table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0011 begin');
      const result: string = ScanErrorMapper.getMessageKey(13100008);
      expect(result).assertEqual('scan_error_jammed');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(false);
      expect(ScanErrorMapper.getCategory(13100008)).assertEqual(ScanErrorCategory.DEVICE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0011 end');
    });

    /**
     * @tc.name   testErrorKey0012
     * @tc.number SUB_SCAN_ERRMAP_04_0012
     * @tc.desc   code 13100009 maps to device in the documented table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0012 begin');
      const result: string = ScanErrorMapper.getMessageKey(13100009);
      expect(result).assertEqual('scan_error_no_docs');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(false);
      expect(ScanErrorMapper.getCategory(13100009)).assertEqual(ScanErrorCategory.DEVICE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0012 end');
    });

    /**
     * @tc.name   testErrorKey0013
     * @tc.number SUB_SCAN_ERRMAP_04_0013
     * @tc.desc   code 13100010 maps to device in the documented table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0013 begin');
      const result: string = ScanErrorMapper.getMessageKey(13100010);
      expect(result).assertEqual('scan_error_cover_open');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(false);
      expect(ScanErrorMapper.getCategory(13100010)).assertEqual(ScanErrorCategory.DEVICE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0013 end');
    });

    /**
     * @tc.name   testErrorKey0014
     * @tc.number SUB_SCAN_ERRMAP_04_0014
     * @tc.desc   code 13100011 maps to device in the documented table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0014 begin');
      const result: string = ScanErrorMapper.getMessageKey(13100011);
      expect(result).assertEqual('scan_error_io_error');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(false);
      expect(ScanErrorMapper.getCategory(13100011)).assertEqual(ScanErrorCategory.DEVICE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0014 end');
    });

    /**
     * @tc.name   testErrorKey0015
     * @tc.number SUB_SCAN_ERRMAP_04_0015
     * @tc.desc   code 13100012 maps to framework in the documented table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0015 begin');
      const result: string = ScanErrorMapper.getMessageKey(13100012);
      expect(result).assertEqual('scan_error_no_memory');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(false);
      expect(ScanErrorMapper.getCategory(13100012)).assertEqual(ScanErrorCategory.FRAMEWORK);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0015 end');
    });

    /**
     * @tc.name   testErrorKey0016
     * @tc.number SUB_SCAN_ERRMAP_04_0016
     * @tc.desc   unknown code 0 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0016 begin');
      const result: string = ScanErrorMapper.getMessageKey(0);
      expect(result).assertEqual('scan_error_unknown');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(true);
      expect(ScanErrorMapper.getCategory(0)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0016 end');
    });

    /**
     * @tc.name   testErrorKey0017
     * @tc.number SUB_SCAN_ERRMAP_04_0017
     * @tc.desc   unknown code 1 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0017 begin');
      const result: string = ScanErrorMapper.getMessageKey(1);
      expect(result).assertEqual('scan_error_unknown');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(true);
      expect(ScanErrorMapper.getCategory(1)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0017 end');
    });

    /**
     * @tc.name   testErrorKey0018
     * @tc.number SUB_SCAN_ERRMAP_04_0018
     * @tc.desc   unknown code -1 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0018 begin');
      const result: string = ScanErrorMapper.getMessageKey(-1);
      expect(result).assertEqual('scan_error_unknown');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(true);
      expect(ScanErrorMapper.getCategory(-1)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0018 end');
    });

    /**
     * @tc.name   testErrorKey0019
     * @tc.number SUB_SCAN_ERRMAP_04_0019
     * @tc.desc   unknown code 200 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0019 begin');
      const result: string = ScanErrorMapper.getMessageKey(200);
      expect(result).assertEqual('scan_error_unknown');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(true);
      expect(ScanErrorMapper.getCategory(200)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0019 end');
    });

    /**
     * @tc.name   testErrorKey0020
     * @tc.number SUB_SCAN_ERRMAP_04_0020
     * @tc.desc   unknown code 203 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0020 begin');
      const result: string = ScanErrorMapper.getMessageKey(203);
      expect(result).assertEqual('scan_error_unknown');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(true);
      expect(ScanErrorMapper.getCategory(203)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0020 end');
    });

    /**
     * @tc.name   testErrorKey0021
     * @tc.number SUB_SCAN_ERRMAP_04_0021
     * @tc.desc   unknown code 400 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0021 begin');
      const result: string = ScanErrorMapper.getMessageKey(400);
      expect(result).assertEqual('scan_error_unknown');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(true);
      expect(ScanErrorMapper.getCategory(400)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0021 end');
    });

    /**
     * @tc.name   testErrorKey0022
     * @tc.number SUB_SCAN_ERRMAP_04_0022
     * @tc.desc   unknown code 402 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0022 begin');
      const result: string = ScanErrorMapper.getMessageKey(402);
      expect(result).assertEqual('scan_error_unknown');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(true);
      expect(ScanErrorMapper.getCategory(402)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0022 end');
    });

    /**
     * @tc.name   testErrorKey0023
     * @tc.number SUB_SCAN_ERRMAP_04_0023
     * @tc.desc   unknown code 999 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0023 begin');
      const result: string = ScanErrorMapper.getMessageKey(999);
      expect(result).assertEqual('scan_error_unknown');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(true);
      expect(ScanErrorMapper.getCategory(999)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0023 end');
    });

    /**
     * @tc.name   testErrorKey0024
     * @tc.number SUB_SCAN_ERRMAP_04_0024
     * @tc.desc   unknown code 13100000 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0024 begin');
      const result: string = ScanErrorMapper.getMessageKey(13100000);
      expect(result).assertEqual('scan_error_unknown');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(true);
      expect(ScanErrorMapper.getCategory(13100000)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0024 end');
    });

    /**
     * @tc.name   testErrorKey0025
     * @tc.number SUB_SCAN_ERRMAP_04_0025
     * @tc.desc   unknown code 13100013 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0025 begin');
      const result: string = ScanErrorMapper.getMessageKey(13100013);
      expect(result).assertEqual('scan_error_unknown');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(true);
      expect(ScanErrorMapper.getCategory(13100013)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0025 end');
    });

    /**
     * @tc.name   testErrorKey0026
     * @tc.number SUB_SCAN_ERRMAP_04_0026
     * @tc.desc   unknown code 13100014 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0026 begin');
      const result: string = ScanErrorMapper.getMessageKey(13100014);
      expect(result).assertEqual('scan_error_unknown');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(true);
      expect(ScanErrorMapper.getCategory(13100014)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0026 end');
    });

    /**
     * @tc.name   testErrorKey0027
     * @tc.number SUB_SCAN_ERRMAP_04_0027
     * @tc.desc   unknown code 13100099 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0027 begin');
      const result: string = ScanErrorMapper.getMessageKey(13100099);
      expect(result).assertEqual('scan_error_unknown');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(true);
      expect(ScanErrorMapper.getCategory(13100099)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0027 end');
    });

    /**
     * @tc.name   testErrorKey0028
     * @tc.number SUB_SCAN_ERRMAP_04_0028
     * @tc.desc   unknown code 13100100 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0028 begin');
      const result: string = ScanErrorMapper.getMessageKey(13100100);
      expect(result).assertEqual('scan_error_unknown');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(true);
      expect(ScanErrorMapper.getCategory(13100100)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0028 end');
    });

    /**
     * @tc.name   testErrorKey0029
     * @tc.number SUB_SCAN_ERRMAP_04_0029
     * @tc.desc   unknown code 99999999 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0029 begin');
      const result: string = ScanErrorMapper.getMessageKey(99999999);
      expect(result).assertEqual('scan_error_unknown');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(true);
      expect(ScanErrorMapper.getCategory(99999999)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0029 end');
    });

    /**
     * @tc.name   testErrorKey0030
     * @tc.number SUB_SCAN_ERRMAP_04_0030
     * @tc.desc   unknown code -13100001 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0030 begin');
      const result: string = ScanErrorMapper.getMessageKey(-13100001);
      expect(result).assertEqual('scan_error_unknown');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(true);
      expect(ScanErrorMapper.getCategory(-13100001)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0030 end');
    });

    /**
     * @tc.name   testErrorKey0031
     * @tc.number SUB_SCAN_ERRMAP_04_0031
     * @tc.desc   unknown code 1000 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0031 begin');
      const result: string = ScanErrorMapper.getMessageKey(1000);
      expect(result).assertEqual('scan_error_unknown');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(true);
      expect(ScanErrorMapper.getCategory(1000)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0031 end');
    });

    /**
     * @tc.name   testErrorKey0032
     * @tc.number SUB_SCAN_ERRMAP_04_0032
     * @tc.desc   unknown code 1007 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0032 begin');
      const result: string = ScanErrorMapper.getMessageKey(1007);
      expect(result).assertEqual('scan_error_unknown');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(true);
      expect(ScanErrorMapper.getCategory(1007)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0032 end');
    });

    /**
     * @tc.name   testErrorKey0033
     * @tc.number SUB_SCAN_ERRMAP_04_0033
     * @tc.desc   unknown code 1014 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0033 begin');
      const result: string = ScanErrorMapper.getMessageKey(1014);
      expect(result).assertEqual('scan_error_unknown');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(true);
      expect(ScanErrorMapper.getCategory(1014)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0033 end');
    });

    /**
     * @tc.name   testErrorKey0034
     * @tc.number SUB_SCAN_ERRMAP_04_0034
     * @tc.desc   unknown code 1021 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0034 begin');
      const result: string = ScanErrorMapper.getMessageKey(1021);
      expect(result).assertEqual('scan_error_unknown');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(true);
      expect(ScanErrorMapper.getCategory(1021)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0034 end');
    });

    /**
     * @tc.name   testErrorKey0035
     * @tc.number SUB_SCAN_ERRMAP_04_0035
     * @tc.desc   unknown code 1028 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0035 begin');
      const result: string = ScanErrorMapper.getMessageKey(1028);
      expect(result).assertEqual('scan_error_unknown');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(true);
      expect(ScanErrorMapper.getCategory(1028)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0035 end');
    });

    /**
     * @tc.name   testErrorKey0036
     * @tc.number SUB_SCAN_ERRMAP_04_0036
     * @tc.desc   unknown code 1035 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0036 begin');
      const result: string = ScanErrorMapper.getMessageKey(1035);
      expect(result).assertEqual('scan_error_unknown');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(true);
      expect(ScanErrorMapper.getCategory(1035)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0036 end');
    });

    /**
     * @tc.name   testErrorKey0037
     * @tc.number SUB_SCAN_ERRMAP_04_0037
     * @tc.desc   unknown code 1042 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0037 begin');
      const result: string = ScanErrorMapper.getMessageKey(1042);
      expect(result).assertEqual('scan_error_unknown');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(true);
      expect(ScanErrorMapper.getCategory(1042)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0037 end');
    });

    /**
     * @tc.name   testErrorKey0038
     * @tc.number SUB_SCAN_ERRMAP_04_0038
     * @tc.desc   unknown code 1049 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0038 begin');
      const result: string = ScanErrorMapper.getMessageKey(1049);
      expect(result).assertEqual('scan_error_unknown');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(true);
      expect(ScanErrorMapper.getCategory(1049)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0038 end');
    });

    /**
     * @tc.name   testErrorKey0039
     * @tc.number SUB_SCAN_ERRMAP_04_0039
     * @tc.desc   unknown code 1056 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0039 begin');
      const result: string = ScanErrorMapper.getMessageKey(1056);
      expect(result).assertEqual('scan_error_unknown');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(true);
      expect(ScanErrorMapper.getCategory(1056)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0039 end');
    });

    /**
     * @tc.name   testErrorKey0040
     * @tc.number SUB_SCAN_ERRMAP_04_0040
     * @tc.desc   unknown code 1063 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0040 begin');
      const result: string = ScanErrorMapper.getMessageKey(1063);
      expect(result).assertEqual('scan_error_unknown');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(true);
      expect(ScanErrorMapper.getCategory(1063)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0040 end');
    });

    /**
     * @tc.name   testErrorKey0041
     * @tc.number SUB_SCAN_ERRMAP_04_0041
     * @tc.desc   unknown code 1070 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0041 begin');
      const result: string = ScanErrorMapper.getMessageKey(1070);
      expect(result).assertEqual('scan_error_unknown');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(true);
      expect(ScanErrorMapper.getCategory(1070)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0041 end');
    });

    /**
     * @tc.name   testErrorKey0042
     * @tc.number SUB_SCAN_ERRMAP_04_0042
     * @tc.desc   unknown code 1077 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0042 begin');
      const result: string = ScanErrorMapper.getMessageKey(1077);
      expect(result).assertEqual('scan_error_unknown');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(true);
      expect(ScanErrorMapper.getCategory(1077)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0042 end');
    });

    /**
     * @tc.name   testErrorKey0043
     * @tc.number SUB_SCAN_ERRMAP_04_0043
     * @tc.desc   unknown code 1084 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0043 begin');
      const result: string = ScanErrorMapper.getMessageKey(1084);
      expect(result).assertEqual('scan_error_unknown');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(true);
      expect(ScanErrorMapper.getCategory(1084)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0043 end');
    });

    /**
     * @tc.name   testErrorKey0044
     * @tc.number SUB_SCAN_ERRMAP_04_0044
     * @tc.desc   unknown code 1091 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0044 begin');
      const result: string = ScanErrorMapper.getMessageKey(1091);
      expect(result).assertEqual('scan_error_unknown');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(true);
      expect(ScanErrorMapper.getCategory(1091)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0044 end');
    });

    /**
     * @tc.name   testErrorKey0045
     * @tc.number SUB_SCAN_ERRMAP_04_0045
     * @tc.desc   unknown code 1098 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0045 begin');
      const result: string = ScanErrorMapper.getMessageKey(1098);
      expect(result).assertEqual('scan_error_unknown');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(true);
      expect(ScanErrorMapper.getCategory(1098)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0045 end');
    });

    /**
     * @tc.name   testErrorKey0046
     * @tc.number SUB_SCAN_ERRMAP_04_0046
     * @tc.desc   unknown code 1105 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0046 begin');
      const result: string = ScanErrorMapper.getMessageKey(1105);
      expect(result).assertEqual('scan_error_unknown');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(true);
      expect(ScanErrorMapper.getCategory(1105)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0046 end');
    });

    /**
     * @tc.name   testErrorKey0047
     * @tc.number SUB_SCAN_ERRMAP_04_0047
     * @tc.desc   unknown code 1112 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0047 begin');
      const result: string = ScanErrorMapper.getMessageKey(1112);
      expect(result).assertEqual('scan_error_unknown');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(true);
      expect(ScanErrorMapper.getCategory(1112)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0047 end');
    });

    /**
     * @tc.name   testErrorKey0048
     * @tc.number SUB_SCAN_ERRMAP_04_0048
     * @tc.desc   unknown code 1119 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0048 begin');
      const result: string = ScanErrorMapper.getMessageKey(1119);
      expect(result).assertEqual('scan_error_unknown');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(true);
      expect(ScanErrorMapper.getCategory(1119)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0048 end');
    });

    /**
     * @tc.name   testErrorKey0049
     * @tc.number SUB_SCAN_ERRMAP_04_0049
     * @tc.desc   unknown code 1126 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0049 begin');
      const result: string = ScanErrorMapper.getMessageKey(1126);
      expect(result).assertEqual('scan_error_unknown');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(true);
      expect(ScanErrorMapper.getCategory(1126)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0049 end');
    });

    /**
     * @tc.name   testErrorKey0050
     * @tc.number SUB_SCAN_ERRMAP_04_0050
     * @tc.desc   unknown code 1133 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0050 begin');
      const result: string = ScanErrorMapper.getMessageKey(1133);
      expect(result).assertEqual('scan_error_unknown');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(true);
      expect(ScanErrorMapper.getCategory(1133)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0050 end');
    });

    /**
     * @tc.name   testErrorKey0051
     * @tc.number SUB_SCAN_ERRMAP_04_0051
     * @tc.desc   unknown code 1140 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0051 begin');
      const result: string = ScanErrorMapper.getMessageKey(1140);
      expect(result).assertEqual('scan_error_unknown');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(true);
      expect(ScanErrorMapper.getCategory(1140)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0051 end');
    });

    /**
     * @tc.name   testErrorKey0052
     * @tc.number SUB_SCAN_ERRMAP_04_0052
     * @tc.desc   unknown code 1147 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0052 begin');
      const result: string = ScanErrorMapper.getMessageKey(1147);
      expect(result).assertEqual('scan_error_unknown');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(true);
      expect(ScanErrorMapper.getCategory(1147)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0052 end');
    });

    /**
     * @tc.name   testErrorKey0053
     * @tc.number SUB_SCAN_ERRMAP_04_0053
     * @tc.desc   unknown code 1154 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0053 begin');
      const result: string = ScanErrorMapper.getMessageKey(1154);
      expect(result).assertEqual('scan_error_unknown');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(true);
      expect(ScanErrorMapper.getCategory(1154)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0053 end');
    });

    /**
     * @tc.name   testErrorKey0054
     * @tc.number SUB_SCAN_ERRMAP_04_0054
     * @tc.desc   unknown code 1161 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0054 begin');
      const result: string = ScanErrorMapper.getMessageKey(1161);
      expect(result).assertEqual('scan_error_unknown');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(true);
      expect(ScanErrorMapper.getCategory(1161)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0054 end');
    });

    /**
     * @tc.name   testErrorKey0055
     * @tc.number SUB_SCAN_ERRMAP_04_0055
     * @tc.desc   unknown code 1168 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0055 begin');
      const result: string = ScanErrorMapper.getMessageKey(1168);
      expect(result).assertEqual('scan_error_unknown');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(true);
      expect(ScanErrorMapper.getCategory(1168)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0055 end');
    });

    /**
     * @tc.name   testErrorKey0056
     * @tc.number SUB_SCAN_ERRMAP_04_0056
     * @tc.desc   unknown code 1175 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0056 begin');
      const result: string = ScanErrorMapper.getMessageKey(1175);
      expect(result).assertEqual('scan_error_unknown');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(true);
      expect(ScanErrorMapper.getCategory(1175)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0056 end');
    });

    /**
     * @tc.name   testErrorKey0057
     * @tc.number SUB_SCAN_ERRMAP_04_0057
     * @tc.desc   unknown code 1182 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0057 begin');
      const result: string = ScanErrorMapper.getMessageKey(1182);
      expect(result).assertEqual('scan_error_unknown');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(true);
      expect(ScanErrorMapper.getCategory(1182)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0057 end');
    });

    /**
     * @tc.name   testErrorKey0058
     * @tc.number SUB_SCAN_ERRMAP_04_0058
     * @tc.desc   unknown code 1189 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0058 begin');
      const result: string = ScanErrorMapper.getMessageKey(1189);
      expect(result).assertEqual('scan_error_unknown');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(true);
      expect(ScanErrorMapper.getCategory(1189)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0058 end');
    });

    /**
     * @tc.name   testErrorKey0059
     * @tc.number SUB_SCAN_ERRMAP_04_0059
     * @tc.desc   unknown code 1196 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0059 begin');
      const result: string = ScanErrorMapper.getMessageKey(1196);
      expect(result).assertEqual('scan_error_unknown');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(true);
      expect(ScanErrorMapper.getCategory(1196)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0059 end');
    });

    /**
     * @tc.name   testErrorKey0060
     * @tc.number SUB_SCAN_ERRMAP_04_0060
     * @tc.desc   unknown code 1203 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0060 begin');
      const result: string = ScanErrorMapper.getMessageKey(1203);
      expect(result).assertEqual('scan_error_unknown');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(true);
      expect(ScanErrorMapper.getCategory(1203)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0060 end');
    });

    /**
     * @tc.name   testErrorKey0061
     * @tc.number SUB_SCAN_ERRMAP_04_0061
     * @tc.desc   unknown code 1210 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0061 begin');
      const result: string = ScanErrorMapper.getMessageKey(1210);
      expect(result).assertEqual('scan_error_unknown');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(true);
      expect(ScanErrorMapper.getCategory(1210)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0061 end');
    });

    /**
     * @tc.name   testErrorKey0062
     * @tc.number SUB_SCAN_ERRMAP_04_0062
     * @tc.desc   unknown code 1217 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0062 begin');
      const result: string = ScanErrorMapper.getMessageKey(1217);
      expect(result).assertEqual('scan_error_unknown');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(true);
      expect(ScanErrorMapper.getCategory(1217)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0062 end');
    });

    /**
     * @tc.name   testErrorKey0063
     * @tc.number SUB_SCAN_ERRMAP_04_0063
     * @tc.desc   unknown code 1224 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0063 begin');
      const result: string = ScanErrorMapper.getMessageKey(1224);
      expect(result).assertEqual('scan_error_unknown');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(true);
      expect(ScanErrorMapper.getCategory(1224)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0063 end');
    });

    /**
     * @tc.name   testErrorKey0064
     * @tc.number SUB_SCAN_ERRMAP_04_0064
     * @tc.desc   unknown code 1231 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0064 begin');
      const result: string = ScanErrorMapper.getMessageKey(1231);
      expect(result).assertEqual('scan_error_unknown');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(true);
      expect(ScanErrorMapper.getCategory(1231)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0064 end');
    });

    /**
     * @tc.name   testErrorKey0065
     * @tc.number SUB_SCAN_ERRMAP_04_0065
     * @tc.desc   unknown code 1238 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0065 begin');
      const result: string = ScanErrorMapper.getMessageKey(1238);
      expect(result).assertEqual('scan_error_unknown');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(true);
      expect(ScanErrorMapper.getCategory(1238)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0065 end');
    });

    /**
     * @tc.name   testErrorKey0066
     * @tc.number SUB_SCAN_ERRMAP_04_0066
     * @tc.desc   unknown code 1245 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0066 begin');
      const result: string = ScanErrorMapper.getMessageKey(1245);
      expect(result).assertEqual('scan_error_unknown');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(true);
      expect(ScanErrorMapper.getCategory(1245)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0066 end');
    });

    /**
     * @tc.name   testErrorKey0067
     * @tc.number SUB_SCAN_ERRMAP_04_0067
     * @tc.desc   unknown code 1252 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0067 begin');
      const result: string = ScanErrorMapper.getMessageKey(1252);
      expect(result).assertEqual('scan_error_unknown');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(true);
      expect(ScanErrorMapper.getCategory(1252)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0067 end');
    });

    /**
     * @tc.name   testErrorKey0068
     * @tc.number SUB_SCAN_ERRMAP_04_0068
     * @tc.desc   unknown code 1259 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0068 begin');
      const result: string = ScanErrorMapper.getMessageKey(1259);
      expect(result).assertEqual('scan_error_unknown');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(true);
      expect(ScanErrorMapper.getCategory(1259)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0068 end');
    });

    /**
     * @tc.name   testErrorKey0069
     * @tc.number SUB_SCAN_ERRMAP_04_0069
     * @tc.desc   unknown code 1266 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0069 begin');
      const result: string = ScanErrorMapper.getMessageKey(1266);
      expect(result).assertEqual('scan_error_unknown');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(true);
      expect(ScanErrorMapper.getCategory(1266)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0069 end');
    });

    /**
     * @tc.name   testErrorKey0070
     * @tc.number SUB_SCAN_ERRMAP_04_0070
     * @tc.desc   unknown code 1273 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0070 begin');
      const result: string = ScanErrorMapper.getMessageKey(1273);
      expect(result).assertEqual('scan_error_unknown');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(true);
      expect(ScanErrorMapper.getCategory(1273)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0070 end');
    });

    /**
     * @tc.name   testErrorKey0071
     * @tc.number SUB_SCAN_ERRMAP_04_0071
     * @tc.desc   unknown code 1280 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0071 begin');
      const result: string = ScanErrorMapper.getMessageKey(1280);
      expect(result).assertEqual('scan_error_unknown');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(true);
      expect(ScanErrorMapper.getCategory(1280)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0071 end');
    });

    /**
     * @tc.name   testErrorKey0072
     * @tc.number SUB_SCAN_ERRMAP_04_0072
     * @tc.desc   unknown code 1287 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0072 begin');
      const result: string = ScanErrorMapper.getMessageKey(1287);
      expect(result).assertEqual('scan_error_unknown');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(true);
      expect(ScanErrorMapper.getCategory(1287)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0072 end');
    });

    /**
     * @tc.name   testErrorKey0073
     * @tc.number SUB_SCAN_ERRMAP_04_0073
     * @tc.desc   unknown code 1294 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0073 begin');
      const result: string = ScanErrorMapper.getMessageKey(1294);
      expect(result).assertEqual('scan_error_unknown');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(true);
      expect(ScanErrorMapper.getCategory(1294)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0073 end');
    });

    /**
     * @tc.name   testErrorKey0074
     * @tc.number SUB_SCAN_ERRMAP_04_0074
     * @tc.desc   unknown code 1301 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0074 begin');
      const result: string = ScanErrorMapper.getMessageKey(1301);
      expect(result).assertEqual('scan_error_unknown');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(true);
      expect(ScanErrorMapper.getCategory(1301)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0074 end');
    });

    /**
     * @tc.name   testErrorKey0075
     * @tc.number SUB_SCAN_ERRMAP_04_0075
     * @tc.desc   unknown code 1308 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0075 begin');
      const result: string = ScanErrorMapper.getMessageKey(1308);
      expect(result).assertEqual('scan_error_unknown');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(true);
      expect(ScanErrorMapper.getCategory(1308)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0075 end');
    });

    /**
     * @tc.name   testErrorKey0076
     * @tc.number SUB_SCAN_ERRMAP_04_0076
     * @tc.desc   unknown code 1315 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0076 begin');
      const result: string = ScanErrorMapper.getMessageKey(1315);
      expect(result).assertEqual('scan_error_unknown');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(true);
      expect(ScanErrorMapper.getCategory(1315)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0076 end');
    });

    /**
     * @tc.name   testErrorKey0077
     * @tc.number SUB_SCAN_ERRMAP_04_0077
     * @tc.desc   unknown code 1322 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0077 begin');
      const result: string = ScanErrorMapper.getMessageKey(1322);
      expect(result).assertEqual('scan_error_unknown');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(true);
      expect(ScanErrorMapper.getCategory(1322)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0077 end');
    });

    /**
     * @tc.name   testErrorKey0078
     * @tc.number SUB_SCAN_ERRMAP_04_0078
     * @tc.desc   unknown code 1329 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0078 begin');
      const result: string = ScanErrorMapper.getMessageKey(1329);
      expect(result).assertEqual('scan_error_unknown');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(true);
      expect(ScanErrorMapper.getCategory(1329)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0078 end');
    });

    /**
     * @tc.name   testErrorKey0079
     * @tc.number SUB_SCAN_ERRMAP_04_0079
     * @tc.desc   unknown code 1336 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0079 begin');
      const result: string = ScanErrorMapper.getMessageKey(1336);
      expect(result).assertEqual('scan_error_unknown');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(true);
      expect(ScanErrorMapper.getCategory(1336)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0079 end');
    });

    /**
     * @tc.name   testErrorKey0080
     * @tc.number SUB_SCAN_ERRMAP_04_0080
     * @tc.desc   unknown code 1343 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0080 begin');
      const result: string = ScanErrorMapper.getMessageKey(1343);
      expect(result).assertEqual('scan_error_unknown');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(true);
      expect(ScanErrorMapper.getCategory(1343)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0080 end');
    });

    /**
     * @tc.name   testErrorKey0081
     * @tc.number SUB_SCAN_ERRMAP_04_0081
     * @tc.desc   unknown code 1350 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0081 begin');
      const result: string = ScanErrorMapper.getMessageKey(1350);
      expect(result).assertEqual('scan_error_unknown');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(true);
      expect(ScanErrorMapper.getCategory(1350)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0081 end');
    });

    /**
     * @tc.name   testErrorKey0082
     * @tc.number SUB_SCAN_ERRMAP_04_0082
     * @tc.desc   unknown code 1357 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0082 begin');
      const result: string = ScanErrorMapper.getMessageKey(1357);
      expect(result).assertEqual('scan_error_unknown');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(true);
      expect(ScanErrorMapper.getCategory(1357)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0082 end');
    });

    /**
     * @tc.name   testErrorKey0083
     * @tc.number SUB_SCAN_ERRMAP_04_0083
     * @tc.desc   unknown code 1364 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0083 begin');
      const result: string = ScanErrorMapper.getMessageKey(1364);
      expect(result).assertEqual('scan_error_unknown');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(true);
      expect(ScanErrorMapper.getCategory(1364)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0083 end');
    });

    /**
     * @tc.name   testErrorKey0084
     * @tc.number SUB_SCAN_ERRMAP_04_0084
     * @tc.desc   unknown code 1371 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0084 begin');
      const result: string = ScanErrorMapper.getMessageKey(1371);
      expect(result).assertEqual('scan_error_unknown');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(true);
      expect(ScanErrorMapper.getCategory(1371)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0084 end');
    });

    /**
     * @tc.name   testErrorKey0085
     * @tc.number SUB_SCAN_ERRMAP_04_0085
     * @tc.desc   unknown code 1378 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0085 begin');
      const result: string = ScanErrorMapper.getMessageKey(1378);
      expect(result).assertEqual('scan_error_unknown');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(true);
      expect(ScanErrorMapper.getCategory(1378)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0085 end');
    });

    /**
     * @tc.name   testErrorKey0086
     * @tc.number SUB_SCAN_ERRMAP_04_0086
     * @tc.desc   unknown code 1385 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0086 begin');
      const result: string = ScanErrorMapper.getMessageKey(1385);
      expect(result).assertEqual('scan_error_unknown');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(true);
      expect(ScanErrorMapper.getCategory(1385)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0086 end');
    });

    /**
     * @tc.name   testErrorKey0087
     * @tc.number SUB_SCAN_ERRMAP_04_0087
     * @tc.desc   unknown code 1392 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0087 begin');
      const result: string = ScanErrorMapper.getMessageKey(1392);
      expect(result).assertEqual('scan_error_unknown');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(true);
      expect(ScanErrorMapper.getCategory(1392)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0087 end');
    });

    /**
     * @tc.name   testErrorKey0088
     * @tc.number SUB_SCAN_ERRMAP_04_0088
     * @tc.desc   unknown code 1399 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0088 begin');
      const result: string = ScanErrorMapper.getMessageKey(1399);
      expect(result).assertEqual('scan_error_unknown');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(true);
      expect(ScanErrorMapper.getCategory(1399)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0088 end');
    });

    /**
     * @tc.name   testErrorKey0089
     * @tc.number SUB_SCAN_ERRMAP_04_0089
     * @tc.desc   unknown code 1406 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0089 begin');
      const result: string = ScanErrorMapper.getMessageKey(1406);
      expect(result).assertEqual('scan_error_unknown');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(true);
      expect(ScanErrorMapper.getCategory(1406)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0089 end');
    });

    /**
     * @tc.name   testErrorKey0090
     * @tc.number SUB_SCAN_ERRMAP_04_0090
     * @tc.desc   unknown code 1413 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorKey0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0090 begin');
      const result: string = ScanErrorMapper.getMessageKey(1413);
      expect(result).assertEqual('scan_error_unknown');
      expect(result === ScanErrorMapper.UNKNOWN_MESSAGE_KEY).assertEqual(true);
      expect(ScanErrorMapper.getCategory(1413)).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorKey0090 end');
    });

  });
}
