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

export default function DateTimeConcatDateMatrixPart4Test(): void {
  describe('DateTimeConcatDateMatrixPart4', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })


    /**
     * @tc.number    SUB_AVREC_DTDATEP4_ONE_0100
     * @tc.name      testConcatDate0271
     * @tc.desc      Verify date composition 2026-7-10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0271', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0271 begin');
      expect(util.concatDate(2026, 7, 10)).assertEqual('2026710');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0271 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP4_ONE_0200
     * @tc.name      testConcatDate0272
     * @tc.desc      Verify date composition 2026-7-11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0272', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0272 begin');
      expect(util.concatDate(2026, 7, 11)).assertEqual('2026711');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0272 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP4_ONE_0300
     * @tc.name      testConcatDate0273
     * @tc.desc      Verify date composition 2026-7-15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0273', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0273 begin');
      expect(util.concatDate(2026, 7, 15)).assertEqual('2026715');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0273 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP4_ONE_0400
     * @tc.name      testConcatDate0274
     * @tc.desc      Verify date composition 2026-7-20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0274', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0274 begin');
      expect(util.concatDate(2026, 7, 20)).assertEqual('2026720');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0274 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP4_ONE_0500
     * @tc.name      testConcatDate0275
     * @tc.desc      Verify date composition 2026-7-25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0275', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0275 begin');
      expect(util.concatDate(2026, 7, 25)).assertEqual('2026725');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0275 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP4_ONE_0600
     * @tc.name      testConcatDate0276
     * @tc.desc      Verify date composition 2026-7-28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0276', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0276 begin');
      expect(util.concatDate(2026, 7, 28)).assertEqual('2026728');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0276 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP4_ONE_0700
     * @tc.name      testConcatDate0277
     * @tc.desc      Verify date composition 2026-7-29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0277', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0277 begin');
      expect(util.concatDate(2026, 7, 29)).assertEqual('2026729');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0277 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP4_ONE_0800
     * @tc.name      testConcatDate0278
     * @tc.desc      Verify date composition 2026-7-30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0278', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0278 begin');
      expect(util.concatDate(2026, 7, 30)).assertEqual('2026730');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0278 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP4_ONE_0900
     * @tc.name      testConcatDate0279
     * @tc.desc      Verify date composition 2026-7-31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0279', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0279 begin');
      expect(util.concatDate(2026, 7, 31)).assertEqual('2026731');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0279 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP4_ONE_1000
     * @tc.name      testConcatDate0280
     * @tc.desc      Verify date composition 2026-8-10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0280', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0280 begin');
      expect(util.concatDate(2026, 8, 10)).assertEqual('2026810');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0280 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP4_ONE_1100
     * @tc.name      testConcatDate0281
     * @tc.desc      Verify date composition 2026-8-11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0281', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0281 begin');
      expect(util.concatDate(2026, 8, 11)).assertEqual('2026811');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0281 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP4_ONE_1200
     * @tc.name      testConcatDate0282
     * @tc.desc      Verify date composition 2026-8-15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0282', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0282 begin');
      expect(util.concatDate(2026, 8, 15)).assertEqual('2026815');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0282 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP4_ONE_1300
     * @tc.name      testConcatDate0283
     * @tc.desc      Verify date composition 2026-8-20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0283', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0283 begin');
      expect(util.concatDate(2026, 8, 20)).assertEqual('2026820');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0283 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP4_ONE_1400
     * @tc.name      testConcatDate0284
     * @tc.desc      Verify date composition 2026-8-25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0284', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0284 begin');
      expect(util.concatDate(2026, 8, 25)).assertEqual('2026825');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0284 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP4_ONE_1500
     * @tc.name      testConcatDate0285
     * @tc.desc      Verify date composition 2026-8-28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0285', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0285 begin');
      expect(util.concatDate(2026, 8, 28)).assertEqual('2026828');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0285 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP4_ONE_1600
     * @tc.name      testConcatDate0286
     * @tc.desc      Verify date composition 2026-8-29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0286', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0286 begin');
      expect(util.concatDate(2026, 8, 29)).assertEqual('2026829');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0286 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP4_ONE_1700
     * @tc.name      testConcatDate0287
     * @tc.desc      Verify date composition 2026-8-30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0287', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0287 begin');
      expect(util.concatDate(2026, 8, 30)).assertEqual('2026830');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0287 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP4_ONE_1800
     * @tc.name      testConcatDate0288
     * @tc.desc      Verify date composition 2026-8-31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0288', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0288 begin');
      expect(util.concatDate(2026, 8, 31)).assertEqual('2026831');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0288 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP4_ONE_1900
     * @tc.name      testConcatDate0289
     * @tc.desc      Verify date composition 2026-9-10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0289', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0289 begin');
      expect(util.concatDate(2026, 9, 10)).assertEqual('2026910');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0289 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP4_ONE_2000
     * @tc.name      testConcatDate0290
     * @tc.desc      Verify date composition 2026-9-11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0290', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0290 begin');
      expect(util.concatDate(2026, 9, 11)).assertEqual('2026911');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0290 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP4_ONE_2100
     * @tc.name      testConcatDate0291
     * @tc.desc      Verify date composition 2026-9-15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0291', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0291 begin');
      expect(util.concatDate(2026, 9, 15)).assertEqual('2026915');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0291 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP4_ONE_2200
     * @tc.name      testConcatDate0292
     * @tc.desc      Verify date composition 2026-9-20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0292', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0292 begin');
      expect(util.concatDate(2026, 9, 20)).assertEqual('2026920');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0292 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP4_ONE_2300
     * @tc.name      testConcatDate0293
     * @tc.desc      Verify date composition 2026-9-25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0293', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0293 begin');
      expect(util.concatDate(2026, 9, 25)).assertEqual('2026925');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0293 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP4_ONE_2400
     * @tc.name      testConcatDate0294
     * @tc.desc      Verify date composition 2026-9-28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0294', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0294 begin');
      expect(util.concatDate(2026, 9, 28)).assertEqual('2026928');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0294 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP4_ONE_2500
     * @tc.name      testConcatDate0295
     * @tc.desc      Verify date composition 2026-9-29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0295', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0295 begin');
      expect(util.concatDate(2026, 9, 29)).assertEqual('2026929');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0295 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP4_ONE_2600
     * @tc.name      testConcatDate0296
     * @tc.desc      Verify date composition 2026-9-30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0296', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0296 begin');
      expect(util.concatDate(2026, 9, 30)).assertEqual('2026930');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0296 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP4_ONE_2700
     * @tc.name      testConcatDate0297
     * @tc.desc      Verify date composition 2026-9-31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0297', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0297 begin');
      expect(util.concatDate(2026, 9, 31)).assertEqual('2026931');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0297 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP4_ONE_2800
     * @tc.name      testConcatDate0298
     * @tc.desc      Verify date composition 2026-10-10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0298', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0298 begin');
      expect(util.concatDate(2026, 10, 10)).assertEqual('20261010');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0298 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP4_ONE_2900
     * @tc.name      testConcatDate0299
     * @tc.desc      Verify date composition 2026-10-11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0299', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0299 begin');
      expect(util.concatDate(2026, 10, 11)).assertEqual('20261011');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0299 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP4_ONE_3000
     * @tc.name      testConcatDate0300
     * @tc.desc      Verify date composition 2026-10-15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0300 begin');
      expect(util.concatDate(2026, 10, 15)).assertEqual('20261015');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0300 end');
    })

  })
}
