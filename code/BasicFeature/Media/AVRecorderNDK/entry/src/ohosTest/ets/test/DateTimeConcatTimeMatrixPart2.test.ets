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
import DateTimeUtil, { dateTime } from '../../../main/ets/utils/DateTimeUtil';

const util: DateTimeUtil = new DateTimeUtil();

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AVRecorder]';

export default function DateTimeConcatTimeMatrixPart2Test(): void {
  describe('DateTimeConcatTimeMatrixPart2', () => {

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_9100
     * @tc.name      testConcatTime0091
     * @tc.desc      Verify time composition 0:12:59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0091 begin');
      expect(util.concatTime(0, 12, 59)).assertEqual('001259');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0091 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_9200
     * @tc.name      testConcatTime0092
     * @tc.desc      Verify time composition 0:13:0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0092 begin');
      expect(util.concatTime(0, 13, 0)).assertEqual('001300');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0092 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_9300
     * @tc.name      testConcatTime0093
     * @tc.desc      Verify time composition 0:13:1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0093 begin');
      expect(util.concatTime(0, 13, 1)).assertEqual('001301');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0093 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_9400
     * @tc.name      testConcatTime0094
     * @tc.desc      Verify time composition 0:13:5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0094 begin');
      expect(util.concatTime(0, 13, 5)).assertEqual('001305');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0094 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_9500
     * @tc.name      testConcatTime0095
     * @tc.desc      Verify time composition 0:13:9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0095 begin');
      expect(util.concatTime(0, 13, 9)).assertEqual('001309');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0095 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_9600
     * @tc.name      testConcatTime0096
     * @tc.desc      Verify time composition 0:13:10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0096 begin');
      expect(util.concatTime(0, 13, 10)).assertEqual('001310');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0096 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_9700
     * @tc.name      testConcatTime0097
     * @tc.desc      Verify time composition 0:13:30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0097 begin');
      expect(util.concatTime(0, 13, 30)).assertEqual('001330');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0097 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_9800
     * @tc.name      testConcatTime0098
     * @tc.desc      Verify time composition 0:13:59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0098 begin');
      expect(util.concatTime(0, 13, 59)).assertEqual('001359');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0098 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_9900
     * @tc.name      testConcatTime0099
     * @tc.desc      Verify time composition 0:14:0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0099 begin');
      expect(util.concatTime(0, 14, 0)).assertEqual('001400');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0099 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_10000
     * @tc.name      testConcatTime0100
     * @tc.desc      Verify time composition 0:14:1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0100 begin');
      expect(util.concatTime(0, 14, 1)).assertEqual('001401');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0100 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_10100
     * @tc.name      testConcatTime0101
     * @tc.desc      Verify time composition 0:14:5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0101 begin');
      expect(util.concatTime(0, 14, 5)).assertEqual('001405');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0101 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_10200
     * @tc.name      testConcatTime0102
     * @tc.desc      Verify time composition 0:14:9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0102 begin');
      expect(util.concatTime(0, 14, 9)).assertEqual('001409');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0102 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_10300
     * @tc.name      testConcatTime0103
     * @tc.desc      Verify time composition 0:14:10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0103 begin');
      expect(util.concatTime(0, 14, 10)).assertEqual('001410');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0103 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_10400
     * @tc.name      testConcatTime0104
     * @tc.desc      Verify time composition 0:14:30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0104 begin');
      expect(util.concatTime(0, 14, 30)).assertEqual('001430');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0104 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_10500
     * @tc.name      testConcatTime0105
     * @tc.desc      Verify time composition 0:14:59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0105 begin');
      expect(util.concatTime(0, 14, 59)).assertEqual('001459');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0105 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_10600
     * @tc.name      testConcatTime0106
     * @tc.desc      Verify time composition 0:15:0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0106 begin');
      expect(util.concatTime(0, 15, 0)).assertEqual('001500');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0106 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_10700
     * @tc.name      testConcatTime0107
     * @tc.desc      Verify time composition 0:15:1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0107 begin');
      expect(util.concatTime(0, 15, 1)).assertEqual('001501');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0107 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_10800
     * @tc.name      testConcatTime0108
     * @tc.desc      Verify time composition 0:15:5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0108 begin');
      expect(util.concatTime(0, 15, 5)).assertEqual('001505');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0108 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_10900
     * @tc.name      testConcatTime0109
     * @tc.desc      Verify time composition 0:15:9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0109 begin');
      expect(util.concatTime(0, 15, 9)).assertEqual('001509');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0109 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_11000
     * @tc.name      testConcatTime0110
     * @tc.desc      Verify time composition 0:15:10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0110 begin');
      expect(util.concatTime(0, 15, 10)).assertEqual('001510');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0110 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_11100
     * @tc.name      testConcatTime0111
     * @tc.desc      Verify time composition 0:15:30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0111 begin');
      expect(util.concatTime(0, 15, 30)).assertEqual('001530');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0111 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_11200
     * @tc.name      testConcatTime0112
     * @tc.desc      Verify time composition 0:15:59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0112 begin');
      expect(util.concatTime(0, 15, 59)).assertEqual('001559');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0112 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_11300
     * @tc.name      testConcatTime0113
     * @tc.desc      Verify time composition 0:16:0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0113 begin');
      expect(util.concatTime(0, 16, 0)).assertEqual('001600');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0113 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_11400
     * @tc.name      testConcatTime0114
     * @tc.desc      Verify time composition 0:16:1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0114 begin');
      expect(util.concatTime(0, 16, 1)).assertEqual('001601');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0114 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_11500
     * @tc.name      testConcatTime0115
     * @tc.desc      Verify time composition 0:16:5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0115 begin');
      expect(util.concatTime(0, 16, 5)).assertEqual('001605');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0115 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_11600
     * @tc.name      testConcatTime0116
     * @tc.desc      Verify time composition 0:16:9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0116 begin');
      expect(util.concatTime(0, 16, 9)).assertEqual('001609');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0116 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_11700
     * @tc.name      testConcatTime0117
     * @tc.desc      Verify time composition 0:16:10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0117 begin');
      expect(util.concatTime(0, 16, 10)).assertEqual('001610');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0117 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_11800
     * @tc.name      testConcatTime0118
     * @tc.desc      Verify time composition 0:16:30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0118 begin');
      expect(util.concatTime(0, 16, 30)).assertEqual('001630');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0118 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_11900
     * @tc.name      testConcatTime0119
     * @tc.desc      Verify time composition 0:16:59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0119 begin');
      expect(util.concatTime(0, 16, 59)).assertEqual('001659');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0119 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_12000
     * @tc.name      testConcatTime0120
     * @tc.desc      Verify time composition 0:17:0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0120 begin');
      expect(util.concatTime(0, 17, 0)).assertEqual('001700');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0120 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_12100
     * @tc.name      testConcatTime0121
     * @tc.desc      Verify time composition 0:17:1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0121 begin');
      expect(util.concatTime(0, 17, 1)).assertEqual('001701');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0121 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_12200
     * @tc.name      testConcatTime0122
     * @tc.desc      Verify time composition 0:17:5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0122 begin');
      expect(util.concatTime(0, 17, 5)).assertEqual('001705');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0122 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_12300
     * @tc.name      testConcatTime0123
     * @tc.desc      Verify time composition 0:17:9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0123 begin');
      expect(util.concatTime(0, 17, 9)).assertEqual('001709');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0123 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_12400
     * @tc.name      testConcatTime0124
     * @tc.desc      Verify time composition 0:17:10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0124 begin');
      expect(util.concatTime(0, 17, 10)).assertEqual('001710');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0124 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_12500
     * @tc.name      testConcatTime0125
     * @tc.desc      Verify time composition 0:17:30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0125 begin');
      expect(util.concatTime(0, 17, 30)).assertEqual('001730');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0125 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_12600
     * @tc.name      testConcatTime0126
     * @tc.desc      Verify time composition 0:17:59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0126 begin');
      expect(util.concatTime(0, 17, 59)).assertEqual('001759');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0126 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_12700
     * @tc.name      testConcatTime0127
     * @tc.desc      Verify time composition 0:18:0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0127 begin');
      expect(util.concatTime(0, 18, 0)).assertEqual('001800');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0127 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_12800
     * @tc.name      testConcatTime0128
     * @tc.desc      Verify time composition 0:18:1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0128 begin');
      expect(util.concatTime(0, 18, 1)).assertEqual('001801');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0128 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_12900
     * @tc.name      testConcatTime0129
     * @tc.desc      Verify time composition 0:18:5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0129 begin');
      expect(util.concatTime(0, 18, 5)).assertEqual('001805');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0129 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_13000
     * @tc.name      testConcatTime0130
     * @tc.desc      Verify time composition 0:18:9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0130 begin');
      expect(util.concatTime(0, 18, 9)).assertEqual('001809');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0130 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_13100
     * @tc.name      testConcatTime0131
     * @tc.desc      Verify time composition 0:18:10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0131 begin');
      expect(util.concatTime(0, 18, 10)).assertEqual('001810');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0131 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_13200
     * @tc.name      testConcatTime0132
     * @tc.desc      Verify time composition 0:18:30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0132 begin');
      expect(util.concatTime(0, 18, 30)).assertEqual('001830');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0132 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_13300
     * @tc.name      testConcatTime0133
     * @tc.desc      Verify time composition 0:18:59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0133 begin');
      expect(util.concatTime(0, 18, 59)).assertEqual('001859');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0133 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_13400
     * @tc.name      testConcatTime0134
     * @tc.desc      Verify time composition 0:19:0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0134 begin');
      expect(util.concatTime(0, 19, 0)).assertEqual('001900');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0134 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_13500
     * @tc.name      testConcatTime0135
     * @tc.desc      Verify time composition 0:19:1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0135 begin');
      expect(util.concatTime(0, 19, 1)).assertEqual('001901');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0135 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_13600
     * @tc.name      testConcatTime0136
     * @tc.desc      Verify time composition 0:19:5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0136 begin');
      expect(util.concatTime(0, 19, 5)).assertEqual('001905');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0136 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_13700
     * @tc.name      testConcatTime0137
     * @tc.desc      Verify time composition 0:19:9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0137 begin');
      expect(util.concatTime(0, 19, 9)).assertEqual('001909');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0137 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_13800
     * @tc.name      testConcatTime0138
     * @tc.desc      Verify time composition 0:19:10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0138 begin');
      expect(util.concatTime(0, 19, 10)).assertEqual('001910');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0138 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_13900
     * @tc.name      testConcatTime0139
     * @tc.desc      Verify time composition 0:19:30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0139 begin');
      expect(util.concatTime(0, 19, 30)).assertEqual('001930');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0139 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_14000
     * @tc.name      testConcatTime0140
     * @tc.desc      Verify time composition 0:19:59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0140 begin');
      expect(util.concatTime(0, 19, 59)).assertEqual('001959');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0140 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_14100
     * @tc.name      testConcatTime0141
     * @tc.desc      Verify time composition 0:20:0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0141 begin');
      expect(util.concatTime(0, 20, 0)).assertEqual('002000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0141 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_14200
     * @tc.name      testConcatTime0142
     * @tc.desc      Verify time composition 0:20:1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0142 begin');
      expect(util.concatTime(0, 20, 1)).assertEqual('002001');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0142 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_14300
     * @tc.name      testConcatTime0143
     * @tc.desc      Verify time composition 0:20:5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0143 begin');
      expect(util.concatTime(0, 20, 5)).assertEqual('002005');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0143 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_14400
     * @tc.name      testConcatTime0144
     * @tc.desc      Verify time composition 0:20:9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0144 begin');
      expect(util.concatTime(0, 20, 9)).assertEqual('002009');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0144 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_14500
     * @tc.name      testConcatTime0145
     * @tc.desc      Verify time composition 0:20:10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0145 begin');
      expect(util.concatTime(0, 20, 10)).assertEqual('002010');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0145 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_14600
     * @tc.name      testConcatTime0146
     * @tc.desc      Verify time composition 0:20:30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0146 begin');
      expect(util.concatTime(0, 20, 30)).assertEqual('002030');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0146 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_14700
     * @tc.name      testConcatTime0147
     * @tc.desc      Verify time composition 0:20:59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0147 begin');
      expect(util.concatTime(0, 20, 59)).assertEqual('002059');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0147 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_14800
     * @tc.name      testConcatTime0148
     * @tc.desc      Verify time composition 0:21:0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0148 begin');
      expect(util.concatTime(0, 21, 0)).assertEqual('002100');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0148 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_14900
     * @tc.name      testConcatTime0149
     * @tc.desc      Verify time composition 0:21:1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0149 begin');
      expect(util.concatTime(0, 21, 1)).assertEqual('002101');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0149 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_15000
     * @tc.name      testConcatTime0150
     * @tc.desc      Verify time composition 0:21:5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0150 begin');
      expect(util.concatTime(0, 21, 5)).assertEqual('002105');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0150 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_15100
     * @tc.name      testConcatTime0151
     * @tc.desc      Verify time composition 0:21:9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0151 begin');
      expect(util.concatTime(0, 21, 9)).assertEqual('002109');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0151 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_15200
     * @tc.name      testConcatTime0152
     * @tc.desc      Verify time composition 0:21:10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0152 begin');
      expect(util.concatTime(0, 21, 10)).assertEqual('002110');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0152 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_15300
     * @tc.name      testConcatTime0153
     * @tc.desc      Verify time composition 0:21:30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0153 begin');
      expect(util.concatTime(0, 21, 30)).assertEqual('002130');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0153 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_15400
     * @tc.name      testConcatTime0154
     * @tc.desc      Verify time composition 0:21:59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0154 begin');
      expect(util.concatTime(0, 21, 59)).assertEqual('002159');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0154 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_15500
     * @tc.name      testConcatTime0155
     * @tc.desc      Verify time composition 0:22:0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0155 begin');
      expect(util.concatTime(0, 22, 0)).assertEqual('002200');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0155 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_15600
     * @tc.name      testConcatTime0156
     * @tc.desc      Verify time composition 0:22:1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0156 begin');
      expect(util.concatTime(0, 22, 1)).assertEqual('002201');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0156 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_15700
     * @tc.name      testConcatTime0157
     * @tc.desc      Verify time composition 0:22:5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0157 begin');
      expect(util.concatTime(0, 22, 5)).assertEqual('002205');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0157 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_15800
     * @tc.name      testConcatTime0158
     * @tc.desc      Verify time composition 0:22:9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0158 begin');
      expect(util.concatTime(0, 22, 9)).assertEqual('002209');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0158 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_15900
     * @tc.name      testConcatTime0159
     * @tc.desc      Verify time composition 0:22:10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0159 begin');
      expect(util.concatTime(0, 22, 10)).assertEqual('002210');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0159 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_16000
     * @tc.name      testConcatTime0160
     * @tc.desc      Verify time composition 0:22:30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0160 begin');
      expect(util.concatTime(0, 22, 30)).assertEqual('002230');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0160 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_16100
     * @tc.name      testConcatTime0161
     * @tc.desc      Verify time composition 0:22:59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0161 begin');
      expect(util.concatTime(0, 22, 59)).assertEqual('002259');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0161 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_16200
     * @tc.name      testConcatTime0162
     * @tc.desc      Verify time composition 0:23:0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0162 begin');
      expect(util.concatTime(0, 23, 0)).assertEqual('002300');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0162 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_16300
     * @tc.name      testConcatTime0163
     * @tc.desc      Verify time composition 0:23:1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0163 begin');
      expect(util.concatTime(0, 23, 1)).assertEqual('002301');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0163 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_16400
     * @tc.name      testConcatTime0164
     * @tc.desc      Verify time composition 0:23:5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0164 begin');
      expect(util.concatTime(0, 23, 5)).assertEqual('002305');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0164 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_16500
     * @tc.name      testConcatTime0165
     * @tc.desc      Verify time composition 0:23:9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0165 begin');
      expect(util.concatTime(0, 23, 9)).assertEqual('002309');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0165 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_16600
     * @tc.name      testConcatTime0166
     * @tc.desc      Verify time composition 0:23:10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0166 begin');
      expect(util.concatTime(0, 23, 10)).assertEqual('002310');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0166 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_16700
     * @tc.name      testConcatTime0167
     * @tc.desc      Verify time composition 0:23:30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0167 begin');
      expect(util.concatTime(0, 23, 30)).assertEqual('002330');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0167 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_16800
     * @tc.name      testConcatTime0168
     * @tc.desc      Verify time composition 0:23:59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0168 begin');
      expect(util.concatTime(0, 23, 59)).assertEqual('002359');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0168 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_16900
     * @tc.name      testConcatTime0169
     * @tc.desc      Verify time composition 0:24:0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0169 begin');
      expect(util.concatTime(0, 24, 0)).assertEqual('002400');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0169 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_17000
     * @tc.name      testConcatTime0170
     * @tc.desc      Verify time composition 0:24:1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0170 begin');
      expect(util.concatTime(0, 24, 1)).assertEqual('002401');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0170 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_17100
     * @tc.name      testConcatTime0171
     * @tc.desc      Verify time composition 0:24:5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0171 begin');
      expect(util.concatTime(0, 24, 5)).assertEqual('002405');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0171 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_17200
     * @tc.name      testConcatTime0172
     * @tc.desc      Verify time composition 0:24:9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0172 begin');
      expect(util.concatTime(0, 24, 9)).assertEqual('002409');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0172 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_17300
     * @tc.name      testConcatTime0173
     * @tc.desc      Verify time composition 0:24:10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0173 begin');
      expect(util.concatTime(0, 24, 10)).assertEqual('002410');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0173 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_17400
     * @tc.name      testConcatTime0174
     * @tc.desc      Verify time composition 0:24:30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0174 begin');
      expect(util.concatTime(0, 24, 30)).assertEqual('002430');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0174 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_17500
     * @tc.name      testConcatTime0175
     * @tc.desc      Verify time composition 0:24:59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0175 begin');
      expect(util.concatTime(0, 24, 59)).assertEqual('002459');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0175 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_17600
     * @tc.name      testConcatTime0176
     * @tc.desc      Verify time composition 0:25:0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0176 begin');
      expect(util.concatTime(0, 25, 0)).assertEqual('002500');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0176 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_17700
     * @tc.name      testConcatTime0177
     * @tc.desc      Verify time composition 0:25:1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0177 begin');
      expect(util.concatTime(0, 25, 1)).assertEqual('002501');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0177 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_17800
     * @tc.name      testConcatTime0178
     * @tc.desc      Verify time composition 0:25:5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0178 begin');
      expect(util.concatTime(0, 25, 5)).assertEqual('002505');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0178 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_17900
     * @tc.name      testConcatTime0179
     * @tc.desc      Verify time composition 0:25:9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0179 begin');
      expect(util.concatTime(0, 25, 9)).assertEqual('002509');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0179 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP2_18000
     * @tc.name      testConcatTime0180
     * @tc.desc      Verify time composition 0:25:10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0180 begin');
      expect(util.concatTime(0, 25, 10)).assertEqual('002510');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0180 end');
    })

  })
}
