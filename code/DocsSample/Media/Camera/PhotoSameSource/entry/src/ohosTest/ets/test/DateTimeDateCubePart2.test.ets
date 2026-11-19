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

export default function DateTimeDateCubePart2Test(): void {
  describe('DateTimeDateCubePart2', () => {

    /**
     * @tc.number    SUB_PHOTO_DCUBP2_4100
     * @tc.name      testDateCube0041
     * @tc.desc      Verify concatDate(2000, 8, 0) pads to 20000800.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0041 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2000, 8, 0)).assertEqual('20000800');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0041 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP2_4200
     * @tc.name      testDateCube0042
     * @tc.desc      Verify concatDate(2000, 8, 1) pads to 20000801.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0042 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2000, 8, 1)).assertEqual('20000801');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0042 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP2_4300
     * @tc.name      testDateCube0043
     * @tc.desc      Verify concatDate(2000, 8, 15) pads to 20000815.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0043 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2000, 8, 15)).assertEqual('20000815');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0043 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP2_4400
     * @tc.name      testDateCube0044
     * @tc.desc      Verify concatDate(2000, 8, 31) pads to 20000831.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0044 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2000, 8, 31)).assertEqual('20000831');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0044 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP2_4500
     * @tc.name      testDateCube0045
     * @tc.desc      Verify concatDate(2000, 8, 32) pads to 20000832.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0045 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2000, 8, 32)).assertEqual('20000832');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0045 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP2_4600
     * @tc.name      testDateCube0046
     * @tc.desc      Verify concatDate(2000, 9, 0) pads to 20000900.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0046 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2000, 9, 0)).assertEqual('20000900');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0046 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP2_4700
     * @tc.name      testDateCube0047
     * @tc.desc      Verify concatDate(2000, 9, 1) pads to 20000901.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0047 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2000, 9, 1)).assertEqual('20000901');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0047 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP2_4800
     * @tc.name      testDateCube0048
     * @tc.desc      Verify concatDate(2000, 9, 15) pads to 20000915.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0048 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2000, 9, 15)).assertEqual('20000915');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0048 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP2_4900
     * @tc.name      testDateCube0049
     * @tc.desc      Verify concatDate(2000, 9, 31) pads to 20000931.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0049 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2000, 9, 31)).assertEqual('20000931');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0049 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP2_5000
     * @tc.name      testDateCube0050
     * @tc.desc      Verify concatDate(2000, 9, 32) pads to 20000932.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0050 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2000, 9, 32)).assertEqual('20000932');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0050 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP2_5100
     * @tc.name      testDateCube0051
     * @tc.desc      Verify concatDate(2000, 10, 0) pads to 20001000.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0051 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2000, 10, 0)).assertEqual('20001000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0051 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP2_5200
     * @tc.name      testDateCube0052
     * @tc.desc      Verify concatDate(2000, 10, 1) pads to 20001001.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0052 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2000, 10, 1)).assertEqual('20001001');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0052 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP2_5300
     * @tc.name      testDateCube0053
     * @tc.desc      Verify concatDate(2000, 10, 15) pads to 20001015.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0053 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2000, 10, 15)).assertEqual('20001015');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0053 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP2_5400
     * @tc.name      testDateCube0054
     * @tc.desc      Verify concatDate(2000, 10, 31) pads to 20001031.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0054 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2000, 10, 31)).assertEqual('20001031');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0054 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP2_5500
     * @tc.name      testDateCube0055
     * @tc.desc      Verify concatDate(2000, 10, 32) pads to 20001032.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0055 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2000, 10, 32)).assertEqual('20001032');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0055 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP2_5600
     * @tc.name      testDateCube0056
     * @tc.desc      Verify concatDate(2000, 11, 0) pads to 20001100.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0056 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2000, 11, 0)).assertEqual('20001100');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0056 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP2_5700
     * @tc.name      testDateCube0057
     * @tc.desc      Verify concatDate(2000, 11, 1) pads to 20001101.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0057 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2000, 11, 1)).assertEqual('20001101');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0057 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP2_5800
     * @tc.name      testDateCube0058
     * @tc.desc      Verify concatDate(2000, 11, 15) pads to 20001115.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0058 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2000, 11, 15)).assertEqual('20001115');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0058 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP2_5900
     * @tc.name      testDateCube0059
     * @tc.desc      Verify concatDate(2000, 11, 31) pads to 20001131.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0059 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2000, 11, 31)).assertEqual('20001131');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0059 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP2_6000
     * @tc.name      testDateCube0060
     * @tc.desc      Verify concatDate(2000, 11, 32) pads to 20001132.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0060 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2000, 11, 32)).assertEqual('20001132');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0060 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP2_6100
     * @tc.name      testDateCube0061
     * @tc.desc      Verify concatDate(2000, 12, 0) pads to 20001200.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0061 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2000, 12, 0)).assertEqual('20001200');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0061 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP2_6200
     * @tc.name      testDateCube0062
     * @tc.desc      Verify concatDate(2000, 12, 1) pads to 20001201.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0062 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2000, 12, 1)).assertEqual('20001201');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0062 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP2_6300
     * @tc.name      testDateCube0063
     * @tc.desc      Verify concatDate(2000, 12, 15) pads to 20001215.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0063 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2000, 12, 15)).assertEqual('20001215');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0063 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP2_6400
     * @tc.name      testDateCube0064
     * @tc.desc      Verify concatDate(2000, 12, 31) pads to 20001231.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0064 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2000, 12, 31)).assertEqual('20001231');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0064 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP2_6500
     * @tc.name      testDateCube0065
     * @tc.desc      Verify concatDate(2000, 12, 32) pads to 20001232.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0065 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2000, 12, 32)).assertEqual('20001232');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0065 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP2_6600
     * @tc.name      testDateCube0066
     * @tc.desc      Verify concatDate(2026, 0, 0) pads to 20260000.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0066 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2026, 0, 0)).assertEqual('20260000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0066 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP2_6700
     * @tc.name      testDateCube0067
     * @tc.desc      Verify concatDate(2026, 0, 15) pads to 20260015.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0067 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2026, 0, 15)).assertEqual('20260015');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0067 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP2_6800
     * @tc.name      testDateCube0068
     * @tc.desc      Verify concatDate(2026, 0, 31) pads to 20260031.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0068 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2026, 0, 31)).assertEqual('20260031');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0068 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP2_6900
     * @tc.name      testDateCube0069
     * @tc.desc      Verify concatDate(2026, 0, 32) pads to 20260032.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0069 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2026, 0, 32)).assertEqual('20260032');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0069 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP2_7000
     * @tc.name      testDateCube0070
     * @tc.desc      Verify concatDate(2026, 1, 15) pads to 20260115.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0070 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2026, 1, 15)).assertEqual('20260115');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0070 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP2_7100
     * @tc.name      testDateCube0071
     * @tc.desc      Verify concatDate(2026, 1, 31) pads to 20260131.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0071 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2026, 1, 31)).assertEqual('20260131');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0071 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP2_7200
     * @tc.name      testDateCube0072
     * @tc.desc      Verify concatDate(2026, 2, 0) pads to 20260200.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0072 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2026, 2, 0)).assertEqual('20260200');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0072 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP2_7300
     * @tc.name      testDateCube0073
     * @tc.desc      Verify concatDate(2026, 2, 1) pads to 20260201.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0073 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2026, 2, 1)).assertEqual('20260201');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0073 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP2_7400
     * @tc.name      testDateCube0074
     * @tc.desc      Verify concatDate(2026, 2, 15) pads to 20260215.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0074 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2026, 2, 15)).assertEqual('20260215');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0074 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP2_7500
     * @tc.name      testDateCube0075
     * @tc.desc      Verify concatDate(2026, 2, 31) pads to 20260231.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0075 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2026, 2, 31)).assertEqual('20260231');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0075 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP2_7600
     * @tc.name      testDateCube0076
     * @tc.desc      Verify concatDate(2026, 2, 32) pads to 20260232.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0076 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2026, 2, 32)).assertEqual('20260232');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0076 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP2_7700
     * @tc.name      testDateCube0077
     * @tc.desc      Verify concatDate(2026, 3, 0) pads to 20260300.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0077 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2026, 3, 0)).assertEqual('20260300');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0077 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP2_7800
     * @tc.name      testDateCube0078
     * @tc.desc      Verify concatDate(2026, 3, 1) pads to 20260301.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0078 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2026, 3, 1)).assertEqual('20260301');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0078 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP2_7900
     * @tc.name      testDateCube0079
     * @tc.desc      Verify concatDate(2026, 3, 15) pads to 20260315.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0079 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2026, 3, 15)).assertEqual('20260315');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0079 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP2_8000
     * @tc.name      testDateCube0080
     * @tc.desc      Verify concatDate(2026, 3, 31) pads to 20260331.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0080 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2026, 3, 31)).assertEqual('20260331');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0080 end');
    })

  })
}
