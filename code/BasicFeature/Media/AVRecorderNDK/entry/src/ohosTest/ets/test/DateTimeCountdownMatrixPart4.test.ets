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

export default function DateTimeCountdownMatrixPart4Test(): void {
  describe('DateTimeCountdownMatrixPart4', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })


    /**
     * @tc.number    SUB_AVREC_DTCOUNTP4_ONE_0100
     * @tc.name      testCountdown0271
     * @tc.desc      Verify countdown text for 270 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0271', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0271 begin');
      expect(dateTime(270)).assertEqual('04:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0271 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP4_ONE_0200
     * @tc.name      testCountdown0272
     * @tc.desc      Verify countdown text for 271 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0272', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0272 begin');
      expect(dateTime(271)).assertEqual('04:31');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0272 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP4_ONE_0300
     * @tc.name      testCountdown0273
     * @tc.desc      Verify countdown text for 272 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0273', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0273 begin');
      expect(dateTime(272)).assertEqual('04:32');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0273 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP4_ONE_0400
     * @tc.name      testCountdown0274
     * @tc.desc      Verify countdown text for 273 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0274', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0274 begin');
      expect(dateTime(273)).assertEqual('04:33');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0274 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP4_ONE_0500
     * @tc.name      testCountdown0275
     * @tc.desc      Verify countdown text for 274 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0275', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0275 begin');
      expect(dateTime(274)).assertEqual('04:34');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0275 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP4_ONE_0600
     * @tc.name      testCountdown0276
     * @tc.desc      Verify countdown text for 275 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0276', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0276 begin');
      expect(dateTime(275)).assertEqual('04:35');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0276 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP4_ONE_0700
     * @tc.name      testCountdown0277
     * @tc.desc      Verify countdown text for 276 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0277', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0277 begin');
      expect(dateTime(276)).assertEqual('04:36');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0277 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP4_ONE_0800
     * @tc.name      testCountdown0278
     * @tc.desc      Verify countdown text for 277 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0278', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0278 begin');
      expect(dateTime(277)).assertEqual('04:37');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0278 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP4_ONE_0900
     * @tc.name      testCountdown0279
     * @tc.desc      Verify countdown text for 278 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0279', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0279 begin');
      expect(dateTime(278)).assertEqual('04:38');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0279 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP4_ONE_1000
     * @tc.name      testCountdown0280
     * @tc.desc      Verify countdown text for 279 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0280', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0280 begin');
      expect(dateTime(279)).assertEqual('04:39');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0280 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP4_ONE_1100
     * @tc.name      testCountdown0281
     * @tc.desc      Verify countdown text for 280 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0281', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0281 begin');
      expect(dateTime(280)).assertEqual('04:40');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0281 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP4_ONE_1200
     * @tc.name      testCountdown0282
     * @tc.desc      Verify countdown text for 281 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0282', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0282 begin');
      expect(dateTime(281)).assertEqual('04:41');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0282 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP4_ONE_1300
     * @tc.name      testCountdown0283
     * @tc.desc      Verify countdown text for 282 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0283', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0283 begin');
      expect(dateTime(282)).assertEqual('04:42');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0283 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP4_ONE_1400
     * @tc.name      testCountdown0284
     * @tc.desc      Verify countdown text for 283 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0284', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0284 begin');
      expect(dateTime(283)).assertEqual('04:43');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0284 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP4_ONE_1500
     * @tc.name      testCountdown0285
     * @tc.desc      Verify countdown text for 284 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0285', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0285 begin');
      expect(dateTime(284)).assertEqual('04:44');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0285 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP4_ONE_1600
     * @tc.name      testCountdown0286
     * @tc.desc      Verify countdown text for 285 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0286', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0286 begin');
      expect(dateTime(285)).assertEqual('04:45');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0286 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP4_ONE_1700
     * @tc.name      testCountdown0287
     * @tc.desc      Verify countdown text for 286 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0287', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0287 begin');
      expect(dateTime(286)).assertEqual('04:46');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0287 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP4_ONE_1800
     * @tc.name      testCountdown0288
     * @tc.desc      Verify countdown text for 287 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0288', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0288 begin');
      expect(dateTime(287)).assertEqual('04:47');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0288 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP4_ONE_1900
     * @tc.name      testCountdown0289
     * @tc.desc      Verify countdown text for 288 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0289', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0289 begin');
      expect(dateTime(288)).assertEqual('04:48');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0289 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP4_ONE_2000
     * @tc.name      testCountdown0290
     * @tc.desc      Verify countdown text for 289 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0290', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0290 begin');
      expect(dateTime(289)).assertEqual('04:49');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0290 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP4_ONE_2100
     * @tc.name      testCountdown0291
     * @tc.desc      Verify countdown text for 290 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0291', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0291 begin');
      expect(dateTime(290)).assertEqual('04:50');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0291 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP4_ONE_2200
     * @tc.name      testCountdown0292
     * @tc.desc      Verify countdown text for 291 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0292', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0292 begin');
      expect(dateTime(291)).assertEqual('04:51');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0292 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP4_ONE_2300
     * @tc.name      testCountdown0293
     * @tc.desc      Verify countdown text for 292 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0293', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0293 begin');
      expect(dateTime(292)).assertEqual('04:52');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0293 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP4_ONE_2400
     * @tc.name      testCountdown0294
     * @tc.desc      Verify countdown text for 293 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0294', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0294 begin');
      expect(dateTime(293)).assertEqual('04:53');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0294 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP4_ONE_2500
     * @tc.name      testCountdown0295
     * @tc.desc      Verify countdown text for 294 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0295', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0295 begin');
      expect(dateTime(294)).assertEqual('04:54');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0295 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP4_ONE_2600
     * @tc.name      testCountdown0296
     * @tc.desc      Verify countdown text for 295 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0296', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0296 begin');
      expect(dateTime(295)).assertEqual('04:55');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0296 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP4_ONE_2700
     * @tc.name      testCountdown0297
     * @tc.desc      Verify countdown text for 296 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0297', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0297 begin');
      expect(dateTime(296)).assertEqual('04:56');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0297 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP4_ONE_2800
     * @tc.name      testCountdown0298
     * @tc.desc      Verify countdown text for 297 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0298', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0298 begin');
      expect(dateTime(297)).assertEqual('04:57');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0298 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP4_ONE_2900
     * @tc.name      testCountdown0299
     * @tc.desc      Verify countdown text for 298 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0299', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0299 begin');
      expect(dateTime(298)).assertEqual('04:58');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0299 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP4_ONE_3000
     * @tc.name      testCountdown0300
     * @tc.desc      Verify countdown text for 299 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0300 begin');
      expect(dateTime(299)).assertEqual('04:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0300 end');
    })

  })
}
