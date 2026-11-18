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

export default function DateTimeFormatMatrixPart2Test(): void {
  describe('DateTimeFormatMatrixPart2', () => {

    /**
     * @tc.number    SUB_PHOTO_DTFP2_4200
     * @tc.name      testConcatDate0042
     * @tc.desc      Verify concatDate(2038, 9, 9) returns 20380909.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0042 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2038, 9, 9)).assertEqual('20380909');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0042 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTFP2_4300
     * @tc.name      testConcatDate0043
     * @tc.desc      Verify concatDate(2025, 10, 10) returns 20251010.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0043 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2025, 10, 10)).assertEqual('20251010');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0043 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTFP2_4400
     * @tc.name      testConcatDate0044
     * @tc.desc      Verify concatDate(2024, 6, 30) returns 20240630.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0044 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2024, 6, 30)).assertEqual('20240630');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0044 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTFP2_4500
     * @tc.name      testConcatDate0045
     * @tc.desc      Verify concatDate(1999, 12, 9) returns 19991209.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0045 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(1999, 12, 9)).assertEqual('19991209');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0045 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTFP2_4600
     * @tc.name      testConcatDate0046
     * @tc.desc      Verify concatDate(2100, 3, 5) returns 21000305.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0046 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2100, 3, 5)).assertEqual('21000305');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0046 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTFP2_4700
     * @tc.name      testConcatDate0047
     * @tc.desc      Verify concatDate(2026, 7, 4) returns 20260704.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0047 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2026, 7, 4)).assertEqual('20260704');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0047 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTFP2_4800
     * @tc.name      testConcatDate0048
     * @tc.desc      Verify concatDate(2026, 8, 15) returns 20260815.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0048 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2026, 8, 15)).assertEqual('20260815');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0048 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTFP2_4900
     * @tc.name      testConcatDate0049
     * @tc.desc      Verify concatDate(2026, 11, 3) returns 20261103.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0049 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2026, 11, 3)).assertEqual('20261103');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0049 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTFP2_5000
     * @tc.name      testConcatDate0050
     * @tc.desc      Verify concatDate(2027, 2, 28) returns 20270228.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0050 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2027, 2, 28)).assertEqual('20270228');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0050 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTFP2_5100
     * @tc.name      testConcatDate0051
     * @tc.desc      Verify concatDate(2023, 4, 7) returns 20230407.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0051 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2023, 4, 7)).assertEqual('20230407');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0051 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTFP2_5200
     * @tc.name      testConcatDate0052
     * @tc.desc      Verify concatDate(2010, 5, 6) returns 20100506.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0052 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2010, 5, 6)).assertEqual('20100506');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0052 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTFP2_5300
     * @tc.name      testConcatDate0053
     * @tc.desc      Verify concatDate(1990, 8, 12) returns 19900812.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0053 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(1990, 8, 12)).assertEqual('19900812');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0053 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTFP2_5400
     * @tc.name      testConcatDate0054
     * @tc.desc      Verify concatDate(2050, 10, 1) returns 20501001.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0054 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2050, 10, 1)).assertEqual('20501001');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0054 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTFP2_5500
     * @tc.name      testConcatDate0055
     * @tc.desc      Verify concatDate(2044, 11, 30) returns 20441130.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0055 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2044, 11, 30)).assertEqual('20441130');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0055 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTFP2_5600
     * @tc.name      testConcatDate0056
     * @tc.desc      Verify concatDate(2012, 12, 12) returns 20121212.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0056 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2012, 12, 12)).assertEqual('20121212');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0056 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTFP2_5700
     * @tc.name      testConcatDate0057
     * @tc.desc      Verify concatDate(2002, 2, 2) returns 20020202.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0057 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2002, 2, 2)).assertEqual('20020202');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0057 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTFP2_5800
     * @tc.name      testConcatTime0058
     * @tc.desc      Verify concatTime(0, 0, 0) returns 000000.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0058 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(0, 0, 0)).assertEqual('000000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0058 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTFP2_5900
     * @tc.name      testConcatTime0059
     * @tc.desc      Verify concatTime(9, 9, 9) returns 090909.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0059 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(9, 9, 9)).assertEqual('090909');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0059 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTFP2_6000
     * @tc.name      testConcatTime0060
     * @tc.desc      Verify concatTime(10, 10, 10) returns 101010.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0060 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(10, 10, 10)).assertEqual('101010');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0060 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTFP2_6100
     * @tc.name      testConcatTime0061
     * @tc.desc      Verify concatTime(23, 59, 59) returns 235959.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0061 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(23, 59, 59)).assertEqual('235959');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0061 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTFP2_6200
     * @tc.name      testConcatTime0062
     * @tc.desc      Verify concatTime(1, 2, 3) returns 010203.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0062 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(1, 2, 3)).assertEqual('010203');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0062 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTFP2_6300
     * @tc.name      testConcatTime0063
     * @tc.desc      Verify concatTime(12, 34, 56) returns 123456.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0063 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(12, 34, 56)).assertEqual('123456');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0063 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTFP2_6400
     * @tc.name      testConcatTime0064
     * @tc.desc      Verify concatTime(5, 6, 7) returns 050607.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0064 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(5, 6, 7)).assertEqual('050607');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0064 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTFP2_6500
     * @tc.name      testConcatTime0065
     * @tc.desc      Verify concatTime(19, 20, 21) returns 192021.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0065 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(19, 20, 21)).assertEqual('192021');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0065 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTFP2_6600
     * @tc.name      testConcatTime0066
     * @tc.desc      Verify concatTime(23, 0, 0) returns 230000.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0066 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(23, 0, 0)).assertEqual('230000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0066 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTFP2_6700
     * @tc.name      testConcatTime0067
     * @tc.desc      Verify concatTime(0, 59, 0) returns 005900.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0067 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(0, 59, 0)).assertEqual('005900');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0067 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTFP2_6800
     * @tc.name      testConcatTime0068
     * @tc.desc      Verify concatTime(0, 0, 59) returns 000059.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0068 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(0, 0, 59)).assertEqual('000059');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0068 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTFP2_6900
     * @tc.name      testConcatTime0069
     * @tc.desc      Verify concatTime(11, 11, 11) returns 111111.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0069 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(11, 11, 11)).assertEqual('111111');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0069 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTFP2_7000
     * @tc.name      testConcatTime0070
     * @tc.desc      Verify concatTime(22, 22, 22) returns 222222.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0070 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(22, 22, 22)).assertEqual('222222');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0070 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTFP2_7100
     * @tc.name      testConcatTime0071
     * @tc.desc      Verify concatTime(7, 8, 9) returns 070809.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0071 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(7, 8, 9)).assertEqual('070809');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0071 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTFP2_7200
     * @tc.name      testConcatTime0072
     * @tc.desc      Verify concatTime(14, 15, 16) returns 141516.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0072 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(14, 15, 16)).assertEqual('141516');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0072 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTFP2_7300
     * @tc.name      testConcatTime0073
     * @tc.desc      Verify concatTime(18, 19, 20) returns 181920.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0073 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(18, 19, 20)).assertEqual('181920');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0073 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTFP2_7400
     * @tc.name      testConcatTime0074
     * @tc.desc      Verify concatTime(2, 3, 4) returns 020304.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0074 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(2, 3, 4)).assertEqual('020304');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0074 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTFP2_7500
     * @tc.name      testConcatTime0075
     * @tc.desc      Verify concatTime(6, 7, 8) returns 060708.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0075 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(6, 7, 8)).assertEqual('060708');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0075 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTFP2_7600
     * @tc.name      testConcatTime0076
     * @tc.desc      Verify concatTime(13, 14, 15) returns 131415.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0076 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(13, 14, 15)).assertEqual('131415');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0076 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTFP2_7700
     * @tc.name      testConcatTime0077
     * @tc.desc      Verify concatTime(15, 16, 17) returns 151617.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0077 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(15, 16, 17)).assertEqual('151617');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0077 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTFP2_7800
     * @tc.name      testConcatTime0078
     * @tc.desc      Verify concatTime(17, 18, 19) returns 171819.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0078 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(17, 18, 19)).assertEqual('171819');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0078 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTFP2_7900
     * @tc.name      testConcatTime0079
     * @tc.desc      Verify concatTime(4, 5, 6) returns 040506.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0079 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(4, 5, 6)).assertEqual('040506');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0079 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTFP2_8000
     * @tc.name      testConcatTime0080
     * @tc.desc      Verify concatTime(8, 9, 10) returns 080910.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0080 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(8, 9, 10)).assertEqual('080910');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0080 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTFP2_8100
     * @tc.name      testConcatTime0081
     * @tc.desc      Verify concatTime(20, 21, 22) returns 202122.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0081 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(20, 21, 22)).assertEqual('202122');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0081 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTFP2_8200
     * @tc.name      testConcatTime0082
     * @tc.desc      Verify concatTime(21, 23, 24) returns 212324.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0082 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(21, 23, 24)).assertEqual('212324');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0082 end');
    })

  })
}
