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

export default function DateTimeConcatTimeMatrixPart3Test(): void {
  describe('DateTimeConcatTimeMatrixPart3', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })


    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_0100
     * @tc.name      testConcatTime0181
     * @tc.desc      Verify time composition 0:25:30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0181 begin');
      expect(util.concatTime(0, 25, 30)).assertEqual('002530');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0181 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_0200
     * @tc.name      testConcatTime0182
     * @tc.desc      Verify time composition 0:25:59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0182 begin');
      expect(util.concatTime(0, 25, 59)).assertEqual('002559');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0182 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_0300
     * @tc.name      testConcatTime0183
     * @tc.desc      Verify time composition 0:26:0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0183 begin');
      expect(util.concatTime(0, 26, 0)).assertEqual('002600');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0183 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_0400
     * @tc.name      testConcatTime0184
     * @tc.desc      Verify time composition 0:26:1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0184 begin');
      expect(util.concatTime(0, 26, 1)).assertEqual('002601');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0184 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_0500
     * @tc.name      testConcatTime0185
     * @tc.desc      Verify time composition 0:26:5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0185 begin');
      expect(util.concatTime(0, 26, 5)).assertEqual('002605');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0185 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_0600
     * @tc.name      testConcatTime0186
     * @tc.desc      Verify time composition 0:26:9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0186 begin');
      expect(util.concatTime(0, 26, 9)).assertEqual('002609');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0186 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_0700
     * @tc.name      testConcatTime0187
     * @tc.desc      Verify time composition 0:26:10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0187 begin');
      expect(util.concatTime(0, 26, 10)).assertEqual('002610');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0187 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_0800
     * @tc.name      testConcatTime0188
     * @tc.desc      Verify time composition 0:26:30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0188 begin');
      expect(util.concatTime(0, 26, 30)).assertEqual('002630');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0188 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_0900
     * @tc.name      testConcatTime0189
     * @tc.desc      Verify time composition 0:26:59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0189 begin');
      expect(util.concatTime(0, 26, 59)).assertEqual('002659');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0189 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_1000
     * @tc.name      testConcatTime0190
     * @tc.desc      Verify time composition 0:27:0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0190 begin');
      expect(util.concatTime(0, 27, 0)).assertEqual('002700');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0190 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_1100
     * @tc.name      testConcatTime0191
     * @tc.desc      Verify time composition 0:27:1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0191 begin');
      expect(util.concatTime(0, 27, 1)).assertEqual('002701');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0191 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_1200
     * @tc.name      testConcatTime0192
     * @tc.desc      Verify time composition 0:27:5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0192 begin');
      expect(util.concatTime(0, 27, 5)).assertEqual('002705');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0192 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_1300
     * @tc.name      testConcatTime0193
     * @tc.desc      Verify time composition 0:27:9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0193 begin');
      expect(util.concatTime(0, 27, 9)).assertEqual('002709');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0193 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_1400
     * @tc.name      testConcatTime0194
     * @tc.desc      Verify time composition 0:27:10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0194 begin');
      expect(util.concatTime(0, 27, 10)).assertEqual('002710');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0194 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_1500
     * @tc.name      testConcatTime0195
     * @tc.desc      Verify time composition 0:27:30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0195 begin');
      expect(util.concatTime(0, 27, 30)).assertEqual('002730');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0195 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_1600
     * @tc.name      testConcatTime0196
     * @tc.desc      Verify time composition 0:27:59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0196 begin');
      expect(util.concatTime(0, 27, 59)).assertEqual('002759');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0196 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_1700
     * @tc.name      testConcatTime0197
     * @tc.desc      Verify time composition 0:28:0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0197 begin');
      expect(util.concatTime(0, 28, 0)).assertEqual('002800');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0197 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_1800
     * @tc.name      testConcatTime0198
     * @tc.desc      Verify time composition 0:28:1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0198 begin');
      expect(util.concatTime(0, 28, 1)).assertEqual('002801');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0198 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_1900
     * @tc.name      testConcatTime0199
     * @tc.desc      Verify time composition 0:28:5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0199 begin');
      expect(util.concatTime(0, 28, 5)).assertEqual('002805');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0199 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_2000
     * @tc.name      testConcatTime0200
     * @tc.desc      Verify time composition 0:28:9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0200 begin');
      expect(util.concatTime(0, 28, 9)).assertEqual('002809');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0200 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_2100
     * @tc.name      testConcatTime0201
     * @tc.desc      Verify time composition 0:28:10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0201 begin');
      expect(util.concatTime(0, 28, 10)).assertEqual('002810');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0201 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_2200
     * @tc.name      testConcatTime0202
     * @tc.desc      Verify time composition 0:28:30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0202 begin');
      expect(util.concatTime(0, 28, 30)).assertEqual('002830');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0202 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_2300
     * @tc.name      testConcatTime0203
     * @tc.desc      Verify time composition 0:28:59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0203 begin');
      expect(util.concatTime(0, 28, 59)).assertEqual('002859');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0203 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_2400
     * @tc.name      testConcatTime0204
     * @tc.desc      Verify time composition 0:29:0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0204 begin');
      expect(util.concatTime(0, 29, 0)).assertEqual('002900');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0204 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_2500
     * @tc.name      testConcatTime0205
     * @tc.desc      Verify time composition 0:29:1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0205 begin');
      expect(util.concatTime(0, 29, 1)).assertEqual('002901');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0205 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_2600
     * @tc.name      testConcatTime0206
     * @tc.desc      Verify time composition 0:29:5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0206 begin');
      expect(util.concatTime(0, 29, 5)).assertEqual('002905');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0206 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_2700
     * @tc.name      testConcatTime0207
     * @tc.desc      Verify time composition 0:29:9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0207 begin');
      expect(util.concatTime(0, 29, 9)).assertEqual('002909');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0207 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_2800
     * @tc.name      testConcatTime0208
     * @tc.desc      Verify time composition 0:29:10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0208 begin');
      expect(util.concatTime(0, 29, 10)).assertEqual('002910');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0208 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_2900
     * @tc.name      testConcatTime0209
     * @tc.desc      Verify time composition 0:29:30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0209 begin');
      expect(util.concatTime(0, 29, 30)).assertEqual('002930');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0209 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_3000
     * @tc.name      testConcatTime0210
     * @tc.desc      Verify time composition 0:29:59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0210 begin');
      expect(util.concatTime(0, 29, 59)).assertEqual('002959');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0210 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_3100
     * @tc.name      testConcatTime0211
     * @tc.desc      Verify time composition 0:30:0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0211 begin');
      expect(util.concatTime(0, 30, 0)).assertEqual('003000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0211 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_3200
     * @tc.name      testConcatTime0212
     * @tc.desc      Verify time composition 0:30:1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0212 begin');
      expect(util.concatTime(0, 30, 1)).assertEqual('003001');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0212 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_3300
     * @tc.name      testConcatTime0213
     * @tc.desc      Verify time composition 0:30:5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0213 begin');
      expect(util.concatTime(0, 30, 5)).assertEqual('003005');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0213 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_3400
     * @tc.name      testConcatTime0214
     * @tc.desc      Verify time composition 0:30:9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0214 begin');
      expect(util.concatTime(0, 30, 9)).assertEqual('003009');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0214 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_3500
     * @tc.name      testConcatTime0215
     * @tc.desc      Verify time composition 0:30:10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0215 begin');
      expect(util.concatTime(0, 30, 10)).assertEqual('003010');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0215 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_3600
     * @tc.name      testConcatTime0216
     * @tc.desc      Verify time composition 0:30:30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0216 begin');
      expect(util.concatTime(0, 30, 30)).assertEqual('003030');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0216 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_3700
     * @tc.name      testConcatTime0217
     * @tc.desc      Verify time composition 0:30:59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0217 begin');
      expect(util.concatTime(0, 30, 59)).assertEqual('003059');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0217 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_3800
     * @tc.name      testConcatTime0218
     * @tc.desc      Verify time composition 0:31:0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0218 begin');
      expect(util.concatTime(0, 31, 0)).assertEqual('003100');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0218 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_3900
     * @tc.name      testConcatTime0219
     * @tc.desc      Verify time composition 0:31:1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0219 begin');
      expect(util.concatTime(0, 31, 1)).assertEqual('003101');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0219 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_4000
     * @tc.name      testConcatTime0220
     * @tc.desc      Verify time composition 0:31:5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0220 begin');
      expect(util.concatTime(0, 31, 5)).assertEqual('003105');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0220 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_4100
     * @tc.name      testConcatTime0221
     * @tc.desc      Verify time composition 0:31:9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0221 begin');
      expect(util.concatTime(0, 31, 9)).assertEqual('003109');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0221 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_4200
     * @tc.name      testConcatTime0222
     * @tc.desc      Verify time composition 0:31:10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0222 begin');
      expect(util.concatTime(0, 31, 10)).assertEqual('003110');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0222 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_4300
     * @tc.name      testConcatTime0223
     * @tc.desc      Verify time composition 0:31:30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0223 begin');
      expect(util.concatTime(0, 31, 30)).assertEqual('003130');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0223 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_4400
     * @tc.name      testConcatTime0224
     * @tc.desc      Verify time composition 0:31:59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0224 begin');
      expect(util.concatTime(0, 31, 59)).assertEqual('003159');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0224 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_4500
     * @tc.name      testConcatTime0225
     * @tc.desc      Verify time composition 0:32:0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0225 begin');
      expect(util.concatTime(0, 32, 0)).assertEqual('003200');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0225 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_4600
     * @tc.name      testConcatTime0226
     * @tc.desc      Verify time composition 0:32:1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0226 begin');
      expect(util.concatTime(0, 32, 1)).assertEqual('003201');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0226 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_4700
     * @tc.name      testConcatTime0227
     * @tc.desc      Verify time composition 0:32:5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0227 begin');
      expect(util.concatTime(0, 32, 5)).assertEqual('003205');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0227 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_4800
     * @tc.name      testConcatTime0228
     * @tc.desc      Verify time composition 0:32:9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0228 begin');
      expect(util.concatTime(0, 32, 9)).assertEqual('003209');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0228 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_4900
     * @tc.name      testConcatTime0229
     * @tc.desc      Verify time composition 0:32:10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0229 begin');
      expect(util.concatTime(0, 32, 10)).assertEqual('003210');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0229 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_5000
     * @tc.name      testConcatTime0230
     * @tc.desc      Verify time composition 0:32:30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0230 begin');
      expect(util.concatTime(0, 32, 30)).assertEqual('003230');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0230 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_5100
     * @tc.name      testConcatTime0231
     * @tc.desc      Verify time composition 0:32:59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0231 begin');
      expect(util.concatTime(0, 32, 59)).assertEqual('003259');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0231 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_5200
     * @tc.name      testConcatTime0232
     * @tc.desc      Verify time composition 0:33:0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0232 begin');
      expect(util.concatTime(0, 33, 0)).assertEqual('003300');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0232 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_5300
     * @tc.name      testConcatTime0233
     * @tc.desc      Verify time composition 0:33:1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0233 begin');
      expect(util.concatTime(0, 33, 1)).assertEqual('003301');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0233 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_5400
     * @tc.name      testConcatTime0234
     * @tc.desc      Verify time composition 0:33:5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0234 begin');
      expect(util.concatTime(0, 33, 5)).assertEqual('003305');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0234 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_5500
     * @tc.name      testConcatTime0235
     * @tc.desc      Verify time composition 0:33:9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0235 begin');
      expect(util.concatTime(0, 33, 9)).assertEqual('003309');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0235 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_5600
     * @tc.name      testConcatTime0236
     * @tc.desc      Verify time composition 0:33:10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0236 begin');
      expect(util.concatTime(0, 33, 10)).assertEqual('003310');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0236 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_5700
     * @tc.name      testConcatTime0237
     * @tc.desc      Verify time composition 0:33:30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0237 begin');
      expect(util.concatTime(0, 33, 30)).assertEqual('003330');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0237 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_5800
     * @tc.name      testConcatTime0238
     * @tc.desc      Verify time composition 0:33:59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0238 begin');
      expect(util.concatTime(0, 33, 59)).assertEqual('003359');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0238 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_5900
     * @tc.name      testConcatTime0239
     * @tc.desc      Verify time composition 0:34:0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0239 begin');
      expect(util.concatTime(0, 34, 0)).assertEqual('003400');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0239 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_6000
     * @tc.name      testConcatTime0240
     * @tc.desc      Verify time composition 0:34:1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0240 begin');
      expect(util.concatTime(0, 34, 1)).assertEqual('003401');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0240 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_6100
     * @tc.name      testConcatTime0241
     * @tc.desc      Verify time composition 0:34:5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0241 begin');
      expect(util.concatTime(0, 34, 5)).assertEqual('003405');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0241 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_6200
     * @tc.name      testConcatTime0242
     * @tc.desc      Verify time composition 0:34:9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0242 begin');
      expect(util.concatTime(0, 34, 9)).assertEqual('003409');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0242 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_6300
     * @tc.name      testConcatTime0243
     * @tc.desc      Verify time composition 0:34:10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0243 begin');
      expect(util.concatTime(0, 34, 10)).assertEqual('003410');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0243 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_6400
     * @tc.name      testConcatTime0244
     * @tc.desc      Verify time composition 0:34:30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0244 begin');
      expect(util.concatTime(0, 34, 30)).assertEqual('003430');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0244 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_6500
     * @tc.name      testConcatTime0245
     * @tc.desc      Verify time composition 0:34:59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0245 begin');
      expect(util.concatTime(0, 34, 59)).assertEqual('003459');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0245 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_6600
     * @tc.name      testConcatTime0246
     * @tc.desc      Verify time composition 0:35:0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0246 begin');
      expect(util.concatTime(0, 35, 0)).assertEqual('003500');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0246 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_6700
     * @tc.name      testConcatTime0247
     * @tc.desc      Verify time composition 0:35:1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0247 begin');
      expect(util.concatTime(0, 35, 1)).assertEqual('003501');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0247 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_6800
     * @tc.name      testConcatTime0248
     * @tc.desc      Verify time composition 0:35:5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0248 begin');
      expect(util.concatTime(0, 35, 5)).assertEqual('003505');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0248 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_6900
     * @tc.name      testConcatTime0249
     * @tc.desc      Verify time composition 0:35:9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0249 begin');
      expect(util.concatTime(0, 35, 9)).assertEqual('003509');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0249 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_7000
     * @tc.name      testConcatTime0250
     * @tc.desc      Verify time composition 0:35:10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0250 begin');
      expect(util.concatTime(0, 35, 10)).assertEqual('003510');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0250 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_7100
     * @tc.name      testConcatTime0251
     * @tc.desc      Verify time composition 0:35:30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0251 begin');
      expect(util.concatTime(0, 35, 30)).assertEqual('003530');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0251 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_7200
     * @tc.name      testConcatTime0252
     * @tc.desc      Verify time composition 0:35:59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0252 begin');
      expect(util.concatTime(0, 35, 59)).assertEqual('003559');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0252 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_7300
     * @tc.name      testConcatTime0253
     * @tc.desc      Verify time composition 0:36:0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0253 begin');
      expect(util.concatTime(0, 36, 0)).assertEqual('003600');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0253 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_7400
     * @tc.name      testConcatTime0254
     * @tc.desc      Verify time composition 0:36:1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0254 begin');
      expect(util.concatTime(0, 36, 1)).assertEqual('003601');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0254 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_7500
     * @tc.name      testConcatTime0255
     * @tc.desc      Verify time composition 0:36:5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0255 begin');
      expect(util.concatTime(0, 36, 5)).assertEqual('003605');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0255 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_7600
     * @tc.name      testConcatTime0256
     * @tc.desc      Verify time composition 0:36:9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0256 begin');
      expect(util.concatTime(0, 36, 9)).assertEqual('003609');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0256 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_7700
     * @tc.name      testConcatTime0257
     * @tc.desc      Verify time composition 0:36:10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0257 begin');
      expect(util.concatTime(0, 36, 10)).assertEqual('003610');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0257 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_7800
     * @tc.name      testConcatTime0258
     * @tc.desc      Verify time composition 0:36:30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0258 begin');
      expect(util.concatTime(0, 36, 30)).assertEqual('003630');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0258 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_7900
     * @tc.name      testConcatTime0259
     * @tc.desc      Verify time composition 0:36:59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0259 begin');
      expect(util.concatTime(0, 36, 59)).assertEqual('003659');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0259 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_8000
     * @tc.name      testConcatTime0260
     * @tc.desc      Verify time composition 0:37:0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0260', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0260 begin');
      expect(util.concatTime(0, 37, 0)).assertEqual('003700');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0260 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_8100
     * @tc.name      testConcatTime0261
     * @tc.desc      Verify time composition 0:37:1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0261', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0261 begin');
      expect(util.concatTime(0, 37, 1)).assertEqual('003701');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0261 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_8200
     * @tc.name      testConcatTime0262
     * @tc.desc      Verify time composition 0:37:5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0262', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0262 begin');
      expect(util.concatTime(0, 37, 5)).assertEqual('003705');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0262 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_8300
     * @tc.name      testConcatTime0263
     * @tc.desc      Verify time composition 0:37:9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0263', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0263 begin');
      expect(util.concatTime(0, 37, 9)).assertEqual('003709');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0263 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_8400
     * @tc.name      testConcatTime0264
     * @tc.desc      Verify time composition 0:37:10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0264', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0264 begin');
      expect(util.concatTime(0, 37, 10)).assertEqual('003710');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0264 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_8500
     * @tc.name      testConcatTime0265
     * @tc.desc      Verify time composition 0:37:30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0265', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0265 begin');
      expect(util.concatTime(0, 37, 30)).assertEqual('003730');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0265 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_8600
     * @tc.name      testConcatTime0266
     * @tc.desc      Verify time composition 0:37:59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0266', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0266 begin');
      expect(util.concatTime(0, 37, 59)).assertEqual('003759');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0266 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_8700
     * @tc.name      testConcatTime0267
     * @tc.desc      Verify time composition 0:38:0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0267', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0267 begin');
      expect(util.concatTime(0, 38, 0)).assertEqual('003800');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0267 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_8800
     * @tc.name      testConcatTime0268
     * @tc.desc      Verify time composition 0:38:1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0268', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0268 begin');
      expect(util.concatTime(0, 38, 1)).assertEqual('003801');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0268 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_8900
     * @tc.name      testConcatTime0269
     * @tc.desc      Verify time composition 0:38:5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0269', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0269 begin');
      expect(util.concatTime(0, 38, 5)).assertEqual('003805');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0269 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP3_ONE_9000
     * @tc.name      testConcatTime0270
     * @tc.desc      Verify time composition 0:38:9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0270', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0270 begin');
      expect(util.concatTime(0, 38, 9)).assertEqual('003809');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0270 end');
    })

  })
}
