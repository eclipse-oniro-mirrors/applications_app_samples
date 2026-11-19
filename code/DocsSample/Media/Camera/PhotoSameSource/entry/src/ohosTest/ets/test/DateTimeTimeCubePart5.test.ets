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
import DateTimeUtil from '../../../main/ets/common/utils/DateTimeUtil';

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF812;
const TAG: string = '[Sample_PhotoSameSource]';

export default function DateTimeTimeCubePart5Test(): void {
  describe('DateTimeTimeCubePart5', () => {

    /**
     * @tc.number    SUB_PHOTO_TCUBP5_16100
     * @tc.name      testTimeCube0161
     * @tc.desc      Verify concatTime(18, 0, 30) pads to 180030.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0161 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(18, 0, 30)).assertEqual('180030');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0161 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP5_16200
     * @tc.name      testTimeCube0162
     * @tc.desc      Verify concatTime(18, 0, 59) pads to 180059.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0162 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(18, 0, 59)).assertEqual('180059');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0162 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP5_16300
     * @tc.name      testTimeCube0163
     * @tc.desc      Verify concatTime(18, 30, 0) pads to 183000.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0163 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(18, 30, 0)).assertEqual('183000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0163 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP5_16400
     * @tc.name      testTimeCube0164
     * @tc.desc      Verify concatTime(18, 30, 30) pads to 183030.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0164 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(18, 30, 30)).assertEqual('183030');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0164 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP5_16500
     * @tc.name      testTimeCube0165
     * @tc.desc      Verify concatTime(18, 30, 59) pads to 183059.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0165 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(18, 30, 59)).assertEqual('183059');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0165 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP5_16600
     * @tc.name      testTimeCube0166
     * @tc.desc      Verify concatTime(18, 59, 0) pads to 185900.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0166 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(18, 59, 0)).assertEqual('185900');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0166 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP5_16700
     * @tc.name      testTimeCube0167
     * @tc.desc      Verify concatTime(18, 59, 30) pads to 185930.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0167 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(18, 59, 30)).assertEqual('185930');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0167 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP5_16800
     * @tc.name      testTimeCube0168
     * @tc.desc      Verify concatTime(18, 59, 59) pads to 185959.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0168 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(18, 59, 59)).assertEqual('185959');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0168 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP5_16900
     * @tc.name      testTimeCube0169
     * @tc.desc      Verify concatTime(19, 0, 0) pads to 190000.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0169 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(19, 0, 0)).assertEqual('190000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0169 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP5_17000
     * @tc.name      testTimeCube0170
     * @tc.desc      Verify concatTime(19, 0, 30) pads to 190030.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0170 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(19, 0, 30)).assertEqual('190030');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0170 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP5_17100
     * @tc.name      testTimeCube0171
     * @tc.desc      Verify concatTime(19, 0, 59) pads to 190059.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0171 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(19, 0, 59)).assertEqual('190059');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0171 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP5_17200
     * @tc.name      testTimeCube0172
     * @tc.desc      Verify concatTime(19, 30, 0) pads to 193000.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0172 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(19, 30, 0)).assertEqual('193000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0172 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP5_17300
     * @tc.name      testTimeCube0173
     * @tc.desc      Verify concatTime(19, 30, 30) pads to 193030.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0173 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(19, 30, 30)).assertEqual('193030');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0173 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP5_17400
     * @tc.name      testTimeCube0174
     * @tc.desc      Verify concatTime(19, 30, 59) pads to 193059.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0174 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(19, 30, 59)).assertEqual('193059');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0174 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP5_17500
     * @tc.name      testTimeCube0175
     * @tc.desc      Verify concatTime(19, 59, 0) pads to 195900.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0175 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(19, 59, 0)).assertEqual('195900');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0175 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP5_17600
     * @tc.name      testTimeCube0176
     * @tc.desc      Verify concatTime(19, 59, 30) pads to 195930.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0176 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(19, 59, 30)).assertEqual('195930');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0176 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP5_17700
     * @tc.name      testTimeCube0177
     * @tc.desc      Verify concatTime(19, 59, 59) pads to 195959.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0177 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(19, 59, 59)).assertEqual('195959');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0177 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP5_17800
     * @tc.name      testTimeCube0178
     * @tc.desc      Verify concatTime(20, 0, 0) pads to 200000.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0178 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(20, 0, 0)).assertEqual('200000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0178 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP5_17900
     * @tc.name      testTimeCube0179
     * @tc.desc      Verify concatTime(20, 0, 30) pads to 200030.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0179 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(20, 0, 30)).assertEqual('200030');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0179 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP5_18000
     * @tc.name      testTimeCube0180
     * @tc.desc      Verify concatTime(20, 0, 59) pads to 200059.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0180 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(20, 0, 59)).assertEqual('200059');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0180 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP5_18100
     * @tc.name      testTimeCube0181
     * @tc.desc      Verify concatTime(20, 30, 0) pads to 203000.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0181 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(20, 30, 0)).assertEqual('203000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0181 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP5_18200
     * @tc.name      testTimeCube0182
     * @tc.desc      Verify concatTime(20, 30, 30) pads to 203030.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0182 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(20, 30, 30)).assertEqual('203030');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0182 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP5_18300
     * @tc.name      testTimeCube0183
     * @tc.desc      Verify concatTime(20, 30, 59) pads to 203059.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0183 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(20, 30, 59)).assertEqual('203059');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0183 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP5_18400
     * @tc.name      testTimeCube0184
     * @tc.desc      Verify concatTime(20, 59, 0) pads to 205900.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0184 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(20, 59, 0)).assertEqual('205900');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0184 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP5_18500
     * @tc.name      testTimeCube0185
     * @tc.desc      Verify concatTime(20, 59, 30) pads to 205930.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0185 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(20, 59, 30)).assertEqual('205930');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0185 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP5_18600
     * @tc.name      testTimeCube0186
     * @tc.desc      Verify concatTime(20, 59, 59) pads to 205959.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0186 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(20, 59, 59)).assertEqual('205959');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0186 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP5_18700
     * @tc.name      testTimeCube0187
     * @tc.desc      Verify concatTime(21, 0, 0) pads to 210000.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0187 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(21, 0, 0)).assertEqual('210000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0187 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP5_18800
     * @tc.name      testTimeCube0188
     * @tc.desc      Verify concatTime(21, 0, 30) pads to 210030.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0188 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(21, 0, 30)).assertEqual('210030');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0188 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP5_18900
     * @tc.name      testTimeCube0189
     * @tc.desc      Verify concatTime(21, 0, 59) pads to 210059.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0189 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(21, 0, 59)).assertEqual('210059');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0189 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP5_19000
     * @tc.name      testTimeCube0190
     * @tc.desc      Verify concatTime(21, 30, 0) pads to 213000.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0190 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(21, 30, 0)).assertEqual('213000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0190 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP5_19100
     * @tc.name      testTimeCube0191
     * @tc.desc      Verify concatTime(21, 30, 30) pads to 213030.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0191 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(21, 30, 30)).assertEqual('213030');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0191 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP5_19200
     * @tc.name      testTimeCube0192
     * @tc.desc      Verify concatTime(21, 30, 59) pads to 213059.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0192 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(21, 30, 59)).assertEqual('213059');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0192 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP5_19300
     * @tc.name      testTimeCube0193
     * @tc.desc      Verify concatTime(21, 59, 0) pads to 215900.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0193 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(21, 59, 0)).assertEqual('215900');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0193 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP5_19400
     * @tc.name      testTimeCube0194
     * @tc.desc      Verify concatTime(21, 59, 30) pads to 215930.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0194 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(21, 59, 30)).assertEqual('215930');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0194 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP5_19500
     * @tc.name      testTimeCube0195
     * @tc.desc      Verify concatTime(21, 59, 59) pads to 215959.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0195 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(21, 59, 59)).assertEqual('215959');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0195 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP5_19600
     * @tc.name      testTimeCube0196
     * @tc.desc      Verify concatTime(22, 0, 0) pads to 220000.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0196 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(22, 0, 0)).assertEqual('220000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0196 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP5_19700
     * @tc.name      testTimeCube0197
     * @tc.desc      Verify concatTime(22, 0, 30) pads to 220030.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0197 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(22, 0, 30)).assertEqual('220030');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0197 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP5_19800
     * @tc.name      testTimeCube0198
     * @tc.desc      Verify concatTime(22, 0, 59) pads to 220059.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0198 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(22, 0, 59)).assertEqual('220059');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0198 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP5_19900
     * @tc.name      testTimeCube0199
     * @tc.desc      Verify concatTime(22, 30, 0) pads to 223000.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0199 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(22, 30, 0)).assertEqual('223000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0199 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP5_20000
     * @tc.name      testTimeCube0200
     * @tc.desc      Verify concatTime(22, 30, 30) pads to 223030.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0200 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(22, 30, 30)).assertEqual('223030');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0200 end');
    })

  })
}
