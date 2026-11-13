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
import { MediaTools } from '../../../main/ets/common/utils/mediaUtils/MediaTools';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CapturerApplication]';

export default function MediaOffsetMatrixPart2Test(): void {
  describe('MediaOffsetMatrixPart2', () => {

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_9100
     * @tc.name      testOffset0091
     * @tc.desc      Verify offset for 90 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0091 begin');
      const actual: number = MediaTools.getOffsetFromTime(90);
      expect(Math.abs(actual - (17280.0)) <= Math.abs(17280.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0091 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_9200
     * @tc.name      testOffset0092
     * @tc.desc      Verify offset for 91 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0092 begin');
      const actual: number = MediaTools.getOffsetFromTime(91);
      expect(Math.abs(actual - (17472.0)) <= Math.abs(17472.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0092 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_9300
     * @tc.name      testOffset0093
     * @tc.desc      Verify offset for 92 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0093 begin');
      const actual: number = MediaTools.getOffsetFromTime(92);
      expect(Math.abs(actual - (17664.0)) <= Math.abs(17664.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0093 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_9400
     * @tc.name      testOffset0094
     * @tc.desc      Verify offset for 93 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0094 begin');
      const actual: number = MediaTools.getOffsetFromTime(93);
      expect(Math.abs(actual - (17856.0)) <= Math.abs(17856.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0094 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_9500
     * @tc.name      testOffset0095
     * @tc.desc      Verify offset for 94 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0095 begin');
      const actual: number = MediaTools.getOffsetFromTime(94);
      expect(Math.abs(actual - (18048.0)) <= Math.abs(18048.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0095 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_9600
     * @tc.name      testOffset0096
     * @tc.desc      Verify offset for 95 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0096 begin');
      const actual: number = MediaTools.getOffsetFromTime(95);
      expect(Math.abs(actual - (18240.0)) <= Math.abs(18240.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0096 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_9700
     * @tc.name      testOffset0097
     * @tc.desc      Verify offset for 96 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0097 begin');
      const actual: number = MediaTools.getOffsetFromTime(96);
      expect(Math.abs(actual - (18432.0)) <= Math.abs(18432.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0097 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_9800
     * @tc.name      testOffset0098
     * @tc.desc      Verify offset for 97 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0098 begin');
      const actual: number = MediaTools.getOffsetFromTime(97);
      expect(Math.abs(actual - (18624.0)) <= Math.abs(18624.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0098 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_9900
     * @tc.name      testOffset0099
     * @tc.desc      Verify offset for 98 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0099 begin');
      const actual: number = MediaTools.getOffsetFromTime(98);
      expect(Math.abs(actual - (18816.0)) <= Math.abs(18816.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0099 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_10000
     * @tc.name      testOffset0100
     * @tc.desc      Verify offset for 99 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0100 begin');
      const actual: number = MediaTools.getOffsetFromTime(99);
      expect(Math.abs(actual - (19008.0)) <= Math.abs(19008.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0100 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_10100
     * @tc.name      testOffset0101
     * @tc.desc      Verify offset for 100 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0101 begin');
      const actual: number = MediaTools.getOffsetFromTime(100);
      expect(Math.abs(actual - (19200.0)) <= Math.abs(19200.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0101 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_10200
     * @tc.name      testOffset0102
     * @tc.desc      Verify offset for 101 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0102 begin');
      const actual: number = MediaTools.getOffsetFromTime(101);
      expect(Math.abs(actual - (19392.0)) <= Math.abs(19392.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0102 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_10300
     * @tc.name      testOffset0103
     * @tc.desc      Verify offset for 102 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0103 begin');
      const actual: number = MediaTools.getOffsetFromTime(102);
      expect(Math.abs(actual - (19584.0)) <= Math.abs(19584.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0103 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_10400
     * @tc.name      testOffset0104
     * @tc.desc      Verify offset for 103 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0104 begin');
      const actual: number = MediaTools.getOffsetFromTime(103);
      expect(Math.abs(actual - (19776.0)) <= Math.abs(19776.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0104 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_10500
     * @tc.name      testOffset0105
     * @tc.desc      Verify offset for 104 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0105 begin');
      const actual: number = MediaTools.getOffsetFromTime(104);
      expect(Math.abs(actual - (19968.0)) <= Math.abs(19968.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0105 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_10600
     * @tc.name      testOffset0106
     * @tc.desc      Verify offset for 105 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0106 begin');
      const actual: number = MediaTools.getOffsetFromTime(105);
      expect(Math.abs(actual - (20160.0)) <= Math.abs(20160.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0106 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_10700
     * @tc.name      testOffset0107
     * @tc.desc      Verify offset for 106 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0107 begin');
      const actual: number = MediaTools.getOffsetFromTime(106);
      expect(Math.abs(actual - (20352.0)) <= Math.abs(20352.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0107 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_10800
     * @tc.name      testOffset0108
     * @tc.desc      Verify offset for 107 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0108 begin');
      const actual: number = MediaTools.getOffsetFromTime(107);
      expect(Math.abs(actual - (20544.0)) <= Math.abs(20544.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0108 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_10900
     * @tc.name      testOffset0109
     * @tc.desc      Verify offset for 108 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0109 begin');
      const actual: number = MediaTools.getOffsetFromTime(108);
      expect(Math.abs(actual - (20736.0)) <= Math.abs(20736.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0109 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_11000
     * @tc.name      testOffset0110
     * @tc.desc      Verify offset for 109 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0110 begin');
      const actual: number = MediaTools.getOffsetFromTime(109);
      expect(Math.abs(actual - (20928.0)) <= Math.abs(20928.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0110 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_11100
     * @tc.name      testOffset0111
     * @tc.desc      Verify offset for 110 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0111 begin');
      const actual: number = MediaTools.getOffsetFromTime(110);
      expect(Math.abs(actual - (21120.0)) <= Math.abs(21120.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0111 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_11200
     * @tc.name      testOffset0112
     * @tc.desc      Verify offset for 111 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0112 begin');
      const actual: number = MediaTools.getOffsetFromTime(111);
      expect(Math.abs(actual - (21312.0)) <= Math.abs(21312.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0112 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_11300
     * @tc.name      testOffset0113
     * @tc.desc      Verify offset for 112 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0113 begin');
      const actual: number = MediaTools.getOffsetFromTime(112);
      expect(Math.abs(actual - (21504.0)) <= Math.abs(21504.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0113 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_11400
     * @tc.name      testOffset0114
     * @tc.desc      Verify offset for 113 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0114 begin');
      const actual: number = MediaTools.getOffsetFromTime(113);
      expect(Math.abs(actual - (21696.0)) <= Math.abs(21696.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0114 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_11500
     * @tc.name      testOffset0115
     * @tc.desc      Verify offset for 114 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0115 begin');
      const actual: number = MediaTools.getOffsetFromTime(114);
      expect(Math.abs(actual - (21888.0)) <= Math.abs(21888.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0115 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_11600
     * @tc.name      testOffset0116
     * @tc.desc      Verify offset for 115 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0116 begin');
      const actual: number = MediaTools.getOffsetFromTime(115);
      expect(Math.abs(actual - (22080.0)) <= Math.abs(22080.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0116 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_11700
     * @tc.name      testOffset0117
     * @tc.desc      Verify offset for 116 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0117 begin');
      const actual: number = MediaTools.getOffsetFromTime(116);
      expect(Math.abs(actual - (22272.0)) <= Math.abs(22272.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0117 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_11800
     * @tc.name      testOffset0118
     * @tc.desc      Verify offset for 117 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0118 begin');
      const actual: number = MediaTools.getOffsetFromTime(117);
      expect(Math.abs(actual - (22464.0)) <= Math.abs(22464.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0118 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_11900
     * @tc.name      testOffset0119
     * @tc.desc      Verify offset for 118 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0119 begin');
      const actual: number = MediaTools.getOffsetFromTime(118);
      expect(Math.abs(actual - (22656.0)) <= Math.abs(22656.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0119 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_12000
     * @tc.name      testOffset0120
     * @tc.desc      Verify offset for 119 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0120 begin');
      const actual: number = MediaTools.getOffsetFromTime(119);
      expect(Math.abs(actual - (22848.0)) <= Math.abs(22848.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0120 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_12100
     * @tc.name      testOffset0121
     * @tc.desc      Verify offset for 120 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0121 begin');
      const actual: number = MediaTools.getOffsetFromTime(120);
      expect(Math.abs(actual - (23040.0)) <= Math.abs(23040.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0121 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_12200
     * @tc.name      testOffset0122
     * @tc.desc      Verify offset for 121 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0122 begin');
      const actual: number = MediaTools.getOffsetFromTime(121);
      expect(Math.abs(actual - (23232.0)) <= Math.abs(23232.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0122 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_12300
     * @tc.name      testOffset0123
     * @tc.desc      Verify offset for 122 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0123 begin');
      const actual: number = MediaTools.getOffsetFromTime(122);
      expect(Math.abs(actual - (23424.0)) <= Math.abs(23424.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0123 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_12400
     * @tc.name      testOffset0124
     * @tc.desc      Verify offset for 123 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0124 begin');
      const actual: number = MediaTools.getOffsetFromTime(123);
      expect(Math.abs(actual - (23616.0)) <= Math.abs(23616.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0124 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_12500
     * @tc.name      testOffset0125
     * @tc.desc      Verify offset for 124 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0125 begin');
      const actual: number = MediaTools.getOffsetFromTime(124);
      expect(Math.abs(actual - (23808.0)) <= Math.abs(23808.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0125 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_12600
     * @tc.name      testOffset0126
     * @tc.desc      Verify offset for 125 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0126 begin');
      const actual: number = MediaTools.getOffsetFromTime(125);
      expect(Math.abs(actual - (24000.0)) <= Math.abs(24000.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0126 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_12700
     * @tc.name      testOffset0127
     * @tc.desc      Verify offset for 126 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0127 begin');
      const actual: number = MediaTools.getOffsetFromTime(126);
      expect(Math.abs(actual - (24192.0)) <= Math.abs(24192.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0127 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_12800
     * @tc.name      testOffset0128
     * @tc.desc      Verify offset for 127 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0128 begin');
      const actual: number = MediaTools.getOffsetFromTime(127);
      expect(Math.abs(actual - (24384.0)) <= Math.abs(24384.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0128 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_12900
     * @tc.name      testOffset0129
     * @tc.desc      Verify offset for 128 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0129 begin');
      const actual: number = MediaTools.getOffsetFromTime(128);
      expect(Math.abs(actual - (24576.0)) <= Math.abs(24576.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0129 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_13000
     * @tc.name      testOffset0130
     * @tc.desc      Verify offset for 129 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0130 begin');
      const actual: number = MediaTools.getOffsetFromTime(129);
      expect(Math.abs(actual - (24768.0)) <= Math.abs(24768.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0130 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_13100
     * @tc.name      testOffset0131
     * @tc.desc      Verify offset for 130 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0131 begin');
      const actual: number = MediaTools.getOffsetFromTime(130);
      expect(Math.abs(actual - (24960.0)) <= Math.abs(24960.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0131 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_13200
     * @tc.name      testOffset0132
     * @tc.desc      Verify offset for 131 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0132 begin');
      const actual: number = MediaTools.getOffsetFromTime(131);
      expect(Math.abs(actual - (25152.0)) <= Math.abs(25152.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0132 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_13300
     * @tc.name      testOffset0133
     * @tc.desc      Verify offset for 132 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0133 begin');
      const actual: number = MediaTools.getOffsetFromTime(132);
      expect(Math.abs(actual - (25344.0)) <= Math.abs(25344.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0133 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_13400
     * @tc.name      testOffset0134
     * @tc.desc      Verify offset for 133 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0134 begin');
      const actual: number = MediaTools.getOffsetFromTime(133);
      expect(Math.abs(actual - (25536.0)) <= Math.abs(25536.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0134 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_13500
     * @tc.name      testOffset0135
     * @tc.desc      Verify offset for 134 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0135 begin');
      const actual: number = MediaTools.getOffsetFromTime(134);
      expect(Math.abs(actual - (25728.0)) <= Math.abs(25728.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0135 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_13600
     * @tc.name      testOffset0136
     * @tc.desc      Verify offset for 135 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0136 begin');
      const actual: number = MediaTools.getOffsetFromTime(135);
      expect(Math.abs(actual - (25920.0)) <= Math.abs(25920.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0136 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_13700
     * @tc.name      testOffset0137
     * @tc.desc      Verify offset for 136 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0137 begin');
      const actual: number = MediaTools.getOffsetFromTime(136);
      expect(Math.abs(actual - (26112.0)) <= Math.abs(26112.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0137 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_13800
     * @tc.name      testOffset0138
     * @tc.desc      Verify offset for 137 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0138 begin');
      const actual: number = MediaTools.getOffsetFromTime(137);
      expect(Math.abs(actual - (26304.0)) <= Math.abs(26304.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0138 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_13900
     * @tc.name      testOffset0139
     * @tc.desc      Verify offset for 138 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0139 begin');
      const actual: number = MediaTools.getOffsetFromTime(138);
      expect(Math.abs(actual - (26496.0)) <= Math.abs(26496.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0139 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_14000
     * @tc.name      testOffset0140
     * @tc.desc      Verify offset for 139 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0140 begin');
      const actual: number = MediaTools.getOffsetFromTime(139);
      expect(Math.abs(actual - (26688.0)) <= Math.abs(26688.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0140 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_14100
     * @tc.name      testOffset0141
     * @tc.desc      Verify offset for 140 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0141 begin');
      const actual: number = MediaTools.getOffsetFromTime(140);
      expect(Math.abs(actual - (26880.0)) <= Math.abs(26880.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0141 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_14200
     * @tc.name      testOffset0142
     * @tc.desc      Verify offset for 141 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0142 begin');
      const actual: number = MediaTools.getOffsetFromTime(141);
      expect(Math.abs(actual - (27072.0)) <= Math.abs(27072.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0142 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_14300
     * @tc.name      testOffset0143
     * @tc.desc      Verify offset for 142 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0143 begin');
      const actual: number = MediaTools.getOffsetFromTime(142);
      expect(Math.abs(actual - (27264.0)) <= Math.abs(27264.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0143 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_14400
     * @tc.name      testOffset0144
     * @tc.desc      Verify offset for 143 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0144 begin');
      const actual: number = MediaTools.getOffsetFromTime(143);
      expect(Math.abs(actual - (27456.0)) <= Math.abs(27456.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0144 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_14500
     * @tc.name      testOffset0145
     * @tc.desc      Verify offset for 144 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0145 begin');
      const actual: number = MediaTools.getOffsetFromTime(144);
      expect(Math.abs(actual - (27648.0)) <= Math.abs(27648.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0145 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_14600
     * @tc.name      testOffset0146
     * @tc.desc      Verify offset for 145 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0146 begin');
      const actual: number = MediaTools.getOffsetFromTime(145);
      expect(Math.abs(actual - (27840.0)) <= Math.abs(27840.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0146 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_14700
     * @tc.name      testOffset0147
     * @tc.desc      Verify offset for 146 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0147 begin');
      const actual: number = MediaTools.getOffsetFromTime(146);
      expect(Math.abs(actual - (28032.0)) <= Math.abs(28032.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0147 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_14800
     * @tc.name      testOffset0148
     * @tc.desc      Verify offset for 147 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0148 begin');
      const actual: number = MediaTools.getOffsetFromTime(147);
      expect(Math.abs(actual - (28224.0)) <= Math.abs(28224.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0148 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_14900
     * @tc.name      testOffset0149
     * @tc.desc      Verify offset for 148 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0149 begin');
      const actual: number = MediaTools.getOffsetFromTime(148);
      expect(Math.abs(actual - (28416.0)) <= Math.abs(28416.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0149 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_15000
     * @tc.name      testOffset0150
     * @tc.desc      Verify offset for 149 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0150 begin');
      const actual: number = MediaTools.getOffsetFromTime(149);
      expect(Math.abs(actual - (28608.0)) <= Math.abs(28608.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0150 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_15100
     * @tc.name      testOffset0151
     * @tc.desc      Verify offset for 150 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0151 begin');
      const actual: number = MediaTools.getOffsetFromTime(150);
      expect(Math.abs(actual - (28800.0)) <= Math.abs(28800.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0151 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_15200
     * @tc.name      testOffset0152
     * @tc.desc      Verify offset for 151 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0152 begin');
      const actual: number = MediaTools.getOffsetFromTime(151);
      expect(Math.abs(actual - (28992.0)) <= Math.abs(28992.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0152 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_15300
     * @tc.name      testOffset0153
     * @tc.desc      Verify offset for 152 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0153 begin');
      const actual: number = MediaTools.getOffsetFromTime(152);
      expect(Math.abs(actual - (29184.0)) <= Math.abs(29184.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0153 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_15400
     * @tc.name      testOffset0154
     * @tc.desc      Verify offset for 153 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0154 begin');
      const actual: number = MediaTools.getOffsetFromTime(153);
      expect(Math.abs(actual - (29376.0)) <= Math.abs(29376.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0154 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_15500
     * @tc.name      testOffset0155
     * @tc.desc      Verify offset for 154 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0155 begin');
      const actual: number = MediaTools.getOffsetFromTime(154);
      expect(Math.abs(actual - (29568.0)) <= Math.abs(29568.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0155 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_15600
     * @tc.name      testOffset0156
     * @tc.desc      Verify offset for 155 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0156 begin');
      const actual: number = MediaTools.getOffsetFromTime(155);
      expect(Math.abs(actual - (29760.0)) <= Math.abs(29760.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0156 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_15700
     * @tc.name      testOffset0157
     * @tc.desc      Verify offset for 156 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0157 begin');
      const actual: number = MediaTools.getOffsetFromTime(156);
      expect(Math.abs(actual - (29952.0)) <= Math.abs(29952.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0157 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_15800
     * @tc.name      testOffset0158
     * @tc.desc      Verify offset for 157 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0158 begin');
      const actual: number = MediaTools.getOffsetFromTime(157);
      expect(Math.abs(actual - (30144.0)) <= Math.abs(30144.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0158 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_15900
     * @tc.name      testOffset0159
     * @tc.desc      Verify offset for 158 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0159 begin');
      const actual: number = MediaTools.getOffsetFromTime(158);
      expect(Math.abs(actual - (30336.0)) <= Math.abs(30336.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0159 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_16000
     * @tc.name      testOffset0160
     * @tc.desc      Verify offset for 159 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0160 begin');
      const actual: number = MediaTools.getOffsetFromTime(159);
      expect(Math.abs(actual - (30528.0)) <= Math.abs(30528.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0160 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_16100
     * @tc.name      testOffset0161
     * @tc.desc      Verify offset for 160 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0161 begin');
      const actual: number = MediaTools.getOffsetFromTime(160);
      expect(Math.abs(actual - (30720.0)) <= Math.abs(30720.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0161 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_16200
     * @tc.name      testOffset0162
     * @tc.desc      Verify offset for 161 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0162 begin');
      const actual: number = MediaTools.getOffsetFromTime(161);
      expect(Math.abs(actual - (30912.0)) <= Math.abs(30912.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0162 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_16300
     * @tc.name      testOffset0163
     * @tc.desc      Verify offset for 162 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0163 begin');
      const actual: number = MediaTools.getOffsetFromTime(162);
      expect(Math.abs(actual - (31104.0)) <= Math.abs(31104.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0163 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_16400
     * @tc.name      testOffset0164
     * @tc.desc      Verify offset for 163 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0164 begin');
      const actual: number = MediaTools.getOffsetFromTime(163);
      expect(Math.abs(actual - (31296.0)) <= Math.abs(31296.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0164 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_16500
     * @tc.name      testOffset0165
     * @tc.desc      Verify offset for 164 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0165 begin');
      const actual: number = MediaTools.getOffsetFromTime(164);
      expect(Math.abs(actual - (31488.0)) <= Math.abs(31488.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0165 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_16600
     * @tc.name      testOffset0166
     * @tc.desc      Verify offset for 165 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0166 begin');
      const actual: number = MediaTools.getOffsetFromTime(165);
      expect(Math.abs(actual - (31680.0)) <= Math.abs(31680.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0166 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_16700
     * @tc.name      testOffset0167
     * @tc.desc      Verify offset for 166 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0167 begin');
      const actual: number = MediaTools.getOffsetFromTime(166);
      expect(Math.abs(actual - (31872.0)) <= Math.abs(31872.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0167 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_16800
     * @tc.name      testOffset0168
     * @tc.desc      Verify offset for 167 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0168 begin');
      const actual: number = MediaTools.getOffsetFromTime(167);
      expect(Math.abs(actual - (32064.0)) <= Math.abs(32064.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0168 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_16900
     * @tc.name      testOffset0169
     * @tc.desc      Verify offset for 168 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0169 begin');
      const actual: number = MediaTools.getOffsetFromTime(168);
      expect(Math.abs(actual - (32256.0)) <= Math.abs(32256.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0169 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_17000
     * @tc.name      testOffset0170
     * @tc.desc      Verify offset for 169 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0170 begin');
      const actual: number = MediaTools.getOffsetFromTime(169);
      expect(Math.abs(actual - (32448.0)) <= Math.abs(32448.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0170 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_17100
     * @tc.name      testOffset0171
     * @tc.desc      Verify offset for 170 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0171 begin');
      const actual: number = MediaTools.getOffsetFromTime(170);
      expect(Math.abs(actual - (32640.0)) <= Math.abs(32640.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0171 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_17200
     * @tc.name      testOffset0172
     * @tc.desc      Verify offset for 171 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0172 begin');
      const actual: number = MediaTools.getOffsetFromTime(171);
      expect(Math.abs(actual - (32832.0)) <= Math.abs(32832.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0172 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_17300
     * @tc.name      testOffset0173
     * @tc.desc      Verify offset for 172 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0173 begin');
      const actual: number = MediaTools.getOffsetFromTime(172);
      expect(Math.abs(actual - (33024.0)) <= Math.abs(33024.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0173 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_17400
     * @tc.name      testOffset0174
     * @tc.desc      Verify offset for 173 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0174 begin');
      const actual: number = MediaTools.getOffsetFromTime(173);
      expect(Math.abs(actual - (33216.0)) <= Math.abs(33216.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0174 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_17500
     * @tc.name      testOffset0175
     * @tc.desc      Verify offset for 174 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0175 begin');
      const actual: number = MediaTools.getOffsetFromTime(174);
      expect(Math.abs(actual - (33408.0)) <= Math.abs(33408.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0175 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_17600
     * @tc.name      testOffset0176
     * @tc.desc      Verify offset for 175 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0176 begin');
      const actual: number = MediaTools.getOffsetFromTime(175);
      expect(Math.abs(actual - (33600.0)) <= Math.abs(33600.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0176 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_17700
     * @tc.name      testOffset0177
     * @tc.desc      Verify offset for 176 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0177 begin');
      const actual: number = MediaTools.getOffsetFromTime(176);
      expect(Math.abs(actual - (33792.0)) <= Math.abs(33792.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0177 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_17800
     * @tc.name      testOffset0178
     * @tc.desc      Verify offset for 177 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0178 begin');
      const actual: number = MediaTools.getOffsetFromTime(177);
      expect(Math.abs(actual - (33984.0)) <= Math.abs(33984.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0178 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_17900
     * @tc.name      testOffset0179
     * @tc.desc      Verify offset for 178 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0179 begin');
      const actual: number = MediaTools.getOffsetFromTime(178);
      expect(Math.abs(actual - (34176.0)) <= Math.abs(34176.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0179 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP2_18000
     * @tc.name      testOffset0180
     * @tc.desc      Verify offset for 179 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0180 begin');
      const actual: number = MediaTools.getOffsetFromTime(179);
      expect(Math.abs(actual - (34368.0)) <= Math.abs(34368.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0180 end');
    })

  })
}
