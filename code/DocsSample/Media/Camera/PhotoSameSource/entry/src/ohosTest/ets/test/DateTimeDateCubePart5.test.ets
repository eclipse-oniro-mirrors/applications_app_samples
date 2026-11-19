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

export default function DateTimeDateCubePart5Test(): void {
  describe('DateTimeDateCubePart5', () => {

    /**
     * @tc.number    SUB_PHOTO_DCUBP5_16100
     * @tc.name      testDateCube0161
     * @tc.desc      Verify concatDate(2100, 7, 1) pads to 21000701.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0161 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2100, 7, 1)).assertEqual('21000701');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0161 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP5_16200
     * @tc.name      testDateCube0162
     * @tc.desc      Verify concatDate(2100, 7, 15) pads to 21000715.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0162 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2100, 7, 15)).assertEqual('21000715');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0162 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP5_16300
     * @tc.name      testDateCube0163
     * @tc.desc      Verify concatDate(2100, 7, 31) pads to 21000731.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0163 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2100, 7, 31)).assertEqual('21000731');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0163 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP5_16400
     * @tc.name      testDateCube0164
     * @tc.desc      Verify concatDate(2100, 7, 32) pads to 21000732.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0164 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2100, 7, 32)).assertEqual('21000732');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0164 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP5_16500
     * @tc.name      testDateCube0165
     * @tc.desc      Verify concatDate(2100, 8, 0) pads to 21000800.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0165 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2100, 8, 0)).assertEqual('21000800');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0165 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP5_16600
     * @tc.name      testDateCube0166
     * @tc.desc      Verify concatDate(2100, 8, 1) pads to 21000801.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0166 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2100, 8, 1)).assertEqual('21000801');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0166 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP5_16700
     * @tc.name      testDateCube0167
     * @tc.desc      Verify concatDate(2100, 8, 15) pads to 21000815.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0167 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2100, 8, 15)).assertEqual('21000815');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0167 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP5_16800
     * @tc.name      testDateCube0168
     * @tc.desc      Verify concatDate(2100, 8, 31) pads to 21000831.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0168 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2100, 8, 31)).assertEqual('21000831');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0168 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP5_16900
     * @tc.name      testDateCube0169
     * @tc.desc      Verify concatDate(2100, 8, 32) pads to 21000832.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0169 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2100, 8, 32)).assertEqual('21000832');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0169 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP5_17000
     * @tc.name      testDateCube0170
     * @tc.desc      Verify concatDate(2100, 9, 0) pads to 21000900.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0170 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2100, 9, 0)).assertEqual('21000900');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0170 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP5_17100
     * @tc.name      testDateCube0171
     * @tc.desc      Verify concatDate(2100, 9, 1) pads to 21000901.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0171 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2100, 9, 1)).assertEqual('21000901');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0171 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP5_17200
     * @tc.name      testDateCube0172
     * @tc.desc      Verify concatDate(2100, 9, 15) pads to 21000915.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0172 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2100, 9, 15)).assertEqual('21000915');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0172 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP5_17300
     * @tc.name      testDateCube0173
     * @tc.desc      Verify concatDate(2100, 9, 31) pads to 21000931.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0173 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2100, 9, 31)).assertEqual('21000931');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0173 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP5_17400
     * @tc.name      testDateCube0174
     * @tc.desc      Verify concatDate(2100, 9, 32) pads to 21000932.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0174 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2100, 9, 32)).assertEqual('21000932');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0174 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP5_17500
     * @tc.name      testDateCube0175
     * @tc.desc      Verify concatDate(2100, 10, 0) pads to 21001000.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0175 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2100, 10, 0)).assertEqual('21001000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0175 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP5_17600
     * @tc.name      testDateCube0176
     * @tc.desc      Verify concatDate(2100, 10, 1) pads to 21001001.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0176 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2100, 10, 1)).assertEqual('21001001');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0176 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP5_17700
     * @tc.name      testDateCube0177
     * @tc.desc      Verify concatDate(2100, 10, 15) pads to 21001015.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0177 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2100, 10, 15)).assertEqual('21001015');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0177 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP5_17800
     * @tc.name      testDateCube0178
     * @tc.desc      Verify concatDate(2100, 10, 31) pads to 21001031.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0178 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2100, 10, 31)).assertEqual('21001031');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0178 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP5_17900
     * @tc.name      testDateCube0179
     * @tc.desc      Verify concatDate(2100, 10, 32) pads to 21001032.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0179 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2100, 10, 32)).assertEqual('21001032');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0179 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP5_18000
     * @tc.name      testDateCube0180
     * @tc.desc      Verify concatDate(2100, 11, 0) pads to 21001100.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0180 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2100, 11, 0)).assertEqual('21001100');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0180 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP5_18100
     * @tc.name      testDateCube0181
     * @tc.desc      Verify concatDate(2100, 11, 1) pads to 21001101.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0181 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2100, 11, 1)).assertEqual('21001101');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0181 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP5_18200
     * @tc.name      testDateCube0182
     * @tc.desc      Verify concatDate(2100, 11, 15) pads to 21001115.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0182 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2100, 11, 15)).assertEqual('21001115');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0182 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP5_18300
     * @tc.name      testDateCube0183
     * @tc.desc      Verify concatDate(2100, 11, 31) pads to 21001131.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0183 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2100, 11, 31)).assertEqual('21001131');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0183 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP5_18400
     * @tc.name      testDateCube0184
     * @tc.desc      Verify concatDate(2100, 11, 32) pads to 21001132.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0184 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2100, 11, 32)).assertEqual('21001132');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0184 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP5_18500
     * @tc.name      testDateCube0185
     * @tc.desc      Verify concatDate(2100, 12, 0) pads to 21001200.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0185 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2100, 12, 0)).assertEqual('21001200');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0185 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP5_18600
     * @tc.name      testDateCube0186
     * @tc.desc      Verify concatDate(2100, 12, 1) pads to 21001201.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0186 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2100, 12, 1)).assertEqual('21001201');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0186 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP5_18700
     * @tc.name      testDateCube0187
     * @tc.desc      Verify concatDate(2100, 12, 15) pads to 21001215.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0187 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2100, 12, 15)).assertEqual('21001215');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0187 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP5_18800
     * @tc.name      testDateCube0188
     * @tc.desc      Verify concatDate(2100, 12, 31) pads to 21001231.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0188 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2100, 12, 31)).assertEqual('21001231');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0188 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP5_18900
     * @tc.name      testDateCube0189
     * @tc.desc      Verify concatDate(2100, 12, 32) pads to 21001232.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0189 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2100, 12, 32)).assertEqual('21001232');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0189 end');
    })

  })
}
