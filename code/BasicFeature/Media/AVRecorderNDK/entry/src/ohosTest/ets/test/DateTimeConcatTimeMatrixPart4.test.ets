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

export default function DateTimeConcatTimeMatrixPart4Test(): void {
  describe('DateTimeConcatTimeMatrixPart4', () => {

    /**
     * @tc.number    SUB_AVREC_DTTIMEP4_27100
     * @tc.name      testConcatTime0271
     * @tc.desc      Verify time composition 0:38:10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0271', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0271 begin');
      expect(util.concatTime(0, 38, 10)).assertEqual('003810');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0271 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP4_27200
     * @tc.name      testConcatTime0272
     * @tc.desc      Verify time composition 0:38:30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0272', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0272 begin');
      expect(util.concatTime(0, 38, 30)).assertEqual('003830');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0272 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP4_27300
     * @tc.name      testConcatTime0273
     * @tc.desc      Verify time composition 0:38:59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0273', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0273 begin');
      expect(util.concatTime(0, 38, 59)).assertEqual('003859');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0273 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP4_27400
     * @tc.name      testConcatTime0274
     * @tc.desc      Verify time composition 0:39:0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0274', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0274 begin');
      expect(util.concatTime(0, 39, 0)).assertEqual('003900');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0274 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP4_27500
     * @tc.name      testConcatTime0275
     * @tc.desc      Verify time composition 0:39:1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0275', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0275 begin');
      expect(util.concatTime(0, 39, 1)).assertEqual('003901');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0275 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP4_27600
     * @tc.name      testConcatTime0276
     * @tc.desc      Verify time composition 0:39:5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0276', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0276 begin');
      expect(util.concatTime(0, 39, 5)).assertEqual('003905');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0276 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP4_27700
     * @tc.name      testConcatTime0277
     * @tc.desc      Verify time composition 0:39:9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0277', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0277 begin');
      expect(util.concatTime(0, 39, 9)).assertEqual('003909');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0277 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP4_27800
     * @tc.name      testConcatTime0278
     * @tc.desc      Verify time composition 0:39:10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0278', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0278 begin');
      expect(util.concatTime(0, 39, 10)).assertEqual('003910');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0278 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP4_27900
     * @tc.name      testConcatTime0279
     * @tc.desc      Verify time composition 0:39:30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0279', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0279 begin');
      expect(util.concatTime(0, 39, 30)).assertEqual('003930');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0279 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP4_28000
     * @tc.name      testConcatTime0280
     * @tc.desc      Verify time composition 0:39:59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0280', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0280 begin');
      expect(util.concatTime(0, 39, 59)).assertEqual('003959');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0280 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP4_28100
     * @tc.name      testConcatTime0281
     * @tc.desc      Verify time composition 0:40:0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0281', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0281 begin');
      expect(util.concatTime(0, 40, 0)).assertEqual('004000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0281 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP4_28200
     * @tc.name      testConcatTime0282
     * @tc.desc      Verify time composition 0:40:1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0282', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0282 begin');
      expect(util.concatTime(0, 40, 1)).assertEqual('004001');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0282 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP4_28300
     * @tc.name      testConcatTime0283
     * @tc.desc      Verify time composition 0:40:5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0283', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0283 begin');
      expect(util.concatTime(0, 40, 5)).assertEqual('004005');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0283 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP4_28400
     * @tc.name      testConcatTime0284
     * @tc.desc      Verify time composition 0:40:9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0284', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0284 begin');
      expect(util.concatTime(0, 40, 9)).assertEqual('004009');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0284 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP4_28500
     * @tc.name      testConcatTime0285
     * @tc.desc      Verify time composition 0:40:10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0285', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0285 begin');
      expect(util.concatTime(0, 40, 10)).assertEqual('004010');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0285 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP4_28600
     * @tc.name      testConcatTime0286
     * @tc.desc      Verify time composition 0:40:30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0286', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0286 begin');
      expect(util.concatTime(0, 40, 30)).assertEqual('004030');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0286 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP4_28700
     * @tc.name      testConcatTime0287
     * @tc.desc      Verify time composition 0:40:59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0287', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0287 begin');
      expect(util.concatTime(0, 40, 59)).assertEqual('004059');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0287 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP4_28800
     * @tc.name      testConcatTime0288
     * @tc.desc      Verify time composition 0:41:0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0288', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0288 begin');
      expect(util.concatTime(0, 41, 0)).assertEqual('004100');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0288 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP4_28900
     * @tc.name      testConcatTime0289
     * @tc.desc      Verify time composition 0:41:1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0289', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0289 begin');
      expect(util.concatTime(0, 41, 1)).assertEqual('004101');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0289 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP4_29000
     * @tc.name      testConcatTime0290
     * @tc.desc      Verify time composition 0:41:5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0290', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0290 begin');
      expect(util.concatTime(0, 41, 5)).assertEqual('004105');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0290 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP4_29100
     * @tc.name      testConcatTime0291
     * @tc.desc      Verify time composition 0:41:9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0291', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0291 begin');
      expect(util.concatTime(0, 41, 9)).assertEqual('004109');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0291 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP4_29200
     * @tc.name      testConcatTime0292
     * @tc.desc      Verify time composition 0:41:10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0292', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0292 begin');
      expect(util.concatTime(0, 41, 10)).assertEqual('004110');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0292 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP4_29300
     * @tc.name      testConcatTime0293
     * @tc.desc      Verify time composition 0:41:30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0293', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0293 begin');
      expect(util.concatTime(0, 41, 30)).assertEqual('004130');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0293 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP4_29400
     * @tc.name      testConcatTime0294
     * @tc.desc      Verify time composition 0:41:59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0294', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0294 begin');
      expect(util.concatTime(0, 41, 59)).assertEqual('004159');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0294 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP4_29500
     * @tc.name      testConcatTime0295
     * @tc.desc      Verify time composition 0:42:0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0295', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0295 begin');
      expect(util.concatTime(0, 42, 0)).assertEqual('004200');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0295 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP4_29600
     * @tc.name      testConcatTime0296
     * @tc.desc      Verify time composition 0:42:1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0296', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0296 begin');
      expect(util.concatTime(0, 42, 1)).assertEqual('004201');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0296 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP4_29700
     * @tc.name      testConcatTime0297
     * @tc.desc      Verify time composition 0:42:5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0297', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0297 begin');
      expect(util.concatTime(0, 42, 5)).assertEqual('004205');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0297 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP4_29800
     * @tc.name      testConcatTime0298
     * @tc.desc      Verify time composition 0:42:9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0298', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0298 begin');
      expect(util.concatTime(0, 42, 9)).assertEqual('004209');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0298 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP4_29900
     * @tc.name      testConcatTime0299
     * @tc.desc      Verify time composition 0:42:10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0299', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0299 begin');
      expect(util.concatTime(0, 42, 10)).assertEqual('004210');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0299 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP4_30000
     * @tc.name      testConcatTime0300
     * @tc.desc      Verify time composition 0:42:30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0300 begin');
      expect(util.concatTime(0, 42, 30)).assertEqual('004230');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0300 end');
    })

  })
}
