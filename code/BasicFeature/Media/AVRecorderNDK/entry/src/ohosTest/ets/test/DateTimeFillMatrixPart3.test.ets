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

export default function DateTimeFillMatrixPart3Test(): void {
  describe('DateTimeFillMatrixPart3', () => {

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_18100
     * @tc.name      testFill0181
     * @tc.desc      Verify validate fill value 180.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0181 begin');
      expect(util.fill(180)).assertEqual('180');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0181 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_18200
     * @tc.name      testFill0182
     * @tc.desc      Verify validate fill value 181.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0182 begin');
      expect(util.fill(181)).assertEqual('181');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0182 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_18300
     * @tc.name      testFill0183
     * @tc.desc      Verify validate fill value 182.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0183 begin');
      expect(util.fill(182)).assertEqual('182');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0183 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_18400
     * @tc.name      testFill0184
     * @tc.desc      Verify validate fill value 183.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0184 begin');
      expect(util.fill(183)).assertEqual('183');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0184 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_18500
     * @tc.name      testFill0185
     * @tc.desc      Verify validate fill value 184.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0185 begin');
      expect(util.fill(184)).assertEqual('184');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0185 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_18600
     * @tc.name      testFill0186
     * @tc.desc      Verify validate fill value 185.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0186 begin');
      expect(util.fill(185)).assertEqual('185');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0186 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_18700
     * @tc.name      testFill0187
     * @tc.desc      Verify validate fill value 186.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0187 begin');
      expect(util.fill(186)).assertEqual('186');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0187 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_18800
     * @tc.name      testFill0188
     * @tc.desc      Verify validate fill value 187.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0188 begin');
      expect(util.fill(187)).assertEqual('187');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0188 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_18900
     * @tc.name      testFill0189
     * @tc.desc      Verify validate fill value 188.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0189 begin');
      expect(util.fill(188)).assertEqual('188');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0189 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_19000
     * @tc.name      testFill0190
     * @tc.desc      Verify validate fill value 189.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0190 begin');
      expect(util.fill(189)).assertEqual('189');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0190 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_19100
     * @tc.name      testFill0191
     * @tc.desc      Verify validate fill value 190.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0191 begin');
      expect(util.fill(190)).assertEqual('190');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0191 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_19200
     * @tc.name      testFill0192
     * @tc.desc      Verify validate fill value 191.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0192 begin');
      expect(util.fill(191)).assertEqual('191');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0192 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_19300
     * @tc.name      testFill0193
     * @tc.desc      Verify validate fill value 192.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0193 begin');
      expect(util.fill(192)).assertEqual('192');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0193 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_19400
     * @tc.name      testFill0194
     * @tc.desc      Verify validate fill value 193.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0194 begin');
      expect(util.fill(193)).assertEqual('193');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0194 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_19500
     * @tc.name      testFill0195
     * @tc.desc      Verify validate fill value 194.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0195 begin');
      expect(util.fill(194)).assertEqual('194');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0195 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_19600
     * @tc.name      testFill0196
     * @tc.desc      Verify validate fill value 195.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0196 begin');
      expect(util.fill(195)).assertEqual('195');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0196 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_19700
     * @tc.name      testFill0197
     * @tc.desc      Verify validate fill value 196.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0197 begin');
      expect(util.fill(196)).assertEqual('196');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0197 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_19800
     * @tc.name      testFill0198
     * @tc.desc      Verify validate fill value 197.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0198 begin');
      expect(util.fill(197)).assertEqual('197');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0198 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_19900
     * @tc.name      testFill0199
     * @tc.desc      Verify validate fill value 198.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0199 begin');
      expect(util.fill(198)).assertEqual('198');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0199 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_20000
     * @tc.name      testFill0200
     * @tc.desc      Verify validate fill value 199.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0200 begin');
      expect(util.fill(199)).assertEqual('199');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0200 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_20100
     * @tc.name      testFill0201
     * @tc.desc      Verify validate fill value 200.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0201 begin');
      expect(util.fill(200)).assertEqual('200');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0201 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_20200
     * @tc.name      testFill0202
     * @tc.desc      Verify validate fill value 201.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0202 begin');
      expect(util.fill(201)).assertEqual('201');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0202 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_20300
     * @tc.name      testFill0203
     * @tc.desc      Verify validate fill value 202.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0203 begin');
      expect(util.fill(202)).assertEqual('202');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0203 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_20400
     * @tc.name      testFill0204
     * @tc.desc      Verify validate fill value 203.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0204 begin');
      expect(util.fill(203)).assertEqual('203');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0204 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_20500
     * @tc.name      testFill0205
     * @tc.desc      Verify validate fill value 204.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0205 begin');
      expect(util.fill(204)).assertEqual('204');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0205 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_20600
     * @tc.name      testFill0206
     * @tc.desc      Verify validate fill value 205.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0206 begin');
      expect(util.fill(205)).assertEqual('205');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0206 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_20700
     * @tc.name      testFill0207
     * @tc.desc      Verify validate fill value 206.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0207 begin');
      expect(util.fill(206)).assertEqual('206');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0207 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_20800
     * @tc.name      testFill0208
     * @tc.desc      Verify validate fill value 207.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0208 begin');
      expect(util.fill(207)).assertEqual('207');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0208 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_20900
     * @tc.name      testFill0209
     * @tc.desc      Verify validate fill value 208.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0209 begin');
      expect(util.fill(208)).assertEqual('208');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0209 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_21000
     * @tc.name      testFill0210
     * @tc.desc      Verify validate fill value 209.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0210 begin');
      expect(util.fill(209)).assertEqual('209');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0210 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_21100
     * @tc.name      testFill0211
     * @tc.desc      Verify validate fill value 210.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0211 begin');
      expect(util.fill(210)).assertEqual('210');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0211 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_21200
     * @tc.name      testFill0212
     * @tc.desc      Verify validate fill value 211.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0212 begin');
      expect(util.fill(211)).assertEqual('211');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0212 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_21300
     * @tc.name      testFill0213
     * @tc.desc      Verify validate fill value 212.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0213 begin');
      expect(util.fill(212)).assertEqual('212');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0213 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_21400
     * @tc.name      testFill0214
     * @tc.desc      Verify validate fill value 213.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0214 begin');
      expect(util.fill(213)).assertEqual('213');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0214 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_21500
     * @tc.name      testFill0215
     * @tc.desc      Verify validate fill value 214.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0215 begin');
      expect(util.fill(214)).assertEqual('214');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0215 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_21600
     * @tc.name      testFill0216
     * @tc.desc      Verify validate fill value 215.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0216 begin');
      expect(util.fill(215)).assertEqual('215');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0216 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_21700
     * @tc.name      testFill0217
     * @tc.desc      Verify validate fill value 216.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0217 begin');
      expect(util.fill(216)).assertEqual('216');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0217 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_21800
     * @tc.name      testFill0218
     * @tc.desc      Verify validate fill value 217.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0218 begin');
      expect(util.fill(217)).assertEqual('217');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0218 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_21900
     * @tc.name      testFill0219
     * @tc.desc      Verify validate fill value 218.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0219 begin');
      expect(util.fill(218)).assertEqual('218');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0219 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_22000
     * @tc.name      testFill0220
     * @tc.desc      Verify validate fill value 219.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0220 begin');
      expect(util.fill(219)).assertEqual('219');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0220 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_22100
     * @tc.name      testFill0221
     * @tc.desc      Verify validate fill value 220.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0221 begin');
      expect(util.fill(220)).assertEqual('220');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0221 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_22200
     * @tc.name      testFill0222
     * @tc.desc      Verify validate fill value 221.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0222 begin');
      expect(util.fill(221)).assertEqual('221');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0222 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_22300
     * @tc.name      testFill0223
     * @tc.desc      Verify validate fill value 222.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0223 begin');
      expect(util.fill(222)).assertEqual('222');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0223 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_22400
     * @tc.name      testFill0224
     * @tc.desc      Verify validate fill value 223.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0224 begin');
      expect(util.fill(223)).assertEqual('223');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0224 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_22500
     * @tc.name      testFill0225
     * @tc.desc      Verify validate fill value 224.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0225 begin');
      expect(util.fill(224)).assertEqual('224');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0225 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_22600
     * @tc.name      testFill0226
     * @tc.desc      Verify validate fill value 225.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0226 begin');
      expect(util.fill(225)).assertEqual('225');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0226 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_22700
     * @tc.name      testFill0227
     * @tc.desc      Verify validate fill value 226.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0227 begin');
      expect(util.fill(226)).assertEqual('226');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0227 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_22800
     * @tc.name      testFill0228
     * @tc.desc      Verify validate fill value 227.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0228 begin');
      expect(util.fill(227)).assertEqual('227');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0228 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_22900
     * @tc.name      testFill0229
     * @tc.desc      Verify validate fill value 228.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0229 begin');
      expect(util.fill(228)).assertEqual('228');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0229 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_23000
     * @tc.name      testFill0230
     * @tc.desc      Verify validate fill value 229.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0230 begin');
      expect(util.fill(229)).assertEqual('229');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0230 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_23100
     * @tc.name      testFill0231
     * @tc.desc      Verify validate fill value 230.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0231 begin');
      expect(util.fill(230)).assertEqual('230');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0231 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_23200
     * @tc.name      testFill0232
     * @tc.desc      Verify validate fill value 231.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0232 begin');
      expect(util.fill(231)).assertEqual('231');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0232 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_23300
     * @tc.name      testFill0233
     * @tc.desc      Verify validate fill value 232.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0233 begin');
      expect(util.fill(232)).assertEqual('232');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0233 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_23400
     * @tc.name      testFill0234
     * @tc.desc      Verify validate fill value 233.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0234 begin');
      expect(util.fill(233)).assertEqual('233');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0234 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_23500
     * @tc.name      testFill0235
     * @tc.desc      Verify validate fill value 234.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0235 begin');
      expect(util.fill(234)).assertEqual('234');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0235 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_23600
     * @tc.name      testFill0236
     * @tc.desc      Verify validate fill value 235.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0236 begin');
      expect(util.fill(235)).assertEqual('235');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0236 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_23700
     * @tc.name      testFill0237
     * @tc.desc      Verify validate fill value 236.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0237 begin');
      expect(util.fill(236)).assertEqual('236');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0237 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_23800
     * @tc.name      testFill0238
     * @tc.desc      Verify validate fill value 237.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0238 begin');
      expect(util.fill(237)).assertEqual('237');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0238 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_23900
     * @tc.name      testFill0239
     * @tc.desc      Verify validate fill value 238.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0239 begin');
      expect(util.fill(238)).assertEqual('238');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0239 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_24000
     * @tc.name      testFill0240
     * @tc.desc      Verify validate fill value 239.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0240 begin');
      expect(util.fill(239)).assertEqual('239');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0240 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_24100
     * @tc.name      testFill0241
     * @tc.desc      Verify validate fill value 240.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0241 begin');
      expect(util.fill(240)).assertEqual('240');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0241 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_24200
     * @tc.name      testFill0242
     * @tc.desc      Verify validate fill value 241.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0242 begin');
      expect(util.fill(241)).assertEqual('241');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0242 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_24300
     * @tc.name      testFill0243
     * @tc.desc      Verify validate fill value 242.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0243 begin');
      expect(util.fill(242)).assertEqual('242');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0243 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_24400
     * @tc.name      testFill0244
     * @tc.desc      Verify validate fill value 243.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0244 begin');
      expect(util.fill(243)).assertEqual('243');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0244 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_24500
     * @tc.name      testFill0245
     * @tc.desc      Verify validate fill value 244.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0245 begin');
      expect(util.fill(244)).assertEqual('244');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0245 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_24600
     * @tc.name      testFill0246
     * @tc.desc      Verify validate fill value 245.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0246 begin');
      expect(util.fill(245)).assertEqual('245');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0246 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_24700
     * @tc.name      testFill0247
     * @tc.desc      Verify validate fill value 246.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0247 begin');
      expect(util.fill(246)).assertEqual('246');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0247 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_24800
     * @tc.name      testFill0248
     * @tc.desc      Verify validate fill value 247.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0248 begin');
      expect(util.fill(247)).assertEqual('247');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0248 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_24900
     * @tc.name      testFill0249
     * @tc.desc      Verify validate fill value 248.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0249 begin');
      expect(util.fill(248)).assertEqual('248');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0249 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_25000
     * @tc.name      testFill0250
     * @tc.desc      Verify validate fill value 249.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0250 begin');
      expect(util.fill(249)).assertEqual('249');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0250 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_25100
     * @tc.name      testFill0251
     * @tc.desc      Verify validate fill value 250.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0251 begin');
      expect(util.fill(250)).assertEqual('250');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0251 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_25200
     * @tc.name      testFill0252
     * @tc.desc      Verify validate fill value 251.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0252 begin');
      expect(util.fill(251)).assertEqual('251');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0252 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_25300
     * @tc.name      testFill0253
     * @tc.desc      Verify validate fill value 252.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0253 begin');
      expect(util.fill(252)).assertEqual('252');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0253 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_25400
     * @tc.name      testFill0254
     * @tc.desc      Verify validate fill value 253.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0254 begin');
      expect(util.fill(253)).assertEqual('253');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0254 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_25500
     * @tc.name      testFill0255
     * @tc.desc      Verify validate fill value 254.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0255 begin');
      expect(util.fill(254)).assertEqual('254');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0255 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_25600
     * @tc.name      testFill0256
     * @tc.desc      Verify validate fill value 255.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0256 begin');
      expect(util.fill(255)).assertEqual('255');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0256 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_25700
     * @tc.name      testFill0257
     * @tc.desc      Verify validate fill value 256.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0257 begin');
      expect(util.fill(256)).assertEqual('256');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0257 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_25800
     * @tc.name      testFill0258
     * @tc.desc      Verify validate fill value 257.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0258 begin');
      expect(util.fill(257)).assertEqual('257');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0258 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_25900
     * @tc.name      testFill0259
     * @tc.desc      Verify validate fill value 258.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0259 begin');
      expect(util.fill(258)).assertEqual('258');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0259 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_26000
     * @tc.name      testFill0260
     * @tc.desc      Verify validate fill value 259.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0260', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0260 begin');
      expect(util.fill(259)).assertEqual('259');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0260 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_26100
     * @tc.name      testFill0261
     * @tc.desc      Verify validate fill value 260.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0261', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0261 begin');
      expect(util.fill(260)).assertEqual('260');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0261 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_26200
     * @tc.name      testFill0262
     * @tc.desc      Verify validate fill value 261.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0262', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0262 begin');
      expect(util.fill(261)).assertEqual('261');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0262 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_26300
     * @tc.name      testFill0263
     * @tc.desc      Verify validate fill value 262.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0263', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0263 begin');
      expect(util.fill(262)).assertEqual('262');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0263 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_26400
     * @tc.name      testFill0264
     * @tc.desc      Verify validate fill value 263.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0264', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0264 begin');
      expect(util.fill(263)).assertEqual('263');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0264 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_26500
     * @tc.name      testFill0265
     * @tc.desc      Verify validate fill value 264.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0265', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0265 begin');
      expect(util.fill(264)).assertEqual('264');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0265 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_26600
     * @tc.name      testFill0266
     * @tc.desc      Verify validate fill value 265.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0266', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0266 begin');
      expect(util.fill(265)).assertEqual('265');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0266 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_26700
     * @tc.name      testFill0267
     * @tc.desc      Verify validate fill value 266.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0267', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0267 begin');
      expect(util.fill(266)).assertEqual('266');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0267 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_26800
     * @tc.name      testFill0268
     * @tc.desc      Verify validate fill value 267.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0268', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0268 begin');
      expect(util.fill(267)).assertEqual('267');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0268 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_26900
     * @tc.name      testFill0269
     * @tc.desc      Verify validate fill value 268.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0269', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0269 begin');
      expect(util.fill(268)).assertEqual('268');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0269 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP3_27000
     * @tc.name      testFill0270
     * @tc.desc      Verify validate fill value 269.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0270', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0270 begin');
      expect(util.fill(269)).assertEqual('269');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0270 end');
    })

  })
}
