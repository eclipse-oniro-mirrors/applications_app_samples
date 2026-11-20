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

export default function MediaByteLengthMatrixPart3Test(): void {
  describe('MediaByteLengthMatrixPart3', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })


    /**
     * @tc.number    SUB_CAPTURER_BYTELENP3_ONE_0100
     * @tc.name      testByteLength0181
     * @tc.desc      Verify byte length 155520 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0181 begin');
      const actual: number = MediaTools.getMsFromByteLength(155520);
      expect(Math.abs(actual - (810.0)) <= Math.abs(810.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0181 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP3_ONE_0200
     * @tc.name      testByteLength0182
     * @tc.desc      Verify byte length 157440 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0182 begin');
      const actual: number = MediaTools.getMsFromByteLength(157440);
      expect(Math.abs(actual - (820.0)) <= Math.abs(820.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0182 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP3_ONE_0300
     * @tc.name      testByteLength0183
     * @tc.desc      Verify byte length 159360 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0183 begin');
      const actual: number = MediaTools.getMsFromByteLength(159360);
      expect(Math.abs(actual - (830.0)) <= Math.abs(830.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0183 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP3_ONE_0400
     * @tc.name      testByteLength0184
     * @tc.desc      Verify byte length 161280 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0184 begin');
      const actual: number = MediaTools.getMsFromByteLength(161280);
      expect(Math.abs(actual - (840.0)) <= Math.abs(840.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0184 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP3_ONE_0500
     * @tc.name      testByteLength0185
     * @tc.desc      Verify byte length 163200 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0185 begin');
      const actual: number = MediaTools.getMsFromByteLength(163200);
      expect(Math.abs(actual - (850.0)) <= Math.abs(850.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0185 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP3_ONE_0600
     * @tc.name      testByteLength0186
     * @tc.desc      Verify byte length 165120 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0186 begin');
      const actual: number = MediaTools.getMsFromByteLength(165120);
      expect(Math.abs(actual - (860.0)) <= Math.abs(860.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0186 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP3_ONE_0700
     * @tc.name      testByteLength0187
     * @tc.desc      Verify byte length 167040 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0187 begin');
      const actual: number = MediaTools.getMsFromByteLength(167040);
      expect(Math.abs(actual - (870.0)) <= Math.abs(870.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0187 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP3_ONE_0800
     * @tc.name      testByteLength0188
     * @tc.desc      Verify byte length 168960 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0188 begin');
      const actual: number = MediaTools.getMsFromByteLength(168960);
      expect(Math.abs(actual - (880.0)) <= Math.abs(880.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0188 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP3_ONE_0900
     * @tc.name      testByteLength0189
     * @tc.desc      Verify byte length 170880 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0189 begin');
      const actual: number = MediaTools.getMsFromByteLength(170880);
      expect(Math.abs(actual - (890.0)) <= Math.abs(890.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0189 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP3_ONE_1000
     * @tc.name      testByteLength0190
     * @tc.desc      Verify byte length 172800 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0190 begin');
      const actual: number = MediaTools.getMsFromByteLength(172800);
      expect(Math.abs(actual - (900.0)) <= Math.abs(900.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0190 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP3_ONE_1100
     * @tc.name      testByteLength0191
     * @tc.desc      Verify byte length 174720 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0191 begin');
      const actual: number = MediaTools.getMsFromByteLength(174720);
      expect(Math.abs(actual - (910.0)) <= Math.abs(910.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0191 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP3_ONE_1200
     * @tc.name      testByteLength0192
     * @tc.desc      Verify byte length 176640 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0192 begin');
      const actual: number = MediaTools.getMsFromByteLength(176640);
      expect(Math.abs(actual - (920.0)) <= Math.abs(920.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0192 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP3_ONE_1300
     * @tc.name      testByteLength0193
     * @tc.desc      Verify byte length 178560 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0193 begin');
      const actual: number = MediaTools.getMsFromByteLength(178560);
      expect(Math.abs(actual - (930.0)) <= Math.abs(930.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0193 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP3_ONE_1400
     * @tc.name      testByteLength0194
     * @tc.desc      Verify byte length 180480 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0194 begin');
      const actual: number = MediaTools.getMsFromByteLength(180480);
      expect(Math.abs(actual - (940.0)) <= Math.abs(940.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0194 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP3_ONE_1500
     * @tc.name      testByteLength0195
     * @tc.desc      Verify byte length 182400 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0195 begin');
      const actual: number = MediaTools.getMsFromByteLength(182400);
      expect(Math.abs(actual - (950.0)) <= Math.abs(950.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0195 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP3_ONE_1600
     * @tc.name      testByteLength0196
     * @tc.desc      Verify byte length 184320 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0196 begin');
      const actual: number = MediaTools.getMsFromByteLength(184320);
      expect(Math.abs(actual - (960.0)) <= Math.abs(960.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0196 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP3_ONE_1700
     * @tc.name      testByteLength0197
     * @tc.desc      Verify byte length 186240 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0197 begin');
      const actual: number = MediaTools.getMsFromByteLength(186240);
      expect(Math.abs(actual - (970.0)) <= Math.abs(970.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0197 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP3_ONE_1800
     * @tc.name      testByteLength0198
     * @tc.desc      Verify byte length 188160 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0198 begin');
      const actual: number = MediaTools.getMsFromByteLength(188160);
      expect(Math.abs(actual - (980.0)) <= Math.abs(980.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0198 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP3_ONE_1900
     * @tc.name      testByteLength0199
     * @tc.desc      Verify byte length 190080 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0199 begin');
      const actual: number = MediaTools.getMsFromByteLength(190080);
      expect(Math.abs(actual - (990.0)) <= Math.abs(990.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0199 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP3_ONE_2000
     * @tc.name      testByteLength0200
     * @tc.desc      Verify byte length 192000 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0200 begin');
      const actual: number = MediaTools.getMsFromByteLength(192000);
      expect(Math.abs(actual - (1000.0)) <= Math.abs(1000.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0200 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP3_ONE_2100
     * @tc.name      testByteLength0201
     * @tc.desc      Verify byte length 193920 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0201 begin');
      const actual: number = MediaTools.getMsFromByteLength(193920);
      expect(Math.abs(actual - (1010.0)) <= Math.abs(1010.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0201 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP3_ONE_2200
     * @tc.name      testByteLength0202
     * @tc.desc      Verify byte length 195840 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0202 begin');
      const actual: number = MediaTools.getMsFromByteLength(195840);
      expect(Math.abs(actual - (1020.0)) <= Math.abs(1020.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0202 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP3_ONE_2300
     * @tc.name      testByteLength0203
     * @tc.desc      Verify byte length 197760 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0203 begin');
      const actual: number = MediaTools.getMsFromByteLength(197760);
      expect(Math.abs(actual - (1030.0)) <= Math.abs(1030.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0203 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP3_ONE_2400
     * @tc.name      testByteLength0204
     * @tc.desc      Verify byte length 199680 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0204 begin');
      const actual: number = MediaTools.getMsFromByteLength(199680);
      expect(Math.abs(actual - (1040.0)) <= Math.abs(1040.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0204 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP3_ONE_2500
     * @tc.name      testByteLength0205
     * @tc.desc      Verify byte length 201600 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0205 begin');
      const actual: number = MediaTools.getMsFromByteLength(201600);
      expect(Math.abs(actual - (1050.0)) <= Math.abs(1050.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0205 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP3_ONE_2600
     * @tc.name      testByteLength0206
     * @tc.desc      Verify byte length 203520 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0206 begin');
      const actual: number = MediaTools.getMsFromByteLength(203520);
      expect(Math.abs(actual - (1060.0)) <= Math.abs(1060.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0206 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP3_ONE_2700
     * @tc.name      testByteLength0207
     * @tc.desc      Verify byte length 205440 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0207 begin');
      const actual: number = MediaTools.getMsFromByteLength(205440);
      expect(Math.abs(actual - (1070.0)) <= Math.abs(1070.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0207 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP3_ONE_2800
     * @tc.name      testByteLength0208
     * @tc.desc      Verify byte length 207360 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0208 begin');
      const actual: number = MediaTools.getMsFromByteLength(207360);
      expect(Math.abs(actual - (1080.0)) <= Math.abs(1080.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0208 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP3_ONE_2900
     * @tc.name      testByteLength0209
     * @tc.desc      Verify byte length 209280 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0209 begin');
      const actual: number = MediaTools.getMsFromByteLength(209280);
      expect(Math.abs(actual - (1090.0)) <= Math.abs(1090.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0209 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP3_ONE_3000
     * @tc.name      testByteLength0210
     * @tc.desc      Verify byte length 211200 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0210 begin');
      const actual: number = MediaTools.getMsFromByteLength(211200);
      expect(Math.abs(actual - (1100.0)) <= Math.abs(1100.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0210 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP3_ONE_3100
     * @tc.name      testByteLength0211
     * @tc.desc      Verify byte length 213120 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0211 begin');
      const actual: number = MediaTools.getMsFromByteLength(213120);
      expect(Math.abs(actual - (1110.0)) <= Math.abs(1110.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0211 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP3_ONE_3200
     * @tc.name      testByteLength0212
     * @tc.desc      Verify byte length 215040 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0212 begin');
      const actual: number = MediaTools.getMsFromByteLength(215040);
      expect(Math.abs(actual - (1120.0)) <= Math.abs(1120.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0212 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP3_ONE_3300
     * @tc.name      testByteLength0213
     * @tc.desc      Verify byte length 216960 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0213 begin');
      const actual: number = MediaTools.getMsFromByteLength(216960);
      expect(Math.abs(actual - (1130.0)) <= Math.abs(1130.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0213 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP3_ONE_3400
     * @tc.name      testByteLength0214
     * @tc.desc      Verify byte length 218880 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0214 begin');
      const actual: number = MediaTools.getMsFromByteLength(218880);
      expect(Math.abs(actual - (1140.0)) <= Math.abs(1140.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0214 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP3_ONE_3500
     * @tc.name      testByteLength0215
     * @tc.desc      Verify byte length 220800 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0215 begin');
      const actual: number = MediaTools.getMsFromByteLength(220800);
      expect(Math.abs(actual - (1150.0)) <= Math.abs(1150.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0215 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP3_ONE_3600
     * @tc.name      testByteLength0216
     * @tc.desc      Verify byte length 222720 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0216 begin');
      const actual: number = MediaTools.getMsFromByteLength(222720);
      expect(Math.abs(actual - (1160.0)) <= Math.abs(1160.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0216 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP3_ONE_3700
     * @tc.name      testByteLength0217
     * @tc.desc      Verify byte length 224640 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0217 begin');
      const actual: number = MediaTools.getMsFromByteLength(224640);
      expect(Math.abs(actual - (1170.0)) <= Math.abs(1170.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0217 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP3_ONE_3800
     * @tc.name      testByteLength0218
     * @tc.desc      Verify byte length 226560 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0218 begin');
      const actual: number = MediaTools.getMsFromByteLength(226560);
      expect(Math.abs(actual - (1180.0)) <= Math.abs(1180.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0218 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP3_ONE_3900
     * @tc.name      testByteLength0219
     * @tc.desc      Verify byte length 228480 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0219 begin');
      const actual: number = MediaTools.getMsFromByteLength(228480);
      expect(Math.abs(actual - (1190.0)) <= Math.abs(1190.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0219 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP3_ONE_4000
     * @tc.name      testByteLength0220
     * @tc.desc      Verify byte length 230400 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0220 begin');
      const actual: number = MediaTools.getMsFromByteLength(230400);
      expect(Math.abs(actual - (1200.0)) <= Math.abs(1200.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0220 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP3_ONE_4100
     * @tc.name      testByteLength0221
     * @tc.desc      Verify byte length 232320 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0221 begin');
      const actual: number = MediaTools.getMsFromByteLength(232320);
      expect(Math.abs(actual - (1210.0)) <= Math.abs(1210.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0221 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP3_ONE_4200
     * @tc.name      testByteLength0222
     * @tc.desc      Verify byte length 234240 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0222 begin');
      const actual: number = MediaTools.getMsFromByteLength(234240);
      expect(Math.abs(actual - (1220.0)) <= Math.abs(1220.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0222 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP3_ONE_4300
     * @tc.name      testByteLength0223
     * @tc.desc      Verify byte length 236160 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0223 begin');
      const actual: number = MediaTools.getMsFromByteLength(236160);
      expect(Math.abs(actual - (1230.0)) <= Math.abs(1230.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0223 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP3_ONE_4400
     * @tc.name      testByteLength0224
     * @tc.desc      Verify byte length 238080 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0224 begin');
      const actual: number = MediaTools.getMsFromByteLength(238080);
      expect(Math.abs(actual - (1240.0)) <= Math.abs(1240.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0224 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP3_ONE_4500
     * @tc.name      testByteLength0225
     * @tc.desc      Verify byte length 240000 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0225 begin');
      const actual: number = MediaTools.getMsFromByteLength(240000);
      expect(Math.abs(actual - (1250.0)) <= Math.abs(1250.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0225 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP3_ONE_4600
     * @tc.name      testByteLength0226
     * @tc.desc      Verify byte length 241920 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0226 begin');
      const actual: number = MediaTools.getMsFromByteLength(241920);
      expect(Math.abs(actual - (1260.0)) <= Math.abs(1260.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0226 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP3_ONE_4700
     * @tc.name      testByteLength0227
     * @tc.desc      Verify byte length 243840 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0227 begin');
      const actual: number = MediaTools.getMsFromByteLength(243840);
      expect(Math.abs(actual - (1270.0)) <= Math.abs(1270.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0227 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP3_ONE_4800
     * @tc.name      testByteLength0228
     * @tc.desc      Verify byte length 245760 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0228 begin');
      const actual: number = MediaTools.getMsFromByteLength(245760);
      expect(Math.abs(actual - (1280.0)) <= Math.abs(1280.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0228 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP3_ONE_4900
     * @tc.name      testByteLength0229
     * @tc.desc      Verify byte length 247680 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0229 begin');
      const actual: number = MediaTools.getMsFromByteLength(247680);
      expect(Math.abs(actual - (1290.0)) <= Math.abs(1290.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0229 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP3_ONE_5000
     * @tc.name      testByteLength0230
     * @tc.desc      Verify byte length 249600 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0230 begin');
      const actual: number = MediaTools.getMsFromByteLength(249600);
      expect(Math.abs(actual - (1300.0)) <= Math.abs(1300.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0230 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP3_ONE_5100
     * @tc.name      testByteLength0231
     * @tc.desc      Verify byte length 251520 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0231 begin');
      const actual: number = MediaTools.getMsFromByteLength(251520);
      expect(Math.abs(actual - (1310.0)) <= Math.abs(1310.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0231 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP3_ONE_5200
     * @tc.name      testByteLength0232
     * @tc.desc      Verify byte length 253440 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0232 begin');
      const actual: number = MediaTools.getMsFromByteLength(253440);
      expect(Math.abs(actual - (1320.0)) <= Math.abs(1320.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0232 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP3_ONE_5300
     * @tc.name      testByteLength0233
     * @tc.desc      Verify byte length 255360 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0233 begin');
      const actual: number = MediaTools.getMsFromByteLength(255360);
      expect(Math.abs(actual - (1330.0)) <= Math.abs(1330.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0233 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP3_ONE_5400
     * @tc.name      testByteLength0234
     * @tc.desc      Verify byte length 257280 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0234 begin');
      const actual: number = MediaTools.getMsFromByteLength(257280);
      expect(Math.abs(actual - (1340.0)) <= Math.abs(1340.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0234 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP3_ONE_5500
     * @tc.name      testByteLength0235
     * @tc.desc      Verify byte length 259200 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0235 begin');
      const actual: number = MediaTools.getMsFromByteLength(259200);
      expect(Math.abs(actual - (1350.0)) <= Math.abs(1350.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0235 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP3_ONE_5600
     * @tc.name      testByteLength0236
     * @tc.desc      Verify byte length 261120 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0236 begin');
      const actual: number = MediaTools.getMsFromByteLength(261120);
      expect(Math.abs(actual - (1360.0)) <= Math.abs(1360.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0236 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP3_ONE_5700
     * @tc.name      testByteLength0237
     * @tc.desc      Verify byte length 263040 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0237 begin');
      const actual: number = MediaTools.getMsFromByteLength(263040);
      expect(Math.abs(actual - (1370.0)) <= Math.abs(1370.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0237 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP3_ONE_5800
     * @tc.name      testByteLength0238
     * @tc.desc      Verify byte length 264960 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0238 begin');
      const actual: number = MediaTools.getMsFromByteLength(264960);
      expect(Math.abs(actual - (1380.0)) <= Math.abs(1380.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0238 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP3_ONE_5900
     * @tc.name      testByteLength0239
     * @tc.desc      Verify byte length 266880 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0239 begin');
      const actual: number = MediaTools.getMsFromByteLength(266880);
      expect(Math.abs(actual - (1390.0)) <= Math.abs(1390.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0239 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP3_ONE_6000
     * @tc.name      testByteLength0240
     * @tc.desc      Verify byte length 268800 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0240 begin');
      const actual: number = MediaTools.getMsFromByteLength(268800);
      expect(Math.abs(actual - (1400.0)) <= Math.abs(1400.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0240 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP3_ONE_6100
     * @tc.name      testByteLength0241
     * @tc.desc      Verify byte length 270720 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0241 begin');
      const actual: number = MediaTools.getMsFromByteLength(270720);
      expect(Math.abs(actual - (1410.0)) <= Math.abs(1410.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0241 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP3_ONE_6200
     * @tc.name      testByteLength0242
     * @tc.desc      Verify byte length 272640 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0242 begin');
      const actual: number = MediaTools.getMsFromByteLength(272640);
      expect(Math.abs(actual - (1420.0)) <= Math.abs(1420.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0242 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP3_ONE_6300
     * @tc.name      testByteLength0243
     * @tc.desc      Verify byte length 274560 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0243 begin');
      const actual: number = MediaTools.getMsFromByteLength(274560);
      expect(Math.abs(actual - (1430.0)) <= Math.abs(1430.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0243 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP3_ONE_6400
     * @tc.name      testByteLength0244
     * @tc.desc      Verify byte length 276480 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0244 begin');
      const actual: number = MediaTools.getMsFromByteLength(276480);
      expect(Math.abs(actual - (1440.0)) <= Math.abs(1440.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0244 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP3_ONE_6500
     * @tc.name      testByteLength0245
     * @tc.desc      Verify byte length 278400 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0245 begin');
      const actual: number = MediaTools.getMsFromByteLength(278400);
      expect(Math.abs(actual - (1450.0)) <= Math.abs(1450.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0245 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP3_ONE_6600
     * @tc.name      testByteLength0246
     * @tc.desc      Verify byte length 280320 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0246 begin');
      const actual: number = MediaTools.getMsFromByteLength(280320);
      expect(Math.abs(actual - (1460.0)) <= Math.abs(1460.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0246 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP3_ONE_6700
     * @tc.name      testByteLength0247
     * @tc.desc      Verify byte length 282240 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0247 begin');
      const actual: number = MediaTools.getMsFromByteLength(282240);
      expect(Math.abs(actual - (1470.0)) <= Math.abs(1470.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0247 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP3_ONE_6800
     * @tc.name      testByteLength0248
     * @tc.desc      Verify byte length 284160 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0248 begin');
      const actual: number = MediaTools.getMsFromByteLength(284160);
      expect(Math.abs(actual - (1480.0)) <= Math.abs(1480.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0248 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP3_ONE_6900
     * @tc.name      testByteLength0249
     * @tc.desc      Verify byte length 286080 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0249 begin');
      const actual: number = MediaTools.getMsFromByteLength(286080);
      expect(Math.abs(actual - (1490.0)) <= Math.abs(1490.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0249 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP3_ONE_7000
     * @tc.name      testByteLength0250
     * @tc.desc      Verify byte length 288000 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0250 begin');
      const actual: number = MediaTools.getMsFromByteLength(288000);
      expect(Math.abs(actual - (1500.0)) <= Math.abs(1500.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0250 end');
    })

  })
}
