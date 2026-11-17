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
import DateTimeUtil from '../../../main/ets/common/utils/DateTimeUtil';

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF812;
const TAG: string = '[Sample_PhotoSameSource]';

export default function DateTimeDateCubePart1Test(): void {
  describe('DateTimeDateCubePart1', () => {

    /**
     * @tc.number    SUB_PHOTO_DCUBP1_0100
     * @tc.name      testDateCube0001
     * @tc.desc      Verify concatDate(2000, 0, 0) pads to 20000000.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0001 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2000, 0, 0)).assertEqual('20000000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0001 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP1_0200
     * @tc.name      testDateCube0002
     * @tc.desc      Verify concatDate(2000, 0, 1) pads to 20000001.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0002 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2000, 0, 1)).assertEqual('20000001');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0002 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP1_0300
     * @tc.name      testDateCube0003
     * @tc.desc      Verify concatDate(2000, 0, 15) pads to 20000015.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0003 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2000, 0, 15)).assertEqual('20000015');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0003 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP1_0400
     * @tc.name      testDateCube0004
     * @tc.desc      Verify concatDate(2000, 0, 31) pads to 20000031.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0004 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2000, 0, 31)).assertEqual('20000031');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0004 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP1_0500
     * @tc.name      testDateCube0005
     * @tc.desc      Verify concatDate(2000, 0, 32) pads to 20000032.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0005 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2000, 0, 32)).assertEqual('20000032');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0005 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP1_0600
     * @tc.name      testDateCube0006
     * @tc.desc      Verify concatDate(2000, 1, 0) pads to 20000100.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0006 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2000, 1, 0)).assertEqual('20000100');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0006 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP1_0700
     * @tc.name      testDateCube0007
     * @tc.desc      Verify concatDate(2000, 1, 1) pads to 20000101.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0007 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2000, 1, 1)).assertEqual('20000101');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0007 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP1_0800
     * @tc.name      testDateCube0008
     * @tc.desc      Verify concatDate(2000, 1, 15) pads to 20000115.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0008 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2000, 1, 15)).assertEqual('20000115');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0008 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP1_0900
     * @tc.name      testDateCube0009
     * @tc.desc      Verify concatDate(2000, 1, 31) pads to 20000131.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0009 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2000, 1, 31)).assertEqual('20000131');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0009 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP1_1000
     * @tc.name      testDateCube0010
     * @tc.desc      Verify concatDate(2000, 1, 32) pads to 20000132.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0010 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2000, 1, 32)).assertEqual('20000132');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0010 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP1_1100
     * @tc.name      testDateCube0011
     * @tc.desc      Verify concatDate(2000, 2, 0) pads to 20000200.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0011 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2000, 2, 0)).assertEqual('20000200');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0011 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP1_1200
     * @tc.name      testDateCube0012
     * @tc.desc      Verify concatDate(2000, 2, 1) pads to 20000201.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0012 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2000, 2, 1)).assertEqual('20000201');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0012 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP1_1300
     * @tc.name      testDateCube0013
     * @tc.desc      Verify concatDate(2000, 2, 15) pads to 20000215.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0013 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2000, 2, 15)).assertEqual('20000215');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0013 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP1_1400
     * @tc.name      testDateCube0014
     * @tc.desc      Verify concatDate(2000, 2, 31) pads to 20000231.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0014 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2000, 2, 31)).assertEqual('20000231');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0014 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP1_1500
     * @tc.name      testDateCube0015
     * @tc.desc      Verify concatDate(2000, 2, 32) pads to 20000232.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0015 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2000, 2, 32)).assertEqual('20000232');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0015 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP1_1600
     * @tc.name      testDateCube0016
     * @tc.desc      Verify concatDate(2000, 3, 0) pads to 20000300.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0016 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2000, 3, 0)).assertEqual('20000300');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0016 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP1_1700
     * @tc.name      testDateCube0017
     * @tc.desc      Verify concatDate(2000, 3, 1) pads to 20000301.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0017 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2000, 3, 1)).assertEqual('20000301');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0017 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP1_1800
     * @tc.name      testDateCube0018
     * @tc.desc      Verify concatDate(2000, 3, 15) pads to 20000315.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0018 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2000, 3, 15)).assertEqual('20000315');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0018 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP1_1900
     * @tc.name      testDateCube0019
     * @tc.desc      Verify concatDate(2000, 3, 31) pads to 20000331.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0019 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2000, 3, 31)).assertEqual('20000331');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0019 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP1_2000
     * @tc.name      testDateCube0020
     * @tc.desc      Verify concatDate(2000, 3, 32) pads to 20000332.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0020 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2000, 3, 32)).assertEqual('20000332');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0020 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP1_2100
     * @tc.name      testDateCube0021
     * @tc.desc      Verify concatDate(2000, 4, 0) pads to 20000400.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0021 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2000, 4, 0)).assertEqual('20000400');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0021 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP1_2200
     * @tc.name      testDateCube0022
     * @tc.desc      Verify concatDate(2000, 4, 1) pads to 20000401.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0022 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2000, 4, 1)).assertEqual('20000401');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0022 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP1_2300
     * @tc.name      testDateCube0023
     * @tc.desc      Verify concatDate(2000, 4, 15) pads to 20000415.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0023 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2000, 4, 15)).assertEqual('20000415');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0023 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP1_2400
     * @tc.name      testDateCube0024
     * @tc.desc      Verify concatDate(2000, 4, 31) pads to 20000431.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0024 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2000, 4, 31)).assertEqual('20000431');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0024 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP1_2500
     * @tc.name      testDateCube0025
     * @tc.desc      Verify concatDate(2000, 4, 32) pads to 20000432.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0025 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2000, 4, 32)).assertEqual('20000432');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0025 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP1_2600
     * @tc.name      testDateCube0026
     * @tc.desc      Verify concatDate(2000, 5, 0) pads to 20000500.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0026 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2000, 5, 0)).assertEqual('20000500');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0026 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP1_2700
     * @tc.name      testDateCube0027
     * @tc.desc      Verify concatDate(2000, 5, 1) pads to 20000501.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0027 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2000, 5, 1)).assertEqual('20000501');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0027 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP1_2800
     * @tc.name      testDateCube0028
     * @tc.desc      Verify concatDate(2000, 5, 15) pads to 20000515.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0028 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2000, 5, 15)).assertEqual('20000515');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0028 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP1_2900
     * @tc.name      testDateCube0029
     * @tc.desc      Verify concatDate(2000, 5, 31) pads to 20000531.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0029 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2000, 5, 31)).assertEqual('20000531');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0029 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP1_3000
     * @tc.name      testDateCube0030
     * @tc.desc      Verify concatDate(2000, 5, 32) pads to 20000532.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0030 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2000, 5, 32)).assertEqual('20000532');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0030 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP1_3100
     * @tc.name      testDateCube0031
     * @tc.desc      Verify concatDate(2000, 6, 0) pads to 20000600.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0031 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2000, 6, 0)).assertEqual('20000600');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0031 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP1_3200
     * @tc.name      testDateCube0032
     * @tc.desc      Verify concatDate(2000, 6, 1) pads to 20000601.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0032 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2000, 6, 1)).assertEqual('20000601');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0032 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP1_3300
     * @tc.name      testDateCube0033
     * @tc.desc      Verify concatDate(2000, 6, 15) pads to 20000615.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0033 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2000, 6, 15)).assertEqual('20000615');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0033 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP1_3400
     * @tc.name      testDateCube0034
     * @tc.desc      Verify concatDate(2000, 6, 31) pads to 20000631.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0034 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2000, 6, 31)).assertEqual('20000631');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0034 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP1_3500
     * @tc.name      testDateCube0035
     * @tc.desc      Verify concatDate(2000, 6, 32) pads to 20000632.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0035 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2000, 6, 32)).assertEqual('20000632');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0035 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP1_3600
     * @tc.name      testDateCube0036
     * @tc.desc      Verify concatDate(2000, 7, 0) pads to 20000700.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0036 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2000, 7, 0)).assertEqual('20000700');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0036 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP1_3700
     * @tc.name      testDateCube0037
     * @tc.desc      Verify concatDate(2000, 7, 1) pads to 20000701.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0037 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2000, 7, 1)).assertEqual('20000701');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0037 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP1_3800
     * @tc.name      testDateCube0038
     * @tc.desc      Verify concatDate(2000, 7, 15) pads to 20000715.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0038 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2000, 7, 15)).assertEqual('20000715');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0038 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP1_3900
     * @tc.name      testDateCube0039
     * @tc.desc      Verify concatDate(2000, 7, 31) pads to 20000731.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0039 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2000, 7, 31)).assertEqual('20000731');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0039 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP1_4000
     * @tc.name      testDateCube0040
     * @tc.desc      Verify concatDate(2000, 7, 32) pads to 20000732.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0040 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2000, 7, 32)).assertEqual('20000732');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0040 end');
    })

  })
}
