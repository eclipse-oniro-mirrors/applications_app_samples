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

export default function scanErrorMapVolume03Test() {
  describe('ScanErrorMapVolume03', () => {

    /**
     * @tc.name   testErrorAction0001
     * @tc.number SUB_SCAN_ERRMAP_03_0001
     * @tc.desc   code 201 maps to permission in the documented table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0001 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(201);
      expect(result).assertEqual(true);
      expect(ScanErrorMapper.describe(201).requiresUserAction).assertEqual(true);
      expect(ScanErrorMapper.isKnown(201)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0001 end');
    });

    /**
     * @tc.name   testErrorAction0002
     * @tc.number SUB_SCAN_ERRMAP_03_0002
     * @tc.desc   code 202 maps to framework in the documented table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0002 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(202);
      expect(result).assertEqual(true);
      expect(ScanErrorMapper.describe(202).requiresUserAction).assertEqual(true);
      expect(ScanErrorMapper.isKnown(202)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0002 end');
    });

    /**
     * @tc.name   testErrorAction0003
     * @tc.number SUB_SCAN_ERRMAP_03_0003
     * @tc.desc   code 401 maps to parameter in the documented table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0003 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(401);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.describe(401).requiresUserAction).assertEqual(false);
      expect(ScanErrorMapper.isKnown(401)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0003 end');
    });

    /**
     * @tc.name   testErrorAction0004
     * @tc.number SUB_SCAN_ERRMAP_03_0004
     * @tc.desc   code 13100001 maps to framework in the documented table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0004 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(13100001);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.describe(13100001).requiresUserAction).assertEqual(false);
      expect(ScanErrorMapper.isKnown(13100001)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0004 end');
    });

    /**
     * @tc.name   testErrorAction0005
     * @tc.number SUB_SCAN_ERRMAP_03_0005
     * @tc.desc   code 13100002 maps to framework in the documented table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0005 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(13100002);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.describe(13100002).requiresUserAction).assertEqual(false);
      expect(ScanErrorMapper.isKnown(13100002)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0005 end');
    });

    /**
     * @tc.name   testErrorAction0006
     * @tc.number SUB_SCAN_ERRMAP_03_0006
     * @tc.desc   code 13100003 maps to framework in the documented table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0006 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(13100003);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.describe(13100003).requiresUserAction).assertEqual(false);
      expect(ScanErrorMapper.isKnown(13100003)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0006 end');
    });

    /**
     * @tc.name   testErrorAction0007
     * @tc.number SUB_SCAN_ERRMAP_03_0007
     * @tc.desc   code 13100004 maps to framework in the documented table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0007 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(13100004);
      expect(result).assertEqual(true);
      expect(ScanErrorMapper.describe(13100004).requiresUserAction).assertEqual(true);
      expect(ScanErrorMapper.isKnown(13100004)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0007 end');
    });

    /**
     * @tc.name   testErrorAction0008
     * @tc.number SUB_SCAN_ERRMAP_03_0008
     * @tc.desc   code 13100005 maps to device in the documented table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0008 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(13100005);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.describe(13100005).requiresUserAction).assertEqual(false);
      expect(ScanErrorMapper.isKnown(13100005)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0008 end');
    });

    /**
     * @tc.name   testErrorAction0009
     * @tc.number SUB_SCAN_ERRMAP_03_0009
     * @tc.desc   code 13100006 maps to device in the documented table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0009 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(13100006);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.describe(13100006).requiresUserAction).assertEqual(false);
      expect(ScanErrorMapper.isKnown(13100006)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0009 end');
    });

    /**
     * @tc.name   testErrorAction0010
     * @tc.number SUB_SCAN_ERRMAP_03_0010
     * @tc.desc   code 13100007 maps to device in the documented table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0010 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(13100007);
      expect(result).assertEqual(true);
      expect(ScanErrorMapper.describe(13100007).requiresUserAction).assertEqual(true);
      expect(ScanErrorMapper.isKnown(13100007)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0010 end');
    });

    /**
     * @tc.name   testErrorAction0011
     * @tc.number SUB_SCAN_ERRMAP_03_0011
     * @tc.desc   code 13100008 maps to device in the documented table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0011 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(13100008);
      expect(result).assertEqual(true);
      expect(ScanErrorMapper.describe(13100008).requiresUserAction).assertEqual(true);
      expect(ScanErrorMapper.isKnown(13100008)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0011 end');
    });

    /**
     * @tc.name   testErrorAction0012
     * @tc.number SUB_SCAN_ERRMAP_03_0012
     * @tc.desc   code 13100009 maps to device in the documented table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0012 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(13100009);
      expect(result).assertEqual(true);
      expect(ScanErrorMapper.describe(13100009).requiresUserAction).assertEqual(true);
      expect(ScanErrorMapper.isKnown(13100009)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0012 end');
    });

    /**
     * @tc.name   testErrorAction0013
     * @tc.number SUB_SCAN_ERRMAP_03_0013
     * @tc.desc   code 13100010 maps to device in the documented table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0013 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(13100010);
      expect(result).assertEqual(true);
      expect(ScanErrorMapper.describe(13100010).requiresUserAction).assertEqual(true);
      expect(ScanErrorMapper.isKnown(13100010)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0013 end');
    });

    /**
     * @tc.name   testErrorAction0014
     * @tc.number SUB_SCAN_ERRMAP_03_0014
     * @tc.desc   code 13100011 maps to device in the documented table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0014 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(13100011);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.describe(13100011).requiresUserAction).assertEqual(false);
      expect(ScanErrorMapper.isKnown(13100011)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0014 end');
    });

    /**
     * @tc.name   testErrorAction0015
     * @tc.number SUB_SCAN_ERRMAP_03_0015
     * @tc.desc   code 13100012 maps to framework in the documented table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0015 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(13100012);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.describe(13100012).requiresUserAction).assertEqual(false);
      expect(ScanErrorMapper.isKnown(13100012)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0015 end');
    });

    /**
     * @tc.name   testErrorAction0016
     * @tc.number SUB_SCAN_ERRMAP_03_0016
     * @tc.desc   unknown code 0 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0016 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(0);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.describe(0).requiresUserAction).assertEqual(false);
      expect(ScanErrorMapper.isKnown(0)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0016 end');
    });

    /**
     * @tc.name   testErrorAction0017
     * @tc.number SUB_SCAN_ERRMAP_03_0017
     * @tc.desc   unknown code 1 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0017 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(1);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.describe(1).requiresUserAction).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0017 end');
    });

    /**
     * @tc.name   testErrorAction0018
     * @tc.number SUB_SCAN_ERRMAP_03_0018
     * @tc.desc   unknown code -1 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0018 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(-1);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.describe(-1).requiresUserAction).assertEqual(false);
      expect(ScanErrorMapper.isKnown(-1)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0018 end');
    });

    /**
     * @tc.name   testErrorAction0019
     * @tc.number SUB_SCAN_ERRMAP_03_0019
     * @tc.desc   unknown code 200 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0019 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(200);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.describe(200).requiresUserAction).assertEqual(false);
      expect(ScanErrorMapper.isKnown(200)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0019 end');
    });

    /**
     * @tc.name   testErrorAction0020
     * @tc.number SUB_SCAN_ERRMAP_03_0020
     * @tc.desc   unknown code 203 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0020 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(203);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.describe(203).requiresUserAction).assertEqual(false);
      expect(ScanErrorMapper.isKnown(203)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0020 end');
    });

    /**
     * @tc.name   testErrorAction0021
     * @tc.number SUB_SCAN_ERRMAP_03_0021
     * @tc.desc   unknown code 400 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0021 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(400);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.describe(400).requiresUserAction).assertEqual(false);
      expect(ScanErrorMapper.isKnown(400)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0021 end');
    });

    /**
     * @tc.name   testErrorAction0022
     * @tc.number SUB_SCAN_ERRMAP_03_0022
     * @tc.desc   unknown code 402 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0022 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(402);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.describe(402).requiresUserAction).assertEqual(false);
      expect(ScanErrorMapper.isKnown(402)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0022 end');
    });

    /**
     * @tc.name   testErrorAction0023
     * @tc.number SUB_SCAN_ERRMAP_03_0023
     * @tc.desc   unknown code 999 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0023 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(999);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.describe(999).requiresUserAction).assertEqual(false);
      expect(ScanErrorMapper.isKnown(999)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0023 end');
    });

    /**
     * @tc.name   testErrorAction0024
     * @tc.number SUB_SCAN_ERRMAP_03_0024
     * @tc.desc   unknown code 13100000 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0024 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(13100000);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.describe(13100000).requiresUserAction).assertEqual(false);
      expect(ScanErrorMapper.isKnown(13100000)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0024 end');
    });

    /**
     * @tc.name   testErrorAction0025
     * @tc.number SUB_SCAN_ERRMAP_03_0025
     * @tc.desc   unknown code 13100013 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0025 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(13100013);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.describe(13100013).requiresUserAction).assertEqual(false);
      expect(ScanErrorMapper.isKnown(13100013)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0025 end');
    });

    /**
     * @tc.name   testErrorAction0026
     * @tc.number SUB_SCAN_ERRMAP_03_0026
     * @tc.desc   unknown code 13100014 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0026 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(13100014);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.describe(13100014).requiresUserAction).assertEqual(false);
      expect(ScanErrorMapper.isKnown(13100014)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0026 end');
    });

    /**
     * @tc.name   testErrorAction0027
     * @tc.number SUB_SCAN_ERRMAP_03_0027
     * @tc.desc   unknown code 13100099 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0027 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(13100099);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.describe(13100099).requiresUserAction).assertEqual(false);
      expect(ScanErrorMapper.isKnown(13100099)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0027 end');
    });

    /**
     * @tc.name   testErrorAction0028
     * @tc.number SUB_SCAN_ERRMAP_03_0028
     * @tc.desc   unknown code 13100100 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0028 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(13100100);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.describe(13100100).requiresUserAction).assertEqual(false);
      expect(ScanErrorMapper.isKnown(13100100)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0028 end');
    });

    /**
     * @tc.name   testErrorAction0029
     * @tc.number SUB_SCAN_ERRMAP_03_0029
     * @tc.desc   unknown code 99999999 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0029 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(99999999);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.describe(99999999).requiresUserAction).assertEqual(false);
      expect(ScanErrorMapper.isKnown(99999999)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0029 end');
    });

    /**
     * @tc.name   testErrorAction0030
     * @tc.number SUB_SCAN_ERRMAP_03_0030
     * @tc.desc   unknown code -13100001 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0030 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(-13100001);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.describe(-13100001).requiresUserAction).assertEqual(false);
      expect(ScanErrorMapper.isKnown(-13100001)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0030 end');
    });

    /**
     * @tc.name   testErrorAction0031
     * @tc.number SUB_SCAN_ERRMAP_03_0031
     * @tc.desc   unknown code 1000 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0031 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(1000);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.describe(1000).requiresUserAction).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1000)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0031 end');
    });

    /**
     * @tc.name   testErrorAction0032
     * @tc.number SUB_SCAN_ERRMAP_03_0032
     * @tc.desc   unknown code 1007 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0032 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(1007);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.describe(1007).requiresUserAction).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1007)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0032 end');
    });

    /**
     * @tc.name   testErrorAction0033
     * @tc.number SUB_SCAN_ERRMAP_03_0033
     * @tc.desc   unknown code 1014 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0033 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(1014);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.describe(1014).requiresUserAction).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1014)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0033 end');
    });

    /**
     * @tc.name   testErrorAction0034
     * @tc.number SUB_SCAN_ERRMAP_03_0034
     * @tc.desc   unknown code 1021 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0034 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(1021);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.describe(1021).requiresUserAction).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1021)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0034 end');
    });

    /**
     * @tc.name   testErrorAction0035
     * @tc.number SUB_SCAN_ERRMAP_03_0035
     * @tc.desc   unknown code 1028 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0035 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(1028);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.describe(1028).requiresUserAction).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1028)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0035 end');
    });

    /**
     * @tc.name   testErrorAction0036
     * @tc.number SUB_SCAN_ERRMAP_03_0036
     * @tc.desc   unknown code 1035 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0036 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(1035);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.describe(1035).requiresUserAction).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1035)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0036 end');
    });

    /**
     * @tc.name   testErrorAction0037
     * @tc.number SUB_SCAN_ERRMAP_03_0037
     * @tc.desc   unknown code 1042 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0037 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(1042);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.describe(1042).requiresUserAction).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1042)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0037 end');
    });

    /**
     * @tc.name   testErrorAction0038
     * @tc.number SUB_SCAN_ERRMAP_03_0038
     * @tc.desc   unknown code 1049 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0038 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(1049);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.describe(1049).requiresUserAction).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1049)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0038 end');
    });

    /**
     * @tc.name   testErrorAction0039
     * @tc.number SUB_SCAN_ERRMAP_03_0039
     * @tc.desc   unknown code 1056 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0039 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(1056);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.describe(1056).requiresUserAction).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1056)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0039 end');
    });

    /**
     * @tc.name   testErrorAction0040
     * @tc.number SUB_SCAN_ERRMAP_03_0040
     * @tc.desc   unknown code 1063 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0040 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(1063);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.describe(1063).requiresUserAction).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1063)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0040 end');
    });

    /**
     * @tc.name   testErrorAction0041
     * @tc.number SUB_SCAN_ERRMAP_03_0041
     * @tc.desc   unknown code 1070 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0041 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(1070);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.describe(1070).requiresUserAction).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1070)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0041 end');
    });

    /**
     * @tc.name   testErrorAction0042
     * @tc.number SUB_SCAN_ERRMAP_03_0042
     * @tc.desc   unknown code 1077 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0042 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(1077);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.describe(1077).requiresUserAction).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1077)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0042 end');
    });

    /**
     * @tc.name   testErrorAction0043
     * @tc.number SUB_SCAN_ERRMAP_03_0043
     * @tc.desc   unknown code 1084 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0043 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(1084);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.describe(1084).requiresUserAction).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1084)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0043 end');
    });

    /**
     * @tc.name   testErrorAction0044
     * @tc.number SUB_SCAN_ERRMAP_03_0044
     * @tc.desc   unknown code 1091 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0044 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(1091);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.describe(1091).requiresUserAction).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1091)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0044 end');
    });

    /**
     * @tc.name   testErrorAction0045
     * @tc.number SUB_SCAN_ERRMAP_03_0045
     * @tc.desc   unknown code 1098 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0045 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(1098);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.describe(1098).requiresUserAction).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1098)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0045 end');
    });

    /**
     * @tc.name   testErrorAction0046
     * @tc.number SUB_SCAN_ERRMAP_03_0046
     * @tc.desc   unknown code 1105 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0046 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(1105);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.describe(1105).requiresUserAction).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1105)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0046 end');
    });

    /**
     * @tc.name   testErrorAction0047
     * @tc.number SUB_SCAN_ERRMAP_03_0047
     * @tc.desc   unknown code 1112 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0047 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(1112);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.describe(1112).requiresUserAction).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1112)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0047 end');
    });

    /**
     * @tc.name   testErrorAction0048
     * @tc.number SUB_SCAN_ERRMAP_03_0048
     * @tc.desc   unknown code 1119 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0048 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(1119);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.describe(1119).requiresUserAction).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1119)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0048 end');
    });

    /**
     * @tc.name   testErrorAction0049
     * @tc.number SUB_SCAN_ERRMAP_03_0049
     * @tc.desc   unknown code 1126 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0049 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(1126);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.describe(1126).requiresUserAction).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1126)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0049 end');
    });

    /**
     * @tc.name   testErrorAction0050
     * @tc.number SUB_SCAN_ERRMAP_03_0050
     * @tc.desc   unknown code 1133 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0050 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(1133);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.describe(1133).requiresUserAction).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1133)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0050 end');
    });

    /**
     * @tc.name   testErrorAction0051
     * @tc.number SUB_SCAN_ERRMAP_03_0051
     * @tc.desc   unknown code 1140 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0051 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(1140);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.describe(1140).requiresUserAction).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1140)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0051 end');
    });

    /**
     * @tc.name   testErrorAction0052
     * @tc.number SUB_SCAN_ERRMAP_03_0052
     * @tc.desc   unknown code 1147 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0052 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(1147);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.describe(1147).requiresUserAction).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1147)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0052 end');
    });

    /**
     * @tc.name   testErrorAction0053
     * @tc.number SUB_SCAN_ERRMAP_03_0053
     * @tc.desc   unknown code 1154 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0053 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(1154);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.describe(1154).requiresUserAction).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1154)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0053 end');
    });

    /**
     * @tc.name   testErrorAction0054
     * @tc.number SUB_SCAN_ERRMAP_03_0054
     * @tc.desc   unknown code 1161 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0054 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(1161);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.describe(1161).requiresUserAction).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1161)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0054 end');
    });

    /**
     * @tc.name   testErrorAction0055
     * @tc.number SUB_SCAN_ERRMAP_03_0055
     * @tc.desc   unknown code 1168 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0055 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(1168);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.describe(1168).requiresUserAction).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1168)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0055 end');
    });

    /**
     * @tc.name   testErrorAction0056
     * @tc.number SUB_SCAN_ERRMAP_03_0056
     * @tc.desc   unknown code 1175 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0056 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(1175);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.describe(1175).requiresUserAction).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1175)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0056 end');
    });

    /**
     * @tc.name   testErrorAction0057
     * @tc.number SUB_SCAN_ERRMAP_03_0057
     * @tc.desc   unknown code 1182 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0057 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(1182);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.describe(1182).requiresUserAction).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1182)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0057 end');
    });

    /**
     * @tc.name   testErrorAction0058
     * @tc.number SUB_SCAN_ERRMAP_03_0058
     * @tc.desc   unknown code 1189 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0058 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(1189);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.describe(1189).requiresUserAction).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1189)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0058 end');
    });

    /**
     * @tc.name   testErrorAction0059
     * @tc.number SUB_SCAN_ERRMAP_03_0059
     * @tc.desc   unknown code 1196 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0059 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(1196);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.describe(1196).requiresUserAction).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1196)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0059 end');
    });

    /**
     * @tc.name   testErrorAction0060
     * @tc.number SUB_SCAN_ERRMAP_03_0060
     * @tc.desc   unknown code 1203 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0060 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(1203);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.describe(1203).requiresUserAction).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1203)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0060 end');
    });

    /**
     * @tc.name   testErrorAction0061
     * @tc.number SUB_SCAN_ERRMAP_03_0061
     * @tc.desc   unknown code 1210 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0061 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(1210);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.describe(1210).requiresUserAction).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1210)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0061 end');
    });

    /**
     * @tc.name   testErrorAction0062
     * @tc.number SUB_SCAN_ERRMAP_03_0062
     * @tc.desc   unknown code 1217 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0062 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(1217);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.describe(1217).requiresUserAction).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1217)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0062 end');
    });

    /**
     * @tc.name   testErrorAction0063
     * @tc.number SUB_SCAN_ERRMAP_03_0063
     * @tc.desc   unknown code 1224 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0063 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(1224);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.describe(1224).requiresUserAction).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1224)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0063 end');
    });

    /**
     * @tc.name   testErrorAction0064
     * @tc.number SUB_SCAN_ERRMAP_03_0064
     * @tc.desc   unknown code 1231 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0064 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(1231);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.describe(1231).requiresUserAction).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1231)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0064 end');
    });

    /**
     * @tc.name   testErrorAction0065
     * @tc.number SUB_SCAN_ERRMAP_03_0065
     * @tc.desc   unknown code 1238 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0065 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(1238);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.describe(1238).requiresUserAction).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1238)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0065 end');
    });

    /**
     * @tc.name   testErrorAction0066
     * @tc.number SUB_SCAN_ERRMAP_03_0066
     * @tc.desc   unknown code 1245 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0066 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(1245);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.describe(1245).requiresUserAction).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1245)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0066 end');
    });

    /**
     * @tc.name   testErrorAction0067
     * @tc.number SUB_SCAN_ERRMAP_03_0067
     * @tc.desc   unknown code 1252 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0067 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(1252);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.describe(1252).requiresUserAction).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1252)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0067 end');
    });

    /**
     * @tc.name   testErrorAction0068
     * @tc.number SUB_SCAN_ERRMAP_03_0068
     * @tc.desc   unknown code 1259 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0068 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(1259);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.describe(1259).requiresUserAction).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1259)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0068 end');
    });

    /**
     * @tc.name   testErrorAction0069
     * @tc.number SUB_SCAN_ERRMAP_03_0069
     * @tc.desc   unknown code 1266 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0069 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(1266);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.describe(1266).requiresUserAction).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1266)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0069 end');
    });

    /**
     * @tc.name   testErrorAction0070
     * @tc.number SUB_SCAN_ERRMAP_03_0070
     * @tc.desc   unknown code 1273 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0070 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(1273);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.describe(1273).requiresUserAction).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1273)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0070 end');
    });

    /**
     * @tc.name   testErrorAction0071
     * @tc.number SUB_SCAN_ERRMAP_03_0071
     * @tc.desc   unknown code 1280 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0071 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(1280);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.describe(1280).requiresUserAction).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1280)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0071 end');
    });

    /**
     * @tc.name   testErrorAction0072
     * @tc.number SUB_SCAN_ERRMAP_03_0072
     * @tc.desc   unknown code 1287 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0072 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(1287);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.describe(1287).requiresUserAction).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1287)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0072 end');
    });

    /**
     * @tc.name   testErrorAction0073
     * @tc.number SUB_SCAN_ERRMAP_03_0073
     * @tc.desc   unknown code 1294 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0073 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(1294);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.describe(1294).requiresUserAction).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1294)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0073 end');
    });

    /**
     * @tc.name   testErrorAction0074
     * @tc.number SUB_SCAN_ERRMAP_03_0074
     * @tc.desc   unknown code 1301 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0074 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(1301);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.describe(1301).requiresUserAction).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1301)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0074 end');
    });

    /**
     * @tc.name   testErrorAction0075
     * @tc.number SUB_SCAN_ERRMAP_03_0075
     * @tc.desc   unknown code 1308 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0075 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(1308);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.describe(1308).requiresUserAction).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1308)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0075 end');
    });

    /**
     * @tc.name   testErrorAction0076
     * @tc.number SUB_SCAN_ERRMAP_03_0076
     * @tc.desc   unknown code 1315 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0076 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(1315);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.describe(1315).requiresUserAction).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1315)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0076 end');
    });

    /**
     * @tc.name   testErrorAction0077
     * @tc.number SUB_SCAN_ERRMAP_03_0077
     * @tc.desc   unknown code 1322 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0077 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(1322);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.describe(1322).requiresUserAction).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1322)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0077 end');
    });

    /**
     * @tc.name   testErrorAction0078
     * @tc.number SUB_SCAN_ERRMAP_03_0078
     * @tc.desc   unknown code 1329 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0078 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(1329);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.describe(1329).requiresUserAction).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1329)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0078 end');
    });

    /**
     * @tc.name   testErrorAction0079
     * @tc.number SUB_SCAN_ERRMAP_03_0079
     * @tc.desc   unknown code 1336 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0079 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(1336);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.describe(1336).requiresUserAction).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1336)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0079 end');
    });

    /**
     * @tc.name   testErrorAction0080
     * @tc.number SUB_SCAN_ERRMAP_03_0080
     * @tc.desc   unknown code 1343 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0080 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(1343);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.describe(1343).requiresUserAction).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1343)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0080 end');
    });

    /**
     * @tc.name   testErrorAction0081
     * @tc.number SUB_SCAN_ERRMAP_03_0081
     * @tc.desc   unknown code 1350 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0081 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(1350);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.describe(1350).requiresUserAction).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1350)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0081 end');
    });

    /**
     * @tc.name   testErrorAction0082
     * @tc.number SUB_SCAN_ERRMAP_03_0082
     * @tc.desc   unknown code 1357 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0082 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(1357);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.describe(1357).requiresUserAction).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1357)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0082 end');
    });

    /**
     * @tc.name   testErrorAction0083
     * @tc.number SUB_SCAN_ERRMAP_03_0083
     * @tc.desc   unknown code 1364 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0083 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(1364);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.describe(1364).requiresUserAction).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1364)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0083 end');
    });

    /**
     * @tc.name   testErrorAction0084
     * @tc.number SUB_SCAN_ERRMAP_03_0084
     * @tc.desc   unknown code 1371 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0084 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(1371);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.describe(1371).requiresUserAction).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1371)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0084 end');
    });

    /**
     * @tc.name   testErrorAction0085
     * @tc.number SUB_SCAN_ERRMAP_03_0085
     * @tc.desc   unknown code 1378 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0085 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(1378);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.describe(1378).requiresUserAction).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1378)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0085 end');
    });

    /**
     * @tc.name   testErrorAction0086
     * @tc.number SUB_SCAN_ERRMAP_03_0086
     * @tc.desc   unknown code 1385 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0086 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(1385);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.describe(1385).requiresUserAction).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1385)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0086 end');
    });

    /**
     * @tc.name   testErrorAction0087
     * @tc.number SUB_SCAN_ERRMAP_03_0087
     * @tc.desc   unknown code 1392 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0087 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(1392);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.describe(1392).requiresUserAction).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1392)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0087 end');
    });

    /**
     * @tc.name   testErrorAction0088
     * @tc.number SUB_SCAN_ERRMAP_03_0088
     * @tc.desc   unknown code 1399 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0088 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(1399);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.describe(1399).requiresUserAction).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1399)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0088 end');
    });

    /**
     * @tc.name   testErrorAction0089
     * @tc.number SUB_SCAN_ERRMAP_03_0089
     * @tc.desc   unknown code 1406 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0089 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(1406);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.describe(1406).requiresUserAction).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1406)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0089 end');
    });

    /**
     * @tc.name   testErrorAction0090
     * @tc.number SUB_SCAN_ERRMAP_03_0090
     * @tc.desc   unknown code 1413 falls back to the unknown category
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorAction0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0090 begin');
      const result: boolean = ScanErrorMapper.requiresUserAction(1413);
      expect(result).assertEqual(false);
      expect(ScanErrorMapper.describe(1413).requiresUserAction).assertEqual(false);
      expect(ScanErrorMapper.isKnown(1413)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testErrorAction0090 end');
    });

  });
}
