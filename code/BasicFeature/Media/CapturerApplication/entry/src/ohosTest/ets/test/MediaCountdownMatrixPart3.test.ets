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
import { MediaTools } from '../../../main/ets/common/utils/mediaUtils/MediaTools';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CapturerApplication]';

export default function MediaCountdownMatrixPart3Test(): void {
  describe('MediaCountdownMatrixPart3', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })


    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP3_ONE_0100
     * @tc.name      testCountdown0181
     * @tc.desc      Verify countdown text for 173000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0181 begin');
      expect(MediaTools.msToCountdownTime(173000)).assertEqual('02:53');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0181 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP3_ONE_0200
     * @tc.name      testCountdown0182
     * @tc.desc      Verify countdown text for 174000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0182 begin');
      expect(MediaTools.msToCountdownTime(174000)).assertEqual('02:54');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0182 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP3_ONE_0300
     * @tc.name      testCountdown0183
     * @tc.desc      Verify countdown text for 175000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0183 begin');
      expect(MediaTools.msToCountdownTime(175000)).assertEqual('02:55');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0183 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP3_ONE_0400
     * @tc.name      testCountdown0184
     * @tc.desc      Verify countdown text for 176000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0184 begin');
      expect(MediaTools.msToCountdownTime(176000)).assertEqual('02:56');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0184 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP3_ONE_0500
     * @tc.name      testCountdown0185
     * @tc.desc      Verify countdown text for 177000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0185 begin');
      expect(MediaTools.msToCountdownTime(177000)).assertEqual('02:57');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0185 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP3_ONE_0600
     * @tc.name      testCountdown0186
     * @tc.desc      Verify countdown text for 178000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0186 begin');
      expect(MediaTools.msToCountdownTime(178000)).assertEqual('02:58');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0186 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP3_ONE_0700
     * @tc.name      testCountdown0187
     * @tc.desc      Verify countdown text for 179000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0187 begin');
      expect(MediaTools.msToCountdownTime(179000)).assertEqual('02:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0187 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP3_ONE_0800
     * @tc.name      testCountdown0188
     * @tc.desc      Verify countdown text for 180000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0188 begin');
      expect(MediaTools.msToCountdownTime(180000)).assertEqual('03:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0188 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP3_ONE_0900
     * @tc.name      testCountdown0189
     * @tc.desc      Verify countdown text for 181000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0189 begin');
      expect(MediaTools.msToCountdownTime(181000)).assertEqual('03:01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0189 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP3_ONE_1000
     * @tc.name      testCountdown0190
     * @tc.desc      Verify countdown text for 182000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0190 begin');
      expect(MediaTools.msToCountdownTime(182000)).assertEqual('03:02');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0190 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP3_ONE_1100
     * @tc.name      testCountdown0191
     * @tc.desc      Verify countdown text for 183000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0191 begin');
      expect(MediaTools.msToCountdownTime(183000)).assertEqual('03:03');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0191 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP3_ONE_1200
     * @tc.name      testCountdown0192
     * @tc.desc      Verify countdown text for 184000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0192 begin');
      expect(MediaTools.msToCountdownTime(184000)).assertEqual('03:04');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0192 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP3_ONE_1300
     * @tc.name      testCountdown0193
     * @tc.desc      Verify countdown text for 185000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0193 begin');
      expect(MediaTools.msToCountdownTime(185000)).assertEqual('03:05');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0193 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP3_ONE_1400
     * @tc.name      testCountdown0194
     * @tc.desc      Verify countdown text for 186000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0194 begin');
      expect(MediaTools.msToCountdownTime(186000)).assertEqual('03:06');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0194 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP3_ONE_1500
     * @tc.name      testCountdown0195
     * @tc.desc      Verify countdown text for 187000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0195 begin');
      expect(MediaTools.msToCountdownTime(187000)).assertEqual('03:07');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0195 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP3_ONE_1600
     * @tc.name      testCountdown0196
     * @tc.desc      Verify countdown text for 188000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0196 begin');
      expect(MediaTools.msToCountdownTime(188000)).assertEqual('03:08');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0196 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP3_ONE_1700
     * @tc.name      testCountdown0197
     * @tc.desc      Verify countdown text for 189000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0197 begin');
      expect(MediaTools.msToCountdownTime(189000)).assertEqual('03:09');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0197 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP3_ONE_1800
     * @tc.name      testCountdown0198
     * @tc.desc      Verify countdown text for 190000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0198 begin');
      expect(MediaTools.msToCountdownTime(190000)).assertEqual('03:10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0198 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP3_ONE_1900
     * @tc.name      testCountdown0199
     * @tc.desc      Verify countdown text for 191000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0199 begin');
      expect(MediaTools.msToCountdownTime(191000)).assertEqual('03:11');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0199 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP3_ONE_2000
     * @tc.name      testCountdown0200
     * @tc.desc      Verify countdown text for 192000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0200 begin');
      expect(MediaTools.msToCountdownTime(192000)).assertEqual('03:12');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0200 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP3_ONE_2100
     * @tc.name      testCountdown0201
     * @tc.desc      Verify countdown text for 193000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0201 begin');
      expect(MediaTools.msToCountdownTime(193000)).assertEqual('03:13');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0201 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP3_ONE_2200
     * @tc.name      testCountdown0202
     * @tc.desc      Verify countdown text for 194000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0202 begin');
      expect(MediaTools.msToCountdownTime(194000)).assertEqual('03:14');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0202 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP3_ONE_2300
     * @tc.name      testCountdown0203
     * @tc.desc      Verify countdown text for 195000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0203 begin');
      expect(MediaTools.msToCountdownTime(195000)).assertEqual('03:15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0203 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP3_ONE_2400
     * @tc.name      testCountdown0204
     * @tc.desc      Verify countdown text for 196000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0204 begin');
      expect(MediaTools.msToCountdownTime(196000)).assertEqual('03:16');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0204 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP3_ONE_2500
     * @tc.name      testCountdown0205
     * @tc.desc      Verify countdown text for 197000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0205 begin');
      expect(MediaTools.msToCountdownTime(197000)).assertEqual('03:17');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0205 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP3_ONE_2600
     * @tc.name      testCountdown0206
     * @tc.desc      Verify countdown text for 198000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0206 begin');
      expect(MediaTools.msToCountdownTime(198000)).assertEqual('03:18');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0206 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP3_ONE_2700
     * @tc.name      testCountdown0207
     * @tc.desc      Verify countdown text for 199000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0207 begin');
      expect(MediaTools.msToCountdownTime(199000)).assertEqual('03:19');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0207 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP3_ONE_2800
     * @tc.name      testCountdown0208
     * @tc.desc      Verify countdown text for 200000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0208 begin');
      expect(MediaTools.msToCountdownTime(200000)).assertEqual('03:20');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0208 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP3_ONE_2900
     * @tc.name      testCountdown0209
     * @tc.desc      Verify countdown text for 201000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0209 begin');
      expect(MediaTools.msToCountdownTime(201000)).assertEqual('03:21');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0209 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP3_ONE_3000
     * @tc.name      testCountdown0210
     * @tc.desc      Verify countdown text for 202000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0210 begin');
      expect(MediaTools.msToCountdownTime(202000)).assertEqual('03:22');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0210 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP3_ONE_3100
     * @tc.name      testCountdown0211
     * @tc.desc      Verify countdown text for 203000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0211 begin');
      expect(MediaTools.msToCountdownTime(203000)).assertEqual('03:23');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0211 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP3_ONE_3200
     * @tc.name      testCountdown0212
     * @tc.desc      Verify countdown text for 204000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0212 begin');
      expect(MediaTools.msToCountdownTime(204000)).assertEqual('03:24');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0212 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP3_ONE_3300
     * @tc.name      testCountdown0213
     * @tc.desc      Verify countdown text for 205000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0213 begin');
      expect(MediaTools.msToCountdownTime(205000)).assertEqual('03:25');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0213 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP3_ONE_3400
     * @tc.name      testCountdown0214
     * @tc.desc      Verify countdown text for 206000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0214 begin');
      expect(MediaTools.msToCountdownTime(206000)).assertEqual('03:26');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0214 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP3_ONE_3500
     * @tc.name      testCountdown0215
     * @tc.desc      Verify countdown text for 207000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0215 begin');
      expect(MediaTools.msToCountdownTime(207000)).assertEqual('03:27');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0215 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP3_ONE_3600
     * @tc.name      testCountdown0216
     * @tc.desc      Verify countdown text for 208000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0216 begin');
      expect(MediaTools.msToCountdownTime(208000)).assertEqual('03:28');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0216 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP3_ONE_3700
     * @tc.name      testCountdown0217
     * @tc.desc      Verify countdown text for 209000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0217 begin');
      expect(MediaTools.msToCountdownTime(209000)).assertEqual('03:29');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0217 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP3_ONE_3800
     * @tc.name      testCountdown0218
     * @tc.desc      Verify countdown text for 210000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0218 begin');
      expect(MediaTools.msToCountdownTime(210000)).assertEqual('03:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0218 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP3_ONE_3900
     * @tc.name      testCountdown0219
     * @tc.desc      Verify countdown text for 211000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0219 begin');
      expect(MediaTools.msToCountdownTime(211000)).assertEqual('03:31');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0219 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP3_ONE_4000
     * @tc.name      testCountdown0220
     * @tc.desc      Verify countdown text for 212000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0220 begin');
      expect(MediaTools.msToCountdownTime(212000)).assertEqual('03:32');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0220 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP3_ONE_4100
     * @tc.name      testCountdown0221
     * @tc.desc      Verify countdown text for 213000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0221 begin');
      expect(MediaTools.msToCountdownTime(213000)).assertEqual('03:33');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0221 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP3_ONE_4200
     * @tc.name      testCountdown0222
     * @tc.desc      Verify countdown text for 214000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0222 begin');
      expect(MediaTools.msToCountdownTime(214000)).assertEqual('03:34');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0222 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP3_ONE_4300
     * @tc.name      testCountdown0223
     * @tc.desc      Verify countdown text for 215000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0223 begin');
      expect(MediaTools.msToCountdownTime(215000)).assertEqual('03:35');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0223 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP3_ONE_4400
     * @tc.name      testCountdown0224
     * @tc.desc      Verify countdown text for 216000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0224 begin');
      expect(MediaTools.msToCountdownTime(216000)).assertEqual('03:36');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0224 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP3_ONE_4500
     * @tc.name      testCountdown0225
     * @tc.desc      Verify countdown text for 217000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0225 begin');
      expect(MediaTools.msToCountdownTime(217000)).assertEqual('03:37');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0225 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP3_ONE_4600
     * @tc.name      testCountdown0226
     * @tc.desc      Verify countdown text for 218000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0226 begin');
      expect(MediaTools.msToCountdownTime(218000)).assertEqual('03:38');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0226 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP3_ONE_4700
     * @tc.name      testCountdown0227
     * @tc.desc      Verify countdown text for 219000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0227 begin');
      expect(MediaTools.msToCountdownTime(219000)).assertEqual('03:39');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0227 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP3_ONE_4800
     * @tc.name      testCountdown0228
     * @tc.desc      Verify countdown text for 220000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0228 begin');
      expect(MediaTools.msToCountdownTime(220000)).assertEqual('03:40');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0228 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP3_ONE_4900
     * @tc.name      testCountdown0229
     * @tc.desc      Verify countdown text for 221000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0229 begin');
      expect(MediaTools.msToCountdownTime(221000)).assertEqual('03:41');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0229 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP3_ONE_5000
     * @tc.name      testCountdown0230
     * @tc.desc      Verify countdown text for 222000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0230 begin');
      expect(MediaTools.msToCountdownTime(222000)).assertEqual('03:42');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0230 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP3_ONE_5100
     * @tc.name      testCountdown0231
     * @tc.desc      Verify countdown text for 223000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0231 begin');
      expect(MediaTools.msToCountdownTime(223000)).assertEqual('03:43');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0231 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP3_ONE_5200
     * @tc.name      testCountdown0232
     * @tc.desc      Verify countdown text for 224000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0232 begin');
      expect(MediaTools.msToCountdownTime(224000)).assertEqual('03:44');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0232 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP3_ONE_5300
     * @tc.name      testCountdown0233
     * @tc.desc      Verify countdown text for 225000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0233 begin');
      expect(MediaTools.msToCountdownTime(225000)).assertEqual('03:45');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0233 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP3_ONE_5400
     * @tc.name      testCountdown0234
     * @tc.desc      Verify countdown text for 226000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0234 begin');
      expect(MediaTools.msToCountdownTime(226000)).assertEqual('03:46');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0234 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP3_ONE_5500
     * @tc.name      testCountdown0235
     * @tc.desc      Verify countdown text for 227000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0235 begin');
      expect(MediaTools.msToCountdownTime(227000)).assertEqual('03:47');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0235 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP3_ONE_5600
     * @tc.name      testCountdown0236
     * @tc.desc      Verify countdown text for 228000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0236 begin');
      expect(MediaTools.msToCountdownTime(228000)).assertEqual('03:48');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0236 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP3_ONE_5700
     * @tc.name      testCountdown0237
     * @tc.desc      Verify countdown text for 229000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0237 begin');
      expect(MediaTools.msToCountdownTime(229000)).assertEqual('03:49');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0237 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP3_ONE_5800
     * @tc.name      testCountdown0238
     * @tc.desc      Verify countdown text for 230000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0238 begin');
      expect(MediaTools.msToCountdownTime(230000)).assertEqual('03:50');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0238 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP3_ONE_5900
     * @tc.name      testCountdown0239
     * @tc.desc      Verify countdown text for 231000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0239 begin');
      expect(MediaTools.msToCountdownTime(231000)).assertEqual('03:51');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0239 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP3_ONE_6000
     * @tc.name      testCountdown0240
     * @tc.desc      Verify countdown text for 232000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0240 begin');
      expect(MediaTools.msToCountdownTime(232000)).assertEqual('03:52');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0240 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP3_ONE_6100
     * @tc.name      testCountdown0241
     * @tc.desc      Verify countdown text for 233000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0241 begin');
      expect(MediaTools.msToCountdownTime(233000)).assertEqual('03:53');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0241 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP3_ONE_6200
     * @tc.name      testCountdown0242
     * @tc.desc      Verify countdown text for 234000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0242 begin');
      expect(MediaTools.msToCountdownTime(234000)).assertEqual('03:54');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0242 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP3_ONE_6300
     * @tc.name      testCountdown0243
     * @tc.desc      Verify countdown text for 235000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0243 begin');
      expect(MediaTools.msToCountdownTime(235000)).assertEqual('03:55');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0243 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP3_ONE_6400
     * @tc.name      testCountdown0244
     * @tc.desc      Verify countdown text for 236000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0244 begin');
      expect(MediaTools.msToCountdownTime(236000)).assertEqual('03:56');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0244 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP3_ONE_6500
     * @tc.name      testCountdown0245
     * @tc.desc      Verify countdown text for 237000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0245 begin');
      expect(MediaTools.msToCountdownTime(237000)).assertEqual('03:57');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0245 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP3_ONE_6600
     * @tc.name      testCountdown0246
     * @tc.desc      Verify countdown text for 238000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0246 begin');
      expect(MediaTools.msToCountdownTime(238000)).assertEqual('03:58');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0246 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP3_ONE_6700
     * @tc.name      testCountdown0247
     * @tc.desc      Verify countdown text for 239000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0247 begin');
      expect(MediaTools.msToCountdownTime(239000)).assertEqual('03:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0247 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP3_ONE_6800
     * @tc.name      testCountdown0248
     * @tc.desc      Verify countdown text for 240000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0248 begin');
      expect(MediaTools.msToCountdownTime(240000)).assertEqual('04:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0248 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP3_ONE_6900
     * @tc.name      testCountdown0249
     * @tc.desc      Verify countdown text for 241000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0249 begin');
      expect(MediaTools.msToCountdownTime(241000)).assertEqual('04:01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0249 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP3_ONE_7000
     * @tc.name      testCountdown0250
     * @tc.desc      Verify countdown text for 242000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0250 begin');
      expect(MediaTools.msToCountdownTime(242000)).assertEqual('04:02');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0250 end');
    })

  })
}
