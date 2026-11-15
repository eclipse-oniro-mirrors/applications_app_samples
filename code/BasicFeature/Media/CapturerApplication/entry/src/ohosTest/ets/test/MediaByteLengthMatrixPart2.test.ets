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

export default function MediaByteLengthMatrixPart2Test(): void {
  describe('MediaByteLengthMatrixPart2', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })


    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_9100
     * @tc.name      testByteLength0091
     * @tc.desc      Verify byte length 461 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0091 begin');
      const actual: number = MediaTools.getMsFromByteLength(461);
      expect(Math.abs(actual - (2.4010416666666665)) <= Math.abs(2.4010416666666665) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0091 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_9200
     * @tc.name      testByteLength0092
     * @tc.desc      Verify byte length 463 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0092 begin');
      const actual: number = MediaTools.getMsFromByteLength(463);
      expect(Math.abs(actual - (2.4114583333333335)) <= Math.abs(2.4114583333333335) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0092 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_9300
     * @tc.name      testByteLength0093
     * @tc.desc      Verify byte length 467 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0093 begin');
      const actual: number = MediaTools.getMsFromByteLength(467);
      expect(Math.abs(actual - (2.4322916666666665)) <= Math.abs(2.4322916666666665) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0093 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_9400
     * @tc.name      testByteLength0094
     * @tc.desc      Verify byte length 479 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0094 begin');
      const actual: number = MediaTools.getMsFromByteLength(479);
      expect(Math.abs(actual - (2.4947916666666665)) <= Math.abs(2.4947916666666665) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0094 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_9500
     * @tc.name      testByteLength0095
     * @tc.desc      Verify byte length 487 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0095 begin');
      const actual: number = MediaTools.getMsFromByteLength(487);
      expect(Math.abs(actual - (2.5364583333333335)) <= Math.abs(2.5364583333333335) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0095 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_9600
     * @tc.name      testByteLength0096
     * @tc.desc      Verify byte length 491 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0096 begin');
      const actual: number = MediaTools.getMsFromByteLength(491);
      expect(Math.abs(actual - (2.5572916666666665)) <= Math.abs(2.5572916666666665) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0096 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_9700
     * @tc.name      testByteLength0097
     * @tc.desc      Verify byte length 499 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0097 begin');
      const actual: number = MediaTools.getMsFromByteLength(499);
      expect(Math.abs(actual - (2.5989583333333335)) <= Math.abs(2.5989583333333335) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0097 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_9800
     * @tc.name      testByteLength0098
     * @tc.desc      Verify byte length 503 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0098 begin');
      const actual: number = MediaTools.getMsFromByteLength(503);
      expect(Math.abs(actual - (2.6197916666666665)) <= Math.abs(2.6197916666666665) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0098 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_9900
     * @tc.name      testByteLength0099
     * @tc.desc      Verify byte length 509 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0099 begin');
      const actual: number = MediaTools.getMsFromByteLength(509);
      expect(Math.abs(actual - (2.6510416666666665)) <= Math.abs(2.6510416666666665) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0099 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_10000
     * @tc.name      testByteLength0100
     * @tc.desc      Verify byte length 521 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0100 begin');
      const actual: number = MediaTools.getMsFromByteLength(521);
      expect(Math.abs(actual - (2.7135416666666665)) <= Math.abs(2.7135416666666665) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0100 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_10100
     * @tc.name      testByteLength0101
     * @tc.desc      Verify byte length 1920 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0101 begin');
      const actual: number = MediaTools.getMsFromByteLength(1920);
      expect(Math.abs(actual - (10.0)) <= Math.abs(10.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0101 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_10200
     * @tc.name      testByteLength0102
     * @tc.desc      Verify byte length 3840 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0102 begin');
      const actual: number = MediaTools.getMsFromByteLength(3840);
      expect(Math.abs(actual - (20.0)) <= Math.abs(20.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0102 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_10300
     * @tc.name      testByteLength0103
     * @tc.desc      Verify byte length 5760 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0103 begin');
      const actual: number = MediaTools.getMsFromByteLength(5760);
      expect(Math.abs(actual - (30.0)) <= Math.abs(30.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0103 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_10400
     * @tc.name      testByteLength0104
     * @tc.desc      Verify byte length 7680 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0104 begin');
      const actual: number = MediaTools.getMsFromByteLength(7680);
      expect(Math.abs(actual - (40.0)) <= Math.abs(40.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0104 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_10500
     * @tc.name      testByteLength0105
     * @tc.desc      Verify byte length 9600 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0105 begin');
      const actual: number = MediaTools.getMsFromByteLength(9600);
      expect(Math.abs(actual - (50.0)) <= Math.abs(50.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0105 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_10600
     * @tc.name      testByteLength0106
     * @tc.desc      Verify byte length 11520 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0106 begin');
      const actual: number = MediaTools.getMsFromByteLength(11520);
      expect(Math.abs(actual - (60.0)) <= Math.abs(60.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0106 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_10700
     * @tc.name      testByteLength0107
     * @tc.desc      Verify byte length 13440 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0107 begin');
      const actual: number = MediaTools.getMsFromByteLength(13440);
      expect(Math.abs(actual - (70.0)) <= Math.abs(70.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0107 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_10800
     * @tc.name      testByteLength0108
     * @tc.desc      Verify byte length 15360 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0108 begin');
      const actual: number = MediaTools.getMsFromByteLength(15360);
      expect(Math.abs(actual - (80.0)) <= Math.abs(80.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0108 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_10900
     * @tc.name      testByteLength0109
     * @tc.desc      Verify byte length 17280 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0109 begin');
      const actual: number = MediaTools.getMsFromByteLength(17280);
      expect(Math.abs(actual - (90.0)) <= Math.abs(90.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0109 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_11000
     * @tc.name      testByteLength0110
     * @tc.desc      Verify byte length 19200 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0110 begin');
      const actual: number = MediaTools.getMsFromByteLength(19200);
      expect(Math.abs(actual - (100.0)) <= Math.abs(100.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0110 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_11100
     * @tc.name      testByteLength0111
     * @tc.desc      Verify byte length 21120 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0111 begin');
      const actual: number = MediaTools.getMsFromByteLength(21120);
      expect(Math.abs(actual - (110.0)) <= Math.abs(110.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0111 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_11200
     * @tc.name      testByteLength0112
     * @tc.desc      Verify byte length 23040 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0112 begin');
      const actual: number = MediaTools.getMsFromByteLength(23040);
      expect(Math.abs(actual - (120.0)) <= Math.abs(120.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0112 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_11300
     * @tc.name      testByteLength0113
     * @tc.desc      Verify byte length 24960 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0113 begin');
      const actual: number = MediaTools.getMsFromByteLength(24960);
      expect(Math.abs(actual - (130.0)) <= Math.abs(130.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0113 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_11400
     * @tc.name      testByteLength0114
     * @tc.desc      Verify byte length 26880 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0114 begin');
      const actual: number = MediaTools.getMsFromByteLength(26880);
      expect(Math.abs(actual - (140.0)) <= Math.abs(140.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0114 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_11500
     * @tc.name      testByteLength0115
     * @tc.desc      Verify byte length 28800 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0115 begin');
      const actual: number = MediaTools.getMsFromByteLength(28800);
      expect(Math.abs(actual - (150.0)) <= Math.abs(150.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0115 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_11600
     * @tc.name      testByteLength0116
     * @tc.desc      Verify byte length 30720 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0116 begin');
      const actual: number = MediaTools.getMsFromByteLength(30720);
      expect(Math.abs(actual - (160.0)) <= Math.abs(160.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0116 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_11700
     * @tc.name      testByteLength0117
     * @tc.desc      Verify byte length 32640 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0117 begin');
      const actual: number = MediaTools.getMsFromByteLength(32640);
      expect(Math.abs(actual - (170.0)) <= Math.abs(170.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0117 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_11800
     * @tc.name      testByteLength0118
     * @tc.desc      Verify byte length 34560 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0118 begin');
      const actual: number = MediaTools.getMsFromByteLength(34560);
      expect(Math.abs(actual - (180.0)) <= Math.abs(180.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0118 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_11900
     * @tc.name      testByteLength0119
     * @tc.desc      Verify byte length 36480 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0119 begin');
      const actual: number = MediaTools.getMsFromByteLength(36480);
      expect(Math.abs(actual - (190.0)) <= Math.abs(190.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0119 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_12000
     * @tc.name      testByteLength0120
     * @tc.desc      Verify byte length 38400 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0120 begin');
      const actual: number = MediaTools.getMsFromByteLength(38400);
      expect(Math.abs(actual - (200.0)) <= Math.abs(200.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0120 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_12100
     * @tc.name      testByteLength0121
     * @tc.desc      Verify byte length 40320 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0121 begin');
      const actual: number = MediaTools.getMsFromByteLength(40320);
      expect(Math.abs(actual - (210.0)) <= Math.abs(210.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0121 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_12200
     * @tc.name      testByteLength0122
     * @tc.desc      Verify byte length 42240 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0122 begin');
      const actual: number = MediaTools.getMsFromByteLength(42240);
      expect(Math.abs(actual - (220.0)) <= Math.abs(220.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0122 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_12300
     * @tc.name      testByteLength0123
     * @tc.desc      Verify byte length 44160 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0123 begin');
      const actual: number = MediaTools.getMsFromByteLength(44160);
      expect(Math.abs(actual - (230.0)) <= Math.abs(230.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0123 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_12400
     * @tc.name      testByteLength0124
     * @tc.desc      Verify byte length 46080 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0124 begin');
      const actual: number = MediaTools.getMsFromByteLength(46080);
      expect(Math.abs(actual - (240.0)) <= Math.abs(240.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0124 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_12500
     * @tc.name      testByteLength0125
     * @tc.desc      Verify byte length 48000 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0125 begin');
      const actual: number = MediaTools.getMsFromByteLength(48000);
      expect(Math.abs(actual - (250.0)) <= Math.abs(250.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0125 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_12600
     * @tc.name      testByteLength0126
     * @tc.desc      Verify byte length 49920 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0126 begin');
      const actual: number = MediaTools.getMsFromByteLength(49920);
      expect(Math.abs(actual - (260.0)) <= Math.abs(260.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0126 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_12700
     * @tc.name      testByteLength0127
     * @tc.desc      Verify byte length 51840 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0127 begin');
      const actual: number = MediaTools.getMsFromByteLength(51840);
      expect(Math.abs(actual - (270.0)) <= Math.abs(270.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0127 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_12800
     * @tc.name      testByteLength0128
     * @tc.desc      Verify byte length 53760 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0128 begin');
      const actual: number = MediaTools.getMsFromByteLength(53760);
      expect(Math.abs(actual - (280.0)) <= Math.abs(280.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0128 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_12900
     * @tc.name      testByteLength0129
     * @tc.desc      Verify byte length 55680 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0129 begin');
      const actual: number = MediaTools.getMsFromByteLength(55680);
      expect(Math.abs(actual - (290.0)) <= Math.abs(290.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0129 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_13000
     * @tc.name      testByteLength0130
     * @tc.desc      Verify byte length 57600 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0130 begin');
      const actual: number = MediaTools.getMsFromByteLength(57600);
      expect(Math.abs(actual - (300.0)) <= Math.abs(300.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0130 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_13100
     * @tc.name      testByteLength0131
     * @tc.desc      Verify byte length 59520 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0131 begin');
      const actual: number = MediaTools.getMsFromByteLength(59520);
      expect(Math.abs(actual - (310.0)) <= Math.abs(310.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0131 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_13200
     * @tc.name      testByteLength0132
     * @tc.desc      Verify byte length 61440 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0132 begin');
      const actual: number = MediaTools.getMsFromByteLength(61440);
      expect(Math.abs(actual - (320.0)) <= Math.abs(320.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0132 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_13300
     * @tc.name      testByteLength0133
     * @tc.desc      Verify byte length 63360 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0133 begin');
      const actual: number = MediaTools.getMsFromByteLength(63360);
      expect(Math.abs(actual - (330.0)) <= Math.abs(330.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0133 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_13400
     * @tc.name      testByteLength0134
     * @tc.desc      Verify byte length 65280 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0134 begin');
      const actual: number = MediaTools.getMsFromByteLength(65280);
      expect(Math.abs(actual - (340.0)) <= Math.abs(340.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0134 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_13500
     * @tc.name      testByteLength0135
     * @tc.desc      Verify byte length 67200 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0135 begin');
      const actual: number = MediaTools.getMsFromByteLength(67200);
      expect(Math.abs(actual - (350.0)) <= Math.abs(350.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0135 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_13600
     * @tc.name      testByteLength0136
     * @tc.desc      Verify byte length 69120 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0136 begin');
      const actual: number = MediaTools.getMsFromByteLength(69120);
      expect(Math.abs(actual - (360.0)) <= Math.abs(360.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0136 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_13700
     * @tc.name      testByteLength0137
     * @tc.desc      Verify byte length 71040 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0137 begin');
      const actual: number = MediaTools.getMsFromByteLength(71040);
      expect(Math.abs(actual - (370.0)) <= Math.abs(370.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0137 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_13800
     * @tc.name      testByteLength0138
     * @tc.desc      Verify byte length 72960 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0138 begin');
      const actual: number = MediaTools.getMsFromByteLength(72960);
      expect(Math.abs(actual - (380.0)) <= Math.abs(380.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0138 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_13900
     * @tc.name      testByteLength0139
     * @tc.desc      Verify byte length 74880 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0139 begin');
      const actual: number = MediaTools.getMsFromByteLength(74880);
      expect(Math.abs(actual - (390.0)) <= Math.abs(390.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0139 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_14000
     * @tc.name      testByteLength0140
     * @tc.desc      Verify byte length 76800 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0140 begin');
      const actual: number = MediaTools.getMsFromByteLength(76800);
      expect(Math.abs(actual - (400.0)) <= Math.abs(400.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0140 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_14100
     * @tc.name      testByteLength0141
     * @tc.desc      Verify byte length 78720 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0141 begin');
      const actual: number = MediaTools.getMsFromByteLength(78720);
      expect(Math.abs(actual - (410.0)) <= Math.abs(410.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0141 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_14200
     * @tc.name      testByteLength0142
     * @tc.desc      Verify byte length 80640 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0142 begin');
      const actual: number = MediaTools.getMsFromByteLength(80640);
      expect(Math.abs(actual - (420.0)) <= Math.abs(420.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0142 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_14300
     * @tc.name      testByteLength0143
     * @tc.desc      Verify byte length 82560 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0143 begin');
      const actual: number = MediaTools.getMsFromByteLength(82560);
      expect(Math.abs(actual - (430.0)) <= Math.abs(430.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0143 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_14400
     * @tc.name      testByteLength0144
     * @tc.desc      Verify byte length 84480 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0144 begin');
      const actual: number = MediaTools.getMsFromByteLength(84480);
      expect(Math.abs(actual - (440.0)) <= Math.abs(440.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0144 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_14500
     * @tc.name      testByteLength0145
     * @tc.desc      Verify byte length 86400 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0145 begin');
      const actual: number = MediaTools.getMsFromByteLength(86400);
      expect(Math.abs(actual - (450.0)) <= Math.abs(450.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0145 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_14600
     * @tc.name      testByteLength0146
     * @tc.desc      Verify byte length 88320 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0146 begin');
      const actual: number = MediaTools.getMsFromByteLength(88320);
      expect(Math.abs(actual - (460.0)) <= Math.abs(460.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0146 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_14700
     * @tc.name      testByteLength0147
     * @tc.desc      Verify byte length 90240 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0147 begin');
      const actual: number = MediaTools.getMsFromByteLength(90240);
      expect(Math.abs(actual - (470.0)) <= Math.abs(470.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0147 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_14800
     * @tc.name      testByteLength0148
     * @tc.desc      Verify byte length 92160 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0148 begin');
      const actual: number = MediaTools.getMsFromByteLength(92160);
      expect(Math.abs(actual - (480.0)) <= Math.abs(480.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0148 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_14900
     * @tc.name      testByteLength0149
     * @tc.desc      Verify byte length 94080 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0149 begin');
      const actual: number = MediaTools.getMsFromByteLength(94080);
      expect(Math.abs(actual - (490.0)) <= Math.abs(490.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0149 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_15000
     * @tc.name      testByteLength0150
     * @tc.desc      Verify byte length 96000 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0150 begin');
      const actual: number = MediaTools.getMsFromByteLength(96000);
      expect(Math.abs(actual - (500.0)) <= Math.abs(500.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0150 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_15100
     * @tc.name      testByteLength0151
     * @tc.desc      Verify byte length 97920 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0151 begin');
      const actual: number = MediaTools.getMsFromByteLength(97920);
      expect(Math.abs(actual - (510.0)) <= Math.abs(510.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0151 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_15200
     * @tc.name      testByteLength0152
     * @tc.desc      Verify byte length 99840 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0152 begin');
      const actual: number = MediaTools.getMsFromByteLength(99840);
      expect(Math.abs(actual - (520.0)) <= Math.abs(520.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0152 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_15300
     * @tc.name      testByteLength0153
     * @tc.desc      Verify byte length 101760 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0153 begin');
      const actual: number = MediaTools.getMsFromByteLength(101760);
      expect(Math.abs(actual - (530.0)) <= Math.abs(530.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0153 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_15400
     * @tc.name      testByteLength0154
     * @tc.desc      Verify byte length 103680 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0154 begin');
      const actual: number = MediaTools.getMsFromByteLength(103680);
      expect(Math.abs(actual - (540.0)) <= Math.abs(540.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0154 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_15500
     * @tc.name      testByteLength0155
     * @tc.desc      Verify byte length 105600 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0155 begin');
      const actual: number = MediaTools.getMsFromByteLength(105600);
      expect(Math.abs(actual - (550.0)) <= Math.abs(550.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0155 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_15600
     * @tc.name      testByteLength0156
     * @tc.desc      Verify byte length 107520 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0156 begin');
      const actual: number = MediaTools.getMsFromByteLength(107520);
      expect(Math.abs(actual - (560.0)) <= Math.abs(560.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0156 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_15700
     * @tc.name      testByteLength0157
     * @tc.desc      Verify byte length 109440 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0157 begin');
      const actual: number = MediaTools.getMsFromByteLength(109440);
      expect(Math.abs(actual - (570.0)) <= Math.abs(570.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0157 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_15800
     * @tc.name      testByteLength0158
     * @tc.desc      Verify byte length 111360 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0158 begin');
      const actual: number = MediaTools.getMsFromByteLength(111360);
      expect(Math.abs(actual - (580.0)) <= Math.abs(580.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0158 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_15900
     * @tc.name      testByteLength0159
     * @tc.desc      Verify byte length 113280 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0159 begin');
      const actual: number = MediaTools.getMsFromByteLength(113280);
      expect(Math.abs(actual - (590.0)) <= Math.abs(590.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0159 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_16000
     * @tc.name      testByteLength0160
     * @tc.desc      Verify byte length 115200 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0160 begin');
      const actual: number = MediaTools.getMsFromByteLength(115200);
      expect(Math.abs(actual - (600.0)) <= Math.abs(600.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0160 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_16100
     * @tc.name      testByteLength0161
     * @tc.desc      Verify byte length 117120 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0161 begin');
      const actual: number = MediaTools.getMsFromByteLength(117120);
      expect(Math.abs(actual - (610.0)) <= Math.abs(610.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0161 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_16200
     * @tc.name      testByteLength0162
     * @tc.desc      Verify byte length 119040 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0162 begin');
      const actual: number = MediaTools.getMsFromByteLength(119040);
      expect(Math.abs(actual - (620.0)) <= Math.abs(620.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0162 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_16300
     * @tc.name      testByteLength0163
     * @tc.desc      Verify byte length 120960 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0163 begin');
      const actual: number = MediaTools.getMsFromByteLength(120960);
      expect(Math.abs(actual - (630.0)) <= Math.abs(630.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0163 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_16400
     * @tc.name      testByteLength0164
     * @tc.desc      Verify byte length 122880 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0164 begin');
      const actual: number = MediaTools.getMsFromByteLength(122880);
      expect(Math.abs(actual - (640.0)) <= Math.abs(640.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0164 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_16500
     * @tc.name      testByteLength0165
     * @tc.desc      Verify byte length 124800 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0165 begin');
      const actual: number = MediaTools.getMsFromByteLength(124800);
      expect(Math.abs(actual - (650.0)) <= Math.abs(650.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0165 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_16600
     * @tc.name      testByteLength0166
     * @tc.desc      Verify byte length 126720 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0166 begin');
      const actual: number = MediaTools.getMsFromByteLength(126720);
      expect(Math.abs(actual - (660.0)) <= Math.abs(660.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0166 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_16700
     * @tc.name      testByteLength0167
     * @tc.desc      Verify byte length 128640 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0167 begin');
      const actual: number = MediaTools.getMsFromByteLength(128640);
      expect(Math.abs(actual - (670.0)) <= Math.abs(670.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0167 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_16800
     * @tc.name      testByteLength0168
     * @tc.desc      Verify byte length 130560 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0168 begin');
      const actual: number = MediaTools.getMsFromByteLength(130560);
      expect(Math.abs(actual - (680.0)) <= Math.abs(680.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0168 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_16900
     * @tc.name      testByteLength0169
     * @tc.desc      Verify byte length 132480 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0169 begin');
      const actual: number = MediaTools.getMsFromByteLength(132480);
      expect(Math.abs(actual - (690.0)) <= Math.abs(690.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0169 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_17000
     * @tc.name      testByteLength0170
     * @tc.desc      Verify byte length 134400 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0170 begin');
      const actual: number = MediaTools.getMsFromByteLength(134400);
      expect(Math.abs(actual - (700.0)) <= Math.abs(700.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0170 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_17100
     * @tc.name      testByteLength0171
     * @tc.desc      Verify byte length 136320 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0171 begin');
      const actual: number = MediaTools.getMsFromByteLength(136320);
      expect(Math.abs(actual - (710.0)) <= Math.abs(710.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0171 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_17200
     * @tc.name      testByteLength0172
     * @tc.desc      Verify byte length 138240 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0172 begin');
      const actual: number = MediaTools.getMsFromByteLength(138240);
      expect(Math.abs(actual - (720.0)) <= Math.abs(720.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0172 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_17300
     * @tc.name      testByteLength0173
     * @tc.desc      Verify byte length 140160 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0173 begin');
      const actual: number = MediaTools.getMsFromByteLength(140160);
      expect(Math.abs(actual - (730.0)) <= Math.abs(730.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0173 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_17400
     * @tc.name      testByteLength0174
     * @tc.desc      Verify byte length 142080 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0174 begin');
      const actual: number = MediaTools.getMsFromByteLength(142080);
      expect(Math.abs(actual - (740.0)) <= Math.abs(740.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0174 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_17500
     * @tc.name      testByteLength0175
     * @tc.desc      Verify byte length 144000 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0175 begin');
      const actual: number = MediaTools.getMsFromByteLength(144000);
      expect(Math.abs(actual - (750.0)) <= Math.abs(750.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0175 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_17600
     * @tc.name      testByteLength0176
     * @tc.desc      Verify byte length 145920 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0176 begin');
      const actual: number = MediaTools.getMsFromByteLength(145920);
      expect(Math.abs(actual - (760.0)) <= Math.abs(760.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0176 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_17700
     * @tc.name      testByteLength0177
     * @tc.desc      Verify byte length 147840 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0177 begin');
      const actual: number = MediaTools.getMsFromByteLength(147840);
      expect(Math.abs(actual - (770.0)) <= Math.abs(770.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0177 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_17800
     * @tc.name      testByteLength0178
     * @tc.desc      Verify byte length 149760 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0178 begin');
      const actual: number = MediaTools.getMsFromByteLength(149760);
      expect(Math.abs(actual - (780.0)) <= Math.abs(780.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0178 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_17900
     * @tc.name      testByteLength0179
     * @tc.desc      Verify byte length 151680 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0179 begin');
      const actual: number = MediaTools.getMsFromByteLength(151680);
      expect(Math.abs(actual - (790.0)) <= Math.abs(790.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0179 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP2_18000
     * @tc.name      testByteLength0180
     * @tc.desc      Verify byte length 153600 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0180 begin');
      const actual: number = MediaTools.getMsFromByteLength(153600);
      expect(Math.abs(actual - (800.0)) <= Math.abs(800.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0180 end');
    })

  })
}
