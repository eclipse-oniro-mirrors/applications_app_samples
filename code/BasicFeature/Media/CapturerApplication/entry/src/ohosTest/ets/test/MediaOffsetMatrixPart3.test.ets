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

export default function MediaOffsetMatrixPart3Test(): void {
  describe('MediaOffsetMatrixPart3', () => {

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP3_18100
     * @tc.name      testOffset0181
     * @tc.desc      Verify offset for 180 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0181 begin');
      const actual: number = MediaTools.getOffsetFromTime(180);
      expect(Math.abs(actual - (34560.0)) <= Math.abs(34560.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0181 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP3_18200
     * @tc.name      testOffset0182
     * @tc.desc      Verify offset for 181 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0182 begin');
      const actual: number = MediaTools.getOffsetFromTime(181);
      expect(Math.abs(actual - (34752.0)) <= Math.abs(34752.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0182 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP3_18300
     * @tc.name      testOffset0183
     * @tc.desc      Verify offset for 182 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0183 begin');
      const actual: number = MediaTools.getOffsetFromTime(182);
      expect(Math.abs(actual - (34944.0)) <= Math.abs(34944.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0183 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP3_18400
     * @tc.name      testOffset0184
     * @tc.desc      Verify offset for 183 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0184 begin');
      const actual: number = MediaTools.getOffsetFromTime(183);
      expect(Math.abs(actual - (35136.0)) <= Math.abs(35136.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0184 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP3_18500
     * @tc.name      testOffset0185
     * @tc.desc      Verify offset for 184 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0185 begin');
      const actual: number = MediaTools.getOffsetFromTime(184);
      expect(Math.abs(actual - (35328.0)) <= Math.abs(35328.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0185 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP3_18600
     * @tc.name      testOffset0186
     * @tc.desc      Verify offset for 185 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0186 begin');
      const actual: number = MediaTools.getOffsetFromTime(185);
      expect(Math.abs(actual - (35520.0)) <= Math.abs(35520.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0186 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP3_18700
     * @tc.name      testOffset0187
     * @tc.desc      Verify offset for 186 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0187 begin');
      const actual: number = MediaTools.getOffsetFromTime(186);
      expect(Math.abs(actual - (35712.0)) <= Math.abs(35712.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0187 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP3_18800
     * @tc.name      testOffset0188
     * @tc.desc      Verify offset for 187 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0188 begin');
      const actual: number = MediaTools.getOffsetFromTime(187);
      expect(Math.abs(actual - (35904.0)) <= Math.abs(35904.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0188 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP3_18900
     * @tc.name      testOffset0189
     * @tc.desc      Verify offset for 188 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0189 begin');
      const actual: number = MediaTools.getOffsetFromTime(188);
      expect(Math.abs(actual - (36096.0)) <= Math.abs(36096.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0189 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP3_19000
     * @tc.name      testOffset0190
     * @tc.desc      Verify offset for 189 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0190 begin');
      const actual: number = MediaTools.getOffsetFromTime(189);
      expect(Math.abs(actual - (36288.0)) <= Math.abs(36288.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0190 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP3_19100
     * @tc.name      testOffset0191
     * @tc.desc      Verify offset for 190 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0191 begin');
      const actual: number = MediaTools.getOffsetFromTime(190);
      expect(Math.abs(actual - (36480.0)) <= Math.abs(36480.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0191 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP3_19200
     * @tc.name      testOffset0192
     * @tc.desc      Verify offset for 191 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0192 begin');
      const actual: number = MediaTools.getOffsetFromTime(191);
      expect(Math.abs(actual - (36672.0)) <= Math.abs(36672.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0192 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP3_19300
     * @tc.name      testOffset0193
     * @tc.desc      Verify offset for 192 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0193 begin');
      const actual: number = MediaTools.getOffsetFromTime(192);
      expect(Math.abs(actual - (36864.0)) <= Math.abs(36864.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0193 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP3_19400
     * @tc.name      testOffset0194
     * @tc.desc      Verify offset for 193 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0194 begin');
      const actual: number = MediaTools.getOffsetFromTime(193);
      expect(Math.abs(actual - (37056.0)) <= Math.abs(37056.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0194 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP3_19500
     * @tc.name      testOffset0195
     * @tc.desc      Verify offset for 194 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0195 begin');
      const actual: number = MediaTools.getOffsetFromTime(194);
      expect(Math.abs(actual - (37248.0)) <= Math.abs(37248.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0195 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP3_19600
     * @tc.name      testOffset0196
     * @tc.desc      Verify offset for 195 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0196 begin');
      const actual: number = MediaTools.getOffsetFromTime(195);
      expect(Math.abs(actual - (37440.0)) <= Math.abs(37440.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0196 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP3_19700
     * @tc.name      testOffset0197
     * @tc.desc      Verify offset for 196 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0197 begin');
      const actual: number = MediaTools.getOffsetFromTime(196);
      expect(Math.abs(actual - (37632.0)) <= Math.abs(37632.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0197 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP3_19800
     * @tc.name      testOffset0198
     * @tc.desc      Verify offset for 197 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0198 begin');
      const actual: number = MediaTools.getOffsetFromTime(197);
      expect(Math.abs(actual - (37824.0)) <= Math.abs(37824.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0198 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP3_19900
     * @tc.name      testOffset0199
     * @tc.desc      Verify offset for 198 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0199 begin');
      const actual: number = MediaTools.getOffsetFromTime(198);
      expect(Math.abs(actual - (38016.0)) <= Math.abs(38016.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0199 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP3_20000
     * @tc.name      testOffset0200
     * @tc.desc      Verify offset for 199 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0200 begin');
      const actual: number = MediaTools.getOffsetFromTime(199);
      expect(Math.abs(actual - (38208.0)) <= Math.abs(38208.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0200 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP3_20100
     * @tc.name      testOffset0201
     * @tc.desc      Verify offset for 200 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0201 begin');
      const actual: number = MediaTools.getOffsetFromTime(200);
      expect(Math.abs(actual - (38400.0)) <= Math.abs(38400.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0201 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP3_20200
     * @tc.name      testOffset0202
     * @tc.desc      Verify offset for 250 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0202 begin');
      const actual: number = MediaTools.getOffsetFromTime(250);
      expect(Math.abs(actual - (48000.0)) <= Math.abs(48000.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0202 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP3_20300
     * @tc.name      testOffset0203
     * @tc.desc      Verify offset for 500 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0203 begin');
      const actual: number = MediaTools.getOffsetFromTime(500);
      expect(Math.abs(actual - (96000.0)) <= Math.abs(96000.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0203 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP3_20400
     * @tc.name      testOffset0204
     * @tc.desc      Verify offset for 999 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0204 begin');
      const actual: number = MediaTools.getOffsetFromTime(999);
      expect(Math.abs(actual - (191808.0)) <= Math.abs(191808.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0204 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP3_20500
     * @tc.name      testOffset0205
     * @tc.desc      Verify offset for 1000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0205 begin');
      const actual: number = MediaTools.getOffsetFromTime(1000);
      expect(Math.abs(actual - (192000.0)) <= Math.abs(192000.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0205 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP3_20600
     * @tc.name      testOffset0206
     * @tc.desc      Verify offset for 1500 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0206 begin');
      const actual: number = MediaTools.getOffsetFromTime(1500);
      expect(Math.abs(actual - (288000.0)) <= Math.abs(288000.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0206 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP3_20700
     * @tc.name      testOffset0207
     * @tc.desc      Verify offset for 2000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0207 begin');
      const actual: number = MediaTools.getOffsetFromTime(2000);
      expect(Math.abs(actual - (384000.0)) <= Math.abs(384000.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0207 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP3_20800
     * @tc.name      testOffset0208
     * @tc.desc      Verify offset for 5000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0208 begin');
      const actual: number = MediaTools.getOffsetFromTime(5000);
      expect(Math.abs(actual - (960000.0)) <= Math.abs(960000.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0208 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP3_20900
     * @tc.name      testOffset0209
     * @tc.desc      Verify offset for 10000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0209 begin');
      const actual: number = MediaTools.getOffsetFromTime(10000);
      expect(Math.abs(actual - (1920000.0)) <= Math.abs(1920000.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0209 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP3_21000
     * @tc.name      testOffset0210
     * @tc.desc      Verify offset for 60000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0210 begin');
      const actual: number = MediaTools.getOffsetFromTime(60000);
      expect(Math.abs(actual - (11520000.0)) <= Math.abs(11520000.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0210 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP3_21100
     * @tc.name      testOffset0211
     * @tc.desc      Verify offset for 120000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0211 begin');
      const actual: number = MediaTools.getOffsetFromTime(120000);
      expect(Math.abs(actual - (23040000.0)) <= Math.abs(23040000.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0211 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP3_21200
     * @tc.name      testOffset0212
     * @tc.desc      Verify offset for 3600000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0212 begin');
      const actual: number = MediaTools.getOffsetFromTime(3600000);
      expect(Math.abs(actual - (691200000.0)) <= Math.abs(691200000.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0212 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP3_21300
     * @tc.name      testOffset0213
     * @tc.desc      Verify offset for 7200000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0213 begin');
      const actual: number = MediaTools.getOffsetFromTime(7200000);
      expect(Math.abs(actual - (1382400000.0)) <= Math.abs(1382400000.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0213 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP3_21400
     * @tc.name      testOffset0214
     * @tc.desc      Verify offset for 86400000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0214 begin');
      const actual: number = MediaTools.getOffsetFromTime(86400000);
      expect(Math.abs(actual - (16588800000.0)) <= Math.abs(16588800000.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0214 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP3_21500
     * @tc.name      testOffset0215
     * @tc.desc      Verify offset for 86461000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0215 begin');
      const actual: number = MediaTools.getOffsetFromTime(86461000);
      expect(Math.abs(actual - (16600512000.0)) <= Math.abs(16600512000.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0215 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP3_21600
     * @tc.name      testOffset0216
     * @tc.desc      Verify offset for 100000000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0216 begin');
      const actual: number = MediaTools.getOffsetFromTime(100000000);
      expect(Math.abs(actual - (19200000000.0)) <= Math.abs(19200000000.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0216 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP3_21700
     * @tc.name      testOffset0217
     * @tc.desc      Verify offset for 123456789 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0217 begin');
      const actual: number = MediaTools.getOffsetFromTime(123456789);
      expect(Math.abs(actual - (23703703488.0)) <= Math.abs(23703703488.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0217 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP3_21800
     * @tc.name      testOffset0218
     * @tc.desc      Verify offset for 999999999 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0218 begin');
      const actual: number = MediaTools.getOffsetFromTime(999999999);
      expect(Math.abs(actual - (191999999808.0)) <= Math.abs(191999999808.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0218 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP3_21900
     * @tc.name      testOffset0219
     * @tc.desc      Verify offset for 1000000000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0219 begin');
      const actual: number = MediaTools.getOffsetFromTime(1000000000);
      expect(Math.abs(actual - (192000000000.0)) <= Math.abs(192000000000.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0219 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP3_22000
     * @tc.name      testOffset0220
     * @tc.desc      Verify offset for 2000000000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0220 begin');
      const actual: number = MediaTools.getOffsetFromTime(2000000000);
      expect(Math.abs(actual - (384000000000.0)) <= Math.abs(384000000000.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0220 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP3_22100
     * @tc.name      testOffset0221
     * @tc.desc      Verify offset for 3000000000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0221 begin');
      const actual: number = MediaTools.getOffsetFromTime(3000000000);
      expect(Math.abs(actual - (576000000000.0)) <= Math.abs(576000000000.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0221 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP3_22200
     * @tc.name      testOffset0222
     * @tc.desc      Verify offset for 5000000000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0222 begin');
      const actual: number = MediaTools.getOffsetFromTime(5000000000);
      expect(Math.abs(actual - (960000000000.0)) <= Math.abs(960000000000.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0222 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP3_22300
     * @tc.name      testOffset0223
     * @tc.desc      Verify offset for 8640000000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0223 begin');
      const actual: number = MediaTools.getOffsetFromTime(8640000000);
      expect(Math.abs(actual - (1658880000000.0)) <= Math.abs(1658880000000.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0223 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP3_22400
     * @tc.name      testOffset0224
     * @tc.desc      Verify offset for 10000000000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0224 begin');
      const actual: number = MediaTools.getOffsetFromTime(10000000000);
      expect(Math.abs(actual - (1920000000000.0)) <= Math.abs(1920000000000.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0224 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP3_22500
     * @tc.name      testOffset0225
     * @tc.desc      Verify offset for 12345678901 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0225 begin');
      const actual: number = MediaTools.getOffsetFromTime(12345678901);
      expect(Math.abs(actual - (2370370348992.0)) <= Math.abs(2370370348992.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0225 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP3_22600
     * @tc.name      testOffset0226
     * @tc.desc      Verify offset for 20000000000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0226 begin');
      const actual: number = MediaTools.getOffsetFromTime(20000000000);
      expect(Math.abs(actual - (3840000000000.0)) <= Math.abs(3840000000000.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0226 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP3_22700
     * @tc.name      testOffset0227
     * @tc.desc      Verify offset for 50000000000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0227 begin');
      const actual: number = MediaTools.getOffsetFromTime(50000000000);
      expect(Math.abs(actual - (9600000000000.0)) <= Math.abs(9600000000000.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0227 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP3_22800
     * @tc.name      testOffset0228
     * @tc.desc      Verify offset for 99999999999 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0228 begin');
      const actual: number = MediaTools.getOffsetFromTime(99999999999);
      expect(Math.abs(actual - (19199999999808.0)) <= Math.abs(19199999999808.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0228 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP3_22900
     * @tc.name      testOffset0229
     * @tc.desc      Verify offset for 100000000000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0229 begin');
      const actual: number = MediaTools.getOffsetFromTime(100000000000);
      expect(Math.abs(actual - (19200000000000.0)) <= Math.abs(19200000000000.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0229 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP3_23000
     * @tc.name      testOffset0230
     * @tc.desc      Verify offset for 123456789012 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0230 begin');
      const actual: number = MediaTools.getOffsetFromTime(123456789012);
      expect(Math.abs(actual - (23703703490304.0)) <= Math.abs(23703703490304.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0230 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP3_23100
     * @tc.name      testOffset0231
     * @tc.desc      Verify offset for 200000000000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0231 begin');
      const actual: number = MediaTools.getOffsetFromTime(200000000000);
      expect(Math.abs(actual - (38400000000000.0)) <= Math.abs(38400000000000.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0231 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP3_23200
     * @tc.name      testOffset0232
     * @tc.desc      Verify offset for 500000000000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0232 begin');
      const actual: number = MediaTools.getOffsetFromTime(500000000000);
      expect(Math.abs(actual - (96000000000000.0)) <= Math.abs(96000000000000.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0232 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP3_23300
     * @tc.name      testOffset0233
     * @tc.desc      Verify offset for 999999999999 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0233 begin');
      const actual: number = MediaTools.getOffsetFromTime(999999999999);
      expect(Math.abs(actual - (191999999999808.0)) <= Math.abs(191999999999808.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0233 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP3_23400
     * @tc.name      testOffset0234
     * @tc.desc      Verify offset for 1000000000000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0234 begin');
      const actual: number = MediaTools.getOffsetFromTime(1000000000000);
      expect(Math.abs(actual - (192000000000000.0)) <= Math.abs(192000000000000.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0234 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP3_23500
     * @tc.name      testOffset0235
     * @tc.desc      Verify offset for 2000000000000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0235 begin');
      const actual: number = MediaTools.getOffsetFromTime(2000000000000);
      expect(Math.abs(actual - (384000000000000.0)) <= Math.abs(384000000000000.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0235 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP3_23600
     * @tc.name      testOffset0236
     * @tc.desc      Verify offset for 5000000000000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0236 begin');
      const actual: number = MediaTools.getOffsetFromTime(5000000000000);
      expect(Math.abs(actual - (960000000000000.0)) <= Math.abs(960000000000000.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0236 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP3_23700
     * @tc.name      testOffset0237
     * @tc.desc      Verify offset for 9999999999999 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0237 begin');
      const actual: number = MediaTools.getOffsetFromTime(9999999999999);
      expect(Math.abs(actual - (1919999999999808.0)) <= Math.abs(1919999999999808.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0237 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP3_23800
     * @tc.name      testOffset0238
     * @tc.desc      Verify offset for 10000000000000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0238 begin');
      const actual: number = MediaTools.getOffsetFromTime(10000000000000);
      expect(Math.abs(actual - (1920000000000000.0)) <= Math.abs(1920000000000000.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0238 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP3_23900
     * @tc.name      testOffset0239
     * @tc.desc      Verify offset for 12345678901234 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0239 begin');
      const actual: number = MediaTools.getOffsetFromTime(12345678901234);
      expect(Math.abs(actual - (2370370349036928.0)) <= Math.abs(2370370349036928.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0239 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP3_24000
     * @tc.name      testOffset0240
     * @tc.desc      Verify offset for 20000000000000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0240 begin');
      const actual: number = MediaTools.getOffsetFromTime(20000000000000);
      expect(Math.abs(actual - (3840000000000000.0)) <= Math.abs(3840000000000000.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0240 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP3_24100
     * @tc.name      testOffset0241
     * @tc.desc      Verify offset for 50000000000000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0241 begin');
      const actual: number = MediaTools.getOffsetFromTime(50000000000000);
      expect(Math.abs(actual - (9600000000000000.0)) <= Math.abs(9600000000000000.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0241 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP3_24200
     * @tc.name      testOffset0242
     * @tc.desc      Verify offset for 99999999999999 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0242 begin');
      const actual: number = MediaTools.getOffsetFromTime(99999999999999);
      expect(Math.abs(actual - (1.919999999999981e+16)) <= Math.abs(1.919999999999981e+16) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0242 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP3_24300
     * @tc.name      testOffset0243
     * @tc.desc      Verify offset for 100000000000000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0243 begin');
      const actual: number = MediaTools.getOffsetFromTime(100000000000000);
      expect(Math.abs(actual - (1.92e+16)) <= Math.abs(1.92e+16) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0243 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP3_24400
     * @tc.name      testOffset0244
     * @tc.desc      Verify offset for 200000000000000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0244 begin');
      const actual: number = MediaTools.getOffsetFromTime(200000000000000);
      expect(Math.abs(actual - (3.84e+16)) <= Math.abs(3.84e+16) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0244 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP3_24500
     * @tc.name      testOffset0245
     * @tc.desc      Verify offset for 500000000000000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0245 begin');
      const actual: number = MediaTools.getOffsetFromTime(500000000000000);
      expect(Math.abs(actual - (9.6e+16)) <= Math.abs(9.6e+16) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0245 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP3_24600
     * @tc.name      testOffset0246
     * @tc.desc      Verify offset for 999999999999999 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0246 begin');
      const actual: number = MediaTools.getOffsetFromTime(999999999999999);
      expect(Math.abs(actual - (1.919999999999998e+17)) <= Math.abs(1.919999999999998e+17) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0246 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP3_24700
     * @tc.name      testOffset0247
     * @tc.desc      Verify offset for 1000000000000000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0247 begin');
      const actual: number = MediaTools.getOffsetFromTime(1000000000000000);
      expect(Math.abs(actual - (1.92e+17)) <= Math.abs(1.92e+17) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0247 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP3_24800
     * @tc.name      testOffset0248
     * @tc.desc      Verify offset for 2000000000000000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0248 begin');
      const actual: number = MediaTools.getOffsetFromTime(2000000000000000);
      expect(Math.abs(actual - (3.84e+17)) <= Math.abs(3.84e+17) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0248 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP3_24900
     * @tc.name      testOffset0249
     * @tc.desc      Verify offset for 5000000000000000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0249 begin');
      const actual: number = MediaTools.getOffsetFromTime(5000000000000000);
      expect(Math.abs(actual - (9.6e+17)) <= Math.abs(9.6e+17) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0249 end');
    })

  })
}
