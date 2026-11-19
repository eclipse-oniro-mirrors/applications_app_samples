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

export default function DateTimeTimeCubePart4Test(): void {
  describe('DateTimeTimeCubePart4', () => {

    /**
     * @tc.number    SUB_PHOTO_TCUBP4_12100
     * @tc.name      testTimeCube0121
     * @tc.desc      Verify concatTime(13, 59, 0) pads to 135900.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0121 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(13, 59, 0)).assertEqual('135900');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0121 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP4_12200
     * @tc.name      testTimeCube0122
     * @tc.desc      Verify concatTime(13, 59, 30) pads to 135930.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0122 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(13, 59, 30)).assertEqual('135930');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0122 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP4_12300
     * @tc.name      testTimeCube0123
     * @tc.desc      Verify concatTime(13, 59, 59) pads to 135959.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0123 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(13, 59, 59)).assertEqual('135959');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0123 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP4_12400
     * @tc.name      testTimeCube0124
     * @tc.desc      Verify concatTime(14, 0, 0) pads to 140000.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0124 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(14, 0, 0)).assertEqual('140000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0124 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP4_12500
     * @tc.name      testTimeCube0125
     * @tc.desc      Verify concatTime(14, 0, 30) pads to 140030.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0125 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(14, 0, 30)).assertEqual('140030');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0125 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP4_12600
     * @tc.name      testTimeCube0126
     * @tc.desc      Verify concatTime(14, 0, 59) pads to 140059.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0126 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(14, 0, 59)).assertEqual('140059');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0126 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP4_12700
     * @tc.name      testTimeCube0127
     * @tc.desc      Verify concatTime(14, 30, 0) pads to 143000.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0127 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(14, 30, 0)).assertEqual('143000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0127 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP4_12800
     * @tc.name      testTimeCube0128
     * @tc.desc      Verify concatTime(14, 30, 30) pads to 143030.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0128 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(14, 30, 30)).assertEqual('143030');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0128 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP4_12900
     * @tc.name      testTimeCube0129
     * @tc.desc      Verify concatTime(14, 30, 59) pads to 143059.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0129 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(14, 30, 59)).assertEqual('143059');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0129 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP4_13000
     * @tc.name      testTimeCube0130
     * @tc.desc      Verify concatTime(14, 59, 0) pads to 145900.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0130 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(14, 59, 0)).assertEqual('145900');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0130 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP4_13100
     * @tc.name      testTimeCube0131
     * @tc.desc      Verify concatTime(14, 59, 30) pads to 145930.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0131 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(14, 59, 30)).assertEqual('145930');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0131 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP4_13200
     * @tc.name      testTimeCube0132
     * @tc.desc      Verify concatTime(14, 59, 59) pads to 145959.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0132 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(14, 59, 59)).assertEqual('145959');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0132 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP4_13300
     * @tc.name      testTimeCube0133
     * @tc.desc      Verify concatTime(15, 0, 0) pads to 150000.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0133 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(15, 0, 0)).assertEqual('150000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0133 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP4_13400
     * @tc.name      testTimeCube0134
     * @tc.desc      Verify concatTime(15, 0, 30) pads to 150030.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0134 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(15, 0, 30)).assertEqual('150030');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0134 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP4_13500
     * @tc.name      testTimeCube0135
     * @tc.desc      Verify concatTime(15, 0, 59) pads to 150059.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0135 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(15, 0, 59)).assertEqual('150059');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0135 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP4_13600
     * @tc.name      testTimeCube0136
     * @tc.desc      Verify concatTime(15, 30, 0) pads to 153000.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0136 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(15, 30, 0)).assertEqual('153000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0136 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP4_13700
     * @tc.name      testTimeCube0137
     * @tc.desc      Verify concatTime(15, 30, 30) pads to 153030.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0137 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(15, 30, 30)).assertEqual('153030');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0137 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP4_13800
     * @tc.name      testTimeCube0138
     * @tc.desc      Verify concatTime(15, 30, 59) pads to 153059.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0138 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(15, 30, 59)).assertEqual('153059');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0138 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP4_13900
     * @tc.name      testTimeCube0139
     * @tc.desc      Verify concatTime(15, 59, 0) pads to 155900.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0139 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(15, 59, 0)).assertEqual('155900');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0139 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP4_14000
     * @tc.name      testTimeCube0140
     * @tc.desc      Verify concatTime(15, 59, 30) pads to 155930.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0140 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(15, 59, 30)).assertEqual('155930');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0140 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP4_14100
     * @tc.name      testTimeCube0141
     * @tc.desc      Verify concatTime(15, 59, 59) pads to 155959.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0141 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(15, 59, 59)).assertEqual('155959');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0141 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP4_14200
     * @tc.name      testTimeCube0142
     * @tc.desc      Verify concatTime(16, 0, 0) pads to 160000.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0142 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(16, 0, 0)).assertEqual('160000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0142 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP4_14300
     * @tc.name      testTimeCube0143
     * @tc.desc      Verify concatTime(16, 0, 30) pads to 160030.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0143 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(16, 0, 30)).assertEqual('160030');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0143 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP4_14400
     * @tc.name      testTimeCube0144
     * @tc.desc      Verify concatTime(16, 0, 59) pads to 160059.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0144 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(16, 0, 59)).assertEqual('160059');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0144 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP4_14500
     * @tc.name      testTimeCube0145
     * @tc.desc      Verify concatTime(16, 30, 0) pads to 163000.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0145 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(16, 30, 0)).assertEqual('163000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0145 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP4_14600
     * @tc.name      testTimeCube0146
     * @tc.desc      Verify concatTime(16, 30, 30) pads to 163030.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0146 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(16, 30, 30)).assertEqual('163030');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0146 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP4_14700
     * @tc.name      testTimeCube0147
     * @tc.desc      Verify concatTime(16, 30, 59) pads to 163059.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0147 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(16, 30, 59)).assertEqual('163059');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0147 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP4_14800
     * @tc.name      testTimeCube0148
     * @tc.desc      Verify concatTime(16, 59, 0) pads to 165900.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0148 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(16, 59, 0)).assertEqual('165900');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0148 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP4_14900
     * @tc.name      testTimeCube0149
     * @tc.desc      Verify concatTime(16, 59, 30) pads to 165930.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0149 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(16, 59, 30)).assertEqual('165930');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0149 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP4_15000
     * @tc.name      testTimeCube0150
     * @tc.desc      Verify concatTime(16, 59, 59) pads to 165959.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0150 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(16, 59, 59)).assertEqual('165959');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0150 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP4_15100
     * @tc.name      testTimeCube0151
     * @tc.desc      Verify concatTime(17, 0, 0) pads to 170000.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0151 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(17, 0, 0)).assertEqual('170000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0151 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP4_15200
     * @tc.name      testTimeCube0152
     * @tc.desc      Verify concatTime(17, 0, 30) pads to 170030.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0152 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(17, 0, 30)).assertEqual('170030');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0152 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP4_15300
     * @tc.name      testTimeCube0153
     * @tc.desc      Verify concatTime(17, 0, 59) pads to 170059.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0153 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(17, 0, 59)).assertEqual('170059');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0153 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP4_15400
     * @tc.name      testTimeCube0154
     * @tc.desc      Verify concatTime(17, 30, 0) pads to 173000.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0154 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(17, 30, 0)).assertEqual('173000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0154 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP4_15500
     * @tc.name      testTimeCube0155
     * @tc.desc      Verify concatTime(17, 30, 30) pads to 173030.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0155 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(17, 30, 30)).assertEqual('173030');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0155 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP4_15600
     * @tc.name      testTimeCube0156
     * @tc.desc      Verify concatTime(17, 30, 59) pads to 173059.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0156 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(17, 30, 59)).assertEqual('173059');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0156 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP4_15700
     * @tc.name      testTimeCube0157
     * @tc.desc      Verify concatTime(17, 59, 0) pads to 175900.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0157 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(17, 59, 0)).assertEqual('175900');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0157 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP4_15800
     * @tc.name      testTimeCube0158
     * @tc.desc      Verify concatTime(17, 59, 30) pads to 175930.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0158 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(17, 59, 30)).assertEqual('175930');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0158 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP4_15900
     * @tc.name      testTimeCube0159
     * @tc.desc      Verify concatTime(17, 59, 59) pads to 175959.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0159 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(17, 59, 59)).assertEqual('175959');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0159 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP4_16000
     * @tc.name      testTimeCube0160
     * @tc.desc      Verify concatTime(18, 0, 0) pads to 180000.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0160 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(18, 0, 0)).assertEqual('180000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0160 end');
    })

  })
}
