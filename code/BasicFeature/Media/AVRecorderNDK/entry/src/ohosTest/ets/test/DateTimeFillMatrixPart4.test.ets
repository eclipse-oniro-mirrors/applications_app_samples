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

export default function DateTimeFillMatrixPart4Test(): void {
  describe('DateTimeFillMatrixPart4', () => {

    /**
     * @tc.number    SUB_AVREC_DTFILLP4_27100
     * @tc.name      testFill0271
     * @tc.desc      Verify validate fill value 270.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0271', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0271 begin');
      expect(util.fill(270)).assertEqual('270');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0271 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP4_27200
     * @tc.name      testFill0272
     * @tc.desc      Verify validate fill value 271.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0272', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0272 begin');
      expect(util.fill(271)).assertEqual('271');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0272 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP4_27300
     * @tc.name      testFill0273
     * @tc.desc      Verify validate fill value 272.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0273', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0273 begin');
      expect(util.fill(272)).assertEqual('272');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0273 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP4_27400
     * @tc.name      testFill0274
     * @tc.desc      Verify validate fill value 273.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0274', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0274 begin');
      expect(util.fill(273)).assertEqual('273');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0274 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP4_27500
     * @tc.name      testFill0275
     * @tc.desc      Verify validate fill value 274.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0275', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0275 begin');
      expect(util.fill(274)).assertEqual('274');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0275 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP4_27600
     * @tc.name      testFill0276
     * @tc.desc      Verify validate fill value 275.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0276', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0276 begin');
      expect(util.fill(275)).assertEqual('275');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0276 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP4_27700
     * @tc.name      testFill0277
     * @tc.desc      Verify validate fill value 276.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0277', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0277 begin');
      expect(util.fill(276)).assertEqual('276');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0277 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP4_27800
     * @tc.name      testFill0278
     * @tc.desc      Verify validate fill value 277.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0278', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0278 begin');
      expect(util.fill(277)).assertEqual('277');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0278 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP4_27900
     * @tc.name      testFill0279
     * @tc.desc      Verify validate fill value 278.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0279', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0279 begin');
      expect(util.fill(278)).assertEqual('278');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0279 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP4_28000
     * @tc.name      testFill0280
     * @tc.desc      Verify validate fill value 279.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0280', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0280 begin');
      expect(util.fill(279)).assertEqual('279');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0280 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP4_28100
     * @tc.name      testFill0281
     * @tc.desc      Verify validate fill value 280.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0281', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0281 begin');
      expect(util.fill(280)).assertEqual('280');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0281 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP4_28200
     * @tc.name      testFill0282
     * @tc.desc      Verify validate fill value 281.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0282', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0282 begin');
      expect(util.fill(281)).assertEqual('281');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0282 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP4_28300
     * @tc.name      testFill0283
     * @tc.desc      Verify validate fill value 282.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0283', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0283 begin');
      expect(util.fill(282)).assertEqual('282');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0283 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP4_28400
     * @tc.name      testFill0284
     * @tc.desc      Verify validate fill value 283.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0284', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0284 begin');
      expect(util.fill(283)).assertEqual('283');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0284 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP4_28500
     * @tc.name      testFill0285
     * @tc.desc      Verify validate fill value 284.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0285', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0285 begin');
      expect(util.fill(284)).assertEqual('284');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0285 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP4_28600
     * @tc.name      testFill0286
     * @tc.desc      Verify validate fill value 285.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0286', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0286 begin');
      expect(util.fill(285)).assertEqual('285');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0286 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP4_28700
     * @tc.name      testFill0287
     * @tc.desc      Verify validate fill value 286.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0287', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0287 begin');
      expect(util.fill(286)).assertEqual('286');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0287 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP4_28800
     * @tc.name      testFill0288
     * @tc.desc      Verify validate fill value 287.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0288', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0288 begin');
      expect(util.fill(287)).assertEqual('287');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0288 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP4_28900
     * @tc.name      testFill0289
     * @tc.desc      Verify validate fill value 288.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0289', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0289 begin');
      expect(util.fill(288)).assertEqual('288');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0289 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP4_29000
     * @tc.name      testFill0290
     * @tc.desc      Verify validate fill value 289.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0290', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0290 begin');
      expect(util.fill(289)).assertEqual('289');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0290 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP4_29100
     * @tc.name      testFill0291
     * @tc.desc      Verify validate fill value 290.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0291', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0291 begin');
      expect(util.fill(290)).assertEqual('290');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0291 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP4_29200
     * @tc.name      testFill0292
     * @tc.desc      Verify validate fill value 291.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0292', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0292 begin');
      expect(util.fill(291)).assertEqual('291');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0292 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP4_29300
     * @tc.name      testFill0293
     * @tc.desc      Verify validate fill value 292.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0293', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0293 begin');
      expect(util.fill(292)).assertEqual('292');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0293 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP4_29400
     * @tc.name      testFill0294
     * @tc.desc      Verify validate fill value 293.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0294', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0294 begin');
      expect(util.fill(293)).assertEqual('293');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0294 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP4_29500
     * @tc.name      testFill0295
     * @tc.desc      Verify validate fill value 294.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0295', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0295 begin');
      expect(util.fill(294)).assertEqual('294');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0295 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP4_29600
     * @tc.name      testFill0296
     * @tc.desc      Verify validate fill value 295.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0296', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0296 begin');
      expect(util.fill(295)).assertEqual('295');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0296 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP4_29700
     * @tc.name      testFill0297
     * @tc.desc      Verify validate fill value 296.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0297', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0297 begin');
      expect(util.fill(296)).assertEqual('296');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0297 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP4_29800
     * @tc.name      testFill0298
     * @tc.desc      Verify validate fill value 297.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0298', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0298 begin');
      expect(util.fill(297)).assertEqual('297');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0298 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP4_29900
     * @tc.name      testFill0299
     * @tc.desc      Verify validate fill value 298.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0299', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0299 begin');
      expect(util.fill(298)).assertEqual('298');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0299 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP4_30000
     * @tc.name      testFill0300
     * @tc.desc      Verify validate fill value 299.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0300 begin');
      expect(util.fill(299)).assertEqual('299');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0300 end');
    })

  })
}
