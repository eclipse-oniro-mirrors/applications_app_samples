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

import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import DateTimeUtil, { dateTime } from '../../../main/ets/utils/DateTimeUtil';

const util: DateTimeUtil = new DateTimeUtil();

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AVRecorder]';

export default function DateTimeConcatDateMatrixPart2Test(): void {
  describe('DateTimeConcatDateMatrixPart2', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })


    /**
     * @tc.number    SUB_AVREC_DTDATEP2_9100
     * @tc.name      testConcatDate0091
     * @tc.desc      Verify date composition 2024-11-10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0091 begin');
      expect(util.concatDate(2024, 11, 10)).assertEqual('20241110');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0091 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_9200
     * @tc.name      testConcatDate0092
     * @tc.desc      Verify date composition 2024-11-11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0092 begin');
      expect(util.concatDate(2024, 11, 11)).assertEqual('20241111');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0092 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_9300
     * @tc.name      testConcatDate0093
     * @tc.desc      Verify date composition 2024-11-15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0093 begin');
      expect(util.concatDate(2024, 11, 15)).assertEqual('20241115');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0093 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_9400
     * @tc.name      testConcatDate0094
     * @tc.desc      Verify date composition 2024-11-20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0094 begin');
      expect(util.concatDate(2024, 11, 20)).assertEqual('20241120');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0094 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_9500
     * @tc.name      testConcatDate0095
     * @tc.desc      Verify date composition 2024-11-25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0095 begin');
      expect(util.concatDate(2024, 11, 25)).assertEqual('20241125');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0095 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_9600
     * @tc.name      testConcatDate0096
     * @tc.desc      Verify date composition 2024-11-28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0096 begin');
      expect(util.concatDate(2024, 11, 28)).assertEqual('20241128');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0096 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_9700
     * @tc.name      testConcatDate0097
     * @tc.desc      Verify date composition 2024-11-29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0097 begin');
      expect(util.concatDate(2024, 11, 29)).assertEqual('20241129');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0097 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_9800
     * @tc.name      testConcatDate0098
     * @tc.desc      Verify date composition 2024-11-30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0098 begin');
      expect(util.concatDate(2024, 11, 30)).assertEqual('20241130');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0098 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_9900
     * @tc.name      testConcatDate0099
     * @tc.desc      Verify date composition 2024-11-31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0099 begin');
      expect(util.concatDate(2024, 11, 31)).assertEqual('20241131');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0099 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_ONE_0100
     * @tc.name      testConcatDate0100
     * @tc.desc      Verify date composition 2024-12-10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0100 begin');
      expect(util.concatDate(2024, 12, 10)).assertEqual('20241210');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0100 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_ONE_0200
     * @tc.name      testConcatDate0101
     * @tc.desc      Verify date composition 2024-12-11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0101 begin');
      expect(util.concatDate(2024, 12, 11)).assertEqual('20241211');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0101 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_ONE_0300
     * @tc.name      testConcatDate0102
     * @tc.desc      Verify date composition 2024-12-15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0102 begin');
      expect(util.concatDate(2024, 12, 15)).assertEqual('20241215');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0102 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_ONE_0400
     * @tc.name      testConcatDate0103
     * @tc.desc      Verify date composition 2024-12-20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0103 begin');
      expect(util.concatDate(2024, 12, 20)).assertEqual('20241220');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0103 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_ONE_0500
     * @tc.name      testConcatDate0104
     * @tc.desc      Verify date composition 2024-12-25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0104 begin');
      expect(util.concatDate(2024, 12, 25)).assertEqual('20241225');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0104 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_ONE_0600
     * @tc.name      testConcatDate0105
     * @tc.desc      Verify date composition 2024-12-28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0105 begin');
      expect(util.concatDate(2024, 12, 28)).assertEqual('20241228');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0105 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_ONE_0700
     * @tc.name      testConcatDate0106
     * @tc.desc      Verify date composition 2024-12-29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0106 begin');
      expect(util.concatDate(2024, 12, 29)).assertEqual('20241229');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0106 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_ONE_0800
     * @tc.name      testConcatDate0107
     * @tc.desc      Verify date composition 2024-12-30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0107 begin');
      expect(util.concatDate(2024, 12, 30)).assertEqual('20241230');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0107 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_ONE_0900
     * @tc.name      testConcatDate0108
     * @tc.desc      Verify date composition 2024-12-31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0108 begin');
      expect(util.concatDate(2024, 12, 31)).assertEqual('20241231');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0108 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_ONE_1000
     * @tc.name      testConcatDate0109
     * @tc.desc      Verify date composition 2025-1-10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0109 begin');
      expect(util.concatDate(2025, 1, 10)).assertEqual('2025110');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0109 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_ONE_1100
     * @tc.name      testConcatDate0110
     * @tc.desc      Verify date composition 2025-1-11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0110 begin');
      expect(util.concatDate(2025, 1, 11)).assertEqual('2025111');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0110 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_ONE_1200
     * @tc.name      testConcatDate0111
     * @tc.desc      Verify date composition 2025-1-15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0111 begin');
      expect(util.concatDate(2025, 1, 15)).assertEqual('2025115');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0111 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_ONE_1300
     * @tc.name      testConcatDate0112
     * @tc.desc      Verify date composition 2025-1-20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0112 begin');
      expect(util.concatDate(2025, 1, 20)).assertEqual('2025120');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0112 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_ONE_1400
     * @tc.name      testConcatDate0113
     * @tc.desc      Verify date composition 2025-1-25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0113 begin');
      expect(util.concatDate(2025, 1, 25)).assertEqual('2025125');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0113 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_ONE_1500
     * @tc.name      testConcatDate0114
     * @tc.desc      Verify date composition 2025-1-28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0114 begin');
      expect(util.concatDate(2025, 1, 28)).assertEqual('2025128');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0114 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_ONE_1600
     * @tc.name      testConcatDate0115
     * @tc.desc      Verify date composition 2025-1-29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0115 begin');
      expect(util.concatDate(2025, 1, 29)).assertEqual('2025129');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0115 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_ONE_1700
     * @tc.name      testConcatDate0116
     * @tc.desc      Verify date composition 2025-1-30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0116 begin');
      expect(util.concatDate(2025, 1, 30)).assertEqual('2025130');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0116 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_ONE_1800
     * @tc.name      testConcatDate0117
     * @tc.desc      Verify date composition 2025-1-31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0117 begin');
      expect(util.concatDate(2025, 1, 31)).assertEqual('2025131');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0117 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_ONE_1900
     * @tc.name      testConcatDate0118
     * @tc.desc      Verify date composition 2025-2-10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0118 begin');
      expect(util.concatDate(2025, 2, 10)).assertEqual('2025210');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0118 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_ONE_2000
     * @tc.name      testConcatDate0119
     * @tc.desc      Verify date composition 2025-2-11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0119 begin');
      expect(util.concatDate(2025, 2, 11)).assertEqual('2025211');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0119 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_ONE_2100
     * @tc.name      testConcatDate0120
     * @tc.desc      Verify date composition 2025-2-15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0120 begin');
      expect(util.concatDate(2025, 2, 15)).assertEqual('2025215');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0120 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_ONE_2200
     * @tc.name      testConcatDate0121
     * @tc.desc      Verify date composition 2025-2-20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0121 begin');
      expect(util.concatDate(2025, 2, 20)).assertEqual('2025220');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0121 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_ONE_2300
     * @tc.name      testConcatDate0122
     * @tc.desc      Verify date composition 2025-2-25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0122 begin');
      expect(util.concatDate(2025, 2, 25)).assertEqual('2025225');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0122 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_ONE_2400
     * @tc.name      testConcatDate0123
     * @tc.desc      Verify date composition 2025-2-28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0123 begin');
      expect(util.concatDate(2025, 2, 28)).assertEqual('2025228');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0123 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_ONE_2500
     * @tc.name      testConcatDate0124
     * @tc.desc      Verify date composition 2025-2-29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0124 begin');
      expect(util.concatDate(2025, 2, 29)).assertEqual('2025229');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0124 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_ONE_2600
     * @tc.name      testConcatDate0125
     * @tc.desc      Verify date composition 2025-2-30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0125 begin');
      expect(util.concatDate(2025, 2, 30)).assertEqual('2025230');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0125 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_ONE_2700
     * @tc.name      testConcatDate0126
     * @tc.desc      Verify date composition 2025-2-31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0126 begin');
      expect(util.concatDate(2025, 2, 31)).assertEqual('2025231');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0126 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_ONE_2800
     * @tc.name      testConcatDate0127
     * @tc.desc      Verify date composition 2025-3-10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0127 begin');
      expect(util.concatDate(2025, 3, 10)).assertEqual('2025310');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0127 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_ONE_2900
     * @tc.name      testConcatDate0128
     * @tc.desc      Verify date composition 2025-3-11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0128 begin');
      expect(util.concatDate(2025, 3, 11)).assertEqual('2025311');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0128 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_ONE_3000
     * @tc.name      testConcatDate0129
     * @tc.desc      Verify date composition 2025-3-15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0129 begin');
      expect(util.concatDate(2025, 3, 15)).assertEqual('2025315');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0129 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_ONE_3100
     * @tc.name      testConcatDate0130
     * @tc.desc      Verify date composition 2025-3-20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0130 begin');
      expect(util.concatDate(2025, 3, 20)).assertEqual('2025320');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0130 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_ONE_3200
     * @tc.name      testConcatDate0131
     * @tc.desc      Verify date composition 2025-3-25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0131 begin');
      expect(util.concatDate(2025, 3, 25)).assertEqual('2025325');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0131 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_ONE_3300
     * @tc.name      testConcatDate0132
     * @tc.desc      Verify date composition 2025-3-28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0132 begin');
      expect(util.concatDate(2025, 3, 28)).assertEqual('2025328');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0132 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_ONE_3400
     * @tc.name      testConcatDate0133
     * @tc.desc      Verify date composition 2025-3-29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0133 begin');
      expect(util.concatDate(2025, 3, 29)).assertEqual('2025329');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0133 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_ONE_3500
     * @tc.name      testConcatDate0134
     * @tc.desc      Verify date composition 2025-3-30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0134 begin');
      expect(util.concatDate(2025, 3, 30)).assertEqual('2025330');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0134 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_ONE_3600
     * @tc.name      testConcatDate0135
     * @tc.desc      Verify date composition 2025-3-31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0135 begin');
      expect(util.concatDate(2025, 3, 31)).assertEqual('2025331');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0135 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_ONE_3700
     * @tc.name      testConcatDate0136
     * @tc.desc      Verify date composition 2025-4-10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0136 begin');
      expect(util.concatDate(2025, 4, 10)).assertEqual('2025410');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0136 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_ONE_3800
     * @tc.name      testConcatDate0137
     * @tc.desc      Verify date composition 2025-4-11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0137 begin');
      expect(util.concatDate(2025, 4, 11)).assertEqual('2025411');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0137 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_ONE_3900
     * @tc.name      testConcatDate0138
     * @tc.desc      Verify date composition 2025-4-15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0138 begin');
      expect(util.concatDate(2025, 4, 15)).assertEqual('2025415');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0138 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_ONE_4000
     * @tc.name      testConcatDate0139
     * @tc.desc      Verify date composition 2025-4-20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0139 begin');
      expect(util.concatDate(2025, 4, 20)).assertEqual('2025420');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0139 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_ONE_4100
     * @tc.name      testConcatDate0140
     * @tc.desc      Verify date composition 2025-4-25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0140 begin');
      expect(util.concatDate(2025, 4, 25)).assertEqual('2025425');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0140 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_ONE_4200
     * @tc.name      testConcatDate0141
     * @tc.desc      Verify date composition 2025-4-28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0141 begin');
      expect(util.concatDate(2025, 4, 28)).assertEqual('2025428');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0141 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_ONE_4300
     * @tc.name      testConcatDate0142
     * @tc.desc      Verify date composition 2025-4-29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0142 begin');
      expect(util.concatDate(2025, 4, 29)).assertEqual('2025429');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0142 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_ONE_4400
     * @tc.name      testConcatDate0143
     * @tc.desc      Verify date composition 2025-4-30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0143 begin');
      expect(util.concatDate(2025, 4, 30)).assertEqual('2025430');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0143 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_ONE_4500
     * @tc.name      testConcatDate0144
     * @tc.desc      Verify date composition 2025-4-31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0144 begin');
      expect(util.concatDate(2025, 4, 31)).assertEqual('2025431');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0144 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_ONE_4600
     * @tc.name      testConcatDate0145
     * @tc.desc      Verify date composition 2025-5-10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0145 begin');
      expect(util.concatDate(2025, 5, 10)).assertEqual('2025510');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0145 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_ONE_4700
     * @tc.name      testConcatDate0146
     * @tc.desc      Verify date composition 2025-5-11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0146 begin');
      expect(util.concatDate(2025, 5, 11)).assertEqual('2025511');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0146 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_ONE_4800
     * @tc.name      testConcatDate0147
     * @tc.desc      Verify date composition 2025-5-15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0147 begin');
      expect(util.concatDate(2025, 5, 15)).assertEqual('2025515');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0147 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_ONE_4900
     * @tc.name      testConcatDate0148
     * @tc.desc      Verify date composition 2025-5-20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0148 begin');
      expect(util.concatDate(2025, 5, 20)).assertEqual('2025520');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0148 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_ONE_5000
     * @tc.name      testConcatDate0149
     * @tc.desc      Verify date composition 2025-5-25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0149 begin');
      expect(util.concatDate(2025, 5, 25)).assertEqual('2025525');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0149 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_ONE_5100
     * @tc.name      testConcatDate0150
     * @tc.desc      Verify date composition 2025-5-28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0150 begin');
      expect(util.concatDate(2025, 5, 28)).assertEqual('2025528');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0150 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_ONE_5200
     * @tc.name      testConcatDate0151
     * @tc.desc      Verify date composition 2025-5-29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0151 begin');
      expect(util.concatDate(2025, 5, 29)).assertEqual('2025529');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0151 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_ONE_5300
     * @tc.name      testConcatDate0152
     * @tc.desc      Verify date composition 2025-5-30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0152 begin');
      expect(util.concatDate(2025, 5, 30)).assertEqual('2025530');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0152 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_ONE_5400
     * @tc.name      testConcatDate0153
     * @tc.desc      Verify date composition 2025-5-31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0153 begin');
      expect(util.concatDate(2025, 5, 31)).assertEqual('2025531');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0153 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_ONE_5500
     * @tc.name      testConcatDate0154
     * @tc.desc      Verify date composition 2025-6-10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0154 begin');
      expect(util.concatDate(2025, 6, 10)).assertEqual('2025610');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0154 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_ONE_5600
     * @tc.name      testConcatDate0155
     * @tc.desc      Verify date composition 2025-6-11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0155 begin');
      expect(util.concatDate(2025, 6, 11)).assertEqual('2025611');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0155 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_ONE_5700
     * @tc.name      testConcatDate0156
     * @tc.desc      Verify date composition 2025-6-15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0156 begin');
      expect(util.concatDate(2025, 6, 15)).assertEqual('2025615');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0156 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_ONE_5800
     * @tc.name      testConcatDate0157
     * @tc.desc      Verify date composition 2025-6-20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0157 begin');
      expect(util.concatDate(2025, 6, 20)).assertEqual('2025620');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0157 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_ONE_5900
     * @tc.name      testConcatDate0158
     * @tc.desc      Verify date composition 2025-6-25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0158 begin');
      expect(util.concatDate(2025, 6, 25)).assertEqual('2025625');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0158 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_ONE_6000
     * @tc.name      testConcatDate0159
     * @tc.desc      Verify date composition 2025-6-28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0159 begin');
      expect(util.concatDate(2025, 6, 28)).assertEqual('2025628');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0159 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_ONE_6100
     * @tc.name      testConcatDate0160
     * @tc.desc      Verify date composition 2025-6-29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0160 begin');
      expect(util.concatDate(2025, 6, 29)).assertEqual('2025629');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0160 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_ONE_6200
     * @tc.name      testConcatDate0161
     * @tc.desc      Verify date composition 2025-6-30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0161 begin');
      expect(util.concatDate(2025, 6, 30)).assertEqual('2025630');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0161 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_ONE_6300
     * @tc.name      testConcatDate0162
     * @tc.desc      Verify date composition 2025-6-31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0162 begin');
      expect(util.concatDate(2025, 6, 31)).assertEqual('2025631');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0162 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_ONE_6400
     * @tc.name      testConcatDate0163
     * @tc.desc      Verify date composition 2025-7-10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0163 begin');
      expect(util.concatDate(2025, 7, 10)).assertEqual('2025710');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0163 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_ONE_6500
     * @tc.name      testConcatDate0164
     * @tc.desc      Verify date composition 2025-7-11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0164 begin');
      expect(util.concatDate(2025, 7, 11)).assertEqual('2025711');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0164 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_ONE_6600
     * @tc.name      testConcatDate0165
     * @tc.desc      Verify date composition 2025-7-15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0165 begin');
      expect(util.concatDate(2025, 7, 15)).assertEqual('2025715');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0165 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_ONE_6700
     * @tc.name      testConcatDate0166
     * @tc.desc      Verify date composition 2025-7-20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0166 begin');
      expect(util.concatDate(2025, 7, 20)).assertEqual('2025720');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0166 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_ONE_6800
     * @tc.name      testConcatDate0167
     * @tc.desc      Verify date composition 2025-7-25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0167 begin');
      expect(util.concatDate(2025, 7, 25)).assertEqual('2025725');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0167 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_ONE_6900
     * @tc.name      testConcatDate0168
     * @tc.desc      Verify date composition 2025-7-28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0168 begin');
      expect(util.concatDate(2025, 7, 28)).assertEqual('2025728');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0168 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_ONE_7000
     * @tc.name      testConcatDate0169
     * @tc.desc      Verify date composition 2025-7-29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0169 begin');
      expect(util.concatDate(2025, 7, 29)).assertEqual('2025729');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0169 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_ONE_7100
     * @tc.name      testConcatDate0170
     * @tc.desc      Verify date composition 2025-7-30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0170 begin');
      expect(util.concatDate(2025, 7, 30)).assertEqual('2025730');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0170 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_ONE_7200
     * @tc.name      testConcatDate0171
     * @tc.desc      Verify date composition 2025-7-31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0171 begin');
      expect(util.concatDate(2025, 7, 31)).assertEqual('2025731');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0171 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_ONE_7300
     * @tc.name      testConcatDate0172
     * @tc.desc      Verify date composition 2025-8-10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0172 begin');
      expect(util.concatDate(2025, 8, 10)).assertEqual('2025810');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0172 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_ONE_7400
     * @tc.name      testConcatDate0173
     * @tc.desc      Verify date composition 2025-8-11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0173 begin');
      expect(util.concatDate(2025, 8, 11)).assertEqual('2025811');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0173 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_ONE_7500
     * @tc.name      testConcatDate0174
     * @tc.desc      Verify date composition 2025-8-15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0174 begin');
      expect(util.concatDate(2025, 8, 15)).assertEqual('2025815');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0174 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_ONE_7600
     * @tc.name      testConcatDate0175
     * @tc.desc      Verify date composition 2025-8-20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0175 begin');
      expect(util.concatDate(2025, 8, 20)).assertEqual('2025820');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0175 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_ONE_7700
     * @tc.name      testConcatDate0176
     * @tc.desc      Verify date composition 2025-8-25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0176 begin');
      expect(util.concatDate(2025, 8, 25)).assertEqual('2025825');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0176 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_ONE_7800
     * @tc.name      testConcatDate0177
     * @tc.desc      Verify date composition 2025-8-28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0177 begin');
      expect(util.concatDate(2025, 8, 28)).assertEqual('2025828');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0177 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_ONE_7900
     * @tc.name      testConcatDate0178
     * @tc.desc      Verify date composition 2025-8-29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0178 begin');
      expect(util.concatDate(2025, 8, 29)).assertEqual('2025829');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0178 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_ONE_8000
     * @tc.name      testConcatDate0179
     * @tc.desc      Verify date composition 2025-8-30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0179 begin');
      expect(util.concatDate(2025, 8, 30)).assertEqual('2025830');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0179 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP2_ONE_8100
     * @tc.name      testConcatDate0180
     * @tc.desc      Verify date composition 2025-8-31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0180 begin');
      expect(util.concatDate(2025, 8, 31)).assertEqual('2025831');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0180 end');
    })

  })
}
