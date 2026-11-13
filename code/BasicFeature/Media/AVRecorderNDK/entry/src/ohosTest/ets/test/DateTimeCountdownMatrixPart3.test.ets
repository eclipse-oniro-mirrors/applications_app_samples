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

export default function DateTimeCountdownMatrixPart3Test(): void {
  describe('DateTimeCountdownMatrixPart3', () => {

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_18100
     * @tc.name      testCountdown0181
     * @tc.desc      Verify countdown text for 180 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0181 begin');
      expect(dateTime(180)).assertEqual('03:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0181 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_18200
     * @tc.name      testCountdown0182
     * @tc.desc      Verify countdown text for 181 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0182 begin');
      expect(dateTime(181)).assertEqual('03:01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0182 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_18300
     * @tc.name      testCountdown0183
     * @tc.desc      Verify countdown text for 182 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0183 begin');
      expect(dateTime(182)).assertEqual('03:02');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0183 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_18400
     * @tc.name      testCountdown0184
     * @tc.desc      Verify countdown text for 183 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0184 begin');
      expect(dateTime(183)).assertEqual('03:03');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0184 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_18500
     * @tc.name      testCountdown0185
     * @tc.desc      Verify countdown text for 184 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0185 begin');
      expect(dateTime(184)).assertEqual('03:04');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0185 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_18600
     * @tc.name      testCountdown0186
     * @tc.desc      Verify countdown text for 185 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0186 begin');
      expect(dateTime(185)).assertEqual('03:05');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0186 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_18700
     * @tc.name      testCountdown0187
     * @tc.desc      Verify countdown text for 186 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0187 begin');
      expect(dateTime(186)).assertEqual('03:06');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0187 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_18800
     * @tc.name      testCountdown0188
     * @tc.desc      Verify countdown text for 187 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0188 begin');
      expect(dateTime(187)).assertEqual('03:07');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0188 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_18900
     * @tc.name      testCountdown0189
     * @tc.desc      Verify countdown text for 188 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0189 begin');
      expect(dateTime(188)).assertEqual('03:08');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0189 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_19000
     * @tc.name      testCountdown0190
     * @tc.desc      Verify countdown text for 189 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0190 begin');
      expect(dateTime(189)).assertEqual('03:09');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0190 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_19100
     * @tc.name      testCountdown0191
     * @tc.desc      Verify countdown text for 190 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0191 begin');
      expect(dateTime(190)).assertEqual('03:10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0191 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_19200
     * @tc.name      testCountdown0192
     * @tc.desc      Verify countdown text for 191 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0192 begin');
      expect(dateTime(191)).assertEqual('03:11');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0192 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_19300
     * @tc.name      testCountdown0193
     * @tc.desc      Verify countdown text for 192 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0193 begin');
      expect(dateTime(192)).assertEqual('03:12');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0193 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_19400
     * @tc.name      testCountdown0194
     * @tc.desc      Verify countdown text for 193 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0194 begin');
      expect(dateTime(193)).assertEqual('03:13');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0194 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_19500
     * @tc.name      testCountdown0195
     * @tc.desc      Verify countdown text for 194 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0195 begin');
      expect(dateTime(194)).assertEqual('03:14');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0195 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_19600
     * @tc.name      testCountdown0196
     * @tc.desc      Verify countdown text for 195 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0196 begin');
      expect(dateTime(195)).assertEqual('03:15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0196 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_19700
     * @tc.name      testCountdown0197
     * @tc.desc      Verify countdown text for 196 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0197 begin');
      expect(dateTime(196)).assertEqual('03:16');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0197 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_19800
     * @tc.name      testCountdown0198
     * @tc.desc      Verify countdown text for 197 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0198 begin');
      expect(dateTime(197)).assertEqual('03:17');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0198 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_19900
     * @tc.name      testCountdown0199
     * @tc.desc      Verify countdown text for 198 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0199 begin');
      expect(dateTime(198)).assertEqual('03:18');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0199 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_20000
     * @tc.name      testCountdown0200
     * @tc.desc      Verify countdown text for 199 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0200 begin');
      expect(dateTime(199)).assertEqual('03:19');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0200 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_20100
     * @tc.name      testCountdown0201
     * @tc.desc      Verify countdown text for 200 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0201 begin');
      expect(dateTime(200)).assertEqual('03:20');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0201 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_20200
     * @tc.name      testCountdown0202
     * @tc.desc      Verify countdown text for 201 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0202 begin');
      expect(dateTime(201)).assertEqual('03:21');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0202 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_20300
     * @tc.name      testCountdown0203
     * @tc.desc      Verify countdown text for 202 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0203 begin');
      expect(dateTime(202)).assertEqual('03:22');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0203 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_20400
     * @tc.name      testCountdown0204
     * @tc.desc      Verify countdown text for 203 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0204 begin');
      expect(dateTime(203)).assertEqual('03:23');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0204 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_20500
     * @tc.name      testCountdown0205
     * @tc.desc      Verify countdown text for 204 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0205 begin');
      expect(dateTime(204)).assertEqual('03:24');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0205 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_20600
     * @tc.name      testCountdown0206
     * @tc.desc      Verify countdown text for 205 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0206 begin');
      expect(dateTime(205)).assertEqual('03:25');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0206 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_20700
     * @tc.name      testCountdown0207
     * @tc.desc      Verify countdown text for 206 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0207 begin');
      expect(dateTime(206)).assertEqual('03:26');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0207 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_20800
     * @tc.name      testCountdown0208
     * @tc.desc      Verify countdown text for 207 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0208 begin');
      expect(dateTime(207)).assertEqual('03:27');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0208 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_20900
     * @tc.name      testCountdown0209
     * @tc.desc      Verify countdown text for 208 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0209 begin');
      expect(dateTime(208)).assertEqual('03:28');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0209 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_21000
     * @tc.name      testCountdown0210
     * @tc.desc      Verify countdown text for 209 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0210 begin');
      expect(dateTime(209)).assertEqual('03:29');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0210 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_21100
     * @tc.name      testCountdown0211
     * @tc.desc      Verify countdown text for 210 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0211 begin');
      expect(dateTime(210)).assertEqual('03:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0211 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_21200
     * @tc.name      testCountdown0212
     * @tc.desc      Verify countdown text for 211 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0212 begin');
      expect(dateTime(211)).assertEqual('03:31');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0212 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_21300
     * @tc.name      testCountdown0213
     * @tc.desc      Verify countdown text for 212 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0213 begin');
      expect(dateTime(212)).assertEqual('03:32');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0213 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_21400
     * @tc.name      testCountdown0214
     * @tc.desc      Verify countdown text for 213 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0214 begin');
      expect(dateTime(213)).assertEqual('03:33');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0214 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_21500
     * @tc.name      testCountdown0215
     * @tc.desc      Verify countdown text for 214 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0215 begin');
      expect(dateTime(214)).assertEqual('03:34');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0215 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_21600
     * @tc.name      testCountdown0216
     * @tc.desc      Verify countdown text for 215 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0216 begin');
      expect(dateTime(215)).assertEqual('03:35');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0216 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_21700
     * @tc.name      testCountdown0217
     * @tc.desc      Verify countdown text for 216 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0217 begin');
      expect(dateTime(216)).assertEqual('03:36');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0217 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_21800
     * @tc.name      testCountdown0218
     * @tc.desc      Verify countdown text for 217 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0218 begin');
      expect(dateTime(217)).assertEqual('03:37');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0218 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_21900
     * @tc.name      testCountdown0219
     * @tc.desc      Verify countdown text for 218 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0219 begin');
      expect(dateTime(218)).assertEqual('03:38');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0219 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_22000
     * @tc.name      testCountdown0220
     * @tc.desc      Verify countdown text for 219 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0220 begin');
      expect(dateTime(219)).assertEqual('03:39');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0220 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_22100
     * @tc.name      testCountdown0221
     * @tc.desc      Verify countdown text for 220 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0221 begin');
      expect(dateTime(220)).assertEqual('03:40');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0221 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_22200
     * @tc.name      testCountdown0222
     * @tc.desc      Verify countdown text for 221 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0222 begin');
      expect(dateTime(221)).assertEqual('03:41');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0222 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_22300
     * @tc.name      testCountdown0223
     * @tc.desc      Verify countdown text for 222 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0223 begin');
      expect(dateTime(222)).assertEqual('03:42');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0223 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_22400
     * @tc.name      testCountdown0224
     * @tc.desc      Verify countdown text for 223 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0224 begin');
      expect(dateTime(223)).assertEqual('03:43');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0224 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_22500
     * @tc.name      testCountdown0225
     * @tc.desc      Verify countdown text for 224 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0225 begin');
      expect(dateTime(224)).assertEqual('03:44');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0225 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_22600
     * @tc.name      testCountdown0226
     * @tc.desc      Verify countdown text for 225 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0226 begin');
      expect(dateTime(225)).assertEqual('03:45');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0226 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_22700
     * @tc.name      testCountdown0227
     * @tc.desc      Verify countdown text for 226 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0227 begin');
      expect(dateTime(226)).assertEqual('03:46');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0227 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_22800
     * @tc.name      testCountdown0228
     * @tc.desc      Verify countdown text for 227 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0228 begin');
      expect(dateTime(227)).assertEqual('03:47');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0228 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_22900
     * @tc.name      testCountdown0229
     * @tc.desc      Verify countdown text for 228 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0229 begin');
      expect(dateTime(228)).assertEqual('03:48');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0229 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_23000
     * @tc.name      testCountdown0230
     * @tc.desc      Verify countdown text for 229 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0230 begin');
      expect(dateTime(229)).assertEqual('03:49');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0230 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_23100
     * @tc.name      testCountdown0231
     * @tc.desc      Verify countdown text for 230 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0231 begin');
      expect(dateTime(230)).assertEqual('03:50');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0231 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_23200
     * @tc.name      testCountdown0232
     * @tc.desc      Verify countdown text for 231 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0232 begin');
      expect(dateTime(231)).assertEqual('03:51');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0232 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_23300
     * @tc.name      testCountdown0233
     * @tc.desc      Verify countdown text for 232 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0233 begin');
      expect(dateTime(232)).assertEqual('03:52');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0233 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_23400
     * @tc.name      testCountdown0234
     * @tc.desc      Verify countdown text for 233 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0234 begin');
      expect(dateTime(233)).assertEqual('03:53');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0234 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_23500
     * @tc.name      testCountdown0235
     * @tc.desc      Verify countdown text for 234 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0235 begin');
      expect(dateTime(234)).assertEqual('03:54');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0235 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_23600
     * @tc.name      testCountdown0236
     * @tc.desc      Verify countdown text for 235 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0236 begin');
      expect(dateTime(235)).assertEqual('03:55');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0236 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_23700
     * @tc.name      testCountdown0237
     * @tc.desc      Verify countdown text for 236 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0237 begin');
      expect(dateTime(236)).assertEqual('03:56');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0237 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_23800
     * @tc.name      testCountdown0238
     * @tc.desc      Verify countdown text for 237 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0238 begin');
      expect(dateTime(237)).assertEqual('03:57');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0238 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_23900
     * @tc.name      testCountdown0239
     * @tc.desc      Verify countdown text for 238 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0239 begin');
      expect(dateTime(238)).assertEqual('03:58');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0239 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_24000
     * @tc.name      testCountdown0240
     * @tc.desc      Verify countdown text for 239 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0240 begin');
      expect(dateTime(239)).assertEqual('03:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0240 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_24100
     * @tc.name      testCountdown0241
     * @tc.desc      Verify countdown text for 240 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0241 begin');
      expect(dateTime(240)).assertEqual('04:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0241 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_24200
     * @tc.name      testCountdown0242
     * @tc.desc      Verify countdown text for 241 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0242 begin');
      expect(dateTime(241)).assertEqual('04:01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0242 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_24300
     * @tc.name      testCountdown0243
     * @tc.desc      Verify countdown text for 242 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0243 begin');
      expect(dateTime(242)).assertEqual('04:02');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0243 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_24400
     * @tc.name      testCountdown0244
     * @tc.desc      Verify countdown text for 243 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0244 begin');
      expect(dateTime(243)).assertEqual('04:03');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0244 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_24500
     * @tc.name      testCountdown0245
     * @tc.desc      Verify countdown text for 244 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0245 begin');
      expect(dateTime(244)).assertEqual('04:04');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0245 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_24600
     * @tc.name      testCountdown0246
     * @tc.desc      Verify countdown text for 245 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0246 begin');
      expect(dateTime(245)).assertEqual('04:05');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0246 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_24700
     * @tc.name      testCountdown0247
     * @tc.desc      Verify countdown text for 246 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0247 begin');
      expect(dateTime(246)).assertEqual('04:06');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0247 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_24800
     * @tc.name      testCountdown0248
     * @tc.desc      Verify countdown text for 247 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0248 begin');
      expect(dateTime(247)).assertEqual('04:07');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0248 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_24900
     * @tc.name      testCountdown0249
     * @tc.desc      Verify countdown text for 248 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0249 begin');
      expect(dateTime(248)).assertEqual('04:08');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0249 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_25000
     * @tc.name      testCountdown0250
     * @tc.desc      Verify countdown text for 249 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0250 begin');
      expect(dateTime(249)).assertEqual('04:09');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0250 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_25100
     * @tc.name      testCountdown0251
     * @tc.desc      Verify countdown text for 250 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0251 begin');
      expect(dateTime(250)).assertEqual('04:10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0251 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_25200
     * @tc.name      testCountdown0252
     * @tc.desc      Verify countdown text for 251 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0252 begin');
      expect(dateTime(251)).assertEqual('04:11');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0252 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_25300
     * @tc.name      testCountdown0253
     * @tc.desc      Verify countdown text for 252 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0253 begin');
      expect(dateTime(252)).assertEqual('04:12');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0253 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_25400
     * @tc.name      testCountdown0254
     * @tc.desc      Verify countdown text for 253 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0254 begin');
      expect(dateTime(253)).assertEqual('04:13');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0254 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_25500
     * @tc.name      testCountdown0255
     * @tc.desc      Verify countdown text for 254 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0255 begin');
      expect(dateTime(254)).assertEqual('04:14');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0255 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_25600
     * @tc.name      testCountdown0256
     * @tc.desc      Verify countdown text for 255 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0256 begin');
      expect(dateTime(255)).assertEqual('04:15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0256 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_25700
     * @tc.name      testCountdown0257
     * @tc.desc      Verify countdown text for 256 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0257 begin');
      expect(dateTime(256)).assertEqual('04:16');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0257 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_25800
     * @tc.name      testCountdown0258
     * @tc.desc      Verify countdown text for 257 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0258 begin');
      expect(dateTime(257)).assertEqual('04:17');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0258 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_25900
     * @tc.name      testCountdown0259
     * @tc.desc      Verify countdown text for 258 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0259 begin');
      expect(dateTime(258)).assertEqual('04:18');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0259 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_26000
     * @tc.name      testCountdown0260
     * @tc.desc      Verify countdown text for 259 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0260', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0260 begin');
      expect(dateTime(259)).assertEqual('04:19');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0260 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_26100
     * @tc.name      testCountdown0261
     * @tc.desc      Verify countdown text for 260 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0261', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0261 begin');
      expect(dateTime(260)).assertEqual('04:20');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0261 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_26200
     * @tc.name      testCountdown0262
     * @tc.desc      Verify countdown text for 261 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0262', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0262 begin');
      expect(dateTime(261)).assertEqual('04:21');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0262 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_26300
     * @tc.name      testCountdown0263
     * @tc.desc      Verify countdown text for 262 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0263', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0263 begin');
      expect(dateTime(262)).assertEqual('04:22');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0263 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_26400
     * @tc.name      testCountdown0264
     * @tc.desc      Verify countdown text for 263 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0264', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0264 begin');
      expect(dateTime(263)).assertEqual('04:23');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0264 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_26500
     * @tc.name      testCountdown0265
     * @tc.desc      Verify countdown text for 264 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0265', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0265 begin');
      expect(dateTime(264)).assertEqual('04:24');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0265 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_26600
     * @tc.name      testCountdown0266
     * @tc.desc      Verify countdown text for 265 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0266', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0266 begin');
      expect(dateTime(265)).assertEqual('04:25');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0266 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_26700
     * @tc.name      testCountdown0267
     * @tc.desc      Verify countdown text for 266 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0267', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0267 begin');
      expect(dateTime(266)).assertEqual('04:26');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0267 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_26800
     * @tc.name      testCountdown0268
     * @tc.desc      Verify countdown text for 267 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0268', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0268 begin');
      expect(dateTime(267)).assertEqual('04:27');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0268 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_26900
     * @tc.name      testCountdown0269
     * @tc.desc      Verify countdown text for 268 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0269', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0269 begin');
      expect(dateTime(268)).assertEqual('04:28');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0269 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP3_27000
     * @tc.name      testCountdown0270
     * @tc.desc      Verify countdown text for 269 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0270', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0270 begin');
      expect(dateTime(269)).assertEqual('04:29');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0270 end');
    })

  })
}
