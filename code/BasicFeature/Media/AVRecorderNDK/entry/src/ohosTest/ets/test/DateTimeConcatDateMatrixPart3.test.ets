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

export default function DateTimeConcatDateMatrixPart3Test(): void {
  describe('DateTimeConcatDateMatrixPart3', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })


    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_0100
     * @tc.name      testConcatDate0181
     * @tc.desc      Verify date composition 2025-9-10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0181 begin');
      expect(util.concatDate(2025, 9, 10)).assertEqual('2025910');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0181 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_0200
     * @tc.name      testConcatDate0182
     * @tc.desc      Verify date composition 2025-9-11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0182 begin');
      expect(util.concatDate(2025, 9, 11)).assertEqual('2025911');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0182 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_0300
     * @tc.name      testConcatDate0183
     * @tc.desc      Verify date composition 2025-9-15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0183 begin');
      expect(util.concatDate(2025, 9, 15)).assertEqual('2025915');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0183 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_0400
     * @tc.name      testConcatDate0184
     * @tc.desc      Verify date composition 2025-9-20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0184 begin');
      expect(util.concatDate(2025, 9, 20)).assertEqual('2025920');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0184 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_0500
     * @tc.name      testConcatDate0185
     * @tc.desc      Verify date composition 2025-9-25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0185 begin');
      expect(util.concatDate(2025, 9, 25)).assertEqual('2025925');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0185 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_0600
     * @tc.name      testConcatDate0186
     * @tc.desc      Verify date composition 2025-9-28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0186 begin');
      expect(util.concatDate(2025, 9, 28)).assertEqual('2025928');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0186 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_0700
     * @tc.name      testConcatDate0187
     * @tc.desc      Verify date composition 2025-9-29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0187 begin');
      expect(util.concatDate(2025, 9, 29)).assertEqual('2025929');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0187 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_0800
     * @tc.name      testConcatDate0188
     * @tc.desc      Verify date composition 2025-9-30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0188 begin');
      expect(util.concatDate(2025, 9, 30)).assertEqual('2025930');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0188 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_0900
     * @tc.name      testConcatDate0189
     * @tc.desc      Verify date composition 2025-9-31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0189 begin');
      expect(util.concatDate(2025, 9, 31)).assertEqual('2025931');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0189 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_1000
     * @tc.name      testConcatDate0190
     * @tc.desc      Verify date composition 2025-10-10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0190 begin');
      expect(util.concatDate(2025, 10, 10)).assertEqual('20251010');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0190 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_1100
     * @tc.name      testConcatDate0191
     * @tc.desc      Verify date composition 2025-10-11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0191 begin');
      expect(util.concatDate(2025, 10, 11)).assertEqual('20251011');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0191 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_1200
     * @tc.name      testConcatDate0192
     * @tc.desc      Verify date composition 2025-10-15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0192 begin');
      expect(util.concatDate(2025, 10, 15)).assertEqual('20251015');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0192 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_1300
     * @tc.name      testConcatDate0193
     * @tc.desc      Verify date composition 2025-10-20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0193 begin');
      expect(util.concatDate(2025, 10, 20)).assertEqual('20251020');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0193 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_1400
     * @tc.name      testConcatDate0194
     * @tc.desc      Verify date composition 2025-10-25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0194 begin');
      expect(util.concatDate(2025, 10, 25)).assertEqual('20251025');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0194 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_1500
     * @tc.name      testConcatDate0195
     * @tc.desc      Verify date composition 2025-10-28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0195 begin');
      expect(util.concatDate(2025, 10, 28)).assertEqual('20251028');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0195 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_1600
     * @tc.name      testConcatDate0196
     * @tc.desc      Verify date composition 2025-10-29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0196 begin');
      expect(util.concatDate(2025, 10, 29)).assertEqual('20251029');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0196 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_1700
     * @tc.name      testConcatDate0197
     * @tc.desc      Verify date composition 2025-10-30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0197 begin');
      expect(util.concatDate(2025, 10, 30)).assertEqual('20251030');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0197 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_1800
     * @tc.name      testConcatDate0198
     * @tc.desc      Verify date composition 2025-10-31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0198 begin');
      expect(util.concatDate(2025, 10, 31)).assertEqual('20251031');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0198 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_1900
     * @tc.name      testConcatDate0199
     * @tc.desc      Verify date composition 2025-11-10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0199 begin');
      expect(util.concatDate(2025, 11, 10)).assertEqual('20251110');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0199 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_2000
     * @tc.name      testConcatDate0200
     * @tc.desc      Verify date composition 2025-11-11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0200 begin');
      expect(util.concatDate(2025, 11, 11)).assertEqual('20251111');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0200 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_2100
     * @tc.name      testConcatDate0201
     * @tc.desc      Verify date composition 2025-11-15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0201 begin');
      expect(util.concatDate(2025, 11, 15)).assertEqual('20251115');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0201 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_2200
     * @tc.name      testConcatDate0202
     * @tc.desc      Verify date composition 2025-11-20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0202 begin');
      expect(util.concatDate(2025, 11, 20)).assertEqual('20251120');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0202 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_2300
     * @tc.name      testConcatDate0203
     * @tc.desc      Verify date composition 2025-11-25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0203 begin');
      expect(util.concatDate(2025, 11, 25)).assertEqual('20251125');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0203 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_2400
     * @tc.name      testConcatDate0204
     * @tc.desc      Verify date composition 2025-11-28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0204 begin');
      expect(util.concatDate(2025, 11, 28)).assertEqual('20251128');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0204 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_2500
     * @tc.name      testConcatDate0205
     * @tc.desc      Verify date composition 2025-11-29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0205 begin');
      expect(util.concatDate(2025, 11, 29)).assertEqual('20251129');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0205 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_2600
     * @tc.name      testConcatDate0206
     * @tc.desc      Verify date composition 2025-11-30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0206 begin');
      expect(util.concatDate(2025, 11, 30)).assertEqual('20251130');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0206 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_2700
     * @tc.name      testConcatDate0207
     * @tc.desc      Verify date composition 2025-11-31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0207 begin');
      expect(util.concatDate(2025, 11, 31)).assertEqual('20251131');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0207 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_2800
     * @tc.name      testConcatDate0208
     * @tc.desc      Verify date composition 2025-12-10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0208 begin');
      expect(util.concatDate(2025, 12, 10)).assertEqual('20251210');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0208 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_2900
     * @tc.name      testConcatDate0209
     * @tc.desc      Verify date composition 2025-12-11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0209 begin');
      expect(util.concatDate(2025, 12, 11)).assertEqual('20251211');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0209 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_3000
     * @tc.name      testConcatDate0210
     * @tc.desc      Verify date composition 2025-12-15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0210 begin');
      expect(util.concatDate(2025, 12, 15)).assertEqual('20251215');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0210 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_3100
     * @tc.name      testConcatDate0211
     * @tc.desc      Verify date composition 2025-12-20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0211 begin');
      expect(util.concatDate(2025, 12, 20)).assertEqual('20251220');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0211 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_3200
     * @tc.name      testConcatDate0212
     * @tc.desc      Verify date composition 2025-12-25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0212 begin');
      expect(util.concatDate(2025, 12, 25)).assertEqual('20251225');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0212 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_3300
     * @tc.name      testConcatDate0213
     * @tc.desc      Verify date composition 2025-12-28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0213 begin');
      expect(util.concatDate(2025, 12, 28)).assertEqual('20251228');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0213 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_3400
     * @tc.name      testConcatDate0214
     * @tc.desc      Verify date composition 2025-12-29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0214 begin');
      expect(util.concatDate(2025, 12, 29)).assertEqual('20251229');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0214 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_3500
     * @tc.name      testConcatDate0215
     * @tc.desc      Verify date composition 2025-12-30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0215 begin');
      expect(util.concatDate(2025, 12, 30)).assertEqual('20251230');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0215 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_3600
     * @tc.name      testConcatDate0216
     * @tc.desc      Verify date composition 2025-12-31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0216 begin');
      expect(util.concatDate(2025, 12, 31)).assertEqual('20251231');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0216 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_3700
     * @tc.name      testConcatDate0217
     * @tc.desc      Verify date composition 2026-1-10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0217 begin');
      expect(util.concatDate(2026, 1, 10)).assertEqual('2026110');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0217 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_3800
     * @tc.name      testConcatDate0218
     * @tc.desc      Verify date composition 2026-1-11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0218 begin');
      expect(util.concatDate(2026, 1, 11)).assertEqual('2026111');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0218 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_3900
     * @tc.name      testConcatDate0219
     * @tc.desc      Verify date composition 2026-1-15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0219 begin');
      expect(util.concatDate(2026, 1, 15)).assertEqual('2026115');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0219 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_4000
     * @tc.name      testConcatDate0220
     * @tc.desc      Verify date composition 2026-1-20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0220 begin');
      expect(util.concatDate(2026, 1, 20)).assertEqual('2026120');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0220 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_4100
     * @tc.name      testConcatDate0221
     * @tc.desc      Verify date composition 2026-1-25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0221 begin');
      expect(util.concatDate(2026, 1, 25)).assertEqual('2026125');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0221 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_4200
     * @tc.name      testConcatDate0222
     * @tc.desc      Verify date composition 2026-1-28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0222 begin');
      expect(util.concatDate(2026, 1, 28)).assertEqual('2026128');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0222 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_4300
     * @tc.name      testConcatDate0223
     * @tc.desc      Verify date composition 2026-1-29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0223 begin');
      expect(util.concatDate(2026, 1, 29)).assertEqual('2026129');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0223 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_4400
     * @tc.name      testConcatDate0224
     * @tc.desc      Verify date composition 2026-1-30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0224 begin');
      expect(util.concatDate(2026, 1, 30)).assertEqual('2026130');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0224 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_4500
     * @tc.name      testConcatDate0225
     * @tc.desc      Verify date composition 2026-1-31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0225 begin');
      expect(util.concatDate(2026, 1, 31)).assertEqual('2026131');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0225 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_4600
     * @tc.name      testConcatDate0226
     * @tc.desc      Verify date composition 2026-2-10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0226 begin');
      expect(util.concatDate(2026, 2, 10)).assertEqual('2026210');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0226 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_4700
     * @tc.name      testConcatDate0227
     * @tc.desc      Verify date composition 2026-2-11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0227 begin');
      expect(util.concatDate(2026, 2, 11)).assertEqual('2026211');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0227 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_4800
     * @tc.name      testConcatDate0228
     * @tc.desc      Verify date composition 2026-2-15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0228 begin');
      expect(util.concatDate(2026, 2, 15)).assertEqual('2026215');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0228 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_4900
     * @tc.name      testConcatDate0229
     * @tc.desc      Verify date composition 2026-2-20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0229 begin');
      expect(util.concatDate(2026, 2, 20)).assertEqual('2026220');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0229 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_5000
     * @tc.name      testConcatDate0230
     * @tc.desc      Verify date composition 2026-2-25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0230 begin');
      expect(util.concatDate(2026, 2, 25)).assertEqual('2026225');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0230 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_5100
     * @tc.name      testConcatDate0231
     * @tc.desc      Verify date composition 2026-2-28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0231 begin');
      expect(util.concatDate(2026, 2, 28)).assertEqual('2026228');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0231 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_5200
     * @tc.name      testConcatDate0232
     * @tc.desc      Verify date composition 2026-2-29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0232 begin');
      expect(util.concatDate(2026, 2, 29)).assertEqual('2026229');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0232 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_5300
     * @tc.name      testConcatDate0233
     * @tc.desc      Verify date composition 2026-2-30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0233 begin');
      expect(util.concatDate(2026, 2, 30)).assertEqual('2026230');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0233 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_5400
     * @tc.name      testConcatDate0234
     * @tc.desc      Verify date composition 2026-2-31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0234 begin');
      expect(util.concatDate(2026, 2, 31)).assertEqual('2026231');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0234 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_5500
     * @tc.name      testConcatDate0235
     * @tc.desc      Verify date composition 2026-3-10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0235 begin');
      expect(util.concatDate(2026, 3, 10)).assertEqual('2026310');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0235 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_5600
     * @tc.name      testConcatDate0236
     * @tc.desc      Verify date composition 2026-3-11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0236 begin');
      expect(util.concatDate(2026, 3, 11)).assertEqual('2026311');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0236 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_5700
     * @tc.name      testConcatDate0237
     * @tc.desc      Verify date composition 2026-3-15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0237 begin');
      expect(util.concatDate(2026, 3, 15)).assertEqual('2026315');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0237 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_5800
     * @tc.name      testConcatDate0238
     * @tc.desc      Verify date composition 2026-3-20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0238 begin');
      expect(util.concatDate(2026, 3, 20)).assertEqual('2026320');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0238 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_5900
     * @tc.name      testConcatDate0239
     * @tc.desc      Verify date composition 2026-3-25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0239 begin');
      expect(util.concatDate(2026, 3, 25)).assertEqual('2026325');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0239 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_6000
     * @tc.name      testConcatDate0240
     * @tc.desc      Verify date composition 2026-3-28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0240 begin');
      expect(util.concatDate(2026, 3, 28)).assertEqual('2026328');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0240 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_6100
     * @tc.name      testConcatDate0241
     * @tc.desc      Verify date composition 2026-3-29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0241 begin');
      expect(util.concatDate(2026, 3, 29)).assertEqual('2026329');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0241 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_6200
     * @tc.name      testConcatDate0242
     * @tc.desc      Verify date composition 2026-3-30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0242 begin');
      expect(util.concatDate(2026, 3, 30)).assertEqual('2026330');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0242 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_6300
     * @tc.name      testConcatDate0243
     * @tc.desc      Verify date composition 2026-3-31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0243 begin');
      expect(util.concatDate(2026, 3, 31)).assertEqual('2026331');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0243 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_6400
     * @tc.name      testConcatDate0244
     * @tc.desc      Verify date composition 2026-4-10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0244 begin');
      expect(util.concatDate(2026, 4, 10)).assertEqual('2026410');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0244 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_6500
     * @tc.name      testConcatDate0245
     * @tc.desc      Verify date composition 2026-4-11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0245 begin');
      expect(util.concatDate(2026, 4, 11)).assertEqual('2026411');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0245 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_6600
     * @tc.name      testConcatDate0246
     * @tc.desc      Verify date composition 2026-4-15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0246 begin');
      expect(util.concatDate(2026, 4, 15)).assertEqual('2026415');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0246 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_6700
     * @tc.name      testConcatDate0247
     * @tc.desc      Verify date composition 2026-4-20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0247 begin');
      expect(util.concatDate(2026, 4, 20)).assertEqual('2026420');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0247 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_6800
     * @tc.name      testConcatDate0248
     * @tc.desc      Verify date composition 2026-4-25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0248 begin');
      expect(util.concatDate(2026, 4, 25)).assertEqual('2026425');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0248 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_6900
     * @tc.name      testConcatDate0249
     * @tc.desc      Verify date composition 2026-4-28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0249 begin');
      expect(util.concatDate(2026, 4, 28)).assertEqual('2026428');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0249 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_7000
     * @tc.name      testConcatDate0250
     * @tc.desc      Verify date composition 2026-4-29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0250 begin');
      expect(util.concatDate(2026, 4, 29)).assertEqual('2026429');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0250 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_7100
     * @tc.name      testConcatDate0251
     * @tc.desc      Verify date composition 2026-4-30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0251 begin');
      expect(util.concatDate(2026, 4, 30)).assertEqual('2026430');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0251 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_7200
     * @tc.name      testConcatDate0252
     * @tc.desc      Verify date composition 2026-4-31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0252 begin');
      expect(util.concatDate(2026, 4, 31)).assertEqual('2026431');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0252 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_7300
     * @tc.name      testConcatDate0253
     * @tc.desc      Verify date composition 2026-5-10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0253 begin');
      expect(util.concatDate(2026, 5, 10)).assertEqual('2026510');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0253 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_7400
     * @tc.name      testConcatDate0254
     * @tc.desc      Verify date composition 2026-5-11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0254 begin');
      expect(util.concatDate(2026, 5, 11)).assertEqual('2026511');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0254 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_7500
     * @tc.name      testConcatDate0255
     * @tc.desc      Verify date composition 2026-5-15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0255 begin');
      expect(util.concatDate(2026, 5, 15)).assertEqual('2026515');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0255 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_7600
     * @tc.name      testConcatDate0256
     * @tc.desc      Verify date composition 2026-5-20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0256 begin');
      expect(util.concatDate(2026, 5, 20)).assertEqual('2026520');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0256 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_7700
     * @tc.name      testConcatDate0257
     * @tc.desc      Verify date composition 2026-5-25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0257 begin');
      expect(util.concatDate(2026, 5, 25)).assertEqual('2026525');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0257 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_7800
     * @tc.name      testConcatDate0258
     * @tc.desc      Verify date composition 2026-5-28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0258 begin');
      expect(util.concatDate(2026, 5, 28)).assertEqual('2026528');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0258 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_7900
     * @tc.name      testConcatDate0259
     * @tc.desc      Verify date composition 2026-5-29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0259 begin');
      expect(util.concatDate(2026, 5, 29)).assertEqual('2026529');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0259 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_8000
     * @tc.name      testConcatDate0260
     * @tc.desc      Verify date composition 2026-5-30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0260', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0260 begin');
      expect(util.concatDate(2026, 5, 30)).assertEqual('2026530');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0260 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_8100
     * @tc.name      testConcatDate0261
     * @tc.desc      Verify date composition 2026-5-31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0261', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0261 begin');
      expect(util.concatDate(2026, 5, 31)).assertEqual('2026531');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0261 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_8200
     * @tc.name      testConcatDate0262
     * @tc.desc      Verify date composition 2026-6-10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0262', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0262 begin');
      expect(util.concatDate(2026, 6, 10)).assertEqual('2026610');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0262 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_8300
     * @tc.name      testConcatDate0263
     * @tc.desc      Verify date composition 2026-6-11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0263', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0263 begin');
      expect(util.concatDate(2026, 6, 11)).assertEqual('2026611');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0263 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_8400
     * @tc.name      testConcatDate0264
     * @tc.desc      Verify date composition 2026-6-15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0264', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0264 begin');
      expect(util.concatDate(2026, 6, 15)).assertEqual('2026615');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0264 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_8500
     * @tc.name      testConcatDate0265
     * @tc.desc      Verify date composition 2026-6-20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0265', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0265 begin');
      expect(util.concatDate(2026, 6, 20)).assertEqual('2026620');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0265 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_8600
     * @tc.name      testConcatDate0266
     * @tc.desc      Verify date composition 2026-6-25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0266', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0266 begin');
      expect(util.concatDate(2026, 6, 25)).assertEqual('2026625');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0266 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_8700
     * @tc.name      testConcatDate0267
     * @tc.desc      Verify date composition 2026-6-28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0267', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0267 begin');
      expect(util.concatDate(2026, 6, 28)).assertEqual('2026628');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0267 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_8800
     * @tc.name      testConcatDate0268
     * @tc.desc      Verify date composition 2026-6-29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0268', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0268 begin');
      expect(util.concatDate(2026, 6, 29)).assertEqual('2026629');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0268 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_8900
     * @tc.name      testConcatDate0269
     * @tc.desc      Verify date composition 2026-6-30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0269', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0269 begin');
      expect(util.concatDate(2026, 6, 30)).assertEqual('2026630');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0269 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP3_ONE_9000
     * @tc.name      testConcatDate0270
     * @tc.desc      Verify date composition 2026-6-31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0270', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0270 begin');
      expect(util.concatDate(2026, 6, 31)).assertEqual('2026631');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0270 end');
    })

  })
}
