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

export default function DateTimeCountdownMatrixPart2Test(): void {
  describe('DateTimeCountdownMatrixPart2', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })


    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_9100
     * @tc.name      testCountdown0091
     * @tc.desc      Verify countdown text for 90 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0091 begin');
      expect(dateTime(90)).assertEqual('01:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0091 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_9200
     * @tc.name      testCountdown0092
     * @tc.desc      Verify countdown text for 91 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0092 begin');
      expect(dateTime(91)).assertEqual('01:31');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0092 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_9300
     * @tc.name      testCountdown0093
     * @tc.desc      Verify countdown text for 92 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0093 begin');
      expect(dateTime(92)).assertEqual('01:32');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0093 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_9400
     * @tc.name      testCountdown0094
     * @tc.desc      Verify countdown text for 93 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0094 begin');
      expect(dateTime(93)).assertEqual('01:33');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0094 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_9500
     * @tc.name      testCountdown0095
     * @tc.desc      Verify countdown text for 94 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0095 begin');
      expect(dateTime(94)).assertEqual('01:34');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0095 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_9600
     * @tc.name      testCountdown0096
     * @tc.desc      Verify countdown text for 95 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0096 begin');
      expect(dateTime(95)).assertEqual('01:35');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0096 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_9700
     * @tc.name      testCountdown0097
     * @tc.desc      Verify countdown text for 96 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0097 begin');
      expect(dateTime(96)).assertEqual('01:36');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0097 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_9800
     * @tc.name      testCountdown0098
     * @tc.desc      Verify countdown text for 97 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0098 begin');
      expect(dateTime(97)).assertEqual('01:37');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0098 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_9900
     * @tc.name      testCountdown0099
     * @tc.desc      Verify countdown text for 98 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0099 begin');
      expect(dateTime(98)).assertEqual('01:38');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0099 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_ONE_0100
     * @tc.name      testCountdown0100
     * @tc.desc      Verify countdown text for 99 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0100 begin');
      expect(dateTime(99)).assertEqual('01:39');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0100 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_ONE_0200
     * @tc.name      testCountdown0101
     * @tc.desc      Verify countdown text for 100 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0101 begin');
      expect(dateTime(100)).assertEqual('01:40');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0101 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_ONE_0300
     * @tc.name      testCountdown0102
     * @tc.desc      Verify countdown text for 101 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0102 begin');
      expect(dateTime(101)).assertEqual('01:41');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0102 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_ONE_0400
     * @tc.name      testCountdown0103
     * @tc.desc      Verify countdown text for 102 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0103 begin');
      expect(dateTime(102)).assertEqual('01:42');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0103 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_ONE_0500
     * @tc.name      testCountdown0104
     * @tc.desc      Verify countdown text for 103 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0104 begin');
      expect(dateTime(103)).assertEqual('01:43');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0104 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_ONE_0600
     * @tc.name      testCountdown0105
     * @tc.desc      Verify countdown text for 104 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0105 begin');
      expect(dateTime(104)).assertEqual('01:44');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0105 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_ONE_0700
     * @tc.name      testCountdown0106
     * @tc.desc      Verify countdown text for 105 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0106 begin');
      expect(dateTime(105)).assertEqual('01:45');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0106 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_ONE_0800
     * @tc.name      testCountdown0107
     * @tc.desc      Verify countdown text for 106 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0107 begin');
      expect(dateTime(106)).assertEqual('01:46');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0107 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_ONE_0900
     * @tc.name      testCountdown0108
     * @tc.desc      Verify countdown text for 107 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0108 begin');
      expect(dateTime(107)).assertEqual('01:47');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0108 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_ONE_1000
     * @tc.name      testCountdown0109
     * @tc.desc      Verify countdown text for 108 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0109 begin');
      expect(dateTime(108)).assertEqual('01:48');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0109 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_ONE_1100
     * @tc.name      testCountdown0110
     * @tc.desc      Verify countdown text for 109 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0110 begin');
      expect(dateTime(109)).assertEqual('01:49');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0110 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_ONE_1200
     * @tc.name      testCountdown0111
     * @tc.desc      Verify countdown text for 110 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0111 begin');
      expect(dateTime(110)).assertEqual('01:50');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0111 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_ONE_1300
     * @tc.name      testCountdown0112
     * @tc.desc      Verify countdown text for 111 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0112 begin');
      expect(dateTime(111)).assertEqual('01:51');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0112 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_ONE_1400
     * @tc.name      testCountdown0113
     * @tc.desc      Verify countdown text for 112 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0113 begin');
      expect(dateTime(112)).assertEqual('01:52');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0113 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_ONE_1500
     * @tc.name      testCountdown0114
     * @tc.desc      Verify countdown text for 113 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0114 begin');
      expect(dateTime(113)).assertEqual('01:53');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0114 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_ONE_1600
     * @tc.name      testCountdown0115
     * @tc.desc      Verify countdown text for 114 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0115 begin');
      expect(dateTime(114)).assertEqual('01:54');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0115 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_ONE_1700
     * @tc.name      testCountdown0116
     * @tc.desc      Verify countdown text for 115 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0116 begin');
      expect(dateTime(115)).assertEqual('01:55');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0116 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_ONE_1800
     * @tc.name      testCountdown0117
     * @tc.desc      Verify countdown text for 116 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0117 begin');
      expect(dateTime(116)).assertEqual('01:56');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0117 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_ONE_1900
     * @tc.name      testCountdown0118
     * @tc.desc      Verify countdown text for 117 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0118 begin');
      expect(dateTime(117)).assertEqual('01:57');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0118 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_ONE_2000
     * @tc.name      testCountdown0119
     * @tc.desc      Verify countdown text for 118 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0119 begin');
      expect(dateTime(118)).assertEqual('01:58');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0119 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_ONE_2100
     * @tc.name      testCountdown0120
     * @tc.desc      Verify countdown text for 119 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0120 begin');
      expect(dateTime(119)).assertEqual('01:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0120 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_ONE_2200
     * @tc.name      testCountdown0121
     * @tc.desc      Verify countdown text for 120 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0121 begin');
      expect(dateTime(120)).assertEqual('02:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0121 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_ONE_2300
     * @tc.name      testCountdown0122
     * @tc.desc      Verify countdown text for 121 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0122 begin');
      expect(dateTime(121)).assertEqual('02:01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0122 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_ONE_2400
     * @tc.name      testCountdown0123
     * @tc.desc      Verify countdown text for 122 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0123 begin');
      expect(dateTime(122)).assertEqual('02:02');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0123 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_ONE_2500
     * @tc.name      testCountdown0124
     * @tc.desc      Verify countdown text for 123 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0124 begin');
      expect(dateTime(123)).assertEqual('02:03');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0124 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_ONE_2600
     * @tc.name      testCountdown0125
     * @tc.desc      Verify countdown text for 124 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0125 begin');
      expect(dateTime(124)).assertEqual('02:04');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0125 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_ONE_2700
     * @tc.name      testCountdown0126
     * @tc.desc      Verify countdown text for 125 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0126 begin');
      expect(dateTime(125)).assertEqual('02:05');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0126 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_ONE_2800
     * @tc.name      testCountdown0127
     * @tc.desc      Verify countdown text for 126 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0127 begin');
      expect(dateTime(126)).assertEqual('02:06');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0127 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_ONE_2900
     * @tc.name      testCountdown0128
     * @tc.desc      Verify countdown text for 127 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0128 begin');
      expect(dateTime(127)).assertEqual('02:07');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0128 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_ONE_3000
     * @tc.name      testCountdown0129
     * @tc.desc      Verify countdown text for 128 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0129 begin');
      expect(dateTime(128)).assertEqual('02:08');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0129 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_ONE_3100
     * @tc.name      testCountdown0130
     * @tc.desc      Verify countdown text for 129 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0130 begin');
      expect(dateTime(129)).assertEqual('02:09');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0130 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_ONE_3200
     * @tc.name      testCountdown0131
     * @tc.desc      Verify countdown text for 130 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0131 begin');
      expect(dateTime(130)).assertEqual('02:10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0131 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_ONE_3300
     * @tc.name      testCountdown0132
     * @tc.desc      Verify countdown text for 131 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0132 begin');
      expect(dateTime(131)).assertEqual('02:11');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0132 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_ONE_3400
     * @tc.name      testCountdown0133
     * @tc.desc      Verify countdown text for 132 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0133 begin');
      expect(dateTime(132)).assertEqual('02:12');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0133 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_ONE_3500
     * @tc.name      testCountdown0134
     * @tc.desc      Verify countdown text for 133 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0134 begin');
      expect(dateTime(133)).assertEqual('02:13');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0134 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_ONE_3600
     * @tc.name      testCountdown0135
     * @tc.desc      Verify countdown text for 134 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0135 begin');
      expect(dateTime(134)).assertEqual('02:14');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0135 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_ONE_3700
     * @tc.name      testCountdown0136
     * @tc.desc      Verify countdown text for 135 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0136 begin');
      expect(dateTime(135)).assertEqual('02:15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0136 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_ONE_3800
     * @tc.name      testCountdown0137
     * @tc.desc      Verify countdown text for 136 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0137 begin');
      expect(dateTime(136)).assertEqual('02:16');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0137 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_ONE_3900
     * @tc.name      testCountdown0138
     * @tc.desc      Verify countdown text for 137 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0138 begin');
      expect(dateTime(137)).assertEqual('02:17');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0138 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_ONE_4000
     * @tc.name      testCountdown0139
     * @tc.desc      Verify countdown text for 138 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0139 begin');
      expect(dateTime(138)).assertEqual('02:18');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0139 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_ONE_4100
     * @tc.name      testCountdown0140
     * @tc.desc      Verify countdown text for 139 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0140 begin');
      expect(dateTime(139)).assertEqual('02:19');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0140 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_ONE_4200
     * @tc.name      testCountdown0141
     * @tc.desc      Verify countdown text for 140 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0141 begin');
      expect(dateTime(140)).assertEqual('02:20');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0141 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_ONE_4300
     * @tc.name      testCountdown0142
     * @tc.desc      Verify countdown text for 141 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0142 begin');
      expect(dateTime(141)).assertEqual('02:21');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0142 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_ONE_4400
     * @tc.name      testCountdown0143
     * @tc.desc      Verify countdown text for 142 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0143 begin');
      expect(dateTime(142)).assertEqual('02:22');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0143 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_ONE_4500
     * @tc.name      testCountdown0144
     * @tc.desc      Verify countdown text for 143 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0144 begin');
      expect(dateTime(143)).assertEqual('02:23');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0144 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_ONE_4600
     * @tc.name      testCountdown0145
     * @tc.desc      Verify countdown text for 144 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0145 begin');
      expect(dateTime(144)).assertEqual('02:24');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0145 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_ONE_4700
     * @tc.name      testCountdown0146
     * @tc.desc      Verify countdown text for 145 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0146 begin');
      expect(dateTime(145)).assertEqual('02:25');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0146 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_ONE_4800
     * @tc.name      testCountdown0147
     * @tc.desc      Verify countdown text for 146 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0147 begin');
      expect(dateTime(146)).assertEqual('02:26');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0147 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_ONE_4900
     * @tc.name      testCountdown0148
     * @tc.desc      Verify countdown text for 147 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0148 begin');
      expect(dateTime(147)).assertEqual('02:27');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0148 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_ONE_5000
     * @tc.name      testCountdown0149
     * @tc.desc      Verify countdown text for 148 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0149 begin');
      expect(dateTime(148)).assertEqual('02:28');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0149 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_ONE_5100
     * @tc.name      testCountdown0150
     * @tc.desc      Verify countdown text for 149 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0150 begin');
      expect(dateTime(149)).assertEqual('02:29');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0150 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_ONE_5200
     * @tc.name      testCountdown0151
     * @tc.desc      Verify countdown text for 150 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0151 begin');
      expect(dateTime(150)).assertEqual('02:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0151 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_ONE_5300
     * @tc.name      testCountdown0152
     * @tc.desc      Verify countdown text for 151 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0152 begin');
      expect(dateTime(151)).assertEqual('02:31');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0152 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_ONE_5400
     * @tc.name      testCountdown0153
     * @tc.desc      Verify countdown text for 152 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0153 begin');
      expect(dateTime(152)).assertEqual('02:32');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0153 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_ONE_5500
     * @tc.name      testCountdown0154
     * @tc.desc      Verify countdown text for 153 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0154 begin');
      expect(dateTime(153)).assertEqual('02:33');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0154 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_ONE_5600
     * @tc.name      testCountdown0155
     * @tc.desc      Verify countdown text for 154 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0155 begin');
      expect(dateTime(154)).assertEqual('02:34');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0155 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_ONE_5700
     * @tc.name      testCountdown0156
     * @tc.desc      Verify countdown text for 155 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0156 begin');
      expect(dateTime(155)).assertEqual('02:35');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0156 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_ONE_5800
     * @tc.name      testCountdown0157
     * @tc.desc      Verify countdown text for 156 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0157 begin');
      expect(dateTime(156)).assertEqual('02:36');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0157 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_ONE_5900
     * @tc.name      testCountdown0158
     * @tc.desc      Verify countdown text for 157 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0158 begin');
      expect(dateTime(157)).assertEqual('02:37');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0158 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_ONE_6000
     * @tc.name      testCountdown0159
     * @tc.desc      Verify countdown text for 158 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0159 begin');
      expect(dateTime(158)).assertEqual('02:38');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0159 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_ONE_6100
     * @tc.name      testCountdown0160
     * @tc.desc      Verify countdown text for 159 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0160 begin');
      expect(dateTime(159)).assertEqual('02:39');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0160 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_ONE_6200
     * @tc.name      testCountdown0161
     * @tc.desc      Verify countdown text for 160 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0161 begin');
      expect(dateTime(160)).assertEqual('02:40');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0161 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_ONE_6300
     * @tc.name      testCountdown0162
     * @tc.desc      Verify countdown text for 161 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0162 begin');
      expect(dateTime(161)).assertEqual('02:41');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0162 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_ONE_6400
     * @tc.name      testCountdown0163
     * @tc.desc      Verify countdown text for 162 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0163 begin');
      expect(dateTime(162)).assertEqual('02:42');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0163 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_ONE_6500
     * @tc.name      testCountdown0164
     * @tc.desc      Verify countdown text for 163 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0164 begin');
      expect(dateTime(163)).assertEqual('02:43');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0164 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_ONE_6600
     * @tc.name      testCountdown0165
     * @tc.desc      Verify countdown text for 164 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0165 begin');
      expect(dateTime(164)).assertEqual('02:44');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0165 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_ONE_6700
     * @tc.name      testCountdown0166
     * @tc.desc      Verify countdown text for 165 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0166 begin');
      expect(dateTime(165)).assertEqual('02:45');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0166 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_ONE_6800
     * @tc.name      testCountdown0167
     * @tc.desc      Verify countdown text for 166 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0167 begin');
      expect(dateTime(166)).assertEqual('02:46');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0167 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_ONE_6900
     * @tc.name      testCountdown0168
     * @tc.desc      Verify countdown text for 167 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0168 begin');
      expect(dateTime(167)).assertEqual('02:47');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0168 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_ONE_7000
     * @tc.name      testCountdown0169
     * @tc.desc      Verify countdown text for 168 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0169 begin');
      expect(dateTime(168)).assertEqual('02:48');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0169 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_ONE_7100
     * @tc.name      testCountdown0170
     * @tc.desc      Verify countdown text for 169 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0170 begin');
      expect(dateTime(169)).assertEqual('02:49');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0170 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_ONE_7200
     * @tc.name      testCountdown0171
     * @tc.desc      Verify countdown text for 170 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0171 begin');
      expect(dateTime(170)).assertEqual('02:50');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0171 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_ONE_7300
     * @tc.name      testCountdown0172
     * @tc.desc      Verify countdown text for 171 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0172 begin');
      expect(dateTime(171)).assertEqual('02:51');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0172 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_ONE_7400
     * @tc.name      testCountdown0173
     * @tc.desc      Verify countdown text for 172 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0173 begin');
      expect(dateTime(172)).assertEqual('02:52');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0173 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_ONE_7500
     * @tc.name      testCountdown0174
     * @tc.desc      Verify countdown text for 173 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0174 begin');
      expect(dateTime(173)).assertEqual('02:53');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0174 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_ONE_7600
     * @tc.name      testCountdown0175
     * @tc.desc      Verify countdown text for 174 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0175 begin');
      expect(dateTime(174)).assertEqual('02:54');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0175 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_ONE_7700
     * @tc.name      testCountdown0176
     * @tc.desc      Verify countdown text for 175 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0176 begin');
      expect(dateTime(175)).assertEqual('02:55');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0176 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_ONE_7800
     * @tc.name      testCountdown0177
     * @tc.desc      Verify countdown text for 176 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0177 begin');
      expect(dateTime(176)).assertEqual('02:56');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0177 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_ONE_7900
     * @tc.name      testCountdown0178
     * @tc.desc      Verify countdown text for 177 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0178 begin');
      expect(dateTime(177)).assertEqual('02:57');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0178 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_ONE_8000
     * @tc.name      testCountdown0179
     * @tc.desc      Verify countdown text for 178 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0179 begin');
      expect(dateTime(178)).assertEqual('02:58');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0179 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP2_ONE_8100
     * @tc.name      testCountdown0180
     * @tc.desc      Verify countdown text for 179 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0180 begin');
      expect(dateTime(179)).assertEqual('02:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0180 end');
    })

  })
}
