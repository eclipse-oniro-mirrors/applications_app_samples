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

export default function DateTimeFillMatrixPart2Test(): void {
  describe('DateTimeFillMatrixPart2', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })


    /**
     * @tc.number    SUB_AVREC_DTFILLP2_9100
     * @tc.name      testFill0091
     * @tc.desc      Verify validate fill value 90.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0091 begin');
      expect(util.fill(90)).assertEqual('90');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0091 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_9200
     * @tc.name      testFill0092
     * @tc.desc      Verify validate fill value 91.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0092 begin');
      expect(util.fill(91)).assertEqual('91');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0092 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_9300
     * @tc.name      testFill0093
     * @tc.desc      Verify validate fill value 92.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0093 begin');
      expect(util.fill(92)).assertEqual('92');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0093 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_9400
     * @tc.name      testFill0094
     * @tc.desc      Verify validate fill value 93.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0094 begin');
      expect(util.fill(93)).assertEqual('93');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0094 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_9500
     * @tc.name      testFill0095
     * @tc.desc      Verify validate fill value 94.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0095 begin');
      expect(util.fill(94)).assertEqual('94');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0095 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_9600
     * @tc.name      testFill0096
     * @tc.desc      Verify validate fill value 95.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0096 begin');
      expect(util.fill(95)).assertEqual('95');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0096 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_9700
     * @tc.name      testFill0097
     * @tc.desc      Verify validate fill value 96.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0097 begin');
      expect(util.fill(96)).assertEqual('96');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0097 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_9800
     * @tc.name      testFill0098
     * @tc.desc      Verify validate fill value 97.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0098 begin');
      expect(util.fill(97)).assertEqual('97');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0098 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_9900
     * @tc.name      testFill0099
     * @tc.desc      Verify validate fill value 98.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0099 begin');
      expect(util.fill(98)).assertEqual('98');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0099 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_ONE_0100
     * @tc.name      testFill0100
     * @tc.desc      Verify validate fill value 99.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0100 begin');
      expect(util.fill(99)).assertEqual('99');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0100 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_ONE_0200
     * @tc.name      testFill0101
     * @tc.desc      Verify validate fill value 100.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0101 begin');
      expect(util.fill(100)).assertEqual('100');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0101 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_ONE_0300
     * @tc.name      testFill0102
     * @tc.desc      Verify validate fill value 101.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0102 begin');
      expect(util.fill(101)).assertEqual('101');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0102 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_ONE_0400
     * @tc.name      testFill0103
     * @tc.desc      Verify validate fill value 102.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0103 begin');
      expect(util.fill(102)).assertEqual('102');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0103 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_ONE_0500
     * @tc.name      testFill0104
     * @tc.desc      Verify validate fill value 103.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0104 begin');
      expect(util.fill(103)).assertEqual('103');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0104 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_ONE_0600
     * @tc.name      testFill0105
     * @tc.desc      Verify validate fill value 104.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0105 begin');
      expect(util.fill(104)).assertEqual('104');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0105 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_ONE_0700
     * @tc.name      testFill0106
     * @tc.desc      Verify validate fill value 105.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0106 begin');
      expect(util.fill(105)).assertEqual('105');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0106 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_ONE_0800
     * @tc.name      testFill0107
     * @tc.desc      Verify validate fill value 106.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0107 begin');
      expect(util.fill(106)).assertEqual('106');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0107 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_ONE_0900
     * @tc.name      testFill0108
     * @tc.desc      Verify validate fill value 107.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0108 begin');
      expect(util.fill(107)).assertEqual('107');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0108 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_ONE_1000
     * @tc.name      testFill0109
     * @tc.desc      Verify validate fill value 108.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0109 begin');
      expect(util.fill(108)).assertEqual('108');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0109 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_ONE_1100
     * @tc.name      testFill0110
     * @tc.desc      Verify validate fill value 109.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0110 begin');
      expect(util.fill(109)).assertEqual('109');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0110 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_ONE_1200
     * @tc.name      testFill0111
     * @tc.desc      Verify validate fill value 110.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0111 begin');
      expect(util.fill(110)).assertEqual('110');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0111 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_ONE_1300
     * @tc.name      testFill0112
     * @tc.desc      Verify validate fill value 111.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0112 begin');
      expect(util.fill(111)).assertEqual('111');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0112 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_ONE_1400
     * @tc.name      testFill0113
     * @tc.desc      Verify validate fill value 112.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0113 begin');
      expect(util.fill(112)).assertEqual('112');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0113 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_ONE_1500
     * @tc.name      testFill0114
     * @tc.desc      Verify validate fill value 113.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0114 begin');
      expect(util.fill(113)).assertEqual('113');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0114 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_ONE_1600
     * @tc.name      testFill0115
     * @tc.desc      Verify validate fill value 114.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0115 begin');
      expect(util.fill(114)).assertEqual('114');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0115 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_ONE_1700
     * @tc.name      testFill0116
     * @tc.desc      Verify validate fill value 115.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0116 begin');
      expect(util.fill(115)).assertEqual('115');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0116 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_ONE_1800
     * @tc.name      testFill0117
     * @tc.desc      Verify validate fill value 116.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0117 begin');
      expect(util.fill(116)).assertEqual('116');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0117 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_ONE_1900
     * @tc.name      testFill0118
     * @tc.desc      Verify validate fill value 117.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0118 begin');
      expect(util.fill(117)).assertEqual('117');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0118 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_ONE_2000
     * @tc.name      testFill0119
     * @tc.desc      Verify validate fill value 118.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0119 begin');
      expect(util.fill(118)).assertEqual('118');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0119 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_ONE_2100
     * @tc.name      testFill0120
     * @tc.desc      Verify validate fill value 119.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0120 begin');
      expect(util.fill(119)).assertEqual('119');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0120 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_ONE_2200
     * @tc.name      testFill0121
     * @tc.desc      Verify validate fill value 120.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0121 begin');
      expect(util.fill(120)).assertEqual('120');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0121 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_ONE_2300
     * @tc.name      testFill0122
     * @tc.desc      Verify validate fill value 121.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0122 begin');
      expect(util.fill(121)).assertEqual('121');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0122 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_ONE_2400
     * @tc.name      testFill0123
     * @tc.desc      Verify validate fill value 122.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0123 begin');
      expect(util.fill(122)).assertEqual('122');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0123 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_ONE_2500
     * @tc.name      testFill0124
     * @tc.desc      Verify validate fill value 123.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0124 begin');
      expect(util.fill(123)).assertEqual('123');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0124 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_ONE_2600
     * @tc.name      testFill0125
     * @tc.desc      Verify validate fill value 124.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0125 begin');
      expect(util.fill(124)).assertEqual('124');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0125 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_ONE_2700
     * @tc.name      testFill0126
     * @tc.desc      Verify validate fill value 125.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0126 begin');
      expect(util.fill(125)).assertEqual('125');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0126 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_ONE_2800
     * @tc.name      testFill0127
     * @tc.desc      Verify validate fill value 126.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0127 begin');
      expect(util.fill(126)).assertEqual('126');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0127 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_ONE_2900
     * @tc.name      testFill0128
     * @tc.desc      Verify validate fill value 127.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0128 begin');
      expect(util.fill(127)).assertEqual('127');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0128 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_ONE_3000
     * @tc.name      testFill0129
     * @tc.desc      Verify validate fill value 128.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0129 begin');
      expect(util.fill(128)).assertEqual('128');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0129 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_ONE_3100
     * @tc.name      testFill0130
     * @tc.desc      Verify validate fill value 129.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0130 begin');
      expect(util.fill(129)).assertEqual('129');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0130 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_ONE_3200
     * @tc.name      testFill0131
     * @tc.desc      Verify validate fill value 130.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0131 begin');
      expect(util.fill(130)).assertEqual('130');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0131 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_ONE_3300
     * @tc.name      testFill0132
     * @tc.desc      Verify validate fill value 131.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0132 begin');
      expect(util.fill(131)).assertEqual('131');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0132 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_ONE_3400
     * @tc.name      testFill0133
     * @tc.desc      Verify validate fill value 132.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0133 begin');
      expect(util.fill(132)).assertEqual('132');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0133 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_ONE_3500
     * @tc.name      testFill0134
     * @tc.desc      Verify validate fill value 133.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0134 begin');
      expect(util.fill(133)).assertEqual('133');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0134 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_ONE_3600
     * @tc.name      testFill0135
     * @tc.desc      Verify validate fill value 134.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0135 begin');
      expect(util.fill(134)).assertEqual('134');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0135 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_ONE_3700
     * @tc.name      testFill0136
     * @tc.desc      Verify validate fill value 135.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0136 begin');
      expect(util.fill(135)).assertEqual('135');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0136 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_ONE_3800
     * @tc.name      testFill0137
     * @tc.desc      Verify validate fill value 136.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0137 begin');
      expect(util.fill(136)).assertEqual('136');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0137 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_ONE_3900
     * @tc.name      testFill0138
     * @tc.desc      Verify validate fill value 137.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0138 begin');
      expect(util.fill(137)).assertEqual('137');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0138 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_ONE_4000
     * @tc.name      testFill0139
     * @tc.desc      Verify validate fill value 138.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0139 begin');
      expect(util.fill(138)).assertEqual('138');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0139 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_ONE_4100
     * @tc.name      testFill0140
     * @tc.desc      Verify validate fill value 139.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0140 begin');
      expect(util.fill(139)).assertEqual('139');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0140 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_ONE_4200
     * @tc.name      testFill0141
     * @tc.desc      Verify validate fill value 140.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0141 begin');
      expect(util.fill(140)).assertEqual('140');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0141 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_ONE_4300
     * @tc.name      testFill0142
     * @tc.desc      Verify validate fill value 141.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0142 begin');
      expect(util.fill(141)).assertEqual('141');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0142 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_ONE_4400
     * @tc.name      testFill0143
     * @tc.desc      Verify validate fill value 142.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0143 begin');
      expect(util.fill(142)).assertEqual('142');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0143 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_ONE_4500
     * @tc.name      testFill0144
     * @tc.desc      Verify validate fill value 143.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0144 begin');
      expect(util.fill(143)).assertEqual('143');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0144 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_ONE_4600
     * @tc.name      testFill0145
     * @tc.desc      Verify validate fill value 144.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0145 begin');
      expect(util.fill(144)).assertEqual('144');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0145 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_ONE_4700
     * @tc.name      testFill0146
     * @tc.desc      Verify validate fill value 145.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0146 begin');
      expect(util.fill(145)).assertEqual('145');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0146 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_ONE_4800
     * @tc.name      testFill0147
     * @tc.desc      Verify validate fill value 146.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0147 begin');
      expect(util.fill(146)).assertEqual('146');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0147 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_ONE_4900
     * @tc.name      testFill0148
     * @tc.desc      Verify validate fill value 147.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0148 begin');
      expect(util.fill(147)).assertEqual('147');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0148 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_ONE_5000
     * @tc.name      testFill0149
     * @tc.desc      Verify validate fill value 148.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0149 begin');
      expect(util.fill(148)).assertEqual('148');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0149 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_ONE_5100
     * @tc.name      testFill0150
     * @tc.desc      Verify validate fill value 149.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0150 begin');
      expect(util.fill(149)).assertEqual('149');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0150 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_ONE_5200
     * @tc.name      testFill0151
     * @tc.desc      Verify validate fill value 150.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0151 begin');
      expect(util.fill(150)).assertEqual('150');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0151 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_ONE_5300
     * @tc.name      testFill0152
     * @tc.desc      Verify validate fill value 151.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0152 begin');
      expect(util.fill(151)).assertEqual('151');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0152 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_ONE_5400
     * @tc.name      testFill0153
     * @tc.desc      Verify validate fill value 152.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0153 begin');
      expect(util.fill(152)).assertEqual('152');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0153 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_ONE_5500
     * @tc.name      testFill0154
     * @tc.desc      Verify validate fill value 153.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0154 begin');
      expect(util.fill(153)).assertEqual('153');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0154 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_ONE_5600
     * @tc.name      testFill0155
     * @tc.desc      Verify validate fill value 154.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0155 begin');
      expect(util.fill(154)).assertEqual('154');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0155 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_ONE_5700
     * @tc.name      testFill0156
     * @tc.desc      Verify validate fill value 155.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0156 begin');
      expect(util.fill(155)).assertEqual('155');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0156 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_ONE_5800
     * @tc.name      testFill0157
     * @tc.desc      Verify validate fill value 156.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0157 begin');
      expect(util.fill(156)).assertEqual('156');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0157 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_ONE_5900
     * @tc.name      testFill0158
     * @tc.desc      Verify validate fill value 157.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0158 begin');
      expect(util.fill(157)).assertEqual('157');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0158 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_ONE_6000
     * @tc.name      testFill0159
     * @tc.desc      Verify validate fill value 158.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0159 begin');
      expect(util.fill(158)).assertEqual('158');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0159 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_ONE_6100
     * @tc.name      testFill0160
     * @tc.desc      Verify validate fill value 159.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0160 begin');
      expect(util.fill(159)).assertEqual('159');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0160 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_ONE_6200
     * @tc.name      testFill0161
     * @tc.desc      Verify validate fill value 160.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0161 begin');
      expect(util.fill(160)).assertEqual('160');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0161 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_ONE_6300
     * @tc.name      testFill0162
     * @tc.desc      Verify validate fill value 161.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0162 begin');
      expect(util.fill(161)).assertEqual('161');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0162 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_ONE_6400
     * @tc.name      testFill0163
     * @tc.desc      Verify validate fill value 162.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0163 begin');
      expect(util.fill(162)).assertEqual('162');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0163 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_ONE_6500
     * @tc.name      testFill0164
     * @tc.desc      Verify validate fill value 163.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0164 begin');
      expect(util.fill(163)).assertEqual('163');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0164 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_ONE_6600
     * @tc.name      testFill0165
     * @tc.desc      Verify validate fill value 164.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0165 begin');
      expect(util.fill(164)).assertEqual('164');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0165 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_ONE_6700
     * @tc.name      testFill0166
     * @tc.desc      Verify validate fill value 165.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0166 begin');
      expect(util.fill(165)).assertEqual('165');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0166 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_ONE_6800
     * @tc.name      testFill0167
     * @tc.desc      Verify validate fill value 166.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0167 begin');
      expect(util.fill(166)).assertEqual('166');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0167 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_ONE_6900
     * @tc.name      testFill0168
     * @tc.desc      Verify validate fill value 167.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0168 begin');
      expect(util.fill(167)).assertEqual('167');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0168 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_ONE_7000
     * @tc.name      testFill0169
     * @tc.desc      Verify validate fill value 168.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0169 begin');
      expect(util.fill(168)).assertEqual('168');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0169 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_ONE_7100
     * @tc.name      testFill0170
     * @tc.desc      Verify validate fill value 169.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0170 begin');
      expect(util.fill(169)).assertEqual('169');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0170 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_ONE_7200
     * @tc.name      testFill0171
     * @tc.desc      Verify validate fill value 170.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0171 begin');
      expect(util.fill(170)).assertEqual('170');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0171 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_ONE_7300
     * @tc.name      testFill0172
     * @tc.desc      Verify validate fill value 171.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0172 begin');
      expect(util.fill(171)).assertEqual('171');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0172 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_ONE_7400
     * @tc.name      testFill0173
     * @tc.desc      Verify validate fill value 172.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0173 begin');
      expect(util.fill(172)).assertEqual('172');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0173 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_ONE_7500
     * @tc.name      testFill0174
     * @tc.desc      Verify validate fill value 173.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0174 begin');
      expect(util.fill(173)).assertEqual('173');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0174 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_ONE_7600
     * @tc.name      testFill0175
     * @tc.desc      Verify validate fill value 174.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0175 begin');
      expect(util.fill(174)).assertEqual('174');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0175 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_ONE_7700
     * @tc.name      testFill0176
     * @tc.desc      Verify validate fill value 175.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0176 begin');
      expect(util.fill(175)).assertEqual('175');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0176 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_ONE_7800
     * @tc.name      testFill0177
     * @tc.desc      Verify validate fill value 176.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0177 begin');
      expect(util.fill(176)).assertEqual('176');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0177 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_ONE_7900
     * @tc.name      testFill0178
     * @tc.desc      Verify validate fill value 177.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0178 begin');
      expect(util.fill(177)).assertEqual('177');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0178 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_ONE_8000
     * @tc.name      testFill0179
     * @tc.desc      Verify validate fill value 178.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0179 begin');
      expect(util.fill(178)).assertEqual('178');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0179 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP2_ONE_8100
     * @tc.name      testFill0180
     * @tc.desc      Verify validate fill value 179.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0180 begin');
      expect(util.fill(179)).assertEqual('179');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0180 end');
    })

  })
}
