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

export default function DateTimeDateCubePart4Test(): void {
  describe('DateTimeDateCubePart4', () => {

    /**
     * @tc.number    SUB_PHOTO_DCUBP4_12100
     * @tc.name      testDateCube0121
     * @tc.desc      Verify concatDate(2026, 12, 0) pads to 20261200.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0121 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2026, 12, 0)).assertEqual('20261200');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0121 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP4_12200
     * @tc.name      testDateCube0122
     * @tc.desc      Verify concatDate(2026, 12, 1) pads to 20261201.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0122 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2026, 12, 1)).assertEqual('20261201');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0122 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP4_12300
     * @tc.name      testDateCube0123
     * @tc.desc      Verify concatDate(2026, 12, 15) pads to 20261215.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0123 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2026, 12, 15)).assertEqual('20261215');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0123 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP4_12400
     * @tc.name      testDateCube0124
     * @tc.desc      Verify concatDate(2026, 12, 32) pads to 20261232.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0124 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2026, 12, 32)).assertEqual('20261232');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0124 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP4_12500
     * @tc.name      testDateCube0125
     * @tc.desc      Verify concatDate(2100, 0, 0) pads to 21000000.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0125 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2100, 0, 0)).assertEqual('21000000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0125 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP4_12600
     * @tc.name      testDateCube0126
     * @tc.desc      Verify concatDate(2100, 0, 1) pads to 21000001.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0126 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2100, 0, 1)).assertEqual('21000001');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0126 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP4_12700
     * @tc.name      testDateCube0127
     * @tc.desc      Verify concatDate(2100, 0, 15) pads to 21000015.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0127 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2100, 0, 15)).assertEqual('21000015');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0127 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP4_12800
     * @tc.name      testDateCube0128
     * @tc.desc      Verify concatDate(2100, 0, 31) pads to 21000031.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0128 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2100, 0, 31)).assertEqual('21000031');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0128 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP4_12900
     * @tc.name      testDateCube0129
     * @tc.desc      Verify concatDate(2100, 0, 32) pads to 21000032.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0129 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2100, 0, 32)).assertEqual('21000032');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0129 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP4_13000
     * @tc.name      testDateCube0130
     * @tc.desc      Verify concatDate(2100, 1, 0) pads to 21000100.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0130 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2100, 1, 0)).assertEqual('21000100');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0130 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP4_13100
     * @tc.name      testDateCube0131
     * @tc.desc      Verify concatDate(2100, 1, 1) pads to 21000101.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0131 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2100, 1, 1)).assertEqual('21000101');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0131 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP4_13200
     * @tc.name      testDateCube0132
     * @tc.desc      Verify concatDate(2100, 1, 15) pads to 21000115.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0132 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2100, 1, 15)).assertEqual('21000115');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0132 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP4_13300
     * @tc.name      testDateCube0133
     * @tc.desc      Verify concatDate(2100, 1, 31) pads to 21000131.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0133 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2100, 1, 31)).assertEqual('21000131');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0133 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP4_13400
     * @tc.name      testDateCube0134
     * @tc.desc      Verify concatDate(2100, 1, 32) pads to 21000132.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0134 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2100, 1, 32)).assertEqual('21000132');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0134 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP4_13500
     * @tc.name      testDateCube0135
     * @tc.desc      Verify concatDate(2100, 2, 0) pads to 21000200.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0135 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2100, 2, 0)).assertEqual('21000200');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0135 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP4_13600
     * @tc.name      testDateCube0136
     * @tc.desc      Verify concatDate(2100, 2, 1) pads to 21000201.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0136 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2100, 2, 1)).assertEqual('21000201');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0136 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP4_13700
     * @tc.name      testDateCube0137
     * @tc.desc      Verify concatDate(2100, 2, 15) pads to 21000215.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0137 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2100, 2, 15)).assertEqual('21000215');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0137 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP4_13800
     * @tc.name      testDateCube0138
     * @tc.desc      Verify concatDate(2100, 2, 31) pads to 21000231.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0138 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2100, 2, 31)).assertEqual('21000231');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0138 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP4_13900
     * @tc.name      testDateCube0139
     * @tc.desc      Verify concatDate(2100, 2, 32) pads to 21000232.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0139 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2100, 2, 32)).assertEqual('21000232');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0139 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP4_14000
     * @tc.name      testDateCube0140
     * @tc.desc      Verify concatDate(2100, 3, 0) pads to 21000300.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0140 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2100, 3, 0)).assertEqual('21000300');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0140 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP4_14100
     * @tc.name      testDateCube0141
     * @tc.desc      Verify concatDate(2100, 3, 1) pads to 21000301.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0141 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2100, 3, 1)).assertEqual('21000301');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0141 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP4_14200
     * @tc.name      testDateCube0142
     * @tc.desc      Verify concatDate(2100, 3, 15) pads to 21000315.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0142 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2100, 3, 15)).assertEqual('21000315');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0142 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP4_14300
     * @tc.name      testDateCube0143
     * @tc.desc      Verify concatDate(2100, 3, 31) pads to 21000331.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0143 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2100, 3, 31)).assertEqual('21000331');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0143 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP4_14400
     * @tc.name      testDateCube0144
     * @tc.desc      Verify concatDate(2100, 3, 32) pads to 21000332.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0144 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2100, 3, 32)).assertEqual('21000332');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0144 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP4_14500
     * @tc.name      testDateCube0145
     * @tc.desc      Verify concatDate(2100, 4, 0) pads to 21000400.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0145 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2100, 4, 0)).assertEqual('21000400');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0145 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP4_14600
     * @tc.name      testDateCube0146
     * @tc.desc      Verify concatDate(2100, 4, 1) pads to 21000401.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0146 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2100, 4, 1)).assertEqual('21000401');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0146 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP4_14700
     * @tc.name      testDateCube0147
     * @tc.desc      Verify concatDate(2100, 4, 15) pads to 21000415.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0147 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2100, 4, 15)).assertEqual('21000415');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0147 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP4_14800
     * @tc.name      testDateCube0148
     * @tc.desc      Verify concatDate(2100, 4, 31) pads to 21000431.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0148 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2100, 4, 31)).assertEqual('21000431');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0148 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP4_14900
     * @tc.name      testDateCube0149
     * @tc.desc      Verify concatDate(2100, 4, 32) pads to 21000432.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0149 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2100, 4, 32)).assertEqual('21000432');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0149 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP4_15000
     * @tc.name      testDateCube0150
     * @tc.desc      Verify concatDate(2100, 5, 0) pads to 21000500.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0150 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2100, 5, 0)).assertEqual('21000500');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0150 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP4_15100
     * @tc.name      testDateCube0151
     * @tc.desc      Verify concatDate(2100, 5, 1) pads to 21000501.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0151 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2100, 5, 1)).assertEqual('21000501');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0151 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP4_15200
     * @tc.name      testDateCube0152
     * @tc.desc      Verify concatDate(2100, 5, 15) pads to 21000515.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0152 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2100, 5, 15)).assertEqual('21000515');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0152 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP4_15300
     * @tc.name      testDateCube0153
     * @tc.desc      Verify concatDate(2100, 5, 31) pads to 21000531.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0153 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2100, 5, 31)).assertEqual('21000531');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0153 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP4_15400
     * @tc.name      testDateCube0154
     * @tc.desc      Verify concatDate(2100, 5, 32) pads to 21000532.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0154 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2100, 5, 32)).assertEqual('21000532');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0154 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP4_15500
     * @tc.name      testDateCube0155
     * @tc.desc      Verify concatDate(2100, 6, 0) pads to 21000600.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0155 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2100, 6, 0)).assertEqual('21000600');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0155 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP4_15600
     * @tc.name      testDateCube0156
     * @tc.desc      Verify concatDate(2100, 6, 1) pads to 21000601.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0156 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2100, 6, 1)).assertEqual('21000601');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0156 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP4_15700
     * @tc.name      testDateCube0157
     * @tc.desc      Verify concatDate(2100, 6, 15) pads to 21000615.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0157 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2100, 6, 15)).assertEqual('21000615');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0157 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP4_15800
     * @tc.name      testDateCube0158
     * @tc.desc      Verify concatDate(2100, 6, 31) pads to 21000631.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0158 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2100, 6, 31)).assertEqual('21000631');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0158 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP4_15900
     * @tc.name      testDateCube0159
     * @tc.desc      Verify concatDate(2100, 6, 32) pads to 21000632.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0159 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2100, 6, 32)).assertEqual('21000632');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0159 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP4_16000
     * @tc.name      testDateCube0160
     * @tc.desc      Verify concatDate(2100, 7, 0) pads to 21000700.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0160 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2100, 7, 0)).assertEqual('21000700');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0160 end');
    })

  })
}
