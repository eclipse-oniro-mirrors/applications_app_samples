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
import { MediaTools } from '../../../main/ets/common/utils/mediaUtils/MediaTools';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CapturerApplication]';

export default function MediaCountdownMatrixPart2Test(): void {
  describe('MediaCountdownMatrixPart2', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })


    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_9100
     * @tc.name      testCountdown0091
     * @tc.desc      Verify countdown text for 84000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0091 begin');
      expect(MediaTools.msToCountdownTime(84000)).assertEqual('01:24');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0091 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_9200
     * @tc.name      testCountdown0092
     * @tc.desc      Verify countdown text for 85000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0092 begin');
      expect(MediaTools.msToCountdownTime(85000)).assertEqual('01:25');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0092 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_9300
     * @tc.name      testCountdown0093
     * @tc.desc      Verify countdown text for 86000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0093 begin');
      expect(MediaTools.msToCountdownTime(86000)).assertEqual('01:26');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0093 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_9400
     * @tc.name      testCountdown0094
     * @tc.desc      Verify countdown text for 87000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0094 begin');
      expect(MediaTools.msToCountdownTime(87000)).assertEqual('01:27');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0094 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_9500
     * @tc.name      testCountdown0095
     * @tc.desc      Verify countdown text for 88000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0095 begin');
      expect(MediaTools.msToCountdownTime(88000)).assertEqual('01:28');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0095 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_9600
     * @tc.name      testCountdown0096
     * @tc.desc      Verify countdown text for 89000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0096 begin');
      expect(MediaTools.msToCountdownTime(89000)).assertEqual('01:29');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0096 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_9700
     * @tc.name      testCountdown0097
     * @tc.desc      Verify countdown text for 90000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0097 begin');
      expect(MediaTools.msToCountdownTime(90000)).assertEqual('01:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0097 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_9800
     * @tc.name      testCountdown0098
     * @tc.desc      Verify countdown text for 91000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0098 begin');
      expect(MediaTools.msToCountdownTime(91000)).assertEqual('01:31');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0098 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_9900
     * @tc.name      testCountdown0099
     * @tc.desc      Verify countdown text for 92000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0099 begin');
      expect(MediaTools.msToCountdownTime(92000)).assertEqual('01:32');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0099 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_10000
     * @tc.name      testCountdown0100
     * @tc.desc      Verify countdown text for 93000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0100 begin');
      expect(MediaTools.msToCountdownTime(93000)).assertEqual('01:33');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0100 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_10100
     * @tc.name      testCountdown0101
     * @tc.desc      Verify countdown text for 94000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0101 begin');
      expect(MediaTools.msToCountdownTime(94000)).assertEqual('01:34');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0101 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_10200
     * @tc.name      testCountdown0102
     * @tc.desc      Verify countdown text for 95000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0102 begin');
      expect(MediaTools.msToCountdownTime(95000)).assertEqual('01:35');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0102 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_10300
     * @tc.name      testCountdown0103
     * @tc.desc      Verify countdown text for 96000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0103 begin');
      expect(MediaTools.msToCountdownTime(96000)).assertEqual('01:36');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0103 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_10400
     * @tc.name      testCountdown0104
     * @tc.desc      Verify countdown text for 97000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0104 begin');
      expect(MediaTools.msToCountdownTime(97000)).assertEqual('01:37');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0104 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_10500
     * @tc.name      testCountdown0105
     * @tc.desc      Verify countdown text for 98000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0105 begin');
      expect(MediaTools.msToCountdownTime(98000)).assertEqual('01:38');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0105 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_10600
     * @tc.name      testCountdown0106
     * @tc.desc      Verify countdown text for 99000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0106 begin');
      expect(MediaTools.msToCountdownTime(99000)).assertEqual('01:39');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0106 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_10700
     * @tc.name      testCountdown0107
     * @tc.desc      Verify countdown text for 100000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0107 begin');
      expect(MediaTools.msToCountdownTime(100000)).assertEqual('01:40');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0107 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_10800
     * @tc.name      testCountdown0108
     * @tc.desc      Verify countdown text for 101000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0108 begin');
      expect(MediaTools.msToCountdownTime(101000)).assertEqual('01:41');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0108 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_10900
     * @tc.name      testCountdown0109
     * @tc.desc      Verify countdown text for 102000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0109 begin');
      expect(MediaTools.msToCountdownTime(102000)).assertEqual('01:42');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0109 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_11000
     * @tc.name      testCountdown0110
     * @tc.desc      Verify countdown text for 103000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0110 begin');
      expect(MediaTools.msToCountdownTime(103000)).assertEqual('01:43');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0110 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_11100
     * @tc.name      testCountdown0111
     * @tc.desc      Verify countdown text for 104000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0111 begin');
      expect(MediaTools.msToCountdownTime(104000)).assertEqual('01:44');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0111 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_11200
     * @tc.name      testCountdown0112
     * @tc.desc      Verify countdown text for 105000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0112 begin');
      expect(MediaTools.msToCountdownTime(105000)).assertEqual('01:45');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0112 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_11300
     * @tc.name      testCountdown0113
     * @tc.desc      Verify countdown text for 106000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0113 begin');
      expect(MediaTools.msToCountdownTime(106000)).assertEqual('01:46');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0113 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_11400
     * @tc.name      testCountdown0114
     * @tc.desc      Verify countdown text for 107000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0114 begin');
      expect(MediaTools.msToCountdownTime(107000)).assertEqual('01:47');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0114 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_11500
     * @tc.name      testCountdown0115
     * @tc.desc      Verify countdown text for 108000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0115 begin');
      expect(MediaTools.msToCountdownTime(108000)).assertEqual('01:48');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0115 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_11600
     * @tc.name      testCountdown0116
     * @tc.desc      Verify countdown text for 109000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0116 begin');
      expect(MediaTools.msToCountdownTime(109000)).assertEqual('01:49');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0116 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_11700
     * @tc.name      testCountdown0117
     * @tc.desc      Verify countdown text for 110000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0117 begin');
      expect(MediaTools.msToCountdownTime(110000)).assertEqual('01:50');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0117 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_11800
     * @tc.name      testCountdown0118
     * @tc.desc      Verify countdown text for 111000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0118 begin');
      expect(MediaTools.msToCountdownTime(111000)).assertEqual('01:51');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0118 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_11900
     * @tc.name      testCountdown0119
     * @tc.desc      Verify countdown text for 112000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0119 begin');
      expect(MediaTools.msToCountdownTime(112000)).assertEqual('01:52');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0119 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_12000
     * @tc.name      testCountdown0120
     * @tc.desc      Verify countdown text for 113000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0120 begin');
      expect(MediaTools.msToCountdownTime(113000)).assertEqual('01:53');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0120 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_12100
     * @tc.name      testCountdown0121
     * @tc.desc      Verify countdown text for 114000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0121 begin');
      expect(MediaTools.msToCountdownTime(114000)).assertEqual('01:54');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0121 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_12200
     * @tc.name      testCountdown0122
     * @tc.desc      Verify countdown text for 115000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0122 begin');
      expect(MediaTools.msToCountdownTime(115000)).assertEqual('01:55');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0122 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_12300
     * @tc.name      testCountdown0123
     * @tc.desc      Verify countdown text for 116000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0123 begin');
      expect(MediaTools.msToCountdownTime(116000)).assertEqual('01:56');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0123 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_12400
     * @tc.name      testCountdown0124
     * @tc.desc      Verify countdown text for 117000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0124 begin');
      expect(MediaTools.msToCountdownTime(117000)).assertEqual('01:57');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0124 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_12500
     * @tc.name      testCountdown0125
     * @tc.desc      Verify countdown text for 118000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0125 begin');
      expect(MediaTools.msToCountdownTime(118000)).assertEqual('01:58');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0125 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_12600
     * @tc.name      testCountdown0126
     * @tc.desc      Verify countdown text for 119000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0126 begin');
      expect(MediaTools.msToCountdownTime(119000)).assertEqual('01:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0126 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_12700
     * @tc.name      testCountdown0127
     * @tc.desc      Verify countdown text for 119999 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0127 begin');
      expect(MediaTools.msToCountdownTime(119999)).assertEqual('01:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0127 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_12800
     * @tc.name      testCountdown0128
     * @tc.desc      Verify countdown text for 120000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0128 begin');
      expect(MediaTools.msToCountdownTime(120000)).assertEqual('02:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0128 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_12900
     * @tc.name      testCountdown0129
     * @tc.desc      Verify countdown text for 121000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0129 begin');
      expect(MediaTools.msToCountdownTime(121000)).assertEqual('02:01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0129 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_13000
     * @tc.name      testCountdown0130
     * @tc.desc      Verify countdown text for 122000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0130 begin');
      expect(MediaTools.msToCountdownTime(122000)).assertEqual('02:02');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0130 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_13100
     * @tc.name      testCountdown0131
     * @tc.desc      Verify countdown text for 123000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0131 begin');
      expect(MediaTools.msToCountdownTime(123000)).assertEqual('02:03');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0131 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_13200
     * @tc.name      testCountdown0132
     * @tc.desc      Verify countdown text for 124000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0132 begin');
      expect(MediaTools.msToCountdownTime(124000)).assertEqual('02:04');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0132 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_13300
     * @tc.name      testCountdown0133
     * @tc.desc      Verify countdown text for 125000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0133 begin');
      expect(MediaTools.msToCountdownTime(125000)).assertEqual('02:05');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0133 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_13400
     * @tc.name      testCountdown0134
     * @tc.desc      Verify countdown text for 126000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0134 begin');
      expect(MediaTools.msToCountdownTime(126000)).assertEqual('02:06');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0134 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_13500
     * @tc.name      testCountdown0135
     * @tc.desc      Verify countdown text for 127000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0135 begin');
      expect(MediaTools.msToCountdownTime(127000)).assertEqual('02:07');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0135 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_13600
     * @tc.name      testCountdown0136
     * @tc.desc      Verify countdown text for 128000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0136 begin');
      expect(MediaTools.msToCountdownTime(128000)).assertEqual('02:08');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0136 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_13700
     * @tc.name      testCountdown0137
     * @tc.desc      Verify countdown text for 129000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0137 begin');
      expect(MediaTools.msToCountdownTime(129000)).assertEqual('02:09');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0137 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_13800
     * @tc.name      testCountdown0138
     * @tc.desc      Verify countdown text for 130000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0138 begin');
      expect(MediaTools.msToCountdownTime(130000)).assertEqual('02:10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0138 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_13900
     * @tc.name      testCountdown0139
     * @tc.desc      Verify countdown text for 131000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0139 begin');
      expect(MediaTools.msToCountdownTime(131000)).assertEqual('02:11');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0139 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_14000
     * @tc.name      testCountdown0140
     * @tc.desc      Verify countdown text for 132000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0140 begin');
      expect(MediaTools.msToCountdownTime(132000)).assertEqual('02:12');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0140 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_14100
     * @tc.name      testCountdown0141
     * @tc.desc      Verify countdown text for 133000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0141 begin');
      expect(MediaTools.msToCountdownTime(133000)).assertEqual('02:13');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0141 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_14200
     * @tc.name      testCountdown0142
     * @tc.desc      Verify countdown text for 134000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0142 begin');
      expect(MediaTools.msToCountdownTime(134000)).assertEqual('02:14');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0142 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_14300
     * @tc.name      testCountdown0143
     * @tc.desc      Verify countdown text for 135000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0143 begin');
      expect(MediaTools.msToCountdownTime(135000)).assertEqual('02:15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0143 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_14400
     * @tc.name      testCountdown0144
     * @tc.desc      Verify countdown text for 136000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0144 begin');
      expect(MediaTools.msToCountdownTime(136000)).assertEqual('02:16');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0144 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_14500
     * @tc.name      testCountdown0145
     * @tc.desc      Verify countdown text for 137000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0145 begin');
      expect(MediaTools.msToCountdownTime(137000)).assertEqual('02:17');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0145 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_14600
     * @tc.name      testCountdown0146
     * @tc.desc      Verify countdown text for 138000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0146 begin');
      expect(MediaTools.msToCountdownTime(138000)).assertEqual('02:18');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0146 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_14700
     * @tc.name      testCountdown0147
     * @tc.desc      Verify countdown text for 139000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0147 begin');
      expect(MediaTools.msToCountdownTime(139000)).assertEqual('02:19');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0147 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_14800
     * @tc.name      testCountdown0148
     * @tc.desc      Verify countdown text for 140000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0148 begin');
      expect(MediaTools.msToCountdownTime(140000)).assertEqual('02:20');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0148 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_14900
     * @tc.name      testCountdown0149
     * @tc.desc      Verify countdown text for 141000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0149 begin');
      expect(MediaTools.msToCountdownTime(141000)).assertEqual('02:21');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0149 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_15000
     * @tc.name      testCountdown0150
     * @tc.desc      Verify countdown text for 142000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0150 begin');
      expect(MediaTools.msToCountdownTime(142000)).assertEqual('02:22');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0150 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_15100
     * @tc.name      testCountdown0151
     * @tc.desc      Verify countdown text for 143000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0151 begin');
      expect(MediaTools.msToCountdownTime(143000)).assertEqual('02:23');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0151 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_15200
     * @tc.name      testCountdown0152
     * @tc.desc      Verify countdown text for 144000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0152 begin');
      expect(MediaTools.msToCountdownTime(144000)).assertEqual('02:24');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0152 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_15300
     * @tc.name      testCountdown0153
     * @tc.desc      Verify countdown text for 145000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0153 begin');
      expect(MediaTools.msToCountdownTime(145000)).assertEqual('02:25');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0153 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_15400
     * @tc.name      testCountdown0154
     * @tc.desc      Verify countdown text for 146000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0154 begin');
      expect(MediaTools.msToCountdownTime(146000)).assertEqual('02:26');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0154 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_15500
     * @tc.name      testCountdown0155
     * @tc.desc      Verify countdown text for 147000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0155 begin');
      expect(MediaTools.msToCountdownTime(147000)).assertEqual('02:27');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0155 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_15600
     * @tc.name      testCountdown0156
     * @tc.desc      Verify countdown text for 148000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0156 begin');
      expect(MediaTools.msToCountdownTime(148000)).assertEqual('02:28');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0156 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_15700
     * @tc.name      testCountdown0157
     * @tc.desc      Verify countdown text for 149000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0157 begin');
      expect(MediaTools.msToCountdownTime(149000)).assertEqual('02:29');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0157 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_15800
     * @tc.name      testCountdown0158
     * @tc.desc      Verify countdown text for 150000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0158 begin');
      expect(MediaTools.msToCountdownTime(150000)).assertEqual('02:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0158 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_15900
     * @tc.name      testCountdown0159
     * @tc.desc      Verify countdown text for 151000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0159 begin');
      expect(MediaTools.msToCountdownTime(151000)).assertEqual('02:31');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0159 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_16000
     * @tc.name      testCountdown0160
     * @tc.desc      Verify countdown text for 152000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0160 begin');
      expect(MediaTools.msToCountdownTime(152000)).assertEqual('02:32');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0160 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_16100
     * @tc.name      testCountdown0161
     * @tc.desc      Verify countdown text for 153000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0161 begin');
      expect(MediaTools.msToCountdownTime(153000)).assertEqual('02:33');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0161 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_16200
     * @tc.name      testCountdown0162
     * @tc.desc      Verify countdown text for 154000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0162 begin');
      expect(MediaTools.msToCountdownTime(154000)).assertEqual('02:34');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0162 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_16300
     * @tc.name      testCountdown0163
     * @tc.desc      Verify countdown text for 155000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0163 begin');
      expect(MediaTools.msToCountdownTime(155000)).assertEqual('02:35');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0163 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_16400
     * @tc.name      testCountdown0164
     * @tc.desc      Verify countdown text for 156000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0164 begin');
      expect(MediaTools.msToCountdownTime(156000)).assertEqual('02:36');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0164 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_16500
     * @tc.name      testCountdown0165
     * @tc.desc      Verify countdown text for 157000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0165 begin');
      expect(MediaTools.msToCountdownTime(157000)).assertEqual('02:37');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0165 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_16600
     * @tc.name      testCountdown0166
     * @tc.desc      Verify countdown text for 158000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0166 begin');
      expect(MediaTools.msToCountdownTime(158000)).assertEqual('02:38');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0166 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_16700
     * @tc.name      testCountdown0167
     * @tc.desc      Verify countdown text for 159000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0167 begin');
      expect(MediaTools.msToCountdownTime(159000)).assertEqual('02:39');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0167 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_16800
     * @tc.name      testCountdown0168
     * @tc.desc      Verify countdown text for 160000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0168 begin');
      expect(MediaTools.msToCountdownTime(160000)).assertEqual('02:40');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0168 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_16900
     * @tc.name      testCountdown0169
     * @tc.desc      Verify countdown text for 161000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0169 begin');
      expect(MediaTools.msToCountdownTime(161000)).assertEqual('02:41');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0169 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_17000
     * @tc.name      testCountdown0170
     * @tc.desc      Verify countdown text for 162000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0170 begin');
      expect(MediaTools.msToCountdownTime(162000)).assertEqual('02:42');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0170 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_17100
     * @tc.name      testCountdown0171
     * @tc.desc      Verify countdown text for 163000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0171 begin');
      expect(MediaTools.msToCountdownTime(163000)).assertEqual('02:43');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0171 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_17200
     * @tc.name      testCountdown0172
     * @tc.desc      Verify countdown text for 164000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0172 begin');
      expect(MediaTools.msToCountdownTime(164000)).assertEqual('02:44');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0172 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_17300
     * @tc.name      testCountdown0173
     * @tc.desc      Verify countdown text for 165000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0173 begin');
      expect(MediaTools.msToCountdownTime(165000)).assertEqual('02:45');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0173 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_17400
     * @tc.name      testCountdown0174
     * @tc.desc      Verify countdown text for 166000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0174 begin');
      expect(MediaTools.msToCountdownTime(166000)).assertEqual('02:46');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0174 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_17500
     * @tc.name      testCountdown0175
     * @tc.desc      Verify countdown text for 167000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0175 begin');
      expect(MediaTools.msToCountdownTime(167000)).assertEqual('02:47');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0175 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_17600
     * @tc.name      testCountdown0176
     * @tc.desc      Verify countdown text for 168000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0176 begin');
      expect(MediaTools.msToCountdownTime(168000)).assertEqual('02:48');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0176 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_17700
     * @tc.name      testCountdown0177
     * @tc.desc      Verify countdown text for 169000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0177 begin');
      expect(MediaTools.msToCountdownTime(169000)).assertEqual('02:49');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0177 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_17800
     * @tc.name      testCountdown0178
     * @tc.desc      Verify countdown text for 170000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0178 begin');
      expect(MediaTools.msToCountdownTime(170000)).assertEqual('02:50');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0178 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_17900
     * @tc.name      testCountdown0179
     * @tc.desc      Verify countdown text for 171000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0179 begin');
      expect(MediaTools.msToCountdownTime(171000)).assertEqual('02:51');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0179 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP2_18000
     * @tc.name      testCountdown0180
     * @tc.desc      Verify countdown text for 172000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0180 begin');
      expect(MediaTools.msToCountdownTime(172000)).assertEqual('02:52');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0180 end');
    })

  })
}
