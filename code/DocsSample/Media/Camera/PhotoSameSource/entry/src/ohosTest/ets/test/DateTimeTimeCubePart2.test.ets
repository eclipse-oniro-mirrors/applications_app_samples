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

export default function DateTimeTimeCubePart2Test(): void {
  describe('DateTimeTimeCubePart2', () => {

    /**
     * @tc.number    SUB_PHOTO_TCUBP2_4100
     * @tc.name      testTimeCube0041
     * @tc.desc      Verify concatTime(4, 59, 30) pads to 045930.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0041 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(4, 59, 30)).assertEqual('045930');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0041 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP2_4200
     * @tc.name      testTimeCube0042
     * @tc.desc      Verify concatTime(4, 59, 59) pads to 045959.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0042 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(4, 59, 59)).assertEqual('045959');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0042 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP2_4300
     * @tc.name      testTimeCube0043
     * @tc.desc      Verify concatTime(5, 0, 0) pads to 050000.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0043 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(5, 0, 0)).assertEqual('050000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0043 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP2_4400
     * @tc.name      testTimeCube0044
     * @tc.desc      Verify concatTime(5, 0, 30) pads to 050030.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0044 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(5, 0, 30)).assertEqual('050030');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0044 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP2_4500
     * @tc.name      testTimeCube0045
     * @tc.desc      Verify concatTime(5, 0, 59) pads to 050059.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0045 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(5, 0, 59)).assertEqual('050059');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0045 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP2_4600
     * @tc.name      testTimeCube0046
     * @tc.desc      Verify concatTime(5, 30, 0) pads to 053000.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0046 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(5, 30, 0)).assertEqual('053000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0046 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP2_4700
     * @tc.name      testTimeCube0047
     * @tc.desc      Verify concatTime(5, 30, 30) pads to 053030.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0047 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(5, 30, 30)).assertEqual('053030');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0047 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP2_4800
     * @tc.name      testTimeCube0048
     * @tc.desc      Verify concatTime(5, 30, 59) pads to 053059.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0048 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(5, 30, 59)).assertEqual('053059');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0048 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP2_4900
     * @tc.name      testTimeCube0049
     * @tc.desc      Verify concatTime(5, 59, 0) pads to 055900.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0049 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(5, 59, 0)).assertEqual('055900');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0049 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP2_5000
     * @tc.name      testTimeCube0050
     * @tc.desc      Verify concatTime(5, 59, 30) pads to 055930.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0050 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(5, 59, 30)).assertEqual('055930');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0050 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP2_5100
     * @tc.name      testTimeCube0051
     * @tc.desc      Verify concatTime(5, 59, 59) pads to 055959.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0051 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(5, 59, 59)).assertEqual('055959');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0051 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP2_5200
     * @tc.name      testTimeCube0052
     * @tc.desc      Verify concatTime(6, 0, 0) pads to 060000.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0052 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(6, 0, 0)).assertEqual('060000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0052 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP2_5300
     * @tc.name      testTimeCube0053
     * @tc.desc      Verify concatTime(6, 0, 30) pads to 060030.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0053 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(6, 0, 30)).assertEqual('060030');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0053 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP2_5400
     * @tc.name      testTimeCube0054
     * @tc.desc      Verify concatTime(6, 0, 59) pads to 060059.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0054 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(6, 0, 59)).assertEqual('060059');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0054 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP2_5500
     * @tc.name      testTimeCube0055
     * @tc.desc      Verify concatTime(6, 30, 0) pads to 063000.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0055 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(6, 30, 0)).assertEqual('063000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0055 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP2_5600
     * @tc.name      testTimeCube0056
     * @tc.desc      Verify concatTime(6, 30, 30) pads to 063030.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0056 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(6, 30, 30)).assertEqual('063030');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0056 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP2_5700
     * @tc.name      testTimeCube0057
     * @tc.desc      Verify concatTime(6, 30, 59) pads to 063059.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0057 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(6, 30, 59)).assertEqual('063059');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0057 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP2_5800
     * @tc.name      testTimeCube0058
     * @tc.desc      Verify concatTime(6, 59, 0) pads to 065900.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0058 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(6, 59, 0)).assertEqual('065900');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0058 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP2_5900
     * @tc.name      testTimeCube0059
     * @tc.desc      Verify concatTime(6, 59, 30) pads to 065930.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0059 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(6, 59, 30)).assertEqual('065930');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0059 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP2_6000
     * @tc.name      testTimeCube0060
     * @tc.desc      Verify concatTime(6, 59, 59) pads to 065959.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0060 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(6, 59, 59)).assertEqual('065959');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0060 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP2_6100
     * @tc.name      testTimeCube0061
     * @tc.desc      Verify concatTime(7, 0, 0) pads to 070000.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0061 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(7, 0, 0)).assertEqual('070000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0061 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP2_6200
     * @tc.name      testTimeCube0062
     * @tc.desc      Verify concatTime(7, 0, 30) pads to 070030.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0062 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(7, 0, 30)).assertEqual('070030');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0062 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP2_6300
     * @tc.name      testTimeCube0063
     * @tc.desc      Verify concatTime(7, 0, 59) pads to 070059.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0063 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(7, 0, 59)).assertEqual('070059');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0063 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP2_6400
     * @tc.name      testTimeCube0064
     * @tc.desc      Verify concatTime(7, 30, 0) pads to 073000.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0064 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(7, 30, 0)).assertEqual('073000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0064 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP2_6500
     * @tc.name      testTimeCube0065
     * @tc.desc      Verify concatTime(7, 30, 30) pads to 073030.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0065 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(7, 30, 30)).assertEqual('073030');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0065 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP2_6600
     * @tc.name      testTimeCube0066
     * @tc.desc      Verify concatTime(7, 30, 59) pads to 073059.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0066 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(7, 30, 59)).assertEqual('073059');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0066 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP2_6700
     * @tc.name      testTimeCube0067
     * @tc.desc      Verify concatTime(7, 59, 0) pads to 075900.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0067 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(7, 59, 0)).assertEqual('075900');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0067 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP2_6800
     * @tc.name      testTimeCube0068
     * @tc.desc      Verify concatTime(7, 59, 30) pads to 075930.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0068 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(7, 59, 30)).assertEqual('075930');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0068 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP2_6900
     * @tc.name      testTimeCube0069
     * @tc.desc      Verify concatTime(7, 59, 59) pads to 075959.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0069 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(7, 59, 59)).assertEqual('075959');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0069 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP2_7000
     * @tc.name      testTimeCube0070
     * @tc.desc      Verify concatTime(8, 0, 0) pads to 080000.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0070 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(8, 0, 0)).assertEqual('080000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0070 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP2_7100
     * @tc.name      testTimeCube0071
     * @tc.desc      Verify concatTime(8, 0, 30) pads to 080030.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0071 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(8, 0, 30)).assertEqual('080030');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0071 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP2_7200
     * @tc.name      testTimeCube0072
     * @tc.desc      Verify concatTime(8, 0, 59) pads to 080059.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0072 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(8, 0, 59)).assertEqual('080059');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0072 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP2_7300
     * @tc.name      testTimeCube0073
     * @tc.desc      Verify concatTime(8, 30, 0) pads to 083000.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0073 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(8, 30, 0)).assertEqual('083000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0073 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP2_7400
     * @tc.name      testTimeCube0074
     * @tc.desc      Verify concatTime(8, 30, 30) pads to 083030.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0074 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(8, 30, 30)).assertEqual('083030');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0074 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP2_7500
     * @tc.name      testTimeCube0075
     * @tc.desc      Verify concatTime(8, 30, 59) pads to 083059.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0075 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(8, 30, 59)).assertEqual('083059');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0075 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP2_7600
     * @tc.name      testTimeCube0076
     * @tc.desc      Verify concatTime(8, 59, 0) pads to 085900.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0076 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(8, 59, 0)).assertEqual('085900');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0076 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP2_7700
     * @tc.name      testTimeCube0077
     * @tc.desc      Verify concatTime(8, 59, 30) pads to 085930.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0077 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(8, 59, 30)).assertEqual('085930');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0077 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP2_7800
     * @tc.name      testTimeCube0078
     * @tc.desc      Verify concatTime(8, 59, 59) pads to 085959.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0078 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(8, 59, 59)).assertEqual('085959');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0078 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP2_7900
     * @tc.name      testTimeCube0079
     * @tc.desc      Verify concatTime(9, 0, 0) pads to 090000.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0079 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(9, 0, 0)).assertEqual('090000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0079 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP2_8000
     * @tc.name      testTimeCube0080
     * @tc.desc      Verify concatTime(9, 0, 30) pads to 090030.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0080 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(9, 0, 30)).assertEqual('090030');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0080 end');
    })

  })
}
